/*
* ThinkReport.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-17 created
*/
package com.rowell.sifa.pojo.dailymgr;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   思想汇报
* @Author marcle
* @version 1.0 2017-03-17
 */
public class ThinkReport extends DataEntity<ThinkReport> implements Serializable {
   
    /**
	 * 
	 */
	private static final long serialVersionUID = 7765707201286388998L;

	/**汇报日期 */
    private Date reportDate;

    /**数据字典汇报方式 */
    private String dicReportTypeKey;

    /**NOTE_PERSON */
    private String notePerson;

    /**汇报文件路径 */
    private String filePath;

    /**犯人 */
    private String culpritId;

    /**是否完成 */
    private String dicIscompliedKey;

    /**数据字典汇报状态<按时-过期-未上报> */
    private String dicReportStatusKey;

    /**备注 */
    private String note;

    /**司法所工作人员 */
    private String assessManager;

    /**文檔/附件关联对象 */
    private String documentId;
    
    protected String culpritName;
    protected String groupName;
    protected String groupId;

   
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }

    public String getDicReportTypeKey() {
        return dicReportTypeKey;
    }

    public void setDicReportTypeKey(String dicReportTypeKey) {
        this.dicReportTypeKey = dicReportTypeKey == null ? null : dicReportTypeKey.trim();
    }

    public String getNotePerson() {
        return notePerson;
    }

    public void setNotePerson(String notePerson) {
        this.notePerson = notePerson == null ? null : notePerson.trim();
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath == null ? null : filePath.trim();
    }

    public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getDicIscompliedKey() {
        return dicIscompliedKey;
    }

    public void setDicIscompliedKey(String dicIscompliedKey) {
        this.dicIscompliedKey = dicIscompliedKey == null ? null : dicIscompliedKey.trim();
    }

    public String getDicReportStatusKey() {
        return dicReportStatusKey;
    }

    public void setDicReportStatusKey(String dicReportStatusKey) {
        this.dicReportStatusKey = dicReportStatusKey == null ? null : dicReportStatusKey.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getAssessManager() {
        return assessManager;
    }

    public void setAssessManager(String assessManager) {
        this.assessManager = assessManager == null ? null : assessManager.trim();
    }

    public String getDocumentId() {
        return documentId;
    }

    public void setDocumentId(String documentId) {
        this.documentId = documentId == null ? null : documentId.trim();
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

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

}