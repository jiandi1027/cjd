/*
* RemoveAlarm.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-08-08 created
*/
package com.rowell.sifa.pojo.monitoring;

import java.io.Serializable;
import java.util.Date;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   拆卸报警表
* @Author marcle
* @version 1.0 2017-08-08
 */
public class RemoveAlarm extends DataEntity<RemoveAlarm> implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = -1750391115909916194L;

	/**扣分 */
    private Double delMark;

    /**备注 */
    private String note;

    /**矫正人物id */
    private String culpritId;

    /**操作员id */
    private String accountId;

    /**历史轨迹id */
    private String terminalHisId;

	protected String culpritName;//人物姓名用于显示
	protected String groupName;//部门姓名用于显示
	protected String groupId;//部门id用于显示
	protected String lon;//经度
	protected String lat;//纬度
	protected String location;//拆卸地址
	protected Date gpsTime;//拆卸时间
    
    
    public Double getDelMark() {
        return delMark;
    }

    public void setDelMark(Double delMark) {
        this.delMark = delMark;
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

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId == null ? null : accountId.trim();
    }

    public String getTerminalHisId() {
        return terminalHisId;
    }

    public void setTerminalHisId(String terminalHisId) {
        this.terminalHisId = terminalHisId == null ? null : terminalHisId.trim();
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

	public String getLon() {
		return lon;
	}

	public void setLon(String lon) {
		this.lon = lon;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getGpsTime() {
		return gpsTime;
	}

	public void setGpsTime(Date gpsTime) {
		this.gpsTime = gpsTime;
	}
    
}