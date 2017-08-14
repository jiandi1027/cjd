/*
* SysLog.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2016-05-28 created
*/
package com.rowell.sifa.pojo.sys;

import java.io.Serializable;
import java.util.Map;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   系统日志
* @Author marcle
* @version 1.0 2016-05-28
 */
@SuppressWarnings("serial")
public class SysLog extends DataEntity<SysLog> implements Serializable {
 

    /**日志类型 */
    private String type;

    /**日志标题 */
    private String title;



    /**操作IP地址 */
    private String remoteAddr;

    /**请求地址 */
    private String requestUri;

    /**请求方法 */
    private String method;

    /**用户代理 */
    private String userAgent;

    /**参数 */
    private String params;

    /**异常 */
    private String exception;
    

	
	// 日志类型（1：访问日志；2：错误日志;3:短信）
	public static final String TYPE_ACCESS = "1";
	
	public static final String TYPE_EXCEPTION = "2";
	public static final String TYPE_MESSAGE = "3";

  

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

   
    public String getRemoteAddr() {
        return remoteAddr;
    }

    public void setRemoteAddr(String remoteAddr) {
        this.remoteAddr = remoteAddr == null ? null : remoteAddr.trim();
    }

    public String getRequestUri() {
        return requestUri;
    }

    public void setRequestUri(String requestUri) {
        this.requestUri = requestUri == null ? null : requestUri.trim();
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method == null ? null : method.trim();
    }

    public String getUserAgent() {
        return userAgent;
    }

    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent == null ? null : userAgent.trim();
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params == null ? null : params.trim();
    }

    public String getException() {
        return exception;
    }

    public void setException(String exception) {
        this.exception = exception == null ? null : exception.trim();
    }
    
    /**
	 * 设置请求参数
	 * @param paramMap
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void setParams(Map paramMap){
		if (paramMap == null){
			return;
		}
		StringBuilder params = new StringBuilder();
		for (Map.Entry<String, String[]> param : ((Map<String, String[]>)paramMap).entrySet()){
			params.append(("".equals(params.toString()) ? "" : "&") + param.getKey() + "=");
			String paramValue = (param.getValue() != null && param.getValue().length > 0 ? param.getValue()[0] : "");
			params.append(StringUtils.abbr(StringUtils.endsWithIgnoreCase(param.getKey(), "password") ? "" : paramValue, 100));
		}
		this.params = params.toString();
	}
	
	@Override
	public String toString() {
		return ReflectionToStringBuilder.toString(this);
	}

	
	
	
}