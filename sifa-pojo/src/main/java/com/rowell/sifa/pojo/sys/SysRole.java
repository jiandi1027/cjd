/*
* SysRole.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.sys;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   用户角色
* @Author marcle
* @version 1.0 2017-03-16
 */
public class SysRole extends DataEntity<SysRole> implements Serializable {
  

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么) 
	    */  
	    
	private static final long serialVersionUID = 3688231899467700339L;

	/**名称 */
    private String name;

    /**角色英文名称 */
    private String ename;

    /**描述 */
    private String description;
    /***可用***/
    private Integer isAvailable;

  
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename == null ? null : ename.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

	public Integer getIsAvailable() {
		return isAvailable;
	}

	public void setIsAvailable(Integer isAvailable) {
		this.isAvailable = isAvailable;
	}

   
}