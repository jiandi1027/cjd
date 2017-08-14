package com.rowell.sifa.pojo.monitoring;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;
/**
 * 电子围栏
 * @author FWY
 *
 */
public class SfArea extends DataEntity<SfArea> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3002660116429823437L;
	private String name;
	private String remark;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
