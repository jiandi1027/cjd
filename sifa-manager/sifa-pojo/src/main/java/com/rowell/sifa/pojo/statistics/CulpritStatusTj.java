package com.rowell.sifa.pojo.statistics;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.rowell.sifa.pojo.base.ProcessEntity;

/**
 * 社区矫正对象情况统计表
 */
@SuppressWarnings("serial")
@JsonInclude(Include.NON_NULL)
public class CulpritStatusTj extends ProcessEntity<CulpritStatusTj> implements Serializable {

	/**
	 * 数据字典文档名称
	 * @hibernate.property column="NAME" type="string"
	 */
	private String dicWdmcId;

	/**
	 * 部门id
	 */
	private String groupId;

	/**
	 * 文档实际所在的文件路径
	 * @hibernate.property column="PATH" type="string"
	 */
	private String path;

	/**
	 * 汇报年月
	 * 
	 * @hibernate.property column="REPORT_DATE" type="date"
	 */
	private Date reportDate;

	/**
	 * 报表状态
	 */
	private String dicState;
	
	/**
	 * 本月在册人数
	 * 
	 * @hibernate.property column="BYZCRS" type="Integer"
	 */
	private Integer byzcrs;

	/**
	 * 上月在册人数
	 * 
	 * @hibernate.property column="syzcrs" type="Integer"
	 */
	private Integer syzcrs;

	/**
	 * 本月增加
	 * 
	 * @hibernate.property column="change_byzj" type="Integer"
	 */
	private Integer change_byzj;

	/**
	 * 期满解除矫正
	 * 
	 * @hibernate.property column="change_qmjcjz" type="Integer"
	 */
	private Integer change_qmjcjz;

	/**
	 * 收监执行
	 * 
	 * @hibernate.property column="change_sjzx" type="Integer"
	 */
	private Integer change_sjzx;

	/**
	 * 死亡
	 * 
	 * @hibernate.property column="change_sw" type="Integer"
	 */
	private Integer change_sw;

	/**
	 * 其他原因
	 * 
	 * @hibernate.property column="change_qtyy" type="Integer"
	 */
	private Integer change_qtyy;

	/**
	 * 管制
	 * 
	 * @hibernate.property column="class_gz" type="Integer"
	 */
	private Integer class_gz;

	/**
	 * 缓刑
	 * 
	 * @hibernate.property column="class_hx" type="Integer"
	 */
	private Integer class_hx;

	/**
	 * 假释
	 * 
	 * @hibernate.property column="class_js" type="Integer"
	 */
	private Integer class_js;

	/**
	 * 暂予监外执行
	 * 
	 * @hibernate.property column="class_zyjwzx" type="Integer"
	 */
	private Integer class_zyjwzx;

	/**
	 * 剥夺政治权利
	 * 
	 * @hibernate.property column="class_bdzzql" type="Integer"
	 */
	private Integer class_bdzzql;

	/**
	 * 危害国家安全
	 * 
	 * @hibernate.property column="type_whgjaqz" type="Integer"
	 */
	private Integer type_whgjaqz;

	/**
	 * 危害公共安全
	 * 
	 * @hibernate.property column="type_whggaqz" type="Integer"
	 */
	private Integer type_whggaqz;

	/**
	 * 破坏社会主义市场经济秩序
	 * 
	 * @hibernate.property column="type_phshzyscjjzxz" type="Integer"
	 */
	private Integer type_phshzyz;

	/**
	 * 侵犯公民人身权利
	 * 
	 * @hibernate.property column="type_qfgmrsqlz" type="Integer"
	 */
	private Integer type_qfgmrsqlz;

	/**
	 * 侵犯财产
	 * 
	 * @hibernate.property column="type_qfccz" type="Integer"
	 */
	private Integer type_qfccz;

	/**
	 * 妨害社会管理秩序
	 * 
	 * @hibernate.property column="type_fhshglzxz" type="Integer"
	 */
	private Integer type_fhshglzxz;

