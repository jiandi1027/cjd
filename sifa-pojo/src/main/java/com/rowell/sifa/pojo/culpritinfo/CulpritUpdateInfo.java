/*
* CulpritUpdateInfo.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-04-18 created
*/
package com.rowell.sifa.pojo.culpritinfo;


import java.io.Serializable;
import java.util.Date;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   矫正对象修改信息表
* @Author marcle
* @version 1.0 2017-04-18
 */
public class CulpritUpdateInfo extends DataEntity<CulpritUpdateInfo> implements Serializable {
      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 1L;


    /**矫正对象I */
    private String culpritId;

    /**组别 */
    private String groupId;

    /**修改信息 */
    private String updateInfo;

    /**备注 */
    private String note;

    protected String updaterName;
    
	public String getUpdaterName() {
		return updaterName;
	}

	public void setUpdaterName(String updaterName) {
		this.updaterName = updaterName;
	}

	public String getCulpritId() {
		return culpritId;
	}

	public void setCulpritId(String culpritId) {
		this.culpritId = culpritId;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getUpdateInfo() {
		return updateInfo;
	}

	public void setUpdateInfo(String updateInfo) {
		this.updateInfo = updateInfo;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}


    
}