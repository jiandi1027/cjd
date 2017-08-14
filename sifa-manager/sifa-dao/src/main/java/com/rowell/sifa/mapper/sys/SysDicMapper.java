/*
* SysDicMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-01-16 created
*/
package com.rowell.sifa.mapper.sys;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rowell.sifa.pojo.sys.SysDic;

/***
 * 
    * @ClassName: SysDicMapper  
    * @Description: 数据字典mapper 
    * @author xiaoguang  
    * @date 2017年1月16日  
    *
 */
public interface SysDicMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.sys.SysDic> {
	/****
	 * 
	    * @Title: getDicValue  
	    * @Description: 根据表名 列名关键字查找数据字典值 
	    * @param @param tabName
	    * @param @param columnName
	    * @param @param key
	    * @param @return    参数  
	    * @return SysDic    返回类型  
	    * @throws
	 */
	public SysDic getDicValue(@Param("tabName")String tabName,@Param("columnName")String columnName,@Param("key")String key);

	/****
	 * 
	    * @Title: getDicValue  
	    * @Description: 根据表名 列名关键字查找数据字典值 
	    * @param @param tabName
	    * @param @param columnName
	    * @param @param key
	    * @param @return    参数  
	    * @return SysDic    返回类型  
	    * @throws
	 */
	public SysDic getDicKey(@Param("tabName")String tabName,@Param("columnName")String columnName,@Param("value")String value);
	
	
	/****
	 * 
	    * @Title: getDicValue  
	    * @Description: 根据表名 列名字查找数据字典值 
	    * @param @param tabName
	    * @param @param columnName
	    * @param @param key
	    * @param @return    参数  
	    * @return SysDic    返回类型  
	    * @throws
	 */
	public List<SysDic> getDicListByTabColumnName(@Param("tabName")String tabName,@Param("columnName")String columnName,@Param("parentKey")String parentKey);
}