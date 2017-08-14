<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>用户登录-${fns:getConfig('productName') }</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=EmulateIE7"/>
<link href="<c:url value="/css/global.css"/>" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width">
<%@include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic }/style/css/login.css?v=201612202107" />
<script type="text/javascript" src="${ctxStatic }/login.js?v=20170115" charset="utf-8"></script>
<script src="<c:url value="/yui/yahoo-dom-event/yahoo-dom-event.js"/>" type=text/javascript></script>
<script src="<c:url value="/yui/container/container-min.js"/>" type=text/javascript></script>
<script src="<c:url value="/yui/utilities/utilities.js"/>" type=text/javascript></script>
<script src="<c:url value="/starmap/js/utils.js"/>" type=text/javascript></script>
<script src="<c:url value="/js/iepng.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/jQuery/jquery-1.4.2.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/jQuery/jquery.messager.js"/>" type="text/javascript"></script>

<OBJECT id="ePass" style="LEFT: 0px; TOP: 0px" height="0" width="0" classid="clsid:C7672410-309E-4318-8B34-016EE77D6B58" name="ePass" VIEWASTEXT> </OBJECT>
<SCRIPT language="VBScript">
sub ShowErr(Msg)
	bErr = true
	'sgBox Msg
	Document.Writeln "<FONT COLOR='#FF0000'>"
	Document.Writeln "<P>&nbsp;</P><P>&nbsp;</P><P>&nbsp;</P><P ALIGN='CENTER'><B>ERROR:</B>"
	Document.Writeln "<P>&nbsp;</P><P ALIGN='CENTER'>"
	Document.Writeln Msg
	ocument.Writeln " failed, and returns 0x" & hex(Err.number) & ".<br>"
	Document.Writeln "<P>&nbsp;</P><P>&nbsp;</P><P>&nbsp;</P>"
	Document.Writeln "</FONT>"
End Sub

function CheckKey()
	On Error Resume Next 
    ePass.GetLibVersion
    'Let detecte whether the ePass 1000ND Active Control loaded.
	'If we call any method and the Err.number be set to &H1B6, it 
	'means the ePass 1000 Safe Active Control had not be loaded.
    If Err.number = &H1B6 Then
        MsgBox "the ePass 1000ND Active Control load failed!"
        Form1.epsKeyNum.value="Bad"
        Exit function
    end if
    ePass.OpenDevice 1, ""
    If Err then
        //MsgBox "未检测到u盾,请检查"
        //Form1.epsKeyNum.value="Bad"
        ePass.CloseDevice
        CheckKey = false
        Exit function
    End if
    CheckKey = true
End function
                    
function ReadKey()
	On Error Resume Next 
	If CheckKey() = true then
		ReadKey= "NO"
		Exit function
	End If
    dim results
    epsFileContent = ""
    epsFileSize = 0
    results = ""
    results = ePass.GetStrProperty(7,0,0) 
	ReadKey= results
	ePass.CloseDevice
End function 

Function ConfirmXEnrollLoaded()
		On Error Resume Next
		ePass.GetLibVersion
		If Err.number = &H1B6 Then
			ConfirmXEnrollLoaded = false
	        Exit function
	    end if
	    ConfirmXEnrollLoaded = true
End Function
</script>
<script language="javascript">
//EvPNG.fix('div, ul, img,li');  //EvPNG.fix('包含透明PNG图片的标签'); 多个标签之间用英文逗号隔开。
function loginOn(){
	$('#type').val("0");
	$('#loginform').submit();
}

