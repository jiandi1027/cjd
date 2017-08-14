package com.rowell.sifa.pojo.monitoring;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;
/**
 * 位置监控实时轨迹类
 * @author FWY
 *@version 1.0 2017-03-23
 */
public class Terminal extends DataEntity<Terminal> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String culpritId;//用户id
	private String iconId;//图标id
	private String mobileNumber;//定位号
	private String type;//终端类型:手机-定位手环
	private String remark;//备注
	private String intervalTime;//定位间隔
	
	protected String areaId;
	protected String culpritName;
	protected String groupId;
	protected String groupName;
	protected String isLive;//当前状态
	protected String locationType;//定位方式
	protected String dicMonitorGradeKey;// 监管等级
	protected String askLeave;// 是否请假
	protected String over;// 是否越界
	
	
	public String getAreaId() {
		return areaId;
	}
	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}
	public String getIsLive() {
		return isLive;
	}
	public void setIsLive(String isLive) {
		this.isLive = isLive;
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
	public String getCulpritId() {
		return culpritId;
	}
	public void setCulpritId(String culpritId) {
		this.culpritId = culpritId;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getIconId() {
		return iconId;
	}
	public void setIconId(String iconId) {
		this.iconId = iconId;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getIntervalTime() {
		return intervalTime;
	}
	public void setIntervalTime(String intervalTime) {
		this.intervalTime = intervalTime;
	}
	public String getLocationType() {
		return locationType;
	}
	public void setLocationType(String locationType) {
		this.locationType = locationType;
	}
	public String getDicMonitorGradeKey() {
		return dicMonitorGradeKey;
	}
	public void setDicMonitorGradeKey(String dicMonitorGradeKey) {
		this.dicMonitorGradeKey = dicMonitorGradeKey;
	}
	public String getAskLeave() {
		return askLeave;
	}
	public void setAskLeave(String askLeave) {
		this.askLeave = askLeave;
	}
	public String getOver() {
		return over;
	}
	public void setOver(String over) {
		this.over = over;
	}

}
