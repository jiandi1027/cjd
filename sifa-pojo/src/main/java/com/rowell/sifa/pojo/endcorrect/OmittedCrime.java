/*
* OmittedCrime.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.endcorrect;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.ProcessEntity;

/**
 *   漏罪
* @Author marcle
* @version 1.0 2017-03-16
 */
public class OmittedCrime extends ProcessEntity<OmittedCrime> implements Serializable {
  

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = -2705161370806491568L;

	/**犯人 */
    private String culpritId;

    /**漏罪罪名 */
    private String newCrime;

    /**立案单位 */
    private String registerUnit;

    /**立案时间 */
    private Date registerTime;

    /**数据字典掌握情况方式 */
    private String dicGraspTypeKey;

    /**掌握情况时间 */
    private Date graspTime;

    /**判决时间 */
    private Date judgmentTime;

    /**判决法院 */
    private String judgmentCourt;

    /**判决法律文书路径 */
    private String judgmentPath;

    /**判决法律文书名称 */
    private String judgmentPathName;

    /**无罪理由 */
    private String unguiltyReason;

    /**无罪法律文书路径 */
    private String unguiltyPath;

    /**无罪法律文书名称 */
    private String unguiltyPathName;

    /**通报公安机关时间 */
    private Date reportTime;

    /**通报人 */
    private String reportPerson;

    /**通报公安机关名称 */
    private String reportUnit;

    /**数据字典是否有罪 */
    private String dicIsTocrimeKey;

    /**漏罪情况 */
    private String crimeDetails;
    
    /**数据字典强制措施类型 */
    private String coerciveMeasureKey;
    
    /**强制措施时间 */
    private Date coerciveMeasureDate;
    
    protected String culpritName;  //对象姓名
    protected String groupName;	   //对象直属司法所
    protected String groupId;	   //对象直属司法所

    public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getNewCrime() {
        return newCrime;
    }

    public void setNewCrime(String newCrime) {
        this.newCrime = newCrime == null ? null : newCrime.trim();
    }

    public String getRegisterUnit() {
        return registerUnit;
    }

    public void setRegisterUnit(String registerUnit) {
        this.registerUnit = registerUnit == null ? null : registerUnit.trim();
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public String getDicGraspTypeKey() {
        return dicGraspTypeKey;
    }

    public void setDicGraspTypeKey(String dicGraspTypeKey) {
        this.dicGraspTypeKey = dicGraspTypeKey == null ? null : dicGraspTypeKey.trim();
    }

    
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getGraspTime() {
        return graspTime;
    }


    public void setGraspTime(Date graspTime) {
        this.graspTime = graspTime;
    }

    public Date getJudgmentTime() {
        return judgmentTime;
    }

    public void setJudgmentTime(Date judgmentTime) {
        this.judgmentTime = judgmentTime;
    }

    public String getJudgmentCourt() {
        return judgmentCourt;
    }

    public void setJudgmentCourt(String judgmentCourt) {
        this.judgmentCourt = judgmentCourt == null ? null : judgmentCourt.trim();
    }

    public String getJudgmentPath() {
        return judgmentPath;
    }

    public void setJudgmentPath(String judgmentPath) {
        this.judgmentPath = judgmentPath == null ? null : judgmentPath.trim();
    }

    public String getJudgmentPathName() {
        return judgmentPathName;
    }

    public void setJudgmentPathName(String judgmentPathName) {
        this.judgmentPathName = judgmentPathName == null ? null : judgmentPathName.trim();
    }

    public String getUnguiltyReason() {
        return unguiltyReason;
    }

    public void setUnguiltyReason(String unguiltyReason) {
        this.unguiltyReason = unguiltyReason == null ? null : unguiltyReason.trim();
    }

    public String getUnguiltyPath() {
        return unguiltyPath;
    }

    public void setUnguiltyPath(String unguiltyPath) {
        this.unguiltyPath = unguiltyPath == null ? null : unguiltyPath.trim();
    }

    public String getUnguiltyPathName() {
        return unguiltyPathName;
    }

    public void setUnguiltyPathName(String unguiltyPathName) {
        this.unguiltyPathName = unguiltyPathName == null ? null : unguiltyPathName.trim();
    }

    public Date getReportTime() {
        return reportTime;
    }

    public void setReportTime(Date reportTime) {
        this.reportTime = reportTime;
    }

    public String getReportPerson() {
        return reportPerson;
    }

    public void setReportPerson(String reportPerson) {
        this.reportPerson = reportPerson == null ? null : reportPerson.trim();
    }

    public String getReportUnit() {
        return reportUnit;
    }

    public void setReportUnit(String reportUnit) {
        this.reportUnit = reportUnit == null ? null : reportUnit.trim();
    }

    public String getDicIsTocrimeKey() {
        return dicIsTocrimeKey;
    }

    public void setDicIsTocrimeKey(String dicIsTocrimeKey) {
        this.dicIsTocrimeKey = dicIsTocrimeKey == null ? null : dicIsTocrimeKey.trim();
    }

    public String getCrimeDetails() {
        return crimeDetails;
    }

    public void setCrimeDetails(String crimeDetails) {
        this.crimeDetails = crimeDetails == null ? null : crimeDetails.trim();
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

	public String getCoerciveMeasureKey() {
		return coerciveMeasureKey;
	}

	public void setCoerciveMeasureKey(String coerciveMeasureKey) {
		this.coerciveMeasureKey = coerciveMeasureKey;
	}

	public Date getCoerciveMeasureDate() {
		return coerciveMeasureDate;
	}

	public void setCoerciveMeasureDate(Date coerciveMeasureDate) {
		this.coerciveMeasureDate = coerciveMeasureDate;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

}