/*
* QxjbMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-07-25 created
*/
package com.rowell.sifa.mapper.sys;

import java.util.List;

import com.rowell.sifa.pojo.sys.Qxjb;


public interface QxjbMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.sys.Qxjb> 
{
	
	String findMax();
	List<Qxjb> findLast();
	void updatejihao(String jihao);
	void deletejihao(String jihao);
}