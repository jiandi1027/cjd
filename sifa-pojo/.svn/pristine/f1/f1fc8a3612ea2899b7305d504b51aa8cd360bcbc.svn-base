/*
* BehaviorManage.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-18 created
*/
package com.rowell.sifa.pojo.flow;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   行为管理
* @Author marcle
* @version 1.0 2017-03-18
 */
public class BehaviorManage extends DataEntity<BehaviorManage> implements Serializable {
 
      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 762385121903371262L;

	/**数据字典行为处理类型 */
    private String dicBehManTypeKey;

    /**流程id */
    private String processId;

    /**审批对象id */
    private String checkId;

    /**矫正对象id */
    private String culpritId;
    
    /**是否结束 */
    private Integer isEnd;
  

    public String getDicBehManTypeKey() {
        return dicBehManTypeKey;
    }

    public void setDicBehManTypeKey(String dicBehManTypeKey) {
        this.dicBehManTypeKey = dicBehManTypeKey == null ? null : dicBehManTypeKey.trim();
    }

    public String getProcessId() {
        return processId;
    }

    public void setProcessId(String processId) {
        this.processId = processId == null ? null : processId.trim();
    }

	public String getCheckId() {
		return checkId;
	}

	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}

	public String getCulpritId() {
		return culpritId;
	}

	public void setCulpritId(String culpritId) {
		this.culpritId = culpritId;
	}

	public Integer getIsEnd() {
		return isEnd;
	}

	public void setIsEnd(Integer isEnd) {
		this.isEnd = isEnd;
	}

   
}