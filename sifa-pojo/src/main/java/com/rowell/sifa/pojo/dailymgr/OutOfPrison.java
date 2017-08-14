package com.rowell.sifa.pojo.dailymgr;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.ProcessEntity;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.sys.SysGroup;

/**
 * 延长监外执行
 * 
 * @author hxl
 * @hibernate.class table="SF_OUT_OF_PRISON"
 */
public  class OutOfPrison extends ProcessEntity<OutOfPrison> implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/**社区服刑人员 */
    private String culpritId;

	/**延长理由及依据*/
    private String reason;

	/** 延长期限时间*/
    private String extendTime;

	/** 延长期限开始时间*/
    private Date startDate;

	/** 延长期限结束时间*/
    private Date endDate;

	/*** 县矫正科确定是否推荐为典型案例 1-是 2-否*/
    private Integer recommendStatus;

	/*** 市矫正处确定是否推荐为典型案例 1-是 2-否*/
    private Integer recommendStatusS;

	/** 备注*/
    private String note;

    /**数据字典监管等级 */
    private String dicMonitorGradeKey;

	/** 法律文书附件路径*/
    private String lawNotePath;

	/** 法律文书附件名称*/
    private String lawNotePathName;

	/** 证据材料附件路径*/
    private String notePath;

	/** 证据材料附件名称*/
    private String notePathName;

	/** 鉴定结果附件路径*/
    private String resultNotePath;

	/**鉴定结果附件名称*/
    private String resultNotePathName;

    /**数据字典呈报单位类型 */
    private String dicSubOrgTypeKey;

	/**呈报单位名称 */
    private String submittionOrg;

	/** 抄送单位名称 */
    private String copyOrg;

	/** 是否符合监外执行条件 1,符合；0不符合*/
    private Integer isConform;

	/**是否有明确期限 1，有； 0没有*/
    private Integer isDeadline;

    /**法律依据 */
    private String legalBasis;

	/** 具体原因*/
    private String endDetailReason;

	/** 终止材料附件路径*/
    private String endPath;

	/**终止材料附件名称*/
    private String endPathName;


	/** 医院*/
    private String hospital;

	/** 鉴定结果*/
    private String identificationResults;

	/**法院*/
    private String court;

	/**记录签发时间*/
    private String issueTime;

	/** 抄送人民检察院*/
    private String Procuratorate;

	/** 抄送公安局*/
    private String Police;

	/**执法文书文号*/
    private String writNum;

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

	/**作废材料附件路径*/
	private String flagPath;
	
	/**作废具体原因 */
    private String flagDetailReason;

	/** 作废材料附件名称*/
	String flagPathName;
	
	protected String culpritName;
	
	protected String groupName;
	    
	protected Culprit culprit;
	    
	protected SysGroup sysGroup;

	protected String groupId;
	//延长期限（月）-起
	protected String extendTimeStart;
	//延长期限（月）-止
	protected String extendTimeEnd;
	
	//延长结束
	protected Date searchStartDate1;
	
	//延长结束
	protected Date searchEndDate1;
	
	//是否打印建议书，0表示未打印,1标识已打印
    private Integer isPrintJYS;
    //是否打印审核表,0表示未打印,1标识已打印
    private Integer isPrintSHB;
    //是否打印医学鉴定书,0表示未打印,1标识已打印
    private Integer isPrintYiXue;
    //数据字典材料送达方式
    private String dicSdfsKey;
	

    
	public Integer getIsPrintJYS() {
		return isPrintJYS;
	}

	public void setIsPrintJYS(Integer isPrintJYS) {
		this.isPrintJYS = isPrintJYS;
	}

	public Integer getIsPrintYiXue() {
		return isPrintYiXue;
	}

	public void setIsPrintYiXue(Integer isPrintYiXue) {
		this.isPrintYiXue = isPrintYiXue;
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

	public Date getSearchStartDate1() {
		return searchStartDate1;
	}

	public void setSearchStartDate1(Date searchStartDate1) {
		this.searchStartDate1 = searchStartDate1;
	}

	public Date getSearchEndDate1() {
		return searchEndDate1;
	}

	public void setSearchEndDate1(Date searchEndDate1) {
		this.searchEndDate1 = searchEndDate1;
	}

	public String getExtendTimeStart() {
		return extendTimeStart;
	}

	public void setExtendTimeStart(String extendTimeStart) {
		this.extendTimeStart = extendTimeStart;
	}

	public String getExtendTimeEnd() {
		return extendTimeEnd;
	}

	public void setExtendTimeEnd(String extendTimeEnd) {
		this.extendTimeEnd = extendTimeEnd;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getCulpritId() {
		return culpritId;
	}

	public void setCulpritId(String culpritId) {
		this.culpritId = culpritId;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getExtendTime() {
		return extendTime;
	}

	public void setExtendTime(String extendTime) {
		this.extendTime = extendTime;
	}
	@JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	@JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Integer getRecommendStatus() {
		return recommendStatus;
	}

	public void setRecommendStatus(Integer recommendStatus) {
		this.recommendStatus = recommendStatus;
	}

	public Integer getRecommendStatusS() {
		return recommendStatusS;
	}

	public void setRecommendStatusS(Integer recommendStatusS) {
		this.recommendStatusS = recommendStatusS;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getDicMonitorGradeKey() {
		return dicMonitorGradeKey;
	}

	public void setDicMonitorGradeKey(String dicMonitorGradeKey) {
		this.dicMonitorGradeKey = dicMonitorGradeKey;
	}

	public String getLawNotePath() {
		return lawNotePath;
	}

	public void setLawNotePath(String lawNotePath) {
		this.lawNotePath = lawNotePath;
	}

	public String getLawNotePathName() {
		return lawNotePathName;
	}

	public void setLawNotePathName(String lawNotePathName) {
		this.lawNotePathName = lawNotePathName;
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

	public String getResultNotePath() {
		return resultNotePath;
	}

	public void setResultNotePath(String resultNotePath) {
		this.resultNotePath = resultNotePath;
	}

	public String getResultNotePathName() {
		return resultNotePathName;
	}

	public void setResultNotePathName(String resultNotePathName) {
		this.resultNotePathName = resultNotePathName;
	}

	public String getDicSubOrgTypeKey() {
		return dicSubOrgTypeKey;
	}

	public void setDicSubOrgTypeKey(String dicSubOrgTypeKey) {
		this.dicSubOrgTypeKey = dicSubOrgTypeKey;
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

	public Integer getIsConform() {
		return isConform;
	}

	public void setIsConform(Integer isConform) {
		this.isConform = isConform;
	}

	public Integer getIsDeadline() {
		return isDeadline;
	}

	public void setIsDeadline(Integer isDeadline) {
		this.isDeadline = isDeadline;
	}

	public String getLegalBasis() {
		return legalBasis;
	}

	public void setLegalBasis(String legalBasis) {
		this.legalBasis = legalBasis;
	}

	public String getEndDetailReason() {
		return endDetailReason;
	}

	public void setEndDetailReason(String endDetailReason) {
		this.endDetailReason = endDetailReason;
	}

	public String getEndPath() {
		return endPath;
	}

	public void setEndPath(String endPath) {
		this.endPath = endPath;
	}

	public String getEndPathName() {
		return endPathName;
	}

	public void setEndPathName(String endPathName) {
		this.endPathName = endPathName;
	}

	public String getHospital() {
		return hospital;
	}

	public void setHospital(String hospital) {
		this.hospital = hospital;
	}

	public String getIdentificationResults() {
		return identificationResults;
	}

	public void setIdentificationResults(String identificationResults) {
		this.identificationResults = identificationResults;
	}

	public String getCourt() {
		return court;
	}

	public void setCourt(String court) {
		this.court = court;
	}

	public String getIssueTime() {
		return issueTime;
	}

	public void setIssueTime(String issueTime) {
		this.issueTime = issueTime;
	}

	public String getProcuratorate() {
		return Procuratorate;
	}

	public void setProcuratorate(String procuratorate) {
		Procuratorate = procuratorate;
	}

	public String getPolice() {
		return Police;
	}

	public void setPolice(String police) {
		Police = police;
	}

	public String getWritNum() {
		return writNum;
	}

	public void setWritNum(String writNum) {
		this.writNum = writNum;
	}

	public String getDicBlankFlagKey() {
		return dicBlankFlagKey;
	}

	public void setDicBlankFlagKey(String dicBlankFlagKey) {
		this.dicBlankFlagKey = dicBlankFlagKey;
	}

	public String getFlagAccountName() {
		return flagAccountName;
	}

	public void setFlagAccountName(String flagAccountName) {
		this.flagAccountName = flagAccountName;
	}

	public String getFlagAccountId() {
		return flagAccountId;
	}

	public void setFlagAccountId(String flagAccountId) {
		this.flagAccountId = flagAccountId;
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
		this.flagReasonId = flagReasonId;
	}

	public String getFlagPath() {
		return flagPath;
	}

	public void setFlagPath(String flagPath) {
		this.flagPath = flagPath;
	}

	public String getFlagDetailReason() {
		return flagDetailReason;
	}

	public void setFlagDetailReason(String flagDetailReason) {
		this.flagDetailReason = flagDetailReason;
	}

	public String getFlagPathName() {
		return flagPathName;
	}

	public void setFlagPathName(String flagPathName) {
		this.flagPathName = flagPathName;
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

	
	
	 
	 

}
