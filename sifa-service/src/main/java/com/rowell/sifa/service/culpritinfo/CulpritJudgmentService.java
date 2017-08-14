  
    /**    
    * @Title: CulpritJudgmentService.java  
    * @Package com.rowell.sifa.service.culpritinfo  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.culpritinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.culpritinfo.CulpritJudgmentMapper;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.service.base.CrudService;

/**  
    * @ClassName: CulpritJudgmentService  
    * @Description: 具体判决信息service  
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class CulpritJudgmentService extends CrudService<CulpritJudgmentMapper, CulpritJudgment> {
	@Autowired
	CulpritJudgmentMapper culpritJudgmentMapper;

	    
	public CulpritJudgment findByCulpritId(String culpritId) {
		// TODO Auto-generated method stub
		return culpritJudgmentMapper.findByCulpritId(culpritId);
	}
	

}
