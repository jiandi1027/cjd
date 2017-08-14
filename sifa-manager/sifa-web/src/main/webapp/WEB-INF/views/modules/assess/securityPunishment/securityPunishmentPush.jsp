<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引用jquery easy ui的js库及css -->
<%@include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/css/style.css" />
<style type="text/css">
 .texts{text-decoration:underline;}
</style>
<title>提请治安上报</title>
</head>
<body>
<form id="myform" action="" method="post" >
			<input type="hidden" id="id" name="id" value="${securityPunishment.id}" />
			<input type="hidden" name="taskId" value="${securityPunishment.taskId}"/>
			<input type="hidden" name="auditType" value="${securityPunishment.auditType}"/>
			<table border=0 cellSpacing=0 cellPadding=0 width="50%" align="center" bgColor=#c4d8ed>
			<tbody>
			
				<!-- 调查评估意见书   -->
	   			<tr>
					<td background="${ctxStatic}/images/r_0.gif" width="100%">
						<table cellSpacing=0 cellPadding=0 width="100%">
						<tbody>
							<TR>
								<td>&nbsp;治安管理处罚建议书</td>
								<td align=right>&nbsp;</td>
							</TR>
						</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="toptable grid" border=1 cellSpacing=1 cellPadding=4 align="center">
						<tbody>
							<tr>
								<td align="center" height="50px"><span style="font-size: 30px;">治安管理处罚建议书</span></td>
							</tr>
							<tr>
								<td>
								<p class="textp" style="font-size:19px;margin-top:3px;text-indent:28px;line-height:38px;">
								社区矫正人员<span class="texts bold">&nbsp;${securityPunishment.culprit.name}&nbsp;</span>，
								<span class="texts bold">&nbsp;${fns:getSysDicValueByKey('common_table', 'sex', securityPunishment.culprit.dicSexKey, '') }&nbsp;</span>，
								<span class="texts bold">&nbsp;<fmt:formatDate value="${securityPunishment.culprit.birthday}" pattern="yyyy年MM月dd日"/>&nbsp;</span>出生，
								<span class="texts bold">&nbsp;${securityPunishment.culprit.nation}&nbsp;</span>族，
								居住地<span class="texts bold">&nbsp;${securityPunishment.culprit.address}&nbsp;</span> ，
								户籍地<span class="texts bold">&nbsp;${securityPunishment.culprit.regResidence}&nbsp;</span>，
								身份证号码<span class="texts bold">&nbsp;${securityPunishment.culprit.identification}&nbsp;</span>。
								因<span class="texts bold">&nbsp;<c:if test="${securityPunishment.culprit.crimeInfo ne null }">
									${securityPunishment.culprit.crimeInfo}
									</c:if> <c:if test="${securityPunishment.culprit.crimeInfo eq null }">
											${securityPunishment.culprit.crimeInfo}
									</c:if> &nbsp;</span>经
								<span class="texts bold">&nbsp;${securityPunishment.culprit.dicPenalTypeKey}&nbsp;</span>于
								<span class="texts bold">&nbsp;&nbsp;</span>
								判处<span class="texts bold">&nbsp;&nbsp;</span>。
								<span class="texts bold"></span>
								经<span class="texts bold">&nbsp;</span>（公安局、监狱管理局）裁定（决定、批准）
								<span class="texts bold">&nbsp;</span>,
								在<span class="texts bold">&nbsp;&nbsp;</span>
								期间，依法实行社区矫正。社区矫正期限自<span class="texts bold">&nbsp;
								<fmt:formatDate value="${securityPunishment.culprit.redressStartDate}" pattern="yyyy年MM月dd日"/>&nbsp;</span>
								起至<span class="texts bold">&nbsp;<fmt:formatDate value="${securityPunishment.culprit.redressEndDate}" pattern="yyyy年MM月dd日"/>&nbsp;</span>止。
								</p>
								<p class="textp" style="font-size:19px;margin-top:3px;text-indent:28px;line-height:30px;">
								该社区矫正人员有违反社区矫正监督管理规定(人民法院禁止令)的行为，具体事实如下：<span class="texts bold">
								</span>
								</p>
								</td>
							</tr>
							<tr>
								<td style="padding-left: 40px;">
								<input id="concreteFacts" name="concreteFacts" data-options="multiline:true" class="easyui-textbox" required="true" 
								value="${securityPunishment.concreteFacts}" style="width:95%;height:150px;"/>
								</td>
							</tr>
							<tr>
								<td>
								<p class="textp" style="font-size:19px;;margin-top:3px;text-indent:28px;line-height:30px;">
										根据《中华人民共和国治安管理处罚法》第六十条、《社区矫正实施办法》第二十四条之规定，建议对社区矫正人员<span class="texts bold">&nbsp;${securityPunishment.culprit.name}&nbsp;</span>给予治安管理处罚。
								</p>
								<p class="textp" style="font-size:19px;;margin-top:10px;text-indent:45px;line-height:30px;">
									此致<br/>
								<span class="texts bold"><input type="text" name="publicSecurityBureau" id="publicSecurityBureau"  value="${securityPunishment.publicSecurityBureau}"
								class="easyui-validatebox" required="true" style="border:1px solid #ff0000;width:100%;font-size:18px;font-weight:bold;width:138px;" /></span>公安（分）局
								</p>
								<p class="textp" style="font-size:19px;margin-top:30px;text-align:right;height:50px;line-height:30px;">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</p>
								<p class="textp" style="font-size:19px;margin-top:30px;text-align:right;">
								<input name="issueYear" id="issueYear" value="${issueYear}" class="easyui-validatebox" required="true" 
									style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:50px;font-size:18px;font-weight:bold;" />
								年
								<input name="issueMonth" id="issueMonth" value="${issueMonth}" class="easyui-validatebox" required="true" 
									style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:30px;font-size:18px;font-weight:bold;" />
								月
								<input name="issueDay" id="issueDay" value="${issueDay}" class="easyui-validatebox" required="true" 
									style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:30px;font-size:18px;font-weight:bold;" />
								日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</p>
								<p class="textp" style="font-size:19px;margin-top:30px;line-height:30px;">
								注：抄送 <span class="texts bold">
								<input type="text" name="procuratorate" id="procuratorate" class="easyui-validatebox" required="true" value="${securityPunishment.procuratorate}"
								style="border:1px solid #ff0000;width:100%;font-size:18px;font-weight:bold;width:138px;" /></span>人民检察院。
								</p>
								</td>
							</tr>
							
						</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center">
						<c:if test="${sysAccount.roleId == '3002' || sysAccount.roleId == '3003'}">
						<input type="hidden" id="decideType" name="decideType" value="1">
						</c:if>
						<c:if test="${sysAccount.roleId == '2006' || sysAccount.roleId == '2007'}">
						<input type="hidden" id="decideType" name="decideType" value="3">
						</c:if>
					
						<a id="btn3" class="easyui-linkbutton">添加测试数据</a>
						<a id="btn1" class="easyui-linkbutton">上报</a>
						<a id="btn2" class="easyui-linkbutton">返回</a>
					</td>
				</tr>
			</tbody>
			</table>
