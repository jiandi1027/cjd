  
    /**    
    * @Title: CulpritResumeService.java  
    * @Package com.rowell.sifa.service.culpritinfo  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.culpritinfo;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.culpritinfo.CulpritResumeMapper;
import com.rowell.sifa.pojo.culpritinfo.CulpritResume;
import com.rowell.sifa.service.base.CrudService;

/**  
    * @ClassName: CulpritResumeService  
    * @Description:  个人简历service 
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class CulpritResumeService extends CrudService<CulpritResumeMapper, CulpritResume> {

}
