package com.rowell.common.pojo;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 盘古自定义响应结构
 */
public class CommonJsonResult {
	 // 定义jackson对象
    private static final ObjectMapper MAPPER = new ObjectMapper();

    // 响应业务状态
    private Integer status;

    // 响应消息
    private String msg;

    // 响应中的数据
    private Object data;
    
    private Boolean success = false;// 是否成功
    private Boolean isError = false;

    public static CommonJsonResult build(Integer status, String msg, Object data) {
        return new CommonJsonResult(status, msg,false,data);
    }

    public static CommonJsonResult ok(Object data) {
        return new CommonJsonResult(data);
    }

    public static CommonJsonResult ok() {
        return new CommonJsonResult(null);
    }

    public CommonJsonResult() {

    }
    public static CommonJsonResult build(Integer status, String msg){
    	return new CommonJsonResult(status, msg, false,null);
    }
    public static CommonJsonResult build(Integer status, String msg,Boolean isError) {
        return new CommonJsonResult(status, msg, isError,null);
    }

    public CommonJsonResult(Integer status, String msg, Boolean isError,Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
        this.isError=isError;
        this.success=!isError;
    }
    

    public CommonJsonResult(Object data) {
        this.status = 200;
        this.msg = "OK";
        this.success=true;
        this.data = data;
    }

//    public Boolean isOK() {
//        return this.status == 200;
//    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    /**
     * 将json结果集转化为CommonJsonResult对象
     * 
     * @param jsonData json数据
     * @param clazz CommonJsonResult中的object类型
     * @return
     */
    public static CommonJsonResult formatToPojo(String jsonData, Class<?> clazz) {
        try {
            if (clazz == null) {
                return MAPPER.readValue(jsonData, CommonJsonResult.class);
            }
            JsonNode jsonNode = MAPPER.readTree(jsonData);
            JsonNode data = jsonNode.get("data");
            Object obj = null;
            if (clazz != null) {
                if (data.isObject()) {
                    obj = MAPPER.readValue(data.traverse(), clazz);
                } else if (data.isTextual()) {
                    obj = MAPPER.readValue(data.asText(), clazz);
                }
            }
            return build(jsonNode.get("status").intValue(), jsonNode.get("msg").asText(), obj);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 没有object对象的转化
     * 
     * @param json
     * @return
     */
    public static CommonJsonResult format(String json) {
        try {
            return MAPPER.readValue(json, CommonJsonResult.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Object是集合转化
     * 
     * @param jsonData json数据
     * @param clazz 集合中的类型
     * @return
     */
    public static CommonJsonResult formatToList(String jsonData, Class<?> clazz) {
        try {
            JsonNode jsonNode = MAPPER.readTree(jsonData);
            JsonNode data = jsonNode.get("data");
            Object obj = null;
            if (data.isArray() && data.size() > 0) {
                obj = MAPPER.readValue(data.traverse(),
                        MAPPER.getTypeFactory().constructCollectionType(List.class, clazz));
            }
            return build(jsonNode.get("status").intValue(), jsonNode.get("msg").asText(), obj);
        } catch (Exception e) {
            return null;
        }
    }

	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public Boolean getIsError() {
		return isError;
	}

	public void setIsError(Boolean isError) {
		this.isError = isError;
	}

	
	
    
}
