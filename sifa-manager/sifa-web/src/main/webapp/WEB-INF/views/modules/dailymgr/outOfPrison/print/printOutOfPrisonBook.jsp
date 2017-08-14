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
			<input type="hidden"  id="roleId" value="${sysAccount.roleId}"/>
			<c:if test="${sysAccount.roleId eq '3003' || sysAccount.roleId eq '2007'}">
				<c:if test="${detail ne '1'}">
         		<input type="button" value="上报" onclick="submitProbationDetail()"/>
         		</c:if>
         	</c:if>
         	<c:if test="${sysAccount.roleId eq '2006' || sysAccount.roleId eq '2002'
         			|| sysAccount.roleId eq '2003'|| sysAccount.roleId eq '1003'
         			|| sysAccount.roleId eq '1006'|| sysAccount.roleId eq '1002'
         			|| sysAccount.roleId eq '1004'}">
         		<c:if test="${detail ne '1'}">
         			<input type="button" value="保存" onclick="saveBook()"/>
         		</c:if>
         	</c:if>
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
				延长暂予监外执行建议书 
			</div>
			<p><input type="text" style="display:none" id="outOfPrisonId" value="${outOfPrison.id}" /></p>
			<p class="textp"
				style="font-size:19px;margin-top:20px; text-align:right;">
				${model.writNum}&nbsp;
			</p>
			<p class="textp"
				style="font-size:19px;margin-top:3px;text-indent:28px;line-height:38px;">
				社区矫正人员
				<span class="bold">${culprit.name }</span>，
				<span class="bold">${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}</span>，
				<span class="bold">汉族</span>，
				<span class="bold"><input value="" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>出生，
				<span class="bold">${culprit.nation }</span>， 居住地：
				<span class="bold">${culprit.address }</span>，
				户籍地：
				<span class="bold">${culprit.regResidence }</span>
				。 因
				<span class="bold">${culpritJudgment.crimeInfo }</span>
				经
				<span class="bold">${culpritJudgment.adjudgeOrg }</span>
				于 
				<span class="bold"></span>
				以 
				<span class="bold"></span>
				刑事判决书判处
				<span class="bold"></span>
				，缓刑
				${culpritJudgment.adjudgeOrg }
				， 附加
				${culpritJudgment.accessoryPunishment }
				，刑期
				${culpritJudgment.adjudgePeriod }年
				<span class="bold"><input value="" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>止。
				<fmt:formatDate value="${outOfPrison.startDate}"
									pattern="yyyy-MM-dd" />
				由浙江省监狱管理局决定暂予监外执行。在暂予监外执行期间，依法实行社区矫正。暂予监外执行期限自 
				<fmt:formatDate value="${outOfPrison.startDate}"
									pattern="yyyy-MM-dd" />
				起至<fmt:formatDate value="${outOfPrison.endDate}"
									pattern="yyyy-MM-dd" />止。
				现暂予监外执行期满，经委托
				<span class="bold"><input name="hospital" id="hospital" value="${outOfPrison.hospital}" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				医院进行医学司法鉴定，鉴定结果如下：
				<input class="easyui-validatebox" type="text" data-options="required:true"  name="identificationResults" id="identificationResults" value="${outOfPrison.identificationResults}"
				style="font-size:19px;text-align:left;width:620px;height:100px;border:1px solid #ff0000;"/>
			</p>

			<p class="textp"
				style="font-size:19px;;margin-top:3px;text-indent:28px;line-height:30px;">
				 根据《罪犯保外就医疾病伤残范围》与浙司〔2007〕216号《关于罪犯保外就医病残鉴定的适用意见》，建议延长社区矫正人员
				<span class="bold">${culprit.name}</span>暂予监外执行期限自 起至 止。 
			</p>
			<p class="textp"
				style="font-size:19px;;margin-top:10px;text-indent:45px;line-height:30px;">
				此致
				<br />
				<span class="bold"><input class="easyui-validatebox" type="text" data-options="required:true" name="court" id="court" value="${outOfPrison.court}" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
			人民法院（公安局、监狱管理局）
			</p>

			<p class="textp"
				style="font-size:19px;margin-top:30px;text-align:right;">
				<span ><input class="easyui-numberbox" type="text" data-options="required:true,min:2017"  value="${issueYear}" name="issueYear" id="issueYear" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				年
				<span ><input class="easyui-numberbox" type="text" data-options="required:true,min:1,max:12,formatter:function(value){if(value.length==1){return '0'+value}else{return value}}" value="${issueMonth}" name="issueMonth" id="issueMonth" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				月
				<span ><input class="easyui-numberbox" type="text" data-options="required:true,min:1,max:31,formatter:function(value){if(value.length==1){return '0'+value}else{return value}}" value="${issueDay}" name="issueDay" id="issueDay" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
				日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</p>
			<p class="textp"
				style="font-size:19px;margin-top:30px;line-height:30px;">
				抄送：
				<span class="bold"><input name="procuratorate" id="procuratorate" value="${outOfPrison.procuratorate}" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
			人民检察院，
				<span class="bold"><input name="police" id="police" value="${outOfPrison.police}" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
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

