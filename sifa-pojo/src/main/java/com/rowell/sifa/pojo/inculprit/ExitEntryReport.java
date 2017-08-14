/*
* ExitEntryReport.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.inculprit;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.DataEntity;
import com.rowell.sifa.pojo.base.ProcessEntity;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.sys.SysGroup;

/**
 *   出入境报备
* @Author marcle
* @version 1.0 2017-03-16
 */
public class ExitEntryReport extends ProcessEntity<ExitEntryReport>implements Serializable {
   

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 8937338292622590788L;

	/**社区服刑人员 */
    private String culpritId;

    /**司法所ID */
    private String groupId;

    /**报备部门名称 */
    private String filingOrg;

    /**具体收缴时间 */
    private Date filingDate;

    /**报备部门经办人 */
    private String handlingPerson;

    /**司法所经办人 */
    private String sfsHandlingPerson;

    /**联系方式 */
    private String sfsContact;

    /**数据字典报备状态ID */
    private String dicBbztKey;

    /**通报备案事由和法律依据 ：*/
    private String filingReason;

    /**通报备案机关意见 */
    private String orgOpinion;

    /**分管领导姓名 */
    private String fgAccountName;

    /**填表日期 */
    private Date fillFormDate;

    /**备注 */
    private String note;

    /**报备期限开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date fillStartDate;

    /**报备期限结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date fillEndDate;

    /**联系人ID */
    private String personId;

    /**相关材料附件 */
    private String path;

    /**相关材料附件名称 */
    private String pathName;

    /**数据字典报备类型ID */
    private String dicFilingTypeKey;

    /**矫正股意见 */
    private String jzkOpinion;
    
    /**证件号码 */
    private String cedentialsNumber;

    /**数据字典证件类型 */
    private String dicZjlxKey;
    

    /**数据字典是否已经收缴 ,0为未收缴，1为已收缴*/
    private String dicIsCollectKey;
    
    protected String culpritName;
	
  	protected String groupName;
  	    
  	protected Culprit culprit;
  	    
  	protected SysGroup sysGroup;



    public String getCedentialsNumber() {
		return cedentialsNumber;
	}

	public void setCedentialsNumber(String cedentialsNumber) {
		this.cedentialsNumber = cedentialsNumber;
	}

	public String getDicZjlxKey() {
		return dicZjlxKey;
	}

	public void setDicZjlxKey(String dicZjlxKey) {
		this.dicZjlxKey = dicZjlxKey;
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

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId == null ? null : groupId.trim();
    }

    public String getFilingOrg() {
        return filingOrg;
    }

    public void setFilingOrg(String filingOrg) {
        this.filingOrg = filingOrg == null ? null : filingOrg.trim();
    }
    @JsonFormat(pattern="yyyy-MM-dd ",timezone="GMT+8")
    public Date getFilingDate() {
        return filingDate;
    }

    public void setFilingDate(Date filingDate) {
        this.filingDate = filingDate;
    }

    public String getHandlingPerson() {
        return handlingPerson;
    }

    public void setHandlingPerson(String handlingPerson) {
        this.handlingPerson = handlingPerson == null ? null : handlingPerson.trim();
    }

    public String getSfsHandlingPerson() {
        return sfsHandlingPerson;
    }

    public void setSfsHandlingPerson(String sfsHandlingPerson) {
        this.sfsHandlingPerson = sfsHandlingPerson == null ? null : sfsHandlingPerson.trim();
    }

    public String getSfsContact() {
        return sfsContact;
    }

    public void setSfsContact(String sfsContact) {
        this.sfsContact = sfsContact == null ? null : sfsContact.trim();
    }

    public String getDicBbztKey() {
        return dicBbztKey;
    }

    public void setDicBbztKey(String dicBbztKey) {
        this.dicBbztKey = dicBbztKey == null ? null : dicBbztKey.trim();
    }

    public String getFilingReason() {
        return filingReason;
    }

    public void setFilingReason(String filingReason) {
        this.filingReason = filingReason == null ? null : filingReason.trim();
    }

    public String getOrgOpinion() {
        return orgOpinion;
    }

    public void setOrgOpinion(String orgOpinion) {
        this.orgOpinion = orgOpinion == null ? null : orgOpinion.trim();
    }

    public String getFgAccountName() {
        return fgAccountName;
    }

    public void setFgAccountName(String fgAccountName) {
        this.fgAccountName = fgAccountName == null ? null : fgAccountName.trim();
    }

    public Date getFillFormDate() {
        return fillFormDate;
    }

    public void setFillFormDate(Date fillFormDate) {
        this.fillFormDate = fillFormDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public Date getFillStartDate() {
        return fillStartDate;
    }

    public void setFillStartDate(Date fillStartDate) {
        this.fillStartDate = fillStartDate;
    }

    public Date getFillEndDate() {
        return fillEndDate;
    }

    public void setFillEndDate(Date fillEndDate) {
        this.fillEndDate = fillEndDate;
    }

    public String getPersonId() {
        return personId;
    }

    public void setPersonId(String personId) {
        this.personId = personId == null ? null : personId.trim();
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

    public String getDicFilingTypeKey() {
        return dicFilingTypeKey;
    }

    public void setDicFilingTypeKey(String dicFilingTypeKey) {
        this.dicFilingTypeKey = dicFilingTypeKey == null ? null : dicFilingTypeKey.trim();
    }

    public String getJzkOpinion() {
        return jzkOpinion;
    }

    public void setJzkOpinion(String jzkOpinion) {
        this.jzkOpinion = jzkOpinion == null ? null : jzkOpinion.trim();
    }

    public String getDicIsCollectKey() {
        return dicIsCollectKey;
    }

    public void setDicIsCollectKey(String dicIsCollectKey) {
        this.dicIsCollectKey = dicIsCollectKey == null ? null : dicIsCollectKey.trim();
    }

}