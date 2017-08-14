
/**    
* @Title: ProcessUtils.java  
* @Package com.rowell.sifa.common.utils  
* @Description: TODO(用一句话描述该文件做什么)  
* @author xiaoguang  
* @date 2017年3月21日  
* @version V1.0    
*/

package com.rowell.sifa.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.flowable.engine.HistoryService;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.impl.RepositoryServiceImpl;
import org.flowable.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.flowable.engine.impl.persistence.entity.TaskEntity;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.IdentityLink;
import org.flowable.engine.task.Task;

import com.rowell.sifa.mapper.sys.SysGroupMapper;
import com.rowell.sifa.pojo.base.ProcessEntity;
import com.rowell.sifa.pojo.sys.SysGroup;

/**
 * @ClassName: ProcessUtils
 * @Description: 流程工具类
 * @author xiaoguang
 * @date 2017年3月21日
 * 
 */

public class ProcessUtils {
	
	
	/***
	 * 
	    * @Title: fillProcessInfo  
	    * @Description: 填充实体信息 
	    * @param @param t    参数  
	    * @return void    返回类型  
	    * @throws
	 */
	@SuppressWarnings("rawtypes")
	public static void fillProcessInfo(ProcessEntity t) {
		ProcessInstance rpi = SpringContextHolder.getApplicationContext().getBean(RuntimeService.class)//
				.createProcessInstanceQuery()// 创建流程实例查询对象
				.processInstanceId(t.getProcessInstanceId()).singleResult();
		
	
		if (rpi == null) {//判断流程是否结束
			t.setActivityName("结束");
			t.setIsEnd(1);
			
			 HistoricProcessInstance hpi = SpringContextHolder.getApplicationContext().getBean(HistoryService.class)//
                     .createHistoricProcessInstanceQuery()//
                     .processInstanceId(t.getProcessInstanceId())//使用流程实例ID查询
                     .singleResult();
			 t.setProcessDefinitionId(hpi.getProcessDefinitionId());
		}
		List<Task> tasks = SpringContextHolder.getApplicationContext().getBean(TaskService.class).createTaskQuery()
				.processInstanceId(t.getProcessInstanceId()).active().list();

		if (tasks != null && tasks.size() > 0) {
			// 当前运行的结点
			t.setActivityName(tasks.get(0).getName());
			t.setActivityId(tasks.get(0).getExecutionId());
			t.setActivityName(tasks.get(0).getName());
			t.setTaskId(tasks.get(0).getId());
			t.setAuditType(tasks.get(0).getTaskDefinitionKey());
			if(!StringUtils.isBlank(tasks.get(0).getAssignee())){
				if(tasks.get(0).getAssignee().equals(ProcessUtils.getRoleIdWithGroupId(SysAccountUtils.getSysAccount().getRoleId()))){
					t.setHasPermission(1);
				}
			}else{
				//是否具有候选人资格
				  List<IdentityLink> list1 = SpringContextHolder.getApplicationContext().getBean(TaskService.class).getIdentityLinksForTask(tasks.get(0).getId());
				  if(list1!=null){
					  for(IdentityLink identityLink:list1){
						  if(identityLink.getUserId().equals(ProcessUtils.getRoleIdWithGroupId(SysAccountUtils.getSysAccount().getRoleId()))){
							  t.setHasPermission(1);
							  break;
						  }
					  }
				  }
			}
			

		}
	}
	/**  
     * 驳回流程  
     *   
     * @param taskId  
     *            当前任务ID  
     * @param activityId  
     *            驳回节点ID  
     * @param variables  
     *            流程存储参数  
     * @throws Exception  
     */    
	 public static void backProcess(String taskId, String activityId,    
	            Map<String, Object> variables) throws Exception {
		 if (StringUtils.isEmpty(activityId)) {    
	            throw new Exception("驳回目标节点ID为空！");    
	        }    
	    
	        // 查找所有并行任务节点，同时驳回    
	        List<Task> taskList = findTaskListByKey(findProcessInstanceByTaskId(    
	                taskId).getId(), findTaskById(taskId).getTaskDefinitionKey());    
	        for (Task task : taskList) {    
	        	SpringContextHolder.getApplicationContext().getBean(RuntimeService.class).createChangeActivityStateBuilder()
	            .processInstanceId(findProcessInstanceByTaskId(taskId).getProcessInstanceId())
	            .cancelActivityId(findTaskById(taskId).getId())// taskBefore subtask   taskAfter
	            .startActivityId(activityId)
	            .changeState();   
	        }    
		 
	 }
	 /***
	  * 
	     * @Title: getRoleIdWithGroupId  
	     * @Description: 通过角色与部门编号结合，从而指定下一步要执行的权限
	     * @param @param roleId
	     * @param @return    参数  
	     * @return String    返回类型  
	     * @throws
	  */
	 public static String getRoleIdWithGroupId(String roleId){
		 String groupId = SysAccountUtils.getSysAccount().getGroupId();
		 SysGroup sysGroup = SpringContextHolder.getApplicationContext().getBean(SysGroupMapper.class).selectByPrimaryKey(groupId);
		 
		 SysGroup countyGroup = null;
		 if(sysGroup.getLevelNo()!=null && sysGroup.getLevelNo()==2){
			 countyGroup = new SysGroup(sysGroup.getParentId());
		 } else if(sysGroup.getLevelNo()!=null && sysGroup.getLevelNo()==1){
			 countyGroup = sysGroup;
		 }
		 
		 SysGroup  citySysGroup=null;
		 
		 if(sysGroup.getLevelNo()!=null && sysGroup.getLevelNo()==0){
			 citySysGroup = sysGroup;
		 }else if(sysGroup.getLevelNo()!=null && sysGroup.getLevelNo()==1){
			 citySysGroup = SpringContextHolder.getApplicationContext().getBean(SysGroupMapper.class).selectByPrimaryKey(sysGroup.getParentId());
		 }
		
		 if(Constants.ROLE_SFSGZRY.equals(roleId)){
			//"司法所工作人员"
			 return roleId+"_"+groupId;
		 }else if(Constants.ROLE_SFSFZR.equals(roleId)){
			//司法所负责人	
			 return roleId+"_"+groupId;
		 }else if(Constants.ROLE_XJZKGZRY.equals(roleId)){
			//县矫正科工作人员
			 return roleId+"_"+countyGroup.getId();
		 }else if(Constants.ROLE_XJZKFZR.equals(roleId)){
			//县矫正负责人
			 return roleId+"_"+countyGroup.getId();
		 }else if(Constants.ROLE_XFGLD.equals(roleId)){
			//县分管领导
			 return roleId+"_"+countyGroup.getId();
		 }else if(Constants.ROLE_XFZKFZR.equals(roleId)){
			//县法制科负责人
			 return roleId+"_"+countyGroup.getId();
		 }else if(Constants.ROLE_SFZCFZR.equals(roleId)){
			//市法制处负责人
			 return roleId+"_"+citySysGroup.getId();
		 }else if(Constants.ROLE_SJZCFZR.equals(roleId)){
			//市矫正处负责人
			 return roleId+"_"+citySysGroup.getId();
		 }else if(Constants.ROLE_SJZCGZRY.equals(roleId)){
			//市矫正处工作人员
			 return roleId+"_"+citySysGroup.getId();
		 }else if(Constants.ROLE_SJFGFLD.equals(roleId)){
			//市局分管副领导
			 return roleId+"_"+citySysGroup.getId();
		 }else if(Constants.ROLE_SJFGLD.equals(roleId)){
			//市局分管领导
			 return roleId+"_"+citySysGroup.getId();
		 }
//			//角色类型
//			//"司法所工作人员";
//			public static final String ROLE_SFSGZRY="3003";// 吴琴 123456
//			//司法所负责人		
//			public static final String ROLE_SFSFZR="3002";//陈翔 123456
//			//县矫正科工作人员
//			public static final String ROLE_XJZKGZRY="2007";//张玲玲123456
//			//县矫正负责人
//			public static final String ROLE_XJZKFZR="2006";//夏微微 123456
//			//县分管领导
//			public static final String ROLE_XFGLD="2002";//钱洁 123456
//			//县法制科负责人
//			public static final String ROLE_XFZKFZR="2003";// 万建斌 123456
//			public static final String ROLE_SFZCFZR="1003";//市法制处负责人
//			public static final String ROLE_SJZCFZR="1006";//市矫正处负责人
//			public static final String ROLE_SJZCGZRY="1007";//市矫正处工作人员
//			public static final String ROLE_SJFGFLD="1002";//市局分管副领导
//			public static final String ROLE_SJFGLD="1004";//市局分管领导
		 
		 return "";
		 
		 
	 }
	 
