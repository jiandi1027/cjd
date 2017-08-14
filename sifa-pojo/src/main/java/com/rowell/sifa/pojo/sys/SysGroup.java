/*
* SysGroup.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.sys;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   组织表
* @Author marcle
* @version 1.0 2017-03-16
 */
public class SysGroup extends DataEntity<SysGroup> implements Serializable {
  

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = -3668052705774481003L;

	/**组名 */
    private String name;

    /**备注 */
    private String remark;

    /**上级组ID */
    private String parentId;

    /**地址 */
    private String address;

    /**部门编号 */
    private String groupSeq;

    /**联系人 */
    private String contactor;

    /**电话 */
    private String phone;

    /**级别 */
    private Integer levelNo;

    /**序号 */
    private Integer indexNo;

    /**地区编号 */
    private String area;

    /**越界告警-联系人 */
    private String mapGroupId;

    /**机构编码 */
    private String jgbm;

    /**机构简称 */
    private String jgjc;

    /**英文名称 */
    private String ywmc;

    /**机构代码 */
    private String jgdm;

    /**数据字典司法行政机构类型
司法行政机构类型
司法行政机构类型 */
    private String dicSfxzjglxKey;

    /**数据字典机构行政级别 */
    private String dicJgxzjbKey;

    /**数据字典机构隶属层级 */
    private String dicJglscjKey;

    /**传真号码 */
    private String czhm;

    /**电子邮箱 */
    private String dzyx;

    /**邮编 */
    private String yb;

  

    public SysGroup() {
		super();
	}
    
    public SysGroup(String id){
    	super(id);
    }

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    

    public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getGroupSeq() {
        return groupSeq;
    }

    public void setGroupSeq(String groupSeq) {
        this.groupSeq = groupSeq == null ? null : groupSeq.trim();
    }

    public String getContactor() {
        return contactor;
    }

    public void setContactor(String contactor) {
        this.contactor = contactor == null ? null : contactor.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getLevelNo() {
        return levelNo;
    }

    public void setLevelNo(Integer levelNo) {
        this.levelNo = levelNo;
    }

    public Integer getIndexNo() {
        return indexNo;
    }

    public void setIndexNo(Integer indexNo) {
        this.indexNo = indexNo;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getMapGroupId() {
        return mapGroupId;
    }

    public void setMapGroupId(String mapGroupId) {
        this.mapGroupId = mapGroupId == null ? null : mapGroupId.trim();
    }

    public String getJgbm() {
        return jgbm;
    }

    public void setJgbm(String jgbm) {
        this.jgbm = jgbm == null ? null : jgbm.trim();
    }

    public String getJgjc() {
        return jgjc;
    }

    public void setJgjc(String jgjc) {
        this.jgjc = jgjc == null ? null : jgjc.trim();
    }

    public String getYwmc() {
        return ywmc;
    }

    public void setYwmc(String ywmc) {
        this.ywmc = ywmc == null ? null : ywmc.trim();
    }

    public String getJgdm() {
        return jgdm;
    }

    public void setJgdm(String jgdm) {
        this.jgdm = jgdm == null ? null : jgdm.trim();
    }

    public String getDicSfxzjglxKey() {
        return dicSfxzjglxKey;
    }

    public void setDicSfxzjglxKey(String dicSfxzjglxKey) {
        this.dicSfxzjglxKey = dicSfxzjglxKey == null ? null : dicSfxzjglxKey.trim();
    }

    public String getDicJgxzjbKey() {
        return dicJgxzjbKey;
    }

    public void setDicJgxzjbKey(String dicJgxzjbKey) {
        this.dicJgxzjbKey = dicJgxzjbKey == null ? null : dicJgxzjbKey.trim();
    }

    public String getDicJglscjKey() {
        return dicJglscjKey;
    }

    public void setDicJglscjKey(String dicJglscjKey) {
        this.dicJglscjKey = dicJglscjKey == null ? null : dicJglscjKey.trim();
    }

    public String getCzhm() {
        return czhm;
    }

    public void setCzhm(String czhm) {
        this.czhm = czhm == null ? null : czhm.trim();
    }

    public String getDzyx() {
        return dzyx;
    }

    public void setDzyx(String dzyx) {
        this.dzyx = dzyx == null ? null : dzyx.trim();
    }

    public String getYb() {
        return yb;
    }

    public void setYb(String yb) {
        this.yb = yb == null ? null : yb.trim();
    }

}