/*
* WorkFreeCulprit.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-17 created
*/
package com.rowell.sifa.pojo.dailymgr;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   公益劳动与对象的关联
* @Author marcle
* @version 1.0 2017-03-17
 */
public class WorkFreeCulprit extends DataEntity<WorkFreeCulprit> implements Serializable {
   
    /**犯人 */
    private String culpritId;

    /**社区服务id */
    private String workfreeId;

    /**数据字典公益劳动表现<优秀-良好-未参加> */
    private String dicStatusKey;

    protected String culpritName;
    
    protected Workfree workfree;

    public Workfree getWorkfree() {
		return workfree;
	}

	public void setWorkfree(Workfree workfree) {
		this.workfree = workfree;
	}

	public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getWorkfreeId() {
        return workfreeId;
    }

    public void setWorkfreeId(String workfreeId) {
        this.workfreeId = workfreeId == null ? null : workfreeId.trim();
    }

    public String getDicStatusKey() {
        return dicStatusKey;
    }

    public void setDicStatusKey(String dicStatusKey) {
        this.dicStatusKey = dicStatusKey == null ? null : dicStatusKey.trim();
    }

	public String getCulpritName() {
		return culpritName;
	}

	public void setCulpritName(String culpritName) {
		this.culpritName = culpritName;
	}

 
}