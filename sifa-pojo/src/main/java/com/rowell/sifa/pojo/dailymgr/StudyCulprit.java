/*
* StudyCulprit.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-17 created
*/
package com.rowell.sifa.pojo.dailymgr;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   集中学习与对象的关联
* @Author marcle
* @version 1.0 2017-03-17
 */
public class StudyCulprit extends DataEntity<StudyCulprit> implements Serializable {
  

    /**
	 * 
	 */
	private static final long serialVersionUID = 8631151274724097055L;

	/**犯人 */
    private String culpritId;

    /**study表关联id */
    private String groupstudyId;

    /**学习教育表现 */
    private String statusId;

    protected String culpritName;

    protected Study study;
    
    public Study getStudy() {
		return study;
	}

	public void setStudy(Study study) {
		this.study = study;
	}

	public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getGroupstudyId() {
        return groupstudyId;
    }

    public void setGroupstudyId(String groupstudyId) {
        this.groupstudyId = groupstudyId == null ? null : groupstudyId.trim();
    }

    public String getStatusId() {
        return statusId;
    }

    public void setStatusId(String statusId) {
        this.statusId = statusId == null ? null : statusId.trim();
    }

	public String getCulpritName() {
		return culpritName;
	}

	public void setCulpritName(String culpritName) {
		this.culpritName = culpritName;
	}

}