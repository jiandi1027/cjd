/*
* Investigate.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.investigate;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.ProcessEntity;

/**
 *   调查评估(审前调查)
* @Author marcle
* @version 1.0 2017-03-16
 */
public class Investigate extends ProcessEntity<Investigate> implements Serializable {

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = -4834490224910124383L;

	/**委托单位 */
    private String entrustUnit;

    /**委托单位类型 */
    private String dicEntrustUnitTypeKey;

    /**接收委托时间 */
    private Date acceptedEntrustTime;

    /**调查实际开始时间 */
    private Date begTime;

    /**调查实际结束时间 */
    private Date endTime;

    /**录入部门 */
    private String groupId;

    /**具体调查司法所id */
    private String sfsGroupId;

    /**具体调查司法所 */
    private String sfsGroupName;

    /**姓名 */
    private String name;

    /**别名 */
    private String alias;

    /**曾用名 */
    private String oldName;

    /**籍贯 */
    private String origin;

    /**民族 */
    private String nation;

    /**身份证号 */
    private String identification;

    /**出生年月日 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date bornDate;

    /**家庭住址 */
    private String address;

    /**联系电话 */
    private String contactPhone;

    /**职业 */
    private String job;

    /**委托编号 */
    private String entrustNo;

    /**工作单位 */
    private String workUnits;

    /**罪名 */
    private String crime;

    /**调查地点 */
    private String place;

    /**调查事项 */
    private String investigateMatters;

    /**采用情况 */
    private String adoption;

    /**被告人（罪犯）姓名 */
    private String crimePersonName;

    /**原判刑期 */
    private String adjudgePeriod;

    /**原判刑期开始 */
    private Date adjudgeStartTime;

    /**原判刑期结束 */
    private Date adjudgeEndTime;

    /**附加判刑 */
    private String adjudgeAdded;

    /**判决机关 */
    private String adjudgeOrg;

    /**判决日期 */
    private String adjudgeDate;

    /**与被告人（罪犯）关系 */
    private String relationId;

    /**拟适用社区矫正人员类型 （被告人，罪犯） */
    private String dicApplyTypeKey;

    /**手机号码 */
    private String mobileNumber;

    /**经常居住地 */
    private String habitualResidence;

    /**案由 */
    private String crimeReason;

    /**家庭成员与调查对象相处情况 */
    private String familySituation;

    /**家庭经济状况 */
    private String economicStatus;

    /**未成年对象的其他情况 */
    private String minorOtherCases;

    /**生理状况 */
    private String physiConditions;

    /**心理特征 */
    private String psychFeature;

    /**性格类型 */
    private String mettleType;

    /**爱好特长 */
    private String hobbies;

    /**工作（学习）表现 */
    private String display;

    /**业余生活 */
    private String amateurLife;

    /**邻里关系 */
    private String neighborhoodRelations;

    /**社会交往 */
    private String socialInteraction;

    /**违纪违法情况 */
    private String badFact;

    /**对犯罪行为的认识 */
    private String crimeAcquaint;

    /**悔过态度 */
    private String repentantAttitude;

    /**罚金刑履行情况及履行能力 */
    private String fineFulfillAbility;

    /**附带民事赔偿履行情况及履行能力 */
    private String reparationFulfillAbility;

    /**被害人或其亲属态度 */
    private String victimAttitude;

    /**社会公众态度 */
    private String publicAttitude;

    /**家庭成员态度 */
    private String familyAttitude;

    /**生活环境 */
    private String lifeEnvironment;

    /**村（居、社区）基层组织意见(附件路径) */
    private String basicViews;

    /**村（居、社区）基层组织意见 */
    private String basicView;

    /**公安派出所意见(附件) */
    private String policeViews;

    /**公安派出所意见 */
    private String policeView;

    /**调查笔录(附件) */
    private String preRecord;

    /**县级司法行政机关意见 */
    private String countyViews;

    /**委托调查函名称 */
    private String wtdchPathName;

    /**委托调查类型（假释 缓刑 保外就医等） 改为 拟适用矫正类别 （管制、缓刑、假释、暂予监外执行、剥夺政治权利） */
    private String entrustTypeId;

