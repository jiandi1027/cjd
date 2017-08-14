/*
* ProcessDetailMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-18 created
*/
package com.rowell.sifa.mapper.flow;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rowell.sifa.pojo.flow.ProcessDetail;

public interface ProcessDetailMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.flow.ProcessDetail> {
	/***
	 * 
	    * @Title: findByProcessInsId  
	    * @Description: 根据流程实例编号查询流程详情
	    * @param @param processId
	    * @param @return    参数  
	    * @return List<ProcessDetail>    返回类型  
	    * @throws
	 */
	public List<ProcessDetail> findByProcessInsId(@Param("processId")String processId);
}