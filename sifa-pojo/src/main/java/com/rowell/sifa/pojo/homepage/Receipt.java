package com.rowell.sifa.pojo.homepage;


import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.DataEntity;

@SuppressWarnings("serial")
public class Receipt extends DataEntity<Receipt> implements Serializable {
    /**发件单位 */
    private String sendUnit;

    /**收件单位 */
    private String receiverUnit;

    /**公文标题 */
    private String documentTitle;

    /**发件时间 */
    @JsonFormat(pattern = "yyyy-MM-dd") 
    private Date takeTime;

    /**状态 */
    private String state;



    public String getSendUnit() {
        return sendUnit;
    }

    public void setSendUnit(String sendUnit) {
        this.sendUnit = sendUnit == null ? null : sendUnit.trim();
    }

    public String getReceiverUnit() {
        return receiverUnit;
    }

    public void setReceiverUnit(String receiverUnit) {
        this.receiverUnit = receiverUnit == null ? null : receiverUnit.trim();
    }

    public String getDocumentTitle() {
        return documentTitle;
    }

    public void setDocumentTitle(String documentTitle) {
        this.documentTitle = documentTitle == null ? null : documentTitle.trim();
    }

    public Date getTakeTime() {
        return takeTime;
    }

    public void setTakeTime(Date takeTime) {
        this.takeTime = takeTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }
}