  
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
import com.rowell.sifa.mapper.rewardspunishment.NoDealMapper;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.NoDeal;
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
public class NoDealService extends CrudService<NoDealMapper, NoDeal> {
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;
	
	private static String PROCESS_DEFINITION_KEY = "noDeal";
	
	
	@Transactional(readOnly = false)
	public void submitNoDeal(NoDeal noDeal) {
		
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, noDeal.getId(),
				variables);
		noDeal.setProcessInstanceId(processInstance.getProcessInstanceId());
		examinationAndApprovalService.insertProcess(noDeal.getId(),noDeal.getCulpritId(),noDeal.getProcessInstanceId(),Constants.PROCESS_TYPE_DCLBZCL);
		int result = updateById(noDeal);
		System.out.println(result);

	}

	public void saveOrderAuditStatus(String roleId, NoDeal noDeal,ProcessDetail processDetail) {
		// TODO Auto-generated method stub
		// askLeaveCustom.setId(UUIDBuild.getUUID());
		// askLeaveCustom.setAuditType(auditType);
		// askLeaveCustom.setOrderId(orderId);
		// askLeaveCustom.setCreatetime(new Date());
		// purBusAskLeaveAuditMapper.insert(orderAuditCustom);

		Task task = taskService.createTaskQuery().taskId(noDeal.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();
		
		processDetail.setAuditName(task.getName());
		processDetail.setProcessId(noDeal.getProcessInstanceId());
		processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
		processDetail.preInsert();
		processDetailMapper.insert(processDetail);

		// 说明assignee是该任务的办理人，有权限完成3002
					Map<String, Object> variables = new HashMap<String, Object>();
					// 根据 auditType判断是几级审核workerReport
					
					if(noDeal.getAuditType().equals("sfsCheck")){
						variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
						//variables.put("role_id",ProcessUtils.getRoleIdWithGroupId("3002");
						//variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
					}
					// 提交审核时，设置流程变量，变量值就是审核 信息
					taskService.complete(noDeal.getTaskId(), variables);
					// System.out.println("完成任务：" + taskId);
				}

			
}
