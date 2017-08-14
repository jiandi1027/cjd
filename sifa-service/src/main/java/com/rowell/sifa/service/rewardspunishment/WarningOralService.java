  
    /**    
    * @Title: WarningOralService.java  
    * @Package com.rowell.sifa.service.rewardspunishment  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年3月16日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.rewardspunishment;

import java.util.HashMap;
import java.util.Map;

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
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.mapper.rewardspunishment.WarningOralMapper;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.WarningOral;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;

/**  
    * @ClassName: WarningOralService  
    * @Description: 口头警告service
    * @author xiaoguang  
    * @date 2017年3月16日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class WarningOralService extends CrudService<WarningOralMapper, WarningOral> {
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;

	
	private static String PROCESS_DEFINITION_KEY = "warningOral";
	
	
	@Transactional(readOnly = false)
	public void submitWarningOral(WarningOral warningOral) {
		
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, warningOral.getId(),
				variables);
		warningOral.setProcessInstanceId(processInstance.getProcessInstanceId());
		examinationAndApprovalService.insertProcess(warningOral.getId(),warningOral.getCulpritId(),warningOral.getProcessInstanceId(),Constants.PROCESS_TYPE_KTJG);
		int result = updateById(warningOral);
		System.out.println(result);

	}

	public void saveOrderAuditStatus(String roleId, WarningOral warningOral,ProcessDetail processDetail) {
		// TODO Auto-generated method stub
		// askLeaveCustom.setId(UUIDBuild.getUUID());
		// askLeaveCustom.setAuditType(auditType);
		// askLeaveCustom.setOrderId(orderId);
		// askLeaveCustom.setCreatetime(new Date());
		// purBusAskLeaveAuditMapper.insert(orderAuditCustom);

		Task task = taskService.createTaskQuery().taskId(warningOral.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();
		
		processDetail.setAuditName(task.getName());
		processDetail.setProcessId(warningOral.getProcessInstanceId());
		processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
		processDetail.preInsert();
		processDetailMapper.insert(processDetail);

		// 说明assignee是该任务的办理人，有权限完成3002
					Map<String, Object> variables = new HashMap<String, Object>();
					// 根据 auditType判断是几级审核workerReport
					
					if(warningOral.getAuditType().equals("usertask1")){
						variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
						//variables.put("role_id",ProcessUtils.getRoleIdWithGroupId("3002");
						//variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
					}
					// 提交审核时，设置流程变量，变量值就是审核 信息
					taskService.complete(warningOral.getTaskId(), variables);
					// System.out.println("完成任务：" + taskId);
				}

			
}