	 /***
	  * 
	     * @Title: getRoleIdWithGroupIdByBack  
	     * @Description: 通过角色与部门编号结合，从而指定下一步要执行的权限(仅限退回功能使用)
	     * @param roleId
	     * @param variablesTemp
	     * @return    参数  
	     * @return String    返回类型  
	     * @throws
	  */
	 public static String getRoleIdWithGroupIdByBack(String roleId, String taskId){
		 Map<String,Object> variablesTemp = SpringContextHolder.getApplicationContext().getBean(TaskService.class).getVariables(taskId);
		 
		 String groupId = (String)variablesTemp.get("groupId");
		 SysGroup sysGroup = null;
		 if (!StringUtils.isBlank(groupId)) {
			 sysGroup = SpringContextHolder.getApplicationContext().getBean(SysGroupMapper.class).selectByPrimaryKey(groupId);
		 }
		 
		 SysGroup countyGroup = null;
		 if(sysGroup != null){
			 countyGroup = new SysGroup(sysGroup.getParentId());
		 } else {
			 String countyId = (String)variablesTemp.get("countyId");
			 if (!StringUtils.isBlank(countyId)) {
				 countyGroup = SpringContextHolder.getApplicationContext().getBean(SysGroupMapper.class).selectByPrimaryKey(countyId);
			 }
		 }
		 
		 SysGroup citySysGroup=null;
		 if(countyGroup != null){
			 citySysGroup = new SysGroup(countyGroup.getParentId());
		 } else {
			 String cityId = (String)variablesTemp.get("cityId");
			 if (!StringUtils.isBlank(cityId)) {
				 citySysGroup = SpringContextHolder.getApplicationContext().getBean(SysGroupMapper.class).selectByPrimaryKey(cityId);
			 }
		 }
		
		 if(Constants.ROLE_SFSGZRY.equals(roleId)){
			//"司法所工作人员"
			 return roleId+"_"+groupId;
		 }else if(Constants.ROLE_SFSFZR.equals(roleId)){
			//司法所负责人	
			 return roleId+"_"+groupId;
		 }else if(Constants.ROLE_XJZKGZRY.equals(roleId)){
			//县矫正科工作人员
			 return roleId+"_"+countyGroup.getId();
		 }else if(Constants.ROLE_XJZKFZR.equals(roleId)){
			//县矫正负责人
			 return roleId+"_"+countyGroup.getId();
		 }else if(Constants.ROLE_XFGLD.equals(roleId)){
			//县分管领导
			 return roleId+"_"+countyGroup.getId();
		 }else if(Constants.ROLE_XFZKFZR.equals(roleId)){
			//县法制科负责人
			 return roleId+"_"+countyGroup.getId();
		 }else if(Constants.ROLE_SFZCFZR.equals(roleId)){
			//市法制处负责人
			 return roleId+"_"+citySysGroup.getId();
		 }else if(Constants.ROLE_SJZCFZR.equals(roleId)){
			//市矫正处负责人
			 return roleId+"_"+citySysGroup.getId();
		 }else if(Constants.ROLE_SJZCGZRY.equals(roleId)){
			//市矫正处工作人员
			 return roleId+"_"+citySysGroup.getId();
		 }else if(Constants.ROLE_SJFGFLD.equals(roleId)){
			//市局分管副领导
			 return roleId+"_"+citySysGroup.getId();
		 }else if(Constants.ROLE_SJFGLD.equals(roleId)){
			//市局分管领导
			 return roleId+"_"+citySysGroup.getId();
		 }
		 return "";
	 }
	 
