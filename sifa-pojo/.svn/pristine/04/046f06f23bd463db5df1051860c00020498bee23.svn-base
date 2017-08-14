package com.rowell.sifa.pojo.monitoring;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.DataEntity;

/**
 * 位置监控历史轨迹类
 * 
 * @author FWY
 * @version 1.0 2017-03-23
 */
public class TerminalHistory extends DataEntity<TerminalHistory> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 630121429771063611L;
	private float lon;// 经度
	private float lat;// 纬度
	private Date gpstime;// 定位时间
	private String location;// 定位地点
	private String errorCode;// 错误码
	private String mobileNumber;// 定位号
	private String terminalId;// 定位关联类
	private Date rcvtime;// 接收时间
	private String isLive;// 是否在线
	private String power;// 电量 |0xff 表示充电中 |0xfe 表示低电压 |0-100 表示设备电量
	private String isAlarm;// 拆卸报警
	private String heartRate;// 心率
	private Date locationTime;// 定位时间
	private String locationType;// 定位类型 1：基站定位 2：wifi定位 3：GPS定位4：APP定位

	protected String type;// 定位方式
	protected String culpritId;	//矫正对象id
	protected String culpritName;//矫正对象姓名
	protected String groupName;// 司法所名称
	protected String groupId;// 司法所id
	protected float lonReal;//高德经度
	protected float latReal;//高德纬度
	

	public String getCulpritId() {
		return culpritId;
	}

	public void setCulpritId(String culpritId) {
		this.culpritId = culpritId;
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
	
	public float getLonReal() {
		return lonReal;
	}

	public void setLonReal(float lonReal) {
		this.lonReal = lonReal;
	}

	public float getLatReal() {
		return latReal;
	}

	public void setLatReal(float latReal) {
		this.latReal = latReal;
	}
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power;
	}

	public String getIsAlarm() {
		return isAlarm;
	}

	public void setIsAlarm(String isAlarm) {
		this.isAlarm = isAlarm;
	}

	public String getHeartRate() {
		return heartRate;
	}

	public void setHeartRate(String heartRate) {
		this.heartRate = heartRate;
	}

	public Date getGpstime() {
		return gpstime;
	}

	public void setGpstime(Date gpstime) {
		this.gpstime = gpstime;
	}

	public Date getRcvtime() {
		return rcvtime;
	}

	public void setRcvtime(Date rcvtime) {
		this.rcvtime = rcvtime;
	}

	public String getLocationType() {
		return locationType;
	}

	public void setLocationType(String locationType) {
		this.locationType = locationType;
	}

	public String getTerminalId() {
		return terminalId;
	}

	public void setTerminalId(String terminalId) {
		this.terminalId = terminalId;
	}

	public String getCulpritName() {
		return culpritName;
	}

	public void setCulpritName(String culpritName) {
		this.culpritName = culpritName;
	}

	public float getLon() {
		return lon;
	}

	public void setLon(float lon) {
		this.lon = lon;
	}

	public float getLat() {
		return lat;
	}

	public void setLat(float lat) {
		this.lat = lat;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getIsLive() {
		return isLive;
	}

	public void setIsLive(String isLive) {
		this.isLive = isLive;
	}

	public Date getLocationTime() {
		return locationTime;
	}

	public void setLocationTime(Date locationTime) {
		this.locationTime = locationTime;
	}
}
