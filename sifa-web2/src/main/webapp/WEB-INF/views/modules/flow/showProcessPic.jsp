<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:true,loadMsg: '工作流正在加载,请耐心的等待...',title:'<c:if test="${not empty processDetailUrl }">流程图</c:if>'" style="text-align: center;">
		<img alt=""  src="${ctx}/flow/ceateProcessImage?processDefinitionId=${processDefinitionId}&processInstanceId=${processInstanceId}&resourceType=png">
	</div>
	<c:if test="${not empty processDetailUrl }">
		<c:import url="${processDetailUrl}" />
	</c:if>
	
	
 </div>
