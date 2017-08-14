
/**    
* @Title: AskLeaveService.java  
* @Package com.rowell.sifa.service.dailymgr  
* @Description: TODO(用一句话描述该文件做什么)  
* @author xiaoguang  
* @date 2017年2月28日  
* @version V1.0    
*/

package com.rowell.sifa.service.dailymgr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.flowable.engine.HistoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.history.HistoricProcessInstanceQuery;
import org.flowable.engine.history.HistoricTaskInstance;
import org.flowable.engine.history.HistoricTaskInstanceQuery;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.runtime.ProcessInstanceQuery;
import org.flowable.engine.task.Task;
import org.flowable.engine.task.TaskQuery;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.utils.DateUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.dailymgr.AskLeaveMapper;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.vo.dailymgr.AskLeaveCustom;

/**
 * @ClassName: AskLeaveService
 * @Description: 请假service
 * @author xiaoguang
 * @date 2017年2月28日
 * 
 */
@Service
@Transactional(readOnly = true)
public class AskLeaveService extends CrudService<AskLeaveMapper, AskLeave> {
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private HistoryService historyService;
	
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	private static String PROCESS_DEFINITION_KEY = "askLeave";
	
	
	

	@Override
	@Transactional(readOnly = false)
	public int insert(AskLeave record) {
		record.setCurrentSysUser(SysAccountUtils.getSysAccount());
		record.preInsert();
	
		/***
		 * 启动流程实例，指定下一步工作流
		 */
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
		variables.put("leaveDay", record.getLeaveDays());
		
		variables.put("groupId", SysAccountUtils.getSysAccount().getGroupId());
		
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, record.getId(),
				variables);
		
		record.setProcessInstanceId(processInstance.getProcessInstanceId());
		
