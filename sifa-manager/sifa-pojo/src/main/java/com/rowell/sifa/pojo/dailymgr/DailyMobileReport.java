/*
* DailyMobileReport.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-05-03 created
*/
package com.rowell.sifa.pojo.dailymgr;

import java.io.Serializable;
import java.util.Date;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   电话报到表
* @Author marcle
* @version 1.0 2017-05-03
 */
public class DailyMobileReport extends DataEntity<DailyMobileReport> implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 3999350790528577251L;

	/**矫正人员id */
    private String culpritId;

    /**数据字典电话报到状态 */
    private String dicMobilereportId;

    /**录音文件地址 */
    private String filepath;

    /**未知号码？？？ */
    private String caller;

    /**电话报到号码 */
    private String called;

    /**电话报到开始时间 */
    private Date starttime;

    /**电话报到结束时间 */
    private Date endtime;

    /**电话报到提问时间 */
    private Date connecttime;

    /**创建时间 */
    private Date created;

    /**更新时间 */
    private Date updated;

    /**创建人 */
    private String creater;

    /**更新人 */
    private String updater;
    
    //矫正人员name
    protected String culpritName;
	//矫正人员司法所id
    protected String groupId;
    //矫正人员司法所name
    protected String groupName;

    

    public String getCulpritName() {
		return culpritName;
	}

	public void setCulpritName(String culpritName) {
		this.culpritName = culpritName;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
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
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getDicMobilereportId() {
        return dicMobilereportId;
    }

    public void setDicMobilereportId(String dicMobilereportId) {
        this.dicMobilereportId = dicMobilereportId == null ? null : dicMobilereportId.trim();
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath == null ? null : filepath.trim();
    }

    public String getCaller() {
        return caller;
    }

    public void setCaller(String caller) {
        this.caller = caller == null ? null : caller.trim();
    }

    public String getCalled() {
        return called;
    }

    public void setCalled(String called) {
        this.called = called == null ? null : called.trim();
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Date getConnecttime() {
        return connecttime;
    }

    public void setConnecttime(Date connecttime) {
        this.connecttime = connecttime;
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
}