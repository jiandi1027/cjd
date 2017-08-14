package com.rowell.sifa.pojo.sys;

import java.io.Serializable;
import java.util.Date;

import com.rowell.sifa.pojo.base.DataEntity;
/**
 * 
    * @ClassName: Area  
    * @Description: 中国省市区列表  
    * @author dell  
    * @date 2017年3月27日  
    *
 */
public class Area extends DataEntity<Area> implements Serializable{

	  
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 1L;
	
	private String id;
	//区域等级
	private String areaLevel;
	//区域名字
	private String areaName;
	//
	private String areaCode;
	//上级区域代号
	private String areaParent;
	//区域经度
	private String areaLon;
	//纬度
	private String areaLat;
	
	private String areaPinyin;
	//降序
	private String areaDesc;
	//创建的id
	private String areaCreateUid;
	//创建的时间
	private Date areaCreateDate;
	//更新的id
	private String areaUpdateUid;
	//更新时间
	private Date areaUpdateDate;
	//是否自治区 1是
	private String isMunicipality;
	//升序
	private String areaOrder;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAreaLevel() {
		return areaLevel;
	}
	public void setAreaLevel(String areaLevel) {
		this.areaLevel = areaLevel;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getAreaParent() {
		return areaParent;
	}
	public void setAreaParent(String areaParent) {
		this.areaParent = areaParent;
	}
	public String getAreaLon() {
		return areaLon;
	}
	public void setAreaLon(String areaLon) {
		this.areaLon = areaLon;
	}
	public String getAreaLat() {
		return areaLat;
	}
	public void setAreaLat(String areaLat) {
		this.areaLat = areaLat;
	}
	public String getAreaPinyin() {
		return areaPinyin;
	}
	public void setAreaPinyin(String areaPinyin) {
		this.areaPinyin = areaPinyin;
	}
	public String getAreaDesc() {
		return areaDesc;
	}
	public void setAreaDesc(String areaDesc) {
		this.areaDesc = areaDesc;
	}
	public String getAreaCreateUid() {
		return areaCreateUid;
	}
	public void setAreaCreateUid(String areaCreateUid) {
		this.areaCreateUid = areaCreateUid;
	}
	public Date getAreaCreateDate() {
		return areaCreateDate;
	}
	public void setAreaCreateDate(Date areaCreateDate) {
		this.areaCreateDate = areaCreateDate;
	}
	public String getAreaUpdateUid() {
		return areaUpdateUid;
	}
	public void setAreaUpdateUid(String areaUpdateUid) {
		this.areaUpdateUid = areaUpdateUid;
	}
	public Date getAreaUpdateDate() {
		return areaUpdateDate;
	}
	public void setAreaUpdateDate(Date areaUpdateDate) {
		this.areaUpdateDate = areaUpdateDate;
	}
	public String getIsMunicipality() {
		return isMunicipality;
	}
	public void setIsMunicipality(String isMunicipality) {
		this.isMunicipality = isMunicipality;
	}
	public String getAreaOrder() {
		return areaOrder;
	}
	public void setAreaOrder(String areaOrder) {
		this.areaOrder = areaOrder;
	}
	
}
