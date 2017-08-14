/*
* RevokeProbation.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.rewardspunishment;

import java.io.Serializable;
import java.util.Date;

import com.rowell.sifa.pojo.base.DataEntity;
import com.rowell.sifa.pojo.base.ProcessEntity;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.sys.SysGroup;

/**
 *   提请撤销缓刑
* @Author marcle
* @version 1.0 2017-03-16
 */
public class RevokeProbation extends ProcessEntity<RevokeProbation> implements Serializable {
   

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 1141538816598069923L;

	/**CULPRIT_ID */
    private String culpritId;

    /**PATH 撤销缓刑附件路径*/
    private String path;

    /**PATH_NAME 撤销缓刑附件名称*/
    private String pathName;

    /**SFSYJ 司法所意见*/
    private String sfsyj;

    /**SFSSHSJ 司法所审核时间*/
    private Date sfsshsj;

    /**XJSFXZJGYJ 县级司法行政机关意见*/
    private String xjsfxzjgyj;

    /**XJSFXZJGSHSJ 县级司法行政机关审核时间*/
    private Date xjsfxzjgshsj;

    /**DJSFXZJGYJ 地级司法行政机关意见*/
    private String djsfxzjgyj;

    /**DJSFXZJGSHSJ 地级司法行政机关审核时间*/
    private Date djsfxzjgshsj;

    /**FACT 事实依据*/
    private String fact;

    /**NOTE 备注*/
    private String note;

    /**COURT 法院*/
    private String court;

    /**PROCURATORATE 检查院*/
    private String procuratorate;

    /**POLICE 公安局*/
    private String police;

    /**HANDLE_QUALITY_ID 输入质量*/
    private String handleQualityId;

    /**HANDLE_QUALITY_GOAL 办案分值*/
    private Double handleQualityGoal;

    /**JZK_OPINION 矫正科意见*/
    private String jzkOpinion;

    /**ACTION_QUALITY_ID 执法质量（县矫正科,县法制科）*/
    private String actionQualityId;

    /**ACTION_QUALITY_GOAL 执法分值（县矫正科）*/
    private Double actionQualityGoal;

    /**ACTION_QUALITY_GOAL_F 执法分值（县法制科）*/
    private Double actionQualityGoalF;

    /**FZK_OPINION 法制科意见*/
    private String fzkOpinion;

    /**CITY_HANDLE_QUALITY_ID  市办案质量*/
    private String cityHandleQualityId;

    /**CITY_HANDLE_QUALITY_GOAL 市办案分值*/
    private Double cityHandleQualityGoal;

    /**JZC_OPINION 矫正处意见*/
    private String jzcOpinion;

    /**CITY_ACTION_QUALITY_ID 市执法质量 */
    private String cityActionQualityId;

    /**CITY_JACTION_QUALITY_GOAL 矫正处执法分值*/
    private Double cityJactionQualityGoal;

    /**CITY_FACTION_QUALITY_GOAL 法制处执法分值*/
    private Double cityFactionQualityGoal;

    /**FZC_OPINION  法制处意见*/
    private String fzcOpinion;

    /**REASON_TYPE_ID 违纪原因*/
    private String reasonTypeId;

    /**WRIT_NUM 执法文书文号*/
    private String writNum;

    /**IS_RETREAT 是否退回*/
    private Integer isRetreat;

    /**STATUS 审批状态 1-司法所上报 2-司法所审批 3-矫正科 4-法制科 5-县分管 6-打印*/
    private String status;

    /**XFG_RETREAT_REASON 县分管退回原因*/
    private String xfgRetreatReason;

    /**JZK_RETREAT_REASON 县矫正科退回原因*/
    private String jzkRetreatReason;

    /**FZK_RETREAT_REASON 县法制科退回原因*/
    private String fzkRetreatReason;

    /**RETREAT_REASON 司法所退回原因*/
    private String retreatReason;

    /**BACK_REASON 退回原因*/
    private String backReason;

    /**RECOMMEND_STATUS 县矫正科确定是否推荐为典型案例 1-是 2-否*/
    private String recommendStatus;

    /**RECOMMEND_STATUSS 市矫正处确定是否推荐为典型案例 1-是 2-否*/
    private String recommendStatuss;

    /**SUBMITTION_ORG_TYPE_ID 呈报单位类型*/
    private String submittionOrgTypeId;

    /**SUBMITTION_ORG 呈报单位名称*/
    private String submittionOrg;

    /**COPY_ORG 抄送单位名称*/
    private String copyOrg;