</form>

<script type="text/javascript">
var type = 1;
function doClose(){
	parent.location.reload(); // 父页面刷新
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}

$('#btn1').click(function (){
	if ($('#myform').form('validate')) {
		var issueTime = $('#issueYear').val() + ',' + $('#issueMonth').val() + ',' + $('#issueDay').val();
		$.ajax({
			type : 'post',
			url : '${ctx}/jiangcheng/securityPunishment/securityPunishmentAudit?issueTime=' + issueTime,
			data : $('#myform').serialize(),
			dataType : 'json',
  			cache : false,
  			async : false, //同步请求
			success : function(result) {
				$.messager.show({
					title : result.status == 200 ? "ok" : "fail",
					msg : result.msg
				});

				$('#mydialog').dialog('close');
				doClose();
			},
			error : function(result) {
				$.messager.show({
					title : result.status == 200 ? "ok" : "fail",
					msg : result.msg
				});
			}
		});
	}else {
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能保存!'
		});
	}
});

$('#btn2').click(function (){
	doClose();
});


$('#btn3').click(function (){
	$('#concreteFacts').textbox("setValue",'a测试具体事实123asdXXX');
	$('#publicSecurityBureau').val('温州');
	$('#procuratorate').val('温州');
	$('#issueYear').val('2017');
	$('#issueMonth').val('4');
	$('#issueDay').val('1');
});
</script>
</body>
</html>