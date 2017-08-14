package com.rowell.sifa.pojo.terminal;

import java.io.Serializable;

/**
 * Created by pkx on 2017-7-28.
 */
public class BaseRes implements Serializable {

    private static final long serialVersionUID = 6754639035864282934L;

    private String streamingNo;		//流水号
    private long timeStamp;			//时间戳YYYYMMDDHHMISS
    private String summary;			//备注：N个终端订购成功，M个终端订购失败，其中S个终端重复订购
    private String returnStatus;	//应答返回状态
    
	public String getStreamingNo() {
		return streamingNo;
	}
	public void setStreamingNo(String streamingNo) {
		this.streamingNo = streamingNo;
	}
	public long getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(long timeStamp) {
		this.timeStamp = timeStamp;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getReturnStatus() {
		return returnStatus;
	}
	public void setReturnStatus(String returnStatus) {
		this.returnStatus = returnStatus;
	}
}
