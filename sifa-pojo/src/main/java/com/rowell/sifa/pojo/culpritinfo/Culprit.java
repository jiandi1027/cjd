/*
* Culprit.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.culpritinfo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.rowell.sifa.pojo.base.ProcessEntity;
import com.rowell.sifa.pojo.sys.SysGroup;

/**
 *   矫正对象基本信息
* @Author marcle
* @version 1.0 2017-03-16
 */
//@JsonInclude(Include.NON_NULL) 
public class Culprit extends ProcessEntity<Culprit> implements Serializable {
   

	   
	private static final long serialVersionUID = 3704758469447686998L;
	 @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	/** 矫正开始时间*/
	private Date redressStartDate;
	 @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	/** 矫正结束时间*/
	private Date redressEndDate;
	/**系统编号 */
    private String no;

    /**直属司法部门 */
    private String groupId;

    /**姓名 */
    private String name;

    /**数据字典管理对象级别 */
    private String dicGldxjbKey;

    /**别名 */
    private String alias;

    /**照片 */
    private String image;

    /**数据字典性别 */
    private String dicSexKey;

    /**老民族 */
    private String nation;

    /**数据字典文化程度 */
    private String dicWhcdKey;

    /**籍贯 */
    private String origin;

    /**数据字典原政治面貌 */
    private String dicYzzmmKey;

    /**数据字典婚姻状况 */
    private String dicHyzkKey;

    /**户口所在地明细 */
    private String regResidence;

    /**数据字典户口类型 */
    private String dicHklxKey;

    /**身份证号 */
    private String identification;

    /**固定居住地明细 */
    private String address;

    /**职业 */
    private String job;

    /**矫正状态 */
    private String dicStatusKey;

    /**联系电话 */
    private String contactPhone;

    /**定位号码 */
    private String mobileNumber;

    /**备注 */
    private String note;

    /**记录首次报道完成时间（档案建立时间）*/
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createdTime;

    /**记录更新时间 */
    private Date modifiedTime;

    /**终端ID */
    private String terminalId;

    /**操作员ID */
    private String accountId;

    /**健康状况 */
    private String DicHealthyStatusKey;

    /**证件号码 */
    private String cedentialsNumber;

    /**数据字典证件类型 */
    private String dicZjlxKey;

    /**出生日期 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date birthday;

    /**数据字典是否成年 */
    private String dicIsAdultKey;
    /*数据字典是否有护照*/
    private String dicPassPortKey;
    /*出生地*/
    private String homePlace;
    /**护照号码 */
    private String passportNum;

    /**数据字典是否有回乡证 */
    private String dicSfyhxzKey;

    /**回乡证号码 */
    private String returnCardNum;

    /**数据字典是否有台胞证 */
    private Integer dicSfytbzKey;

    /**台胞证号码 */
    private String compatriotsCardNum;

    /**具体健康状况 */
    private String healthyStatusInfo;

    /**数据字典是否有传染病史 */
    private String dicSfycrbsKey;

    /**具体传染病史 */
    private String contagionId;

    /**数据字典心理是否健康 */
    private String dicXlsfjkKey;

    /**具体心理健康状况 */
    private String mentalInfo;

    /**鉴定机构 */
    private String identifyOrg;

    /**数据字典现政治面貌 */
    private String dicXzzmmKey;

    /**固定居住地所在省（区，市）ID */
    private String addressProId;

    /**固定居住地所在省（区，市） */
    private String addressPro;

    /**固定居住地所在地（市，州）ID */
    private String addressCityId;

    /**固定居住地所在地（市，州） */
    private String addressCity;

    /**固定居住地所在县（市，区）ID */
    private String addressCountryId;

    /**固定居住地所在县（市，区 */
    private String addressCountry;

    /**固定居住地所在乡镇（街道） */
    private String addressStreet;

    /**固定居住地详细门牌号 */
    private String addressDetail;

