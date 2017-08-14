/*
* Kqb.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-07-25 created
*/
package com.rowell.sifa.pojo.sys;

import com.rowell.sifa.pojo.base.DataEntity;
import java.io.Serializable;

public class Kqb extends DataEntity<Kqb> implements Serializable
{
	private String id;
	// 序号
	private String xuhao;
	// 姓名
	private String name;
	// 部门
	private String department;
	// 工作日
	private String workday;
	// 休息日
	private String restday;
	// 加班
	private String overday;
	// 事假
	private String thingrest;
	// 病假
	private String illrest;
	// 工伤假
	private String injurrest;
	// 产假
	private String birthrest;
	// 其他
	private String otherrest;
	// 迟到
	private String overtime;
	// 早退
	private String earlytime;
	// 打卡次数
	private String dakacishu;
	// 备注
	private String beizhu;
	// 所属月份
	private String time;
	// 最大
	private String zuida;
	// 和其他表绑定的记号
	private String jihao;
	//旷工次数
	private String absenteeismtime;

	
	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id == null ? null : id.trim();
	}
	public String getabsenteeismtime()
	{
		return absenteeismtime;
	}

	public void setabsenteeismtime(String absenteeismtime)
	{
		this.absenteeismtime = absenteeismtime == null ? null : absenteeismtime.trim();
	}
	
	public String getxuhao()
	{
		return xuhao;
	}

	public void setxuhao(String xuhao)
	{
		this.xuhao = xuhao == null ? null : xuhao.trim();
	}

	public String getname()
	{
		return name;
	}

	public void setname(String name)
	{
		this.name = name == null ? null : name.trim();
	}

	public String getdepartment()
	{
		return department;
	}

	public void setdepartment(String department)
	{
		this.department = department == null ? null : department.trim();
	}

	public String getworkday()
	{
		return workday;
	}

	public void setworkday(String workday)
	{
		this.workday = workday == null ? null : workday.trim();
	}

	public String getrestday()
	{
		return restday;
	}

	public void setrestday(String restday)
	{
		this.restday = restday == null ? null : restday.trim();
	}

	public String getoverday()
	{
		return overday;
	}

	public void setoverday(String overday)
	{
		this.overday = overday == null ? null : overday.trim();
	}

	public String getthingrest()
	{
		return thingrest;
	}

	public void setthingrest(String thingrest)
	{
		this.thingrest = thingrest == null ? null : thingrest.trim();
	}

	public String getillrest()
	{
		return illrest;
	}

	public void setillrest(String illrest)
	{
		this.illrest = illrest == null ? null : illrest.trim();
	}

	public String getinjurrest()
	{
		return injurrest;
	}

	public void setinjurrest(String injurrest)
	{
		this.injurrest = injurrest == null ? null : injurrest.trim();
	}

	public String getbirthrest()
	{
		return birthrest;
	}

	public void setbirthrest(String birthrest)
	{
		this.birthrest = birthrest == null ? null : birthrest.trim();
	}

	public String getotherrest()
	{
		return otherrest;
	}

	public void setotherrest(String otherrest)
	{
		this.otherrest = otherrest == null ? null : otherrest.trim();
	}

	public String getovertime()
	{
		return overtime;
	}

	public void setovertime(String overtime)
	{
		this.overtime = overtime == null ? null : overtime.trim();
	}

	public String getearlytime()
	{
		return earlytime;
	}

	public void setearlytime(String earlytime)
	{
		this.earlytime = earlytime == null ? null : earlytime.trim();
	}

	public String getdakacishu()
	{
		return dakacishu;
	}

	public void setdakacishu(String dakacishu)
	{
		this.dakacishu = dakacishu == null ? null : dakacishu.trim();
	}

	public String getbeizhu()
	{
		return beizhu;
	}

	public void setbeizhu(String beizhu)
	{
		this.beizhu = beizhu == null ? null : beizhu.trim();
	}

	public String getTime()
	{
		return time;
	}

	public void setTime(String time)
	{
		this.time = time == null ? null : time.trim();
	}

	public String getZuida()
	{
		return zuida;
	}

	public void setZuida(String zuida)
	{
		this.zuida = zuida == null ? null : zuida.trim();
	}

	public String getJihao()
	{
		return jihao;
	}

	public void setJihao(String jihao)
	{
		this.jihao = jihao == null ? null : jihao.trim();
	}
}