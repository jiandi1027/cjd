/*
* Death.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.endcorrect;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.ProcessEntity;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.sys.SysGroup;

/**
 * 死亡登记
 * 
 * @Author marcle
 * @version 1.0 2017-03-16
 */
public class Death extends ProcessEntity<Death> implements Serializable
{

	/**
	 * @Fields field:field:{todo}(用一句话描述这个变量表示什么)
	 */

	private static final long serialVersionUID = 2479635736101139563L;

	/** 死亡时间 */
	private Date deathlTime;

	/** 死亡原因 */
	private String deathReason;

	/** 死亡相关情况 */
	private String situation;

	/** 文档路径 */
	private String path;

	/** 文档名称 */
	private String pathName;

	/** 犯人 */
	private String culpritId;

	/** 执法文书文号 */
	private String writNum;

	protected String culpritName;

	protected String groupName;

	protected String groupId;

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

	// 是否打印建议书，0表示未打印,1标识已打印
	private Integer isPrintONE;
	// 是否打印审核表
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

	protected Culprit culprit;
	protected SysGroup sysGroup;

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

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getDeathlTime()
	{
		return deathlTime;
	}

	public void setDeathlTime(Date deathlTime)
	{
		this.deathlTime = deathlTime;
	}

	public String getDeathReason()
	{
		return deathReason;
	}

	public void setDeathReason(String deathReason)
	{
		this.deathReason = deathReason == null ? null : deathReason.trim();
	}

	public String getSituation()
	{
		return situation;
	}

	public void setSituation(String situation)
	{
		this.situation = situation == null ? null : situation.trim();
	}

	public String getPath()
	{
		return path;
	}

	public void setPath(String path)
	{
		this.path = path == null ? null : path.trim();
	}

	public String getPathName()
	{
		return pathName;
	}

	public void setPathName(String pathName)
	{
		this.pathName = pathName == null ? null : pathName.trim();
	}

	public String getCulpritId()
	{
		return culpritId;
	}

	public void setCulpritId(String culpritId)
	{
		this.culpritId = culpritId == null ? null : culpritId.trim();
	}

	public String getWritNum()
	{
		return writNum;
	}

	public void setWritNum(String writNum)
	{
		this.writNum = writNum == null ? null : writNum.trim();
	}

	public String getGroupId()
	{
		return groupId;
	}

	public void setGroupId(String groupId)
	{
		this.groupId = groupId;
	}

}