    /**END_CASE_PATH 结案报告附件*/
    private String endCasePath;

    /**END_CASE_PATH_NAME 结案报告附件名称*/
    private String endCasePathName;

    /**NOTE_PATH 证据材料附件路径*/
    private String notePath;

    /**NOTE_PATH_NAME 证据材料附件名称*/
    private String notePathName;

    /**LEGAL_BASIS 法律依据*/
    private String legalBasis;

    /**CHECK_TYPE_ID * 抽查类型
	 * 1--系统自动抽查，2--随机抽查*/
    private String checkTypeId;

    /**DETAIL_INFO_BAK */
    private String detailInfoBak;

    /**DETAIL_INFO 简要违纪情况*/
    private String detailInfo;

    /**CONCRETE_FACTS 具体事实(相关建议书)*/
    private String concreteFacts;

    /**ISSUE_TIME  签发时间*/
    private String issueTime;

    /**CITY_CHECK_QUALITY_GOAL 市级执法质量*/
    private Double cityCheckQualityGoal;

    /**CITY_INPUT_QUALITY_GOAL 市级输入质量*/
    private Double cityInputQualityGoal;

    /**CITY_FCHECK_QUALITY_GOAL 市级法制处执法质量*/
    private Double cityFcheckQualityGoal;

    /**CITY_DEAL_IDEA 市矫正处考评意见*/
    private String cityDealIdea;

    /**END_REASON_ID 法律依据*/
    private String endReasonId;

    /**END_DETAIL_REASON 市矫正处考评意见*/
    private String endDetailReason;

    /**END_PATH 证据材料附件路径*/
    private String endPath;

    /**END_PATH_NAME 证据材料附件名称*/
    private String endPathName;

    /**END_ACCOUNT_NAME 证据材料附件名称*/
    private String endAccountName;

    /**END_ACCOUNT_ID  法律依据*/
    private String endAccountId;

    /**END_TIME 流程结束时间*/
    private Date endTime;

    /**PINGYI_PATH_NAME 评议表 名称*/
    private String pingyiPathName;

    /**PINGYI_PATH 评议表 路径*/
    private String pingyiPath;

    /**COP_ACCOUN_ID 评议表上传 操作员ID*/
    private String copAccounId;

    /**OPT_TIME 评议表上传 时间*/
    private Date optTime;

    /**BLANK_FLAG 记录作废标记 1-否 2-是*/
    private String blankFlag;

    /**FLAG_ACCOUNT_NAME 作废账号名称*/
    private String flagAccountName;

    /**FLAG_ACCOUNT_ID 作废账号ID*/
    private String flagAccountId;

    /**FLAG_TIME 作废时间*/
    private Date flagTime;

    /**FLAG_REASON_ID 作废原因*/
    private String flagReasonId;

    /**FLAG_DETAIL_REASON flagDetailReason  具体原因*/
    private String flagDetailReason;

    /**FLAG_PATH 作废材料附件路径*/
    private String flagPath;

    /**FLAG_PATH_NAME 作废材料附件名称*/
    private String flagPathName;

    //搜索条件
    private Date startCreateDate;
    //搜索条件
    private Date endCreateDate;
    
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
    
    
    
    
    public String getDicSdfsKey() {
		return dicSdfsKey;
	}

	public void setDicSdfsKey(String dicSdfsKey) {
		this.dicSdfsKey = dicSdfsKey;
	}

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

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public Date getStartCreateDate() {
		return startCreateDate;
	}

	public void setStartCreateDate(Date startCreateDate) {
		this.startCreateDate = startCreateDate;
	}

	public Date getEndCreateDate() {
		return endCreateDate;
	}

