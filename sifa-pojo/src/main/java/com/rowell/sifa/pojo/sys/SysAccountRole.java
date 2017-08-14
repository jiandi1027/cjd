  
    /**    
    * @Title: SysAccountRole.java  
    * @Package com.rowell.sifa.pojo.sys  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年4月4日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.pojo.sys;

import com.rowell.sifa.pojo.base.DataEntity;

/**  
    * @ClassName: SysAccountRole  
    * @Description: 账号角色中间表 
    * @author xiaoguang  
    * @date 2017年4月4日  
    *    
    */

public class SysAccountRole extends DataEntity<SysAccountRole> {
	  
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = -6540591353164906302L;
	/***账号id***/
	private String accountId;
	/**角色id***/
	private String roleId;
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
	
	

}
