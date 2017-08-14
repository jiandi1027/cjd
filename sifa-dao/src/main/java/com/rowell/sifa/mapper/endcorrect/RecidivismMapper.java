/*
* RecidivismMapper.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.mapper.endcorrect;

import com.rowell.sifa.pojo.endcorrect.Recidivism;

/***
 * 
    * @ClassName: RecidivismMapper  
    * @Description: 重新犯罪mapper  
    * @author xiaoguang  
    * @date 2017年3月16日  
    *
 */
public interface RecidivismMapper extends com.rowell.common.mapper.CrudDao<com.rowell.sifa.pojo.endcorrect.Recidivism> {
	public int getCount(Recidivism recidivism);
}