/*
* Warning.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.rewardspunishment;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.ProcessEntity;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.pojo.sys.SysGroup;

/**
 *   警告
* @Author marcle
* @version 1.0 2017-03-16
 */
public class Warning extends ProcessEntity<Warning> implements Serializable  {
	    
	private static final long serialVersionUID = 3505103627780337454L;

	/**对象ID */
    private String culpritId;

    /**事实 */
    private String fact;

    /**备注 */
    private String note;

    /**警告附件路径 */
    private String path;

    /**警告附件名称 */
    private String pathName;

    /**数据字典违纪原因 */
    private String dicReasonTypeKey;

    /**执法文书文号 */
    private String writNum;

    /**悔过书附件路径 */
    private String repentancePath;

    /**悔过书附件名称 */
    private String repenteancePathName;

    /**证据材料附件路径 */
    private String notePath;

    /**证据材料附件名称 */
    private String notePathName;

    /**依据 */
    private String legalBasis;

    /**依据 */
    private String legalBasisItems;

    /**评议表 名称 */
    private String pingyiPathName;

    /**评议表 路径 */
    private String pingyiPath;

    /**评议表上传 操作员ID */
    private String copAccounId;

    /**评议表上传 时间 */
    private Date optTime;
    
    /**评议表上时间开始*/
    private Date starOptTime;
    
    /**评议表上传时间结束*/
    private Date endOptTime;
    
    /**数据字典记录作废标记 */
    private String dicBlankFlagKey;

    /**作废账号名称 */
    private String flagAccountName;

    /**作废账号ID */
    private String flagAccountId;

    /**作废时间 */
    private Date flagTime;

    /**作废原因 */
    private String flagReasonId;

    /**具体原因 */
    private String flagDetailReason;

    /**作废材料附件路径 */
    private String flagPath;

    /**作废材料附件名称 */
    private String flagPathName;
    
    /**流程ID */
    private String processInstanceId;

    /* 对象姓名 */
    protected String culpritName;
    
    /* 组名称 */
    protected String groupName;
    
    /* 组ID */
    protected String groupId ;
    
    /* 对象 */
    protected Culprit culprit;
    
    /* 罪犯 */
    protected CulpritJudgment culpritJudgment;
    
    /* 组织表 */
	protected SysGroup sysGroup;
	
	/* 角色权限ID */
	private String roleId;
	
	/* 判断警告审批表是否打印 */
	private String isPrintJYS;
	
	/* 判断警告决定书是否打印 */
	private String isPrintSHB;
	
	
    public String getIsPrintJYS() {
		return isPrintJYS;
	}

	public void setIsPrintJYS(String isPrintJYS) {
		this.isPrintJYS = isPrintJYS;
	}

	public String getIsPrintSHB() {
		return isPrintSHB;
	}

