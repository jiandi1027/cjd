package com.rowell.sifa.pojo.sys;

import java.util.Date;

/**
 * 北向接口查询信息--只能查询是否呼转，开关机状态,是否停机
 * @author pkx
 *
 */
public class SysBxOidd {
	
	private String telno;			//查询号码
	private String telnos;			//查询号码组，用","隔开
	private String resultCode;		//返回信息结果
	private String forwardNumber;	//呼转号码，没有开通，并没有什么用
	private String forwardStatus;	//呼转状态—1：呼转 0：无呼转
	private String accountStatus;	//用户账户状态-1：停机 0：正常
	private String activeStatus;	//开关机状态—1：开机 0：关机、2：基于时间、3、基于区域、5、参数更改、6、基于指令、7、基于距离、8、基于用户区、9、基于BCMC登记
	private Date searchTime;	//查询时间
	

	public String getTelno() {
		return telno;
	}
	public void setTelno(String telno) {
		this.telno = telno;
	}
	public String getTelnos() {
		return telnos;
	}
	public void setTelnos(String telnos) {
		this.telnos = telnos;
	}
	public String getResultCode() {
		return resultCode;
	}
	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
	public String getForwardNumber() {
		return forwardNumber;
	}
	public void setForwardNumber(String forwardNumber) {
		this.forwardNumber = forwardNumber;
	}
	public String getForwardStatus() {
		return forwardStatus;
	}
	public void setForwardStatus(String forwardStatus) {
		this.forwardStatus = forwardStatus;
	}
	public String getAccountStatus() {
		return accountStatus;
	}
	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}
	public String getActiveStatus() {
		return activeStatus;
	}
	public void setActiveStatus(String activeStatus) {
		this.activeStatus = activeStatus;
	}
	public Date getSearchTime() {
		return searchTime;
	}
	public void setSearchTime(Date searchTime) {
		this.searchTime = searchTime;
	}
}
