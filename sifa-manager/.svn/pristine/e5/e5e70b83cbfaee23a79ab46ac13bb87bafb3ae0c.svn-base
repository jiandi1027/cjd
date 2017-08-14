/*
* Study.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-17 created
*/
package com.rowell.sifa.pojo.dailymgr;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.DataEntity;
import com.rowell.sifa.pojo.culpritinfo.Culprit;

/**
 *   学习教育
* @Author marcle
* @version 1.0 2017-03-17
 */
public class Study extends DataEntity<Study> implements Serializable {
 

    /**
	 * 
	 */
	private static final long serialVersionUID = -8858878819429568370L;

	/**学习日期 */
    private Date studyDate;

    /**学习内容 */
    private String studyContent;

    /**数据字典学习方式 */
    private String dicStudyTypeKey;

    /**STUDY_SHOW */
    private String studyShow;

    /**备注 */
    private String note;

    /**学习时间 */
    private Integer studyTime;

    /**文件路径 */
    private String filePath;

    /**考核人 */
    private String assessManager;

    /**所在组 */
    private String groupId;

    /**参加人员列表 */
    private String partPerson;

    /**未参加人员列标 */
    private String noPartPerson;
    /**类型　１集中　　２个人**/
    private String studyType;
    
    protected String groupName;	   //司法所名
    protected String excellents;   //优秀
    protected String goods;        //良好
    protected String commonlys;	   //一般
    protected String differences;  //差
    protected List<Culprit> culpritList;
    protected List<StudyCulprit> excellentList;
    protected List<StudyCulprit> goodList;
    protected List<StudyCulprit> commonlyList;
    protected List<StudyCulprit> differenceList;
    
    protected String culpritId;  //矫正人员
    protected String statusId;   //表现
   
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getStudyDate() {
        return studyDate;
    }

    public void setStudyDate(Date studyDate) {
        this.studyDate = studyDate;
    }

    public String getStudyContent() {
        return studyContent;
    }

    public void setStudyContent(String studyContent) {
        this.studyContent = studyContent == null ? null : studyContent.trim();
    }

    public String getDicStudyTypeKey() {
        return dicStudyTypeKey;
    }

    public void setDicStudyTypeKey(String dicStudyTypeKey) {
        this.dicStudyTypeKey = dicStudyTypeKey == null ? null : dicStudyTypeKey.trim();
    }

    public String getStudyShow() {
        return studyShow;
    }

    public void setStudyShow(String studyShow) {
        this.studyShow = studyShow == null ? null : studyShow.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public Integer getStudyTime() {
        return studyTime;
    }

    public void setStudyTime(Integer studyTime) {
        this.studyTime = studyTime;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath == null ? null : filePath.trim();
    }

    public String getAssessManager() {
        return assessManager;
    }

    public void setAssessManager(String assessManager) {
        this.assessManager = assessManager == null ? null : assessManager.trim();
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId == null ? null : groupId.trim();
    }

    public String getPartPerson() {
        return partPerson;
    }

    public void setPartPerson(String partPerson) {
        this.partPerson = partPerson == null ? null : partPerson.trim();
    }

    public String getNoPartPerson() {
        return noPartPerson;
    }

    public void setNoPartPerson(String noPartPerson) {
        this.noPartPerson = noPartPerson == null ? null : noPartPerson.trim();
    }

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getExcellents() {
		return excellents;
	}

	public void setExcellents(String excellents) {
		this.excellents = excellents;
	}

	public String getGoods() {
		return goods;
	}

	public void setGoods(String goods) {
		this.goods = goods;
	}

	public String getCommonlys() {
		return commonlys;
	}

	public void setCommonlys(String commonlys) {
		this.commonlys = commonlys;
	}

	public String getDifferences() {
		return differences;
	}

	public void setDifferences(String differences) {
		this.differences = differences;
	}

	public List<Culprit> getCulpritList() {
		return culpritList;
	}

	public void setCulpritList(List<Culprit> culpritList) {
		this.culpritList = culpritList;
	}

	public List<StudyCulprit> getExcellentList() {
		return excellentList;
	}

	public void setExcellentList(List<StudyCulprit> excellentList) {
		this.excellentList = excellentList;
	}

	public List<StudyCulprit> getGoodList() {
		return goodList;
	}

	public void setGoodList(List<StudyCulprit> goodList) {
		this.goodList = goodList;
	}

	public List<StudyCulprit> getCommonlyList() {
		return commonlyList;
	}

	public void setCommonlyList(List<StudyCulprit> commonlyList) {
		this.commonlyList = commonlyList;
	}

	public List<StudyCulprit> getDifferenceList() {
		return differenceList;
	}

	public void setDifferenceList(List<StudyCulprit> differenceList) {
		this.differenceList = differenceList;
	}

	public String getStudyType() {
		return studyType;
	}

	public void setStudyType(String studyType) {
		this.studyType = studyType;
	}

	public String getCulpritId() {
		return culpritId;
	}

	public void setCulpritId(String culpritId) {
		this.culpritId = culpritId;
	}

	public String getStatusId() {
		return statusId;
	}

	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}

}