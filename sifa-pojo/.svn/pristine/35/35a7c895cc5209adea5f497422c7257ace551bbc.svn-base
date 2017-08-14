package com.rowell.sifa.pojo.rewardspunishment;

import java.io.Serializable;
import java.sql.Timestamp;

import com.rowell.sifa.pojo.base.ProcessEntity;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.pojo.sys.SysGroup;

/**
 *   提请治安管理处罚
* @Author pkx
* @version 1.0 2017-04-01
 */
public class SecurityPunishment extends ProcessEntity<SecurityPunishment> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8034048934518914645L;

	/**
	 * 抽查类型
	 * 
	 * @hibernate.property column="CHECK_TYPE_ID" type="long"
	 * 1--系统自动抽查，2--随机抽查
	 */
	private String checkTypeId;
	
	/**
	 * 矫正对象ID
	 * 
	 * @hibernate.property column="CULPRIT_ID" type="long"
	 */
	private String culpritId;

	/**
	 * 司法部门ID
	 * 
	 * @hibernate.property column="GROUP_ID" type="long"
	 */
	private String groupId;

	/**
	 * 申请提交时间
	 * 
	 * @hibernate.property column="APPLY_DATE" type="timestamp"
	 */
	private Timestamp applyDate;

	/**
	 * 处理依据
	 * 
	 * @hibernate.property column="REASON"
	 *                     type="org.springframework.orm.hibernate3.support.ClobStringType"
	 */
	private String reason;

	/**
	 * 简要违纪情况
	 * 
	 * @hibernate.property column="DETAIL_INFO" type="string"
	 */
	private String detailInfo;

	/**
	 * 操作员意见
	 * 
	 * @hibernate.property column="ACCOUNT_OPINION"
	 *                     type="org.springframework.orm.hibernate3.support.ClobStringType"
	 */
	private String accountOpinion;

	/**
	 * 司法所意见
	 * 
	 * @hibernate.property column="OPINION"
	 *                     type="org.springframework.orm.hibernate3.support.ClobStringType"
	 */
	private String opinion;

	/**
	 * 司法所审核时间
	 * 
	 * @hibernate.property column="SFS_TIME" type="timestamp"
	 */
	private Timestamp sfsTime;

	/**
	 * 县级司法行政机关意见
	 * 
	 * @hibernate.property column="COUNTY_VIEWS"
	 *                     type="org.springframework.orm.hibernate3.support.ClobStringType"
	 */
	private String countyViews;

	/**
	 * 县级司法行政机关审核时间
	 * 
	 * @hibernate.property column="XSF_TIME" type="timestamp"
	 */
	private Timestamp xsfTime;

	/**
	 * 地级司法局审批意见
	 * 
	 * @hibernate.property column="CITY_OPINION"
	 *                     type="org.springframework.orm.hibernate3.support.ClobStringType"
	 */
	private String cityOpinion;

	/**
	 * 地级司法局审批时间
	 * 
	 * @hibernate.property column="SSF_TIME" type="timestamp"
	 */
	private Timestamp ssfTime;

	/**
	 * 备注
	 * 
	 * @hibernate.property column="NOTE"
	 *                     type="org.springframework.orm.hibernate3.support.ClobStringType"
	 */
	private String note;

	/**
	 * 操作员ID
	 * 
	 * @hibernate.property column="ACCOUNT_ID" type="long"
	 */
	private String accountId;

	/**
	 * 监管等级
	 * 
	 * @hibernate.property column="MONITOR_GRADE_ID" type="long"
	 */
	private String monitorGradeId;

	/**
	 * 办案质量
	 * 
	 * @hibernate.property column="HANDLE_QUALITY_ID" type="long"
	 */
	private String handleQualityId;

	/**
	 * 办案分值
	 * 
	 * @hibernate.property column="HANDLE_QUALITY_GOAL" type="double"
	 */
	private Double handleQualityGoal;

	/**
	 * 矫正科执法分值
	 * 
	 * @hibernate.property column="JACTION_QUALITY_GOAL" type="double"
	 */
	private Double jactionQualityGoal;

	/**
	 * 矫正科意见
	 * 
	 * @hibernate.property column="JZK_OPINION" type="string"
	 */
	private String jzkOpinion;

	/**
	 * 执法质量
	 * 
	 * @hibernate.property column="ACTION_QUALITY_ID" type="long"
	 */
	private String actionQualityId;

	/**
	 * 法制科执法分值
	 * 
	 * @hibernate.property column="FACTION_QUALITY_GOAL" type="double"
	 */
	private Double factionQualityGoal;

	/**
	 * 法制科意见
	 * 
	 * @hibernate.property column="FZK_OPINION" type="string"
	 */
	private String fzkOpinion;

	/**
	 * 市办案质量
	 * 
	 * @hibernate.property column="CITY_HANDLE_QUALITY_ID" type="long"
	 */
	private String cityHandleQualityId;

	/**
	 * 市办案分值
	 * 
	 * @hibernate.property column="CITY_HANDLE_QUALITY_GOAL" type="double"
	 */
	private Double cityHandleQualityGoal;

	/**
	 * 矫正处意见
	 * 
	 * @hibernate.property column="JZC_OPINION" type="string"
	 */
	private String jzcOpinion;

	/**
	 * 市执法质量
	 * 
	 * @hibernate.property column="CITY_ACTION_QUALITY_ID" type="long"
	 */
	private String cityActionQualityId;

	/**
	 * 矫正处执法分值
	 * 
	 * @hibernate.property column="CITY_JACTION_QUALITY_GOAL" type="double"
	 */
	private Double cityJactionQualityGoal;

	/**
	 * 法制处执法分值
	 * 
	 * @hibernate.property column="CITY_FACTION_QUALITY_GOAL" type="double"
	 */
	private Double cityFactionQualityGoal;

	/**
	 * 法制处意见
	 * 
	 * @hibernate.property column="FZC_OPINION" type="string"
	 */
	private String fzcOpinion;

	/**
	 * 违纪原因
	 * 
	 * @hibernate.property column="REASON_TYPE_ID" type="long"
	 */
	private String reasonTypeId;

	/**
	 * 执法文书文号
	 * 
	 * @hibernate.property column="WRIT_NUM" type="string"
	 */
	private String writNum;

	/**
	 * 县矫正科确定是否推荐为典型案例 1-是 2-否
	 * 
	 * @hibernate.property column="RECOMMEND_STATUS" type="string"
	 */
	private String recommendStatus;

	/**
	 * 市矫正处确定是否推荐为典型案例 1-是 2-否
	 * 
	 * @hibernate.property column="RECOMMEND_STATUSS" type="string"
	 */
	private String recommendStatuss;

	/**
	 * 结案报告附件
	 * 
	 * @hibernate.property column="END_CASE_PATH" type="string"
	 */
	private String endCasePath;

	/**
	 * 结案报告附件名称
	 * 
	 * @hibernate.property column="END_CASE_PATH_NAME" type="string"
	 */
	private String endCasePathName;

	/**
	 * 证据材料附件路径
	 * 
	 * @hibernate.property column="NOTE_PATH" type="string"
	 */
	private String notePath;

	/**
	 * 证据材料附件名称
	 * 
	 * @hibernate.property column="NOTE_PATH_NAME" type="string"
	 */
	private String notePathName;

	/**
	 * 呈报单位类型
	 * 
	 * @hibernate.property column="SUBMITTION_ORG_TYPE_ID" type="long"
	 */
	private String submittionOrgTypeId;

	/**
	 * 呈报单位名称
	 * 
	 * @hibernate.property column="SUBMITTION_ORG" type="string"
	 */
	private String submittionOrg;

	/**
	 * 抄送单位名称
	 * 
	 * @hibernate.property column="COPY_ORG" type="string"
	 */
	private String copyOrg;

	/**
	 * 法律依据
	 * 
	 * @hibernate.property column="LEGAL_BASIS" type="long"
	 */
	private Long legalBasis;

	/**
	 * 具体事实(治安处罚管理建议书)
	 * 
	 * @hibernate.property column="CONCRETE_FACTS" type="org.springframework.orm.hibernate3.support.ClobStringType"
	 */
	private String concreteFacts;

	/**
	 *公安（分）局 
	 * 
	 * @hibernate.property column="PUBLIC_SECURITY_BUREAU" type="string"
	 */
	private String publicSecurityBureau;
	
	/**
	 * 检察院
	 * @hibernate.property column="PROCURATORATE" type="string"
	 */
	private String procuratorate;
	
	/**
	 * 签发时间
	 * 
     *@hibernate.property column="ISSUE_TIME" type="string"
	 */
	private String issueTime;
	
	/**
	 *市矫正处考评意见
	 * 
     *@hibernate.property column="CITY_DEAL_IDEA" type="string"
	 */
	private String cityDealIdea;
	
	/**
	 * 市级执法质量
	 * 
	 * @hibernate.property column="CITY_CHECK_QUALITY_GOAL" type="double"
	 */
	private Double cityCheckQualityGoal;
	
	/**
	 * 市级输入质量
	 * 
	 * @hibernate.property column="CITY_INPUT_QUALITY_GOAL" type="double"
	 */
	private Double cityInputQualityGoal;
	
	/**
	 * 市级法制处执法质量
	 * 
	 * @hibernate.property column="CITY_FCHECK_QUALITY_GOAL" type="double"
	 */
	private Double cityFcheckQualityGoal;
	
	//评议表
	/**
	 * 评议表 名称
	 * 
	 * @hibernate.property column="PINGYI_PATH_NAME" type="string"
	 */
	private String pingyiPathName;
	
	/**
	 * 评议表 路径
	 * 
	 * @hibernate.property column="PINGYI_PATH" type="string"
	 */
	private String pingyiPath;
	
	/**
	 * 评议表上传 操作员ID
	 * 
	 * @hibernate.property column="COP_ACCOUN_ID" type="long"
	 */
	private String copAccounId;
	
	/**
	 * 评议表上传 时间
	 * 
     *@hibernate.property column="OPT_TIME" type="timestamp"
	 */
	private Timestamp optTime;
	
	/**
	 * 记录作废标记 1-否 2-是
	 * 
	 * @hibernate.property column="BLANK_FLAG" type="string"
	 */
	private String blankFlag;
    
    protected Culprit culprit;
    protected CulpritJudgment culpritJudgment;
	protected SysGroup sysGroup;
	protected String groupName;
	protected String culpritName;
	   //是否打印建议书，0表示未打印,1标识已打印
    private Integer isPrintJYS;
    //是否打印审核表
    private Integer isPrintSHB;
    //数据字典材料送达方式
    private String dicSdfsKey;
    public Integer getIsPrintJYS()
	{
		return isPrintJYS;
	}

	public void setIsPrintJYS(Integer isPrintJYS)
	{
		this.isPrintJYS = isPrintJYS;
	}

	public Integer getIsPrintSHB()
	{
		return isPrintSHB;
	}

	public void setIsPrintSHB(Integer isPrintSHB)
	{
		this.isPrintSHB = isPrintSHB;
	}

	public String getDicSdfsKey() {
		return dicSdfsKey;
	}

	public void setDicSdfsKey(String dicSdfsKey) {
		this.dicSdfsKey = dicSdfsKey;
	}

	public String getCheckTypeId() {
		return checkTypeId;
	}

	public void setCheckTypeId(String checkTypeId) {
		this.checkTypeId = checkTypeId;
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

	public Timestamp getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Timestamp applyDate) {
		this.applyDate = applyDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getDetailInfo() {
		return detailInfo;
	}

	public void setDetailInfo(String detailInfo) {
		this.detailInfo = detailInfo;
	}

	public String getAccountOpinion() {
		return accountOpinion;
	}

	public void setAccountOpinion(String accountOpinion) {
		this.accountOpinion = accountOpinion;
	}

	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	public Timestamp getSfsTime() {
		return sfsTime;
	}

	public void setSfsTime(Timestamp sfsTime) {
		this.sfsTime = sfsTime;
	}

	public String getCountyViews() {
		return countyViews;
	}

	public void setCountyViews(String countyViews) {
		this.countyViews = countyViews;
	}

	public Timestamp getXsfTime() {
		return xsfTime;
	}

	public void setXsfTime(Timestamp xsfTime) {
		this.xsfTime = xsfTime;
	}

	public String getCityOpinion() {
		return cityOpinion;
	}

	public void setCityOpinion(String cityOpinion) {
		this.cityOpinion = cityOpinion;
	}

	public Timestamp getSsfTime() {
		return ssfTime;
	}

	public void setSsfTime(Timestamp ssfTime) {
		this.ssfTime = ssfTime;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getMonitorGradeId() {
		return monitorGradeId;
	}

	public void setMonitorGradeId(String monitorGradeId) {
		this.monitorGradeId = monitorGradeId;
	}

	public String getHandleQualityId() {
		return handleQualityId;
	}

	public void setHandleQualityId(String handleQualityId) {
		this.handleQualityId = handleQualityId;
	}

	public Double getHandleQualityGoal() {
		return handleQualityGoal;
	}

	public void setHandleQualityGoal(Double handleQualityGoal) {
		this.handleQualityGoal = handleQualityGoal;
	}

	public Double getJactionQualityGoal() {
		return jactionQualityGoal;
	}

	public void setJactionQualityGoal(Double jactionQualityGoal) {
		this.jactionQualityGoal = jactionQualityGoal;
	}

	public String getJzkOpinion() {
		return jzkOpinion;
	}

	public void setJzkOpinion(String jzkOpinion) {
		this.jzkOpinion = jzkOpinion;
	}

	public String getActionQualityId() {
		return actionQualityId;
	}

	public void setActionQualityId(String actionQualityId) {
		this.actionQualityId = actionQualityId;
	}

	public Double getFactionQualityGoal() {
		return factionQualityGoal;
	}

	public void setFactionQualityGoal(Double factionQualityGoal) {
		this.factionQualityGoal = factionQualityGoal;
	}

	public String getFzkOpinion() {
		return fzkOpinion;
	}

	public void setFzkOpinion(String fzkOpinion) {
		this.fzkOpinion = fzkOpinion;
	}

	public String getCityHandleQualityId() {
		return cityHandleQualityId;
	}

	public void setCityHandleQualityId(String cityHandleQualityId) {
		this.cityHandleQualityId = cityHandleQualityId;
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
		this.jzcOpinion = jzcOpinion;
	}

	public String getCityActionQualityId() {
		return cityActionQualityId;
	}

	public void setCityActionQualityId(String cityActionQualityId) {
		this.cityActionQualityId = cityActionQualityId;
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
		this.fzcOpinion = fzcOpinion;
	}

	public String getReasonTypeId() {
		return reasonTypeId;
	}

	public void setReasonTypeId(String reasonTypeId) {
		this.reasonTypeId = reasonTypeId;
	}

	public String getWritNum() {
		return writNum;
	}

	public void setWritNum(String writNum) {
		this.writNum = writNum;
	}

	public String getRecommendStatus() {
		return recommendStatus;
	}

	public void setRecommendStatus(String recommendStatus) {
		this.recommendStatus = recommendStatus;
	}

	public String getRecommendStatuss() {
		return recommendStatuss;
	}

	public void setRecommendStatusS(String recommendStatuss) {
		this.recommendStatuss = recommendStatuss;
	}

	public String getEndCasePath() {
		return endCasePath;
	}

	public void setEndCasePath(String endCasePath) {
		this.endCasePath = endCasePath;
	}

	public String getEndCasePathName() {
		return endCasePathName;
	}

	public void setEndCasePathName(String endCasePathName) {
		this.endCasePathName = endCasePathName;
	}

	public String getNotePath() {
		return notePath;
	}

	public void setNotePath(String notePath) {
		this.notePath = notePath;
	}

	public String getNotePathName() {
		return notePathName;
	}

	public void setNotePathName(String notePathName) {
		this.notePathName = notePathName;
	}

	public String getSubmittionOrgTypeId() {
		return submittionOrgTypeId;
	}

	public void setSubmittionOrgTypeId(String submittionOrgTypeId) {
		this.submittionOrgTypeId = submittionOrgTypeId;
	}

	public String getSubmittionOrg() {
		return submittionOrg;
	}

	public void setSubmittionOrg(String submittionOrg) {
		this.submittionOrg = submittionOrg;
	}

	public String getCopyOrg() {
		return copyOrg;
	}

	public void setCopyOrg(String copyOrg) {
		this.copyOrg = copyOrg;
	}

	public Long getLegalBasis() {
		return legalBasis;
	}

	public void setLegalBasis(Long legalBasis) {
		this.legalBasis = legalBasis;
	}

	public String getConcreteFacts() {
		return concreteFacts;
	}

	public void setConcreteFacts(String concreteFacts) {
		this.concreteFacts = concreteFacts;
	}

	public String getPublicSecurityBureau() {
		return publicSecurityBureau;
	}

	public void setPublicSecurityBureau(String publicSecurityBureau) {
		this.publicSecurityBureau = publicSecurityBureau;
	}

	public String getProcuratorate() {
		return procuratorate;
	}

	public void setProcuratorate(String procuratorate) {
		this.procuratorate = procuratorate;
	}

	public String getIssueTime() {
		return issueTime;
	}

	public void setIssueTime(String issueTime) {
		this.issueTime = issueTime;
	}

	public String getCityDealIdea() {
		return cityDealIdea;
	}

	public void setCityDealIdea(String cityDealIdea) {
		this.cityDealIdea = cityDealIdea;
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

	public String getPingyiPathName() {
		return pingyiPathName;
	}

	public void setPingyiPathName(String pingyiPathName) {
		this.pingyiPathName = pingyiPathName;
	}

	public String getPingyiPath() {
		return pingyiPath;
	}

	public void setPingyiPath(String pingyiPath) {
		this.pingyiPath = pingyiPath;
	}

	public String getCopAccounId() {
		return copAccounId;
	}

	public void setCopAccounId(String copAccounId) {
		this.copAccounId = copAccounId;
	}

	public Timestamp getOptTime() {
		return optTime;
	}

	public void setOptTime(Timestamp optTime) {
		this.optTime = optTime;
	}

	public String getBlankFlag() {
		return blankFlag;
	}

	public void setBlankFlag(String blankFlag) {
		this.blankFlag = blankFlag;
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

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getCulpritName() {
		return culpritName;
	}

	public void setCulpritName(String culpritName) {
		this.culpritName = culpritName;
	}

}