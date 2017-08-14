/*
* SysRoleMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-01-16 created
*/
package com.rowell.sifa.mapper.sys;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rowell.sifa.pojo.sys.SysPermisson;
import com.rowell.sifa.pojo.sys.SysRole;

/***
 * 
 * @ClassName: SysRoleMapper
 * @Description: 系统角色mapper
 * @author xiaoguang
 * @date 2017年1月16日
 *
 */
public interface SysRoleMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.sys.SysRole> {

	/**
	 * @Title: selectUserRole @Description: TODO(这里用一句话描述这个方法的作用) @param @param
	 * sysRole @param @return 参数 @return Object 返回类型 @throws
	 */

	Object selectUserRole(SysRole sysRole);

	public List<String> selectPermissionIdListByRoleId(@Param("id") String id);
	/***
	 * 
	    * @Title: selectPermissionMenuListByRoleId  
	    * @Description: 根据角色id查询菜单资源
	    * @param @param id
	    * @param @return    参数  
	    * @return List<SysPermisson>    返回类型  
	    * @throws
	 */
	public List<SysPermisson> selectPermissionMenuListByRoleId(@Param("id")String id);

	public List<SysPermisson> selectPermissionListByRoleIdList(@Param("list") List<String> list);

	public List<Map<String, String>> selectPermissionListByRoleId(@Param("id") String id);
	

}