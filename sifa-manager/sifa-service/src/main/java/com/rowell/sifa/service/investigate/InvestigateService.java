  
    /**    
    * @Title: InvestigateService.java  
    * @Package com.rowell.sifa.service.investigate  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.investigate;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.utils.DateUtils;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.mapper.investigate.InvestigateMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.inculprit.ExitEntryReport;
import com.rowell.sifa.pojo.investigate.Investigate;
import com.rowell.sifa.pojo.sys.MxCheck;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritJudgmentService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;
import com.rowell.sifa.service.inculprit.ExitEntryReportService;
import com.rowell.sifa.service.sys.AreaService;
import com.rowell.sifa.service.sys.MxCheckService;

/**  
    * @ClassName: InvestigateService  
    * @Description:  调查评估service  
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = false)
public class InvestigateService extends CrudService<InvestigateMapper, Investigate> {
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private MxCheckService mxCheckService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private CulpritJudgmentService culpritJudgmentService;
	@Autowired
	private ExitEntryReportService exitEntryReportService;
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;
	
	
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	private static String PROCESS_DEFINITION_KEY = "investigate";
	
	@Override
	@Transactional(readOnly = false)
	public int insert(Investigate record) {
		record.setCurrentSysUser(SysAccountUtils.getSysAccount());
		record.preInsert();
		/***
		 * 启动流程实例，指定下一步工作流
		 */

		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
		//variables.put("groupId", SysAccountUtils.getSysAccount().getGroupId());
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, record.getId(),
				variables);
		record.setProcessInstanceId(processInstance.getProcessInstanceId());

		examinationAndApprovalService.insertProcess(record.getId(), null, record.getProcessInstanceId(), Constants.PROCESS_TYPE_SQDC);
		return dao.insert(record);
	}
	
	@Transactional(readOnly = false)
	public void saveInvestigateAuditStatus(String roleId, Investigate investigate,ProcessDetail processDetail) {
		Task task = taskService.createTaskQuery().taskId(investigate.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();
		
		if (task != null) {
			processDetail.setProcessDefKey(PROCESS_DEFINITION_KEY);
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(investigate.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			
			// 说明assignee是该任务的办理人，有权限完成3002
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核workerReport
			if (investigate.getAuditType().equals("jzkAssign")) {
				
				variables.put("role_id", Constants.ROLE_SFSFZR+"_"+investigate.getSfsGroupId());
				variables.put("countyId", SysAccountUtils.getSysAccount().getGroupId());

				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (investigate.getAuditType().equals("sfsCheck")) {
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_XJZKFZR, task.getId()));
				} else if("9".equals(processDetail.getDicDecideType())){//终止操作
					//variables.put("role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_XJZKFZR, task.getId()));
					investigate.setEndTime(new Date());
					investigate.setFlag(1);
					super.updateByIdSelective(investigate);
				} else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
					variables.put("groupId", SysAccountUtils.getSysAccount().getGroupId());
				}
				
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if(investigate.getAuditType().equals("workerReport")){
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				
				investigate.setLockTime(new Date());
				super.updateByIdSelective(investigate);
				
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if(investigate.getAuditType().equals("szCheck")){
				int timeout = DateUtils.getDistanceOfDayTwoDate(investigate.getLockTime(), new Date());
				variables.put("timeout", timeout);
				
				//所长审核
				if (timeout >= Constants.INVESTIGATE_TIMEOUT) {	//上报已超时,申请解锁
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));//县局多个角色，先测试用xjzkfzr
//					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR + "," + ProcessUtils.getRoleIdWithGroupId(
//					Constants.ROLE_XFZKFZR + "," + ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD);
					investigate.setApplyUnLock(1);
					super.updateByIdSelective(investigate);
				}
				else {
					if("2".equals(processDetail.getDicDecideType())){//退回操作
						variables.put("role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_SFSGZRY, task.getId()));
					} else{
						variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
					}
				}
				
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if(investigate.getAuditType().equals("reportUnlocked")){
				//县解锁审核
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_SFSFZR, task.getId()));
				
				investigate.setApplyUnLock(0);	//设置上报解锁状态为无须申请上报解锁
				investigate.setLockTime(new Date());	//设置锁定时间
				if (StringUtils.isBlank(investigate.getCount())) {	//设置解锁次数
					investigate.setCount("1");
				}
				else investigate.setCount((Integer.valueOf(investigate.getCount()).intValue() + 1) + "");
				
				super.updateByIdSelective(investigate);
				
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (investigate.getAuditType().equals("jzkCheck")) {
				// 县矫正负责人审核
				if (!StringUtils.isBlank(processDetail.getOptScore())) {
					MxCheck mxCheck = new MxCheck();
					mxCheck.setProcessInstanceId(investigate.getProcessInstanceId());
					mxCheck.setIsUse(1);
					mxCheck.setInfoType(Constants.ASSESS_MX_JZK_SRZL);
					mxCheckService.deleteFlagMore(mxCheck);
					mxCheckService.updateIsUse(mxCheck);
					mxCheck.setInfoType(Constants.ASSESS_MX_JZK_ZFZL);
					mxCheckService.deleteFlagMore(mxCheck);
					mxCheckService.updateIsUse(mxCheck);
				}
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_SFSFZR, task.getId()));
				} else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFZKFZR));
				}
				
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (investigate.getAuditType().equals("fzkCheck")) {
				// 县法制科审核
				if (!StringUtils.isBlank(processDetail.getZfScore())) {
					MxCheck mxCheck = new MxCheck();
					mxCheck.setProcessInstanceId(investigate.getProcessInstanceId());
					mxCheck.setInfoType(Constants.ASSESS_MX_FZK_ZFZL);
					mxCheck.setIsUse(1);
					mxCheckService.deleteFlagMore(mxCheck);
					mxCheckService.updateIsUse(mxCheck);
				}
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_XJZKFZR, task.getId()));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));
				}
				
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (investigate.getAuditType().equals("xfgCheck")) {
				// 县分管领导 审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_XFZKFZR, task.getId()));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));
					
					investigate.setEndTime(new Date());
					investigate.setFlag(2);
					super.updateByIdSelective(investigate);
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (investigate.getAuditType().equals("workerPrint")) {
				// 工作人员打印
				//新增对应矫正对象信息
				Culprit culprit = new Culprit();
				culprit.setName(investigate.getName());
				culprit.setGroupId(investigate.getSfsGroupId());
				culprit.setAlias(investigate.getAlias());
				culprit.setDicSexKey(investigate.getDicSexKey());
				if (investigate.getOriginProId() != null 
						&& investigate.getOriginCityId() != null 
						&& investigate.getOriginCountryId() != null) {
					culprit.setOrigin(areaService.findById(investigate.getOriginProId()).getAreaName() 
							+ areaService.findById(investigate.getOriginCityId()).getAreaName()
							+ areaService.findById(investigate.getOriginCountryId()).getAreaName());
				}
				culprit.setNation(investigate.getNation());
				culprit.setBirthday(investigate.getBornDate());
				culprit.setContactPhone(investigate.getContactPhone());
				culprit.setDicHklxKey(investigate.getDicResudenceKey());
				culprit.setRegResidenceProId(investigate.getRegResidenceProId());
				culprit.setRegResidenceCityId(investigate.getRegResidenceCityId());
				culprit.setRegResidenceCountryId(investigate.getRegResidenceCountryId());
				culprit.setRegResidenceStreet(investigate.getRegResidenceStreet());
				culprit.setRegResidenceDetail(investigate.getRegResidenceDetail());
				culprit.setAddressProId(investigate.getHabitualResidenceProId());
				culprit.setAddressCityId(investigate.getHabitualResidenceCityId());
				culprit.setAddressCountryId(investigate.getHabitualResidenceCountryId());
				culprit.setAddressStreet(investigate.getHabitualResidenceStreet());
				culprit.setAddressDetail(investigate.getHabitualResidenceDetail());
				culprit.setDicFirstReportGetKey(Constants.FIRST_REPORT_KEY_SQDC);
				culprit.setDicFirstReportTypeKey(Constants.FIRST_REPORT_TYPE_DCL);
				culprit.setFinshInfo(0);
				culprit.setDicZjlxKey("86001");
				culprit.setIdentification(investigate.getRelevantNumber());
				culpritService.insert(culprit);

				//新增矫正对象刑罚信息
				CulpritJudgment culpritJudgment = new CulpritJudgment();
				culpritJudgment.setDicAdjudgeRedressOrgKey(investigate.getDicEntrustUnitTypeKey());
				culpritJudgment.setAdjudgeRedressOrg(investigate.getEntrustUnit());
				culpritJudgment.setAdjudgeOrg(investigate.getEntrustUnit());
				culpritJudgment.setCulpritId(culprit.getId());
				culpritJudgment.setCrimeInfo(investigate.getCrimeReason());
				culpritJudgmentService.insert(culpritJudgment);

				//新增矫正对象出入境报备信息
				ExitEntryReport exitEntryReport = new ExitEntryReport();
				exitEntryReport.setCulpritId(culprit.getId());
				exitEntryReport.setGroupId(culprit.getGroupId());
				exitEntryReport.setDicBbztKey("61001");
				exitEntryReport.setDicIsCollectKey("0");
				exitEntryReport.setFillStartDate(culprit.getCreated());
				exitEntryReportService.insert(exitEntryReport);
				
			}
			// 提交审核时，设置流程变量，变量值就是审核 信息
			taskService.complete(investigate.getTaskId(), variables);
		}
	}
}
