  
    /**    
    * @Title: ProcessDetailService.java  
    * @Package com.rowell.sifa.service.flow  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年3月22日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.flow;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.service.base.CrudService;

/**  
    * @ClassName: ProcessDetailService  
    * @Description: 流程详情service 
    * @author xiaoguang  
    * @date 2017年3月22日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class ProcessDetailService extends CrudService<ProcessDetailMapper, ProcessDetail> {
	
	
	/***
	 * 
	    * @Title: findByProcessInsId  
	    * @Description: 根据流程实例编号查询流程详情
	    * @param @param processId
	    * @param @return    参数  
	    * @return List<ProcessDetail>    返回类型  
	    * @throws
	 */
	public List<ProcessDetail> findByProcessInsId(String processId){
		return dao.findByProcessInsId(processId);
	}

}
