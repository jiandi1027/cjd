/*
* ReducePenalty.java
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
 *   减刑
* @Author marcle
* @version 1.0 2017-03-16
 */
public class ReducePenalty extends ProcessEntity<ReducePenalty> implements Serializable {


	private static final long serialVersionUID = -7451132056371663118L;

	/**社区服刑人员 */
    private String culpritId;

    /**减刑年限 */
    private String reduceTime;

    /**申请时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone="GMT+8") 
    private Date endTime;

    /**表现概况 */
    private String actions;

    /**法律依据 */
    private String reason;

    /**结案报告附件 */
    private String endCasePath;

    /**结案报告附件名称 */
    private String endCasePathName;

    /**证据材料 */
    private String evidencePath;

    /**证据材料名称 */
    private String evidencePathName;

    /**司法所意见 */
    private String opinion;

    /**县级司法行政机关意见 */
    private String countyViews;

    /**地级司法局审批意见 */
    private String cityOpinion;

    /**数据字典监管等级 */
    private String dicMonitorGradeKey;

    /**执法文书文号 */
    private String writNum;

    /**呈报单位 */
    private String handOnUnit;

    /**抄送单位 */
    private String copyUnit;

    /**公示结果 */
    private String showResult;

    /**公示意见 */
    private String showDetail;

    /**处理结果 */
    private String showAction;

    /**检察院意见 */
    private String procuratorate;

    /**检察院意见附件 */
    private String procuratoratePath;

    /**检察院意见附件名称 */
    private String procuratoratePathName;

    /**最终结果 */
    private String result;

    /**减刑法律文书 */
    private String reducePath;

    /**减刑法律文书名称 */
    private String reducePathName;

    /**不予减刑原因 */
    private String unReduceReason;

    /**不予减刑法律文书 */
    private String unReducePath;

    /**不予减刑法律文书名称 */
    private String unReducePathName;

    /**数据字典抽查类型 */
    private String dicCheckTypeKey;

    /**具体事实(相关建议书) */
    private String concreteFacts;

    /**法院 */
    private String court;

    /**检查院 */
    private String peopleProcuratorate;

    /**公安局 */
    private String police;

    /**监狱 */
    private String prison;

    /**签发时间 */
    private String issueTime;
    
    /**流程ID */
    private String processInstanceId;
    
    private String culpritName;
    
    private String groupName;
    protected Culprit culprit;
    protected CulpritJudgment culpritJudgment;
	protected SysGroup sysGroup;
	private String isPrintJYS;
	 //数据字典材料送达方式
    private String dicSdfsKey;
	
    
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

	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
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

	public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getReduceTime() {
        return reduceTime;
    }

