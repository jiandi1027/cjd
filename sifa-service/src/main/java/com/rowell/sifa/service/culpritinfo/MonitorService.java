  
    /**    
    * @Title: MoveInService.java  
    * @Package com.rowell.sifa.service.inculprit  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.culpritinfo;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.culpritinfo.MonitorMapper;
import com.rowell.sifa.pojo.culpritinfo.Monitor;
import com.rowell.sifa.service.base.CrudService;

/**  
    * @ClassName: MoveInService  
    * @Description: 迁入service 
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class MonitorService extends CrudService<MonitorMapper, Monitor> {
	
}