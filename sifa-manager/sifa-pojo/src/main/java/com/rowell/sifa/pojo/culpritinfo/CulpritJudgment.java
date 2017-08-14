/*
* CulpritJudgment.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.culpritinfo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   具体判决信息（刑罚执行信息）
* @Author marcle
* @version 1.0 2017-03-16
 */
public class CulpritJudgment extends DataEntity<CulpritJudgment> implements Serializable {
   
      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 5537732192665335275L;

	/**矫正对象id */
    private String culpritId;

    /**具体罪名 */
    private String crimeInfo;

    /**数据字典原判刑罚 */
    private String dicYpxfKey;

    /**附加刑(多个使用|隔开) */
    private String accessoryPunishment;

    /**剥夺政治权利期限 */
    private String deprivePolitical;

    /**剥夺政治权利开始日期 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date deprivePoliticalStartDate;

    /**DEPRIVE_POLITICAL_END_DATE */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date deprivePoliticalEndDate;

    /**接收剥夺政治权利人员的公安机关名称 */
    private String reciveSecurityOrg;

    /**接收人 */
    private String reciveSecurityPerson;

    /**移交日期 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date transferDate;

    /**数据字典四史情况(多个使用|隔开) */
    private String dicFourKey;

    /**数据字典三涉情况(多个使用|隔开) */
    private String dicTreeKey;

    /**是否共同犯罪 */
    private String dicSfgtfzKey;

    /**是否有禁止令 */
    private Integer dicIsBanKey;

    /**数据字典社区矫正人员接收方式 */
    private String dicReceiveTypeKey;

    /**监外执行押送日期 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date escortDate;

    /**告知时间日期 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date notifyDate;

    /**到县局报到具体时间 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date toCountryReportDate;

    /**到司法所报到限制时间 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date limitDate;

    /**数据字典是否建立矫正小组 */
    private Integer dicSfjljzxzKey;

    /**数据字典矫正小组人员组成(多个使用|隔开) */
    private String dicMemeberKey;

    /**数据字典是否实行信息化管理 */
    private String dicIsInfManageKey;

    /**数据字典是否发放定位手机 */
    private String dicHaveMobileKey;

    /**数据字典是否完成入矫 */
    private String dicIsFinishKey;
    
    /**刑期 */
    private String adjudgePeriod;

    /**刑期变动 */
    private String adjudgeChange;

    /**刑期开始日期 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date adjudgeStartTime;

    /**刑期结束日期 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date adjudgeEndTime;

    /**数据字典（刑罚执行类别）矫正类别 */
    private String dicPenalTypeKey;
    //20170327 1423
    /**数据字典犯罪类型 **/
    private String dicCrimeTypeKey;
    /*审判机关名称*/
    private String adjudgeOrg;
    
    /*判决书编号*/
    private String adjudgeId;
    
    /*判决书日期*/
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date adjudgeDate;
    /*社区矫正决定机关*/
    private String adjudgeRedressOrg;
    /*数据字典社区矫正决定机关类型*/
    private String dicAdjudgeRedressOrgKey;
    /*裁决日期*/
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date adjudgeRedressT;
    
    /**矫正期限 */
    private String redressPeriod;

    /**矫正开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date redressStartDate;

    /**矫正截至时间 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date redressEndDate;
    /**有无同矫正对象 0有1无*/
    private String dicHaveTogetherKey;
    /*主要犯罪事实*/
    private String crimeFact;
    /*20170410*/
    /*主要原羁押场所*/
    private String detainPlace;
    /*交付执行日期*/
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date turnOver;
    /*是否惯犯0是1否*/
    private String dicOldLagKey;
    /*禁止开始日期*/
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date startBan;
    /*禁止结束日期*/
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date endBan;
    /*禁止期限*/
    private String timeBan;
    /*禁止内容*/
    private String contentBan;
    /*具体罚金*/
    private String forfeit;
    /*剥夺权限*/
    private String disentitle;
    /*没收财产*/
    private String expropriation;


    
    public String getDicAdjudgeRedressOrgKey() {
		return dicAdjudgeRedressOrgKey;
	}

	public void setDicAdjudgeRedressOrgKey(String dicAdjudgeRedressOrgKey) {
		this.dicAdjudgeRedressOrgKey = dicAdjudgeRedressOrgKey;
	}

	public String getDetainPlace() {
		return detainPlace;
	}

	public void setDetainPlace(String detainPlace) {
		this.detainPlace = detainPlace;
	}

	public Date getTurnOver() {
		return turnOver;
	}

	public void setTurnOver(Date turnOver) {
		this.turnOver = turnOver;
	}

	public String getDicOldLagKey() {
		return dicOldLagKey;
	}

	public void setDicOldLagKey(String dicOldLagKey) {
		this.dicOldLagKey = dicOldLagKey;
	}

	public Date getStartBan() {
		return startBan;
	}

