package com.rowell.sifa.service.rewardspunishment;

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

import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.mapper.rewardspunishment.WarningMapper;
import com.rowell.sifa.mapper.sys.SysAccountMapper;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.Warning;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;
import com.rowell.sifa.service.sys.SysFileService;

/**  
    * @ClassName: WarningService  
    * @Description: 警告service  
    * @author yxb 
    * @date 2017年3月24日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class WarningService extends CrudService<WarningMapper, Warning> {
	
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	@Autowired
	private SysAccountMapper sysAccountMapper ;
	
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;//待审批事项
	@Autowired
	private SysFileService sysFileService;
	@Transactional(readOnly = false)
	public void inserts(Warning warning) {
		warning.setCurrentSysUser(SysAccountUtils.getSysAccount());
		warning.preInsert();
		/***
		 * 启动流程实例，指定下一步工作流
		 */
		Map<String, Object> variables = new HashMap<String, Object>();
		if( Constants.ROLE_SFSGZRY.equals(SysAccountUtils.getSysAccount().getRoleId()) ) {
			variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
			variables.put("groupId", SysAccountUtils.getSysAccount().getGroupId());
		}
		else if( Constants.ROLE_XJZKGZRY.equals(SysAccountUtils.getSysAccount().getRoleId()) ) {
			variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));
		}
		
		variables.put("warning", warning.getFact());
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey("warning", warning.getId(), variables);
		
		warning.setProcessInstanceId(processInstance.getProcessInstanceId());
		warning.setOptTime(new Date());
		super.insert(warning);
		examinationAndApprovalService.insertProcess(warning.getId(),warning.getCulpritId(),warning.getProcessInstanceId(),Constants.PROCESS_TYPE_JG);

	}


	@Transactional(readOnly = false) 
	public void saveCommenAuditStatus(String roleId, Warning warning, ProcessDetail processDetail,List<SysFile> fileList) {
		Task task = taskService.createTaskQuery().taskId(warning.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();

		if (task != null) {
			processDetail.setProcessDefKey("warning");
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(warning.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			
			
			// 说明assignee是该任务的办理人，有权限完成3002
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核workerReport
			if(warning.getAuditType().equals("usertask1")){
				
				if ( Constants.ROLE_SFSGZRY.equals(roleId) ) {
					//司法所工作人员上报
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				}
				if ( Constants.ROLE_XJZKGZRY.equals(roleId) ) {
					//县矫正科工作人员上报
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (warning.getAuditType().equals("usertask2")) {
				//司法所审核
				if("2".equals(processDetail.getDicDecideType())){
					//退回操作
					variables.put( "role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY) ) ;
				} else {
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (warning.getAuditType().equals("usertask3")) {
				//县矫正科审核
				if("2".equals(processDetail.getDicDecideType())){
					//退回操作
					SysAccount sa = sysAccountMapper.selectByPrimaryKey( warning.getCreater() ) ;
					if( Constants.ROLE_SFSGZRY.equals( sa.getAccount()) ){
						//如果是司法所工作人员发起的，退回到司法所审核
						variables.put( "role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_SFSFZR, task.getId()) );
						variables.put("decideType", 2 );
					} 
					else if( Constants.ROLE_XJZKGZRY.equals( sa.getAccount()) ) {
						//如果是县矫正科工作人员发起的，退回到初步上报
						variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));
						variables.put("decideType", 4 );
					}
				}else if("1".equals(processDetail.getDicDecideType())){
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFZKFZR));	
					variables.put("decideType", 1);
				}
				
			} else if (warning.getAuditType().equals("usertask4")) {
				// 县矫法制科审核			
				if("2".equals(processDetail.getDicDecideType())){
					//退回操作
					variables.put( "role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR) ) ;
				} else {
					variables.put( "role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD) ) ;
				}
				variables.put( "decideType", Integer.parseInt(processDetail.getDicDecideType()) ) ;
			}else if (warning.getAuditType().equals("usertask5")) {
				// 县分局审核		
				if( "2".equals(processDetail.getDicDecideType()) ){
					//退回操作
					variables.put( "role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFZKFZR) ) ;
				}
				else if( "1".equals(processDetail.getDicDecideType()) ){
					variables.put( "role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY) ) ;	
				}	
				variables.put( "decideType", Integer.parseInt(processDetail.getDicDecideType()) ) ;
			}
			else if(warning.getAuditType().equals("usertask6")){
				sysFileService.saveFiles(fileList, Constants.FILE_TABLE_WARNING, warning.getId(), Constants.FILE_WARNING_JG_PATH);
			}
//			if("3".equals(processDetail.getDicDecideType())){
//				//司法所审核
//				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
//				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
//			}
			// 提交审核时，设置流程变量，变量值就是审核 信息
			taskService.complete(warning.getTaskId(), variables);

		}
		
	}
}
