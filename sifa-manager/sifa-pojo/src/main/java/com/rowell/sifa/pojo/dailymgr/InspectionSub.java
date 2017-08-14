/*
* InspectionSub.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-04-06 created
*/
package com.rowell.sifa.pojo.dailymgr;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   集中点验记录分表(储存每个司法所对应的记录)
* @Author marcle
* @version 1.0 2017-04-06
 */
public class InspectionSub extends DataEntity<InspectionSub> implements Serializable {
   

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = -874975491317816057L;

	/**被抽查部门 */
    private String groupId;

    /**总人数 */
    private Integer amount;

    /**实到人数 */
    private Integer realCount;

    /**未到人数 */
    private Integer disCount;

    /**迟到人数 */
    private Integer lateCount;

    /**每个司法所所属的被抽查组的记录id */
    private String inspectionId;

  

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId == null ? null : groupId.trim();
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Integer getRealCount() {
        return realCount;
    }

    public void setRealCount(Integer realCount) {
        this.realCount = realCount;
    }

    public Integer getDisCount() {
        return disCount;
    }

    public void setDisCount(Integer disCount) {
        this.disCount = disCount;
    }

    public Integer getLateCount() {
        return lateCount;
    }

    public void setLateCount(Integer lateCount) {
        this.lateCount = lateCount;
    }

    public String getInspectionId() {
        return inspectionId;
    }

    public void setInspectionId(String inspectionId) {
        this.inspectionId = inspectionId == null ? null : inspectionId.trim();
    }

   
}