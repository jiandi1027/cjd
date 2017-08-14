/*
* MoveIn.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.inculprit;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.ProcessEntity;

/**
 *   迁入
* @Author marcle
* @version 1.0 2017-03-16
 */
public class MoveIn extends ProcessEntity<MoveIn> implements Serializable {
  

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = -2940667220680426981L;

	/**数据字典迁居类型0本系统迁入1非本系统 */
    private String dicTypeKey;

    /**旧居住地 */
    private String oldPlace;

    /**新居住地 */
    private String newPlace;

    /**数据字典抽查类型 */
    private String dicCheckTypeKey;

    /**姓名 */
    private String name;

    /**数据字典性别 */
    private String dicSexKey;

    /**民族 */
    private String nation;

    /**证件号码（身份证号 */
    private String cedentialsNumber;

    /**别名（曾用名） */
    private String alias;

    /**手机号） */
    private String contactPhone;

    /**出生日期 */
    private Date bornDate;

    /**数据字典文化程度 */
    private String dicWhcdKey;

    /**数据字典婚姻状况 */
    private String dicHyzkKey;

    /**职业 */
    private String job;

    /**原政治面貌 */
    private String oldPoliticStatusId;

    /**籍贯 */
    private String origin;

    /**（现居住地）户口所在地明细 */
    private String regResidence;

    /**（现居住地）固定居住地详细 */
    private String addressDetail;

    /**原判罪名 */
    private String crimeInfo;

    /**刑期 */
    private String adjudgePeriod;

    /**附加刑(多个使用|隔开) */
    private String accessoryPunishment;

    /**刑期变动 */
    private String adjudgeChange;

    /**刑期开始日期 */
    private Date adjudgeStartTime;

    /**刑期结束日期 */
    private Date adjudgeEndTime;

    /**数据字典（刑罚执行类别）矫正类别 */
    private String dicPenalTypeKey;

    /**迁入时间 */
    private Date moveTime;

    /**原司法部门 */
    private String oldGroup;

    /**新司法部门ID */
    private String groupId;

    /**居住地变更原因 */
    private String reason;

    /**司法所意见 */
    private String opinion;

    /**司法所审批时间 */
    private Date judicialTime;

    /**县级司法局意见 */
    private String countyViews;

    /**县级司法行政机关时间 */
    private Date administrativeTime;

    /**矫正期限 */
    private String redressPeriod;

    /**矫正开始时间 */
    private Date redressStartDate;

    /**矫正截至时间 */
    private Date redressEndDate;

    /**相关材料附件路径 */
    private String notePath;

    /**相关材料附件名称 */
    private String notePathName;

    /**审批状态 */
    private String statusId;

    /**调查人员姓名 1 */
    private String investigator1;

    /**调查人员1ID */
    private String investigatorId1;

    /**调查人员姓名 2 */
    private String investigator2;

    /**调查人员2ID */
    private String investigatorId2;

    /**协管员1 */
    private String assistor1;

    /**协管员1ID */
    private String assistorId1;

    /**协管员2 */
    private String assistor2;

    /**协管员2ID */
    private String assistorId2;

    /**调查人员姓名1职务 */
    private String position1;

    /**调查人员姓名2职务 */
    private String position2;

    /**协管员1职务 */
    private String position3;

    /**协管员2职务 */
    private String position4;

    /**记录允许查看的账号 */
    private String perAccounts;

    /**备注 */
    private String note;

    /**谈话笔录路径 */
    private String talkRecordPath;

    /**谈话笔录名称 */
    private String talkRecordPathName;

    /**司法所上传相关材料路径 */
    private String relatePath;

    /**司法所上传相关材料名称 */
    private String relatePathName;

    /*查询开始范围*/
    private Date startDate;
    /*查询结束范围*/
    private Date endDate;
   
    private String groupName;
    /**start**/
    private String regResidenceProId;
    private String regResidenceCityId;
    private String regResidenceCountryId;
    private String regResidenceStreet;
    private String regResidenceDetail;
    private String addressProId;
    private String addressCityId;
    private String addressCountryId;
    private String addressStreet;
    private String addressDetaill;
    private String roled;
    private String originProId;
    private String originCityId;
    private String originCountryId;
    private String regResidenceProId1;
    private String regResidenceCityId1;
    private String regResidenceCountryId1;
    private String regResidenceStreet1;
    private String regResidenceDetail1;
	/**end**/
    