    /**户口所在省（区，市）ID */
    private String regResidenceProId;

    /**户口所在省（区，市） */
    private String regResidencePro;

    /**户口所在地（市，州）ID */
    private String regResidenceCityId;

    /**户口所在地（市，州 */
    private String regResidenceCity;

    /**户口所在县（市，区）ID */
    private String regResidenceCountryId;

    /**户口所在县（市，区） */
    private String regResidenceCountry;

    /**户口所在乡镇（街道） */
    private String regResidenceStreet;

    /**户口详细门牌号*/
    private String regResidenceDetail;

    /**数据字典就业就学情况 */
    private String dicWorkStatusKey;

    /**现工作单位 */
    private String newJob;

    /**单位联系方式 */
    private String jobPhone;

    /**数据字典有无家庭成员 */
    private String dicHavaFamilyKey;
    //新监管等级
    private String dicMonitorGradeKey;
    
    /**短号码 */
    private String shortNumber;

    /**iface序列号 */
    private String ifaceSn;
    
    /**iface指纹采集时间 */
    private Date fingerFaceTime;
    
    /**声纹注册状态 */
    private String dicRegisterId;
    
    protected SysGroup sysGroup;
    protected CulpritJudgment culpritJudgment;
    protected String areaCode;  //对象所在地区的地区编码
    
    
    //首次报道事项（0为未完成）
    private Integer finshInfo1;//是否完成指纹信息采集
    private Integer finshInfo2;//是否完成首次谈话
    private Integer finshInfo3;//是否完成个人资料编辑
    private Integer finshInfo4;//是否建立矫正小组
    private Integer finshInfo5;//是否建立建立矫正方案
    private Integer finshInfo6;//是否打印社区矫正宣告书
    private Integer finshInfo7;//是否打印社区矫正责任书
    private Integer finshInfo8;//是否上传社区矫正志愿者帮教协议书
    private Integer finshInfo9;//是否指定监管人员
    
    /**是否完成入矫标记**/
    private Integer finshInfo; //0（未完成入矫），1（已完成入矫），
    /**数据字典报到情况默认1正常 2为漏管 */
    private String dicReportInfoKey;
    /**数据字典报到类型 */
    private String dicReportTypeKey;
    
    /**首次报到来源类型 */
    private String dicFirstReportGetKey;
    /**首次报到状态 */
    private String dicFirstReportTypeKey;
    //原监管等级
    protected String dicOldMonitorGradeKey;
    
    
    protected String adjudgeOrg;//犯罪类型
    /**数据字典犯罪类型 **/
    protected String dicCrimeTypeKey;

    protected String accountName;
    
    protected Date reportDate;//报到时间
    
  //搜索条件
  	protected Date searchStartDate_file;//建档起始
  	protected Date searchEndDate_file;//建档截至
  	protected Date searchCreatedStartDate;//查询创建时间开始
  	protected Date searchCreatedEndDate;//查询创建时间结束
  	protected Date searchLimiteDate;//报道截至
	protected Date searchRedressStartDate;//期满起始
  	protected Date searchRedressEndDate;//期满截至
  	protected String dicAdjudgeRedressOrgKey;//决定机关
  	
	protected Date searchTerminalStartDate;//定位绑定起始
  	protected Date searchTerminalEndDate;//定位绑定截止
	protected String bindNumber;//定位号码
	protected String intervalTime;//定位间隔
	protected Date bindtime;//绑定时间
	protected String type;//定位方式
	protected String bindstatus;//绑定状态
	
  	
	public String getBindstatus() {
		return bindstatus;
	}

	public void setBindstatus(String bindstatus) {
		this.bindstatus = bindstatus;
	}

	public String getBindNumber() {
		return bindNumber;
	}

	public void setBindNumber(String bindNumber) {
		this.bindNumber = bindNumber;
	}

	public String getIntervalTime() {
		return intervalTime;
	}