    /**数据字典性别 */
    private String dicSexKey;

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

    /**记录创建时间 */
    private Date createdTime;

    /**记录更新时间 */
    private Date modifiedTime;

    /**操作员ID */
    private String accountId;

    /**文件路径 */
    private String path;

    /**预期开始时间 */
    private Date preStartTime;

    /**锁定时间 */
    private Date lockTime;

    /**预期结束时间 */
    private Date preEndTime;

    /**解锁次数 */
    private String count;

    /**是否在申请解锁 */
    private Integer applyUnLock;	//0 无须解锁 1超时需要上报解锁  2等待解锁 

    /**调查记录标志 ,默认调查中为0，调查终止为1，适合为2 */
    private Integer flag;

    /**市局是否备案 */
    private Integer saveRecord;

    /**执法文书文号 */
    private String writNum;

    /**审前调查相关情况 */
    private String situation;

    /**评估意见类型 */
    private String dicEvalueViewKey;

    /**拟稿人 */
    private String draftPeople;

    /**相关证件号码 */
    private String relevantNumber;

    /**司法所工作人员是否上报 */
    private Integer handOn;

    /**数据字典户籍类型 */
    private String dicResudenceKey;

    /**户籍所在地 */
    private String regResudence;

    /**数据字典抽查类型 */
    private String dicCheckKey;

    /**已抽查人员 */
    private String oprators;

    /**推荐典型案例状态 */
    private String recommendStatus;

    /**EVALUE_VIEWS_BAK */
    private String evalueViewsBak;

    /**评估意见 */
    private String evalueViews;

    /**WTDCH_PATH_BAK */
    private String wtdchPathBak;

    /**委托调查函路径 */
    private String wtdchPath;

    /**POLICE_VIEWS_PATH_BAK */
    private String policeViewsPathBak;

    /**公安派出所意见(附件路径) */
    private String policeViewsPath;

    /**PRE_RECORD_PATH_BAK */
    private String preRecordPathBak;

    /**调查笔录(附件路径) */
    private String preRecordPath;

    /**BASIC_VIEWS_PATH_BAK */
    private String basicViewsPathBak;

    /**村（居、社区）基层组织意见(附件路径) */
    private String basicViewsPath;

    /**邮寄件单号 */
    private String emailNo;

    /**邮寄处理人(取点击打印并邮件操作登录的账号) */
    private String emailPerson;

    /**转送工作者姓名 */
    private String emailName;

    /**市法制执法分值 */
    private Double cityFactionQualityGoal;

    /**别名 */
    private String xfgEditReason;

    /**经常居住地所在省（区，市）ID */
    private String habitualResidenceProId;

    /**经常居住地所在地（市，州）ID */
    private String habitualResidenceCityId;

    /**经常居住地所在县（市，区）ID */
    private String habitualResidenceCountryId;

    /**经常居住地所在乡镇（街道） */
    private String habitualResidenceStreet;

    /**经常居住地详细门牌号 */
    private String habitualResidenceDetail;

    /**户籍所在省（区，市）ID */
    private String regResidenceProId;

    /**户籍所在地（市，州）ID */
    private String regResidenceCityId;

    /**户籍所在县（市，区）ID */
    private String regResidenceCountryId;

    /**户籍所在乡镇（街道） */
    private String regResidenceStreet;

    /**户籍详细门牌号*/
    private String regResidenceDetail;

    /**籍贯所在省（区，市）ID */
    private String originProId;

    /**籍贯所在地（市，州）ID */
    private String originCityId;

    /**籍贯所在县（市，区）ID */
    private String originCountryId;
    
    /**家庭住址所在省（区，市）ID */
    private String addressProId;

    /**家庭住址所在地（市，州）ID */
    private String addressCityId;

    /**家庭住址所在县（市，区）ID */
    private String addressCountryId;

	/**家庭住址所在乡镇（街道） */
    private String addressStreet;

    /**家庭住址详细门牌号*/
    private String addressDetail;
    
    protected String noteqflag;//查询标记，用于查询历史信息

