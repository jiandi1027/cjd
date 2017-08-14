/*
* GradeChange.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-30 created
*/
package com.rowell.sifa.pojo.rewardspunishment;

import java.io.Serializable;
import java.util.Date;

import com.rowell.sifa.pojo.base.ProcessEntity;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;

/**
 *   监管等级修改
* @Author marcle
* @version 1.0 2017-03-30
 */
public class GradeChange extends ProcessEntity<GradeChange> implements Serializable {
   

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**社区服刑人员 */
    private String culpritId;

    /**数据字典旧监管等级 */
    private String dicOldMonitorGradeKey;

    /**数据字典新监管等级 */
    private String dicMonitorGradeKey;

    /**数据字典确定等级原因（首次确定时选择 */
    private String dicChangeReasonKey;

    /**奖惩情况 */
    private String jcSituation;

    /**扣分情况 */
    private String kfSituation;

    /**数据字典抽查类型 */
    private String dicCheckTypeKey;

    /**证据材料附件路径 */
    private String notePath;

    /**证据材料附件名称 */
    private String notePathName;

    /**特殊类转其他类别管理的 首次报到时间 */
    private Date reportTime;

    /**记录作废标记 1-否 2-是 */
    private String blankFlag;

    /**作废账号名称 */
    private String flagAccountName;

    /**作废账号ID */
    private String flagAccountId;

    /**作废时间 */
    private Date flagTime;

    /**作废原因 0录入错误1其他*/
    private String flagReasonId;

    /**具体原因 */
    private String flagDetailReason;

    /**作废材料附件路径 */
    private String flagPath;

    /**作废材料附件名称 */
    private String flagPathName;
    /*打印状态*/
    private String printStatus;
    //犯人名字
    protected String culpritName;
    //犯人所在下司法所名称
    protected String groupName;
    /**数据字典犯罪类型 **/
    protected String dicCrimeTypeKey;
    /*犯罪类型*/
    protected String crimeType;
    //操作员修改原因及依据
    private String accountOpinion;
    //司法所意见
    private String SFSOpinion;
    
    private CulpritJudgment culpritJudgment;
    			   
    private String dicCrimeTypeKey1;
    private String dicPenalTypeKey;
    
    /**直属司法部门 */
    private String groupId;
    
    private String logo;
    protected Culprit culprit;
    
    private String roleId;
    private String dicMonitorGrade;
    

    
	public String getDicMonitorGrade() {
		return dicMonitorGrade;
	}

	public void setDicMonitorGrade(String dicMonitorGrade) {
		this.dicMonitorGrade = dicMonitorGrade;
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

	public String getDicCrimeTypeKey1() {
		return dicCrimeTypeKey1;
	}

	public void setDicCrimeTypeKey1(String dicCrimeTypeKey1) {
		this.dicCrimeTypeKey1 = dicCrimeTypeKey1;
	}

	public String getDicPenalTypeKey() {
		return dicPenalTypeKey;
	}

	public void setDicPenalTypeKey(String dicPenalTypeKey) {
		this.dicPenalTypeKey = dicPenalTypeKey;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
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

	public CulpritJudgment getCulpritJudgment() {
		return culpritJudgment;
	}

	public void setCulpritJudgment(CulpritJudgment culpritJudgment) {
		this.culpritJudgment = culpritJudgment;
	}

	public String getPrintStatus() {
		return printStatus;
	}

	public void setPrintStatus(String printStatus) {
		this.printStatus = printStatus;
	}

	public String getAccountOpinion() {
		return accountOpinion;
	}

	public void setAccountOpinion(String accountOpinion) {
		this.accountOpinion = accountOpinion;
	}

	public String getSFSOpinion() {
		return SFSOpinion;
	}

	public void setSFSOpinion(String sFSOpinion) {
		SFSOpinion = sFSOpinion;
	}

	public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getDicOldMonitorGradeKey() {
        return dicOldMonitorGradeKey;
    }

    public void setDicOldMonitorGradeKey(String dicOldMonitorGradeKey) {
        this.dicOldMonitorGradeKey = dicOldMonitorGradeKey == null ? null : dicOldMonitorGradeKey.trim();
    }

    public String getDicMonitorGradeKey() {
        return dicMonitorGradeKey;
    }

    public void setDicMonitorGradeKey(String dicMonitorGradeKey) {
        this.dicMonitorGradeKey = dicMonitorGradeKey == null ? null : dicMonitorGradeKey.trim();
    }

    public String getDicChangeReasonKey() {
        return dicChangeReasonKey;
    }

    public void setDicChangeReasonKey(String dicChangeReasonKey) {
        this.dicChangeReasonKey = dicChangeReasonKey == null ? null : dicChangeReasonKey.trim();
    }

    public String getJcSituation() {
        return jcSituation;
    }

    public void setJcSituation(String jcSituation) {
        this.jcSituation = jcSituation == null ? null : jcSituation.trim();
    }

    public String getKfSituation() {
        return kfSituation;
    }

    public void setKfSituation(String kfSituation) {
        this.kfSituation = kfSituation == null ? null : kfSituation.trim();
    }

    public String getDicCheckTypeKey() {
        return dicCheckTypeKey;
    }

    public void setDicCheckTypeKey(String dicCheckTypeKey) {
        this.dicCheckTypeKey = dicCheckTypeKey == null ? null : dicCheckTypeKey.trim();
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

    public Date getReportTime() {
        return reportTime;
    }

    public void setReportTime(Date reportTime) {
        this.reportTime = reportTime;
    }

    public String getBlankFlag() {
        return blankFlag;
    }

    public void setBlankFlag(String blankFlag) {
        this.blankFlag = blankFlag == null ? null : blankFlag.trim();
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

	public String getCulpritName() {
		return culpritName;
	}

	public void setCulpritName(String culpritName) {
		this.culpritName = culpritName;
	}
	public String getDicCrimeTypeKey() {
		return dicCrimeTypeKey;
	}

	public void setDicCrimeTypeKey(String dicCrimeTypeKey) {
		this.dicCrimeTypeKey = dicCrimeTypeKey;
	}

	public String getCrimeType() {
		return crimeType;
	}

	public void setCrimeType(String crimeType) {
		this.crimeType = crimeType;
	}
    
   
}