	public void setStartBan(Date startBan) {
		this.startBan = startBan;
	}

	public Date getEndBan() {
		return endBan;
	}

	public void setEndBan(Date endBan) {
		this.endBan = endBan;
	}

	public String getTimeBan() {
		return timeBan;
	}

	public void setTimeBan(String timeBan) {
		this.timeBan = timeBan;
	}

	public String getContentBan() {
		return contentBan;
	}

	public void setContentBan(String contentBan) {
		this.contentBan = contentBan;
	}

	public String getForfeit() {
		return forfeit;
	}

	public void setForfeit(String forfeit) {
		this.forfeit = forfeit;
	}

	public String getDisentitle() {
		return disentitle;
	}

	public void setDisentitle(String disentitle) {
		this.disentitle = disentitle;
	}

	public String getExpropriation() {
		return expropriation;
	}

	public void setExpropriation(String expropriation) {
		this.expropriation = expropriation;
	}

	public String getAdjudgeOrg() {
		return adjudgeOrg;
	}

	public void setAdjudgeOrg(String adjudgeOrg) {
		this.adjudgeOrg = adjudgeOrg;
	}

	public String getAdjudgeId() {
		return adjudgeId;
	}

	public void setAdjudgeId(String adjudgeId) {
		this.adjudgeId = adjudgeId;
	}

	public Date getAdjudgeDate() {
		return adjudgeDate;
	}

	public void setAdjudgeDate(Date adjudgeDate) {
		this.adjudgeDate = adjudgeDate;
	}

	public String getAdjudgeRedressOrg() {
		return adjudgeRedressOrg;
	}

	public void setAdjudgeRedressOrg(String adjudgeRedressOrg) {
		this.adjudgeRedressOrg = adjudgeRedressOrg;
	}

	public Date getAdjudgeRedressT() {
		return adjudgeRedressT;
	}

	public void setAdjudgeRedressT(Date adjudgeRedressT) {
		this.adjudgeRedressT = adjudgeRedressT;
	}

	public String getRedressPeriod() {
		return redressPeriod;
	}

	public void setRedressPeriod(String redressPeriod) {
		this.redressPeriod = redressPeriod;
	}

	public Date getRedressStartDate() {
		return redressStartDate;
	}

	public void setRedressStartDate(Date redressStartDate) {
		this.redressStartDate = redressStartDate;
	}

	public Date getRedressEndDate() {
		return redressEndDate;
	}

	public void setRedressEndDate(Date redressEndDate) {
		this.redressEndDate = redressEndDate;
	}

	public String getDicHaveTogetherKey() {
		return dicHaveTogetherKey;
	}

	public void setDicHaveTogetherKey(String dicHaveTogetherKey) {
		this.dicHaveTogetherKey = dicHaveTogetherKey;
	}

	public String getCrimeFact() {
		return crimeFact;
	}

	public void setCrimeFact(String crimeFact) {
		this.crimeFact = crimeFact;
	}

	public String getDicCrimeTypeKey() {
		return dicCrimeTypeKey;
	}

	public void setDicCrimeTypeKey(String dicCrimeTypeKey) {
		this.dicCrimeTypeKey = dicCrimeTypeKey;
	}

	public String getAdjudgePeriod() {
		return adjudgePeriod;
	}

	public void setAdjudgePeriod(String adjudgePeriod) {
		this.adjudgePeriod = adjudgePeriod;
	}

	public String getAdjudgeChange() {
		return adjudgeChange;
	}

	public void setAdjudgeChange(String adjudgeChange) {
		this.adjudgeChange = adjudgeChange;
	}
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	public Date getAdjudgeStartTime() {
		return adjudgeStartTime;
	}

	public void setAdjudgeStartTime(Date adjudgeStartTime) {
		this.adjudgeStartTime = adjudgeStartTime;
	}

	public Date getAdjudgeEndTime() {
		return adjudgeEndTime;
	}
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	public void setAdjudgeEndTime(Date adjudgeEndTime) {
		this.adjudgeEndTime = adjudgeEndTime;
	}

	public String getDicPenalTypeKey() {
		return dicPenalTypeKey;
	}

	public void setDicPenalTypeKey(String dicPenalTypeKey) {
		this.dicPenalTypeKey = dicPenalTypeKey;
	}

	public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getCrimeInfo() {
        return crimeInfo;
    }

    public void setCrimeInfo(String crimeInfo) {
        this.crimeInfo = crimeInfo == null ? null : crimeInfo.trim();
    }

    public String getDicYpxfKey() {
        return dicYpxfKey;
    }

    public void setDicYpxfKey(String dicYpxfKey) {
        this.dicYpxfKey = dicYpxfKey == null ? null : dicYpxfKey.trim();
    }

    public String getAccessoryPunishment() {
        return accessoryPunishment;
    }

