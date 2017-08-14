<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>动态流程图</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<%@include file="/WEB-INF/views/include/head.jsp" %>

</head>
<body>
	<!-- 流程图 -->
	<img style="position: absolute; top: 0px; left: 0px;"
		src="${ctx}/flow/queryProcessDefinitionResource?processDefinitionId=${processDefinitionId}&resourceType=png">


	<!-- 流程图中当前活动框 -->
	<div
		style="position: absolute;border:1px solid red;width: ${activity_width }px;height:${activity_height }px;top:${activity_y }px;left: ${activity_x }px;"></div>

</body>

</html>

