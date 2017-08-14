package com.rowell.sifa.pojo.terminal;

import java.io.Serializable;

/**
 * Created by pkx on 2017-7-28.
 */
public class BaseReq implements Serializable {

    private static final long serialVersionUID = 6754639035864282934L;

    private String streamingNo;	//流水号
    private String opFlag;		//0702：终端开通
    private long timeStamp;		//当前时间戳YYYYMMDDHHMISS
    private String packageCode;	//Si所订能力的code
    
    
	public String getStreamingNo() {
		return streamingNo;
	}
	public void setStreamingNo(String streamingNo) {
		this.streamingNo = streamingNo;
	}
	public String getOpFlag() {
		return opFlag;
	}
	public void setOpFlag(String opFlag) {
		this.opFlag = opFlag;
	}
	public long getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(long timeStamp) {
		this.timeStamp = timeStamp;
	}
	public String getPackageCode() {
		return packageCode;
	}
	public void setPackageCode(String packageCode) {
		this.packageCode = packageCode;
	}
}
