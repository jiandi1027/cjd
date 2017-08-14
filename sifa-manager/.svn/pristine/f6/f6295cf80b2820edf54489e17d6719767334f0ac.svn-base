<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
	td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;text-align:center;}
	table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>

     <div class="easyui-panel" title="" style="width:100%;margin-bottom: 30px;padding:5px;">
            <table width="100%" class="grid">
                <tr>
                    <th width="10%">公文标题：</th>
					<td >${sender.documentTitle }</td>
					<th width="10%">公文状态：</th>
							<td >${sender.state }</td>
                </tr>
                <tr>
                	<th >发件单位：</th>
					<td >${sender.sendUnit }</td>
					<th >收件单位：</th>
							<td>${sender.receiverUnit }</td>
                </tr>
                <tr>
                	<th>公文附件：</th>
							<td  width="23%" style="border-right-style:none" colspan="3">
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
                	<th>公文内容：</th>
							<td colspan="3"><input class="easyui-textbox" data-options="multiline:true" value="${receipt.flle1 }" style="width:400px;height:100px"> </td>
                
                </tr>
                
            </table>
    </div> 

 
</body>
</html>