	// 是否打印建议书，0表示未打印,1标识已打印
	private Integer isPrintYJS;
	// 是否打印调查表
		private Integer isPrintDCB;
	// 是否打印审核表
	private Integer isPrintSPB;

    
	public Integer getIsPrintYJS()
	{
		return isPrintYJS;
	}

	public void setIsPrintYJS(Integer isPrintYJS)
	{
		this.isPrintYJS = isPrintYJS;
	}

	public Integer getIsPrintDCB()
	{
		return isPrintDCB;
	}

	public void setIsPrintDCB(Integer isPrintDCB)
	{
		this.isPrintDCB = isPrintDCB;
	}

	public Integer getIsPrintSPB()
	{
		return isPrintSPB;
	}

	public void setIsPrintSPB(Integer isPrintSPB)
	{
		this.isPrintSPB = isPrintSPB;
	}
    
    public String getNoteqflag() {
		return noteqflag;
	}

	public void setNoteqflag(String noteqflag) {
		this.noteqflag = noteqflag;
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

	public String getRegResidenceProId() {
		return regResidenceProId;
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

	public String getHabitualResidenceProId() {
		return habitualResidenceProId;
	}

	public void setHabitualResidenceProId(String habitualResidenceProId) {
		this.habitualResidenceProId = habitualResidenceProId;
	}

	public String getHabitualResidenceCityId() {
		return habitualResidenceCityId;
	}

	public void setHabitualResidenceCityId(String habitualResidenceCityId) {
		this.habitualResidenceCityId = habitualResidenceCityId;
	}

	public String getHabitualResidenceCountryId() {
		return habitualResidenceCountryId;
	}

	public void setHabitualResidenceCountryId(String habitualResidenceCountryId) {
		this.habitualResidenceCountryId = habitualResidenceCountryId;
	}

	public String getHabitualResidenceStreet() {
		return habitualResidenceStreet;
	}

	public void setHabitualResidenceStreet(String habitualResidenceStreet) {
		this.habitualResidenceStreet = habitualResidenceStreet;
	}

	public String getHabitualResidenceDetail() {
		return habitualResidenceDetail;
	}

	public void setHabitualResidenceDetail(String habitualResidenceDetail) {
		this.habitualResidenceDetail = habitualResidenceDetail;
	}

	public void init(){
		this.setBegTime(new Date());		//调查开始时间
		//this.setLockTime(new Date());		//锁定时间
		this.setPreStartTime(new Date());	//预期开始时间
		this.flag = 0;						//默认
		
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_YEAR, 9);		//7+2,2指周末，如果有节假日，这里要获取节假日，还要顺延
		
		this.setPreEndTime(c.getTime());	//预期结束时间
    }

	public String getEntrustUnit() {
        return entrustUnit;
    }

    public void setEntrustUnit(String entrustUnit) {
        this.entrustUnit = entrustUnit == null ? null : entrustUnit.trim();
    }

    public String getDicEntrustUnitTypeKey() {
        return dicEntrustUnitTypeKey;
    }

    public void setDicEntrustUnitTypeKey(String dicEntrustUnitTypeKey) {
        this.dicEntrustUnitTypeKey = dicEntrustUnitTypeKey == null ? null : dicEntrustUnitTypeKey.trim();
    }

    public Date getAcceptedEntrustTime() {
        return acceptedEntrustTime;
    }

    public void setAcceptedEntrustTime(Date acceptedEntrustTime) {
        this.acceptedEntrustTime = acceptedEntrustTime;
    }

    public Date getBegTime() {
        return begTime;
    }

    public void setBegTime(Date begTime) {
        this.begTime = begTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId == null ? null : groupId.trim();
    }

    public String getSfsGroupId() {
        return sfsGroupId;
    }

    public void setSfsGroupId(String sfsGroupId) {
        this.sfsGroupId = sfsGroupId == null ? null : sfsGroupId.trim();
    }

    public String getSfsGroupName() {
        return sfsGroupName;
    }

    public void setSfsGroupName(String sfsGroupName) {
        this.sfsGroupName = sfsGroupName == null ? null : sfsGroupName.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias == null ? null : alias.trim();
    }

    public String getOldName() {
        return oldName;
    }

    public void setOldName(String oldName) {
        this.oldName = oldName == null ? null : oldName.trim();
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin == null ? null : origin.trim();
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation == null ? null : nation.trim();
    }

    public String getIdentification() {
        return identification;
    }

    public void setIdentification(String identification) {
        this.identification = identification == null ? null : identification.trim();
    }

    public Date getBornDate() {
        return bornDate;
    }

    public void setBornDate(Date bornDate) {
        this.bornDate = bornDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone == null ? null : contactPhone.trim();
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public String getEntrustNo() {
        return entrustNo;
    }

    public void setEntrustNo(String entrustNo) {
        this.entrustNo = entrustNo == null ? null : entrustNo.trim();
    }

    public String getWorkUnits() {
        return workUnits;
    }

    public void setWorkUnits(String workUnits) {
        this.workUnits = workUnits == null ? null : workUnits.trim();
    }

    public String getCrime() {
        return crime;
    }

    public void setCrime(String crime) {
        this.crime = crime == null ? null : crime.trim();
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place == null ? null : place.trim();
    }

    public String getInvestigateMatters() {
        return investigateMatters;
    }

    public void setInvestigateMatters(String investigateMatters) {
        this.investigateMatters = investigateMatters == null ? null : investigateMatters.trim();
    }

    public String getAdoption() {
        return adoption;
    }

    public void setAdoption(String adoption) {
        this.adoption = adoption == null ? null : adoption.trim();
    }

    public String getCrimePersonName() {
        return crimePersonName;
    }

    public void setCrimePersonName(String crimePersonName) {
        this.crimePersonName = crimePersonName == null ? null : crimePersonName.trim();
    }

    public String getAdjudgePeriod() {
        return adjudgePeriod;
    }

    public void setAdjudgePeriod(String adjudgePeriod) {
        this.adjudgePeriod = adjudgePeriod == null ? null : adjudgePeriod.trim();
    }

    public Date getAdjudgeStartTime() {
        return adjudgeStartTime;
    }

    public void setAdjudgeStartTime(Date adjudgeStartTime) {
        this.adjudgeStartTime = adjudgeStartTime;
    }

    public Date getAdjudgeEndTime() {
        return adjudgeEndTime;
    }

    public void setAdjudgeEndTime(Date adjudgeEndTime) {
        this.adjudgeEndTime = adjudgeEndTime;
    }

    public String getAdjudgeAdded() {
        return adjudgeAdded;
    }

    public void setAdjudgeAdded(String adjudgeAdded) {
        this.adjudgeAdded = adjudgeAdded == null ? null : adjudgeAdded.trim();
    }

    public String getAdjudgeOrg() {
        return adjudgeOrg;
    }

    public void setAdjudgeOrg(String adjudgeOrg) {
        this.adjudgeOrg = adjudgeOrg == null ? null : adjudgeOrg.trim();
    }

    public String getAdjudgeDate() {
        return adjudgeDate;
    }

    public void setAdjudgeDate(String adjudgeDate) {
        this.adjudgeDate = adjudgeDate == null ? null : adjudgeDate.trim();
    }

    public String getRelationId() {
        return relationId;
    }

    public void setRelationId(String relationId) {
        this.relationId = relationId == null ? null : relationId.trim();
    }

    public String getDicApplyTypeKey() {
        return dicApplyTypeKey;
    }

    public void setDicApplyTypeKey(String dicApplyTypeKey) {
        this.dicApplyTypeKey = dicApplyTypeKey == null ? null : dicApplyTypeKey.trim();
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber == null ? null : mobileNumber.trim();
    }

    public String getHabitualResidence() {
        return habitualResidence;
    }

    public void setHabitualResidence(String habitualResidence) {
        this.habitualResidence = habitualResidence == null ? null : habitualResidence.trim();
    }

    public String getCrimeReason() {
        return crimeReason;
    }

    public void setCrimeReason(String crimeReason) {
        this.crimeReason = crimeReason == null ? null : crimeReason.trim();
    }

    public String getFamilySituation() {
        return familySituation;
    }

    public void setFamilySituation(String familySituation) {
        this.familySituation = familySituation == null ? null : familySituation.trim();
    }

    public String getEconomicStatus() {
        return economicStatus;
    }

    public void setEconomicStatus(String economicStatus) {
        this.economicStatus = economicStatus == null ? null : economicStatus.trim();
    }

    public String getMinorOtherCases() {
        return minorOtherCases;
    }

    public void setMinorOtherCases(String minorOtherCases) {
        this.minorOtherCases = minorOtherCases == null ? null : minorOtherCases.trim();
    }

    public String getPhysiConditions() {
        return physiConditions;
    }

    public void setPhysiConditions(String physiConditions) {
        this.physiConditions = physiConditions == null ? null : physiConditions.trim();
    }

    public String getPsychFeature() {
        return psychFeature;
    }

    public void setPsychFeature(String psychFeature) {
        this.psychFeature = psychFeature == null ? null : psychFeature.trim();
    }

    public String getMettleType() {
        return mettleType;
    }

    public void setMettleType(String mettleType) {
        this.mettleType = mettleType == null ? null : mettleType.trim();
    }

    public String getHobbies() {
        return hobbies;
    }

    public void setHobbies(String hobbies) {
        this.hobbies = hobbies == null ? null : hobbies.trim();
    }

    public String getDisplay() {
        return display;
    }

    public void setDisplay(String display) {
        this.display = display == null ? null : display.trim();
    }

    public String getAmateurLife() {
        return amateurLife;
    }

    public void setAmateurLife(String amateurLife) {
        this.amateurLife = amateurLife == null ? null : amateurLife.trim();
    }

    public String getNeighborhoodRelations() {
        return neighborhoodRelations;
    }

    public void setNeighborhoodRelations(String neighborhoodRelations) {
        this.neighborhoodRelations = neighborhoodRelations == null ? null : neighborhoodRelations.trim();
    }

    public String getSocialInteraction() {
        return socialInteraction;
    }

    public void setSocialInteraction(String socialInteraction) {
        this.socialInteraction = socialInteraction == null ? null : socialInteraction.trim();
    }

    public String getBadFact() {
        return badFact;
    }

    public void setBadFact(String badFact) {
        this.badFact = badFact == null ? null : badFact.trim();
    }

    public String getCrimeAcquaint() {
        return crimeAcquaint;
    }

    public void setCrimeAcquaint(String crimeAcquaint) {
        this.crimeAcquaint = crimeAcquaint == null ? null : crimeAcquaint.trim();
    }

    public String getRepentantAttitude() {
        return repentantAttitude;
    }

    public void setRepentantAttitude(String repentantAttitude) {
        this.repentantAttitude = repentantAttitude == null ? null : repentantAttitude.trim();
    }

    public String getFineFulfillAbility() {
        return fineFulfillAbility;
    }

    public void setFineFulfillAbility(String fineFulfillAbility) {
        this.fineFulfillAbility = fineFulfillAbility == null ? null : fineFulfillAbility.trim();
    }

    public String getReparationFulfillAbility() {
        return reparationFulfillAbility;
    }

    public void setReparationFulfillAbility(String reparationFulfillAbility) {
        this.reparationFulfillAbility = reparationFulfillAbility == null ? null : reparationFulfillAbility.trim();
    }

    public String getVictimAttitude() {
        return victimAttitude;
    }

    public void setVictimAttitude(String victimAttitude) {
        this.victimAttitude = victimAttitude == null ? null : victimAttitude.trim();
    }

    public String getPublicAttitude() {
        return publicAttitude;
    }

    public void setPublicAttitude(String publicAttitude) {
        this.publicAttitude = publicAttitude == null ? null : publicAttitude.trim();
    }

    public String getFamilyAttitude() {
        return familyAttitude;
    }

    public void setFamilyAttitude(String familyAttitude) {
        this.familyAttitude = familyAttitude == null ? null : familyAttitude.trim();
    }

    public String getLifeEnvironment() {
        return lifeEnvironment;
    }

    public void setLifeEnvironment(String lifeEnvironment) {
        this.lifeEnvironment = lifeEnvironment == null ? null : lifeEnvironment.trim();
    }

    public String getBasicViews() {
        return basicViews;
    }

    public void setBasicViews(String basicViews) {
        this.basicViews = basicViews == null ? null : basicViews.trim();
    }

    public String getBasicView() {
        return basicView;
    }

    public void setBasicView(String basicView) {
        this.basicView = basicView == null ? null : basicView.trim();
    }

    public String getPoliceViews() {
        return policeViews;
    }

    public void setPoliceViews(String policeViews) {
        this.policeViews = policeViews == null ? null : policeViews.trim();
    }

    public String getPoliceView() {
        return policeView;
    }

    public void setPoliceView(String policeView) {
        this.policeView = policeView == null ? null : policeView.trim();
    }

    public String getPreRecord() {
        return preRecord;
    }

    public void setPreRecord(String preRecord) {
        this.preRecord = preRecord == null ? null : preRecord.trim();
    }

    public String getCountyViews() {
        return countyViews;
    }

    public void setCountyViews(String countyViews) {
        this.countyViews = countyViews == null ? null : countyViews.trim();
    }

    public String getWtdchPathName() {
        return wtdchPathName;
    }

    public void setWtdchPathName(String wtdchPathName) {
        this.wtdchPathName = wtdchPathName == null ? null : wtdchPathName.trim();
    }

    public String getEntrustTypeId() {
        return entrustTypeId;
    }

    public void setEntrustTypeId(String entrustTypeId) {
        this.entrustTypeId = entrustTypeId == null ? null : entrustTypeId.trim();
    }

    public String getDicSexKey() {
        return dicSexKey;
    }

    public void setDicSexKey(String dicSexKey) {
        this.dicSexKey = dicSexKey == null ? null : dicSexKey.trim();
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

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId == null ? null : accountId.trim();
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    public Date getPreStartTime() {
        return preStartTime;
    }

    public void setPreStartTime(Date preStartTime) {
        this.preStartTime = preStartTime;
    }

    public Date getLockTime() {
        return lockTime;
    }

    public void setLockTime(Date lockTime) {
        this.lockTime = lockTime;
    }

    public Date getPreEndTime() {
        return preEndTime;
    }

    public void setPreEndTime(Date preEndTime) {
        this.preEndTime = preEndTime;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count == null ? null : count.trim();
    }

    public Integer getApplyUnLock() {
        return applyUnLock;
    }

    public void setApplyUnLock(Integer applyUnLock) {
        this.applyUnLock = applyUnLock;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Integer getSaveRecord() {
        return saveRecord;
    }

    public void setSaveRecord(Integer saveRecord) {
        this.saveRecord = saveRecord;
    }

    public String getWritNum() {
        return writNum;
    }

    public void setWritNum(String writNum) {
        this.writNum = writNum == null ? null : writNum.trim();
    }

    public String getSituation() {
        return situation;
    }

    public void setSituation(String situation) {
        this.situation = situation == null ? null : situation.trim();
    }

    public String getDicEvalueViewKey() {
        return dicEvalueViewKey;
    }

    public void setDicEvalueViewKey(String dicEvalueViewKey) {
        this.dicEvalueViewKey = dicEvalueViewKey == null ? null : dicEvalueViewKey.trim();
    }

    public String getDraftPeople() {
        return draftPeople;
    }

    public void setDraftPeople(String draftPeople) {
        this.draftPeople = draftPeople == null ? null : draftPeople.trim();
    }

    public String getRelevantNumber() {
        return relevantNumber;
    }

    public void setRelevantNumber(String relevantNumber) {
        this.relevantNumber = relevantNumber == null ? null : relevantNumber.trim();
    }

    public Integer getHandOn() {
        return handOn;
    }

    public void setHandOn(Integer handOn) {
        this.handOn = handOn;
    }

    public String getDicResudenceKey() {
        return dicResudenceKey;
    }

    public void setDicResudenceKey(String dicResudenceKey) {
        this.dicResudenceKey = dicResudenceKey == null ? null : dicResudenceKey.trim();
    }

    public String getRegResudence() {
        return regResudence;
    }

    public void setRegResudence(String regResudence) {
        this.regResudence = regResudence == null ? null : regResudence.trim();
    }

    public String getDicCheckKey() {
        return dicCheckKey;
    }

    public void setDicCheckKey(String dicCheckKey) {
        this.dicCheckKey = dicCheckKey == null ? null : dicCheckKey.trim();
    }

    public String getOprators() {
        return oprators;
    }

    public void setOprators(String oprators) {
        this.oprators = oprators == null ? null : oprators.trim();
    }

    public String getRecommendStatus() {
        return recommendStatus;
    }

    public void setRecommendStatus(String recommendStatus) {
        this.recommendStatus = recommendStatus == null ? null : recommendStatus.trim();
    }

    public String getEvalueViewsBak() {
        return evalueViewsBak;
    }

    public void setEvalueViewsBak(String evalueViewsBak) {
        this.evalueViewsBak = evalueViewsBak == null ? null : evalueViewsBak.trim();
    }

    public String getEvalueViews() {
        return evalueViews;
    }

    public void setEvalueViews(String evalueViews) {
        this.evalueViews = evalueViews == null ? null : evalueViews.trim();
    }

    public String getWtdchPathBak() {
        return wtdchPathBak;
    }

    public void setWtdchPathBak(String wtdchPathBak) {
        this.wtdchPathBak = wtdchPathBak == null ? null : wtdchPathBak.trim();
    }

    public String getWtdchPath() {
        return wtdchPath;
    }

    public void setWtdchPath(String wtdchPath) {
        this.wtdchPath = wtdchPath == null ? null : wtdchPath.trim();
    }

    public String getPoliceViewsPathBak() {
        return policeViewsPathBak;
    }

    public void setPoliceViewsPathBak(String policeViewsPathBak) {
        this.policeViewsPathBak = policeViewsPathBak == null ? null : policeViewsPathBak.trim();
    }

    public String getPoliceViewsPath() {
        return policeViewsPath;
    }

    public void setPoliceViewsPath(String policeViewsPath) {
        this.policeViewsPath = policeViewsPath == null ? null : policeViewsPath.trim();
    }

    public String getPreRecordPathBak() {
        return preRecordPathBak;
    }

    public void setPreRecordPathBak(String preRecordPathBak) {
        this.preRecordPathBak = preRecordPathBak == null ? null : preRecordPathBak.trim();
    }

    public String getPreRecordPath() {
        return preRecordPath;
    }

    public void setPreRecordPath(String preRecordPath) {
        this.preRecordPath = preRecordPath == null ? null : preRecordPath.trim();
    }

    public String getBasicViewsPathBak() {
        return basicViewsPathBak;
    }

    public void setBasicViewsPathBak(String basicViewsPathBak) {
        this.basicViewsPathBak = basicViewsPathBak == null ? null : basicViewsPathBak.trim();
    }

    public String getBasicViewsPath() {
        return basicViewsPath;
    }

    public void setBasicViewsPath(String basicViewsPath) {
        this.basicViewsPath = basicViewsPath == null ? null : basicViewsPath.trim();
    }

    public String getEmailNo() {
        return emailNo;
    }

    public void setEmailNo(String emailNo) {
        this.emailNo = emailNo == null ? null : emailNo.trim();
    }

    public String getEmailPerson() {
        return emailPerson;
    }

    public void setEmailPerson(String emailPerson) {
        this.emailPerson = emailPerson == null ? null : emailPerson.trim();
    }

    public String getEmailName() {
        return emailName;
    }

    public void setEmailName(String emailName) {
        this.emailName = emailName == null ? null : emailName.trim();
    }

    public Double getCityFactionQualityGoal() {
        return cityFactionQualityGoal;
    }

    public void setCityFactionQualityGoal(Double cityFactionQualityGoal) {
        this.cityFactionQualityGoal = cityFactionQualityGoal;
    }

    public String getXfgEditReason() {
        return xfgEditReason;
    }

    public void setXfgEditReason(String xfgEditReason) {
        this.xfgEditReason = xfgEditReason == null ? null : xfgEditReason.trim();
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

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
   
}