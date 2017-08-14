/*
* SysRolePermissionMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-01-16 created
*/
package com.rowell.sifa.mapper.sys;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;

import com.rowell.sifa.pojo.sys.SysAccountRole;

/**
 * 
 * @ClassName: SysAccountRoleMapper
 * @Description: 账号角色资源mapper
 * @author xiaoguang
 * @date 2017年1月16日
 *
 */
public interface SysAccountRoleMapper
		extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.sys.SysAccountRole> {
	/***
	 * 
	 * @Title: selectByAccountId @Description: 通过账号查询账号角色关联表 @param @param
	 * accountId @param @return 参数 @return List<SysAccountRole> 返回类型 @throws
	 */
	public List<SysAccountRole> selectByAccountId(@Param("accountId") String accountId);
	/****
	 * 
	    * @Title: selectRoleIdListByUserId  
	    * @Description:通过账号编号返回角色编号
	    * @param @param accountId
	    * @param @return    参数  
	    * @return List<String>    返回类型  
	    * @throws
	 */
	@Select("select role_id AS roleId from SYS_ACCOUNT_ROLE where account_id = #{accountId}")
	@ResultType(String.class)
	public List<String> selectRoleIdListByAccountId(@Param("accountId") String accountId);
}