		return super.insert(record);
	}

	/***
	 * 工作流审核审批操作
	 */
	@Transactional(readOnly = false)
	public void saveAskLeaveAuditStatus(String roleId, AskLeave askLeave,ProcessDetail processDetail) {
		Task task = taskService.createTaskQuery().taskId(askLeave.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();
		
		if (task != null) {
			processDetail.setProcessDefKey(PROCESS_DEFINITION_KEY);
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(askLeave.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			
			
			// 说明assignee是该任务的办理人，有权限完成3002
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核workerReport
			
			if(askLeave.getAuditType().equals("workerReport")){
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (askLeave.getAuditType().equals("sfsCheck")) {
				// 司法所负责人审核
				//variables.put("leaveDay", askLeave.getLeaveDays());
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}
				
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (askLeave.getAuditType().equals("jzkCheck")) {
				// 县矫正负责人审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_SFSFZR, task.getId()));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));
				}
				
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (askLeave.getAuditType().equals("xfgCheck")) {
				// 县分管领导 审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_SFSGZRY, task.getId()));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}
			// 提交审核时，设置流程变量，变量值就是审核 信息
			taskService.complete(askLeave.getTaskId(), variables);
			
	
			if(askLeave.getAuditType().equals("workerPrint")||(askLeave.getAuditType().equals("sfsCheck")&&askLeave.getLeaveDays()<=7)){//流程走完 变成未销假
				//askLeave.setDicStatusKey(Constants.ASKLEAVE_STATUS_WXJ);
				askLeave.setDicStatusKey(Constants.CULPRIT_STATUS_WCQJ);
				this.updateByIdSelective(askLeave);
			}
			
			
			
			
			
			if("0".equals(processDetail.getDicDecideType())){//未准假
				//askLeave.setDicStatusKey(Constants.ASKLEAVE_STATUS_WZJ);
				this.updateByIdSelective(askLeave);
			}
		}
	}

	/**
	 * @Title: findActivityList @Description:
	 * TODO(这里用一句话描述这个方法的作用) @param @return 参数 @return Object 返回类型 @throws
	 */

	public List<AskLeaveCustom> findActivityList() throws Exception {

		// 创建查询对象
		ProcessInstanceQuery processInstanceQuery = runtimeService.createProcessInstanceQuery();

		// 设置查询条件
		// 流程定义 key
		String processDefinitionKey = PROCESS_DEFINITION_KEY;
		// 指定 流程定义key只查询该类流程的实例，比如key为采购流程，只查询采购流程实例
		processInstanceQuery.processDefinitionKey(processDefinitionKey);

		// 当前排序字段
		processInstanceQuery.orderByProcessInstanceId().desc();

		// 获取查询列表
		List<ProcessInstance> list = processInstanceQuery.list();

		// 单独 定义一个list，list中包括自定义的pojo(OrderCustom包括 流程实例 信息和业务系统 信息)
		List<AskLeaveCustom> orderList = new ArrayList<AskLeaveCustom>();
		for (ProcessInstance processInstance : list) {

			AskLeaveCustom askLeaveCustom = new AskLeaveCustom();

			// 比如key为采购流程，这个key就是采购单id
			String businesskey = processInstance.getBusinessKey();

			// 根据 businessKey获取采购单信息
			AskLeave askLeave = dao.selectByPrimaryKey(businesskey);
			// 将采购单信息拷贝到orderCustom中
			if(askLeave!=null){
				BeanUtils.copyProperties(askLeave, askLeaveCustom);
			}

			// 向orderCustom中填充流程实例 信息
			Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).active().singleResult();  

			// 当前运行的结点
			askLeaveCustom.setProcessInstanceId(processInstance.getProcessInstanceId());
			askLeaveCustom.setActivityId(task.getExecutionId());
			askLeaveCustom.setActivityName(task.getName());

			orderList.add(askLeaveCustom);

		}
		return orderList;
	}

	/**
	 * @Title: findAskLeaveTaskList @Description: 查询待办任务 @param @param
	 * roleId @param @return 参数 @return Object 返回类型 @throws
	 */
	public List<AskLeaveCustom> findAskLeaveTaskList(String roleId) {
		// 任务 负责人
		String assignee = roleId;
		// 创建查询对象
		TaskQuery taskQuery = taskService.createTaskQuery();
		taskQuery.orderByTaskCreateTime().desc();
		// 设置查询条件
		taskQuery.taskAssignee(assignee);

		// 指定 流程定义key，只查询某个流程的任务
		taskQuery.processDefinitionKey(PROCESS_DEFINITION_KEY);

		// 获取查询列表
		List<Task> list = taskQuery.list();

		List<AskLeaveCustom> askLeaveCustoms = new ArrayList<AskLeaveCustom>();

		for (Task task : list) {
			AskLeaveCustom askLeaveCustom = new AskLeaveCustom();
			// 流程实例id
			String processInstanceId = task.getProcessInstanceId();
			// 根据流程实例id找到流程实例对象
			ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
					.processInstanceId(processInstanceId).singleResult();
			// 从流程实例对象中获取businessKey
			String businessKey = processInstance.getBusinessKey();

			String askLeaveId = businessKey;
			// 根据 businessKey获取采购单信息
			AskLeave askLeave = dao.selectByPrimaryKey(askLeaveId);
			BeanUtils.copyProperties(askLeave, askLeaveCustom);

			// 根据businessKey查询业务系统
			// ....
			askLeaveCustom.setAssignee(task.getAssignee());
			askLeaveCustom.setTaskId(task.getId());
			askLeaveCustom.setTaskDefinitionKey(task.getTaskDefinitionKey());
			askLeaveCustom.setTaskName(task.getName());

			askLeaveCustoms.add(askLeaveCustom);
			System.out.println("-------------------------------");
			System.out.println("流程实例id：" + task.getProcessInstanceId());
			System.out.println("任务 id：" + task.getId());
			System.out.println("任务标识：" + task.getTaskDefinitionKey());
			System.out.println("任务负责人：" + task.getAssignee());
			System.out.println("任务名称：" + task.getName());
			System.out.println("任务创建时间：" + task.getCreateTime());
		}

		return askLeaveCustoms;
	}

	/**
	 * @Title: findFinishedList @Description: TODO(这里用一句话描述这个方法的作用) @param
	 * 参数 @return void 返回类型 @throws
	 */

	public List<AskLeaveCustom> findFinishedList() {
		String processDefinitionKey = PROCESS_DEFINITION_KEY;

		HistoricProcessInstanceQuery historicProcessInstanceQuery = historyService.createHistoricProcessInstanceQuery();
		historicProcessInstanceQuery.processDefinitionKey(processDefinitionKey);
		historicProcessInstanceQuery.finished();
		historicProcessInstanceQuery.orderByProcessInstanceEndTime().desc();

		List<HistoricProcessInstance> historicProcessInstances = historicProcessInstanceQuery.list();
		// 单独 定义一个list，list中包括自定义的pojo(OrderCustom包括 流程实例 信息和业务系统 信息)
		List<AskLeaveCustom> askLeaveCustoms = new ArrayList<AskLeaveCustom>();
		for (HistoricProcessInstance historicProcessInstance : historicProcessInstances) {

			AskLeaveCustom askLeaveCustom = new AskLeaveCustom();

			// 比如key为采购流程，这个key就是采购单id
			String businesskey = historicProcessInstance.getBusinessKey();
			String askLeaveId = businesskey;
			// 根据 businessKey获取采购单信息
			AskLeave askLeave = dao.selectByPrimaryKey(askLeaveId);
			if(askLeave!=null){
				BeanUtils.copyProperties(askLeave, askLeaveCustom);
			}
		
			askLeaveCustom.setProcessInstanceStartTime(historicProcessInstance.getStartTime());
			askLeaveCustom.setProcessInstanceEndTime(historicProcessInstance.getEndTime());
			// 向orderCustom中填充流程实例 信息
			askLeaveCustom.setProcessInstanceId(historicProcessInstance.getSuperProcessInstanceId());
			// 当前运行的结点
			// orderCustom.setActivityId(historicProcessInstance.getActivityId());

			askLeaveCustoms.add(askLeaveCustom);

		}
		
		return askLeaveCustoms;

	}

	  
	    /**  
	    * @Title: findOrderTaskListByPid  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  
	    * @param @param processInstanceId
	    * @param @return    参数  
	    * @return List<AskLeaveCustom>    返回类型  
	    * @throws  
	    */  
	    
	public List<AskLeaveCustom> findTaskListByPid(String processInstanceId) {

			// 创建查询对象，用于查询历史 任务
			HistoricTaskInstanceQuery historicTaskInstanceQuery = historyService
					.createHistoricTaskInstanceQuery();

			// 设置查询条件
			// 设置taskAssignee只查询某个用户的历史 任务
			// historicTaskInstanceQuery.taskAssignee(taskAssignee);

			// 指定 流程定义 key，只查询该流程下所有流程实例 所有历史 任务
			String processDefinitionKey = PROCESS_DEFINITION_KEY;
			historicTaskInstanceQuery.processDefinitionKey(processDefinitionKey);

			// 指定 流程实例 id,只查询该 流程实例 执行的历史 任务，流程实例 的id可以完成也可以未完成的
			historicTaskInstanceQuery.processInstanceId(processInstanceId);

			// 添加排序，按照任务执行时间先后顺序
			historicTaskInstanceQuery.orderByHistoricTaskInstanceStartTime().asc();

			List<HistoricTaskInstance> list = historicTaskInstanceQuery.list();

			// 即使这里只查询activiti中的数据，不关联查询业务的数据，也要单独定义
			// List<OrderCustom>，为了通过service和activiti和控制层隔离（解耦）
			List<AskLeaveCustom> askLeaveCustoms = new ArrayList<AskLeaveCustom>();
			for (HistoricTaskInstance historicTaskInstance : list) {
				AskLeaveCustom askLeaveCustom = new AskLeaveCustom();

				askLeaveCustom.setTaskId(historicTaskInstance.getId());// 任务id
				askLeaveCustom.setTaskName(historicTaskInstance.getName());// 任务名称
				askLeaveCustom.setAssignee(historicTaskInstance.getAssignee());// 任务负责人
				askLeaveCustom.setTaskDefinitionKey(historicTaskInstance
						.getTaskDefinitionKey());// 任务标识
				askLeaveCustom.setTaskStartTime(historicTaskInstance.getStartTime());// 任务开始时间
				askLeaveCustom.setTaskEndTime(historicTaskInstance.getEndTime());// 任务结束时间

				askLeaveCustoms.add(askLeaveCustom);
			}
			return askLeaveCustoms;
	
	}

		  
		    /**  
		    * @Title: jumpAuditStatus  
		    * @Description: 实现流程的调整 退回或者直接结束等操作
		    * @param @param askLeave
		    * @param @param processDetail    参数  
		    * @return void    返回类型  
		    * @throws  
		    */  
		    
		public void jumpAuditStatus(String roleId,AskLeave askLeave, ProcessDetail processDetail,Integer action) {
			// TODO Auto-generated method stub
			
			Task task = taskService.createTaskQuery().taskId(askLeave.getTaskId()).taskAssignee(roleId).singleResult();
			processDetailMapper.insert(processDetail);
			if(action==1){//退回操作
				if (task != null) {
					
					if (askLeave.getAuditType().equals("sfsCheck")) {
						//
						 runtimeService.createChangeActivityStateBuilder()
				          .processInstanceId(askLeave.getProcessInstanceId())
				          .cancelActivityId(askLeave.getAuditType())// taskBefore subtask   taskAfter
				          .startActivityId("workerReport")
				          .changeState();
						
					} else if (askLeave.getAuditType().equals("jzkCheck")) {
						// 县矫正负责人审核
						 runtimeService.createChangeActivityStateBuilder()
				          .processInstanceId(askLeave.getProcessInstanceId())
				          .cancelActivityId(askLeave.getAuditType())// taskBefore subtask   taskAfter
				          .startActivityId("sfsCheck")
				          .changeState();
					} else if (askLeave.getAuditType().equals("xfgCheck")) {
						// 县分管领导 审核
						 runtimeService.createChangeActivityStateBuilder()
				          .processInstanceId(askLeave.getProcessInstanceId())
				          .cancelActivityId(askLeave.getAuditType())// taskBefore subtask   taskAfter
				          .startActivityId("jzkCheck")
				          .changeState();
					}
					
				}
			}else{//结束
				 runtimeService.createChangeActivityStateBuilder()
		          .processInstanceId(askLeave.getProcessInstanceId())
		          .cancelActivityId(askLeave.getAuditType())// taskBefore subtask   taskAfter
		          .startActivityId("endevent1")
		          .changeState();
			}
			
	       
			
		}
		
		
		public Integer xj(Culprit culprit){
			Integer isAskLeave=0;
			AskLeave askLeave=new AskLeave();
			askLeave.setCulpritId(culprit.getId());
			askLeave.setDicStatusKey(Constants.ASKLEAVE_STATUS_WXJ);
			List<AskLeave> askLeaveList=dao.selectAll(askLeave);
			if(askLeaveList!=null&&!askLeaveList.isEmpty()&&askLeaveList.get(0)!=null){
				isAskLeave=1;
				AskLeave askLeaveTemp=(AskLeave)askLeaveList.get(0);
				askLeaveTemp.setDicStatusKey(Constants.ASKLEAVE_STATUS_YXJ);
				if(askLeave.getEndDate()!=null&&DateUtils.getDateYmd(culprit.getReportDate()).getTime()<=askLeave.getEndDate().getTime()){
					askLeaveTemp.setIsOverdue(0);
				}else{
					askLeaveTemp.setIsOverdue(1);
				}
				dao.updateByPrimaryKey(askLeaveTemp);
			}
			return isAskLeave;
		}
		
		/**
		 * 3天内需销假的人数
		 * @return
		 */
		public int getXjCountBy3Day(){
			return dao.getXjCountBy3Day();
		}
		

}
