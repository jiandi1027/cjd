/*
* SysPerson.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.sys;

import java.io.Serializable;
import java.util.Date;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   工作人员
* @Author marcle
* @version 1.0 2017-03-16
 */
public class SysPerson extends DataEntity<SysPerson> implements Serializable {
  

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么) 
	    */  
	    
	private static final long serialVersionUID = 7389813088291317519L;

	/**组唯一标识 */
    private String groupId;

    /**数据字典人员编制 */
    private String dicRybzKey;

    /**数据字典学历 */
    private String dicXlKey;

    /**数据字典婚姻状态 */
    private String dicHyzkKey;

    /**数据字典性别 */
    private String dicSexKey;

    /**姓名 */
    private String name;

    /**住址 */
    private String address;

    /**手机号码 */
    private String mobile;

    /**phone字段作为<志愿者>工作单位使用 */
    private String phone;

    /**工作单位<自愿者使用> */
    private String job;

    /**是否接受短信 */
    private Integer isSms;

    /**人员编码 */
    private String rybm;

    /**出生日期 */
    private Date csrq;

    /**英文名 */
    private String ywm;

    /**身份证号 */
    private String sfzh;

    /**民族 */
    private String mz;

    /**数据字典政治面貌 */
    private String dicZzmmKey;

    /**照片 */
    private String zp;

    /**毕业院校 */
    private String byyx;

    /**最高学位 */
    private String zgxw;

    /**专业 */
    private String zy;

    /**职务 */
    private String zw;

    /**参加工作时间 */
    private Date cjgzsj;

    /**电子邮箱 */
    private String dzyx;

  

   

    public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getDicRybzKey() {
        return dicRybzKey;
    }

    public void setDicRybzKey(String dicRybzKey) {
        this.dicRybzKey = dicRybzKey == null ? null : dicRybzKey.trim();
    }

    public String getDicXlKey() {
        return dicXlKey;
    }

    public void setDicXlKey(String dicXlKey) {
        this.dicXlKey = dicXlKey == null ? null : dicXlKey.trim();
    }

    public String getDicHyzkKey() {
        return dicHyzkKey;
    }

    public void setDicHyzkKey(String dicHyzkKey) {
        this.dicHyzkKey = dicHyzkKey == null ? null : dicHyzkKey.trim();
    }

    public String getDicSexKey() {
        return dicSexKey;
    }

    public void setDicSexKey(String dicSexKey) {
        this.dicSexKey = dicSexKey == null ? null : dicSexKey.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public Integer getIsSms() {
        return isSms;
    }

    public void setIsSms(Integer isSms) {
        this.isSms = isSms;
    }

    public String getRybm() {
        return rybm;
    }

    public void setRybm(String rybm) {
        this.rybm = rybm == null ? null : rybm.trim();
    }

    public Date getCsrq() {
        return csrq;
    }

    public void setCsrq(Date csrq) {
        this.csrq = csrq;
    }

    public String getYwm() {
        return ywm;
    }

    public void setYwm(String ywm) {
        this.ywm = ywm == null ? null : ywm.trim();
    }

    public String getSfzh() {
        return sfzh;
    }

    public void setSfzh(String sfzh) {
        this.sfzh = sfzh == null ? null : sfzh.trim();
    }

    public String getMz() {
        return mz;
    }

    public void setMz(String mz) {
        this.mz = mz == null ? null : mz.trim();
    }

    public String getDicZzmmKey() {
        return dicZzmmKey;
    }

    public void setDicZzmmKey(String dicZzmmKey) {
        this.dicZzmmKey = dicZzmmKey == null ? null : dicZzmmKey.trim();
    }

    public String getZp() {
        return zp;
    }

    public void setZp(String zp) {
        this.zp = zp == null ? null : zp.trim();
    }

    public String getByyx() {
        return byyx;
    }

    public void setByyx(String byyx) {
        this.byyx = byyx == null ? null : byyx.trim();
    }

    public String getZgxw() {
        return zgxw;
    }

    public void setZgxw(String zgxw) {
        this.zgxw = zgxw == null ? null : zgxw.trim();
    }

    public String getZy() {
        return zy;
    }

    public void setZy(String zy) {
        this.zy = zy == null ? null : zy.trim();
    }

    public String getZw() {
        return zw;
    }

    public void setZw(String zw) {
        this.zw = zw == null ? null : zw.trim();
    }

    public Date getCjgzsj() {
        return cjgzsj;
    }

    public void setCjgzsj(Date cjgzsj) {
        this.cjgzsj = cjgzsj;
    }

    public String getDzyx() {
        return dzyx;
    }

    public void setDzyx(String dzyx) {
        this.dzyx = dzyx == null ? null : dzyx.trim();
    }

    
}