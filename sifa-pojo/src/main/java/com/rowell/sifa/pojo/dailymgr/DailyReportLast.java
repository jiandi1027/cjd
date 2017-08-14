/*
* DailyReportLast.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-04-09 created
*/
package com.rowell.sifa.pojo.dailymgr;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   日常报到(最后一次)
* @Author marcle
* @version 1.0 2017-04-09
 */
public class DailyReportLast extends DataEntity<DailyReportLast> implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -8082416067818314034L;

	/**ID */
    private String id;

    /**报到日期 */
    private Date reportDate;

    /**实际应报到日期 */
    private Date shouldReportDate;

    /**下次应报到日期 */
    private Date nextShouldReportDate;

    /**最新次报到结果 */
    private String reportResultId;

    /**数据字典报到类型结果 */
    private String dicTypeKey;

    /**数据字典是否按时报到,初始为 NULL,表示还没有做超时判断或者做报道操作 */
    private String dicOnscheduleKey;

    /**数据字典是否需要短信提示，如果需要，一般提前一天发短信 */
    private String dicSmsEnabledKey;

    /**数据字典是否开启 */
    private String dicEnabledKey;

    /**备注 */
    private String note;

    /**声音文件路劲 */
    private String voicePath;

    /**犯人 */
    private String culpritId;

    /**记录创建时间 */
    private Date createdTime;

    /**数据字典上报状态 */
    private String dicReportStatusKey;

    /**报告内容 */
    private String bgnr;

    /**记录人 */
    private String jlr;

    /**创建时间 */
    private Date created;

    /**创建人 */
    private String creater;

    /**更新时间 */
    private Date updated;

    /**更新人 */
    private String updater;

    /**删除标识 */
    private Integer delFlag;

    protected String culpritName;
    protected String groupId;
    protected String dicMonitorGradeKey;
    protected Date nextShouldReportDateStartDate;
    protected Date nextShouldReportDateEndDate;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }

    public Date getShouldReportDate() {
        return shouldReportDate;
    }

    public void setShouldReportDate(Date shouldReportDate) {
        this.shouldReportDate = shouldReportDate;
    }

    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getNextShouldReportDate() {
        return nextShouldReportDate;
    }

    public void setNextShouldReportDate(Date nextShouldReportDate) {
        this.nextShouldReportDate = nextShouldReportDate;
    }

    public String getReportResultId() {
        return reportResultId;
    }

    public void setReportResultId(String reportResultId) {
        this.reportResultId = reportResultId == null ? null : reportResultId.trim();
    }

    public String getDicTypeKey() {
        return dicTypeKey;
    }

    public void setDicTypeKey(String dicTypeKey) {
        this.dicTypeKey = dicTypeKey == null ? null : dicTypeKey.trim();
    }

    public String getDicOnscheduleKey() {
        return dicOnscheduleKey;
    }

    public void setDicOnscheduleKey(String dicOnscheduleKey) {
        this.dicOnscheduleKey = dicOnscheduleKey == null ? null : dicOnscheduleKey.trim();
    }

    public String getDicSmsEnabledKey() {
        return dicSmsEnabledKey;
    }

    public void setDicSmsEnabledKey(String dicSmsEnabledKey) {
        this.dicSmsEnabledKey = dicSmsEnabledKey == null ? null : dicSmsEnabledKey.trim();
    }

    public String getDicEnabledKey() {
        return dicEnabledKey;
    }

    public void setDicEnabledKey(String dicEnabledKey) {
        this.dicEnabledKey = dicEnabledKey == null ? null : dicEnabledKey.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getVoicePath() {
        return voicePath;
    }

    public void setVoicePath(String voicePath) {
        this.voicePath = voicePath == null ? null : voicePath.trim();
    }

    public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getDicReportStatusKey() {
        return dicReportStatusKey;
    }

    public void setDicReportStatusKey(String dicReportStatusKey) {
        this.dicReportStatusKey = dicReportStatusKey == null ? null : dicReportStatusKey.trim();
    }

    public String getBgnr() {
        return bgnr;
    }

    public void setBgnr(String bgnr) {
        this.bgnr = bgnr == null ? null : bgnr.trim();
    }

    public String getJlr() {
        return jlr;
    }

    public void setJlr(String jlr) {
        this.jlr = jlr == null ? null : jlr.trim();
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater == null ? null : creater.trim();
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public String getUpdater() {
        return updater;
    }

    public void setUpdater(String updater) {
        this.updater = updater == null ? null : updater.trim();
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

	public String getCulpritName() {
		return culpritName;
	}

	public void setCulpritName(String culpritName) {
		this.culpritName = culpritName;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getDicMonitorGradeKey() {
		return dicMonitorGradeKey;
	}

	public void setDicMonitorGradeKey(String dicMonitorGradeKey) {
		this.dicMonitorGradeKey = dicMonitorGradeKey;
	}

	public Date getNextShouldReportDateStartDate() {
		return nextShouldReportDateStartDate;
	}

	public void setNextShouldReportDateStartDate(Date nextShouldReportDateStartDate) {
		this.nextShouldReportDateStartDate = nextShouldReportDateStartDate;
	}

	public Date getNextShouldReportDateEndDate() {
		return nextShouldReportDateEndDate;
	}

	public void setNextShouldReportDateEndDate(Date nextShouldReportDateEndDate) {
		this.nextShouldReportDateEndDate = nextShouldReportDateEndDate;
	}
	
	
    
}