/*
* Culprit.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.culpritinfo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.rowell.sifa.pojo.base.DataEntity;
import com.rowell.sifa.pojo.base.ProcessEntity;
import com.rowell.sifa.pojo.sys.SysGroup;

/**
 *   矫正小组及监管人员
* @Author marcle
* @version 1.0 2017-03-16
 */
@JsonInclude(Include.NON_NULL) 
public class CulpritSupervisor extends DataEntity<CulpritSupervisor> implements Serializable {

	  
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 1L;
	
	/**矫正人员id**/
	private String culpritId;
	/*工作人员id*/
	private String accountId;
	/*协管员id*/
	private String assistantId;
	/*工作人员名字*/
	private String accountName;
	/*协管员名字*/
	private String assistantName;
	
	/**矫正小组组长为司法所工作人员*/
	private String adjustMasterId;
	
	/**矫正小组组长*/
	private String adjustMasterName;
	
	/**矫正小组组员,中间以，隔开*/
	private String adjustorName;
	
	
	public String getAdjustMasterId() {
		return adjustMasterId;
	}
	public void setAdjustMasterId(String adjustMasterId) {
		this.adjustMasterId = adjustMasterId;
	}
	public String getAdjustMasterName() {
		return adjustMasterName;
	}
	public void setAdjustMasterName(String adjustMasterName) {
		this.adjustMasterName = adjustMasterName;
	}
	public String getAdjustorName() {
		return adjustorName;
	}
	public void setAdjustorName(String adjustorName) {
		this.adjustorName = adjustorName;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getAssistantName() {
		return assistantName;
	}
	public void setAssistantName(String assistantName) {
		this.assistantName = assistantName;
	}
	public String getCulpritId() {
		return culpritId;
	}
	public void setCulpritId(String culpritId) {
		this.culpritId = culpritId;
	}
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getAssistantId() {
		return assistantId;
	}
	public void setAssistantId(String assistantId) {
		this.assistantId = assistantId;
	}
	
}