	/**
	 * @throws Exception 
	 * @throws BeansException *
	 * 
	    * @Title: endProcess  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  
	    * @param     参数  
	    * @return void    返回类型  
	    * @throws
	 */
	public static void endProcess(String endActivityId,String taskId) throws Exception{
		TaskEntity taskEntity = findTaskById(taskId);
		SpringContextHolder.getApplicationContext().getBean(RuntimeService.class).createChangeActivityStateBuilder()
        .processInstanceId(findProcessInstanceByTaskId(taskId).getProcessInstanceId())
        .cancelActivityId(taskEntity.getTaskDefinitionKey())// taskBefore subtask   taskAfter
        .startActivityId(endActivityId)
        .changeState();
	}
	
	 /**  
     * 根据任务ID获取流程定义  
     *   
     * @param taskId  
     *            任务ID  
     * @return  
     * @throws Exception  
     */    
    public static ProcessDefinitionEntity findProcessDefinitionEntityByTaskId(    
            String taskId) throws Exception {    
        // 取得流程定义    
        ProcessDefinitionEntity processDefinition = (ProcessDefinitionEntity) ((RepositoryServiceImpl) SpringContextHolder.getApplicationContext().getBean(RepositoryService.class))    
                .getDeployedProcessDefinition(findTaskById(taskId)    
                        .getProcessDefinitionId());    
    
        if (processDefinition == null) {    
            throw new Exception("流程定义未找到!");    
        }    
    
        return processDefinition;    
    }    
    
