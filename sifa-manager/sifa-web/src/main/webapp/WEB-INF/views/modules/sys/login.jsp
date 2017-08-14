<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<head>


<title></title>
</head>
<body>
<div class="header"></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
   	<form id="loginform" name="loginform" action="${ctx}/sys/login"
		method="post">
      <div class="row cl">
        <label class="form-label col-3" style="text-align: right;"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-8">
        <!-- 
          <input id="account" name="account" type="text" placeholder="账户" class="input-text size-L" value="${account}">
          <select id="account" name="account" style="width: 173px;">
          <option value="3002">3002司法所负责人</option>
          <option value="3003">3003司法所工作人员</option>
          <option value="577000">577000</option>
          <option value="2006">2006县矫正负责人</option>
          <option value="2003">2003县法制科负责人</option>
          <option value="2002">2002县分管领导</option>
          <option value="2007">2007县矫正科工作人员</option>
          </select>
         -->
         
         <input id="accountSelect" name="accountSelect" class="easyui-combobox" editable="false" style="width:173px;" value="3002" 
    	data-options="valueField:'id',textField:'value',panelHeight:'auto'">
    	<input id="account" name="account" type="text" placeholder="账户" class="input-text size-L" value="3002">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-3" style="text-align: right;"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-8">
          <input id="password" name="password" type="password" placeholder="密码" value="yate" class="input-text size-L">
        </div>
      </div>
      <%-- 
      <div class="row cl">
        <div class="formControls col-8 col-offset-3">
          <input class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
          <img
								id="randomcode_img" src="${ctx}/getValidateCode" alt=""
							/>  <a id="kanbuq" href="javascript:;">看不清，换一张</a> </div>
      </div>
      --%>
      <div class="row">
        <div class="formControls col-8 col-offset-3">
          <label for="online">
          	<span style="color: red">
          		<c:choose>
          			<c:when test="${error eq 'error.notExistAccount' }">此用户不存在！</c:when>
          			<c:when test="${error eq 'error.password' }">密码错误！</c:when>
          			<c:when test="${error eq 'error.userNameOrPassword' }">用户名或密码错误！</c:when>
          			<c:when test="${error eq 'error.randomCode' }">验证码错误！</c:when>
          			
          			<c:when test="${error eq 'error.exception' }">系统异常，登陆失败！</c:when>
          			<c:otherwise></c:otherwise>
          		</c:choose>
          	</span>
          	<%-- 
          	<input type="checkbox" name="rememberMe" />自动登陆
          	--%>
           </label>
        </div>
      </div>
      <div class="row">
        <div class="formControls col-8 col-offset-3">
          <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright </div>
<script type="text/javascript">
var DEFAULT_VERSION = "8.0";
var ua = navigator.userAgent.toLowerCase();
var isIE = ua.indexOf("msie")>-1;
var safariVersion;
if(isIE){
    safariVersion =  ua.match(/msie ([\d.]+)/)[1];
    if(safariVersion < DEFAULT_VERSION ){
	    if(confirm("你的IE浏览版本太低，请升级或者下载chome浏览器安装，再进行访问，是否下载？")){
	    	location.href="${ctxStatic}/file/Chrome_Setup.exe";
	    }
    }
}
//如果在框架或在对话框中，则弹出提示并跳转到首页
if(self.frameElement && self.frameElement.tagName == "IFRAME"){
	alert('未登录或登录超时。请重新登录，谢谢！');
	top.location = "${ctx}";
}


$('#accountSelect').combobox({    
    valueField:'id',
    textField:'value',
    
    data:[{
		id: '3002',
		value: '3002-司法所负责人'
	},{
		id: 'sfs_fzr',
		value: 'sfs_fzr-司法所负责人'
	},{
		id: '577000',
		value: '系统管理员'
	},{
		id: '3003',
		value: '3003-司法所工作人员'
	},{
		id: '2006',
		value: '2006-县矫正负责人'
	},{
		id: '2003',
		value: '2003-县法制科负责人'
	},{
		id: '2002',
		value: '2002-县分管领导'
	},{
		id: '2007',
		value: '2007-县矫正科工作人员'
	}],
	onChange:function(){
		$('#account').val($('#accountSelect').combobox('getValue'));
	}
});
</script>
</body>
</html>