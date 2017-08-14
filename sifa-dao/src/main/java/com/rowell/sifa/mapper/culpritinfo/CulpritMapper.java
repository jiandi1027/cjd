/*
* CulpritMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-01-16 created
*/
package com.rowell.sifa.mapper.culpritinfo;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rowell.common.pojo.EasyUITreeNode;
import com.rowell.sifa.pojo.culpritinfo.Culprit;

/***
 * 
    * @ClassName: CulpritMapper  
    * @Description: 矫正对象mapper  
    * @author xiaoguang  
    * @date 2017年1月16日  
    *
 */
public interface CulpritMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.culpritinfo.Culprit> {
	public Integer findNumByGroupId(@Param("groupId")String groupId);
	List<EasyUITreeNode> findNames();
	List<Culprit> findCulpritBySysAccount(String groupId);
	List<Map<String,String>> groupBySex(@Param("groupId") String groupId,@Param("dicStatusKey") String dicStatusKey,@Param("searchStartDate") Date searchStartDate,@Param("searchEndDate") Date searchEndDate);
	List<Map<String,String>> groupByAge(@Param("groupId") String groupId,@Param("dicStatusKey") String dicStatusKey,@Param("searchStartDate") Date searchStartDate,@Param("searchEndDate") Date searchEndDate);
	List<Map<String,String>> groupByPenalType(@Param("groupId") String groupId,@Param("dicStatusKey") String dicStatusKey,@Param("searchStartDate") Date searchStartDate,@Param("searchEndDate") Date searchEndDate);
	List<Map<String,String>> groupByHjlx(@Param("groupId") String groupId,@Param("dicStatusKey") String dicStatusKey,@Param("searchStartDate") Date searchStartDate,@Param("searchEndDate") Date searchEndDate);
	List<Map<String,String>> groupByCrimeType(@Param("groupId") String groupId,@Param("dicStatusKey") String dicStatusKey,@Param("searchStartDate") Date searchStartDate,@Param("searchEndDate") Date searchEndDate);
	List<Culprit> selectAllByGroupId(Culprit culprit);
	List<Culprit> selectAllWithTerminal(Culprit culprit);
	
	List<Culprit> findByGroupIdAndRandom(@Param("groupId")String groupId, @Param("amount")String amount, 
			@Param("checkStartTime")Date checkStartTime, @Param("checkEndTime")Date checkEndTime);
	public List<Culprit> selectAllSimple(Culprit culprit);
	
	/***
	 * 
	    * @Title: selectOnlyCulpritInfo  
	    * @Description: 查询仅返回矫正对象信息
	    * @param @param culprit
	    * @param @return    参数  
	    * @return List<Culprit>    返回类型  
	    * @throws
	 */
	public List<Culprit> selectOnlyCulpritInfo(Culprit culprit);
	
	/**
	 * 按年统计人员
	 * @param culprit
	 * @return
	 */
	public List<Culprit> statisticsCulpritByYear(Culprit culprit);
	
	/**
	 * 按月统计人员
	 * @param culprit
	 * @return
	 */
	public List<Map<String,Object>> statisticsCulpritByMonth(Culprit culprit);
	
	/**
	 * 按刑罚执行类别统计
	 * @return
	 */
	public List<Culprit> statisticsPenalType(Culprit culprit);
	
	/**
	 * 按犯罪类型统计
	 * @return
	 */
	public List<Culprit> statisticsCrimeType(Culprit culprit);
	
	/**
	 * 按户籍情况统计
	 * @return
	 */
	public List<Culprit> statisticsCulpritByHjqk(Culprit culprit);
	
	/**
	 * 按婚姻统计
	 * @return
	 */
	public List<Culprit> statisticsCulpritByHyzk(Culprit culprit);
	
	/**
	 * 按接收方式统计
	 * @return
	 */
	public List<Culprit> statisticsCulpritByJsfs(Culprit culprit);
	
	/**
	 * 按政治面貌统计
	 * @return
	 */
	public List<Culprit> statisticsCulpritByYzzmm(Culprit culprit);
	
	/**
	 * 按监管等级统计
	 * @return
	 */
	public List<Culprit> statisticsCulpritByMonitorGradeKey(Culprit culprit);
	
	/**
	 * 按性别统计
	 * @return
	 */
	public List<Culprit> statisticsCulpritBySex(Culprit culprit);
	
	/**
	 * 按文化程度统计
	 * @return
	 */
	public List<Culprit> statisticsCulpritByWhcd(Culprit culprit);
	
	/**
	 * 按地区统计
	 * @return
	 */
	public List<Culprit> statisticsCulpritByArea(Culprit culprit);
	
	/**
	 * 按矫正对象状态统计
	 * @return
	 */
	public List<Culprit> statisticsCulpritByStatus(Culprit culprit);
	
	/**
	 * 30天内需解矫人数
	 * @return
	 */
	public int getFinishCountBy30Day();
	
	/**
	 * 本月入矫人数
	 * @return
	 */
	public int getStartCountByThisMonth();
	
	/**
	 * 昨日入娇人数
	 * @return
	 */
	public int getStartCountByYesterday();
	
	/**
	 * 在矫人数
	 * @param culprit
	 * @return
	 */
	public int getCulpritByStatus(Culprit culprit);
	
	

}