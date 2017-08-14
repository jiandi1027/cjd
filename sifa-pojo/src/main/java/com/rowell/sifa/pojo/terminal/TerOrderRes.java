package com.rowell.sifa.pojo.terminal;

import java.io.Serializable;

/**
 * 终端订购响应实体
 * Created by pkx on 2017-7-28.
 */
public class TerOrderRes extends BaseRes implements Serializable {

    private static final long serialVersionUID = -2633619365780724587L;
    
    private String opFlag;			//0702：终端开通
    private Object[] objects;		//返回重复订购和订购失败的手机号

	public String getOpFlag() {
		return opFlag;
	}
	public void setOpFlag(String opFlag) {
		this.opFlag = opFlag;
	}
	public Object[] getObjects() {
		return objects;
	}
	public void setObjects(Object[] objects) {
		this.objects = objects;
	}
}