    public void setAccessoryPunishment(String accessoryPunishment) {
        this.accessoryPunishment = accessoryPunishment == null ? null : accessoryPunishment.trim();
    }

    public String getDeprivePolitical() {
        return deprivePolitical;
    }

    public void setDeprivePolitical(String deprivePolitical) {
        this.deprivePolitical = deprivePolitical == null ? null : deprivePolitical.trim();
    }

    public Date getDeprivePoliticalStartDate() {
        return deprivePoliticalStartDate;
    }

    public void setDeprivePoliticalStartDate(Date deprivePoliticalStartDate) {
        this.deprivePoliticalStartDate = deprivePoliticalStartDate;
    }

    public Date getDeprivePoliticalEndDate() {
        return deprivePoliticalEndDate;
    }

    public void setDeprivePoliticalEndDate(Date deprivePoliticalEndDate) {
        this.deprivePoliticalEndDate = deprivePoliticalEndDate;
    }

    public String getReciveSecurityOrg() {
        return reciveSecurityOrg;
    }

    public void setReciveSecurityOrg(String reciveSecurityOrg) {
        this.reciveSecurityOrg = reciveSecurityOrg == null ? null : reciveSecurityOrg.trim();
    }

    public String getReciveSecurityPerson() {
        return reciveSecurityPerson;
    }

    public void setReciveSecurityPerson(String reciveSecurityPerson) {
        this.reciveSecurityPerson = reciveSecurityPerson == null ? null : reciveSecurityPerson.trim();
    }

    public Date getTransferDate() {
        return transferDate;
    }

    public void setTransferDate(Date transferDate) {
        this.transferDate = transferDate;
    }

    public String getDicFourKey() {
        return dicFourKey;
    }

    public void setDicFourKey(String dicFourKey) {
        this.dicFourKey = dicFourKey == null ? null : dicFourKey.trim();
    }

    public String getDicTreeKey() {
        return dicTreeKey;
    }

    public void setDicTreeKey(String dicTreeKey) {
        this.dicTreeKey = dicTreeKey == null ? null : dicTreeKey.trim();
    }

    public String getDicSfgtfzKey() {
        return dicSfgtfzKey;
    }

    public void setDicSfgtfzKey(String dicSfgtfzKey) {
        this.dicSfgtfzKey = dicSfgtfzKey == null ? null : dicSfgtfzKey.trim();
    }

    public Integer getDicIsBanKey() {
        return dicIsBanKey;
    }

    public void setDicIsBanKey(Integer dicIsBanKey) {
        this.dicIsBanKey = dicIsBanKey;
    }

    public String getDicReceiveTypeKey() {
        return dicReceiveTypeKey;
    }

    public void setDicReceiveTypeKey(String dicReceiveTypeKey) {
        this.dicReceiveTypeKey = dicReceiveTypeKey == null ? null : dicReceiveTypeKey.trim();
    }

    public Date getEscortDate() {
        return escortDate;
    }

    public void setEscortDate(Date escortDate) {
        this.escortDate = escortDate;
    }

    public Date getNotifyDate() {
        return notifyDate;
    }

    public void setNotifyDate(Date notifyDate) {
        this.notifyDate = notifyDate;
    }

    public Date getToCountryReportDate() {
        return toCountryReportDate;
    }

    public void setToCountryReportDate(Date toCountryReportDate) {
        this.toCountryReportDate = toCountryReportDate;
    }

    public Date getLimitDate() {
        return limitDate;
    }

    public void setLimitDate(Date limitDate) {
        this.limitDate = limitDate;
    }

    public Integer getDicSfjljzxzKey() {
        return dicSfjljzxzKey;
    }

    public void setDicSfjljzxzKey(Integer dicSfjljzxzKey) {
        this.dicSfjljzxzKey = dicSfjljzxzKey;
    }

    public String getDicMemeberKey() {
        return dicMemeberKey;
    }

    public void setDicMemeberKey(String dicMemeberKey) {
        this.dicMemeberKey = dicMemeberKey == null ? null : dicMemeberKey.trim();
    }

    public String getDicIsInfManageKey() {
        return dicIsInfManageKey;
    }

    public void setDicIsInfManageKey(String dicIsInfManageKey) {
        this.dicIsInfManageKey = dicIsInfManageKey == null ? null : dicIsInfManageKey.trim();
    }

    public String getDicHaveMobileKey() {
        return dicHaveMobileKey;
    }

    public void setDicHaveMobileKey(String dicHaveMobileKey) {
        this.dicHaveMobileKey = dicHaveMobileKey == null ? null : dicHaveMobileKey.trim();
    }

    public String getDicIsFinishKey() {
        return dicIsFinishKey;
    }

    public void setDicIsFinishKey(String dicIsFinishKey) {
        this.dicIsFinishKey = dicIsFinishKey == null ? null : dicIsFinishKey.trim();
    }




}