/*
* Detached.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.endcorrect;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.DataEntity;
import com.rowell.sifa.pojo.base.ProcessEntity;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.sys.SysGroup;

/**
 *   脱管
* @Author marcle
* @version 1.0 2017-03-16
 */
public class Detached extends ProcessEntity<Detached> implements Serializable {
 

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = -5797182413460808969L;

	/**犯人 */
    private String culpritId;

    /**数据字典掌握情况方式 */
    private String dicGraspTypeKey;

    /**掌握情况时间 */
    private Date graspTime;

    /**通报公安机关时间 */
    private Date reportTime;

    /**通报人 */
    private String reportPerson;

    /**民警姓名 */
    private String policeName;

    /**通报公安机关名称 */
    private String reportUnit;

    /**脱管时间 */
    private Date detachedTime;

    /**简单描述 */
    private String description;

    /**创建时间 */
    private Date created;

    /**创建人 */
    private String creater;

    /**更新时间 */
    private Date updated;

    /**更新人 */
    private String updater;

    /**删除标识 */
    private Integer delFlag;
    /**
     * 矫正人员信息
     */
    private Culprit culprit;
    
    /**姓名*/
    protected String culpritName;
    
    /**部门名称*/
    protected String groupName;
    
    protected SysGroup sysGroup;

    /**数据字典原判刑罚 */
    private String dicYpxfKey;
    
    /**刑期 */
    private String adjudgePeriod;
    
    /**附加刑(多个使用|隔开) */
    private String accessoryPunishment;
    
    /**刑期变动 */
    private String adjudgeChange;
    
    /**刑期开始日期 */
    private Date adjudgeStartTime;

    /**刑期结束日期 */
    private Date adjudgeEndTime;
    
    /**数据字典（刑罚执行类别）矫正类别 */
    private String dicPenalTypeKey;
    
    //搜索条件
    private Date reportTimeStart;
    private Date reportTimeEnd;
    private Date detachedTimeStart;
    private Date detachedTimeEnd;
    private Date graspTimeStart;
    private Date graspTimeEnd;
   
    protected String groupId;
    
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public SysGroup getSysGroup() {
		return sysGroup;
	}
	 @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	public Date getReportTimeStart() {
		return reportTimeStart;
	}

	public void setReportTimeStart(Date reportTimeStart) {
		this.reportTimeStart = reportTimeStart;
	}
	 @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	public Date getReportTimeEnd() {
		return reportTimeEnd;
	}

	public void setReportTimeEnd(Date reportTimeEnd) {
		this.reportTimeEnd = reportTimeEnd;
	}
	 @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	public Date getDetachedTimeStart() {
		return detachedTimeStart;
	}

	public void setDetachedTimeStart(Date detachedTimeStart) {
		this.detachedTimeStart = detachedTimeStart;
	}
	 @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	public Date getDetachedTimeEnd() {
		return detachedTimeEnd;
	}

	public void setDetachedTimeEnd(Date detachedTimeEnd) {
		this.detachedTimeEnd = detachedTimeEnd;
	}
	 @JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone="GMT+8")
	public Date getGraspTimeStart() {
		return graspTimeStart;
	}

	public void setGraspTimeStart(Date graspTimeStart) {
		this.graspTimeStart = graspTimeStart;
	}
	 @JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone="GMT+8")
	public Date getGraspTimeEnd() {
		return graspTimeEnd;
	}

	public void setGraspTimeEnd(Date graspTimeEnd) {
		this.graspTimeEnd = graspTimeEnd;
	}

	public void setSysGroup(SysGroup sysGroup) {
		this.sysGroup = sysGroup;
	}

	public String getDicYpxfKey() {
		return dicYpxfKey;
	}

	public void setDicYpxfKey(String dicYpxfKey) {
		this.dicYpxfKey = dicYpxfKey;
	}

	public String getAdjudgePeriod() {
		return adjudgePeriod;
	}

	public void setAdjudgePeriod(String adjudgePeriod) {
		this.adjudgePeriod = adjudgePeriod;
	}

	public String getAccessoryPunishment() {
		return accessoryPunishment;
	}

	public void setAccessoryPunishment(String accessoryPunishment) {
		this.accessoryPunishment = accessoryPunishment;
	}

	public String getAdjudgeChange() {
		return adjudgeChange;
	}

	public void setAdjudgeChange(String adjudgeChange) {
		this.adjudgeChange = adjudgeChange;
	}
	 @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	public Date getAdjudgeStartTime() {
		return adjudgeStartTime;
	}

	public void setAdjudgeStartTime(Date adjudgeStartTime) {
		this.adjudgeStartTime = adjudgeStartTime;
	}
	 @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	public Date getAdjudgeEndTime() {
		return adjudgeEndTime;
	}

	public void setAdjudgeEndTime(Date adjudgeEndTime) {
		this.adjudgeEndTime = adjudgeEndTime;
	}

	public String getDicPenalTypeKey() {
		return dicPenalTypeKey;
	}

	public void setDicPenalTypeKey(String dicPenalTypeKey) {
		this.dicPenalTypeKey = dicPenalTypeKey;
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

	public Culprit getCulprit() {
		return culprit;
	}

	public void setCulprit(Culprit culprit) {
		this.culprit = culprit;
	}

	public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getDicGraspTypeKey() {
        return dicGraspTypeKey;
    }

    public void setDicGraspTypeKey(String dicGraspTypeKey) {
        this.dicGraspTypeKey = dicGraspTypeKey == null ? null : dicGraspTypeKey.trim();
    }
    
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone="GMT+8")
    public Date getGraspTime() {
        return graspTime;
    }

    public void setGraspTime(Date graspTime) {
        this.graspTime = graspTime;
    }
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getReportTime() {
        return reportTime;
    }

    public void setReportTime(Date reportTime) {
        this.reportTime = reportTime;
    }
    
    public String getReportPerson() {
        return reportPerson;
    }

    public void setReportPerson(String reportPerson) {
        this.reportPerson = reportPerson == null ? null : reportPerson.trim();
    }

    public String getPoliceName() {
        return policeName;
    }

    public void setPoliceName(String policeName) {
        this.policeName = policeName == null ? null : policeName.trim();
    }

    public String getReportUnit() {
        return reportUnit;
    }

    public void setReportUnit(String reportUnit) {
        this.reportUnit = reportUnit == null ? null : reportUnit.trim();
    }
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getDetachedTime() {
        return detachedTime;
    }

    public void setDetachedTime(Date detachedTime) {
        this.detachedTime = detachedTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater == null ? null : creater.trim();
    }
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
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