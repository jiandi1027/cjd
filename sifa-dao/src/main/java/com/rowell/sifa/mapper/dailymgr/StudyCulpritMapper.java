/*
* StudyCulpritMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-17 created
*/
package com.rowell.sifa.mapper.dailymgr;

/***
 * 
    * @ClassName: StudyCulpritMapper  
    * @Description: 集中学习与对象的关联mapper  
    * @author xiaoguang  
    * @date 2017年4月12日  
    *
 */
public interface StudyCulpritMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.dailymgr.StudyCulprit> {
	
	int deleteByGroupstudyId(String groupstudyId);
}