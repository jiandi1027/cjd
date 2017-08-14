/*
* Inspection.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-04-06 created
*/
package com.rowell.sifa.pojo.dailymgr;

import java.io.Serializable;
import java.util.Date;

import com.rowell.sifa.pojo.base.DataEntity;
import com.rowell.sifa.pojo.sys.SysGroup;

/**
 *   集中点验记录总表
* @Author marcle
* @version 1.0 2017-04-06
 */
public class Inspection extends DataEntity<Inspection> implements Serializable {
   

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 5081606223671591854L;

	/**被抽查部门name string A司法所;b司法所 */
    private String groupsStr;

    /**被抽查部门（县局级） */
    private String groupsStrXj;

    /**被抽查部门id string (id1),(id2).... */
    private String groupidsStr;

    /**被抽查部门（县级） */
    private String groupidsStrXj;

    /**抽查部门 */
    private String checkGroupId;

    /**抽查开始时间段 */
    private Date checkStartTime;
    
    /**抽查结束时间段 */
    private Date checkEndTime;

    /**总人数 */
    private Integer amount;

    /**实到人数 */
    private Integer realCount;

    /**未到人数 */
    private Integer disCount;

    /**迟到人数 */
    private Integer lateCount;
    
    
    /**查询司法所 */
    protected String groupId;
    /**抽查部门 */
    protected SysGroup sysGroup;

   

    public String getGroupsStr() {
        return groupsStr;
    }

    public void setGroupsStr(String groupsStr) {
        this.groupsStr = groupsStr == null ? null : groupsStr.trim();
    }

    public String getGroupsStrXj() {
        return groupsStrXj;
    }

    public void setGroupsStrXj(String groupsStrXj) {
        this.groupsStrXj = groupsStrXj == null ? null : groupsStrXj.trim();
    }

    public String getGroupidsStr() {
        return groupidsStr;
    }

    public void setGroupidsStr(String groupidsStr) {
        this.groupidsStr = groupidsStr == null ? null : groupidsStr.trim();
    }

    public String getGroupidsStrXj() {
        return groupidsStrXj;
    }

    public void setGroupidsStrXj(String groupidsStrXj) {
        this.groupidsStrXj = groupidsStrXj == null ? null : groupidsStrXj.trim();
    }

    public String getCheckGroupId() {
        return checkGroupId;
    }

    public void setCheckGroupId(String checkGroupId) {
        this.checkGroupId = checkGroupId == null ? null : checkGroupId.trim();
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Integer getRealCount() {
        return realCount;
    }

    public void setRealCount(Integer realCount) {
        this.realCount = realCount;
    }

    public Integer getDisCount() {
        return disCount;
    }

    public void setDisCount(Integer disCount) {
        this.disCount = disCount;
    }

    public Integer getLateCount() {
        return lateCount;
    }

    public void setLateCount(Integer lateCount) {
        this.lateCount = lateCount;
    }

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public SysGroup getSysGroup() {
		return sysGroup;
	}

	public void setSysGroup(SysGroup sysGroup) {
		this.sysGroup = sysGroup;
	}

	public Date getCheckStartTime() {
		return checkStartTime;
	}

	public void setCheckStartTime(Date checkStartTime) {
		this.checkStartTime = checkStartTime;
	}

	public Date getCheckEndTime() {
		return checkEndTime;
	}

	public void setCheckEndTime(Date checkEndTime) {
		this.checkEndTime = checkEndTime;
	}

  
}