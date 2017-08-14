/*
* Parole.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-30 created
*/
package com.rowell.sifa.pojo.rewardspunishment;

import java.io.Serializable;
import java.util.Date;

import com.rowell.sifa.pojo.base.DataEntity;
import com.rowell.sifa.pojo.base.ProcessEntity;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.pojo.sys.SysGroup;

public class Parole extends ProcessEntity<Parole> implements Serializable {

	/**
	 * @Fields field:field:{todo}(用一句话描述这个变量表示什么)
	 */

	private static final long serialVersionUID = 1L;

	private String culpritId;
	// 假释年限
	private String reduceTime;
	// 社区服刑人员
	private Date endTime;
	// 表现概况
	private String actions;
	// 法律依据
	private String reason;
	// 结案报告路径
	private String endCasePath;
	// 结案报告名称
	private String endCasePathName;
	// 证件路径
	private String evidencePath;
	// 证件名称
	private String evidencePathName;

	private Long monitorGradeId;

	private String processInstanceId;

	private String writNum;

	private String recommendStatus;

	private String recommendStatuss;

	private String handOnUnit;

	private String copyUnit;

	private String showResult;

	private String showDetail;

	private String showAction;

	private String procuratorate;

	private String procuratoratePath;

	private String procuratoratePathName;

	private String result;

	private String parolePath;

	private String parolePathName;

	private String unParoleReason;

	private String unParolePath;

	private String unParolePathName;

	private Long checkTypeId;

	private Integer isAgree;
	// 犯人名字
	protected String culpritName;
	// 犯人所在下司法所名称
	protected String sysGroupName;
	// 犯人所在下司法所ID
	protected String sysGroupId;

	// 打印标识
	private String isPrintJYS;
	protected Culprit culprit;
	protected CulpritJudgment culpritJudgment;
	protected SysGroup sysGroup;
	// 数据字典材料送达方式
	private String dicSdfsKey;
	  /**ISSUE_TIME  签发时间*/
    private String issueTime;
	
	public String getIssueTime() {
		return issueTime;
	}

	public void setIssueTime(String issueTime) {
		this.issueTime = issueTime;
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

	public String getDicSdfsKey() {
		return dicSdfsKey;
	}

	public void setDicSdfsKey(String dicSdfsKey) {
		this.dicSdfsKey = dicSdfsKey;
	}

	public String getIsPrintJYS() {
		return isPrintJYS;
	}

	public void setIsPrintJYS(String isPrintJYS) {
		this.isPrintJYS = isPrintJYS;
	}

	public String getSysGroupId() {
		return sysGroupId;
	}

	public void setSysGroupId(String sysGroupId) {
		this.sysGroupId = sysGroupId;
	}

	public String getCulpritId() {
		return culpritId;
	}

	public void setCulpritId(String culpritId) {
		this.culpritId = culpritId;
	}

	public String getReduceTime() {
		return reduceTime;
	}

	public void setReduceTime(String reduceTime) {
		this.reduceTime = reduceTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getActions() {
		return actions;
	}

	public void setActions(String actions) {
		this.actions = actions;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
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

	public String getEvidencePath() {
		return evidencePath;
	}

	public void setEvidencePath(String evidencePath) {
		this.evidencePath = evidencePath;
	}

	public String getEvidencePathName() {
		return evidencePathName;
	}

	public void setEvidencePathName(String evidencePathName) {
		this.evidencePathName = evidencePathName;
	}

	public Long getMonitorGradeId() {
		return monitorGradeId;
	}

	public void setMonitorGradeId(Long monitorGradeId) {
		this.monitorGradeId = monitorGradeId;
	}

	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
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

	public void setRecommendStatuss(String recommendStatuss) {
		this.recommendStatuss = recommendStatuss;
	}

	public String getHandOnUnit() {
		return handOnUnit;
	}

	public void setHandOnUnit(String handOnUnit) {
		this.handOnUnit = handOnUnit;
	}

	public String getCopyUnit() {
		return copyUnit;
	}

	public void setCopyUnit(String copyUnit) {
		this.copyUnit = copyUnit;
	}

	public String getShowResult() {
		return showResult;
	}

	public void setShowResult(String showResult) {
		this.showResult = showResult;
	}

	public String getShowDetail() {
		return showDetail;
	}

	public void setShowDetail(String showDetail) {
		this.showDetail = showDetail;
	}

	public String getShowAction() {
		return showAction;
	}

	public void setShowAction(String showAction) {
		this.showAction = showAction;
	}

	public String getProcuratorate() {
		return procuratorate;
	}

	public void setProcuratorate(String procuratorate) {
		this.procuratorate = procuratorate;
	}

	public String getProcuratoratePath() {
		return procuratoratePath;
	}

	public void setProcuratoratePath(String procuratoratePath) {
		this.procuratoratePath = procuratoratePath;
	}

	public String getProcuratoratePathName() {
		return procuratoratePathName;
	}

	public void setProcuratoratePathName(String procuratoratePathName) {
		this.procuratoratePathName = procuratoratePathName;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getParolePath() {
		return parolePath;
	}

	public void setParolePath(String parolePath) {
		this.parolePath = parolePath;
	}

	public String getParolePathName() {
		return parolePathName;
	}

	public void setParolePathName(String parolePathName) {
		this.parolePathName = parolePathName;
	}

	public String getUnParoleReason() {
		return unParoleReason;
	}

	public void setUnParoleReason(String unParoleReason) {
		this.unParoleReason = unParoleReason;
	}

	public String getUnParolePath() {
		return unParolePath;
	}

	public void setUnParolePath(String unParolePath) {
		this.unParolePath = unParolePath;
	}

	public String getUnParolePathName() {
		return unParolePathName;
	}

	public void setUnParolePathName(String unParolePathName) {
		this.unParolePathName = unParolePathName;
	}

	public Long getCheckTypeId() {
		return checkTypeId;
	}

	public void setCheckTypeId(Long checkTypeId) {
		this.checkTypeId = checkTypeId;
	}

	public Integer getIsAgree() {
		return isAgree;
	}

	public void setIsAgree(Integer isAgree) {
		this.isAgree = isAgree;
	}

	public String getCulpritName() {
		return culpritName;
	}

	public void setCulpritName(String culpritName) {
		this.culpritName = culpritName;
	}

	public String getSysGroupName() {
		return sysGroupName;
	}

	public void setSysGroupName(String sysGroupName) {
		this.sysGroupName = sysGroupName;
	}

}