/*
* CulpritWorkTj.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-04-17 created
*/
package com.rowell.sifa.pojo.statistics;


import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.rowell.sifa.pojo.base.ProcessEntity;

/**
 *   社区矫正统计报表（季表）
* @Author marcle
* @version 1.0 2017-04-17
 */
@SuppressWarnings("serial")
@JsonInclude(Include.NON_NULL)
public class CulpritWorkTj extends ProcessEntity<CulpritWorkTj> implements Serializable {

    /**统计季度 */
    private Date reportDate;
    

    /**部门编号 */
    private String groupId;

    /**司法所工作人员总数 */
    private Integer sfsgzryzs;

    /**司法行政编制数 */
    private Integer sfxzbz;

    /**地方行政编制数 */
    private Integer dfxzbz;

    /**事业编制数 */
    private Integer sybz;

    /**聘用人员数 */
    private Integer pyry;

    /**所有矫正对象总数 */
    private Integer allPersons;

    /**外出矫正对象数 */
    private Integer outPersons;

    /**备注 */
    private String note;

    /**司法所性质 */
    private String sfskind;

    /**记录上报时间 */
    private Date reportTime;

    /**数据字典报表状态 */
    private String dicState;

    /**退回原因 */
    private String returnReason;
    
    /**退回时间 */
    private Date returnTime;
    
    protected String groupName;
    //年份
    protected String year;
    //季度
    protected String jd;
    
    /**
	 * 部门级别
	 */
    protected String groupleave="3";//默认为3
    
    
    
    
    public Date getReturnTime() {
		return returnTime;
	}

	public void setReturnTime(Date returnTime) {
		this.returnTime = returnTime;
	}

	public String getReturnReason() {
		return returnReason;
	}

	public void setReturnReason(String returnReason) {
		this.returnReason = returnReason;
	}

	public String getGroupleave() {
		return groupleave;
	}

	public void setGroupleave(String groupleave) {
		this.groupleave = groupleave;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getJd() {
		return jd;
	}

	public void setJd(String jd) {
		this.jd = jd;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }
    @JsonFormat(pattern = "yyyy-MM",timezone="GMT+8")
    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId == null ? null : groupId.trim();
    }

    public Integer getSfsgzryzs() {
        return sfsgzryzs;
    }

    public void setSfsgzryzs(Integer sfsgzryzs) {
        this.sfsgzryzs = sfsgzryzs;
    }

    public Integer getSfxzbz() {
        return sfxzbz;
    }

    public void setSfxzbz(Integer sfxzbz) {
        this.sfxzbz = sfxzbz;
    }

    public Integer getDfxzbz() {
        return dfxzbz;
    }

    public void setDfxzbz(Integer dfxzbz) {
        this.dfxzbz = dfxzbz;
    }

    public Integer getSybz() {
        return sybz;
    }

    public void setSybz(Integer sybz) {
        this.sybz = sybz;
    }

    public Integer getPyry() {
        return pyry;
    }

    public void setPyry(Integer pyry) {
        this.pyry = pyry;
    }

    public Integer getAllPersons() {
        return allPersons;
    }

    public void setAllPersons(Integer allPersons) {
        this.allPersons = allPersons;
    }

    public Integer getOutPersons() {
        return outPersons;
    }

    public void setOutPersons(Integer outPersons) {
        this.outPersons = outPersons;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getSfskind() {
        return sfskind;
    }

    public void setSfskind(String sfskind) {
        this.sfskind = sfskind == null ? null : sfskind.trim();
    }
    @JsonFormat(pattern = "yyyy-MM",timezone="GMT+8")
    public Date getReportTime() {
        return reportTime;
    }
    
    public void setReportTime(Date reportTime) {
        this.reportTime = reportTime;
    }

	public String getDicState() {
		return dicState;
	}

	public void setDicState(String dicState) {
		this.dicState = dicState;
	}

   
}