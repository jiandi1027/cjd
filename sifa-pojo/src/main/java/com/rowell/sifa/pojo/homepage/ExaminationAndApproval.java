/*
* ExaminationAndApproval.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-04-17 created
*/
package com.rowell.sifa.pojo.homepage;

/**
 * 待审批事项
 */
import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.ProcessEntity;

@SuppressWarnings("serial")
public class ExaminationAndApproval extends ProcessEntity<ExaminationAndApproval> implements Serializable {
	/** 申请司法所 */
	private String judicialOffices;

	/** 类型 */
	private String type;

	/** 任务产生时间 */
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date taskDate;

	/** 矫正期满时间 */
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date correctDate;

	/** 对应申请实体类id */
	private String recordId;

	private String culpritId;

	protected String culpritName;

	protected String groupName;

	protected String roleId;
	//待审批数量
	protected int examAndAppListSize;
	//待处理数量
	protected int workRemindListSize;

	
	public int getExamAndAppListSize() {
		return examAndAppListSize;
	}

	public void setExamAndAppListSize(int examAndAppListSize) {
		this.examAndAppListSize = examAndAppListSize;
	}

	public int getWorkRemindListSize() {
		return workRemindListSize;
	}

	public void setWorkRemindListSize(int workRemindListSize) {
		this.workRemindListSize = workRemindListSize;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getRecordId() {
		return recordId;
	}

	public void setRecordId(String recordId) {
		this.recordId = recordId;
	}

	public String getCulpritId() {
		return culpritId;
	}

	public void setCulpritId(String culpritId) {
		this.culpritId = culpritId;
	}

	public String getCulpritName() {
		return culpritName;
	}

	public void setCulpritName(String culpritName) {
		this.culpritName = culpritName;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getJudicialOffices() {
		return judicialOffices;
	}

	public void setJudicialOffices(String judicialOffices) {
		this.judicialOffices = judicialOffices == null ? null : judicialOffices.trim();
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type == null ? null : type.trim();
	}

	public Date getTaskDate() {
		return taskDate;
	}

	public void setTaskDate(Date taskDate) {
		this.taskDate = taskDate;
	}

	public Date getCorrectDate() {
		return correctDate;
	}

	public void setCorrectDate(Date correctDate) {
		this.correctDate = correctDate;
	}
}