/*
* AskLeave.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-02-28 created
*/
package com.rowell.sifa.pojo.dailymgr;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.rowell.sifa.pojo.base.ProcessEntity;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.sys.SysGroup;

/**
 *   请假
* @Author marcle
* @version 1.0 2017-02-28
 */
@SuppressWarnings("serial")
@JsonInclude(Include.NON_NULL) 
public class AskLeave extends ProcessEntity<AskLeave> implements Serializable {
   

    /**请假目的地 */
    private String place;

    /**请假理由 */
    private String reason;

    /**请假时间 */
    private Date doDate;

    /**请假开始时间 */
    private Date beginDate;

    /**请假结束时间 */
    private Date endDate;

    /**数据字典状态 */
    private String dicStatusKey;

    /**批准人 */
    private String approvePerson;

    /**备注 */
    private String note;

    /**犯人 */
    private String culpritId;

    /**文档实际所在的文件路径 */
    private String path;

    /**文档名称 */
    private String name;

    /**文檔/附件关联对象 */
    private String documentId;

    /**是否逾期 */
    private Integer isOverdue;

    /**活动范围 */
    private String activeArea;

    /**被访着姓名 */
    private String askName;

    /**关系 */
    private String relation;

    /**职业及工作单位 */
    private String job;

    /**数据字典被访者政治面貌 */
    private String dicPoliticStatusKey;

    /**被访家庭住址 */
    private String askAddress;

    /**共请假几天 */
    private Integer leaveDays;

    /**司法所意见 */
    private String sfsView;

    /**FILE_PATH */
    private String filePath;

    /**数据字典上报状态 */
    private String dicReportStatusKey;

    /**文档名称 */
    private String uploadFileName;

    /**文档实际所在的文件路径 */
    private String uploadFilePath;

    /**外出目的地所在省 */
    private String wcmddszs;

    /**外出目的地所在地市 */
    private String wcmddszd;

    /**外出目的地所在县 */
    private String wcmddszx;

    /**外出目的地所在乡镇或街道 */
    private String wcmddxz;

    /**目的地联系人联系方式 */
    private String mddlxrlxfs;

    /**日常表现情况 */
    private String djr;

    /**司法所审核时间 */
    private Date sfsshsj;

    /**县（市、区）司法局审批人 */
    private String xsfjspr;

    /**县（市、区）司法局审批时间 */
    private Date xsfjspsj;

    /**县（市、区）司法局审批意见 */
    private String xsfjspyj;

    /**外出返回时间 */
    private Date wcfhsj;

    /**县矫正股意见 */
    private String jzkView;

    /**数据字典审批状态 0 上报 1-司法所所长审核 2-矫正股 3-县分管 4-打印 */
    private String dicCheckStatusKey;

    /**数据字典抽查类型 */
    private String dicCheckTypeKey;

    /**延期时间(延期申请时，将之前的请假结束时间付给这个字段) */
    private Date delayBeforeDate;

    /**延期理由 */
    private String delayReason;

    /**延期附件名称 */
    private String delayFilePathName;

    /**延期附件 */
    private String delayFilePath;

    /**终止同意请假的原因 */
    private String disAgreeReason;

    /**操作员ID */
    private String disAccountId;

    /**终止同意使用的账号名称 */
    private String disAccount;

    /**终止时间 */
    private Date disTime;

    /**UPDATE_FILE_NAME */
    private String updateFileName;

    /**UPDATE_FILE_PATH */
    private String updateFilePath;
    
    
    protected String culpritName;
    protected String groupName;
    protected Culprit culprit;
    protected SysGroup sysGroup;
    protected String groupId;
    
    //是否已打印外出证明
    private Integer isPrintWCZM;

    public Integer getIsPrintWCZM()
	{
		return isPrintWCZM;
	}

	public void setIsPrintWCZM(Integer isPrintWCZM)
	{
		this.isPrintWCZM = isPrintWCZM;
	}

	public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place == null ? null : place.trim();
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public Date getDoDate() {
        return doDate;
    }