    public void setReduceTime(String reduceTime) {
        this.reduceTime = reduceTime == null ? null : reduceTime.trim();
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
        this.actions = actions == null ? null : actions.trim();
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
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

    public String getEvidencePath() {
        return evidencePath;
    }

    public void setEvidencePath(String evidencePath) {
        this.evidencePath = evidencePath == null ? null : evidencePath.trim();
    }

    public String getEvidencePathName() {
        return evidencePathName;
    }

    public void setEvidencePathName(String evidencePathName) {
        this.evidencePathName = evidencePathName == null ? null : evidencePathName.trim();
    }

    public String getOpinion() {
        return opinion;
    }

    public void setOpinion(String opinion) {
        this.opinion = opinion == null ? null : opinion.trim();
    }

    public String getCountyViews() {
        return countyViews;
    }

    public void setCountyViews(String countyViews) {
        this.countyViews = countyViews == null ? null : countyViews.trim();
    }

    public String getCityOpinion() {
        return cityOpinion;
    }

    public void setCityOpinion(String cityOpinion) {
        this.cityOpinion = cityOpinion == null ? null : cityOpinion.trim();
    }

    public String getDicMonitorGradeKey() {
        return dicMonitorGradeKey;
    }

    public void setDicMonitorGradeKey(String dicMonitorGradeKey) {
        this.dicMonitorGradeKey = dicMonitorGradeKey == null ? null : dicMonitorGradeKey.trim();
    }

    public String getWritNum() {
        return writNum;
    }

    public void setWritNum(String writNum) {
        this.writNum = writNum == null ? null : writNum.trim();
    }

    public String getHandOnUnit() {
        return handOnUnit;
    }

    public void setHandOnUnit(String handOnUnit) {
        this.handOnUnit = handOnUnit == null ? null : handOnUnit.trim();
    }

    public String getCopyUnit() {
        return copyUnit;
    }

    public void setCopyUnit(String copyUnit) {
        this.copyUnit = copyUnit == null ? null : copyUnit.trim();
    }

    public String getShowResult() {
        return showResult;
    }

    public void setShowResult(String showResult) {
        this.showResult = showResult == null ? null : showResult.trim();
    }

    public String getShowDetail() {
        return showDetail;
    }

    public void setShowDetail(String showDetail) {
        this.showDetail = showDetail == null ? null : showDetail.trim();
    }

    public String getShowAction() {
        return showAction;
    }

    public void setShowAction(String showAction) {
        this.showAction = showAction == null ? null : showAction.trim();
    }

    public String getProcuratorate() {
        return procuratorate;
    }

    public void setProcuratorate(String procuratorate) {
        this.procuratorate = procuratorate == null ? null : procuratorate.trim();
    }

    public String getProcuratoratePath() {
        return procuratoratePath;
    }

    public void setProcuratoratePath(String procuratoratePath) {
        this.procuratoratePath = procuratoratePath == null ? null : procuratoratePath.trim();
    }

    public String getProcuratoratePathName() {
        return procuratoratePathName;
    }

    public void setProcuratoratePathName(String procuratoratePathName) {
        this.procuratoratePathName = procuratoratePathName == null ? null : procuratoratePathName.trim();
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result == null ? null : result.trim();
    }

    public String getReducePath() {
        return reducePath;
    }

    public void setReducePath(String reducePath) {
        this.reducePath = reducePath == null ? null : reducePath.trim();
    }

    public String getReducePathName() {
        return reducePathName;
    }

    public void setReducePathName(String reducePathName) {
        this.reducePathName = reducePathName == null ? null : reducePathName.trim();
    }

    public String getUnReduceReason() {
        return unReduceReason;
    }

    public void setUnReduceReason(String unReduceReason) {
        this.unReduceReason = unReduceReason == null ? null : unReduceReason.trim();
    }

    public String getUnReducePath() {
        return unReducePath;
    }

    public void setUnReducePath(String unReducePath) {
        this.unReducePath = unReducePath == null ? null : unReducePath.trim();
    }

    public String getUnReducePathName() {
        return unReducePathName;
    }

    public void setUnReducePathName(String unReducePathName) {
        this.unReducePathName = unReducePathName == null ? null : unReducePathName.trim();
    }

    public String getDicCheckTypeKey() {
        return dicCheckTypeKey;
    }

    public void setDicCheckTypeKey(String dicCheckTypeKey) {
        this.dicCheckTypeKey = dicCheckTypeKey == null ? null : dicCheckTypeKey.trim();
    }

    public String getConcreteFacts() {
        return concreteFacts;
    }

    public void setConcreteFacts(String concreteFacts) {
        this.concreteFacts = concreteFacts == null ? null : concreteFacts.trim();
    }

    public String getCourt() {
        return court;
    }

    public void setCourt(String court) {
        this.court = court == null ? null : court.trim();
    }

    public String getPeopleProcuratorate() {
        return peopleProcuratorate;
    }

    public void setPeopleProcuratorate(String peopleProcuratorate) {
        this.peopleProcuratorate = peopleProcuratorate == null ? null : peopleProcuratorate.trim();
    }

    public String getPolice() {
        return police;
    }

    public void setPolice(String police) {
        this.police = police == null ? null : police.trim();
    }

    public String getPrison() {
        return prison;
    }

    public void setPrison(String prison) {
        this.prison = prison == null ? null : prison.trim();
    }

    public String getIssueTime() {
        return issueTime;
    }

    public void setIssueTime(String issueTime) {
        this.issueTime = issueTime == null ? null : issueTime.trim();
    }

   
}