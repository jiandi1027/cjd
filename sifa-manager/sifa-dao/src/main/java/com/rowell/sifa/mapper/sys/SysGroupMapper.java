/*
* SysGroupMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-01-16 created
*/
package com.rowell.sifa.mapper.sys;

import java.util.List;

import com.rowell.sifa.pojo.sys.SysGroup;

/***
 * 
    * @ClassName: SysGroupMapper  
    * @Description:  组织表mapper  
    * @author xiaoguang  
    * @date 2017年1月16日  
    *
 */
public interface SysGroupMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.sys.SysGroup> {

	List<SysGroup> findSfsGroup(String id);
	
	List<SysGroup> findAllElseDefault(String groupId);
	/***
	 * 
	    * @Title: selectAllChildrenByPid  
	    * @Description: 通过组织编号查询所有子组织 编号 
	    * @param @param id 组织编号
	    * @param @return    参数  
	    * @return List<String>    返回类型  
	    * @throws
	 */
	public List<String> selectAllChildrenByPidWithIds(String id);
	
	/***
	 * 
	    * @Title: selectAllChildrenByPid  
	    * @Description: 通过组织编号查询所有子组织 
	    * @param @param id 组织编号
	    * @param @return    参数  
	    * @return List<String>    返回类型  
	    * @throws
	 */
	public List<SysGroup> selectAllChildrenByPid(String id);
	/***
	 * 
	    * @Title: selectAllChildrenByPidNotSelf  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  
	    * @param @param id
	    * @param @return    参数  
	    * @return List<SysGroup>    返回类型  
	    * @throws
	 */
	public List<SysGroup> selectAllChildrenByPidNotSelf(String id);
}