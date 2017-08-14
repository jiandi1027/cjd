/*
* CulpritFamily.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.culpritinfo;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   矫正对象家庭成员和社会关系
* @Author marcle
* @version 1.0 2017-03-16
 */
public class CulpritFamily extends DataEntity<CulpritFamily> implements Serializable {
  

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = -1966200946727704849L;

	/**姓名 */
    private String name;

    /**数据字典与犯人之间的关系 */
    private String dicRelationKey;

    /**出生日期 */
    private String birthday;

    /**工作单位 */
    private String org;

    /**职务 */
    private String job;

    /**联系电话 */
    private String phone;

    /**联系地址 */
    private String address;

    /**备注 */
    private String note;

    /**犯人 */
    private String culpritId;

    /**文档实际所在的文件路径 */
    private String path;

    /**数据字典性别 */
    private String dicSexKey;

    /**数据字典政治面貌 */
    private String dicZzmmKey;

  

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDicRelationKey() {
        return dicRelationKey;
    }

    public void setDicRelationKey(String dicRelationKey) {
        this.dicRelationKey = dicRelationKey == null ? null : dicRelationKey.trim();
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday == null ? null : birthday.trim();
    }

    public String getOrg() {
        return org;
    }

    public void setOrg(String org) {
        this.org = org == null ? null : org.trim();
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    public String getDicSexKey() {
        return dicSexKey;
    }

    public void setDicSexKey(String dicSexKey) {
        this.dicSexKey = dicSexKey == null ? null : dicSexKey.trim();
    }

    public String getDicZzmmKey() {
        return dicZzmmKey;
    }

    public void setDicZzmmKey(String dicZzmmKey) {
        this.dicZzmmKey = dicZzmmKey == null ? null : dicZzmmKey.trim();
    }

    
}