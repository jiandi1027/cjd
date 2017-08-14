  
    /**    
    * @Title: SysPersonService.java  
    * @Package com.rowell.sifa.service.sys  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.sys;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.sys.SysPersonMapper;
import com.rowell.sifa.pojo.sys.SysPerson;
import com.rowell.sifa.service.base.CrudService;

/**  
    * @ClassName: SysPersonService  
    * @Description: 工作人员service  
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class SysPersonService extends CrudService<SysPersonMapper, SysPerson> {
	
	public List<SysPerson> findSfsPerson(String type){
		List<SysPerson> list = new ArrayList<SysPerson>();
		
		SysPerson sysPerson = new SysPerson();
		sysPerson.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		
		String[] typeStr = type.split(",");
		for (int i = 0; i < typeStr.length; i++) {
			sysPerson.setDicRybzKey(typeStr[i]);
			List<SysPerson> personlist = dao.findPersonByType(sysPerson);
			list.addAll(personlist);
		}
		
		return list;
	}
	
}
