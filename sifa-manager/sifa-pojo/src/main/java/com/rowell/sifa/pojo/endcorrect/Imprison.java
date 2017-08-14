/*
* Imprison.java
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
import com.rowell.sifa.pojo.sys.SysGroup;

/**
 *   收监执行
* @Author marcle
* @version 1.0 2017-03-16
 */
public class Imprison extends ProcessEntity<Imprison> implements Serializable {
  

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 6945843998511817171L;

	/**社区服刑人员 */
    private String culpritId;

    /**对应记录ID */
    private String recordId;

    /**申请提交时间 */
    private Date applyDate;

    /**提请理由及依据 */
    private String reason;

    /**备注 */
    private String note;

    /**数据字典监管等级 */
    private String dicMonitorGradeKey;

    /**数据字典违纪原因 */
    private String dicReasonTypeKey;

    /**简要违纪情况 */
    private String detailInfo;

    /**执法文书文号 */
    private String writNum;

    /**数据字典收监类型 */
    private String dicImprisonTypeKey;

    /**收监执行处理结果 */
    private String imprisonDealResult;

    /**收监时间 */
    private Date imprisonDate;

    /**关押监狱名称 */
    private String prisonName;

    /**通报时间 */
    private Date reportDate;

    /**通报公安机关名称 */
    private String organizationName;

    /**通报人 */
    private String reportPersonName;

    /**法律文书名称 */
    private String fileName;

    /**法律文书路径 */
    private String filePath;

    /**不予收监理由 */
    private String opposeReason;

    /**结案报告附件路径 */
    private String endCasePath;

    /**结案报告附件名称 */
    private String endCasePathName;

    /**具体事实(收监执行建议书) */
    private String concreteFacts;

    /**公安（分）局 */
    private String publicSecurityBureau;

    /**检察院 */
    private String procuratorate;

    /**人民法院 */
    private String peopleCount;

    /**签发时间 */
    private String issueTime;

    /**裁定机关名称 */
    private String judgeOrg;

    /**裁定时间 */
    private Date judgeTime;

    /**裁定材料路径 */
    private String judgePath;

    /**裁定材料名称 */
    private String judgePathName;

    /**数据字典裁定结果  91501 同意，91502不同意 */
    private String dicJudgeResultKey;

    protected String culpritName;
	
	protected String groupName;
	    
	protected Culprit culprit;
	    
	protected SysGroup sysGroup;
	
	protected String groupId;
	
    public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
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

    public String getRecordId() {
        return recordId;
    }

    public void setRecordId(String recordId) {
        this.recordId = recordId == null ? null : recordId.trim();
    }
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
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

    public String getDetailInfo() {
        return detailInfo;
    }

    public void setDetailInfo(String detailInfo) {
        this.detailInfo = detailInfo == null ? null : detailInfo.trim();
    }

    public String getWritNum() {
        return writNum;
    }

    public void setWritNum(String writNum) {
        this.writNum = writNum == null ? null : writNum.trim();
    }

    public String getDicImprisonTypeKey() {
        return dicImprisonTypeKey;
    }

    public void setDicImprisonTypeKey(String dicImprisonTypeKey) {
        this.dicImprisonTypeKey = dicImprisonTypeKey == null ? null : dicImprisonTypeKey.trim();
    }

    public String getImprisonDealResult() {
        return imprisonDealResult;
    }

    public void setImprisonDealResult(String imprisonDealResult) {
        this.imprisonDealResult = imprisonDealResult == null ? null : imprisonDealResult.trim();
    }
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getImprisonDate() {
        return imprisonDate;
    }

    public void setImprisonDate(Date imprisonDate) {
        this.imprisonDate = imprisonDate;
    }

    public String getPrisonName() {
        return prisonName;
    }

    public void setPrisonName(String prisonName) {
        this.prisonName = prisonName == null ? null : prisonName.trim();
    }
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName == null ? null : organizationName.trim();
    }

    public String getReportPersonName() {
        return reportPersonName;
    }

    public void setReportPersonName(String reportPersonName) {
        this.reportPersonName = reportPersonName == null ? null : reportPersonName.trim();
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath == null ? null : filePath.trim();
    }

    public String getOpposeReason() {
        return opposeReason;
    }

    public void setOpposeReason(String opposeReason) {
        this.opposeReason = opposeReason == null ? null : opposeReason.trim();
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

    public String getConcreteFacts() {
        return concreteFacts;
    }

    public void setConcreteFacts(String concreteFacts) {
        this.concreteFacts = concreteFacts == null ? null : concreteFacts.trim();
    }

    public String getPublicSecurityBureau() {
        return publicSecurityBureau;
    }

    public void setPublicSecurityBureau(String publicSecurityBureau) {
        this.publicSecurityBureau = publicSecurityBureau == null ? null : publicSecurityBureau.trim();
    }

    public String getProcuratorate() {
        return procuratorate;
    }

    public void setProcuratorate(String procuratorate) {
        this.procuratorate = procuratorate == null ? null : procuratorate.trim();
    }

    public String getPeopleCount() {
        return peopleCount;
    }

    public void setPeopleCount(String peopleCount) {
        this.peopleCount = peopleCount == null ? null : peopleCount.trim();
    }

    public String getIssueTime() {
        return issueTime;
    }

    public void setIssueTime(String issueTime) {
        this.issueTime = issueTime == null ? null : issueTime.trim();
    }

    public String getJudgeOrg() {
        return judgeOrg;
    }

    public void setJudgeOrg(String judgeOrg) {
        this.judgeOrg = judgeOrg == null ? null : judgeOrg.trim();
    }
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getJudgeTime() {
        return judgeTime;
    }

    public void setJudgeTime(Date judgeTime) {
        this.judgeTime = judgeTime;
    }

    public String getJudgePath() {
        return judgePath;
    }

    public void setJudgePath(String judgePath) {
        this.judgePath = judgePath == null ? null : judgePath.trim();
    }

    public String getJudgePathName() {
        return judgePathName;
    }

    public void setJudgePathName(String judgePathName) {
        this.judgePathName = judgePathName == null ? null : judgePathName.trim();
    }

    public String getDicJudgeResultKey() {
        return dicJudgeResultKey;
    }

    public void setDicJudgeResultKey(String dicJudgeResultKey) {
        this.dicJudgeResultKey = dicJudgeResultKey == null ? null : dicJudgeResultKey.trim();
    }

   
}