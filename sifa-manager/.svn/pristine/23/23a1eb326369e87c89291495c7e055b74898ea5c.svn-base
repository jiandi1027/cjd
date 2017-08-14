/*
* escorted.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-05-18 created
*/
package com.rowell.sifa.pojo.sys;


import java.io.Serializable;
import java.util.Date;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   押送民警信息
* @Author marcle
* @version 1.0 2017-05-18
 */
@SuppressWarnings("serial")
public class EscortedPolice extends DataEntity<EscortedPolice> implements Serializable {
  

    /**押送民警姓名 */
    private String name;

    /**犯人id */
    private String culpritID;

    /**单位 */
    private String groupId;

    /**职位 */
    private String job;

    /**交接时间 */
    private Date escortDate;

    
    
    public String getCulpritID() {
		return culpritID;
	}

	public void setCulpritID(String culpritID) {
		this.culpritID = culpritID;
	}

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }


    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId == null ? null : groupId.trim();
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public Date getEscortDate() {
        return escortDate;
    }

    public void setEscortDate(Date escortDate) {
        this.escortDate = escortDate;
    }
}