/*
* Drift.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-07-07 created
*/
package com.rowell.sifa.pojo.monitoring;

import java.io.Serializable;
import java.util.Date;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   定位漂移数据
* @Author marcle
* @version 1.0 2017-07-07
 */
public class Drift extends DataEntity<Drift> implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 882918527832715955L;

	/**情况说明 */
    private String note;

    /**漂移经度 */
    private String oldLon;

    /**漂移纬度 */
    private String oldLat;

    /**漂移地址 */
    private String oldLocation;

    /**实际经度 */
    private String newLon;

    /**实际纬度 */
    private String newLat;

    /**实际地址 */
    private String newLocation;

    /**定位方式 */
    private String type;

    /**定位时间 */
    private Date gpstime;

    /**定位号码 */
    private String mobilenumber;

    /**矫正对象 */
    private String culpritId;
    

    /**矫正对象 */
    protected String culpritName;
    /**司法所名称 */
    protected String groupName;
    /**司法所id */
    protected String groupId;
    /**反馈人姓名 */
    protected String createrName;
    
    
    public String getCreaterName() {
		return createrName;
	}

	public void setCreaterName(String createrName) {
		this.createrName = createrName;
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

	public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getOldLon() {
        return oldLon;
    }

    public void setOldLon(String oldLon) {
        this.oldLon = oldLon == null ? null : oldLon.trim();
    }

    public String getOldLat() {
        return oldLat;
    }

    public void setOldLat(String oldLat) {
        this.oldLat = oldLat == null ? null : oldLat.trim();
    }

    public String getOldLocation() {
        return oldLocation;
    }

    public void setOldLocation(String oldLocation) {
        this.oldLocation = oldLocation == null ? null : oldLocation.trim();
    }

    public String getNewLon() {
        return newLon;
    }

    public void setNewLon(String newLon) {
        this.newLon = newLon == null ? null : newLon.trim();
    }

    public String getNewLat() {
        return newLat;
    }

    public void setNewLat(String newLat) {
        this.newLat = newLat == null ? null : newLat.trim();
    }

    public String getNewLocation() {
        return newLocation;
    }

    public void setNewLocation(String newLocation) {
        this.newLocation = newLocation == null ? null : newLocation.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Date getGpstime() {
        return gpstime;
    }

    public void setGpstime(Date gpstime) {
        this.gpstime = gpstime;
    }

    public String getMobilenumber() {
        return mobilenumber;
    }

    public void setMobilenumber(String mobilenumber) {
        this.mobilenumber = mobilenumber == null ? null : mobilenumber.trim();
    }

    public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }
}