package com.rowell.sifa.mapper.endcorrect;

import com.rowell.common.mapper.CrudDao;
import com.rowell.sifa.pojo.endcorrect.OutOf;

/**  
    * @ClassName: OutOfMapper  
    * @Description: 迁出管理Dao  
    * @author Administrator  
    * @date 2017年3月16日  
    *    
    */

public interface OutOfMapper extends CrudDao<OutOf>{
	
	public int getCount(OutOf outOf);

}
