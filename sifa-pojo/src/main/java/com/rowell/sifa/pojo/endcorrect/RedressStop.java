/*
* RedressStop.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.endcorrect;

import java.io.Serializable;
import java.util.Date;

import com.rowell.sifa.pojo.base.ProcessEntity;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.sys.SysGroup;

/**
 * 特殊原因终止矫正
 * 
 * @Author marcle
 * @version 1.0 2017-03-16
 */
public class RedressStop extends ProcessEntity<RedressStop> implements Serializable
{

	/**
	 * @Fields field:field:{todo}(用一句话描述这个变量表示什么)
	 */

	private static final long serialVersionUID = 6998002715207302021L;

	/** NAME */
	private String name;

	/** 文档实际所在的文件路径 */
	private String path;

	/** 犯人 */
	private String culpritId;

	/** 逃脱或下落不明或死亡时间 */
	private String abnormalTime;

	/** 逃脱或下落不明或死亡原因 */
	private String abnormalReason;

	/** 采取何种措施及处理结果 */
	private String measure;

	/** 文檔/附件关联对象 */
	private String documentId;

	/** FILE_PATH */
	private String filePath;

	/** 矫正解除（终止）类型 */
	private String jjlx;

	/** 死亡类型 */
	private String swlx;

	/** 矫正解除（终止）说明 */
	private String jjsm;

	/** 矫正解除（终止）日期 */
	private Date jjrq;

	/** 申请日期 */
	private Date sqrq;

	/** 文档实际所在的文件路径 */
	private String relatePath;

	/** 文档实际所在的文件路径名称 */
	private String relatePathName;

	/** 数据字典是否退回 */
	private String dicIsRetreatKey;

	/** 审批状态 */
	private String status;

	/** 犯人姓名用于显示 */
	protected String culpritName;
	/** groupId */
	protected String groupId;
	/** 犯人组织用于显示 */
	protected String groupName;
	/** 矫正开始时间 */
	protected Date redressStartDate;
	/** 矫正结束时间 */
	protected Date redressEndDate;

	protected Culprit culprit;
	protected SysGroup sysGroup;

	
	// 是否打印，0表示未打印,1标识已打印
	private Integer isPrintONE;
	
	private Integer isPrintTWO;
	
	public Culprit getCulprit()
	{
		return culprit;
	}

	public void setCulprit(Culprit culprit)
	{
		this.culprit = culprit;
	}

	public SysGroup getSysGroup()
	{
		return sysGroup;
	}

	public void setSysGroup(SysGroup sysGroup)
	{
		this.sysGroup = sysGroup;
	}

	

	public Integer getIsPrintONE()
	{
		return isPrintONE;
	}

	public void setIsPrintONE(Integer isPrintONE)
	{
		this.isPrintONE = isPrintONE;
	}

	public Integer getIsPrintTWO()
	{
		return isPrintTWO;
	}

	public void setIsPrintTWO(Integer isPrintTWO)
	{
		this.isPrintTWO = isPrintTWO;
	}

	public Date getRedressStartDate()
	{
		return redressStartDate;
	}

	public void setRedressStartDate(Date redressStartDate)
	{
		this.redressStartDate = redressStartDate;
	}

	public Date getRedressEndDate()
	{
		return redressEndDate;
	}

	public void setRedressEndDate(Date redressEndDate)
	{
		this.redressEndDate = redressEndDate;
	}

	public String getGroupId()
	{
		return groupId;
	}

	public void setGroupId(String groupId)
	{
		this.groupId = groupId;
	}

	public String getCulpritName()
	{
		return culpritName;
	}

	public void setCulpritName(String culpritName)
	{
		this.culpritName = culpritName;
	}

	public String getGroupName()
	{
		return groupName;
	}

	public void setGroupName(String groupName)
	{
		this.groupName = groupName;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name == null ? null : name.trim();
	}

	public String getPath()
	{
		return path;
	}

	public void setPath(String path)
	{
		this.path = path == null ? null : path.trim();
	}

	public String getCulpritId()
	{
		return culpritId;
	}

	public void setCulpritId(String culpritId)
	{
		this.culpritId = culpritId == null ? null : culpritId.trim();
	}

	public String getAbnormalTime()
	{
		return abnormalTime;
	}

	public void setAbnormalTime(String abnormalTime)
	{
		this.abnormalTime = abnormalTime == null ? null : abnormalTime.trim();
	}

	public String getAbnormalReason()
	{
		return abnormalReason;
	}

	public void setAbnormalReason(String abnormalReason)
	{
		this.abnormalReason = abnormalReason == null ? null : abnormalReason.trim();
	}

	public String getMeasure()
	{
		return measure;
	}

	public void setMeasure(String measure)
	{
		this.measure = measure == null ? null : measure.trim();
	}

	public String getDocumentId()
	{
		return documentId;
	}

	public void setDocumentId(String documentId)
	{
		this.documentId = documentId == null ? null : documentId.trim();
	}

	public String getFilePath()
	{
		return filePath;
	}

	public void setFilePath(String filePath)
	{
		this.filePath = filePath == null ? null : filePath.trim();
	}

	public String getJjlx()
	{
		return jjlx;
	}

	public void setJjlx(String jjlx)
	{
		this.jjlx = jjlx == null ? null : jjlx.trim();
	}

	public String getSwlx()
	{
		return swlx;
	}

	public void setSwlx(String swlx)
	{
		this.swlx = swlx == null ? null : swlx.trim();
	}

	public String getJjsm()
	{
		return jjsm;
	}

	public void setJjsm(String jjsm)
	{
		this.jjsm = jjsm == null ? null : jjsm.trim();
	}

	public Date getJjrq()
	{
		return jjrq;
	}

	public void setJjrq(Date jjrq)
	{
		this.jjrq = jjrq;
	}

	public Date getSqrq()
	{
		return sqrq;
	}

	public void setSqrq(Date sqrq)
	{
		this.sqrq = sqrq;
	}

	public String getRelatePath()
	{
		return relatePath;
	}

	public void setRelatePath(String relatePath)
	{
		this.relatePath = relatePath == null ? null : relatePath.trim();
	}

	public String getRelatePathName()
	{
		return relatePathName;
	}

	public void setRelatePathName(String relatePathName)
	{
		this.relatePathName = relatePathName == null ? null : relatePathName.trim();
	}

	public String getDicIsRetreatKey()
	{
		return dicIsRetreatKey;
	}

	public void setDicIsRetreatKey(String dicIsRetreatKey)
	{
		this.dicIsRetreatKey = dicIsRetreatKey == null ? null : dicIsRetreatKey.trim();
	}

	public String getStatus()
	{
		return status;
	}

	public void setStatus(String status)
	{
		this.status = status == null ? null : status.trim();
	}

}