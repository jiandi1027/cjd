  
    /**    
    * @Title: RecidivismService.java  
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
import com.rowell.sifa.mapper.endcorrect.RecidivismMapper;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.endcorrect.Recidivism;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;

/**  
    * @ClassName: RecidivismService  
    * @Description: 重新犯罪service 
    * @author xiaoguang  
    * @date 2017年3月16日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class RecidivismService extends CrudService<RecidivismMapper, Recidivism> {
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
	private static String PROCESS_DEFINITION_KEY = "recidivism";
	
	
	

	public int insert(Recidivism record,Culprit culprit) {
		record.setCurrentSysUser(SysAccountUtils.getSysAccount());
		record.preInsert();
		/***
		 * 启动流程实例，指定下一步工作流
		 */
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("role_id",Constants.ROLE_SFSGZRY+"_"+culprit.getGroupId());
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, record.getId(),
				variables);

		record.setProcessInstanceId(processInstance.getProcessInstanceId());
		int a = super.insert(record);
		examinationAndApprovalService.insertProcess(record.getId(),record.getCulpritId(),record.getProcessInstanceId(),Constants.PROCESS_TYPE_CXFZ);
		return a;
	}

	/***
	 * 
	 */
	@Transactional(readOnly = false)
	public void saveRecidivismAuditStatus(String roleId,Recidivism recidivism,ProcessDetail processDetail) {
		// TODO Auto-generated method stub
		// askLeaveCustom.setId(UUIDBuild.getUUID());
		// askLeaveCustom.setAuditType(auditType);
		// askLeaveCustom.setOrderId(orderId);
		// askLeaveCustom.setCreatetime(new Date());
		// purBusAskLeaveAuditMapper.insert(orderAuditCustom);
		
		
		Task task = taskService.createTaskQuery().taskId(recidivism.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();
		
		
		
		if (task != null) {
			processDetail.setProcessDefKey(PROCESS_DEFINITION_KEY);
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(recidivism.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			
			
			// 说明assignee是该任务的办理人，有权限完成3002
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核workerReport
			
			if(recidivism.getAuditType().equals("workerReport")){
				variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				//variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (recidivism.getAuditType().equals("sfsCheck")) {
				variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
			} else if (recidivism.getAuditType().equals("jzkCheck")) {
				variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));
			} else if (recidivism.getAuditType().equals("xfgCheck")) {
				variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
			}
			// 提交审核时，设置流程变量，变量值就是审核 信息
			taskService.complete(recidivism.getTaskId(), variables);
			
			// System.out.println("完成任务：" + taskId);
		}

	}

}
