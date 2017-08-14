<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/finger/save" method="post" id="fingerInfo">
<input type="hidden" name="culpritId" value="${culpritId}">
	<div class="easyui-panel" title="" style="width:100%;padding:5px;margin:0 auto;">
		<c:forEach items="${list }" var="iface">
		<div align="center" style="margin: 10px;">
		<label><input name="checkId" type="radio" value="${iface.id }" />${iface.macName } </label><br>
		</div>
		</c:forEach>
	</div>

	<div style="display: none;">
	<a id="ifaceDealBtn1" class="easyui-linkbutton" icon="fi-checkbox icon-blue">提交</a>
	</div>
</form>
<script>
$('#ifaceDealBtn1').click(function(){
	progressLoad();
	$.ajax({
		type : 'post',
		url : '${ctx}/finger/regIfaceToCp',
		data : $('#fingerInfo').serialize(),
		dataType : 'json',
		async : false,
		success : function(o) {
			progressClose();
			var result = o.msg;
			if (result == 'no') {
				info = "您选择的考勤机有误或已被删除,请重新选择发送！";
		    	$.messager.alert('提示信息', info);
			} else {
				info = "对象工号为:${culpritId},信息已发送至选择的识别仪器,请在1-2分钟后录入相关资料,如果一段时间后设备中没有该对象信息,可以手动以:${culpritId}为工号建立用户,并录入相关信息!";
		    	$.messager.alert('提示信息', info);
				parent.$.modalDialog.handler.dialog('close');
			}
		},
		error : function(result) {
           	progressClose();
			$.messager.show({
				title : result.status == 200 ? "ok" : "fail",
				msg : '考勤机信息提交失败!请联系管理员！'
			});
		}
	});
});
</script>
