package com.rowell.sifa.service.rewardspunishment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.rowell.sifa.mapper.rewardspunishment.CommendMapper;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.Commend;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;

/**
 * 
 * @ClassName: CommendService
 * @Description: 表扬Service
 * @author yxb
 * @date 2017年3月23日
 *
 */
@Service
@Transactional(readOnly = true)
public class CommendService extends CrudService<CommendMapper, Commend> {
	private static String PROCESS_DEFINITION_KEY = "commend";
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;// 待审批事项

	@Transactional(readOnly = false)
	public void insert(Commend commend, HttpServletRequest request, String RoleId,ProcessDetail processDetail){
		commend.setCurrentSysUser(SysAccountUtils.getSysAccount());
		commend.preInsert();
		/***
		 * 启动流程实例，指定下一步工作流
		 */
		Map<String, Object> variables = new HashMap<String, Object>();
		if("4".equals(processDetail.getDicDecideType())){//流程判断为司法所开始
			variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
		}else{
			variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));
		}
		variables.put("groupId", SysAccountUtils.getSysAccount().getGroupId());
		variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, commend.getId(),
				variables);
		commend.setProcessInstanceId(processInstance.getProcessInstanceId());
		super.insert(commend);
		examinationAndApprovalService.insertProcess(commend.getId(), commend.getCulpritId(),
				commend.getProcessInstanceId(), Constants.PROCESS_TYPE_BY);

	}

	public void saveCommenAuditStatus(String roleId, Commend commend, ProcessDetail processDetail) {
		Task task = taskService.createTaskQuery().taskId(commend.getTaskId())
				.taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();

		if (task != null) {
			processDetail.setProcessDefKey(PROCESS_DEFINITION_KEY);
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(commend.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			//System.out.println("流程"+processDetail);
			// 说明assignee是该任务的办理人，有权限完成3002
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核workerReport
			if (commend.getAuditType().equals("sfsReport")) {
				// 工作人员上报
				variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				//variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				//System.out.println("decideType="+processDetail.getDicDecideType());
			}
			else if(commend.getAuditType().equals("jzkReport")) {
				variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				//variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}
			else if(commend.getAuditType().equals("sfsCheck")) {
				// 司法所to县矫正科
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}
				//System.out.println(processDetail.getDicDecideType());
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}
			else if (commend.getAuditType().equals("jzkCheck")) {
				// 县矫正科
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					List<ProcessDetail> processDetails=processDetailMapper.findByProcessInsId(commend.getProcessInstanceId());
					for(ProcessDetail p :processDetails){
						if("县矫正科上报".equals(p.getAuditName())){//退回矫正科工作人员			
							variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));
							variables.put("decideType", 5);
							break;
						}else if("司法所上报".equals(p.getAuditName())){
							Map<String,Object> variablesTemp = taskService.getVariables(task.getId());
							String groupId=(String) variablesTemp.get("groupId");
							variables.put("role_id", Constants.ROLE_SFSFZR+"_"+groupId);//退回司法所负责人，手动设置id
							variables.put("decideType", 2);	
						}
					}
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFZKFZR));//县法制科
					variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				}
			}
			else if (commend.getAuditType().equals("fzkCheck")) {
				// 县矫法制科审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));//县分管
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}
			else if(commend.getAuditType().equals("xfgCheck")){
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFZKFZR));
					variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				}
				//记录当前县级部门id
				//variables.put("countryId",SysAccountUtils.getSysAccount().getGroupId());
			}
			// 提交审核时，设置流程变量，变量值就是审核 信息
			taskService.complete(commend.getTaskId(), variables);

		}

	}

}
