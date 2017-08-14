  
    /**    
    * @Title: DetachedService.java  
    * @Package com.rowell.sifa.service.endcorrect  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年3月16日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.endcorrect;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.flowable.engine.HistoryService;
import org.flowable.engine.IdentityService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Task;
import org.flowable.engine.task.TaskQuery;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.endcorrect.DetachedMapper;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.endcorrect.Detached;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;
import com.rowell.sifa.vo.dailymgr.AskLeaveCustom;
import com.rowell.sifa.vo.dailymgr.DetachedCustom;

/**  
    * @ClassName: DetachedService  
    * @Description: 脱管service  
    * @author xiaoguang  
    * @date 2017年3月16日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class DetachedService extends CrudService<DetachedMapper, Detached> {
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private HistoryService historyService;

	@Autowired
	private IdentityService identityService;
	
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;//待审批事项
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	private static String PROCESS_DEFINITION_KEY = "detached";
	
	/**
	 * 
	    * @Title: submitDetached  
	    * @Description: 启动流程 
	    * @param @param userId
	    * @param @param record    参数  
	    * @return void    返回类型  
	    * @throws
	 */
	@Transactional(readOnly = false)
	public void submitDetached(String userId, Detached record) {
		this.saveOrUpdate(record);
		record.setCurrentSysUser(SysAccountUtils.getSysAccount());
		//record.preInsert();
		/***
		 * 启动流程实例，指定下一步工作流
		 */
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));//司法所工作人员(3003)
		variables.put("groupId",SysAccountUtils.getSysAccount().getGroupId());
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, record.getId(),
				variables);
		//记录当前上报的部门id
		record.setProcessInstanceId(processInstance.getProcessInstanceId());
		//流程启动后在待审批事项内插入数据
		examinationAndApprovalService.insertProcess(record.getId(),record.getCulpritId(),record.getProcessInstanceId(),Constants.PROCESS_TYPE_TGGL);
		int result = updateById(record);
		//super.insert(record);

	}

	/**
	 * 
	    * @Title: saveDetachedAuditStatus  
	    * @Description:  处理审批结果并保存
	    * @param @param roleId
	    * @param @param detached
	    * @param @param processDetail    参数  
	    * @return void    返回类型  
	    * @throws
	 */
	@Transactional(readOnly = false)
	public void saveDetachedAuditStatus(String roleId, Detached detached, ProcessDetail processDetail) {
		Task task = taskService.createTaskQuery().taskId(detached.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();
		if (task != null) {
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(detached.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			
			
			// 说明assignee是该任务的办理人，有权限完成3002（司法所负责人）
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核
			if(detached.getAuditType().equals("sfsPut")){
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (detached.getAuditType().equals("sfsCheck")) {
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
				}else{
					variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				
			} else if (detached.getAuditType().equals("jzkCheck")) {
				// 县矫正负责人审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					Map<String,Object> variablesTemp = taskService.getVariables(task.getId());
					String groupId=(String) variablesTemp.get("groupId");
					variables.put("role_id", Constants.ROLE_SFSFZR+"_"+groupId);//退回司法所负责人，手动设置id
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (detached.getAuditType().equals("xfgCheck")) {
				// 县分管领导 审核
				
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
					variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				}
				
				if("1".equals(processDetail.getDicDecideType())){//同意操作
					variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
					Culprit culprit=new Culprit();
					culprit.setId(detached.getCulpritId());
					culprit.setDicStatusKey(Constants.CULPRIT_STATUS_TG);//状态改为脱管
					culpritService.updateByIdSelective(culprit);
				}
				
				if("0".equals(processDetail.getDicDecideType())){//不同意操作
					variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				}
			}
			// 提交审核时，设置流程变量，变量值就是审核 信息
			taskService.complete(detached.getTaskId(), variables);
			 //System.out.println("完成任务：" + taskId);
		}
	}
}