	/**
	 * 贪污贿赂
	 * 
	 * @hibernate.property column="type_twhlz" type="Integer"
	 */
	private Integer type_twhlz;

	/**
	 * 渎职
	 * 
	 * @hibernate.property column="type_dzz" type="Integer"
	 */
	private Integer type_dzz;

	/**
	 * 其他
	 * 
	 * @hibernate.property column="type_other" type="Integer"
	 */
	private Integer type_other;

	/**
	 * 城镇户口
	 * 
	 * @hibernate.property column="reg_city" type="Integer"
	 */
	private Integer reg_city;

	/**
	 * 农村户口
	 * 
	 * @hibernate.property column="reg_village" type="Integer"
	 */
	private Integer reg_village;
	
	/**
	 * 户口其他
	 * 
	 * @hibernate.property column="reg_other" type="Integer"
	 */
	private Integer reg_other;

	/**
	 * 男
	 * 
	 * @hibernate.property column="sex_male" type="Integer"
	 */
	private Integer sex_male;

	/**
	 * 女
	 * 
	 * @hibernate.property column="sex_female" type="Integer"
	 */
	private Integer sex_female;
	
	/**
	 * 民族-汉
	 * 
	 * @hibernate.property column="nation_han" type="Integer"
	 */
	private Integer nation_han;

	/**
	 * 民族-少数民族
	 * 
	 * @hibernate.property column="nation_few" type="Integer"
	 */
	private Integer nation_few;

	/**
	 * 18以下
	 * 
	 * @hibernate.property column="age_u18" type="Integer"
	 */
	private Integer age_u18;

	/**
	 * 19-45
	 * 
	 * @hibernate.property column="age_19to45" type="Integer"
	 */
	private Integer age_19to45;

	/**
	 * 46-60
	 * 
	 * @hibernate.property column="age_46to60" type="Integer"
	 */
	private Integer age_46to60;

	/**
	 * 61岁以上
	 * 
	 * @hibernate.property column="age_61p" type="Integer"
	 */
	private Integer age_61p;
	
	
	/**
	 * 文化——大专及以上
	 * 
	 * @hibernate.property column="qualification_junior" type="Integer"
	 */
	private Integer qualification_junior;

	/**
	 * 高中
	 * 
	 * @hibernate.property column="qualification_senior" type="Integer"
	 */
	private Integer qualification_senior ;

	/**
	 * 初中
	 * 
	 * @hibernate.property column="qualification_middle" type="Integer"
	 */
	private Integer qualification_middle;

	/**
	 * 小学及以下
	 * 
	 * @hibernate.property column="qualification_primary" type="Integer"
	 */
	private Integer qualification_primary ;
	
	
	/**
	 *就业就学情况-在校就读
	 * 
	 * @hibernate.property column="work_study" type="Integer"
	 */
	private Integer work_study ;

	/**
	 * 就业就学情况-就业
	 * 
	 * @hibernate.property column="work_on" type="Integer"
	 */
	private Integer work_on;

	/**
	 * 就业就学情况-无业
	 * 
	 * @hibernate.property column="work_nojob" type="Integer"
	 */
	private Integer work_nojob ;

	/**
	 * 受治安处罚
	 * 
	 * @hibernate.property column="praise_szacf" type="Integer"
	 */
	private Integer praise_szacf;
	
	/**
	 * 收监执行
	 * 
	 * @hibernate.property column="praise_sjzx" type="Integer"
	 */
	private Integer praise_sjzx;
	
	/**
	 * 社区矫正机构奖励
	 * 
	 * @hibernate.property column="praise_sqjl" type="Integer"
	 */
	private Integer praise_sqjl;
	
	/**
	 * 社区矫正机构处处罚
	 * 
	 * @hibernate.property column="praise_sqcf" type="Integer"
	 */
	private Integer praise_sqcf;
	