	public void setIntervalTime(String intervalTime) {
		this.intervalTime = intervalTime;
	}

	public Date getBindtime() {
		return bindtime;
	}

	public void setBindtime(Date bindtime) {
		this.bindtime = bindtime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getSearchTerminalStartDate() {
		return searchTerminalStartDate;
	}

	public void setSearchTerminalStartDate(Date searchTerminalStartDate) {
		this.searchTerminalStartDate = searchTerminalStartDate;
	}

	public Date getSearchTerminalEndDate() {
		return searchTerminalEndDate;
	}

	public void setSearchTerminalEndDate(Date searchTerminalEndDate) {
		this.searchTerminalEndDate = searchTerminalEndDate;
	}

	public String getDicAdjudgeRedressOrgKey() {
		return dicAdjudgeRedressOrgKey;
	}

	public void setDicAdjudgeRedressOrgKey(String dicAdjudgeRedressOrgKey) {
		this.dicAdjudgeRedressOrgKey = dicAdjudgeRedressOrgKey;
	}

	public String getDicFirstReportGetKey() {
		return dicFirstReportGetKey;
	}

	public void setDicFirstReportGetKey(String dicFirstReportGetKey) {
		this.dicFirstReportGetKey = dicFirstReportGetKey;
	}

	public String getDicFirstReportTypeKey() {
		return dicFirstReportTypeKey;
	}

	public void setDicFirstReportTypeKey(String dicFirstReportTypeKey) {
		this.dicFirstReportTypeKey = dicFirstReportTypeKey;
	}

	public Date getSearchRedressStartDate() {
		return searchRedressStartDate;
	}

	public void setSearchRedressStartDate(Date searchRedressStartDate) {
		this.searchRedressStartDate = searchRedressStartDate;
	}

	public Date getSearchRedressEndDate() {
		return searchRedressEndDate;
	}

	public void setSearchRedressEndDate(Date searchRedressEndDate) {
		this.searchRedressEndDate = searchRedressEndDate;
	}

	public Date getSearchCreatedStartDate() {
		return searchCreatedStartDate;
	}

	public void setSearchCreatedStartDate(Date searchCreatedStartDate) {
		this.searchCreatedStartDate = searchCreatedStartDate;
	}

	public Date getSearchCreatedEndDate() {
		return searchCreatedEndDate;
	}

	public void setSearchCreatedEndDate(Date searchCreatedEndDate) {
		this.searchCreatedEndDate = searchCreatedEndDate;
	}

	public Date getSearchLimiteDate() {
		return searchLimiteDate;
	}

	public void setSearchLimiteDate(Date searchLimiteDate) {
		this.searchLimiteDate = searchLimiteDate;
	}

	public Date getSearchStartDate_file() {
		return searchStartDate_file;
	}

	public void setSearchStartDate_file(Date searchStartDate_file) {
		this.searchStartDate_file = searchStartDate_file;
	}

	public Date getSearchEndDate_file() {
		return searchEndDate_file;
	}

	public void setSearchEndDate_file(Date searchEndDate_file) {
		this.searchEndDate_file = searchEndDate_file;
	}

	public Integer getFinshInfo9() {
		return finshInfo9;
	}

	public void setFinshInfo9(Integer finshInfo9) {
		this.finshInfo9 = finshInfo9;
	}

	public Integer getFinshInfo1() {
		return finshInfo1;
	}

	public void setFinshInfo1(Integer finshInfo1) {
		this.finshInfo1 = finshInfo1;
	}

	public Integer getFinshInfo2() {
		return finshInfo2;
	}

	public void setFinshInfo2(Integer finshInfo2) {
		this.finshInfo2 = finshInfo2;
	}

	public Integer getFinshInfo3() {
		return finshInfo3;
	}

	public void setFinshInfo3(Integer finshInfo3) {
		this.finshInfo3 = finshInfo3;
	}

	public Integer getFinshInfo4() {
		return finshInfo4;
	}

	public void setFinshInfo4(Integer finshInfo4) {
		this.finshInfo4 = finshInfo4;
	}

	public Integer getFinshInfo5() {
		return finshInfo5;
	}

	public void setFinshInfo5(Integer finshInfo5) {
		this.finshInfo5 = finshInfo5;
	}

	public Integer getFinshInfo6() {
		return finshInfo6;
	}

	public void setFinshInfo6(Integer finshInfo6) {
		this.finshInfo6 = finshInfo6;
	}

	public Integer getFinshInfo7() {
		return finshInfo7;
	}

	public void setFinshInfo7(Integer finshInfo7) {
		this.finshInfo7 = finshInfo7;
	}

	public Integer getFinshInfo8() {
		return finshInfo8;
	}

	public void setFinshInfo8(Integer finshInfo8) {
		this.finshInfo8 = finshInfo8;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
   
	public String getDicOldMonitorGradeKey() {
		return dicOldMonitorGradeKey;
	}
	 public String getDicPassPortKey() {
			return dicPassPortKey;
		}

	public void setDicPassPortKey(String dicPassPortKey) {
		this.dicPassPortKey = dicPassPortKey;
	}

	public String getHomePlace() {
		return homePlace;
	}

	public void setHomePlace(String homePlace) {
		this.homePlace = homePlace;
	}
	public void setDicOldMonitorGradeKey(String dicOldMonitorGradeKey) {
		this.dicOldMonitorGradeKey = dicOldMonitorGradeKey;
	}

	public String getDicReportInfoKey() {
		return dicReportInfoKey;
	}

	public void setDicReportInfoKey(String dicReportInfoKey) {
		this.dicReportInfoKey = dicReportInfoKey;
	}

	public String getDicReportTypeKey() {
		return dicReportTypeKey;
	}

	public void setDicReportTypeKey(String dicReportTypeKey) {
		this.dicReportTypeKey = dicReportTypeKey;
	}

    
    /** 刑罚执行类别**/
	protected String dicPenalTypeKey;
    /**罪名**/
    protected String crimeInfo;
    public Integer getFinshInfo() {
		return finshInfo;
	}

	public void setFinshInfo(Integer finshInfo) {
		this.finshInfo = finshInfo;
	}

	public String getDicPenalTypeKey() {
		return dicPenalTypeKey;
	}

	public void setDicPenalTypeKey(String dicPenalTypeKey) {
		this.dicPenalTypeKey = dicPenalTypeKey;
	}

	public String getCrimeInfo() {
		return crimeInfo;
	}

	public void setCrimeInfo(String crimeInfo) {
		this.crimeInfo = crimeInfo;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}


	/**县局名字*/
    protected String groupName;
    
    protected String year;  //统计的年份
    protected String month; //统计的月份
    protected Long count;   //统计的结果数量　
    protected String typeName;   //分类名称
    
    public String getGroupName() {
		return groupName;
	}

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no == null ? null : no.trim();
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId == null ? null : groupId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDicGldxjbKey() {
        return dicGldxjbKey;
    }

    public void setDicGldxjbKey(String dicGldxjbKey) {
        this.dicGldxjbKey = dicGldxjbKey == null ? null : dicGldxjbKey.trim();
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias == null ? null : alias.trim();
    }
    @JsonIgnore
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
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

    public String getDicWhcdKey() {
        return dicWhcdKey;
    }

    public void setDicWhcdKey(String dicWhcdKey) {
        this.dicWhcdKey = dicWhcdKey == null ? null : dicWhcdKey.trim();
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin == null ? null : origin.trim();
    }

    public String getDicYzzmmKey() {
        return dicYzzmmKey;
    }

    public void setDicYzzmmKey(String dicYzzmmKey) {
        this.dicYzzmmKey = dicYzzmmKey == null ? null : dicYzzmmKey.trim();
    }

    public String getDicHyzkKey() {
        return dicHyzkKey;
    }

    public void setDicHyzkKey(String dicHyzkKey) {
        this.dicHyzkKey = dicHyzkKey == null ? null : dicHyzkKey.trim();
    }

    public String getRegResidence() {
        return regResidence;
    }

    public void setRegResidence(String regResidence) {
        this.regResidence = regResidence == null ? null : regResidence.trim();
    }

    public String getDicHklxKey() {
        return dicHklxKey;
    }

    public void setDicHklxKey(String dicHklxKey) {
        this.dicHklxKey = dicHklxKey == null ? null : dicHklxKey.trim();
    }

    public String getIdentification() {
        return identification;
    }

    public void setIdentification(String identification) {
        this.identification = identification == null ? null : identification.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

   

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone == null ? null : contactPhone.trim();
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber == null ? null : mobileNumber.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
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

    public String getTerminalId() {
        return terminalId;
    }

    public void setTerminalId(String terminalId) {
        this.terminalId = terminalId == null ? null : terminalId.trim();
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId == null ? null : accountId.trim();
    }

   
    public String getCedentialsNumber() {
        return cedentialsNumber;
    }

    public void setCedentialsNumber(String cedentialsNumber) {
        this.cedentialsNumber = cedentialsNumber == null ? null : cedentialsNumber.trim();
    }

    public String getDicZjlxKey() {
        return dicZjlxKey;
    }

    public void setDicZjlxKey(String dicZjlxKey) {
        this.dicZjlxKey = dicZjlxKey == null ? null : dicZjlxKey.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getDicIsAdultKey() {
        return dicIsAdultKey;
    }

    public void setDicIsAdultKey(String dicIsAdultKey) {
        this.dicIsAdultKey = dicIsAdultKey == null ? null : dicIsAdultKey.trim();
    }

    public String getPassportNum() {
        return passportNum;
    }

    public void setPassportNum(String passportNum) {
        this.passportNum = passportNum == null ? null : passportNum.trim();
    }

    public String getDicSfyhxzKey() {
        return dicSfyhxzKey;
    }

    public void setDicSfyhxzKey(String dicSfyhxzKey) {
        this.dicSfyhxzKey = dicSfyhxzKey == null ? null : dicSfyhxzKey.trim();
    }

    public String getReturnCardNum() {
        return returnCardNum;
    }

    public void setReturnCardNum(String returnCardNum) {
        this.returnCardNum = returnCardNum == null ? null : returnCardNum.trim();
    }

    public Integer getDicSfytbzKey() {
        return dicSfytbzKey;
    }

    public void setDicSfytbzKey(Integer dicSfytbzKey) {
        this.dicSfytbzKey = dicSfytbzKey;
    }

    public String getCompatriotsCardNum() {
        return compatriotsCardNum;
    }

    public void setCompatriotsCardNum(String compatriotsCardNum) {
        this.compatriotsCardNum = compatriotsCardNum == null ? null : compatriotsCardNum.trim();
    }

    public String getHealthyStatusInfo() {
        return healthyStatusInfo;
    }

    public void setHealthyStatusInfo(String healthyStatusInfo) {
        this.healthyStatusInfo = healthyStatusInfo == null ? null : healthyStatusInfo.trim();
    }

    public String getDicSfycrbsKey() {
        return dicSfycrbsKey;
    }

    public void setDicSfycrbsKey(String dicSfycrbsKey) {
        this.dicSfycrbsKey = dicSfycrbsKey == null ? null : dicSfycrbsKey.trim();
    }

    public String getContagionId() {
        return contagionId;
    }

    public void setContagionId(String contagionId) {
        this.contagionId = contagionId == null ? null : contagionId.trim();
    }

    public String getDicXlsfjkKey() {
        return dicXlsfjkKey;
    }

    public void setDicXlsfjkKey(String dicXlsfjkKey) {
        this.dicXlsfjkKey = dicXlsfjkKey == null ? null : dicXlsfjkKey.trim();
    }

    public String getMentalInfo() {
        return mentalInfo;
    }

    public void setMentalInfo(String mentalInfo) {
        this.mentalInfo = mentalInfo == null ? null : mentalInfo.trim();
    }

    public String getIdentifyOrg() {
        return identifyOrg;
    }

    public void setIdentifyOrg(String identifyOrg) {
        this.identifyOrg = identifyOrg == null ? null : identifyOrg.trim();
    }

    public String getDicXzzmmKey() {
        return dicXzzmmKey;
    }

    public void setDicXzzmmKey(String dicXzzmmKey) {
        this.dicXzzmmKey = dicXzzmmKey == null ? null : dicXzzmmKey.trim();
    }

    public String getAddressProId() {
        return addressProId;
    }

    public void setAddressProId(String addressProId) {
        this.addressProId = addressProId == null ? null : addressProId.trim();
    }

    public String getAddressPro() {
        return addressPro;
    }

    public void setAddressPro(String addressPro) {
        this.addressPro = addressPro == null ? null : addressPro.trim();
    }

    public String getAddressCityId() {
        return addressCityId;
    }

    public void setAddressCityId(String addressCityId) {
        this.addressCityId = addressCityId == null ? null : addressCityId.trim();
    }

    public String getAddressCity() {
        return addressCity;
    }

    public void setAddressCity(String addressCity) {
        this.addressCity = addressCity == null ? null : addressCity.trim();
    }

    public String getAddressCountryId() {
        return addressCountryId;
    }

    public void setAddressCountryId(String addressCountryId) {
        this.addressCountryId = addressCountryId == null ? null : addressCountryId.trim();
    }

    public String getAddressCountry() {
        return addressCountry;
    }

    public void setAddressCountry(String addressCountry) {
        this.addressCountry = addressCountry == null ? null : addressCountry.trim();
    }

    public String getAddressStreet() {
        return addressStreet;
    }

    public void setAddressStreet(String addressStreet) {
        this.addressStreet = addressStreet == null ? null : addressStreet.trim();
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail == null ? null : addressDetail.trim();
    }

    public String getRegResidenceProId() {
        return regResidenceProId;
    }

    public void setRegResidenceProId(String regResidenceProId) {
        this.regResidenceProId = regResidenceProId == null ? null : regResidenceProId.trim();
    }

    public String getRegResidencePro() {
        return regResidencePro;
    }

    public void setRegResidencePro(String regResidencePro) {
        this.regResidencePro = regResidencePro == null ? null : regResidencePro.trim();
    }

    public String getRegResidenceCityId() {
        return regResidenceCityId;
    }

    public void setRegResidenceCityId(String regResidenceCityId) {
        this.regResidenceCityId = regResidenceCityId == null ? null : regResidenceCityId.trim();
    }

    public String getRegResidenceCity() {
        return regResidenceCity;
    }

    public void setRegResidenceCity(String regResidenceCity) {
        this.regResidenceCity = regResidenceCity == null ? null : regResidenceCity.trim();
    }

    public String getRegResidenceCountryId() {
        return regResidenceCountryId;
    }

    public void setRegResidenceCountryId(String regResidenceCountryId) {
        this.regResidenceCountryId = regResidenceCountryId == null ? null : regResidenceCountryId.trim();
    }

    public String getRegResidenceCountry() {
        return regResidenceCountry;
    }

    public void setRegResidenceCountry(String regResidenceCountry) {
        this.regResidenceCountry = regResidenceCountry == null ? null : regResidenceCountry.trim();
    }

    public String getRegResidenceStreet() {
        return regResidenceStreet;
    }

    public void setRegResidenceStreet(String regResidenceStreet) {
        this.regResidenceStreet = regResidenceStreet == null ? null : regResidenceStreet.trim();
    }

    public String getRegResidenceDetail() {
        return regResidenceDetail;
    }

    public void setRegResidenceDetail(String regResidenceDetail) {
        this.regResidenceDetail = regResidenceDetail == null ? null : regResidenceDetail.trim();
    }

    public String getDicWorkStatusKey() {
        return dicWorkStatusKey;
    }

    public void setDicWorkStatusKey(String dicWorkStatusKey) {
        this.dicWorkStatusKey = dicWorkStatusKey == null ? null : dicWorkStatusKey.trim();
    }

    public String getNewJob() {
        return newJob;
    }

    public void setNewJob(String newJob) {
        this.newJob = newJob == null ? null : newJob.trim();
    }

    public String getJobPhone() {
        return jobPhone;
    }

    public void setJobPhone(String jobPhone) {
        this.jobPhone = jobPhone == null ? null : jobPhone.trim();
    }

    public String getDicHavaFamilyKey() {
        return dicHavaFamilyKey;
    }

    public void setDicHavaFamilyKey(String dicHavaFamilyKey) {
        this.dicHavaFamilyKey = dicHavaFamilyKey == null ? null : dicHavaFamilyKey.trim();
    }
@JsonFormat(pattern="yyyy-MM-dd")
	public Date getRedressStartDate() {
		return redressStartDate;
	}

	public void setRedressStartDate(Date redressStartDate) {
		this.redressStartDate = redressStartDate;
	}
	@JsonFormat(pattern="yyyy-MM-dd")
	public Date getRedressEndDate() {
		return redressEndDate;
	}

	public void setRedressEndDate(Date redressEndDate) {
		this.redressEndDate = redressEndDate;
	}

	public SysGroup getSysGroup() {
		return sysGroup;
	}

	public void setSysGroup(SysGroup sysGroup) {
		this.sysGroup = sysGroup;
	}

	public String getDicStatusKey() {
		return dicStatusKey;
	}

	public void setDicStatusKey(String dicStatusKey) {
		this.dicStatusKey = dicStatusKey;
	}

	public String getDicHealthyStatusKey() {
		return DicHealthyStatusKey;
	}

	public void setDicHealthyStatusKey(String dicHealthyStatusKey) {
		DicHealthyStatusKey = dicHealthyStatusKey;
	}

	public CulpritJudgment getCulpritJudgment() {
		return culpritJudgment;
	}

	public void setCulpritJudgment(CulpritJudgment culpritJudgment) {
		this.culpritJudgment = culpritJudgment;
	}

	public String getAdjudgeOrg() {
		return adjudgeOrg;
	}

	public void setAdjudgeOrg(String adjudgeOrg) {
		this.adjudgeOrg = adjudgeOrg;
	}

	public String getDicCrimeTypeKey() {
		return dicCrimeTypeKey;
	}

	public void setDicCrimeTypeKey(String dicCrimeTypeKey) {
		this.dicCrimeTypeKey = dicCrimeTypeKey;
	}

	public String getDicMonitorGradeKey() {
		return dicMonitorGradeKey;
	}

	public void setDicMonitorGradeKey(String dicMonitorGradeKey) {
		this.dicMonitorGradeKey = dicMonitorGradeKey;
	}

	public String getShortNumber() {
		return shortNumber;
	}

	public void setShortNumber(String shortNumber) {
		this.shortNumber = shortNumber;
	}

	public String getDicRegisterId() {
		return dicRegisterId;
	}

	public void setDicRegisterId(String dicRegisterId) {
		this.dicRegisterId = dicRegisterId;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getIfaceSn() {
		return ifaceSn;
	}

	public void setIfaceSn(String ifaceSn) {
		this.ifaceSn = ifaceSn;
	}

	public Date getFingerFaceTime() {
		return fingerFaceTime;
	}

	public void setFingerFaceTime(Date fingerFaceTime) {
		this.fingerFaceTime = fingerFaceTime;
	}

}