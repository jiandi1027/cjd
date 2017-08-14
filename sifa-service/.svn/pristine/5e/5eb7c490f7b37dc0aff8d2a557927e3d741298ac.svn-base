  
    /**    
    * @Title: RedressResumeService.java  
    * @Package com.rowell.sifa.service.endcorrect  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年3月16日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.endcorrect;

import java.util.HashMap;
import java.util.Map;

import org.flowable.engine.HistoryService;
import org.flowable.engine.IdentityService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.endcorrect.RedressResumeMapper;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.pojo.endcorrect.RedressResume;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;

/**  
    * @ClassName: RedressResumeService  
    * @Description: 特殊原因恢复矫正service  
    * @author xiaoguang  
    * @date 2017年3月16日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class RedressResumeService extends CrudService<RedressResumeMapper, RedressResume> {
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private HistoryService historyService;

	@Autowired
	private IdentityService identityService;
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	private static String PROCESS_DEFINITION_KEY = "redressResume";
	
	
	

	@Override
	@Transactional(readOnly = false)
	public int insert(RedressResume record) {
		record.setCurrentSysUser(SysAccountUtils.getSysAccount());
		record.preInsert();
		/***
		 * 启动流程实例，指定下一步工作流
		 */
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(record.getCreateRole()));
		variables.put("createRole", record.getCreateRole());
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, record.getId(),
				variables);
		
		record.setProcessInstanceId(processInstance.getProcessInstanceId());
		int a = super.insert(record);
		examinationAndApprovalService.insertProcess(record.getId(),record.getCulpritId(),record.getProcessInstanceId(),Constants.PROCESS_TYPE_TSYYHFJZ);
		return a;
	}

	/***
	 * 
	 */
	@Transactional(readOnly = false)
	public void saveRedressResumeAuditStatus(String roleId,RedressResume redressResume,ProcessDetail processDetail) {
		// TODO Auto-generated method stub
		// askLeaveCustom.setId(UUIDBuild.getUUID());
		// askLeaveCustom.setAuditType(auditType);
		// askLeaveCustom.setOrderId(orderId);
		// askLeaveCustom.setCreatetime(new Date());
		// purBusAskLeaveAuditMapper.insert(orderAuditCustom);
		
		
		Task task = taskService.createTaskQuery().taskId(redressResume.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();
		 String createRole = (String)taskService.getVariable(redressResume.getTaskId(), "createRole");  
//		Map<String, Object> cc =task.getProcessVariables();
//		String createRole=task.getProcessVariables().get("createRole").toString();
		
		if (task != null) {
			processDetail.setProcessDefKey(PROCESS_DEFINITION_KEY);
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(redressResume.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			
			
			// 说明assignee是该任务的办理人，有权限完成3002
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核workerReport
			
			if(redressResume.getAuditType().equals("workerReport")){
				//variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR);
				if(createRole.equals(Constants.ROLE_SFSGZRY)){
					variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				}else{
					variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}
			}else if (redressResume.getAuditType().equals("sfsCheck")) {
				//
				//variables.put("leaveDay", askLeave.getLeaveDays());
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
				}else{
					variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}
				
				
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				
			} else if (redressResume.getAuditType().equals("jzkCheck")) {
				// 县矫正负责人审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					if(createRole.equals(Constants.ROLE_SFSGZRY)){
						variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
					}else{
						variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));
					}
					//variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR);
				}else{
					variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));
				}
				
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (redressResume.getAuditType().equals("xfgCheck")) {
				// 县分管领导 审核
				
				if("1".equals(processDetail.getDicDecideType())){
					variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}
			// 提交审核时，设置流程变量，变量值就是审核 信息
			taskService.complete(redressResume.getTaskId(), variables);
			
			// System.out.println("完成任务：" + taskId);
		}

	}

}
