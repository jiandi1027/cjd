
package com.rowell.sifa.pojo.homepage;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.DataEntity;

/**
 * 
 * 收件实体类
 * 
 * @Author marcle
 * @version 1.0 2017-
 **/
@SuppressWarnings("serial")
public class Sender extends DataEntity<Sender> implements Serializable {

	/** 发件单位 */
	private String sendUnit;

	/** 收件单位 */
	private String receiverUnit;

	/** 公文标题 */
	private String documentTitle;

	/** 发件时间 */
	@JsonFormat(pattern = "yyyy-MM-dd") 
	private Date takeTime;

	/** 状态 */
	private String state;
	
	/** 发送状态 */
	private String state1;
	
	/** 草稿 */
	private String state2;

	/** 创建时间 */
	@JsonFormat(pattern = "yyyy-MM-dd") 
	private Date creationTime;

	/** 附件1 */
	private String flle1;

	/** 附件2 */
	private String flle2;

	/** 附件3 */
	private String flle3;

	private String mark;
	
	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}
	public String getState2() {
		return state2;
	}

	public void setState2(String state2) {
		this.state2 = state2;
	}

	public String getState1() {
		return state1;
	}

	public void setState1(String state1) {
		this.state1 = state1;
	}

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

	public Date getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}

	public String getFlle1() {
		return flle1;
	}

	public void setFlle1(String flle1) {
		this.flle1 = flle1 == null ? null : flle1.trim();
	}

	public String getFlle2() {
		return flle2;
	}

	public void setFlle2(String flle2) {
		this.flle2 = flle2 == null ? null : flle2.trim();
	}

	public String getFlle3() {
		return flle3;
	}

	public void setFlle3(String flle3) {
		this.flle3 = flle3 == null ? null : flle3.trim();
	}
}