    /**  
     * 根据任务ID获取对应的流程实例  
     *   
     * @param taskId  
     *            任务ID  
     * @return  
     * @throws Exception  
     */    
    public static ProcessInstance findProcessInstanceByTaskId(String taskId)    
            throws Exception {    
        // 找到流程实例    
        ProcessInstance processInstance =  SpringContextHolder.getApplicationContext().getBean(RuntimeService.class)   
                .createProcessInstanceQuery().processInstanceId(    
                        findTaskById(taskId).getProcessInstanceId())    
                .singleResult();    
        if (processInstance == null) {     
            throw new Exception("流程实例未找到!");    
        }    
        return processInstance;    
    }    
    
    /**  
     * 根据任务ID获得任务实例  
     *   
     * @param taskId  
     *            任务ID  
     * @return  
     * @throws Exception  
     */    
    private static TaskEntity findTaskById(String taskId) throws Exception {    
        TaskEntity task = (TaskEntity)  SpringContextHolder.getApplicationContext().getBean(TaskService.class).createTaskQuery().taskId(    
                taskId).singleResult();    
        if (task == null) {    
            throw new Exception("任务实例未找到!");    
        }    
        return task;    
    }    
    
    
    /**  
     * 根据流程实例ID和任务key值查询所有同级任务集合  
     *   
     * @param processInstanceId  
     * @param key  
     * @return  
     */    
    private static List<Task> findTaskListByKey(String processInstanceId, String key) {    
        return SpringContextHolder.getApplicationContext().getBean(TaskService.class).createTaskQuery().processInstanceId(    
                processInstanceId).taskDefinitionKey(key).list();    
    }    
    public static void main(String[] args) {
    	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	 Long ddd = 104156060417L;
         Date date = new Date(ddd);
         System.out.println(date);
         
	}

}
