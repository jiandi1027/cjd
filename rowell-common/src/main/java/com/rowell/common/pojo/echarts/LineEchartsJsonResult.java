  
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
import java.util.List;
import java.util.Map;

/**  
    * @ClassName: PieEchartsJsonResult  
    * @Description: TODO(这里用一句话描述这个类的作用)  
    * @author xiaoguang  
    * @date 2017年6月26日  
    *    
    */

public class LineEchartsJsonResult extends EchartsJsonResult<Integer> {
	    /* (非 Javadoc)  
	    *   
	    *   
	    * @param results
	    * @return  
	    * @see com.pango.common.pojo.echarts.EchartsJsonResult#fillEchartsJsonResultData(java.util.List)  
	    */  
	    
	@SuppressWarnings("unchecked")
	@Override
	public  void fillEchartsJsonResultData(EchartsJsonResult<Integer> echartsJsonResult,List<Map<String, Object>> ...results) {
		List<String> categories = new ArrayList<String>();
		List<Integer> datas = new ArrayList<Integer>();
		Integer total = 0;
		int i=0;
		for(List<Map<String, Object>> dataTemp:results){
			for(Map<String,Object> result:dataTemp){
				categories.add(result.get("LABEL").toString());
				try {
					Integer count = Integer.parseInt(result.get("COUNT").toString());
					
					datas.add(count);
					total+=count;
				} catch (NumberFormatException e) {
					e.printStackTrace();
					total+=0;
					datas.add(0);
				}
			}
			this.setData(echartsJsonResult, datas, i);
			i++;
		}
		
		
		echartsJsonResult.setCategories(categories);
		echartsJsonResult.setTotal(total);
	}
	

}
