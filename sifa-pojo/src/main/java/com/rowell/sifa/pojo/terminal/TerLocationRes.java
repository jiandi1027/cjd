package com.rowell.sifa.pojo.terminal;

import java.io.Serializable;

/**
 * 定位响应实体
 * Created by pkx on 2017-7-28.
 */
public class TerLocationRes implements Serializable {

    private static final long serialVersionUID = -2633619365780724587L;

    private String code;					//处理结果代码
    private String info;					//处理结果说明
    private LocResult locResult;		//定位结果
    
    
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public LocResult getLocResult() {
		return locResult;
	}
	public void setLocResult(LocResult locResult) {
		this.locResult = locResult;
	}
}
