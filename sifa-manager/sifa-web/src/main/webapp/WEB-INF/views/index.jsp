<!DOCTYPE HTML>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>${fns:getConfig('productName')}</title>
<script type="text/javascript" src="${ctxStatic}/js/echarts.js"></script>
<%@include file="/WEB-INF/views/include/head.jsp" %>	
<style type="text/css">
a {
	color: Black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}
</style>

</head>
<body id="indexLayout" class="easyui-layout">
	<div region="north" class="logo" style="height:45px;padding: 1px; overflow: hidden; background: url(${ctxStatic}/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体" href="${ctx}/north"></div>
	<!--  <div region="east" title="当前日期" split="true" collapsed="false" style="width:200px;overflow: hidden;" href="layout/east.jsp"></div>
	-->
	<div region="center"  style="overflow: hidden;" href="${ctx}/center"></div>
	<div region="west" title="功能导航" split="false" style="width:190px;overflow: hidden;" href="${ctx}/west"></div>
	<div region="south" style="height:20px;overflow: hidden;" href="${ctx}/south"></div>
	<jsp:include page="/WEB-INF/views/include/isIe.jsp"></jsp:include>
	<input type="hidden" id="top" name="top"/>
</body>
</html>
</html>
