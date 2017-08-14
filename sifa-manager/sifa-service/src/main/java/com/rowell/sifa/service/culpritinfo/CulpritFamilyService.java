  
    /**    
    * @Title: CulpritFamilyService.java  
    * @Package com.rowell.sifa.service.culpritinfo  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.culpritinfo;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.culpritinfo.CulpritFamilyMapper;
import com.rowell.sifa.pojo.culpritinfo.CulpritFamily;
import com.rowell.sifa.service.base.CrudService;

/**  
    * @ClassName: CulpritFamilyService  
    * @Description: 矫正对象家庭成员和社会关系service  
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class CulpritFamilyService extends CrudService<CulpritFamilyMapper, CulpritFamily> {

}
