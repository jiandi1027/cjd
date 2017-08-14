/*
* SysPermisson.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.sys;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   资源操作权限
* @Author marcle
* @version 1.0 2017-03-16
 */
public class SysPermisson extends DataEntity<SysPermisson> implements Serializable {
   

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)
	    */  
	    
	private static final long serialVersionUID = 6596319146277166478L;

	/**名称 */
    private String name;

    /**访问地址 */
    private String url;

    /**权限类型1菜单0按钮 */
    private String type;

    /**所属上级菜单 */
    private String parentId;

    /**父编号 */
    private String parentIds;

    /**权限标识 */
    private String perCode;

    /**描述 */
    private String description;

    /**图标 */
    @JsonProperty("iconCls")
    private String icon;

    /**排序 */
    private Integer perSort;
    /***打开方式**/
    private String openMode;
    /***是否打开**/
    private Integer opened;
    private Integer isLeaf;//是否是叶子节点
    private Integer available;//是否可用
    
    private List<SysPermisson> childSysPermisson;
    
    public SysPermisson(String id) {
		super(id);
	}

    public SysPermisson() {
		super();
	}

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds == null ? null : parentIds.trim();
    }

    public String getPerCode() {
        return perCode;
    }

    public void setPerCode(String perCode) {
        this.perCode = perCode == null ? null : perCode.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    public Integer getPerSort() {
        return perSort;
    }

    public void setPerSort(Integer perSort) {
        this.perSort = perSort;
    }

	public String getOpenMode() {
		return openMode;
	}

	public void setOpenMode(String openMode) {
		this.openMode = openMode;
	}

	public Integer getOpened() {
		return opened;
	}

	public void setOpened(Integer opened) {
		this.opened = opened;
	}
	public static String getRootId(){
		return "06e2e164fe4b40d4ad098b1ac1ad0dfa";
	}

	public Integer getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(Integer isLeaf) {
		this.isLeaf = isLeaf;
	}

	public String getState() {
		if("06e2e164fe4b40d4ad098b1ac1ad0dfa".equals(getId()) || isLeaf==1){
			return "open";
			
		}else{
			return "closed";
		}
	}

	public List<SysPermisson> getChildSysPermisson() {
		return childSysPermisson;
	}

	public void setChildSysPermisson(List<SysPermisson> childSysPermisson) {
		this.childSysPermisson = childSysPermisson;
	}

	public Integer getAvailable() {
		return available;
	}

	public void setAvailable(Integer available) {
		this.available = available;
	}
  
}