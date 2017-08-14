  
    /**    
    * @Title: ExitEntryReportService.java  
    * @Package com.rowell.sifa.service.inculprit  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.inculprit;

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
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.mapper.inculprit.ExitEntryReportMapper;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.homepage.WorkRemind;
import com.rowell.sifa.pojo.inculprit.ExitEntryReport;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;
import com.rowell.sifa.service.homepage.WorkRemindService;

/**  
    * @ClassName: ExitEntryReportService  
    * @Description:  出入境报备service  
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
public class ExitEntryReportService extends CrudService<ExitEntryReportMapper, ExitEntryReport> {
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	@Autowired
	private TaskService taskService;
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;//待审批事项
	@Autowired
	WorkRemindService workRemindService;//待处理事项
	private static String PROCESS_DEFINITION_KEY = "exitEntry";
	/**
	 * 
	    * @Title: arrowUp  
	    * @Description: 启动流程 
	    * @param @param userId
	    * @param @param record    参数  
	    * @return void    返回类型  
	    * @throws
	 */
	@Transactional(readOnly = false)
	public void arrowUp(String userId, ExitEntryReport record) {
		record.setCurrentSysUser(SysAccountUtils.getSysAccount());

		/***
		 * 启动流程实例，指定下一步工作流
		 */
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));//县矫正科负责人
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, record.getId(),
				variables);
		//记录当前上报的部门id
		record.setProcessInstanceId(processInstance.getProcessInstanceId());
		//流程启动后在待审批事项内插入数据
		examinationAndApprovalService.insertProcess(record.getId(),record.getCulpritId(),record.getProcessInstanceId(),Constants.PROCESS_TYPE_EXITENTRY);
		updateById(record);
		//删除待处理的记录
		WorkRemind workRemind=new WorkRemind();
		workRemind.setRecordId(record.getId());
		workRemind.setDicType(Constants.WORK_REMIND_23);
		List<WorkRemind> list=workRemindService.findAll(workRemind);
		if(!list.isEmpty()){
			WorkRemind workRemind1=list.get(0);
			workRemind1.setDelFlag(1);//作废标记
			workRemindService.saveOrUpdate(workRemind1);
		}
		//super.insert(record);

	}
	
	/**
	 * 
	    * @Title: saveAuditStatus  
	    * @Description:  处理审批结果并保存
	    * @param @param roleId
	    * @param @param detached
	    * @param @param processDetail    参数  
	    * @return void    返回类型  
	    * @throws
	 */
	@Transactional(readOnly = false)
	public void saveAuditStatus(String roleId, ExitEntryReport exitEntryReport, ProcessDetail processDetail) {
		Task task = taskService.createTaskQuery().taskId(exitEntryReport.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();
		if (task != null) {
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(exitEntryReport.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			
			
			// 说明assignee是该任务的办理人，有权限完成3002（司法所负责人）
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核
			if(exitEntryReport.getAuditType().equals("xjzCheck")){
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (exitEntryReport.getAuditType().equals("xfgCheck")) {
				// 县分管领导 审核
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}
			// 提交审核时，设置流程变量，变量值就是审核 信息
			taskService.complete(exitEntryReport.getTaskId(), variables);
		}
	}
	
	
	public CommonJsonResult saveExitEntryReport(ExitEntryReport exitEntryReport) {
		if (StringUtils.isBlank(exitEntryReport.getId())) {
			saveOrUpdate(exitEntryReport);
		} else {
			updateByIdSelective(exitEntryReport);
		}
		//删除待处理的记录
		WorkRemind workRemind=new WorkRemind();
		workRemind.setRecordId(exitEntryReport.getId());
		workRemind.setDicType(Constants.WORK_REMIND_23);
		List<WorkRemind> list=workRemindService.findAll(workRemind);
		if(!list.isEmpty()){
			WorkRemind workRemind1=list.get(0);
			workRemind1.setDelFlag(1);//作废标记
			workRemindService.saveOrUpdate(workRemind1);
		}
		return CommonJsonResult.build(200, "保存成功！");
	}
	
}
