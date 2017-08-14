package com.rowell.sifa.pojo.monitoring;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.rowell.sifa.pojo.base.DataEntity;
/**
 * 越界警告
 * @author FWY
 * @version 1.0 2017-4-1
 */
public  class OverAlarm  extends DataEntity<OverAlarm> implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4237302138916681189L;

	/**
	 * 扣分
	 * 
	 */
	private BigDecimal delmark;

	/**
	 * 备注
	 * 
	 */
	private String note;

	/**
	 */
	private String culpritId;

	/**
	 * 历史轨迹表id
	 */
	private String terminalHisId;
	
	/**
	 * 是否请假，是则添加请假实例id
	 */
	private String askLeaveId;

	/**
	 * 操作员ID
	 */
	private String accountId;
	//是否请假
	protected String askLeaveflag;
	protected String culpritName;//人物姓名用于显示
	protected String groupName;//部门姓名用于显示
	protected String groupId;//部门id用于显示
	protected String lon;//经度
	protected String lat;//纬度
	protected String location;//定位地址
	protected Date gpsTime;//定位地址
	
	
	public Date getGpsTime() {
		return gpsTime;
	}


	public void setGpsTime(Date gpsTime) {
		this.gpsTime = gpsTime;
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
	
	public String getGroupId() {
		return groupId;
	}


	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getAskLeaveflag() {
		if(askLeaveId!=null&&askLeaveId!=""){
			return "是";
		}
		return "否";
	}

	public void setAskLeaveflag(String askLeaveflag) {
		this.askLeaveflag = askLeaveflag;
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

	public BigDecimal getDelmark() {
		return delmark;
	}


	public void setDelmark(BigDecimal delmark) {
		this.delmark = delmark;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}


	public String getCulpritId() {
		return culpritId;
	}


	public void setCulpritId(String culpritId) {
		this.culpritId = culpritId;
	}


	public String getAskLeaveId() {
		return askLeaveId;
	}


	public void setAskLeaveId(String askLeaveId) {
		this.askLeaveId = askLeaveId;
	}



	public String getAccountId() {
		return accountId;
	}


	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public int getReportStatus() {
		return reportStatus;
	}


	public void setReportStatus(int reportStatus) {
		this.reportStatus = reportStatus;
	}


	public Long getDealWayId() {
		return dealWayId;
	}


	public void setDealWayId(Long dealWayId) {
		this.dealWayId = dealWayId;
	}



	public String getTerminalHisId() {
		return terminalHisId;
	}


	public void setTerminalHisId(String terminalHisId) {
		this.terminalHisId = terminalHisId;
	}



	/**
	 * 上报状态
	 */
	private int reportStatus = 0;

	/**
	 * 重新犯罪类型
	 * 
	 */
	private Long dealWayId;



}
