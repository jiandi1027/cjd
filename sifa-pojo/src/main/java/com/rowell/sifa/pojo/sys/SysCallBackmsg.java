/*
* CallBackmsg.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-05-02 created
*/
package com.rowell.sifa.pojo.sys;

import java.io.Serializable;
import java.util.Date;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   声纹回调信息反馈表
* @Author marcle
* @version 1.0 2017-05-02
 */
public class SysCallBackmsg extends DataEntity<SysCallBackmsg> implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = -681842461358145237L;

	/**回调方法 */
    private String method;

    /**声纹呼叫方式  0：电话报到  非0：注册认证 */
    private String operateid;

    /**声纹号码 */
    private String telno;

    /**回调状态 */
    private String state;

    /**声纹文件地址 */
    private String fileurl;

    /**创建时间 */
    private Date created;

    /**更新时间 */
    private Date updated;

    /**创建人 */
    private String creater;

    /**更新人 */
    private String updater;

    /**删除标识 */
    private Integer delFlag;


    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method == null ? null : method.trim();
    }

    public String getOperateid() {
        return operateid;
    }

    public void setOperateid(String operateid) {
        this.operateid = operateid == null ? null : operateid.trim();
    }

    public String getTelno() {
        return telno;
    }

    public void setTelno(String telno) {
        this.telno = telno == null ? null : telno.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public String getFileurl() {
        return fileurl;
    }

    public void setFileurl(String fileurl) {
        this.fileurl = fileurl == null ? null : fileurl.trim();
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater == null ? null : creater.trim();
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
}