	/**
	 * 裁定减刑
	 * 
	 * @hibernate.property column="praise_cdjx" type="Integer"
	 */
	private Integer praise_cdjx;
	
	
	/**
	 * 其他处罚
	 * 
	 * @hibernate.property column="praise_qtcf" type="Integer"
	 */
	private Integer praise_qtcf;
	
	/**
	 * 其他奖励
	 * 
	 * @hibernate.property column="praise_qtjl" type="Integer"
	 */
	private Integer praise_qtjl;

	/**
	 * 本月重新犯罪
	 * 
	 * @hibernate.property column="zfxz" type="Integer"
	 */
	private Integer zfxz;
	
	/**
	 * 截止本月脱管
	 * 
	 * @hibernate.property column="jzbytg" type="Integer"
	 */
	private Integer jzbytg;
	
	/**
	 * 累计接收
	 * 
	 * @hibernate.property column="total_accept" type="Integer"
	 */
	private Integer total_accept;
	
	/**
	 * 累计解除矫正
	 * 
	 * @hibernate.property column="total_relieve" type="Integer"
	 */
	private Integer total_relieve;
	
	/**
	 * 累计重新犯罪
	 * 
	 * @hibernate.property column="total_crime_again" type="Integer"
	 */
	private Integer total_crime_again;

	
	/**
	 * 上报时间
	 * 
	 * @hibernate.property column="REPORT_TIME" type="timestamp"
	 */
	private Date reporttime;

    protected String groupName;
	/**
	 * 部门级别
	 */
    protected String groupleave="3";//默认为3
    
    /**退回原因 */
    private String returnReason;
    
    /**退回时间 */
    private Date returnTime;
    
    
    
	public String getReturnReason() {
		return returnReason;
	}

	public void setReturnReason(String returnReason) {
		this.returnReason = returnReason;
	}

	public Date getReturnTime() {
		return returnTime;
	}

	public void setReturnTime(Date returnTime) {
		this.returnTime = returnTime;
	}

	public String getGroupleave() {
		return groupleave;
	}

