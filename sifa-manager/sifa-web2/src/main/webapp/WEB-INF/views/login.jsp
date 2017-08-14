<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>用户登录-${fns:getConfig('productName') }</title>
    <link rel="stylesheet" type="text/css" href="${ctxStatic }/style/css/global.css">
    <link rel="stylesheet" type="text/css" href="${ctxStatic }/style/css/login-new.css">
    <%-- [EasyUI] --%>
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${ctxStatic }/easyui/themes/bootstrap/easyui.css" />
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${ctxStatic }/easyui/themes/icon.css" />
<%-- [jQuery] --%>
<script type="text/javascript" src="${ctxStatic }/easyui/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript"
	src="${ctxStatic}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>
	<script type="text/javascript" src="${ctxStatic }/login.js?v=20170115" charset="utf-8"></script>
    <style type="text/css">html, body, table{ width: 100%; height: 100%; }</style>
    
  
</head>
<body onkeydown="enterlogin();">
<table class="page-login">
    <tr>
        <td valign="middle">
            <div class="login-bb">
                <div class="login-box">
                    <div class="login-wrap">
                        <div class="logo-bp"><img src="${ctxStatic }/style/images/logo_bp.png"></div>
                        <div class="login-logo"><img src="${ctxStatic }/style/images/logo_logo.png"></div>
                        <div class="login-form">
                        	<form method="post" id="loginform" name="loginform">
                            <ul>
                                <li class="ft"><input name="username" type="text" placeholder="请输入用户名" autocomplete="off"/></li>
                                <li class="ft"><input name="password" type="password" placeholder="请输入密码" /></li>
                                <li class="btn"><input name="" type="button" value="登 录"  onclick="submitForm()" /></li>
                            </ul>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </td>
    </tr>
</table>
<div class="tbg"></div>
<div class="bbg"></div>

</body>
</html>
