/*
* NoDeal.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-04-16 created
*/
package com.rowell.sifa.pojo.rewardspunishment;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.ProcessEntity;

/**
 *   工作提醒（待处理）
* @Author marcle
* @version 1.0 2017-04-16
 */

public class NoDeal extends ProcessEntity<NoDeal> implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -1877907309458962798L;


    /**产生此次提醒的行为id */
    private String behaviorId;

    /**sf_behavior_manage的id */
    private String beManageId;


    /**违纪时间 */
    private Date disciplinaryTime;

    /**处理时间 */
    private Date processingTime;

    /**事项提醒类型 */
    private String eventReminderType;

    /**不予处理原因 */
    private String reason;

    /**处理人 */
    private String processingPeople;

    /**处理人电话 */
    private String processingTelephone;

    /**具体原因 */
    private String specificReasons;

    /**详细描述 */
    private String description;

    /**整改人 */
    private String rectificationMan;

    /**整改时间 */
    private Date rectificationDate;

    /**整改原因 */
    private String rectificationReasons;

    /**矫正对象 */
    private String culpritId;
    
    protected String culpritName;  //对象姓名
    protected String groupName;	   //对象直属司法所
    protected String groupId;	   //对象直属司法所
    private String rectificationManName;
    
    /** 矫正开始时间*/
    protected Date redressStartDate;
	/** 矫正结束时间*/
    protected Date redressEndDate;

	public String getBehaviorId() {
		return behaviorId;
	}

	public void setBehaviorId(String behaviorId) {
		this.behaviorId = behaviorId;
	}

	public String getBeManageId() {
		return beManageId;
	}

	public void setBeManageId(String beManageId) {
		this.beManageId = beManageId;
	}

	public Date getDisciplinaryTime() {
		return disciplinaryTime;
	}

	public void setDisciplinaryTime(Date disciplinaryTime) {
		this.disciplinaryTime = disciplinaryTime;
	}

	public Date getProcessingTime() {
		return processingTime;
	}

	public void setProcessingTime(Date processingTime) {
		this.processingTime = processingTime;
	}

	public String getEventReminderType() {
		return eventReminderType;
	}

	public void setEventReminderType(String eventReminderType) {
		this.eventReminderType = eventReminderType;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getProcessingPeople() {
		return processingPeople;
	}

	public void setProcessingPeople(String processingPeople) {
		this.processingPeople = processingPeople;
	}

	public String getProcessingTelephone() {
		return processingTelephone;
	}

	public void setProcessingTelephone(String processingTelephone) {
		this.processingTelephone = processingTelephone;
	}

	public String getSpecificReasons() {
		return specificReasons;
	}

	public void setSpecificReasons(String specificReasons) {
		this.specificReasons = specificReasons;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRectificationMan() {
		return rectificationMan;
	}

	public void setRectificationMan(String rectificationMan) {
		this.rectificationMan = rectificationMan;
	}

	public Date getRectificationDate() {
		return rectificationDate;
	}

	public void setRectificationDate(Date rectificationDate) {
		this.rectificationDate = rectificationDate;
	}

	public String getRectificationReasons() {
		return rectificationReasons;
	}

	public void setRectificationReasons(String rectificationReasons) {
		this.rectificationReasons = rectificationReasons;
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

	@JsonFormat(pattern = "yyyy-MM-dd")
	public Date getRedressStartDate() {
		return redressStartDate;
	}

	public void setRedressStartDate(Date redressStartDate) {
		this.redressStartDate = redressStartDate;
	}

	@JsonFormat(pattern = "yyyy-MM-dd")
	public Date getRedressEndDate() {
		return redressEndDate;
	}

	public void setRedressEndDate(Date redressEndDate) {
		this.redressEndDate = redressEndDate;
	}

	public String getRectificationManName() {
		return rectificationManName;
	}

	public void setRectificationManName(String rectificationManName) {
		this.rectificationManName = rectificationManName;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

}