package com.rowell.sifa.pojo.terminal;

import java.io.Serializable;
import java.util.List;

/**
 * 终端订购请求实体
 * Created by pkx on 2017-7-28.
 */
public class TerOrderReq extends BaseReq implements Serializable {

    private static final long serialVersionUID = 3710424083393436563L;

    private String entCode;					//企业标识
    private String identifier;				//Si接入时生成的唯一标识
    private List<TerminalItem> terItems;	//订购的终端列表
    
	public String getEntCode() {
		return entCode;
	}
	public void setEntCode(String entCode) {
		this.entCode = entCode;
	}
	public List<TerminalItem> getTerItems() {
		return terItems;
	}
	public void setTerItems(List<TerminalItem> terItems) {
		this.terItems = terItems;
	}
	public String getIdentifier() {
		return identifier;
	}
	public void setIdentifier(String identifier) {
		this.identifier = identifier;
	}
}
