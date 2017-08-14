/*
* InspectionDeal.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-04-06 created
*/
package com.rowell.sifa.pojo.dailymgr;

import java.io.Serializable;
import java.util.Date;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   每个司法所集中点验处理
* @Author marcle
* @version 1.0 2017-04-06
 */
public class InspectionDeal extends DataEntity<InspectionDeal> implements Serializable {
 

      

		/**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 128749633228462976L;

	/**社区服刑人员 */
    private String culpritId;

    /**数据字典是否请假 */
    private String dicIsAskLeaveKey;

    /**数据字典是否报到 */
    private String dicIsRegisterKey;

    /**数据字典是否迟到 */
    private String dicIsLateKey;

    /**所在司法所对应的分表记录 */
    private String inspectionSubId;

    /**数据字典处理状态,0未抽查，1按时,2迟到,3未到 */
    private String dicCheckStatusKey;

    /**备注 */
    private String note;
    
    protected String culpritName;
	protected String groupName;
	protected String inspectionId;
	protected String groupId;
	
	/**抽查开始时间段 */
	protected Date checkStartTime;
    /**抽查结束时间段 */
	protected Date checkEndTime;

	


    public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getDicIsAskLeaveKey() {
        return dicIsAskLeaveKey;
    }

    public void setDicIsAskLeaveKey(String dicIsAskLeaveKey) {
        this.dicIsAskLeaveKey = dicIsAskLeaveKey == null ? null : dicIsAskLeaveKey.trim();
    }

    public String getDicIsRegisterKey() {
        return dicIsRegisterKey;
    }

    public void setDicIsRegisterKey(String dicIsRegisterKey) {
        this.dicIsRegisterKey = dicIsRegisterKey == null ? null : dicIsRegisterKey.trim();
    }

    public String getDicIsLateKey() {
        return dicIsLateKey;
    }

    public void setDicIsLateKey(String dicIsLateKey) {
        this.dicIsLateKey = dicIsLateKey == null ? null : dicIsLateKey.trim();
    }

    public String getInspectionSubId() {
        return inspectionSubId;
    }

    public void setInspectionSubId(String inspectionSubId) {
        this.inspectionSubId = inspectionSubId == null ? null : inspectionSubId.trim();
    }

    public String getDicCheckStatusKey() {
        return dicCheckStatusKey;
    }

    public void setDicCheckStatusKey(String dicCheckStatusKey) {
        this.dicCheckStatusKey = dicCheckStatusKey == null ? null : dicCheckStatusKey.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }


    public String getCulpritName() {
		return culpritName;
	}

	public void setCulpritName(String culpritName) {
		this.culpritName = culpritName;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getInspectionId() {
		return inspectionId;
	}

	public void setInspectionId(String inspectionId) {
		this.inspectionId = inspectionId;
	}

	public Date getCheckStartTime() {
		return checkStartTime;
	}

	public void setCheckStartTime(Date checkStartTime) {
		this.checkStartTime = checkStartTime;
	}

	public Date getCheckEndTime() {
		return checkEndTime;
	}

	public void setCheckEndTime(Date checkEndTime) {
		this.checkEndTime = checkEndTime;
	}


   
}