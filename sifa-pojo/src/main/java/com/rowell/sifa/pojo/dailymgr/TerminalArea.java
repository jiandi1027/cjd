/*
* TerminalArea.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-17 created
*/
package com.rowell.sifa.pojo.dailymgr;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   终端所绑定的电子围墙
* @Author marcle
* @version 1.0 2017-03-17
 */
public class TerminalArea extends DataEntity<TerminalArea> implements Serializable {
   

    /**对应区域ID */
    private String areaId;

    /**终端ID */
    private String terminalid;

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public String getTerminalid() {
		return terminalid;
	}

	public void setTerminalid(String terminalid) {
		this.terminalid = terminalid;
	}

 
    

   
}