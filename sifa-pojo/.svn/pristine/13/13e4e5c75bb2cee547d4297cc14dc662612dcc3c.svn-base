/*
* Talk.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-17 created
*/
package com.rowell.sifa.pojo.dailymgr;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   个别谈话
* @Author marcle
* @version 1.0 2017-03-17
 */
public class Talk extends DataEntity<Talk> implements Serializable {
  

    /**文档名称 */
    private String name;

    /**文档实际所在的文件路径 */
    private String path;

    /**犯人 */
    private String culpritId;

    /**谈话人 */
    private String talkor;

    /**谈话地点 */
    private String place;

    /**谈话时间 */
    private Date talkTime;

    /**谈话记录 */
    private String record;

    /**文檔/附件关联对象 */
    private String documentId;

    /**记录人 */
    private String recorder;

    /**备注 */
    private String note;

    /**附件全路径 */
    private String filePath;

    /**附件名称 */
    private String filePathName;

    /**谈话开始时间 */
    private Date talkStartTime;

    /**谈话结束时间 */
    private Date talkEndTime;
    
    /*是否是首次谈话教育，0表示首次谈话教育，1表示日常谈话教育*/
    private String isFirstTalk;
    
    private String culpritName;
    private String groupName;
    
    private String groupId;
    
    private String addressPro;
    private String addressCity;
    private String addressCountry;
    private String addressStreet;
    private String addressDetail;
  
    
    public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	
        
    
    public String getIsFirstTalk() {
		return isFirstTalk;
	}

	public void setIsFirstTalk(String isFirstTalk) {
		this.isFirstTalk = isFirstTalk;
	}

	public String getAddressPro() {
		return addressPro;
	}

	public void setAddressPro(String addressPro) {
		this.addressPro = addressPro;
	}

	public String getAddressCity() {
		return addressCity;
	}

	public void setAddressCity(String addressCity) {
		this.addressCity = addressCity;
	}

	public String getAddressCountry() {
		return addressCountry;
	}

	public void setAddressCountry(String addressCountry) {
		this.addressCountry = addressCountry;
	}

	public String getAddressStreet() {
		return addressStreet;
	}

	public void setAddressStreet(String addressStreet) {
		this.addressStreet = addressStreet;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
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

    public String getTalkor() {
        return talkor;
    }

    public void setTalkor(String talkor) {
        this.talkor = talkor == null ? null : talkor.trim();
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place == null ? null : place.trim();
    }
    @JsonFormat(pattern = "yyyy-MM-dd")
    public Date getTalkTime() {
        return talkTime;
    }

    public void setTalkTime(Date talkTime) {
        this.talkTime = talkTime;
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record == null ? null : record.trim();
    }

    public String getDocumentId() {
        return documentId;
    }

    public void setDocumentId(String documentId) {
        this.documentId = documentId == null ? null : documentId.trim();
    }

    public String getRecorder() {
        return recorder;
    }

    public void setRecorder(String recorder) {
        this.recorder = recorder == null ? null : recorder.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath == null ? null : filePath.trim();
    }

    public String getFilePathName() {
        return filePathName;
    }

    public void setFilePathName(String filePathName) {
        this.filePathName = filePathName == null ? null : filePathName.trim();
    }
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    public Date getTalkStartTime() {
        return talkStartTime;
    }

    public void setTalkStartTime(Date talkStartTime) {
        this.talkStartTime = talkStartTime;
    }
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    public Date getTalkEndTime() {
        return talkEndTime;
    }

    public void setTalkEndTime(Date talkEndTime) {
        this.talkEndTime = talkEndTime;
    }

   
}