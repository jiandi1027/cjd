/*
* DailyReportLastMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-04-09 created
*/
package com.rowell.sifa.mapper.dailymgr;


/***
 * 
    * @ClassName: DailyReportLastMapper  
    * @Description: 日常报到(最后一次)mapper 
    * @author xiaoguang  
    * @date 2017年4月12日  
    *
 */
public interface DailyReportLastMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.dailymgr.DailyReportLast> {
	/**
	 * 7天报到的人数
	 * @param culprit
	 * @return
	 */
	public int getNextReporCounttBy7Day();
}