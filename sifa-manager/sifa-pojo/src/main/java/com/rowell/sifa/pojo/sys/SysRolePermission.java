/*
* SysRolePermission.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.sys;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   角色所能操作的资源权限
* @Author marcle
* @version 1.0 2017-03-16
 */
public class SysRolePermission extends DataEntity<SysRolePermission> implements Serializable {
  

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = -6338425293470681779L;

	/**资源id */
    private String permissionId;

    /**角色id */
    private String roleId;

   

    public String getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(String permissionId) {
        this.permissionId = permissionId == null ? null : permissionId.trim();
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

   
}