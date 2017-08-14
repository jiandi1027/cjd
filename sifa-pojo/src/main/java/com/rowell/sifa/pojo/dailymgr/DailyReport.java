/*
* DailyReport.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-04-09 created
*/
package com.rowell.sifa.pojo.dailymgr;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.DataEntity;
/***
 * 
    * @ClassName: DailyReport  
    * @Description: 日常报道 
    * @author xiaoguang  
    * @date 2017年4月12日  
    *
 */
public class DailyReport extends DataEntity<DailyReport> implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1842370300939452835L;

	/**ID */
    private String id;

    /**报到日期 */
    private Date reportDate;

    /**数据字典报到方式 */
    private String dicTypeKey;

    /**数据字典是否按时报到,初始为 NULL,表示还没有做超时判断或者做报道操作 */
    private String dicOnscheduleKey;

    /**备注 */
    private String note;

    /**犯人 */
    private String culpritId;

    /**上报状态 */
    private Long reportStatus;

    /**应该报到日期 */
    private Date shouldReportDate;

    /**数据字典报到状态,0按时报到，1未按时报到，2未报到 */
    private String dicReportStatusKey;

    /**报告内容 */
    private String bgnr;

    /**记录人 */
    private String jlr;

    /**声音文件路劲 */
    private String voicePath;

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
    protected String dicOldMonitorGradeKey;
    protected String groupId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
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

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public Long getReportStatus() {
        return reportStatus;
    }

    public void setReportStatus(Long reportStatus) {
        this.reportStatus = reportStatus;
    }

    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getShouldReportDate() {
        return shouldReportDate;
    }

    public void setShouldReportDate(Date shouldReportDate) {
        this.shouldReportDate = shouldReportDate;
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

    public String getVoicePath() {
        return voicePath;
    }

    public void setVoicePath(String voicePath) {
        this.voicePath = voicePath == null ? null : voicePath.trim();
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

	public String getDicOldMonitorGradeKey() {
		return dicOldMonitorGradeKey;
	}

	public void setDicOldMonitorGradeKey(String dicOldMonitorGradeKey) {
		this.dicOldMonitorGradeKey = dicOldMonitorGradeKey;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
    
    
}