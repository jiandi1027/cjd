package com.rowell.sifa.pojo.terminal;

import java.io.Serializable;

/**
 * Created by pkx on 2017-7-28.
 */
public class TerminalItem implements Serializable {

    private static final long serialVersionUID = 5028548862748829113L;

    private String terNum;	//终端号码
    private String terName;	//终端用户名称
    private String terType;	//终端类型	1：手机2：车机3：哑终端
    
    
	public String getTerNum() {
		return terNum;
	}
	public void setTerNum(String terNum) {
		this.terNum = terNum;
	}
	public String getTerName() {
		return terName;
	}
	public void setTerName(String terName) {
		this.terName = terName;
	}
	public String getTerType() {
		return terType;
	}
	public void setTerType(String terType) {
		this.terType = terType;
	}
}
