  
    /**    
    * @Title: SysUtils.java  
    * @Package com.rowell.sifa.sys.utils  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年5月4日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.sys.utils;

import java.util.List;

import com.rowell.sifa.common.utils.SpringContextHolder;
import com.rowell.sifa.mapper.sys.SysGroupMapper;
import com.rowell.sifa.pojo.sys.SysGroup;

/**  
    * @ClassName: SysUtils  
    * @Description: 系统工具类
    * @author xiaoguang  
    * @date 2017年5月4日  
    *    
    */

public class SysUtils {
	
	private static SysGroupMapper sysGroupMapper = SpringContextHolder.getBean(SysGroupMapper.class);
	
	public static Boolean isLeafGroup(String currentGroupId){
		List<SysGroup> sysGroups = sysGroupMapper.selectAllChildrenByPidNotSelf(currentGroupId);
		if(sysGroups==null || sysGroups.size()==0){
			return true;
		}else{
			return false;
		}
		
	}

}
