/*
* ProcessDetailMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-18 created
*/
package com.rowell.sifa.mapper.statistics;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rowell.sifa.pojo.statistics.CulpritWorkTj;

public interface CulpritWorkTjMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.statistics.CulpritWorkTj> {
	List<Map<String, String>> getRybzCount(@Param("groupId") String groupId);
	public int getAllCulprits(@Param("groupId") String groupId);
	public int getAskLeave(@Param("groupId") String groupId,@Param("dicStatusKey") String dicStatusKey,@Param("startDate") Date startDate);
	public CulpritWorkTj selectByGroupId(@Param("groupId") String groupId,@Param("year") String year,@Param("jd") String jd);
}