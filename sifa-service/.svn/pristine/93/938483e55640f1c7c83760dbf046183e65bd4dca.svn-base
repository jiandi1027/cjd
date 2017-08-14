  
    /**    
    * @Title: ParoleService.java  
    * @Package com.rowell.sifa.service.rewardspunishment  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年3月30日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.rewardspunishment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.flowable.engine.HistoryService;
import org.flowable.engine.IdentityService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.mapper.rewardspunishment.ParoleMapper;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.Parole;
import com.rowell.sifa.pojo.sys.MxCheck;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;
import com.rowell.sifa.service.sys.MxCheckService;
import com.rowell.sifa.service.sys.SysFileService;

/**  
    * @ClassName: ParoleService  
    * @Description: 假释service  
    * @author xiaoguang  
    * @date 2017年3月30日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class ParoleService extends CrudService<ParoleMapper, Parole> {
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private HistoryService historyService;
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;
	@Autowired
	private IdentityService identityService;
	@Autowired
	private SysFileService sysFileService;
	@Autowired
	private MxCheckService mxCheckService;
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	private static String PROCESS_DEFINITION_KEY = "parole";
	//创建后直接上报
	@Transactional(readOnly = false)
	public void insert(Parole parole,HttpServletRequest request,ProcessDetail processDetail) {
		parole.setCurrentSysUser(SysAccountUtils.getSysAccount());
		parole.preInsert();
		/***
		 * 启动流程实例，指定下一步工作流
		 */
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("groupId",SysAccountUtils.getSysAccount().getGroupId());
		variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));//上报给司法所工作人员
		variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, parole.getId(),
				variables);
		
		parole.setProcessInstanceId(processInstance.getProcessInstanceId());
		
		parole.setProcessInstanceId(processInstance.getProcessInstanceId());
		super.insert(parole);
		examinationAndApprovalService.insertProcess(parole.getId(), parole.getCulpritId(),
				parole.getProcessInstanceId(), Constants.PROCESS_TYPE_JS);
	}
	//保存后提交
	@Transactional(readOnly = false)
	public void submitParole(String userId, Parole parole) {
		
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));//确定下一个角色执行任务 司法所工作人员
		variables.put("groupId",SysAccountUtils.getSysAccount().getGroupId());
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, parole.getId(),
				variables);
		parole.setProcessInstanceId(processInstance.getProcessInstanceId());
		int result = updateById(parole);

	}
	/***
	 * 工作流审核审批操作
	 */
	@Transactional(readOnly = false)
	public void saveParoleAuditStatus(String roleId, Parole parole,ProcessDetail processDetail,List<SysFile> fileList) {
		// TODO Auto-generated method stub
		// askLeaveCustom.setId(UUIDBuild.getUUID());
		// askLeaveCustom.setAuditType(auditType);
		// askLeaveCustom.setOrderId(orderId);
		// askLeaveCustom.setCreatetime(new Date());
		// purBusAskLeaveAuditMapper.insert(orderAuditCustom);
		
		
		Task task = taskService.createTaskQuery().taskId(parole.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();
		
		
		
		if (task != null) {
			processDetail.setProcessDefKey(PROCESS_DEFINITION_KEY);
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(parole.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			
			
			// 说明assignee是该任务的办理人，有权限完成3002
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核workerReport
			//司法上报
			if(parole.getAuditType().equals("sfsReport")){
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (parole.getAuditType().equals("sfsCheck")) {
				//variables.put("leaveDay", askLeave.getLeaveDays());
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (parole.getAuditType().equals("jzkCheck")) {
				// 县矫正负责人审核
				if (!StringUtils.isBlank(processDetail.getOptScore())) {//评分明细
					MxCheck mxCheck = new MxCheck();
					mxCheck.setProcessInstanceId(parole.getProcessInstanceId());
					mxCheck.setInfoType(Constants.ASSESS_MX_JZK_SRZL);
					mxCheck.setIsUse(1);
					mxCheckService.deleteFlagMore(mxCheck);
					mxCheckService.updateIsUse(mxCheck);
					mxCheck.setInfoType(Constants.ASSESS_MX_JZK_ZFZL);
					mxCheckService.deleteFlagMore(mxCheck);
					mxCheckService.updateIsUse(mxCheck);
				}
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_SFSFZR, parole.getTaskId()));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFZKFZR));//下是个任务县法制科
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (parole.getAuditType().equals("fzkCheck")) {
				// 县法制负责人审核
				if (!StringUtils.isBlank(processDetail.getZfScore())) {//评分明细
					MxCheck mxCheck = new MxCheck();
					mxCheck.setProcessInstanceId(parole.getProcessInstanceId());
					mxCheck.setInfoType(Constants.ASSESS_MX_FZK_ZFZL);
					mxCheck.setIsUse(1);
					mxCheckService.deleteFlagMore(mxCheck);
					mxCheckService.updateIsUse(mxCheck);
				}
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));//下是个任务县矫正科公示
				}
				
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (parole.getAuditType().equals("gs")) {
				// 县矫正负责人公示
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));//下是个任务县矫正科上报检察院
			}else if (parole.getAuditType().equals("jcyCheck")) {
				// 县矫正负责人上报检察院
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));//下是个任务县分管审批
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (parole.getAuditType().equals("xfgCheck")) {
				// 县分局领导 审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFZKFZR));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SJZCFZR));//市矫正处
				}
				//记录当前县级id
				variables.put("countyId",SysAccountUtils.getSysAccount().getGroupId());
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (parole.getAuditType().equals("sjzCheck")) {
				// 市矫正处 审核
				if (!StringUtils.isBlank(processDetail.getOptScore())) {//评分明细
					MxCheck mxCheck = new MxCheck();
					mxCheck.setProcessInstanceId(parole.getProcessInstanceId());
					mxCheck.setInfoType(Constants.ASSESS_MX_SJZC_SRZL);
					mxCheck.setIsUse(1);
					mxCheckService.updateIsUse(mxCheck);
					mxCheck.setInfoType(Constants.ASSESS_MX_SJZC_ZFZL);
					mxCheckService.updateIsUse(mxCheck);
				}
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_XFGLD, parole.getTaskId()));
					//variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFZCFZR));//市法制处
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (parole.getAuditType().equals("sfzCheck")) {
				// 市法制科 审核
				if (!StringUtils.isBlank(processDetail.getZfScore())) {//评分明细
					MxCheck mxCheck = new MxCheck();
					mxCheck.setProcessInstanceId(parole.getProcessInstanceId());
					mxCheck.setInfoType(Constants.ASSESS_MX_SFZC_ZFZL);
					mxCheck.setIsUse(1);
					mxCheckService.updateIsUse(mxCheck);
				}
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SJZCFZR));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SJFGLD));//市分局领导
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (parole.getAuditType().equals("sfgCheck")) {
				// 市分管领导 审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFZCFZR));
				}else if("0".equals(processDetail.getDicDecideType())){
					
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SJZCGZRY));//市工作人员
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if(parole.getAuditType().equals("sgzryPrint")){
				sysFileService.saveFiles(fileList, Constants.FILE_PAROLE, parole.getId(), Constants.FILE_PAROLE);
				this.updateByIdSelective(parole);
			}
			// 提交审核时，设置流程变量，变量值就是审核 信息
			taskService.complete(parole.getTaskId(), variables);
			
			
		}
	}
}
