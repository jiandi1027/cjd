/*
* ExceptionInfo.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-04-18 created
*/
package com.rowell.sifa.pojo.policeCheck;


import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.DataEntity;

public class ExceptionInfo extends DataEntity<ExceptionInfo> implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 7718478441481725309L;

	/**类型 */
    private String exceptionType;

    /**对象id */
    private String culpritId;

    /**详情 */
    private String details;

    /**发生时间 */
    private Date occurrenceTime;

    /**发生地点 */
    private String occurrencePlace;
    
    protected String culpritName;  //对象姓名
    protected String groupName;	   //对象直属司法所
    protected String groupId;	   //对象直属司法所
    protected String identification;//对象身份证
    protected Date createdTime;
    protected Date occurrenceStartDate;
    protected Date occurrenceEndDate;
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getExceptionType() {
        return exceptionType;
    }

    public void setExceptionType(String exceptionType) {
        this.exceptionType = exceptionType == null ? null : exceptionType.trim();
    }

    public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details == null ? null : details.trim();
    }

    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getOccurrenceTime() {
        return occurrenceTime;
    }

    public void setOccurrenceTime(Date occurrenceTime) {
        this.occurrenceTime = occurrenceTime;
    }

    public String getOccurrencePlace() {
        return occurrencePlace;
    }

    public void setOccurrencePlace(String occurrencePlace) {
        this.occurrencePlace = occurrencePlace == null ? null : occurrencePlace.trim();
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

	public String getIdentification() {
		return identification;
	}

	public void setIdentification(String identification) {
		this.identification = identification;
	}

	@JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public Date getOccurrenceStartDate() {
		return occurrenceStartDate;
	}

	public void setOccurrenceStartDate(Date occurrenceStartDate) {
		this.occurrenceStartDate = occurrenceStartDate;
	}

	public Date getOccurrenceEndDate() {
		return occurrenceEndDate;
	}

	public void setOccurrenceEndDate(Date occurrenceEndDate) {
		this.occurrenceEndDate = occurrenceEndDate;
	}
    
}