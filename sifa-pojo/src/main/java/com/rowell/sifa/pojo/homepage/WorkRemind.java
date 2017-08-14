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
    
    //请假开始时间
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8") 
    protected Date askLeaveBeginDate;
    
    //请假结束时间
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8") 
    protected Date askLeaveEndDate;
    
    //手机定位数（严管人数）
    protected Integer ygAmont;
    //手机定位数（严管手机）
    protected Integer ygAmontSj;
    //手机定位数（严管手环）
    protected Integer ygAmontSh;
    //手机定位数（普管人数）
    protected Integer pgAmont;
    //手机定位数（普管手机）
    protected Integer pgAmontSj;
    //手机定位数（普管手环）
    protected Integer pgAmontSh;
    //手机定位数（特殊类人数）
    protected Integer tsAmont;
    //手机定位数（特殊类手机）
    protected Integer tsAmontSj;
    //手机定位数（特殊类手环）
    protected Integer tsAmontSh;
    //手机定位数（总数）
    protected Integer totalAmont;
    
    //查询事项
    protected String searchWorkRemindVal;
    
    
    
	
	public Date getAskLeaveBeginDate() {
		return askLeaveBeginDate;
	}

	public void setAskLeaveBeginDate(Date askLeaveBeginDate) {
		this.askLeaveBeginDate = askLeaveBeginDate;
	}

	public Date getAskLeaveEndDate() {
		return askLeaveEndDate;
	}

	public void setAskLeaveEndDate(Date askLeaveEndDate) {
		this.askLeaveEndDate = askLeaveEndDate;
	}

	public String getSearchWorkRemindVal() {
		return searchWorkRemindVal;
	}

	public void setSearchWorkRemindVal(String searchWorkRemindVal) {
		this.searchWorkRemindVal = searchWorkRemindVal;
	}

	public Integer getYgAmont() {
		return ygAmont;
	}

	public void setYgAmont(Integer ygAmont) {
		this.ygAmont = ygAmont;
	}

	public Integer getYgAmontSj() {
		return ygAmontSj;
	}

	public void setYgAmontSj(Integer ygAmontSj) {
		this.ygAmontSj = ygAmontSj;
	}

	public Integer getYgAmontSh() {
		return ygAmontSh;
	}

	public void setYgAmontSh(Integer ygAmontSh) {
		this.ygAmontSh = ygAmontSh;
	}

	public Integer getPgAmont() {
		return pgAmont;
	}

	public void setPgAmont(Integer pgAmont) {
		this.pgAmont = pgAmont;
	}

	public Integer getPgAmontSj() {
		return pgAmontSj;
	}

	public void setPgAmontSj(Integer pgAmontSj) {
		this.pgAmontSj = pgAmontSj;
	}

	public Integer getPgAmontSh() {
		return pgAmontSh;
	}

	public void setPgAmontSh(Integer pgAmontSh) {
		this.pgAmontSh = pgAmontSh;
	}

	public Integer getTsAmont() {
		return tsAmont;
	}

	public void setTsAmont(Integer tsAmont) {
		this.tsAmont = tsAmont;
	}

	public Integer getTsAmontSj() {
		return tsAmontSj;
	}

	public void setTsAmontSj(Integer tsAmontSj) {
		this.tsAmontSj = tsAmontSj;
	}

	public Integer getTsAmontSh() {
		return tsAmontSh;
	}

	public void setTsAmontSh(Integer tsAmontSh) {
		this.tsAmontSh = tsAmontSh;
	}

	public Integer getTotalAmont() {
		return totalAmont;
	}

	public void setTotalAmont(Integer totalAmont) {
		this.totalAmont = totalAmont;
	}

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