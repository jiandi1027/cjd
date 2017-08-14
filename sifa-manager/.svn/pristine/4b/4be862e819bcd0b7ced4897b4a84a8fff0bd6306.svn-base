/*
* ProcessDetail.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-03-18 created
*/
package com.rowell.sifa.pojo.flow;

import java.io.Serializable;

import com.rowell.sifa.pojo.base.DataEntity;

/**
 *   流程审批详情
* @Author marcle
* @version 1.0 2017-03-18
 */
public class ProcessDetail extends DataEntity<ProcessDetail> implements Serializable {
  

      
	    /**  
	    * @Fields field:field:{todo}(用一句话描述这个变量表示什么)  
	    */  
	    
	private static final long serialVersionUID = -5210885071051854512L;

	/**流程实例id */
    private String processId;

    /**意见 */
    private String opinion;

    /**质量评分 */
    private String optScore;
    
    /**执法评分 */
    private String zfScore;

    /**决定 */
    private String dicDecideType;

    /**评分类型(县矫正科司法局评分等) */
    private String dicSorceType;
    
    private String auditName;
    /***流程定义主键***/
    private String processDefKey;

    

    public String getZfScore() {
		return zfScore;
	}

	public void setZfScore(String zfScore) {
		this.zfScore = zfScore;
	}

	public String getProcessId() {
        return processId;
    }

    public void setProcessId(String processId) {
        this.processId = processId == null ? null : processId.trim();
    }

    public String getOpinion() {
        return opinion;
    }

    public void setOpinion(String opinion) {
        this.opinion = opinion == null ? null : opinion.trim();
    }

    public String getOptScore() {
        return optScore;
    }

    public void setOptScore(String optScore) {
        this.optScore = optScore == null ? null : optScore.trim();
    }

    public String getDicDecideType() {
        return dicDecideType;
    }

    public void setDicDecideType(String dicDecideType) {
        this.dicDecideType = dicDecideType == null ? null : dicDecideType.trim();
    }

    public String getDicSorceType() {
        return dicSorceType;
    }

    public void setDicSorceType(String dicSorceType) {
        this.dicSorceType = dicSorceType == null ? null : dicSorceType.trim();
    }

	public String getAuditName() {
		return auditName;
	}

	public void setAuditName(String auditName) {
		this.auditName = auditName;
	}

	public String getProcessDefKey() {
		return processDefKey;
	}

	public void setProcessDefKey(String processDefKey) {
		this.processDefKey = processDefKey;
	}

  
}