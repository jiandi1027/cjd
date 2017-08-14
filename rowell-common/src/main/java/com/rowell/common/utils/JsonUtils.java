package com.rowell.common.utils;

import java.util.List;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
/***
 * json工具类
 * @author xiaoguang
 *
 * @param <T>
 */
public class JsonUtils<T> {
	/***
	 * 获取对应的属性下面的json转换为对应的类型
	 * @param json
	 * @param property
	 * @return
	 */
	public  List<T> parseJsonList(String json,String property){
		 Gson gson = new Gson();
		if(!StringUtils.isBlank(property)){
			JsonParser parser = new JsonParser();  
			
	        JsonElement jsonEl = parser.parse(json);  
	        JsonObject jsonObj = null;  
	        jsonObj = jsonEl.getAsJsonObject();//转换成Json对象
	        JsonElement personJson = jsonObj.get("person");
	        
	       
	        List<T> casePersons = gson.fromJson(personJson, new TypeToken<List<T>>(){}.getType());
	        return casePersons;
		}else{
			return gson.fromJson(json, new TypeToken<List<T>>(){}.getType());
		}
		
	}
	/***
	 * 将json转换为对象列表
	 * @param json
	 * @return
	 */
	public  List<T> parseJsonList(String json){
		return parseJsonList(json,null);
	}
	/***
	 * 将接送转换为对象
	 * @param json
	 * @return
	 */
	public T parseJon(String json){
		 Gson gson = new Gson();
		 Class<T> t = Reflections.getClassGenricType(JsonUtils.class);
		 return gson.fromJson(json, t);
	}
	
	

}
