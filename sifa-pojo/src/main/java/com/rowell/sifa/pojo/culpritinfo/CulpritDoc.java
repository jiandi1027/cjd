/*
* CulpritDoc.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.culpritinfo;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   文档
* @Author marcle
* @version 1.0 2017-03-16
 */
public class CulpritDoc extends DataEntity<CulpritDoc> implements Serializable {
  
      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = -5834798221045949592L;

	/**文档名称 */
    private String name;

    /**文档实际所在的文件路径 */
    private String path;

    /**犯人 */
    private String culpritId;

    /**数据字典文档类型 */
    private String dicDocTypeKey;

    /**文书编号 */
    private String fileNo;

 
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getDicDocTypeKey() {
        return dicDocTypeKey;
    }

    public void setDicDocTypeKey(String dicDocTypeKey) {
        this.dicDocTypeKey = dicDocTypeKey == null ? null : dicDocTypeKey.trim();
    }

    public String getFileNo() {
        return fileNo;
    }

    public void setFileNo(String fileNo) {
        this.fileNo = fileNo == null ? null : fileNo.trim();
    }

  
}