  
    /**    
    * @Title: EchartsJsonResult.java  
    * @Package com.pango.common.pojo  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年6月26日  
    * @version V1.0    
    */  
    
package com.rowell.common.pojo.echarts;

import java.util.List;
import java.util.Map;

/**  
    * @ClassName: EchartsJsonResult  
    * @Description: Echarts公用pojo类
    * @author xiaoguang  
    * @date 2017年6月26日  
    *    
    */

public abstract class EchartsJsonResult<T> {
	private List<String> categories;
	private List<T> data0;
	private List<T> data1;
	private List<T> data2;
	private List<T> data3;
	private Integer total;
	public List<String> getCategories() {
		return categories;
	}
	public void setCategories(List<String> categories) {
		this.categories = categories;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	
	public List<T> getData0() {
		return data0;
	}
	public void setData0(List<T> data0) {
		this.data0 = data0;
	}
	public List<T> getData1() {
		return data1;
	}
	public void setData1(List<T> data1) {
		this.data1 = data1;
	}
	public List<T> getData2() {
		return data2;
	}
	public void setData2(List<T> data2) {
		this.data2 = data2;
	}
	public List<T> getData3() {
		return data3;
	}
	public void setData3(List<T> data3) {
		this.data3 = data3;
	}
	@SuppressWarnings("unchecked")
	public abstract void fillEchartsJsonResultData(EchartsJsonResult<T> echartsJsonResult,List<Map<String, Object>> ... results);
	
	public void setData(EchartsJsonResult<T> echartsJsonResult,List<T> datas,int i){
		switch(i){
		case 0:
			echartsJsonResult.setData0(datas);
			break;
		case 1:
			echartsJsonResult.setData1(datas);
			break;
		case 2:
			echartsJsonResult.setData2(datas);
			break;
		case 3:
			echartsJsonResult.setData3(datas);
			break;
		}
	}
	
	

}
