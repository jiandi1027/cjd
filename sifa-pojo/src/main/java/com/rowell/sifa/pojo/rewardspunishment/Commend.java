/*
* Commend.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.rewardspunishment;

import java.io.File;
import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.rowell.sifa.pojo.base.ProcessEntity;

/**
 *   表扬
* @Author marcle
* @version 1.0 2017-03-16
 */
@JsonInclude(Include.NON_NULL) 
public class Commend extends ProcessEntity<Commend> implements Serializable {
   

      
	private static final long serialVersionUID = -1087805165567156326L;

	/**文档名称 */
    private String filePathName;

    /**文档实际所在的文件路径 */
    private String filePath;

    /**发生时间 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date doDate;
    
    /**发生时间结束 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date endDoDate;

    /**表扬理由 */
    private String reason;

    /**主要事实 */
    private String fact;

    /**提请人 */
    private String sponsor;

    /**备注 */
    private String note;

    /**审批机关 */
    private String examineUnit;

    /**犯人 */
    private String culpritId;

    /**执法文书文号 */
    private String writNum;

    /**数据字典表扬原因 */
    private String dicCommendReasonKey;

    /**考核开始月 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date beginDate;

    /**考核结束月 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date endDate;

    /**数据字典打印状态  */
    private String dicPrintStatusKey;

    /**评议表 名称 */
    private String pingyiPathName;

    /**评议表 路径 */
    private File filePingyiPath;
    
    /**评议表 路径 */
    private String pingyiPath;

    /**评议表上传 操作员ID */
    private String copAccounId;

    /**评议表上传 时间 */
    private Date optTime;
    
    /**流程ID */
    private String processInstanceId;
    
    protected String culpritName;
    
    protected String groupName;
    
    private String roleId;
    
    private String groupId;
    
    
	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
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

	public File getFilePingyiPath() {
		return filePingyiPath;
	}

	public void setFilePingyiPath(File filePingyiPath) {
		this.filePingyiPath = filePingyiPath;
	}

	public Date getEndDoDate() {
		return endDoDate;
	}

	public void setEndDoDate(Date endDoDate) {
		this.endDoDate = endDoDate;
	}

	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}

	public String getFilePathName() {
        return filePathName;
    }

    public void setFilePathName(String filePathName) {
        this.filePathName = filePathName == null ? null : filePathName.trim();
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath == null ? null : filePath.trim();
    }

    public Date getDoDate() {
        return doDate;
    }

    public void setDoDate(Date doDate) {
        this.doDate = doDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public String getFact() {
        return fact;
    }

    public void setFact(String fact) {
        this.fact = fact == null ? null : fact.trim();
    }

    public String getSponsor() {
        return sponsor;
    }

    public void setSponsor(String sponsor) {
        this.sponsor = sponsor == null ? null : sponsor.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getExamineUnit() {
        return examineUnit;
    }

    public void setExamineUnit(String examineUnit) {
        this.examineUnit = examineUnit == null ? null : examineUnit.trim();
    }

    public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getWritNum() {
        return writNum;
    }

    public void setWritNum(String writNum) {
        this.writNum = writNum == null ? null : writNum.trim();
    }

    public String getDicCommendReasonKey() {
        return dicCommendReasonKey;
    }

    public void setDicCommendReasonKey(String dicCommendReasonKey) {
        this.dicCommendReasonKey = dicCommendReasonKey == null ? null : dicCommendReasonKey.trim();
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

    public String getDicPrintStatusKey() {
        return dicPrintStatusKey;
    }

    public void setDicPrintStatusKey(String dicPrintStatusKey) {
        this.dicPrintStatusKey = dicPrintStatusKey == null ? null : dicPrintStatusKey.trim();
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

   
}