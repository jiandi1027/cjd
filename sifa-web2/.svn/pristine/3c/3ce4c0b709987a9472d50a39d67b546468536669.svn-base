<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
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

	<div class="easyui-panel" title=""
		style="width: 100%;  margin-bottom: 30px;padding:5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">公告标题：</th>
				<td width="23%">${announcement.announcementTopic }</td>
				<th width="10%">发件人：</th>
				<td>${announcement.releasePeople }</td>
				<th width="10%">发布时间：</th>
				<td width="23%"><fmt:formatDate value="${announcement.releaseDate }"
									pattern="yyyy-MM-dd HH:mm:ss" />
				
			</tr>
			<tr>
				<th width="10%">附件下载：</th>
			<td  width="23%" style="border-right-style:none" colspan="5">
				<div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList}">
				<div id="file_${sysFile.id}">
					${sysFile.originName}
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
				</div>
				</td>
			</tr>
			<tr>
				<th width="10%">公告内容：</th>
				<td width="23%">
				<input class="easyui-textbox" data-options="multiline:true" value="${announcement.announcement }" style="width:400px;height:100px">
				</td>
			</tr>
			  <tr style="display:none;" >
				<td colspan="5" align="center">

					<a id="draftPrint1" class="easyui-linkbutton" >关闭</a>
				</td>
			</tr>
		</table>
	</div>


</body>
</html>
