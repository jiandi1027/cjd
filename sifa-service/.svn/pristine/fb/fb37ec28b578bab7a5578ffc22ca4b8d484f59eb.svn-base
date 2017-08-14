  
    /**    
    * @Title: SysDicUtil.java  
    * @Package com.rowell.sifa.sys.utils  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年3月24日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.sys.utils;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.rowell.sifa.common.utils.CacheUtils;
import com.rowell.sifa.common.utils.SpringContextHolder;
import com.rowell.sifa.mapper.sys.AreaMapper;
import com.rowell.sifa.mapper.sys.SysDicMapper;
import com.rowell.sifa.pojo.sys.Area;
import com.rowell.sifa.pojo.sys.SysDic;

/**  
    * @ClassName: SysDicUtil  
    * @Description: 数据字典工具类
    * @author xiaoguang  
    * @date 2017年3月24日  
    *    
    */

public class SysDicUtils {
	

	public static final String CACHE_DICT_MAP = "dictMap";
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
	public static String getSysDicValueByKey(String tabName,String columnName,String key,String defaultValue){
		if(StringUtils.isBlank(key)){
			return defaultValue;
		}
		List<SysDic> dictList = getSysDicList(tabName,columnName,"");
		
		if(dictList!=null){
			for(SysDic sysDic:dictList){
				if (tabName.equals(sysDic.getTabName()) && columnName.equals(sysDic.getColumnName())&&key.equals(sysDic.getKey())){
					return sysDic.getValue();
				}
			}
		}
		return defaultValue;
	}
	
	/****
	 * 
	    * @Title: getDicValue  
	    * @Description: 根据表名 列名数据字典值查找关键字
	    * @param @param tabName
	    * @param @param columnName
	    * @param @param value
	    * @param @return    参数  
	    * @return SysDic    返回类型  
	    * @throws
	 */
	public static String getSysDicKeyByValue(String tabName,String columnName,String key,String defaultValue){
		if(StringUtils.isBlank(key)){
			return defaultValue;
		}
		List<SysDic> dictList = getSysDicList(tabName,columnName,"");
		
		if(dictList!=null){
			for(SysDic sysDic:dictList){
				if (tabName.equals(sysDic.getTabName()) && columnName.equals(sysDic.getColumnName())&&key.equals(sysDic.getKey())){
					return sysDic.getValue();
				}
			}
		}
		return defaultValue;
		
	}
	
	/***
	 * 
	    * @Title: getSysDicList  
	    * @Description: 根据表名和列名获取数据字典
	    * @param @param tabName 表命
	    * @param @param columnName 列名
	    * @param @return    参数  
	    * @return List<SysDic>    返回类型  
	    * @throws
	 */
	public static List<SysDic> getSysDicList(String tabName,String columnName,String parentKey){
		
		@SuppressWarnings("unchecked")
		Map<String, List<SysDic>> dictMap = (Map<String, List<SysDic>>)CacheUtils.get(CACHE_DICT_MAP);
		if (dictMap==null){
			dictMap = Maps.newHashMap();
			SysDic sysDicTemp = new SysDic();
			sysDicTemp.setOrderStr(" TAB_NAME DESC,COLUMN_NAME DESC,DIC_SORT ASC");
			List<SysDic> sysDics = SpringContextHolder.getApplicationContext().getBean(SysDicMapper.class).selectAll(sysDicTemp);
			for (SysDic dict : sysDics){
				
				if(!StringUtils.isBlank(dict.getTabName())&&!StringUtils.isBlank(dict.getColumnName())){
					List<SysDic> dictList = dictMap.get(dict.getTabName()+"_"+dict.getColumnName());
					if (dictList != null){
						dictList.add(dict);
					}else{
//						if(dict.getId().equals(parentKey)){
//							continue;
//						}
						dictMap.put(dict.getTabName()+"_"+dict.getColumnName(), Lists.newArrayList(dict));
					}
				}
				
			}
			CacheUtils.put(CACHE_DICT_MAP, dictMap);
		}
		List<SysDic> dictList = dictMap.get(tabName+"_"+columnName);
		if (dictList == null){
			dictList = Lists.newArrayList();
		}else{
			if(!StringUtils.isBlank(parentKey)){
				dictList.remove(new SysDic(parentKey));
			}
			
		}
		
		return dictList;
	}
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
	public static String getAreaValueById(String id,String defaultValue){
		if(StringUtils.isBlank(id)){
			return defaultValue;
		}
		Area area = SpringContextHolder.getApplicationContext().getBean(AreaMapper.class).selectByPrimaryKey(id);
		if(area!=null){
			return area.getAreaName();
		}else{
			return defaultValue;
		}
	}

}
