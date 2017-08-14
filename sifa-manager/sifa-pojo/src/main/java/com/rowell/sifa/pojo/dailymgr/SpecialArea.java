package com.rowell.sifa.pojo.dailymgr;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.ProcessEntity;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.sys.SysGroup;

/**
 * 进入特定区域管理
 * 
 * @author hxl
 * @hibernate.class table="SF_SPECIAL_AREA"
 */
public final class SpecialArea extends ProcessEntity<SpecialArea> implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	/**社区服刑人员  CULPRIT_ID*/
    private String culpritId;

	/**数据字典抽查类型*/
    private String dicCheckTypeId;
	
	/** 申请进入区域名称*/
    private String area;
	
	/**申请提交时间*/
    private Date applyDate;
	
	/**申请理由*/
    private String reason;
	
	/**申请开始时间*/
    private Date startDate;
	
	/**申请结束时间*/
    private Date  endDate;
	
	/**备注*/
    private String note;
	
	 /**数据字典监管等级 */
    private String dicMonitorGradeKey;

   
    //是否打印审核表,0表示未打印,1标识已打印
    private Integer isPrintSHB;
    //数据字典材料送达方式
    private String dicSdfsKey;
    
    protected String culpritName;
	
	protected String groupName;
	    
	protected Culprit culprit;
	    
	protected SysGroup sysGroup;

	 protected String groupId;
	 
	 
	 
	 
	public Integer getIsPrintSHB() {
		return isPrintSHB;
	}

	public void setIsPrintSHB(Integer isPrintSHB) {
		this.isPrintSHB = isPrintSHB;
	}

	public String getDicSdfsKey() {
		return dicSdfsKey;
	}

	public void setDicSdfsKey(String dicSdfsKey) {
		this.dicSdfsKey = dicSdfsKey;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getCulpritId() {
		return culpritId;
	}

	public void setCulpritId(String culpritId) {
		this.culpritId = culpritId;
	}

	public String getDicCheckTypeId() {
		return dicCheckTypeId;
	}

	public void setDicCheckTypeId(String dicCheckTypeId) {
		this.dicCheckTypeId = dicCheckTypeId;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	@JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	@JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	@JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getDicMonitorGradeKey() {
		return dicMonitorGradeKey;
	}

	public void setDicMonitorGradeKey(String dicMonitorGradeKey) {
		this.dicMonitorGradeKey = dicMonitorGradeKey;
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

	
	
}