function loginOnUdun()
{
	console.log(ePass);
	//var form = document.forms.loginform;
	//var strname = $('#username').val();
	/* if(strname != '577000' && strname != 'sfsadmin' && strname.indexOf("系统") < 0 && strname.indexOf("测试") < 0 && strname != 'sfjadmin' && strname != 'admin')
	{
		alert("接市局通知，本登录地址禁用，请从综合业务平台登陆本平台！");
		return;
	}
	if(strname.indexOf("系统") >= 0 || strname.indexOf("测试") >= 0 )
	{
		var temp=ReadKey();
		(temp.length<=0 ||temp=="NO")
		{
			alert("未检测到U盾或U盾插入接触异常,请检查！");
		//alert("接市局通知，本登录地址禁用，请从综合业务平台登陆本平台！");
		    return;
		}
		form.uKey.value=temp;
	} */
	
	var temp=ReadKey();
	if(temp.length <= 0 || temp == "NO"){
		alert("未检测到U盾或U盾插入接触异常,请检查！");
	    return;
	}
	//form.uKey.value=temp;
	
	$('#uKey').val(temp);
	$('#type').val("1");
	//var vcode =form.vcode.value;
	
	$('#loginform').submit();
}

function checkUkey()
{
	//console.log("检测U盾");
	var nResult = ConfirmXEnrollLoaded();
	if (!nResult) 
	{
		var str='<div style="font-size:12px;height:150%;line-height:150%;">&nbsp;&nbsp;&nbsp;&nbsp;系统检测到您未安装U盾使用环境,请点击安装链接安装。'
				+'&nbsp;&nbsp;<a target="_blank" href="<c:url value="/sys/welcome"/>"><u><b>点击安装U盾运行环境</b></u></a></div>';
		//var str='<div style="font-size:12px;height:150%;line-height:150%;">&nbsp;&nbsp;&nbsp;&nbsp;系统检测到您未安装U盾使用环境,请先安装U盾运行环境。&nbsp;&nbsp;'
	   	//$.messager.show(0,str);
	   	$.messager.show({
				title:'提示信息!' ,
				width:'350px',
				height:'120px',
				msg:str
			});
	}
	   
}
</script></head>
<body onkeydown="enterlogin();" onload="checkUkey();">
<div class="top_div"></div>
<div style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231);border-image:none;width:400px;text-align: center;">
    <form method="post" id="loginform" name="loginform">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div style="width: 165px; height: 96px; position: absolute;">
            <div class="tou"></div>
            <div class="initial_left_hand" id="left_hand"></div>
            <div class="initial_right_hand" id="right_hand"></div>
        </div>
        <P style="padding: 30px 0px 10px; position: relative;">
            <span class="u_logo"></span>
            <input class="ipt" type="text" name="username" id="username" placeholder="请输入用户名或邮箱"/>
        </P>
        <P style="position: relative;">
            <span class="p_logo"></span>
            <input class="ipt" id="password" type="password" name="password" placeholder="请输入密码"/>
            <input name="uKey" id="uKey" value="" type="hidden" />
            <input name="type" id="type" value="0" type="hidden" />
        </P>
        <P style="padding: 10px 0px 10px; position: relative;">
            <input class="captcha" type="text" name="captcha" placeholder="请输入验证码"/>
            <img id="captcha" alt="验证码" src="${ctx}/captcha.jpg" data-src="${ctx}/captcha.jpg?t=" style="vertical-align:middle;border-radius:4px;width:94.5px;height:35px;cursor:pointer;">
        </P>
        <P style="position: relative;text-align: left;">
            <input class="rememberMe" type="checkbox" name="rememberMe" value="1" checked style="vertical-align:middle;margin-left:40px;height:20px;"/> 记住密码
        </P>
        <div style="height: 50px; line-height: 50px; margin-top: 10px;border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
            <P style="margin: 0px 35px 20px 45px;">
                <span style="float: left;">
                    <a style="color: rgb(204, 204, 204);" href="javascript:;">忘记密码?</a>
                </span>
                <span style="float: right;">
                    <a style="color: rgb(204, 204, 204); margin-right: 10px;" href="javascript:;">注册</a>
                    <a style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;" href="javascript:;" onclick="loginOn()">登录</a>
                    <a style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;" href="javascript:;" onclick="loginOnUdun()">U盾登录</a>
                </span>
            </P>
        </div>
    </form>
</div>
<div style="text-align:center;">
    <p>
        <a href="http://www.dreamlu.net/" target="_blank">${fns:getConfig('author') }</a>
        <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1256912241'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/stat.php%3Fid%3D1256912241%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
    </p>
</div>
</body>
</html>