    private Integer isPrintBGSP;
    //是否打印审核表
    private Integer isPrintBGZM;
    
    
    
    
    public Integer getIsPrintBGSP() {
		return isPrintBGSP;
	}

	public void setIsPrintBGSP(Integer isPrintBGSP) {
		this.isPrintBGSP = isPrintBGSP;
	}

	public Integer getIsPrintBGZM() {
		return isPrintBGZM;
	}

	public void setIsPrintBGZM(Integer isPrintBGZM) {
		this.isPrintBGZM = isPrintBGZM;
	}

	public String getRoled() {
		return roled;
	}

	public String getOriginProId() {
		return originProId;
	}

	public void setOriginProId(String originProId) {
		this.originProId = originProId;
	}

	public String getOriginCityId() {
		return originCityId;
	}

	public void setOriginCityId(String originCityId) {
		this.originCityId = originCityId;
	}

	public String getOriginCountryId() {
		return originCountryId;
	}

	public void setOriginCountryId(String originCountryId) {
		this.originCountryId = originCountryId;
	}

	public String getRegResidenceProId1() {
		return regResidenceProId1;
	}

	public void setRegResidenceProId1(String regResidenceProId1) {
		this.regResidenceProId1 = regResidenceProId1;
	}

	public String getRegResidenceCityId1() {
		return regResidenceCityId1;
	}

	public void setRegResidenceCityId1(String regResidenceCityId1) {
		this.regResidenceCityId1 = regResidenceCityId1;
	}

	public String getRegResidenceCountryId1() {
		return regResidenceCountryId1;
	}

	public void setRegResidenceCountryId1(String regResidenceCountryId1) {
		this.regResidenceCountryId1 = regResidenceCountryId1;
	}

	public String getRegResidenceStreet1() {
		return regResidenceStreet1;
	}

	public void setRegResidenceStreet1(String regResidenceStreet1) {
		this.regResidenceStreet1 = regResidenceStreet1;
	}

	public String getRegResidenceDetail1() {
		return regResidenceDetail1;
	}

	public void setRegResidenceDetail1(String regResidenceDetail1) {
		this.regResidenceDetail1 = regResidenceDetail1;
	}

	public void setRoled(String roled) {
		this.roled = roled;
	}
    public String getRegResidenceProId() {
		return regResidenceProId;
	}

	public String getAddressProId() {
		return addressProId;
	}

	public void setAddressProId(String addressProId) {
		this.addressProId = addressProId;
	}

	public String getAddressCityId() {
		return addressCityId;
	}

	public void setAddressCityId(String addressCityId) {
		this.addressCityId = addressCityId;
	}

	public String getAddressCountryId() {
		return addressCountryId;
	}

	public void setAddressCountryId(String addressCountryId) {
		this.addressCountryId = addressCountryId;
	}

	public String getAddressStreet() {
		return addressStreet;
	}

	public void setAddressStreet(String addressStreet) {
		this.addressStreet = addressStreet;
	}

	public String getAddressDetaill() {
		return addressDetaill;
	}

	public void setAddressDetaill(String addressDetaill) {
		this.addressDetaill = addressDetaill;
	}

	public void setRegResidenceProId(String regResidenceProId) {
		this.regResidenceProId = regResidenceProId;
	}

	public String getRegResidenceCityId() {
		return regResidenceCityId;
	}

	public void setRegResidenceCityId(String regResidenceCityId) {
		this.regResidenceCityId = regResidenceCityId;
	}

	public String getRegResidenceCountryId() {
		return regResidenceCountryId;
	}

	public void setRegResidenceCountryId(String regResidenceCountryId) {
		this.regResidenceCountryId = regResidenceCountryId;
	}

	public String getRegResidenceStreet() {
		return regResidenceStreet;
	}

	public void setRegResidenceStreet(String regResidenceStreet) {
		this.regResidenceStreet = regResidenceStreet;
	}

	public String getRegResidenceDetail() {
		return regResidenceDetail;
	}

