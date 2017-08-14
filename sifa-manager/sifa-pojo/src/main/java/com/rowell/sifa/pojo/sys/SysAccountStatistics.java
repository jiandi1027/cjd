/*
* SysAccountStatistics.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-06-07 created
*/
package com.rowell.sifa.pojo.sys;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   首页用户的统计图
* @Author marcle
* @version 1.0 2017-06-07
 */
public class SysAccountStatistics extends DataEntity<SysAccountStatistics> implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    /**用户id */
    private String creater;

    /**左上统计图位置 */
    private String statistics1;

    /**右上统计图位置 */
    private String statistics2;

    /**左下统计图位置 */
    private String statistics3;

    /**右下统计图位置 */
    private String statistics4;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater == null ? null : creater.trim();
    }

    public String getStatistics1() {
        return statistics1;
    }

    public void setStatistics1(String statistics1) {
        this.statistics1 = statistics1 == null ? null : statistics1.trim();
    }

    public String getStatistics2() {
        return statistics2;
    }

    public void setStatistics2(String statistics2) {
        this.statistics2 = statistics2 == null ? null : statistics2.trim();
    }

    public String getStatistics3() {
        return statistics3;
    }

    public void setStatistics3(String statistics3) {
        this.statistics3 = statistics3 == null ? null : statistics3.trim();
    }

    public String getStatistics4() {
        return statistics4;
    }

    public void setStatistics4(String statistics4) {
        this.statistics4 = statistics4 == null ? null : statistics4.trim();
    }

}