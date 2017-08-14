/*
* SysAccountMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-01-16 created
*/
package com.rowell.sifa.mapper.sys;

import org.apache.ibatis.annotations.Param;

import com.rowell.sifa.pojo.sys.SysAccount;
/***
 * 
    * @ClassName: SysAccountMapper  
    * @Description: 帐号表mapper  
    * @author xiaoguang  
    * @date 2017年1月16日  
    *
 */
public interface SysAccountMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.sys.SysAccount> {

	  
	/***
	 * 
	    * @Title: selectByAccountAndPassword  
	    * @Description: 根据账号和密码查找用户
	    * @param @param account
	    * @param @param password
	    * @param @return    参数  
	    * @return SysAccount    返回类型  
	    * @throws
	 */
	public SysAccount selectByAccountAndPassword(@Param("account")String account,@Param("password")String password);
	/***
	 * 
	    * @Title: selectByAccount  
	    * @Description: 根据账号查找用户
	    * @param @param account
	    * @param @return    参数  
	    * @return SysAccount    返回类型  
	    * @throws
	 */
	public SysAccount selectByAccount(@Param("account")String account);

}