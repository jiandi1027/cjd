/*
* SysAccount.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.sys;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   志愿者信息
* @Author marcle
* @version 1.0 2017-03-16
 */
public class Volunteer extends DataEntity<Volunteer> implements Serializable {
  

	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 8402937674642002432L;

	/**
	 * 志愿者姓名
	 */
	String name;
	/**
	 * 文档实际所在的文件路径
	 */
	String path;
	
	/**
	 * 文档实际所在的文件名字
	 */
	String pathName;

	/**
	 * 家庭住址
	 */
	String address;

	/**
	 * 工作
	 */
	String job;

	/**
	 * 手机号码
	 */
	String linkMobile;

	/**
	 * 性别
	 */
	String dicSexKey;
	/**
	 *矫正人员信息	
	 */
	String culpritId;
	/**
	 * 聘用年限(单位年)
	 */
	String limit;
	
	/**
	 * 聘用开始时间
	 */
	Date startDate;
	
	/**
	 * 聘用结束时间
	 */
	Date endDate;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getPathName() {
		return pathName;
	}

	public void setPathName(String pathName) {
		this.pathName = pathName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}



	public String getLinkMobile() {
		return linkMobile;
	}

	public void setLinkMobile(String linkMobile) {
		this.linkMobile = linkMobile;
	}



	public String getDicSexKey() {
		return dicSexKey;
	}

	public void setDicSexKey(String dicSexKey) {
		this.dicSexKey = dicSexKey;
	}

	public String getCulpritId() {
		return culpritId;
	}

	public void setCulpritId(String culpritId) {
		this.culpritId = culpritId;
	}

	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GTM+8")
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GTM+8")
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	
}