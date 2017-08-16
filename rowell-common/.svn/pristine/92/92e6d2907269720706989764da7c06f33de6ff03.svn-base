package com.rowell.common.pojo;
/***
 * easyui 通用返回结果
 * @author xiaoguang
 *
 */
public class EasyUiCommonResult {
	/**消息内容***/
	private String msg;
	/**是否错误**/
	private Boolean isError;
	/**是否成功****/
	private Boolean success;
	   // 响应中的数据
    private Object data;
    
    public static EasyUiCommonResult ok(Object data) {
        return new EasyUiCommonResult(data);
    }

    public static EasyUiCommonResult ok() {
        return new EasyUiCommonResult(null);
    }

    public EasyUiCommonResult() {

    }

	public EasyUiCommonResult(Object data) {
		super();
		this.data = data;
		isError=false;
		success=true;
	}
	
	public EasyUiCommonResult(String msg, Boolean isError, Object data) {
		super();
		this.msg = msg;
		this.isError = isError;
		this.success = !isError;
		this.data = data;
	}
	

	public EasyUiCommonResult(Boolean isError) {
		super();
		this.isError = isError;
	}

	public static EasyUiCommonResult build(Boolean isError){
		return new EasyUiCommonResult(null,isError,null);
	}
	public static EasyUiCommonResult build(String msg){
		return new EasyUiCommonResult(msg,false,null);
	}
	
	public static EasyUiCommonResult build(Boolean isError,String msg){
		return new EasyUiCommonResult(msg,isError,null);
	}
	
	public static EasyUiCommonResult build(Boolean isError,String msg,Object data){
		return new EasyUiCommonResult(msg,isError,data);
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Boolean getIsError() {
		return isError;
	}

	public void setIsError(Boolean isError) {
		this.isError = isError;
	}

	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
	
    
    
	
    
}