	public void setGroupleave(String groupleave) {
		this.groupleave = groupleave;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getDicState() {
		return dicState;
	}

	public void setDicState(String dicState) {
		this.dicState = dicState;
	}

	public String getDicWdmcId() {
		return dicWdmcId;
	}

	public void setDicWdmcId(String dicWdmcId) {
		this.dicWdmcId = dicWdmcId;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	@JsonFormat(pattern = "yyyy-MM",timezone="GMT+8")
	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public Integer getByzcrs() {
		return byzcrs;
	}

	public void setByzcrs(Integer byzcrs) {
		this.byzcrs = byzcrs;
	}

	public Integer getSyzcrs() {
		return syzcrs;
	}

	public void setSyzcrs(Integer syzcrs) {
		this.syzcrs = syzcrs;
	}

	public Integer getChange_byzj() {
		return change_byzj;
	}

	public void setChange_byzj(Integer change_byzj) {
		this.change_byzj = change_byzj;
	}

	public Integer getChange_qmjcjz() {
		return change_qmjcjz;
	}

	public void setChange_qmjcjz(Integer change_qmjcjz) {
		this.change_qmjcjz = change_qmjcjz;
	}

	public Integer getChange_sjzx() {
		return change_sjzx;
	}

	public void setChange_sjzx(Integer change_sjzx) {
		this.change_sjzx = change_sjzx;
	}

	public Integer getChange_sw() {
		return change_sw;
	}

	public void setChange_sw(Integer change_sw) {
		this.change_sw = change_sw;
	}

	public Integer getChange_qtyy() {
		return change_qtyy;
	}

	public void setChange_qtyy(Integer change_qtyy) {
		this.change_qtyy = change_qtyy;
	}

	public Integer getClass_gz() {
		return class_gz;
	}

	public void setClass_gz(Integer class_gz) {
		this.class_gz = class_gz;
	}

	public Integer getClass_hx() {
		return class_hx;
	}

	public void setClass_hx(Integer class_hx) {
		this.class_hx = class_hx;
	}

	public Integer getClass_js() {
		return class_js;
	}

	public void setClass_js(Integer class_js) {
		this.class_js = class_js;
	}

	public Integer getClass_zyjwzx() {
		return class_zyjwzx;
	}

	public void setClass_zyjwzx(Integer class_zyjwzx) {
		this.class_zyjwzx = class_zyjwzx;
	}

	public Integer getClass_bdzzql() {
		return class_bdzzql;
	}

	public void setClass_bdzzql(Integer class_bdzzql) {
		this.class_bdzzql = class_bdzzql;
	}

	public Integer getType_whgjaqz() {
		return type_whgjaqz;
	}

	public void setType_whgjaqz(Integer type_whgjaqz) {
		this.type_whgjaqz = type_whgjaqz;
	}

	public Integer getType_whggaqz() {
		return type_whggaqz;
	}

	public void setType_whggaqz(Integer type_whggaqz) {
		this.type_whggaqz = type_whggaqz;
	}

	public Integer getType_phshzyz() {
		return type_phshzyz;
	}

	public void setType_phshzyz(Integer type_phshzyz) {
		this.type_phshzyz = type_phshzyz;
	}

	public Integer getType_qfgmrsqlz() {
		return type_qfgmrsqlz;
	}

	public void setType_qfgmrsqlz(Integer type_qfgmrsqlz) {
		this.type_qfgmrsqlz = type_qfgmrsqlz;
	}

	public Integer getType_qfccz() {
		return type_qfccz;
	}

	public void setType_qfccz(Integer type_qfccz) {
		this.type_qfccz = type_qfccz;
	}

	public Integer getType_fhshglzxz() {
		return type_fhshglzxz;
	}

	public void setType_fhshglzxz(Integer type_fhshglzxz) {
		this.type_fhshglzxz = type_fhshglzxz;
	}

	public Integer getType_twhlz() {
		return type_twhlz;
	}

	public void setType_twhlz(Integer type_twhlz) {
		this.type_twhlz = type_twhlz;
	}

	public Integer getType_dzz() {
		return type_dzz;
	}

	public void setType_dzz(Integer type_dzz) {
		this.type_dzz = type_dzz;
	}

	public Integer getType_other() {
		return type_other;
	}

	public void setType_other(Integer type_other) {
		this.type_other = type_other;
	}

	public Integer getReg_city() {
		return reg_city;
	}

	public void setReg_city(Integer reg_city) {
		this.reg_city = reg_city;
	}

	public Integer getReg_village() {
		return reg_village;
	}

	public void setReg_village(Integer reg_village) {
		this.reg_village = reg_village;
	}

	public Integer getReg_other() {
		return reg_other;
	}

	public void setReg_other(Integer reg_other) {
		this.reg_other = reg_other;
	}

	public Integer getSex_male() {
		return sex_male;
	}

	public void setSex_male(Integer sex_male) {
		this.sex_male = sex_male;
	}

	public Integer getSex_female() {
		return sex_female;
	}

	public void setSex_female(Integer sex_female) {
		this.sex_female = sex_female;
	}

	public Integer getNation_han() {
		return nation_han;
	}

	public void setNation_han(Integer nation_han) {
		this.nation_han = nation_han;
	}

	public Integer getNation_few() {
		return nation_few;
	}

	public void setNation_few(Integer nation_few) {
		this.nation_few = nation_few;
	}

	public Integer getAge_u18() {
		return age_u18;
	}

	public void setAge_u18(Integer age_u18) {
		this.age_u18 = age_u18;
	}

	public Integer getAge_19to45() {
		return age_19to45;
	}

	public void setAge_19to45(Integer age_19to45) {
		this.age_19to45 = age_19to45;
	}

	public Integer getAge_46to60() {
		return age_46to60;
	}

	public void setAge_46to60(Integer age_46to60) {
		this.age_46to60 = age_46to60;
	}

	public Integer getAge_61p() {
		return age_61p;
	}

	public void setAge_61p(Integer age_61p) {
		this.age_61p = age_61p;
	}

	public Integer getQualification_junior() {
		return qualification_junior;
	}

	public void setQualification_junior(Integer qualification_junior) {
		this.qualification_junior = qualification_junior;
	}

	public Integer getQualification_senior() {
		return qualification_senior;
	}

	public void setQualification_senior(Integer qualification_senior) {
		this.qualification_senior = qualification_senior;
	}

	public Integer getQualification_middle() {
		return qualification_middle;
	}

	public void setQualification_middle(Integer qualification_middle) {
		this.qualification_middle = qualification_middle;
	}

	public Integer getQualification_primary() {
		return qualification_primary;
	}

	public void setQualification_primary(Integer qualification_primary) {
		this.qualification_primary = qualification_primary;
	}

	public Integer getWork_study() {
		return work_study;
	}

	public void setWork_study(Integer work_study) {
		this.work_study = work_study;
	}

	public Integer getWork_on() {
		return work_on;
	}

	public void setWork_on(Integer work_on) {
		this.work_on = work_on;
	}

	public Integer getWork_nojob() {
		return work_nojob;
	}

	public void setWork_nojob(Integer work_nojob) {
		this.work_nojob = work_nojob;
	}

	public Integer getPraise_szacf() {
		return praise_szacf;
	}

	public void setPraise_szacf(Integer praise_szacf) {
		this.praise_szacf = praise_szacf;
	}

	public Integer getPraise_sjzx() {
		return praise_sjzx;
	}

	public void setPraise_sjzx(Integer praise_sjzx) {
		this.praise_sjzx = praise_sjzx;
	}

	public Integer getPraise_sqjl() {
		return praise_sqjl;
	}

	public void setPraise_sqjl(Integer praise_sqjl) {
		this.praise_sqjl = praise_sqjl;
	}

	public Integer getPraise_sqcf() {
		return praise_sqcf;
	}

	public void setPraise_sqcf(Integer praise_sqcf) {
		this.praise_sqcf = praise_sqcf;
	}

	public Integer getPraise_cdjx() {
		return praise_cdjx;
	}

	public void setPraise_cdjx(Integer praise_cdjx) {
		this.praise_cdjx = praise_cdjx;
	}

	public Integer getPraise_qtcf() {
		return praise_qtcf;
	}

	public void setPraise_qtcf(Integer praise_qtcf) {
		this.praise_qtcf = praise_qtcf;
	}

	public Integer getPraise_qtjl() {
		return praise_qtjl;
	}

	public void setPraise_qtjl(Integer praise_qtjl) {
		this.praise_qtjl = praise_qtjl;
	}

	public Integer getZfxz() {
		return zfxz;
	}

	public void setZfxz(Integer zfxz) {
		this.zfxz = zfxz;
	}

	public Integer getJzbytg() {
		return jzbytg;
	}

	public void setJzbytg(Integer jzbytg) {
		this.jzbytg = jzbytg;
	}

	public Integer getTotal_accept() {
		return total_accept;
	}

	public void setTotal_accept(Integer total_accept) {
		this.total_accept = total_accept;
	}

	public Integer getTotal_relieve() {
		return total_relieve;
	}

	public void setTotal_relieve(Integer total_relieve) {
		this.total_relieve = total_relieve;
	}

	public Integer getTotal_crime_again() {
		return total_crime_again;
	}

	public void setTotal_crime_again(Integer total_crime_again) {
		this.total_crime_again = total_crime_again;
	}
	@JsonFormat(pattern = "yyyy-MM",timezone="GMT+8")
	public Date getReporttime() {
		return reporttime;
	}

	public void setReporttime(Date reporttime) {
		this.reporttime = reporttime;
	}

	
	
	


}
