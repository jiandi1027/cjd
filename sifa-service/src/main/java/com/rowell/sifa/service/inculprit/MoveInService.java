  
    /**    
    * @Title: MoveInService.java  
    * @Package com.rowell.sifa.service.inculprit  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.inculprit;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.mapper.inculprit.MoveInMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.inculprit.ExitEntryReport;
import com.rowell.sifa.pojo.inculprit.MoveIn;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritJudgmentService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;
import com.rowell.sifa.service.sys.AreaService;
import com.rowell.sifa.service.sys.SysFileService;

/**  
    * @ClassName: MoveInService  
    * @Description: 迁入service 
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = false)
public class MoveInService extends CrudService<MoveInMapper, MoveIn> {
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;

	@Autowired
	private ProcessDetailMapper processDetailMapper;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private ExitEntryReportService exitEntryReportService;
	@Autowired
	private CulpritJudgmentService culpritJudgmentService;
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;// 待审批事项
	@Autowired
	private SysFileService sysFileService;
	private static String PROCESS_DEFINITION_KEY = "moveIn";
	@Transactional(readOnly = false)
	public CommonJsonResult saveMoveIn(MoveIn moveIn,List<SysFile> fileList){
		CommonJsonResult commonJsonResult = null;
		String regResidenceStreet=moveIn.getRegResidenceStreet();
		String regResidenceDetail=moveIn.getRegResidenceDetail();
		String regResidenceStreet1=moveIn.getRegResidenceStreet1();
		String regResidenceDetail1=moveIn.getRegResidenceDetail1();
		String addressStreet=moveIn.getAddressStreet();
		String addressDetaill=moveIn.getAddressDetaill();
		if(regResidenceStreet==null){
			regResidenceStreet="";
		}
		if(regResidenceDetail==null){
			regResidenceDetail="";
		}
		if(regResidenceStreet1==null){
			regResidenceStreet1="";
		}
		if(regResidenceDetail1==null){
			regResidenceDetail1="";
		}
		if(addressStreet==null){
			addressStreet="";
		}
		if(addressDetaill==null){
			addressDetaill="";
		}
		String newPlace=areaService.findById(moveIn.getRegResidenceProId()).getAreaName()
				+areaService.findById(moveIn.getRegResidenceCityId()).getAreaName()
				+areaService.findById(moveIn.getRegResidenceCountryId()).getAreaName()
				+regResidenceStreet+regResidenceDetail;
		String regResidence=areaService.findById(moveIn.getRegResidenceProId1()).getAreaName()
				+areaService.findById(moveIn.getRegResidenceCityId1()).getAreaName()
				+areaService.findById(moveIn.getRegResidenceCountryId1()).getAreaName()
				+regResidenceStreet1+regResidenceDetail1;
		String oldPlace=areaService.findById(moveIn.getAddressProId()).getAreaName()
				+areaService.findById(moveIn.getAddressCityId()).getAreaName()
				+areaService.findById(moveIn.getAddressCountryId()).getAreaName()
				+addressStreet+addressDetaill;
		String origin=areaService.findById(moveIn.getOriginProId()).getAreaName()
				+areaService.findById(moveIn.getOriginCityId()).getAreaName()
				+areaService.findById(moveIn.getOriginCountryId()).getAreaName();
		moveIn.setNewPlace(newPlace);
		moveIn.setOldPlace(oldPlace);
		moveIn.setRegResidence(regResidence);
		moveIn.setOrigin(origin);
		if (StringUtils.isBlank(moveIn.getId())) {
			this.saveOrUpdate(moveIn);
			//保存之后直接启动流程
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			Map<String, Object> variables = new HashMap<String, Object>();
			variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR ));
			ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, moveIn.getId(),variables);
			moveIn.setProcessInstanceId(processInstance.getProcessInstanceId());
			this.updateById(moveIn);
			examinationAndApprovalService.insertProcess(moveIn.getId(), moveIn.getId(),
					moveIn.getProcessInstanceId(), Constants.PROCESS_TYPE_QRGL);
			commonJsonResult = CommonJsonResult.build(200, "保存成功");
		} else {
			this.saveOrUpdate(moveIn);
			commonJsonResult = CommonJsonResult.build(200, "修改成功");
		}
		sysFileService.saveFiles(fileList, Constants.FILE_TABLE_MOVEIN, moveIn.getId(), Constants.FILE_WARNING_QRGL_PATH);
		
		
		return 	commonJsonResult;
	}
	
	/**
	 * 指派
	 */
	@Transactional(readOnly = false)
	public void submitMoveIn(String userId, MoveIn moveIn) {
		
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR ));//确定下一个角色执行任务 司法所负责人
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, moveIn.getId(),
				variables);
		moveIn.setProcessInstanceId(processInstance.getProcessInstanceId());
		int result = updateById(moveIn);

	}

	@Transactional(readOnly = false)
	public void saveMoveInAuditStatus(String roleId, MoveIn moveIn,ProcessDetail processDetail,List<SysFile> fileList) {
		Task task = taskService.createTaskQuery().taskId(moveIn.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();
		
		
		
		if (task != null) {
			processDetail.setProcessDefKey(PROCESS_DEFINITION_KEY);
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(moveIn.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			
			// 说明assignee是该任务的办理人，有权限完成3002
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核workerReport
			
			if(moveIn.getAuditType().equals("sfsAccept")){
				//司法所受理
				if("2".equals(processDetail.getDicDecideType())){
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));//县负责人
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));//司法所工作人员
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				this.saveOrUpdate(moveIn);
			}else if (moveIn.getAuditType().equals("sfsReport")) {
				//调查附件
				sysFileService.saveFiles(fileList, Constants.FILE_TABLE_MOVEIN, moveIn.getId(), Constants.FILE_MOVEIN_DC_PATH);
				//司法所负责人
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				processDetail.setDicDecideType("1");
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				
			}else if(moveIn.getAuditType().equals("jzkZp")){
				//县矫正科指派
				String newPlace=areaService.findById(moveIn.getRegResidenceProId()).getAreaName()
						+areaService.findById(moveIn.getRegResidenceCityId()).getAreaName()
						+areaService.findById(moveIn.getRegResidenceCountryId()).getAreaName()
						+moveIn.getRegResidenceStreet()+moveIn.getRegResidenceDetail();
				String oldPlace=areaService.findById(moveIn.getAddressProId()).getAreaName()
						+areaService.findById(moveIn.getAddressCityId()).getAreaName()
						+areaService.findById(moveIn.getAddressCountryId()).getAreaName()
						+moveIn.getAddressStreet()+moveIn.getAddressDetaill();
				moveIn.setNewPlace(newPlace);
				moveIn.setOldPlace(oldPlace);
				super.saveOrUpdate(moveIn);
				variables.put("role_id", Constants.ROLE_SFSFZR+"_"+moveIn.getGroupId());
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				
			}else if (moveIn.getAuditType().equals("sfsCheck")) {
				// 司法所所在审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));//退回到司法所工作人员
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));//下个县矫正科负责人
				}
				
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (moveIn.getAuditType().equals("jzkCheck")) {
				// 县分管领导 审核
				
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));//退回到司法所负责人
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));//下个县分管
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (moveIn.getAuditType().equals("xfgCheck")) {
				// 县分管领导 审核
				
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));//退回县矫正科负责人
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));//下个县矫正科工作人员
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if(moveIn.getAuditType().equals("jzkReport")){
				Culprit culprit = new Culprit();
				culprit.setFinshInfo(0);
				String newPlace=areaService.findById(moveIn.getRegResidenceProId()).getAreaName()
						+areaService.findById(moveIn.getRegResidenceCityId()).getAreaName()
						+areaService.findById(moveIn.getRegResidenceCountryId()).getAreaName()
						+moveIn.getRegResidenceStreet()+moveIn.getRegResidenceDetail();
				String oldPlace=areaService.findById(moveIn.getAddressProId()).getAreaName()
						+areaService.findById(moveIn.getAddressCityId()).getAreaName()
						+areaService.findById(moveIn.getAddressCountryId()).getAreaName()
						+moveIn.getAddressStreet()+moveIn.getAddressDetaill();
				culprit.setAddress(newPlace);
				culprit.setAddressProId(moveIn.getAddressProId());
				culprit.setAddressCityId(moveIn.getAddressCityId());
				culprit.setAddressCountryId(moveIn.getAddressCountryId());
				culprit.setAddressStreet(moveIn.getAddressStreet());
				culprit.setAddressDetail(moveIn.getAddressDetaill());
				culprit.setRegResidence(oldPlace);
				culprit.setRegResidenceProId(moveIn.getRegResidenceProId());
				culprit.setRegResidenceCityId(moveIn.getRegResidenceCityId());
				culprit.setRegResidenceCountryId(moveIn.getRegResidenceCountryId());
				culprit.setRegResidenceStreet(moveIn.getRegResidenceStreet());
				culprit.setRegResidenceDetail(moveIn.getRegResidenceDetail());
				//名字
				culprit.setName(moveIn.getName());
				//性别
				culprit.setDicSexKey(moveIn.getDicSexKey());
				//民族
				culprit.setNation(moveIn.getNation());
				//身份证
				culprit.setIdentification(moveIn.getCedentialsNumber());
				//文化程度
				culprit.setDicWhcdKey(moveIn.getDicWhcdKey());
				//婚姻状况
				culprit.setDicHyzkKey(moveIn.getDicHyzkKey());
				//职业
				culprit.setJob(moveIn.getJob());
				//政治面貌
				culprit.setDicXzzmmKey(moveIn.getOldPoliticStatusId());
				//籍贯
				culprit.setOrigin(moveIn.getOrigin());
				//记录更新时间 
				culprit.setModifiedTime(new Date());
				//证件类型
				culprit.setDicZjlxKey("86001");
				//司法所
				culprit.setGroupId(moveIn.getGroupId());
				//矫正开始时间
				culprit.setRedressStartDate(moveIn.getRedressStartDate());
				//矫正结束时间
				culprit.setRedressEndDate(moveIn.getRedressEndDate());
				//手机号
				culprit.setContactPhone(moveIn.getContactPhone());
				//报到类型
				culprit.setDicFirstReportGetKey(Constants.FIRST_REPORT_KEY_MOVEIN);
				//报到状态
				culprit.setDicFirstReportTypeKey(Constants.FIRST_REPORT_TYPE_DCL);
				culpritService.insert(culprit);
				//出入境报备
				ExitEntryReport exitEntryReport=new ExitEntryReport();
				exitEntryReport.setCulpritId(culprit.getId());
				exitEntryReport.setGroupId(culprit.getGroupId());
				exitEntryReport.setDicBbztKey("61001");//报备中
				exitEntryReport.setDicIsCollectKey("0");//未收缴
				exitEntryReport.setFillStartDate(culprit.getCreated());//报备开始时间
				exitEntryReportService.saveOrUpdate(exitEntryReport);
				//刑法
				CulpritJudgment culpritJudgment = new CulpritJudgment();
				culpritJudgment.setCulpritId(culprit.getId());
				culpritJudgment.setId(null);
				culpritJudgment.setDicAdjudgeRedressOrgKey("85004");
				//罪名
				culpritJudgment.setCrimeInfo(moveIn.getCrimeInfo());
				//矫正期限
				culpritJudgment.setRedressPeriod(moveIn.getRedressPeriod());
				//矫正开始时间
				culpritJudgment.setRedressStartDate(moveIn.getRedressStartDate());
				//矫正结束时间
				culpritJudgment.setRedressEndDate(moveIn.getRedressEndDate());
				//刑期
				culpritJudgment.setAdjudgePeriod(moveIn.getAdjudgePeriod());
				//刑期变动
				culpritJudgment.setAdjudgeChange(moveIn.getAdjudgeChange());
				//刑期开始日期
				culpritJudgment.setAdjudgeStartTime(moveIn.getAdjudgeStartTime());
				//刑期结束日期
				culpritJudgment.setAdjudgeEndTime(moveIn.getAdjudgeEndTime());
				//移交日期
				culpritJudgment.setTransferDate(new Date());
				culpritJudgmentService.saveOrUpdate(culpritJudgment);
				
				
			}
			// 提交审核时，设置流程变量，变量值就是审核 信息
			taskService.complete(moveIn.getTaskId(), variables);
			

	}
	
}
}