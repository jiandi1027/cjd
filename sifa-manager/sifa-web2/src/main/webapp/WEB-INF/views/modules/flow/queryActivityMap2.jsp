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
		src="${ctx}/flow/ceateProcessImage?processInstanceId=${processInstanceId}">

</body>

</html>

