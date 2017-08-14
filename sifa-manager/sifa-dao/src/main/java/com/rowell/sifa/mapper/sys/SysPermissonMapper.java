/*
* SysPermissonMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-01-16 created
*/
package com.rowell.sifa.mapper.sys;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rowell.sifa.pojo.sys.SysPermisson;

/***
 * 
    * @ClassName: SysPermissonMapper  
    * @Description:  资源操作权限mapper
    * @author xiaoguang  
    * @date 2017年1月16日  
    *
 */
public interface SysPermissonMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.sys.SysPermisson> {
	/***
	 * 
	    * @Title: selectPermissionListByUserId  
	    * @Description: 通过用户编号查找菜单权限
	    * @param @param userId
	    * @param @return    参数  
	    * @return List<SysPermission>    返回类型  
	    * @throws
	 */
	public List<SysPermisson> selectPermissionMenusByUserId(@Param("userId")String userId);
	/***
	 * 
	    * @Title: updateParentIds  
	    * @Description: 更新父资源 
	    * @param @param sysPermisson    参数  
	    * @return void    返回类型  
	    * @throws
	 */
	public void updateParentIds(SysPermisson sysPermisson);

	/***
	 * 
	    * @Title: selectPermissionOperationByUserId  
	    * @Description: 获取操作权限
	    * @param @param userId
	    * @param @return    参数  
	    * @return List<String>    返回类型  
	    * @throws
	 */
	public List<String> selectPermissionOperationByUserId(@Param("userId")String userId);
	/***
	 * 
	    * @Title: getCountByParentId  
	    * @Description: 获取子菜单数量 
	    * @param @param parentId
	    * @param @return    参数  
	    * @return Integer    返回类型  
	    * @throws
	 */
	public Integer getCountByParentId(@Param("parentId")String parentId);
	
	/***
	 * 
	    * @Title: findByParentIdsLike  
	    * @Description: 获取父资源
	    * @param @param sysPermisson
	    * @param @return    参数  
	    * @return List<SysPermisson>    返回类型  
	    * @throws
	 */
	public List<SysPermisson> findByParentIdsLike(SysPermisson sysPermisson);
	  
	    /**  
	    * @Title: findByUrl  
	    * @Description: 根据路径查找资源
	    * @param @param href
	    * @param @return    参数  
	    * @return SysPermisson    返回类型  
	    * @throws  
	    */  
	    
	public SysPermisson findByUrl(String href);
}