  
    /**    
    * @Title: DeathService.java  
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

import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.runtime.ProcessInstanceQuery;
import org.flowable.engine.task.Task;
import org.flowable.engine.task.TaskQuery;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.endcorrect.DeathMapper;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.endcorrect.Death;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;
import com.rowell.sifa.service.sys.SysFileService;

/**  
    * @ClassName: DeathService  
    * @Description: 死亡登记service  
    * @author xiaoguang  
    * @date 2017年3月16日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class DeathService extends CrudService<DeathMapper, Death> {
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private SysFileService sysFileService;
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;
	private static String PROCESS_DEFINITION_KEY = "death";
	
	/**
	 * 创建一个死亡登记流程实例
	 */
	@Transactional(readOnly = false)
	public int insertMore(Death record, List<SysFile> fileList) {
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
		
		sysFileService.saveFiles(fileList, Constants.FILE_TABLE_DEATH, record.getId(), Constants.FILE_DEATH_PATH);
		examinationAndApprovalService.insertProcess(record.getId(),record.getCulpritId(),record.getProcessInstanceId(),Constants.PROCESS_TYPE_DEATH);
		return dao.insertSelective(record);
	}
	
	/**
	 * 判断审批操作添加下一个审批人
	 * @param roleId
	 * @param death
	 * @param processDetail
	 */
	@Transactional(readOnly = false)
	public void saveDeathAuditStatus(String roleId, Death death,ProcessDetail processDetail, Boolean isUpdate, List<SysFile> fileList) {
		Task task = taskService.createTaskQuery().taskId(death.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();
		
		if (isUpdate) {
			dao.updateByPrimaryKeySelective(death);
		}
		if (fileList != null && fileList.size() > 0) {
			sysFileService.saveFiles(fileList, Constants.FILE_TABLE_DEATH, death.getId(), Constants.FILE_DEATH_PATH);
		}
		
		if (task != null) {
			
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(death.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			
			// 说明assignee是该任务的办理人，有权限完成3002
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核workerReport
			
			if(death.getAuditType().equals("sfsSb")){
				//司法所上报
				variables.put("groupId", SysAccountUtils.getSysAccount().getGroupId());
				variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (death.getAuditType().equals("sfsCheck")) {
				//司法所审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
				}else {
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}
				
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (death.getAuditType().equals("xjzkCheck")) {
				// 县矫正负责人审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_SFSFZR, task.getId()));
				}else {
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));
				}
				
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (death.getAuditType().equals("xfgCheck")) {
				// 县分管领导 审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (death.getAuditType().equals("xgzryprint")) {
				// 县工作人员
				Culprit culprit = culpritService.findById(death.getCulpritId());
			
				culprit.setDicStatusKey(Constants.CULPRIT_STATUS_SW);//更改矫正状态为死亡
				culpritService.updateByIdSelective(culprit);
				
				
			}
			// 提交审核时，设置流程变量，变量值就是审核 信息
			if("0".equals(processDetail.getDicDecideType())){
				try {
					ProcessUtils.endProcess("endevent1", death.getTaskId());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				taskService.complete(death.getTaskId(), variables);
			}
		}
	}

	public List<Death> findActivityList() throws Exception {

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
		List<Death> orderList = new ArrayList<Death>();
		for (ProcessInstance processInstance : list) {

			Death death1 = new Death();

			// 比如key为采购流程，这个key就是采购单id
			String businesskey = processInstance.getBusinessKey();

			// 根据 businessKey获取采购单信息
			Death death = dao.selectByPrimaryKey(businesskey);
			// 将采购单信息拷贝到orderCustom中
			BeanUtils.copyProperties(death, death1);

			// 向orderCustom中填充流程实例 信息
			
			 Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).active().singleResult();  
	               

			// 当前运行的结点
			 death1.setProcessInstanceId(processInstance.getProcessInstanceId());
			 death1.setActivityId(task.getExecutionId());
			 death1.setActivityName(task.getName());

			orderList.add(death1);

		}
		return orderList;
	}
	
	public List<Death> findDeathTaskList(String roleId) {
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

		List<Death> deaths = new ArrayList<Death>();

		for (Task task : list) {
			Death death1 = new Death();
			// 流程实例id
			String processInstanceId = task.getProcessInstanceId();
			// 根据流程实例id找到流程实例对象
			ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
					.processInstanceId(processInstanceId).singleResult();
			// 从流程实例对象中获取businessKey
			String businessKey = processInstance.getBusinessKey();

			String deathId = businessKey;
			// 根据 businessKey获取采购单信息
			Death death = dao.selectByPrimaryKey(deathId);
			BeanUtils.copyProperties(death, death1);

			// 根据businessKey查询业务系统
			// ....
			death1.setAssignee(task.getAssignee());
			death1.setTaskId(task.getId());
			death1.setTaskDefinitionKey(task.getTaskDefinitionKey());
			death1.setTaskName(task.getName());

			deaths.add(death1);
			System.out.println("-------------------------------");
			System.out.println("流程实例id：" + task.getProcessInstanceId());
			System.out.println("任务 id：" + task.getId());
			System.out.println("任务标识：" + task.getTaskDefinitionKey());
			System.out.println("任务负责人：" + task.getAssignee());
			System.out.println("任务名称：" + task.getName());
			System.out.println("任务创建时间：" + task.getCreateTime());
		}

		return deaths;
	}


}
