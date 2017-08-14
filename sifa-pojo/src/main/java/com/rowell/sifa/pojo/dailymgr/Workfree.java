/*
* Workfree.java
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
 *   社区服务（公益劳动）
* @Author marcle
* @version 1.0 2017-03-17
 */
public class Workfree extends DataEntity<Workfree> implements Serializable {
 

    /**
	 * 
	 */
	private static final long serialVersionUID = 2006851834180129442L;

	/**劳动日期 */
    private Date workDate;

    /**劳动地点 */
    private String workPlace;

    /**劳动内容 */
    private String workContent;

    /**工时 */
    private Integer taskTime;

    /**备注 */
    private String note;

    /**文件路径 */
    private String filePath;

    /**考核人 */
    private String assessManager;

    /**组织活动的司法所id */
    private String groupId;

    /**未参加人员列标 */
    private String noPartPerson;
    
    private String workfreeType;

    protected String groupName;	   //司法所名
    protected String excellents;   //优秀
    protected String goods;        //良好
    protected String commonlys;	   //一般
    protected String differences;  //差
    protected List<Culprit> culpritList;
    protected List<WorkFreeCulprit> excellentList;
    protected List<WorkFreeCulprit> goodList;
    protected List<WorkFreeCulprit> commonlyList;
    protected List<WorkFreeCulprit> differenceList;
    
    protected String culpritId;  //矫正人员
    protected String statusId;   //表现
   
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getWorkDate() {
        return workDate;
    }

    public void setWorkDate(Date workDate) {
        this.workDate = workDate;
    }

    public String getWorkPlace() {
        return workPlace;
    }

    public void setWorkPlace(String workPlace) {
        this.workPlace = workPlace == null ? null : workPlace.trim();
    }

    public String getWorkContent() {
        return workContent;
    }

    public void setWorkContent(String workContent) {
        this.workContent = workContent == null ? null : workContent.trim();
    }

    public Integer getTaskTime() {
        return taskTime;
    }

    public void setTaskTime(Integer taskTime) {
        this.taskTime = taskTime;
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

	public List<WorkFreeCulprit> getExcellentList() {
		return excellentList;
	}

	public void setExcellentList(List<WorkFreeCulprit> excellentList) {
		this.excellentList = excellentList;
	}

	public List<WorkFreeCulprit> getGoodList() {
		return goodList;
	}

	public void setGoodList(List<WorkFreeCulprit> goodList) {
		this.goodList = goodList;
	}

	public List<WorkFreeCulprit> getCommonlyList() {
		return commonlyList;
	}

	public void setCommonlyList(List<WorkFreeCulprit> commonlyList) {
		this.commonlyList = commonlyList;
	}

	public List<WorkFreeCulprit> getDifferenceList() {
		return differenceList;
	}

	public void setDifferenceList(List<WorkFreeCulprit> differenceList) {
		this.differenceList = differenceList;
	}

	public String getWorkfreeType() {
		return workfreeType;
	}

	public void setWorkfreeType(String workfreeType) {
		this.workfreeType = workfreeType;
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