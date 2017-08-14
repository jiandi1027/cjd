
/**    
* @Title: ProcessEntity.java  
* @Package com.rowell.sifa.pojo.base  
* @Description: TODO(用一句话描述该文件做什么)  
* @author xiaoguang  
* @date 2017年3月19日  
* @version V1.0    
*/

package com.rowell.sifa.pojo.base;

import java.util.Date;

/**
 * @ClassName: ProcessEntity
 * @Description: 流程基类，涉及流程的继承此类
 * @author xiaoguang
 * @date 2017年3月19日
 * 
 */

public abstract class ProcessEntity<T> extends DataEntity<T> {
	private static final long serialVersionUID = -4449763424408165319L;
	private String taskId;// 任务ID

	private String taskName;// 任务名称

	private String taskDefinitionKey;// 任务定义的key

	private String assignee;// 指派人

	private String activityId;// 活动节点编号

	private String activityName;// 活动节点名称

	private String auditType;// 审核类型

	private Date processInstanceStartTime;

	private Date processInstanceEndTime;

	private Date taskStartTime;

	private Date taskEndTime;

	/*** 对应流程实例ID ***/
	private String processInstanceId;

	protected String processDefinitionId;

	/** 流程是否结束 默认不是结束 ****/
	private Integer isEnd = 0;

	/** 是否有权限处理 ***/
	private Integer hasPermission = 0;

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getTaskDefinitionKey() {
		return taskDefinitionKey;
	}

	public void setTaskDefinitionKey(String taskDefinitionKey) {
		this.taskDefinitionKey = taskDefinitionKey;
	}

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getAuditType() {
		return auditType;
	}

	public void setAuditType(String auditType) {
		this.auditType = auditType;
	}

	public Date getProcessInstanceStartTime() {
		return processInstanceStartTime;
	}

	public void setProcessInstanceStartTime(Date processInstanceStartTime) {
		this.processInstanceStartTime = processInstanceStartTime;
	}

	public Date getProcessInstanceEndTime() {
		return processInstanceEndTime;
	}

	public void setProcessInstanceEndTime(Date processInstanceEndTime) {
		this.processInstanceEndTime = processInstanceEndTime;
	}

	public Date getTaskStartTime() {
		return taskStartTime;
	}

	public void setTaskStartTime(Date taskStartTime) {
		this.taskStartTime = taskStartTime;
	}

	public Date getTaskEndTime() {
		return taskEndTime;
	}

	public void setTaskEndTime(Date taskEndTime) {
		this.taskEndTime = taskEndTime;
	}

	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}

	public Integer getIsEnd() {
		return isEnd;
	}

	public void setIsEnd(Integer isEnd) {
		this.isEnd = isEnd;
	}

	public String getProcessDefinitionId() {
		return processDefinitionId;
	}

	public void setProcessDefinitionId(String processDefinitionId) {
		this.processDefinitionId = processDefinitionId;
	}

	public Integer getHasPermission() {
		return hasPermission;
	}

	public void setHasPermission(Integer hasPermission) {
		this.hasPermission = hasPermission;
	}

}
