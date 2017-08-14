/*
* SysDic.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.sys;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   数据字典
* @Author marcle
* @version 1.0 2017-03-16
 */
public class SysDic extends DataEntity<SysDic> implements Serializable {
 

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 5003494987115134446L;

	/**表明 通用字典表名用common_table */
    private String tabName;

    /**列名 */
    private String columnName;

    /**上级 */
    private String parentKey;

    /**键列名对应的键必须唯一 */
    private String key;

    /**值 */
    private String value;

    /**字典上下级间的等级 */
    private String dicLevel;

    /**排序 */
    private Integer dicSort;
    //待处理数量
    private Integer amount;

    
    
    public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public SysDic() {
		super();
	}
    
    public SysDic(String id) {
  		super(id);
  	}

	public SysDic(String key, String value) {
		super();
		this.key = key;
		this.value = value;
	}
	public SysDic(String id,String key, String value) {
		super(id);
		this.key = key;
		this.value = value;
	}
	
	

	public String getTabName() {
        return tabName;
    }

    public void setTabName(String tabName) {
        this.tabName = tabName == null ? null : tabName.trim();
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName == null ? null : columnName.trim();
    }

    public String getParentKey() {
        return parentKey;
    }

    public void setParentKey(String parentKey) {
        this.parentKey = parentKey == null ? null : parentKey.trim();
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key == null ? null : key.trim();
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value == null ? null : value.trim();
    }

    public String getDicLevel() {
        return dicLevel;
    }

    public void setDicLevel(String dicLevel) {
        this.dicLevel = dicLevel == null ? null : dicLevel.trim();
    }

	public Integer getDicSort() {
		return dicSort;
	}

	public void setDicSort(Integer dicSort) {
		this.dicSort = dicSort;
	}

   


   
}