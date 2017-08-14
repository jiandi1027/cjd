<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>延长暂予监外执行建议书</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
			body 
			{
				margin: 0 2px;
				padding: 0;
				font-family : FangSong_GB2312;
				font-size: 16px;
			}

			div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,textarea,p,blockquote,th,td,select
			{
				margin: 0;
				padding: 0;
				margin-right: auto; 
				margin-left: auto;
			}
			.in
			{
				font-weight:bold;
				border-left:0px;
				border-top:0px;
				border-right:0px;
				border-bottom:1px solid #ff0000;
				width:30px;
				font-size:18px;"
			}
			.content 
			{
				margin-top: 40px ;
				width: 165mm;
				height: 244mm;
				border: 0;
				
				margin-right: auto; 
				margin-left: auto;
			}
			.left 
			{
				display:table; 
				float: left; 
				text-align: center;
				line-height: 150%;
				border-right: 1px solid;
				border-bottom: 1px solid;
			}
			.bold{
			text-align:center;
			}
		</style>
<style media="print">
			.noprint {
				display: none;
			}
			nav,aside{
				display: none;
			}	
			@page {
      		size: auto;  /* auto is the initial value */
      		margin: 0mm; /* this affects the margin in the printer settings */
    		}
</style>
	</head>
	<body>
		<div class="easyui-panel"  style="width: 100%;height: 100%;fit:true;left:10px;"   >
		<form id="checkValidatebox">
		<div id="idControls" style="text-align:center;margin-top:10px;"
			class="noprint">
			<input type="button" value="打印当前页"
				onclick="printdiv('content');">
			&nbsp;&nbsp;注：红色下划线处可输入内容
			<div id="plusCheck" style="display: none">
				<br>
				安装IE加载项;或者直接点击
				<a href="javascript:loadFile('/file/ScriptXClientKit.msi')">下载安装</a>
			</div>
		</div>
		<div class="content" id="content">
			<div class="title" style="font-size:30px;margin-top:20px;text-align: center;">
				收监执行建议书 
			</div>
			<p><input type="text" style="display:none" id="outOfPrisonId" value="${outOfPrison.id}" /></p>
			<p class="textp"
				style="font-size:19px;margin-top:20px; text-align:right;">
				${imprison.writNum}&nbsp;
			</p>
			<p class="textp"
				style="font-size:19px;margin-top:3px;text-indent:28px;line-height:38px;">
				社区矫正人员
				<span class="bold">${culprit.name }</span>，
				<span class="bold">${culprit.dicSexKey}</span>，
				<span class="bold">汉族</span>，
				<span class="bold"><input value="" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>出生，
				<span class="bold">${culprit.nation }</span>， 居住地：
				<span class="bold">${culprit.address }</span>，
				户籍地：
				<span class="bold">${culprit.regResidence }</span>
				。 因
				<span class="bold"><input value="" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				经
				<span class="bold"><input value="" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				于 
				<span class="bold"><input value="" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				以 
				<span class="bold"><input value="" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				刑事判决书判处
				<span class="bold"><input value="" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				，缓刑
				<input value="" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" />
				， 附加
				<span class="bold"><input value="" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				，刑期
				<span class="bold"><input value="" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				至
				<span class="bold"><input value="" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>止。
				<%-- <fmt:formatDate value="${imprison.startDate}"
									pattern="yyyy-MM-dd" /> --%>
				由浙江省监狱管理局决定暂予监外执行。在暂予监外执行期间，依法实行社区矫正。暂予监外执行期限自 
				<%-- <fmt:formatDate value="${imprison.startDate}"
									pattern="yyyy-MM-dd" /> --%>
				起至<%-- <fmt:formatDate value="${imprison.endDate}"
									pattern="yyyy-MM-dd" />止。 --%>
			</p>
			<p class="textp"
				style="font-size:19px;;margin-top:3px;text-indent:28px;line-height:30px;">
				该社区矫正人员有违反法律（行政法规、社区矫正监督管理规定）的行为，具体事实如下：
				<span class="bold">${imprison.concreteFacts}</span>
			</p>
			<p class="textp"
				style="font-size:19px;;margin-top:3px;text-indent:28px;line-height:30px;">
				 根据《中华人民共和国刑事诉讼法》第二百五十七条、《社区矫正实施办法》第二十六条之规定，建议对社区矫正人员
				<span class="bold">${culprit.name}</span>收监执行刑罚。
			</p>
			<p class="textp"
				style="font-size:19px;;margin-top:10px;text-indent:45px;line-height:30px;">
				此致
				<br />
				<span class="bold"><input class="easyui-validatebox" type="text" data-options="required:true" name="peopleCount" id="court" value="${imprison.peopleCount}" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
			人民法院（公安局、监狱管理局）
			</p>

			<p class="textp"
				style="font-size:19px;margin-top:30px;text-align:right;">
				<span >${issueYear}</span>
				年
				<span >${issueMonth}</span>
				月
				<span >${issueDay}</span>
				日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</p>
			<p class="textp"
				style="font-size:19px;margin-top:30px;line-height:30px;">
				抄送：
				<span class="bold">${imprison.procuratorate}</span>
			人民检察院，
				<span class="bold">${imprison.publicSecurityBureau}</span>
			公安（分）局。
			</p>
		</div>
	</form>
</div>	
   
<script language="javascript"> 
//打印
function printdiv(printpage) 
{ 	
	var headstr = "<html><head><title></title>"+
		"<style media='print'>.noprint {display: none;}nav,aside{display: none;}@page {size: auto;margin: 0mm;}</style>"
		+"<style type='text/css'>body {margin: 40px 40px;padding: 0;font-family : FangSong_GB2312;font-size: 16px;}</style>"+"</head><body>"; 
	var footstr = "</body>"; 
	var newstr = document.all.item(printpage).innerHTML; 
	var oldstr = document.body.innerHTML; 
	document.body.innerHTML = headstr+newstr+footstr; 
	window.print(); 
	document.body.innerHTML = oldstr; 
	return false; 
} 
</script>
</body>
</html>

