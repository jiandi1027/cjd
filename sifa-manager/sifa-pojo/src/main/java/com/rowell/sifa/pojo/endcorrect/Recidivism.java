/*
* Recidivism.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.endcorrect;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.ProcessEntity;

/**
 *   重新犯罪
* @Author marcle
* @version 1.0 2017-03-16
 */
public class Recidivism extends ProcessEntity<Recidivism> implements Serializable {


      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 4948869134519941902L;

	/**矫正对象 */
    private String culpritId;

    /**新犯罪名 */
    private String newCrime;

    /**判决时间 */
    private Date judgmentTime;

    /**判决法院 */
    private String judgmentCourt;

    /**立案单位 */
    private String registerUnit;

    /**立案时间 */
    private Date registerTime;

    /**掌握情况时间 */
    private Date graspTime;

    /**数据字典掌握情况方式 */
    private String dicGraspTypeKey;

    /**法律文书路径 */
    private String path;

    /**法律文书名称 */
    private String pathName;

    protected String culpritName;  //对象姓名
    protected String groupName;	   //对象直属司法所
    protected String groupId;	   //对象直属司法所
    private Date startDate;        //开始时间
    private Date endDate;		   //结束时间
   
    public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getNewCrime() {
        return newCrime;
    }

    public void setNewCrime(String newCrime) {
        this.newCrime = newCrime == null ? null : newCrime.trim();
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    public Date getJudgmentTime() {
        return judgmentTime;
    }

    public void setJudgmentTime(Date judgmentTime) {
        this.judgmentTime = judgmentTime;
    }

    public String getJudgmentCourt() {
        return judgmentCourt;
    }

    public void setJudgmentCourt(String judgmentCourt) {
        this.judgmentCourt = judgmentCourt == null ? null : judgmentCourt.trim();
    }

    public String getRegisterUnit() {
        return registerUnit;
    }

    public void setRegisterUnit(String registerUnit) {
        this.registerUnit = registerUnit == null ? null : registerUnit.trim();
    }

    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public Date getGraspTime() {
        return graspTime;
    }

    public void setGraspTime(Date graspTime) {
        this.graspTime = graspTime;
    }

    public String getDicGraspTypeKey() {
        return dicGraspTypeKey;
    }

    public void setDicGraspTypeKey(String dicGraspTypeKey) {
        this.dicGraspTypeKey = dicGraspTypeKey == null ? null : dicGraspTypeKey.trim();
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    public String getPathName() {
        return pathName;
    }

    public void setPathName(String pathName) {
        this.pathName = pathName == null ? null : pathName.trim();
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

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

    
}