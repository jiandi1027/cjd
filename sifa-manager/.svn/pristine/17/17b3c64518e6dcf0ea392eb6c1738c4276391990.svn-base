<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>社区矫正人员医学司法鉴定委托书</title>
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
			&nbsp;&nbsp;
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
				社区矫正人员医学司法鉴定委托书
			</div>
			<p class="textp"
				style="font-size:19px;margin-top:20px;line-height:38px;">
				<span class="bold"><input value="" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				人民医院：
			</p>
			<p class="textp"
				style="font-size:19px;text-indent:28px;line-height:38px;">
				<span class="bold">根据《社区矫正实施办法》和我省罪犯保外就医工作的相关规定，以及当事人申请，请贵单位指派鉴定人(3人)，按照下列鉴定目的对社区矫正人员进行医学司法鉴定。</span>
			</p>
			<p class="textp"
				style="font-size:19px;text-indent:28px;line-height:38px;">
				<span class="bold">鉴定对象姓名：${culprit.name}，</span>
				<span class="bold">性别：${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}，</span>
				<span class="bold">出生日：${culprit.birthday}，</span>
				<span class="bold">文化程度：${fns:getSysDicValueByKey('common_table','whcd',culprit.dicWhcdKey,'')}，</span>
				<span class="bold">籍贯：${culprit.origin}，</span>
				<span class="bold">家庭住址：${culprit.regResidence}。</span>
			</p>

			<p class="textp"
				style="font-size:19px;;margin-top:10px;text-indent:28px;line-height:30px;">
				委托鉴定目的
				<span class="bold"><input class="easyui-validatebox" type="text" data-options="required:true" name="court" id="court" value="" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:76%;font-size:18px;" /></span>
			</p> 
			<p class="textp"
				style="font-size:19px;;margin-top:10px;line-height:30px;">
				<span class="bold"><input class="easyui-validatebox" type="text" data-options="required:true" name="court" id="court" value="" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:96%;font-size:18px;" />。</span>
			</p> 
			<p class="textp"
				style="font-size:19px;;margin-top:10px;text-indent:28px;line-height:30px;">
				请贵单位于
				<span ><input class="easyui-numberbox" type="text" data-options="required:true,min:2017"  value="${issueYear}" name="issueYear" id="issueYear" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				年
				<span ><input class="easyui-numberbox" type="text" data-options="required:true,min:1,max:12,formatter:function(value){if(value.length==1){return '0'+value}else{return value}}" value="${issueMonth}" name="issueMonth" id="issueMonth" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				月
				<span ><input class="easyui-numberbox" type="text" data-options="required:true,min:1,max:31,formatter:function(value){if(value.length==1){return '0'+value}else{return value}}" value="${issueDay}" name="issueDay" id="issueDay" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				日以前出具医学司法鉴定书。 
			</p>
			
			<p class="textp"
				style="font-size:19px;text-indent:45px;margin-top:60px;margin-right:210px;line-height:30px; text-align:right;">
				委托单位（章）：
			</p>
			<p class="textp"
				style="font-size:19px;text-indent:45px;margin-top:30px;line-height:30px; text-align:right;">
				委托日期：
				<span ><input class="easyui-numberbox" type="text" data-options="required:true,min:2017"  value="${issueYear}" name="issueYear" id="issueYear" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				年
				<span ><input class="easyui-numberbox" type="text" data-options="required:true,min:1,max:12,formatter:function(value){if(value.length==1){return '0'+value}else{return value}}" value="${issueMonth}" name="issueMonth" id="issueMonth" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				月
				<span ><input class="easyui-numberbox" type="text" data-options="required:true,min:1,max:31,formatter:function(value){if(value.length==1){return '0'+value}else{return value}}" value="${issueDay}" name="issueDay" id="issueDay" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				日
			</p>
			<p class="textp"
				style="font-size:19px;text-indent:45px;margin-top:30px;margin-right:282px;line-height:30px; text-align:right;">
				联系人：
			</p>
			<p class="textp"
				style="font-size:19px;text-indent:45px;margin-top:30px;margin-right:262px;line-height:30px; text-align:right;">
				联系电话：
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
<script type="text/javascript">
	//上报
 function submitProbationDetail(){
 	var id=$('#outOfPrisonId').val();
 	var roleId=$('#roleId').val();
 	var decideType;
	if(roleId=="3003"){//判断是司法所上报还是矫正科上报
		decideType="4";
	}else{
		decideType="5";
	}
	var issueMonth=$("#issueMonth").val();
	var issueDay=$("#issueDay").val();
	if(issueMonth.length==1){
		issueMonth="0"+issueMonth;
	}
	if(issueDay.length==1){
		issueDay="0"+issueDay;
	}
	if($('#checkValidatebox').form('validate')){
		$.ajax({
	 		type : 'get',
	 		 url : "${ctx}/dailymgr/outOfPrison/submitOutOfPrison",
	 		cache : false,
	 		async : false, //同步请求
	 		dataType : 'json',
	 		data:{
					"hospital":$("#hospital").val(),
					"identificationResults":$("#identificationResults").val(),
	 				"id":id,
	 				"decideType":decideType,
	 				"procuratorate":$("#procuratorate").val(),
	 				"police":$("#police").val(),
	 				"court":$("#court").val(),
	 				"issueYear":$("#issueYear").val(),
					"issueMonth":issueMonth,
					"issueDay":issueDay
	 			},
	 		success : function(result) {
	 			if(result.status==200){
	 				alert("上报成功！");
	 				//parent.location.reload();
	    			var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
	 			}else{
	 				alert("上报失败！");
	 			}
	 			
	 		}
	 	});
	}
 	
 	
 }
  
	//修改保存建议书
	function saveBook(){
		var id=$('#outOfPrisonId').val();
		var count=$("#court").val();
		var data={
				"id":id,
				"hospital":$("#hospital").val(),
				"identificationResults":$("#identificationResults").val(),
				"procuratorate":$("#procuratorate").val(),
				"police":$("#police").val(),
				"court":count,
				"issueYear":$("#issueYear").val(),
				"issueMonth":$("#issueMonth").val(),
				"issueDay":$("#issueDay").val()};
		$.ajax({
			type: 'post' ,
			url: "${ctx}/dailymgr/outOfPrison/saveBook",
			cache:false ,
			data:data,
			dataType:'json',
			success:function(data){
  				parent.location.reload();
      			var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
			} ,
			error:function(result){
				alert("保存失败！");
			}
		});
		
	}
  </script>
	</body>
</html>