	public void setRegResidenceDetail(String regResidenceDetail) {
		this.regResidenceDetail = regResidenceDetail;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getDicTypeKey() {
        return dicTypeKey;
    }

    public void setDicTypeKey(String dicTypeKey) {
        this.dicTypeKey = dicTypeKey == null ? null : dicTypeKey.trim();
    }

    public String getOldPlace() {
        return oldPlace;
    }

    public void setOldPlace(String oldPlace) {
        this.oldPlace = oldPlace == null ? null : oldPlace.trim();
    }

    public String getNewPlace() {
        return newPlace;
    }

    public void setNewPlace(String newPlace) {
        this.newPlace = newPlace == null ? null : newPlace.trim();
    }

    public String getDicCheckTypeKey() {
        return dicCheckTypeKey;
    }

    public void setDicCheckTypeKey(String dicCheckTypeKey) {
        this.dicCheckTypeKey = dicCheckTypeKey == null ? null : dicCheckTypeKey.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDicSexKey() {
        return dicSexKey;
    }

    public void setDicSexKey(String dicSexKey) {
        this.dicSexKey = dicSexKey == null ? null : dicSexKey.trim();
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation == null ? null : nation.trim();
    }

    public String getCedentialsNumber() {
        return cedentialsNumber;
    }

    public void setCedentialsNumber(String cedentialsNumber) {
        this.cedentialsNumber = cedentialsNumber == null ? null : cedentialsNumber.trim();
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias == null ? null : alias.trim();
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone == null ? null : contactPhone.trim();
    }
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    public Date getBornDate() {
        return bornDate;
    }

    public void setBornDate(Date bornDate) {
        this.bornDate = bornDate;
    }

    public String getDicWhcdKey() {
        return dicWhcdKey;
    }

    public void setDicWhcdKey(String dicWhcdKey) {
        this.dicWhcdKey = dicWhcdKey == null ? null : dicWhcdKey.trim();
    }

    public String getDicHyzkKey() {
        return dicHyzkKey;
    }

    public void setDicHyzkKey(String dicHyzkKey) {
        this.dicHyzkKey = dicHyzkKey == null ? null : dicHyzkKey.trim();
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public String getOldPoliticStatusId() {
        return oldPoliticStatusId;
    }

    public void setOldPoliticStatusId(String oldPoliticStatusId) {
        this.oldPoliticStatusId = oldPoliticStatusId == null ? null : oldPoliticStatusId.trim();
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin == null ? null : origin.trim();
    }

    public String getRegResidence() {
        return regResidence;
    }

    public void setRegResidence(String regResidence) {
        this.regResidence = regResidence == null ? null : regResidence.trim();
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail == null ? null : addressDetail.trim();
    }

    public String getCrimeInfo() {
        return crimeInfo;
    }

    public void setCrimeInfo(String crimeInfo) {
        this.crimeInfo = crimeInfo == null ? null : crimeInfo.trim();
    }

    public String getAdjudgePeriod() {
        return adjudgePeriod;
    }

    public void setAdjudgePeriod(String adjudgePeriod) {
        this.adjudgePeriod = adjudgePeriod == null ? null : adjudgePeriod.trim();
    }

    public String getAccessoryPunishment() {
        return accessoryPunishment;
    }

    public void setAccessoryPunishment(String accessoryPunishment) {
        this.accessoryPunishment = accessoryPunishment == null ? null : accessoryPunishment.trim();
    }

    public String getAdjudgeChange() {
        return adjudgeChange;
    }

    public void setAdjudgeChange(String adjudgeChange) {
        this.adjudgeChange = adjudgeChange == null ? null : adjudgeChange.trim();
    }
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    public Date getAdjudgeStartTime() {
        return adjudgeStartTime;
    }

    public void setAdjudgeStartTime(Date adjudgeStartTime) {
        this.adjudgeStartTime = adjudgeStartTime;
    }
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    public Date getAdjudgeEndTime() {
        return adjudgeEndTime;
    }

    public void setAdjudgeEndTime(Date adjudgeEndTime) {
        this.adjudgeEndTime = adjudgeEndTime;
    }

    public String getDicPenalTypeKey() {
        return dicPenalTypeKey;
    }

    public void setDicPenalTypeKey(String dicPenalTypeKey) {
        this.dicPenalTypeKey = dicPenalTypeKey == null ? null : dicPenalTypeKey.trim();
    }
    @JsonFormat(pattern = "yyyy-MM-dd")
    public Date getMoveTime() {
        return moveTime;
    }

    public void setMoveTime(Date moveTime) {
        this.moveTime = moveTime;
    }

    public String getOldGroup() {
        return oldGroup;
    }

    public void setOldGroup(String oldGroup) {
        this.oldGroup = oldGroup == null ? null : oldGroup.trim();
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId == null ? null : groupId.trim();
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public String getOpinion() {
        return opinion;
    }

    public void setOpinion(String opinion) {
        this.opinion = opinion == null ? null : opinion.trim();
    }

    public Date getJudicialTime() {
        return judicialTime;
    }

    public void setJudicialTime(Date judicialTime) {
        this.judicialTime = judicialTime;
    }

    public String getCountyViews() {
        return countyViews;
    }

    public void setCountyViews(String countyViews) {
        this.countyViews = countyViews == null ? null : countyViews.trim();
    }

    public Date getAdministrativeTime() {
        return administrativeTime;
    }

    public void setAdministrativeTime(Date administrativeTime) {
        this.administrativeTime = administrativeTime;
    }

    public String getRedressPeriod() {
        return redressPeriod;
    }

    public void setRedressPeriod(String redressPeriod) {
        this.redressPeriod = redressPeriod == null ? null : redressPeriod.trim();
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

    public String getNotePath() {
        return notePath;
    }

    public void setNotePath(String notePath) {
        this.notePath = notePath == null ? null : notePath.trim();
    }

    public String getNotePathName() {
        return notePathName;
    }

    public void setNotePathName(String notePathName) {
        this.notePathName = notePathName == null ? null : notePathName.trim();
    }

    public String getStatusId() {
        return statusId;
    }

    public void setStatusId(String statusId) {
        this.statusId = statusId == null ? null : statusId.trim();
    }

    public String getInvestigator1() {
        return investigator1;
    }

    public void setInvestigator1(String investigator1) {
        this.investigator1 = investigator1 == null ? null : investigator1.trim();
    }

    public String getInvestigatorId1() {
        return investigatorId1;
    }

    public void setInvestigatorId1(String investigatorId1) {
        this.investigatorId1 = investigatorId1 == null ? null : investigatorId1.trim();
    }

    public String getInvestigator2() {
        return investigator2;
    }

    public void setInvestigator2(String investigator2) {
        this.investigator2 = investigator2 == null ? null : investigator2.trim();
    }

    public String getInvestigatorId2() {
        return investigatorId2;
    }

    public void setInvestigatorId2(String investigatorId2) {
        this.investigatorId2 = investigatorId2 == null ? null : investigatorId2.trim();
    }

    public String getAssistor1() {
        return assistor1;
    }

    public void setAssistor1(String assistor1) {
        this.assistor1 = assistor1 == null ? null : assistor1.trim();
    }

    public String getAssistorId1() {
        return assistorId1;
    }

    public void setAssistorId1(String assistorId1) {
        this.assistorId1 = assistorId1 == null ? null : assistorId1.trim();
    }

    public String getAssistor2() {
        return assistor2;
    }

    public void setAssistor2(String assistor2) {
        this.assistor2 = assistor2 == null ? null : assistor2.trim();
    }

    public String getAssistorId2() {
        return assistorId2;
    }

    public void setAssistorId2(String assistorId2) {
        this.assistorId2 = assistorId2 == null ? null : assistorId2.trim();
    }

    public String getPosition1() {
        return position1;
    }

    public void setPosition1(String position1) {
        this.position1 = position1 == null ? null : position1.trim();
    }

    public String getPosition2() {
        return position2;
    }

    public void setPosition2(String position2) {
        this.position2 = position2 == null ? null : position2.trim();
    }

    public String getPosition3() {
        return position3;
    }

    public void setPosition3(String position3) {
        this.position3 = position3 == null ? null : position3.trim();
    }

    public String getPosition4() {
        return position4;
    }

    public void setPosition4(String position4) {
        this.position4 = position4 == null ? null : position4.trim();
    }

    public String getPerAccounts() {
        return perAccounts;
    }

    public void setPerAccounts(String perAccounts) {
        this.perAccounts = perAccounts == null ? null : perAccounts.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getTalkRecordPath() {
        return talkRecordPath;
    }

    public void setTalkRecordPath(String talkRecordPath) {
        this.talkRecordPath = talkRecordPath == null ? null : talkRecordPath.trim();
    }

    public String getTalkRecordPathName() {
        return talkRecordPathName;
    }

    public void setTalkRecordPathName(String talkRecordPathName) {
        this.talkRecordPathName = talkRecordPathName == null ? null : talkRecordPathName.trim();
    }

    public String getRelatePath() {
        return relatePath;
    }

    public void setRelatePath(String relatePath) {
        this.relatePath = relatePath == null ? null : relatePath.trim();
    }

    public String getRelatePathName() {
        return relatePathName;
    }

    public void setRelatePathName(String relatePathName) {
        this.relatePathName = relatePathName == null ? null : relatePathName.trim();
    }

   
}