  
    /**    
    * @Title: GradeChangeService.java  
    * @Package com.rowell.sifa.service.rewardspunishment  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年3月30日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.rewardspunishment;

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
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.mapper.rewardspunishment.GradeChangeMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.GradeChange;
import com.rowell.sifa.pojo.rewardspunishment.Parole;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;

/**  
    * @ClassName: GradeChangeService  
    * @Description: 监管等级修改service
    * @author xiaoguang  
    * @date 2017年3月30日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class GradeChangeService extends CrudService<GradeChangeMapper, GradeChange> {
	
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private HistoryService historyService;

	@Autowired
	private IdentityService identityService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;//待审批事项
	private static String PROCESS_DEFINITION_KEY = "gradeChange";
	
	
		@Transactional(readOnly = false)
		public void inserts(GradeChange gradeChange) {
			gradeChange.setCurrentSysUser(SysAccountUtils.getSysAccount());
			gradeChange.preInsert();
			/***
			 * 启动流程实例，指定下一步工作流
			 */
			Map<String, Object> variables = new HashMap<String, Object>();
			//上报给司法所工作人员
			variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
			variables.put("groupId", SysAccountUtils.getSysAccount().getGroupId());
			ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, gradeChange.getId(),
					variables);
			
			gradeChange.setProcessInstanceId(processInstance.getProcessInstanceId());
			
			 super.insert(gradeChange);
			examinationAndApprovalService.insertProcess(gradeChange.getId(),gradeChange.getCulpritId(),gradeChange.getProcessInstanceId(),Constants.PROCESS_TYPE_JGDJ);
		}
		/***
		 * 工作流审核审批操作
		 */
		@Transactional(readOnly = false)
		public void saveGradeChangeAuditStatus(String roleId, GradeChange gradeChange,ProcessDetail processDetail) {

			Task task = taskService.createTaskQuery().taskId(gradeChange.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();

			if (task != null) {
				processDetail.setProcessDefKey(PROCESS_DEFINITION_KEY);
				processDetail.setAuditName(task.getName());
				processDetail.setProcessId(gradeChange.getProcessInstanceId());
				processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
				processDetail.preInsert();
				processDetailMapper.insert(processDetail);
				
				// 说明assignee是该任务的办理人，有权限完成3002
				Map<String, Object> variables = new HashMap<String, Object>();
				// 根据 auditType判断是几级审核workerReport
				if(gradeChange.getAuditType().equals("firstReport")){
					//司法上报
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
					variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				}else if (gradeChange.getAuditType().equals("sfsCheck")) {
					//司法所负责人
					if("2".equals(processDetail.getDicDecideType())){
						//退回操作
						variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
					}else{
						variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
					}
					variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				} else if (gradeChange.getAuditType().equals("xjzkCheck")) {
					// 县矫正负责人审核
					if("2".equals(processDetail.getDicDecideType())){
						//退回操作
						variables.put("role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_SFSFZR, task.getId()) );
					}else{
						variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));
					}
					variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				}else if (gradeChange.getAuditType().equals("xfjCheck")) {
					// 县局领导审核
					if("2".equals(processDetail.getDicDecideType())){
						//退回操作
						variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
					}else{
						variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));//下是个任务县矫正科公示
					}
					variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				}
				//到县分局领导审核后根据审核意见是否修改矫正人员的监管等级
				if(gradeChange.getAuditType().equals("xfjCheck")&&processDetail.getDicDecideType().equals("1")){
					Culprit culprit=culpritService.findById(gradeChange.getCulpritId());
					culprit.setDicMonitorGradeKey(gradeChange.getDicMonitorGradeKey());
					culpritService.updateById(culprit);
					super.saveOrUpdate(gradeChange);
				}
				// 提交审核时，设置流程变量，变量值就是审核 信息
				taskService.complete(gradeChange.getTaskId(), variables);
			}
		}
}