    public void setDoDate(Date doDate) {
        this.doDate = doDate;
    }
    
    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }
    
    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getDicStatusKey() {
        return dicStatusKey;
    }

    public void setDicStatusKey(String dicStatusKey) {
        this.dicStatusKey = dicStatusKey == null ? null : dicStatusKey.trim();
    }

    public String getApprovePerson() {
        return approvePerson;
    }

    public void setApprovePerson(String approvePerson) {
        this.approvePerson = approvePerson == null ? null : approvePerson.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDocumentId() {
        return documentId;
    }

    public void setDocumentId(String documentId) {
        this.documentId = documentId == null ? null : documentId.trim();
    }

    public Integer getIsOverdue() {
        return isOverdue;
    }

    public void setIsOverdue(Integer isOverdue) {
        this.isOverdue = isOverdue;
    }

    public String getActiveArea() {
        return activeArea;
    }

    public void setActiveArea(String activeArea) {
        this.activeArea = activeArea == null ? null : activeArea.trim();
    }

    public String getAskName() {
        return askName;
    }

    public void setAskName(String askName) {
        this.askName = askName == null ? null : askName.trim();
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation == null ? null : relation.trim();
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public String getDicPoliticStatusKey() {
        return dicPoliticStatusKey;
    }

    public void setDicPoliticStatusKey(String dicPoliticStatusKey) {
        this.dicPoliticStatusKey = dicPoliticStatusKey == null ? null : dicPoliticStatusKey.trim();
    }

    public String getAskAddress() {
        return askAddress;
    }

    public void setAskAddress(String askAddress) {
        this.askAddress = askAddress == null ? null : askAddress.trim();
    }

    public Integer getLeaveDays() {
        return leaveDays;
    }

    public void setLeaveDays(Integer leaveDays) {
        this.leaveDays = leaveDays;
    }

    public String getSfsView() {
        return sfsView;
    }

    public void setSfsView(String sfsView) {
        this.sfsView = sfsView == null ? null : sfsView.trim();
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath == null ? null : filePath.trim();
    }

    public String getDicReportStatusKey() {
        return dicReportStatusKey;
    }

    public void setDicReportStatusKey(String dicReportStatusKey) {
        this.dicReportStatusKey = dicReportStatusKey == null ? null : dicReportStatusKey.trim();
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName == null ? null : uploadFileName.trim();
    }

    public String getUploadFilePath() {
        return uploadFilePath;
    }

    public void setUploadFilePath(String uploadFilePath) {
        this.uploadFilePath = uploadFilePath == null ? null : uploadFilePath.trim();
    }

    public String getWcmddszs() {
        return wcmddszs;
    }

    public void setWcmddszs(String wcmddszs) {
        this.wcmddszs = wcmddszs == null ? null : wcmddszs.trim();
    }

    public String getWcmddszd() {
        return wcmddszd;
    }

    public void setWcmddszd(String wcmddszd) {
        this.wcmddszd = wcmddszd == null ? null : wcmddszd.trim();
    }

    public String getWcmddszx() {
        return wcmddszx;
    }

    public void setWcmddszx(String wcmddszx) {
        this.wcmddszx = wcmddszx == null ? null : wcmddszx.trim();
    }

    public String getWcmddxz() {
        return wcmddxz;
    }

    public void setWcmddxz(String wcmddxz) {
        this.wcmddxz = wcmddxz == null ? null : wcmddxz.trim();
    }

    public String getMddlxrlxfs() {
        return mddlxrlxfs;
    }

    public void setMddlxrlxfs(String mddlxrlxfs) {
        this.mddlxrlxfs = mddlxrlxfs == null ? null : mddlxrlxfs.trim();
    }

    public String getDjr() {
        return djr;
    }

    public void setDjr(String djr) {
        this.djr = djr == null ? null : djr.trim();
    }

    public Date getSfsshsj() {
        return sfsshsj;
    }

    public void setSfsshsj(Date sfsshsj) {
        this.sfsshsj = sfsshsj;
    }

    public String getXsfjspr() {
        return xsfjspr;
    }

    public void setXsfjspr(String xsfjspr) {
        this.xsfjspr = xsfjspr == null ? null : xsfjspr.trim();
    }

    public Date getXsfjspsj() {
        return xsfjspsj;
    }

    public void setXsfjspsj(Date xsfjspsj) {
        this.xsfjspsj = xsfjspsj;
    }

    public String getXsfjspyj() {
        return xsfjspyj;
    }

    public void setXsfjspyj(String xsfjspyj) {
        this.xsfjspyj = xsfjspyj == null ? null : xsfjspyj.trim();
    }

    public Date getWcfhsj() {
        return wcfhsj;
    }

    public void setWcfhsj(Date wcfhsj) {
        this.wcfhsj = wcfhsj;
    }

    public String getJzkView() {
        return jzkView;
    }

    public void setJzkView(String jzkView) {
        this.jzkView = jzkView == null ? null : jzkView.trim();
    }

    public String getDicCheckStatusKey() {
        return dicCheckStatusKey;
    }

    public void setDicCheckStatusKey(String dicCheckStatusKey) {
        this.dicCheckStatusKey = dicCheckStatusKey == null ? null : dicCheckStatusKey.trim();
    }

    public String getDicCheckTypeKey() {
        return dicCheckTypeKey;
    }

    public void setDicCheckTypeKey(String dicCheckTypeKey) {
        this.dicCheckTypeKey = dicCheckTypeKey == null ? null : dicCheckTypeKey.trim();
    }

    public Date getDelayBeforeDate() {
        return delayBeforeDate;
    }

    public void setDelayBeforeDate(Date delayBeforeDate) {
        this.delayBeforeDate = delayBeforeDate;
    }

    public String getDelayReason() {
        return delayReason;
    }

    public void setDelayReason(String delayReason) {
        this.delayReason = delayReason == null ? null : delayReason.trim();
    }

    public String getDelayFilePathName() {
        return delayFilePathName;
    }

    public void setDelayFilePathName(String delayFilePathName) {
        this.delayFilePathName = delayFilePathName == null ? null : delayFilePathName.trim();
    }

    public String getDelayFilePath() {
        return delayFilePath;
    }

    public void setDelayFilePath(String delayFilePath) {
        this.delayFilePath = delayFilePath == null ? null : delayFilePath.trim();
    }

    public String getDisAgreeReason() {
        return disAgreeReason;
    }

    public void setDisAgreeReason(String disAgreeReason) {
        this.disAgreeReason = disAgreeReason == null ? null : disAgreeReason.trim();
    }

    public String getDisAccountId() {
        return disAccountId;
    }

    public void setDisAccountId(String disAccountId) {
        this.disAccountId = disAccountId == null ? null : disAccountId.trim();
    }

    public String getDisAccount() {
        return disAccount;
    }

    public void setDisAccount(String disAccount) {
        this.disAccount = disAccount == null ? null : disAccount.trim();
    }

    public Date getDisTime() {
        return disTime;
    }

    public void setDisTime(Date disTime) {
        this.disTime = disTime;
    }

    public String getUpdateFileName() {
        return updateFileName;
    }

    public void setUpdateFileName(String updateFileName) {
        this.updateFileName = updateFileName == null ? null : updateFileName.trim();
    }

    public String getUpdateFilePath() {
        return updateFilePath;
    }

    public void setUpdateFilePath(String updateFilePath) {
        this.updateFilePath = updateFilePath == null ? null : updateFilePath.trim();
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

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	

	
    

}