	public void setIsPrintSHB(String isPrintSHB) {
		this.isPrintSHB = isPrintSHB;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public Culprit getCulprit() {
		return culprit;
	}

	public void setCulprit(Culprit culprit) {
		this.culprit = culprit;
	}

	public CulpritJudgment getCulpritJudgment() {
		return culpritJudgment;
	}

	public void setCulpritJudgment(CulpritJudgment culpritJudgment) {
		this.culpritJudgment = culpritJudgment;
	}

	public SysGroup getSysGroup() {
		return sysGroup;
	}

	public void setSysGroup(SysGroup sysGroup) {
		this.sysGroup = sysGroup;
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

	public Date getStarOptTime() {
		return starOptTime;
	}

	public void setStarOptTime(Date starOptTime) {
		this.starOptTime = starOptTime;
	}

	public Date getEndOptTime() {
		return endOptTime;
	}

	public void setEndOptTime(Date endOptTime) {
		this.endOptTime = endOptTime;
	}

	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}

	public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getFact() {
        return fact;
    }

    public void setFact(String fact) {
        this.fact = fact == null ? null : fact.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    public String getPathName() {
        return pathName;
    }

    public void setPathName(String pathName) {
        this.pathName = pathName == null ? null : pathName.trim();
    }

    public String getDicReasonTypeKey() {
        return dicReasonTypeKey;
    }

    public void setDicReasonTypeKey(String dicReasonTypeKey) {
        this.dicReasonTypeKey = dicReasonTypeKey == null ? null : dicReasonTypeKey.trim();
    }

    public String getWritNum() {
        return writNum;
    }

    public void setWritNum(String writNum) {
        this.writNum = writNum == null ? null : writNum.trim();
    }

    public String getRepentancePath() {
        return repentancePath;
    }

    public void setRepentancePath(String repentancePath) {
        this.repentancePath = repentancePath == null ? null : repentancePath.trim();
    }

    public String getRepenteancePathName() {
        return repenteancePathName;
    }

    public void setRepenteancePathName(String repenteancePathName) {
        this.repenteancePathName = repenteancePathName == null ? null : repenteancePathName.trim();
    }

    public String getNotePath() {
        return notePath;
    }

    public void setNotePath(String notePath) {
        this.notePath = notePath == null ? null : notePath.trim();
    }

    public String getNotePathName() {
        return notePathName;
    }

    public void setNotePathName(String notePathName) {
        this.notePathName = notePathName == null ? null : notePathName.trim();
    }

    public String getLegalBasis() {
        return legalBasis;
    }

    public void setLegalBasis(String legalBasis) {
        this.legalBasis = legalBasis == null ? null : legalBasis.trim();
    }

    public String getLegalBasisItems() {
        return legalBasisItems;
    }

    public void setLegalBasisItems(String legalBasisItems) {
        this.legalBasisItems = legalBasisItems == null ? null : legalBasisItems.trim();
    }

    public String getPingyiPathName() {
        return pingyiPathName;
    }

    public void setPingyiPathName(String pingyiPathName) {
        this.pingyiPathName = pingyiPathName == null ? null : pingyiPathName.trim();
    }

    public String getPingyiPath() {
        return pingyiPath;
    }

    public void setPingyiPath(String pingyiPath) {
        this.pingyiPath = pingyiPath == null ? null : pingyiPath.trim();
    }

    public String getCopAccounId() {
        return copAccounId;
    }

    public void setCopAccounId(String copAccounId) {
        this.copAccounId = copAccounId == null ? null : copAccounId.trim();
    }
    @JsonFormat(pattern = "yyyy-MM-dd")
    public Date getOptTime() {
        return optTime;
    }

    public void setOptTime(Date optTime) {
        this.optTime = optTime;
    }

    public String getDicBlankFlagKey() {
        return dicBlankFlagKey;
    }

    public void setDicBlankFlagKey(String dicBlankFlagKey) {
        this.dicBlankFlagKey = dicBlankFlagKey == null ? null : dicBlankFlagKey.trim();
    }

    public String getFlagAccountName() {
        return flagAccountName;
    }

    public void setFlagAccountName(String flagAccountName) {
        this.flagAccountName = flagAccountName == null ? null : flagAccountName.trim();
    }

    public String getFlagAccountId() {
        return flagAccountId;
    }

    public void setFlagAccountId(String flagAccountId) {
        this.flagAccountId = flagAccountId == null ? null : flagAccountId.trim();
    }

    public Date getFlagTime() {
        return flagTime;
    }

    public void setFlagTime(Date flagTime) {
        this.flagTime = flagTime;
    }

    public String getFlagReasonId() {
        return flagReasonId;
    }

    public void setFlagReasonId(String flagReasonId) {
        this.flagReasonId = flagReasonId == null ? null : flagReasonId.trim();
    }

    public String getFlagDetailReason() {
        return flagDetailReason;
    }

    public void setFlagDetailReason(String flagDetailReason) {
        this.flagDetailReason = flagDetailReason == null ? null : flagDetailReason.trim();
    }

    public String getFlagPath() {
        return flagPath;
    }

    public void setFlagPath(String flagPath) {
        this.flagPath = flagPath == null ? null : flagPath.trim();
    }

    public String getFlagPathName() {
        return flagPathName;
    }

    public void setFlagPathName(String flagPathName) {
        this.flagPathName = flagPathName == null ? null : flagPathName.trim();
    }

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupID) {
		this.groupId = groupID;
	}
  
}