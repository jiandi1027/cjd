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

import com.alibaba.druid.sql.ast.statement.SQLIfStatement.Else;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.endcorrect.OutOfMapper;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.endcorrect.OutOf;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;

/**  
    * @ClassName: OutOfService  
    * @Description: 迁出管理业务层 
    * @author yxb
    * @date 2017年3月16日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class OutOfService extends CrudService<OutOfMapper, OutOf>{

	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	private static String PROCESS_DEFINITION_KEY = "outOfProcess";
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;//待审批事项
	@Autowired
	private CulpritService culpritService;
	
	@Transactional(readOnly = false)
	public void inserts(OutOf outof) {
		outof.setCurrentSysUser(SysAccountUtils.getSysAccount());
		outof.preInsert();
		/***
		 * 启动流程实例，指定下一步工作流
		 */
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("groupId", SysAccountUtils.getSysAccount().getGroupId());
		variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
		variables.put(PROCESS_DEFINITION_KEY, outof.getReason());
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, outof.getId(),
				variables);
		
		outof.setProcessInstanceId(processInstance.getProcessInstanceId());
		super.insertSelective(outof);
		examinationAndApprovalService.insertProcess(outof.getId(),outof.getCulpritId(),outof.getProcessInstanceId(),Constants.PROCESS_TYPE_OUTOF);
	}

	  

	@Transactional(readOnly = false)
	public void saveAskLeaveAuditStatus(String roleId, OutOf outof,ProcessDetail processDetail) {
		
		Task task = taskService.createTaskQuery().taskId(outof.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();
		if (task != null) {
			
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(outof.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			// 说明assignee是该任务的办理人，有权限完成3003
			Map<String, Object> variables = new HashMap<String, Object>();
			if( "usertask1".equals(outof.getAuditType()) ) {
				//司法所工作人员上报
				variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}
			else if( "usertask2".equals(outof.getAuditType()) ) {
				//司法所审核
				if( "2".equals(processDetail.getDicDecideType()) ) {
					variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
				}
				else if( "1".equals(processDetail.getDicDecideType()) ) {
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}
			else if ( "usertask3".equals(outof.getAuditType()) ) {
				// 县矫正负责人审核
				if( "2".equals(processDetail.getDicDecideType()) ) {
					variables.put( "role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_SFSFZR, task.getId()) ) ;
				}
				else if( "1".equals(processDetail.getDicDecideType()) ) {
					variables.put( "role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD) );
				}
				variables.put( "decideType", Integer.parseInt(processDetail.getDicDecideType()) ) ;
			} else if ( "usertask4".equals(outof.getAuditType()) ) {
				//县分管领导
				if( "2".equals(processDetail.getDicDecideType()) ) {
					variables.put( "role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR) );
				}
				else if( "1".equals(processDetail.getDicDecideType()) ){
					variables.put( "role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_SFSGZRY, task.getId()) );
				}
				variables.put( "decideType", Integer.parseInt(processDetail.getDicDecideType()) );
			}
			else if( "usertask5".equals(outof.getAuditType()) ) {
				//司法所工作人员打印
				if( "2".equals(processDetail.getDicDecideType()) ) {
					variables.put( "role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD) );
				}
				else {
					Culprit culprit = new Culprit();
					culprit.setId(outof.getCulpritId());
					culprit.setDicStatusKey(Constants.CULPRIT_STATUS_QJ);//状态改为迁出
					culpritService.updateByIdSelective(culprit);
				}
			} 
			// 提交审核时，设置流程变量，变量值就是审核 信息
			taskService.complete(outof.getTaskId(), variables);
		}

	}

}
