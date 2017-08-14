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
import com.rowell.sifa.pojo.base.DataEntity;

@SuppressWarnings("serial")
public class WorkRemind extends DataEntity<WorkRemind> implements Serializable {

    /**数据字典待处理类型id */
    private String dicType;

    /**任务产生时间 */
   /* @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8") 
    private Date taskDate;*/

    /**矫正期满时间 */
   /* @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8") 
    private Date correctDate;*/

    /**对应待处理事项实体类id */
    private String recordId;
    /*矫正对象id*/
    private String culpritId;
    
    //数据字典处理结果
    private String dicWorkResult;
    
    /**任务产生时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8") 
    private Date taskDate;
    
    protected String culpritName;
    
    protected String groupName;
    
    protected String groupId;
    //司法局报到时间
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8") 
    protected Date culpritCreated;
    
    //期满解矫时间
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8") 
    protected Date culpritRedressEndDate;
    
    //日常报到下一次报到时间
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8") 
    protected Date nextShouldReportDateStartDate;
    
    

	public Date getNextShouldReportDateStartDate() {
		return nextShouldReportDateStartDate;
	}

	public void setNextShouldReportDateStartDate(Date nextShouldReportDateStartDate) {
		this.nextShouldReportDateStartDate = nextShouldReportDateStartDate;
	}

	public Date getCulpritRedressEndDate() {
		return culpritRedressEndDate;
	}

	public void setCulpritRedressEndDate(Date culpritRedressEndDate) {
		this.culpritRedressEndDate = culpritRedressEndDate;
	}

	public Date getCulpritCreated() {
		return culpritCreated;
	}

	public void setCulpritCreated(Date culpritCreated) {
		this.culpritCreated = culpritCreated;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public Date getTaskDate() {
		return taskDate;
	}

	public void setTaskDate(Date taskDate) {
		this.taskDate = taskDate;
	}

	public String getDicWorkResult() {
		return dicWorkResult;
	}

	public void setDicWorkResult(String dicWorkResult) {
		this.dicWorkResult = dicWorkResult;
	}

	public String getDicType() {
		return dicType;
	}

	public void setDicType(String dicType) {
		this.dicType = dicType;
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
    
    
	
}