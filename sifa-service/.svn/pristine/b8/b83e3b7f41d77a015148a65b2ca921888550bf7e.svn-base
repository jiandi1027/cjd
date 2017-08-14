  
    /**    
    * @Title: OmittedCrimeService.java  
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
import com.rowell.sifa.mapper.endcorrect.OmittedCrimeMapper;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.pojo.endcorrect.OmittedCrime;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;

/**  
    * @ClassName: OmittedCrimeService  
    * @Description: 漏罪service  
    * @author xiaoguang  
    * @date 2017年3月16日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class OmittedCrimeService extends CrudService<OmittedCrimeMapper, OmittedCrime> {

	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private HistoryService historyService;

	@Autowired
	private IdentityService identityService;
	
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	private static String PROCESS_DEFINITION_KEY = "omittedCrime";
	
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;
	

	@Override
	@Transactional(readOnly = false)
	public int insert(OmittedCrime record) {
		record.setCurrentSysUser(SysAccountUtils.getSysAccount());
		record.preInsert();
		/***
		 * 启动流程实例，指定下一步工作流
		 */
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, record.getId(),
				variables);
		
		record.setProcessInstanceId(processInstance.getProcessInstanceId());
		int a = super.insert(record);
		examinationAndApprovalService.insertProcess(record.getId(),record.getCulpritId(),record.getProcessInstanceId(),Constants.PROCESS_TYPE_LZ);
		return a;
	}

	/***
	 * 
	 */
	@Transactional(readOnly = false)
	public void saveOmittedCrimeAuditStatus(String roleId,OmittedCrime omittedCrime,ProcessDetail processDetail) {
		// TODO Auto-generated method stub
		// askLeaveCustom.setId(UUIDBuild.getUUID());
		// askLeaveCustom.setAuditType(auditType);
		// askLeaveCustom.setOrderId(orderId);
		// askLeaveCustom.setCreatetime(new Date());
		// purBusAskLeaveAuditMapper.insert(orderAuditCustom);
		
		
		Task task = taskService.createTaskQuery().taskId(omittedCrime.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();
		
		
		
		if (task != null) {
			processDetail.setProcessDefKey(PROCESS_DEFINITION_KEY);
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(omittedCrime.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			
			
			// 说明assignee是该任务的办理人，有权限完成3002
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核workerReport
			
			if(omittedCrime.getAuditType().equals("workerReport")){
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				//variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (omittedCrime.getAuditType().equals("sfsCheck")) {
				//
				//variables.put("leaveDay", askLeave.getLeaveDays());
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}
				
				
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				
			} else if (omittedCrime.getAuditType().equals("jzkCheck")) {
				// 县矫正负责人审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));
				}
				
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (omittedCrime.getAuditType().equals("xfgCheck")) {
				// 县分管领导 审核
				
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}
			// 提交审核时，设置流程变量，变量值就是审核 信息
			taskService.complete(omittedCrime.getTaskId(), variables);
			
			// System.out.println("完成任务：" + taskId);
		}

	}

}
