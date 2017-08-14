/*
* WarningOral.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.rewardspunishment;

import java.io.Serializable;
import java.util.Date;

import com.rowell.sifa.pojo.base.DataEntity;
import com.rowell.sifa.pojo.base.ProcessEntity;

/**
 *   口头警告
* @Author marcle
* @version 1.0 2017-03-16
 */
public class WarningOral extends ProcessEntity<WarningOral> implements Serializable {
   

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 3940997809914965249L;

	/**矫正对象 */
    private String culpritId;

    /**犯错事实 */
    private String fact;

    /**记录创建时间 */
    private Date createdTime;

    /**记录修改时间 */
    private Date modifiedTime;

    /**悔过书附件路径 */
    private String repentancePath;

    /**悔过书附件名称 */
    private String repenteancePathName;

    /**调查笔录附件路径 */
    private String notePath;

    /**调查笔录附件名称 */
    private String notePathName;

    /**谈话时间 */
    private Date talkTime;

    /**司法所谈话人 */
    private String talkor;

    /**记录人 */
    private String recorder;

    /**谈话内容 */
    private String content;

    /**简要违纪情况 */
    private String detailInfo;

    /**备注 */
    private String note;

    /**违纪原因 */
    private String dicReasonTypeKey;

    protected String culpritName;  //对象姓名
    protected String groupName;	   //对象直属司法所
    protected String groupId;	   //对象直属司法所
    private Date startDate;        //开始时间
    private Date endDate;		   //结束时间
   

    public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getFact() {
        return fact;
    }

    public void setFact(String fact) {
        this.fact = fact == null ? null : fact.trim();
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    public String getRepentancePath() {
        return repentancePath;
    }

    public void setRepentancePath(String repentancePath) {
        this.repentancePath = repentancePath == null ? null : repentancePath.trim();
    }

    public String getRepenteancePathName() {
        return repenteancePathName;
    }

    public void setRepenteancePathName(String repenteancePathName) {
        this.repenteancePathName = repenteancePathName == null ? null : repenteancePathName.trim();
    }

    public String getNotePath() {
        return notePath;
    }

    public void setNotePath(String notePath) {
        this.notePath = notePath == null ? null : notePath.trim();
    }

    public String getNotePathName() {
        return notePathName;
    }

    public void setNotePathName(String notePathName) {
        this.notePathName = notePathName == null ? null : notePathName.trim();
    }

    public Date getTalkTime() {
        return talkTime;
    }

    public void setTalkTime(Date talkTime) {
        this.talkTime = talkTime;
    }

    public String getTalkor() {
        return talkor;
    }

    public void setTalkor(String talkor) {
        this.talkor = talkor == null ? null : talkor.trim();
    }

    public String getRecorder() {
        return recorder;
    }

    public void setRecorder(String recorder) {
        this.recorder = recorder == null ? null : recorder.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getDetailInfo() {
        return detailInfo;
    }

    public void setDetailInfo(String detailInfo) {
        this.detailInfo = detailInfo == null ? null : detailInfo.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getDicReasonTypeKey() {
        return dicReasonTypeKey;
    }

    public void setDicReasonTypeKey(String dicReasonTypeKey) {
        this.dicReasonTypeKey = dicReasonTypeKey == null ? null : dicReasonTypeKey.trim();
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

    
}