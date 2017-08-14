/*
* MxCheck.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-05-08 created
*/
package com.rowell.sifa.pojo.sys;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   明细评分详细表
* @Author marcle
* @version 1.0 2017-05-08
 */
public class MxCheck extends DataEntity<MxCheck> implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = -8562616769142384600L;

	/**次数 */
    private Integer amount;

    /**类型：1矫正科办案质量 2矫正科执法质量 3法制科执法质量 4市矫正处办案 5市矫正处执法 6市法制处执法 */
    private String infoType;

    /**数据字典明细项 */
    private String dicChecktypeId;

    /**扣分分数 */
    private String deduction;

    /**流程实例id */
    private String processInstanceId;

    /**其他详情 */
    private String detailReason;

    /**是否启用 */
    private Integer isUse;


    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getInfoType() {
        return infoType;
    }

    public void setInfoType(String infoType) {
        this.infoType = infoType == null ? null : infoType.trim();
    }

    public String getDicChecktypeId() {
        return dicChecktypeId;
    }

    public void setDicChecktypeId(String dicChecktypeId) {
        this.dicChecktypeId = dicChecktypeId == null ? null : dicChecktypeId.trim();
    }

    public String getDeduction() {
        return deduction;
    }

    public void setDeduction(String deduction) {
        this.deduction = deduction == null ? null : deduction.trim();
    }


    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId == null ? null : processInstanceId.trim();
    }

    public String getDetailReason() {
        return detailReason;
    }

    public void setDetailReason(String detailReason) {
        this.detailReason = detailReason == null ? null : detailReason.trim();
    }


    public Integer getIsUse() {
        return isUse;
    }

    public void setIsUse(Integer isUse) {
        this.isUse = isUse;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }
}