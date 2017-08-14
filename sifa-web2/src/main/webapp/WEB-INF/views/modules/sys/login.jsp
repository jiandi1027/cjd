<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
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
          <input id="account" name="account" type="text" placeholder="账户" class="input-text size-L" value="${account}">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-3" style="text-align: right;"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-8">
          <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
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
</script>
</body>
</html>