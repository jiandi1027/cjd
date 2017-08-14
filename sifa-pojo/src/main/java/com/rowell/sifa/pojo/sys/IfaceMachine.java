/*
* IfaceMachine.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.sys;

import java.io.Serializable;
import java.util.Date;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   考勤机设备列表
* @Author marcle
* @version 1.0 2017-03-16
 */
public class IfaceMachine extends DataEntity<IfaceMachine> implements Serializable {
   

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 8355088087916545205L;

	/**设备序列号 */
    private String macSn;

    /**设备名称 */
    private String macName;

    /**机号 */
    private String macNumber;

    /**上传考勤记录时间戳 */
    private String stamp;

    /**指纹仪使用司法所ID */
    private String groupId;

    /**上传用户数据时间戳 */
    private String opStamp;

    /**最后上传验证现场照片的记录时间戳标记 */
    private String photoStamp;

    /**为联网失败后重新联接服务器的间隔时间（秒） */
    private String errorDelay;

    /**为正常联网时联接服务器的间隔时间（秒） */
    private String delay;

    /**上传指定时刻 */
    private String transTimes;

    /**刷新间隔时间(分钟) */
    private String transInterval;

    /**指示设备向服务器传送哪些数据的标识 */
    private String transFlag;

    /**是否实时传送新记录 */
    private String realTime;

    /**是否加密传送数据 */
    private String encrypt;

    /**服务器版本号及时间 */
    private String serverVer;

    /**自动上传数据时间日戳 */
    private String tableNameStamp;

    /**考勤记录数 */
    private String attCount;

    /**员工数 */
    private String userCount;

    /**ip地址 */
    private String ipAddress;

    /**固件版本 */
    private String macVer;

    /**指纹算法标识 */
    private String macSoftNum;

    /**最大用户数 */
    private String maxUserCount;

    /**指纹数 */
    private String tmpCount;

    /**最新联机时间 */
    private Date newTime;

    protected String groupName;
   
    
    public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	
	
	public String getMacSn() {
        return macSn;
    }

    public void setMacSn(String macSn) {
        this.macSn = macSn == null ? null : macSn.trim();
    }

    public String getMacName() {
        return macName;
    }

    public void setMacName(String macName) {
        this.macName = macName == null ? null : macName.trim();
    }

    public String getMacNumber() {
        return macNumber;
    }

    public void setMacNumber(String macNumber) {
        this.macNumber = macNumber == null ? null : macNumber.trim();
    }

    public String getStamp() {
        return stamp;
    }

    public void setStamp(String stamp) {
        this.stamp = stamp == null ? null : stamp.trim();
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId == null ? null : groupId.trim();
    }

    public String getOpStamp() {
        return opStamp;
    }

    public void setOpStamp(String opStamp) {
        this.opStamp = opStamp == null ? null : opStamp.trim();
    }

    public String getPhotoStamp() {
        return photoStamp;
    }

    public void setPhotoStamp(String photoStamp) {
        this.photoStamp = photoStamp == null ? null : photoStamp.trim();
    }

    public String getErrorDelay() {
        return errorDelay;
    }

    public void setErrorDelay(String errorDelay) {
        this.errorDelay = errorDelay == null ? null : errorDelay.trim();
    }

    public String getDelay() {
        return delay;
    }

    public void setDelay(String delay) {
        this.delay = delay == null ? null : delay.trim();
    }

    public String getTransTimes() {
        return transTimes;
    }

    public void setTransTimes(String transTimes) {
        this.transTimes = transTimes == null ? null : transTimes.trim();
    }

    public String getTransInterval() {
        return transInterval;
    }

    public void setTransInterval(String transInterval) {
        this.transInterval = transInterval == null ? null : transInterval.trim();
    }

    public String getTransFlag() {
        return transFlag;
    }

    public void setTransFlag(String transFlag) {
        this.transFlag = transFlag == null ? null : transFlag.trim();
    }

    public String getRealTime() {
        return realTime;
    }

    public void setRealTime(String realTime) {
        this.realTime = realTime == null ? null : realTime.trim();
    }

    public String getEncrypt() {
        return encrypt;
    }

    public void setEncrypt(String encrypt) {
        this.encrypt = encrypt == null ? null : encrypt.trim();
    }

    public String getServerVer() {
        return serverVer;
    }

    public void setServerVer(String serverVer) {
        this.serverVer = serverVer == null ? null : serverVer.trim();
    }

    public String getTableNameStamp() {
        return tableNameStamp;
    }

    public void setTableNameStamp(String tableNameStamp) {
        this.tableNameStamp = tableNameStamp == null ? null : tableNameStamp.trim();
    }

    public String getAttCount() {
        return attCount;
    }

    public void setAttCount(String attCount) {
        this.attCount = attCount == null ? null : attCount.trim();
    }

    public String getUserCount() {
        return userCount;
    }

    public void setUserCount(String userCount) {
        this.userCount = userCount == null ? null : userCount.trim();
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress == null ? null : ipAddress.trim();
    }

    public String getMacVer() {
        return macVer;
    }

    public void setMacVer(String macVer) {
        this.macVer = macVer == null ? null : macVer.trim();
    }

    public String getMacSoftNum() {
        return macSoftNum;
    }

    public void setMacSoftNum(String macSoftNum) {
        this.macSoftNum = macSoftNum == null ? null : macSoftNum.trim();
    }

    public String getMaxUserCount() {
        return maxUserCount;
    }

    public void setMaxUserCount(String maxUserCount) {
        this.maxUserCount = maxUserCount == null ? null : maxUserCount.trim();
    }

    public String getTmpCount() {
        return tmpCount;
    }

    public void setTmpCount(String tmpCount) {
        this.tmpCount = tmpCount == null ? null : tmpCount.trim();
    }

    public Date getNewTime() {
        return newTime;
    }

    public void setNewTime(Date newTime) {
        this.newTime = newTime;
    }

    
}