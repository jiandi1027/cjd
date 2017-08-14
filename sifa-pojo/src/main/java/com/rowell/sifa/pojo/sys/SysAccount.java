/*
* SysAccount.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.sys;

import java.io.Serializable;
import java.util.Set;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   帐号表
* @Author marcle
* @version 1.0 2017-03-16
 */
public class SysAccount extends DataEntity<SysAccount> implements Serializable {
	
	public static final String ADMIN_ID="";
  

	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 8402937674642002432L;

	/**所在司法部门ID */
    private String groupId;

    /**角色id */
    private String roleId;

    /**登录帐号 */
    private String account;

    /**用户昵称 */
    private String accountname;

    /**密码 */
    private String password;

    /**手机号 */
    private String mobile;

    /**备注 */
    private String remark;

    /**区域 */
    private String area;

    /**数据字典账号类型 */
    private String dicImTypeKey;

    /**加密狗数据 */
    private String dogStr;

    /**手机权限字段 */
    private String permissionKey;
    
    /**personid */
    private String personId;
    /***
     * 盐
     */
    private String salt;
    

	protected Set<String> urlSet;
    protected Set<String> roles;
    protected String groupName;
    protected String roleName;
    
    
    

    public SysAccount() {
		super();
	}
    
    public SysAccount(String id) {
		super(id);
	}

	public String getPersonId() {
		return personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}


    public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

    public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getAccountname() {
        return accountname;
    }

    public void setAccountname(String accountname) {
        this.accountname = accountname == null ? null : accountname.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getDicImTypeKey() {
        return dicImTypeKey;
    }

    public void setDicImTypeKey(String dicImTypeKey) {
        this.dicImTypeKey = dicImTypeKey == null ? null : dicImTypeKey.trim();
    }

    public String getDogStr() {
        return dogStr;
    }

    public void setDogStr(String dogStr) {
        this.dogStr = dogStr == null ? null : dogStr.trim();
    }

    public String getPermissionKey() {
        return permissionKey;
    }

    public void setPermissionKey(String permissionKey) {
        this.permissionKey = permissionKey == null ? null : permissionKey.trim();
    }

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public Set<String> getUrlSet() {
		return urlSet;
	}

	public void setUrlSet(Set<String> urlSet) {
		this.urlSet = urlSet;
	}

	public Set<String> getRoles() {
		return roles;
	}

	public void setRoles(Set<String> roles) {
		this.roles = roles;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	public boolean isAdmin(){
		return isAdmin(this.id);
	}
	
	public static boolean isAdmin(String id){
		return id != null && "1595afe8373444f5a00575ec55207ffe".equals(id);
	}

   
}