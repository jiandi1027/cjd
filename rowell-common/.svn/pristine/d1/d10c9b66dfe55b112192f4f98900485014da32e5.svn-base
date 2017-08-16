  
    /**    
    * @Title: PieEchartsJsonResult.java  
    * @Package com.pango.common.pojo.echarts  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年6月26日  
    * @version V1.0    
    */  
    
package com.rowell.common.pojo.echarts;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**  
    * @ClassName: PieEchartsJsonResult  
    * @Description: TODO(这里用一句话描述这个类的作用)  
    * @author xiaoguang  
    * @date 2017年6月26日  
    *    
    */

public class PieEchartsJsonResult extends EchartsJsonResult<Map<String, Object>> {
	

	  
	    /* (非 Javadoc)  
	    *   
	    *   
	    * @param results
	    * @return  
	    * @see com.pango.common.pojo.echarts.EchartsJsonResult#fillEchartsJsonResultData(java.util.List)  
	    */  
	    
	@SuppressWarnings("unchecked")
	@Override
	public  void fillEchartsJsonResultData(EchartsJsonResult<Map<String, Object>> echartsJsonResult,List<Map<String, Object>> ... results) {
		List<String> categories = new ArrayList<String>();
		List<Map<String,Object>> datas=null;
		
		Integer i=0;
		Integer total = 0;
		for(List<Map<String, Object>> dataTemp:results){
			
			datas = new ArrayList<Map<String,Object>>();
			for(Map<String,Object> result:dataTemp){
				categories.add(result.get("LABEL").toString());
				try {
					Integer count = Integer.parseInt(result.get("COUNT").toString());
					Map<String,Object> data = new HashMap<String,Object>();
					data.put("name", result.get("LABEL"));
					data.put("value", result.get("COUNT"));
					datas.add(data);
					total+=count;
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					total+=0;
				}
			}
			this.setData(echartsJsonResult, datas, i);
			i++;
		}
		
		
		echartsJsonResult.setCategories(categories);
		
		echartsJsonResult.setTotal(total);
	}
	

}
