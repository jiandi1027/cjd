/*
* RevokeOutOfPrison.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.rewardspunishment;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.rowell.sifa.pojo.base.DataEntity;
import com.rowell.sifa.pojo.base.ProcessEntity;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.sys.SysGroup;

/**
 *   提请撤销暂予监外执行
* @Author marcle
* @version 1.0 2017-03-16
 */
@SuppressWarnings("serial")
@JsonInclude(Include.NON_NULL)
public class RevokeOutOfPrison extends ProcessEntity<RevokeOutOfPrison> implements Serializable {


	/**社区服刑人员 */
    private String culpritId;

    /**申请提交时间 */
    private Date applyDate;

    /**理由 */
    private String reason;

    /**简要违纪情况 */
    private String detailInfo;

    /**备注 */
    private String note;

    /**数据字典监管等级 */
    private String dicMonitorGradeKey;

    /**数据字典违纪原因 */
    private String dicReasonTypeKey;

    /**执法文书文号 */
    private String writNum;

    /**结案报告附件 */
    private String endCasePath;

    /**结案报告附件名称 */
    private String endCasePathName;

    /**证据材料附件路径 */
    private String notePath;

    /**证据材料附件名称 */
    private String notePathName;

    /**数据字典呈报单位类型 */
    private String dicSubOrgTypeKey;

    /**呈报单位名称 */
    private String submittionOrg;

    /**抄送单位名称 */
    private String copyOrg;

    /**法律依据 */
    private String legalBasis;

    /**数据字典法律依据 */
    private String dicEndReasonKey;

    /**市矫正处考评意见 */
    private String endDetailReason;

    /**证据材料附件路径 */
    private String endPath;

    /**证据材料附件名称 */
    private String endPathName;

    /**证据材料附件名称 */
    private String endAccountName;

    /**法律依据 */
    private String endAccountId;

    /**评议表 名称 */
    private String pingyiPathName;

    /**评议表 路径 */
    private String pingyiPath;

    /**评议表上传 操作员ID */
    private String copAccounId;

    /**评议表上传 时间 */
    private Date optTime;

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

    /**事实依据 */
    private String fact;
    /**作废材料附件名称 */
    private String flagPathName;

    
  //是否打印建议书，0表示未打印,1标识已打印
    private Integer isPrintJYS;
    //是否打印审核表
    private Integer isPrintSHB;
    //数据字典材料送达方式
    private String dicSdfsKey;
    
    protected String culpritName;
    
    protected String groupName;
    
    protected Culprit culprit;
    
    protected SysGroup sysGroup;
    
    protected String groupId;
    
    
    public Integer getIsPrintJYS() {
		return isPrintJYS;
	}

	public void setIsPrintJYS(Integer isPrintJYS) {
		this.isPrintJYS = isPrintJYS;
	}

	public Integer getIsPrintSHB() {
		return isPrintSHB;
	}

	public void setIsPrintSHB(Integer isPrintSHB) {
		this.isPrintSHB = isPrintSHB;
	}

	public String getDicSdfsKey() {
		return dicSdfsKey;
	}

	public void setDicSdfsKey(String dicSdfsKey) {
		this.dicSdfsKey = dicSdfsKey;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getFact() {
		return fact;
	}

	public void setFact(String fact) {
		this.fact = fact;
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

	public SysGroup getSysGroup() {
		return sysGroup;
	}

	public void setSysGroup(SysGroup sysGroup) {
		this.sysGroup = sysGroup;
	}

	public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public Date getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(Date applyDate) {
        this.applyDate = applyDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public String getDetailInfo() {
        return detailInfo;
    }

    public void setDetailInfo(String detailInfo) {
        this.detailInfo = detailInfo == null ? null : detailInfo.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getDicMonitorGradeKey() {
        return dicMonitorGradeKey;
    }

    public void setDicMonitorGradeKey(String dicMonitorGradeKey) {
        this.dicMonitorGradeKey = dicMonitorGradeKey == null ? null : dicMonitorGradeKey.trim();
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

    public String getEndCasePath() {
        return endCasePath;
    }

    public void setEndCasePath(String endCasePath) {
        this.endCasePath = endCasePath == null ? null : endCasePath.trim();
    }

    public String getEndCasePathName() {
        return endCasePathName;
    }

    public void setEndCasePathName(String endCasePathName) {
        this.endCasePathName = endCasePathName == null ? null : endCasePathName.trim();
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

    public String getDicSubOrgTypeKey() {
        return dicSubOrgTypeKey;
    }

    public void setDicSubOrgTypeKey(String dicSubOrgTypeKey) {
        this.dicSubOrgTypeKey = dicSubOrgTypeKey == null ? null : dicSubOrgTypeKey.trim();
    }

    public String getSubmittionOrg() {
        return submittionOrg;
    }

    public void setSubmittionOrg(String submittionOrg) {
        this.submittionOrg = submittionOrg == null ? null : submittionOrg.trim();
    }

    public String getCopyOrg() {
        return copyOrg;
    }

    public void setCopyOrg(String copyOrg) {
        this.copyOrg = copyOrg == null ? null : copyOrg.trim();
    }

    public String getLegalBasis() {
        return legalBasis;
    }

    public void setLegalBasis(String legalBasis) {
        this.legalBasis = legalBasis == null ? null : legalBasis.trim();
    }

    public String getDicEndReasonKey() {
        return dicEndReasonKey;
    }

    public void setDicEndReasonKey(String dicEndReasonKey) {
        this.dicEndReasonKey = dicEndReasonKey == null ? null : dicEndReasonKey.trim();
    }

    public String getEndDetailReason() {
        return endDetailReason;
    }

    public void setEndDetailReason(String endDetailReason) {
        this.endDetailReason = endDetailReason == null ? null : endDetailReason.trim();
    }

    public String getEndPath() {
        return endPath;
    }

    public void setEndPath(String endPath) {
        this.endPath = endPath == null ? null : endPath.trim();
    }

    public String getEndPathName() {
        return endPathName;
    }

    public void setEndPathName(String endPathName) {
        this.endPathName = endPathName == null ? null : endPathName.trim();
    }

    public String getEndAccountName() {
        return endAccountName;
    }

    public void setEndAccountName(String endAccountName) {
        this.endAccountName = endAccountName == null ? null : endAccountName.trim();
    }

    public String getEndAccountId() {
        return endAccountId;
    }

    public void setEndAccountId(String endAccountId) {
        this.endAccountId = endAccountId == null ? null : endAccountId.trim();
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

   
}