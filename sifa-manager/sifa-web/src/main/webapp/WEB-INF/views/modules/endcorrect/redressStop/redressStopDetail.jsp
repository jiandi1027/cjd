<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>特殊情况矫正终止</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td {
	border: solid #add9c0;
	border-width: 0px 1px 1px 0px;
	padding: 10px 0px;
	text-align: center;
}

table {
	border: solid #add9c0;
	border-width: 1px 0px 0px 1px;
}
</style>
</head>

<body>
<form id="submitReportForm">
<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${redressStop.culpritId}" formId="submitReportForm" isSelect="false"/>
</form>
	<div class="easyui-panel" id="p2" title="矫正终止信息"
		style="width: 100%; padding: 10px;">
		<table width="100%">
			<tr>  
				<td width="10%">终止矫正日期</td>
				<td width="20%"><fmt:formatDate value="${redressStop.jjrq}"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td width="10%">终止矫正原因</td>
				<td width="30%">${redressStop.jjsm }</td>
				<td width="10%">采取的措施和处理结果</td>
				<td width="20%">${redressStop.measure }</td>
			</tr>
		</table>
	</div>
	<div class="easyui-panel" id="p3" title="流程信息"
		style="width: 100%; padding: 10px; margin-bottom: 30px;">
		<table width="100%">
			<tr>
				<td>操作人</td>
				<td>操作时间</td>
				<td>审批环节</td>
				<td>审批结果</td>
				<td>审批意见</td>
			</tr>
			<c:forEach items="${processDetails}" var="processDetail">
				<tr>
					<td>${processDetail.createrCnName }</td>
					<td><fmt:formatDate value="${processDetail.created }"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${processDetail.auditName }</td>
					<c:if test="${processDetail.dicDecideType==1 }" >
						<td>同意</td>
					</c:if>
					<c:if test="${processDetail.dicDecideType==2 }" >
						<td>退回</td>
					</c:if>
					<c:if test="${processDetail.dicDecideType==0 }" >
						<td>不同意</td>
					</c:if>
					<td>${processDetail.opinion }</td>


				</tr>
			</c:forEach>

		</table>
	</div>
    <div style="text-align: center;">
    	<a href="#" class="easyui-linkbutton" onclick="doClose()">关闭</a>
    </diV>
</body>

<script type="text/javascript">
function doClose(){
	parent.location.reload(); // 父页面刷新
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}
</script>
</html>
