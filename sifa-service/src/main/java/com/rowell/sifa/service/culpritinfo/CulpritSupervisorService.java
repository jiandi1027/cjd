  
    /**    
    * @Title: CulpritLawService.java  
    * @Package com.rowell.sifa.service.culpritinfo  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.culpritinfo;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.culpritinfo.CulpritLawMapper;
import com.rowell.sifa.mapper.culpritinfo.CulpritSupervisorMapper;
import com.rowell.sifa.pojo.culpritinfo.CulpritLaw;
import com.rowell.sifa.pojo.culpritinfo.CulpritSupervisor;
import com.rowell.sifa.service.base.CrudService;

/**  
    * @ClassName: CulpritLawService  
    * @Description: 依据的法律文书相关信息service  
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class CulpritSupervisorService extends CrudService<CulpritSupervisorMapper, CulpritSupervisor> {

}
