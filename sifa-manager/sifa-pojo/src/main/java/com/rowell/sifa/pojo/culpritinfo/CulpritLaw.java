/*
* CulpritLaw.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-16 created
*/
package com.rowell.sifa.pojo.culpritinfo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   依据的法律文书相关信息
* @Author marcle
* @version 1.0 2017-03-16
 */
public class CulpritLaw extends DataEntity<CulpritLaw> implements Serializable {
  

      
	    /** 
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = 7785444062048741709L;

	private String culpritId;

    /**侦查机关 */
    private String investigateOrg;

    /**拘留日期 */
    private Date detainDate;

    /**立案日期 */
    private Date registerDate;

    /**决定/批准逮捕机关 */
    private String arrestOrg;

    /**逮捕日期 */
    private Date arrestDate;

    /**侦结日期 */
    private Date investOverDate;

    /**检查机关（自诉人） */
    private String checkOrg;

    /**起诉书编号 */
    private String indictmentNum;

    /**提起起诉日期 */
    private Date indictmentDate;

    /**执行通知书日期 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date executeNotificationDate;

    /**执行通知书文号 */
    private String executeNotificationNum;

    /**交付执行日期 */
    private Date deliverDate;

    /**法律文书上传时间 */
    private Date legalDocsUploadDate;

    /**数据字典文书类型 */
    private String dicWslxKey;

    /**法律文书路径 */
    private String legalDocsPath;

    /**法律文书名称 */
    private String legalDocsName;

    /**文书生效日期 */
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    private Date legalDocsStartDate;

    /**本次犯罪前的行政处罚 */
    private String oldAdministrationRecord;

    /**本次犯罪前的刑事处罚 */
    private String oldPenalRecord;
    //20170327
    /*文书收到日期*/
    private Date legalDocsReceiveT;
    
    /**发文日期 */
    private Date dispatchDate;

    /**主送单位 */
    private String mainDept;

    /**抄送单位 */
    private String copyDept;

    /**拟稿人 */
    private String drafter;

    /**审批人 */
    private String passer;
    
    protected String groupId;	   //对象直属司法所
  
    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")
    public Date getLegalDocsReceiveT() {
		return legalDocsReceiveT;
	}

	public void setLegalDocsReceiveT(Date legalDocsReceiveT) {
		this.legalDocsReceiveT = legalDocsReceiveT;
	}

	public String getCulpritId() {
        return culpritId;
    }

    public void setCulpritId(String culpritId) {
        this.culpritId = culpritId == null ? null : culpritId.trim();
    }

    public String getInvestigateOrg() {
        return investigateOrg;
    }

    public void setInvestigateOrg(String investigateOrg) {
        this.investigateOrg = investigateOrg == null ? null : investigateOrg.trim();
    }

    public Date getDetainDate() {
        return detainDate;
    }

    public void setDetainDate(Date detainDate) {
        this.detainDate = detainDate;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    public String getArrestOrg() {
        return arrestOrg;
    }

    public void setArrestOrg(String arrestOrg) {
        this.arrestOrg = arrestOrg == null ? null : arrestOrg.trim();
    }

    public Date getArrestDate() {
        return arrestDate;
    }

    public void setArrestDate(Date arrestDate) {
        this.arrestDate = arrestDate;
    }

    public Date getInvestOverDate() {
        return investOverDate;
    }

    public void setInvestOverDate(Date investOverDate) {
        this.investOverDate = investOverDate;
    }

    public String getCheckOrg() {
        return checkOrg;
    }

    public void setCheckOrg(String checkOrg) {
        this.checkOrg = checkOrg == null ? null : checkOrg.trim();
    }

    public String getIndictmentNum() {
        return indictmentNum;
    }

    public void setIndictmentNum(String indictmentNum) {
        this.indictmentNum = indictmentNum == null ? null : indictmentNum.trim();
    }

    public Date getIndictmentDate() {
        return indictmentDate;
    }

    public void setIndictmentDate(Date indictmentDate) {
        this.indictmentDate = indictmentDate;
    }

    public Date getExecuteNotificationDate() {
        return executeNotificationDate;
    }

    public void setExecuteNotificationDate(Date executeNotificationDate) {
        this.executeNotificationDate = executeNotificationDate;
    }

    public String getExecuteNotificationNum() {
        return executeNotificationNum;
    }

    public void setExecuteNotificationNum(String executeNotificationNum) {
        this.executeNotificationNum = executeNotificationNum == null ? null : executeNotificationNum.trim();
    }

    public Date getDeliverDate() {
        return deliverDate;
    }

    public void setDeliverDate(Date deliverDate) {
        this.deliverDate = deliverDate;
    }

    public Date getLegalDocsUploadDate() {
        return legalDocsUploadDate;
    }

    public void setLegalDocsUploadDate(Date legalDocsUploadDate) {
        this.legalDocsUploadDate = legalDocsUploadDate;
    }

    public String getDicWslxKey() {
        return dicWslxKey;
    }

    public void setDicWslxKey(String dicWslxKey) {
        this.dicWslxKey = dicWslxKey == null ? null : dicWslxKey.trim();
    }

    public String getLegalDocsPath() {
        return legalDocsPath;
    }

    public void setLegalDocsPath(String legalDocsPath) {
        this.legalDocsPath = legalDocsPath == null ? null : legalDocsPath.trim();
    }

    public String getLegalDocsName() {
        return legalDocsName;
    }

    public void setLegalDocsName(String legalDocsName) {
        this.legalDocsName = legalDocsName == null ? null : legalDocsName.trim();
    }

    public Date getLegalDocsStartDate() {
        return legalDocsStartDate;
    }

    public void setLegalDocsStartDate(Date legalDocsStartDate) {
        this.legalDocsStartDate = legalDocsStartDate;
    }

    public String getOldAdministrationRecord() {
        return oldAdministrationRecord;
    }

    public void setOldAdministrationRecord(String oldAdministrationRecord) {
        this.oldAdministrationRecord = oldAdministrationRecord == null ? null : oldAdministrationRecord.trim();
    }

    public String getOldPenalRecord() {
        return oldPenalRecord;
    }

    public void setOldPenalRecord(String oldPenalRecord) {
        this.oldPenalRecord = oldPenalRecord == null ? null : oldPenalRecord.trim();
    }

	public Date getDispatchDate() {
		return dispatchDate;
	}

	public void setDispatchDate(Date dispatchDate) {
		this.dispatchDate = dispatchDate;
	}

	public String getMainDept() {
		return mainDept;
	}

	public void setMainDept(String mainDept) {
		this.mainDept = mainDept;
	}

	public String getCopyDept() {
		return copyDept;
	}

	public void setCopyDept(String copyDept) {
		this.copyDept = copyDept;
	}

	public String getDrafter() {
		return drafter;
	}

	public void setDrafter(String drafter) {
		this.drafter = drafter;
	}

	public String getPasser() {
		return passer;
	}

	public void setPasser(String passer) {
		this.passer = passer;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

  
}