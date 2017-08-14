  
    /**    
    * @Title: RedressStopService.java  
    * @Package com.rowell.sifa.service.endcorrect  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年3月16日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.endcorrect;

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
import com.rowell.sifa.mapper.endcorrect.RedressStopMapper;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.pojo.endcorrect.RedressStop;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;

/**  
    * @ClassName: RedressStopService  
    * @Description: 特殊原因终止矫正service  
    * @author xiaoguang  
    * @date 2017年3月16日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class RedressStopService extends CrudService<RedressStopMapper, RedressStop> {
	/**
	 * 创建一个特殊原因矫正终止流程实例
	 */
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;
	private static String PROCESS_DEFINITION_KEY = "redressStop";
	
	@Override
	@Transactional(readOnly = false)
	public int insert(RedressStop redressStop) {
		redressStop.setCurrentSysUser(SysAccountUtils.getSysAccount());
		redressStop.preInsert();
		/***
		 * 启动流程实例，指定下一步工作流
		 */
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
		variables.put("groupId", SysAccountUtils.getSysAccount().getGroupId());
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, redressStop.getId(),
				variables);
		redressStop.setProcessInstanceId(processInstance.getProcessInstanceId());
		int a = super.insert(redressStop);
		examinationAndApprovalService.insertProcess(redressStop.getId(),redressStop.getCulpritId(),redressStop.getProcessInstanceId(),Constants.PROCESS_TYPE_TSYYZZJZ);
		return a;
	}
	
	
	/**
	 * 判断审批操作添加下一个审批人
	 * @param roleId
	 * @param redressStop
	 * @param processDetail
	 */
	@Transactional(readOnly = false)
	public void saveredressStopAuditStatus(String roleId, RedressStop redressStop,ProcessDetail processDetail) {
		
		Task task = taskService.createTaskQuery().taskId(redressStop.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();
		
		
		
		if (task != null) {
			
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(redressStop.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			
			
			// 说明assignee是该任务的办理人，有权限完成3002
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核workerReport
			
			if (redressStop.getAuditType().equals("sfsCheck")) {
				//司法所审核
				if (processDetail.getDicDecideType().equals("1")) {
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				
			} else if (redressStop.getAuditType().equals("xjzkCheck")) {
				// 县矫正负责人审核
				if (processDetail.getDicDecideType().equals("1")) {
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (redressStop.getAuditType().equals("xfgCheck")) {
				// 县分管领导 审核
				if (processDetail.getDicDecideType().equals("1")) {
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (redressStop.getAuditType().equals("xgzryprint")) {
				// 县工作人员打印
				//variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			
			}
			// 提交审核时，设置流程变量，变量值就是审核 信息
//			if("0".equals(processDetail.getDicDecideType())){
//				try {
//					ProcessUtils.endProcess("endevent1", redressStop.getTaskId());
//				} catch (Exception e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}else{
				taskService.complete(redressStop.getTaskId(), variables);
//			}
			// System.out.println("完成任务：" + taskId);
			
		}

	}
	
	
}
