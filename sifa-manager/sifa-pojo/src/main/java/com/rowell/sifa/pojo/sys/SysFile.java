/*
* SysFile.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-05-03 created
*/
package com.rowell.sifa.pojo.sys;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   附件（不包括法律文书、审判文书等专业性的附件）
* @Author marcle
* @version 1.0 2017-05-03
 */
public class SysFile extends DataEntity<SysFile> implements Serializable {


    /**附件路径（最多存一个） */
    private String path;

    /**附件名 */
    private String name;

    /**对应表名 */
    private String tableName;

    /**对应表id */
    private String tableId;

    /**文件类型 */
    private String fileType;


    /**原始名称 */
    private String originName;

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName == null ? null : tableName.trim();
    }

    public String getTableId() {
        return tableId;
    }

    public void setTableId(String tableId) {
        this.tableId = tableId == null ? null : tableId.trim();
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType == null ? null : fileType.trim();
    }

    public String getOriginName() {
        return originName;
    }

    public void setOriginName(String originName) {
        this.originName = originName == null ? null : originName.trim();
    }
}