	public void setEndCreateDate(Date endCreateDate) {
		this.endCreateDate = endCreateDate;
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

    public String getSfsyj() {
        return sfsyj;
    }

    public void setSfsyj(String sfsyj) {
        this.sfsyj = sfsyj == null ? null : sfsyj.trim();
    }

    public Date getSfsshsj() {
        return sfsshsj;
    }

    public void setSfsshsj(Date sfsshsj) {
        this.sfsshsj = sfsshsj;
    }

    public String getXjsfxzjgyj() {
        return xjsfxzjgyj;
    }

    public void setXjsfxzjgyj(String xjsfxzjgyj) {
        this.xjsfxzjgyj = xjsfxzjgyj == null ? null : xjsfxzjgyj.trim();
    }

    public Date getXjsfxzjgshsj() {
        return xjsfxzjgshsj;
    }

    public void setXjsfxzjgshsj(Date xjsfxzjgshsj) {
        this.xjsfxzjgshsj = xjsfxzjgshsj;
    }

    public String getDjsfxzjgyj() {
        return djsfxzjgyj;
    }

    public void setDjsfxzjgyj(String djsfxzjgyj) {
        this.djsfxzjgyj = djsfxzjgyj == null ? null : djsfxzjgyj.trim();
    }

    public Date getDjsfxzjgshsj() {
        return djsfxzjgshsj;
    }

    public void setDjsfxzjgshsj(Date djsfxzjgshsj) {
        this.djsfxzjgshsj = djsfxzjgshsj;
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

    public String getCourt() {
        return court;
    }

    public void setCourt(String court) {
        this.court = court == null ? null : court.trim();
    }

    public String getProcuratorate() {
        return procuratorate;
    }

    public void setProcuratorate(String procuratorate) {
        this.procuratorate = procuratorate == null ? null : procuratorate.trim();
    }

    public String getPolice() {
        return police;
    }

    public void setPolice(String police) {
        this.police = police == null ? null : police.trim();
    }

    public String getHandleQualityId() {
        return handleQualityId;
    }

    public void setHandleQualityId(String handleQualityId) {
        this.handleQualityId = handleQualityId == null ? null : handleQualityId.trim();
    }

    public Double getHandleQualityGoal() {
        return handleQualityGoal;
    }

    public void setHandleQualityGoal(Double handleQualityGoal) {
        this.handleQualityGoal = handleQualityGoal;
    }

    public String getJzkOpinion() {
        return jzkOpinion;
    }

    public void setJzkOpinion(String jzkOpinion) {
        this.jzkOpinion = jzkOpinion == null ? null : jzkOpinion.trim();
    }

    public String getActionQualityId() {
        return actionQualityId;
    }

    public void setActionQualityId(String actionQualityId) {
        this.actionQualityId = actionQualityId == null ? null : actionQualityId.trim();
    }

    public Double getActionQualityGoal() {
        return actionQualityGoal;
    }

    public void setActionQualityGoal(Double actionQualityGoal) {
        this.actionQualityGoal = actionQualityGoal;
    }

    public Double getActionQualityGoalF() {
        return actionQualityGoalF;
    }

    public void setActionQualityGoalF(Double actionQualityGoalF) {
        this.actionQualityGoalF = actionQualityGoalF;
    }

    public String getFzkOpinion() {
        return fzkOpinion;
    }

    public void setFzkOpinion(String fzkOpinion) {
        this.fzkOpinion = fzkOpinion == null ? null : fzkOpinion.trim();
    }

    public String getCityHandleQualityId() {
        return cityHandleQualityId;
    }

    public void setCityHandleQualityId(String cityHandleQualityId) {
        this.cityHandleQualityId = cityHandleQualityId == null ? null : cityHandleQualityId.trim();
    }

    public Double getCityHandleQualityGoal() {
        return cityHandleQualityGoal;
    }

    public void setCityHandleQualityGoal(Double cityHandleQualityGoal) {
        this.cityHandleQualityGoal = cityHandleQualityGoal;
    }

    public String getJzcOpinion() {
        return jzcOpinion;
    }

    public void setJzcOpinion(String jzcOpinion) {
        this.jzcOpinion = jzcOpinion == null ? null : jzcOpinion.trim();
    }

    public String getCityActionQualityId() {
        return cityActionQualityId;
    }

    public void setCityActionQualityId(String cityActionQualityId) {
        this.cityActionQualityId = cityActionQualityId == null ? null : cityActionQualityId.trim();
    }

    public Double getCityJactionQualityGoal() {
        return cityJactionQualityGoal;
    }

    public void setCityJactionQualityGoal(Double cityJactionQualityGoal) {
        this.cityJactionQualityGoal = cityJactionQualityGoal;
    }

    public Double getCityFactionQualityGoal() {
        return cityFactionQualityGoal;
    }

    public void setCityFactionQualityGoal(Double cityFactionQualityGoal) {
        this.cityFactionQualityGoal = cityFactionQualityGoal;
    }

    public String getFzcOpinion() {
        return fzcOpinion;
    }

    public void setFzcOpinion(String fzcOpinion) {
        this.fzcOpinion = fzcOpinion == null ? null : fzcOpinion.trim();
    }

    public String getReasonTypeId() {
        return reasonTypeId;
    }

    public void setReasonTypeId(String reasonTypeId) {
        this.reasonTypeId = reasonTypeId == null ? null : reasonTypeId.trim();
    }

    public String getWritNum() {
        return writNum;
    }

    public void setWritNum(String writNum) {
        this.writNum = writNum == null ? null : writNum.trim();
    }

    public Integer getIsRetreat() {
        return isRetreat;
    }

    public void setIsRetreat(Integer isRetreat) {
        this.isRetreat = isRetreat;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getXfgRetreatReason() {
        return xfgRetreatReason;
    }

    public void setXfgRetreatReason(String xfgRetreatReason) {
        this.xfgRetreatReason = xfgRetreatReason == null ? null : xfgRetreatReason.trim();
    }

    public String getJzkRetreatReason() {
        return jzkRetreatReason;
    }

    public void setJzkRetreatReason(String jzkRetreatReason) {
        this.jzkRetreatReason = jzkRetreatReason == null ? null : jzkRetreatReason.trim();
    }

    public String getFzkRetreatReason() {
        return fzkRetreatReason;
    }

    public void setFzkRetreatReason(String fzkRetreatReason) {
        this.fzkRetreatReason = fzkRetreatReason == null ? null : fzkRetreatReason.trim();
    }

    public String getRetreatReason() {
        return retreatReason;
    }

    public void setRetreatReason(String retreatReason) {
        this.retreatReason = retreatReason == null ? null : retreatReason.trim();
    }

    public String getBackReason() {
        return backReason;
    }

    public void setBackReason(String backReason) {
        this.backReason = backReason == null ? null : backReason.trim();
    }

    public String getRecommendStatus() {
        return recommendStatus;
    }

    public void setRecommendStatus(String recommendStatus) {
        this.recommendStatus = recommendStatus == null ? null : recommendStatus.trim();
    }

    public String getRecommendStatuss() {
        return recommendStatuss;
    }

    public void setRecommendStatuss(String recommendStatuss) {
        this.recommendStatuss = recommendStatuss == null ? null : recommendStatuss.trim();
    }

    public String getSubmittionOrgTypeId() {
        return submittionOrgTypeId;
    }

    public void setSubmittionOrgTypeId(String submittionOrgTypeId) {
        this.submittionOrgTypeId = submittionOrgTypeId == null ? null : submittionOrgTypeId.trim();
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

    public String getLegalBasis() {
        return legalBasis;
    }

    public void setLegalBasis(String legalBasis) {
        this.legalBasis = legalBasis == null ? null : legalBasis.trim();
    }

    public String getCheckTypeId() {
        return checkTypeId;
    }

    public void setCheckTypeId(String checkTypeId) {
        this.checkTypeId = checkTypeId == null ? null : checkTypeId.trim();
    }

    public String getDetailInfoBak() {
        return detailInfoBak;
    }

    public void setDetailInfoBak(String detailInfoBak) {
        this.detailInfoBak = detailInfoBak == null ? null : detailInfoBak.trim();
    }

    public String getDetailInfo() {
        return detailInfo;
    }

    public void setDetailInfo(String detailInfo) {
        this.detailInfo = detailInfo == null ? null : detailInfo.trim();
    }

    public String getConcreteFacts() {
        return concreteFacts;
    }

    public void setConcreteFacts(String concreteFacts) {
        this.concreteFacts = concreteFacts == null ? null : concreteFacts.trim();
    }

    public String getIssueTime() {
        return issueTime;
    }

    public void setIssueTime(String issueTime) {
        this.issueTime = issueTime == null ? null : issueTime.trim();
    }

    public Double getCityCheckQualityGoal() {
        return cityCheckQualityGoal;
    }

    public void setCityCheckQualityGoal(Double cityCheckQualityGoal) {
        this.cityCheckQualityGoal = cityCheckQualityGoal;
    }

    public Double getCityInputQualityGoal() {
        return cityInputQualityGoal;
    }

    public void setCityInputQualityGoal(Double cityInputQualityGoal) {
        this.cityInputQualityGoal = cityInputQualityGoal;
    }

    public Double getCityFcheckQualityGoal() {
        return cityFcheckQualityGoal;
    }

    public void setCityFcheckQualityGoal(Double cityFcheckQualityGoal) {
        this.cityFcheckQualityGoal = cityFcheckQualityGoal;
    }

    public String getCityDealIdea() {
        return cityDealIdea;
    }

    public void setCityDealIdea(String cityDealIdea) {
        this.cityDealIdea = cityDealIdea == null ? null : cityDealIdea.trim();
    }

    public String getEndReasonId() {
        return endReasonId;
    }

    public void setEndReasonId(String endReasonId) {
        this.endReasonId = endReasonId == null ? null : endReasonId.trim();
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

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
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

   
}