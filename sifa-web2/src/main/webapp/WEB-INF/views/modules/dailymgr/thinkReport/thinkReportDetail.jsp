<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<form>
	<c:choose>
 		<c:when test="${empty thinkReport.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${thinkReport.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="思想汇报" style="width:100%;padding:5px;">
     <input type="hidden" name="id" value="${thinkReport.id}"/>
            <table width="100%" class="grid">
                <tr>
                    <th width="10%">汇报方式：</th>
							<td width="23%">${fns:getSysDicValueByKey('SF_THINK_REPORT','DIC_REPORT_TYPE_KEY',thinkReport.dicReportTypeKey,'')}</td>
		                    <th width="10%">汇报状态：</th>
							<td width="23%">${fns:getSysDicValueByKey('SF_THINK_REPORT','DIC_REPORT_STATUS_KEY',thinkReport.dicReportStatusKey,'')}</td>
					<th width="10%">汇报日期：</th>
							<td width="23%"><fmt:formatDate value="${thinkReport.reportDate}" pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
							<th width="10%">考核人：</th>
							<td width="23%" colspan="5">${thinkReport.assessManager}</td>
                </tr>
                <tr>
                    <th width="10%">备注：</th>
                    <td colspan="5" align="left">
                   <textArea id="note" readonly="readonly" name="note" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					>${thinkReport.note }</textArea>
                    </td>
                </tr>
                <tr>
                    <th width="10%">附件：</th>
                    <td colspan="5" align="left" width="89%">
                    	<div id="uploader"></div>
						<div id="wtdchUploadIng">
						<c:forEach var="sysFile" items="${fileList}">
						${sysFile.originName}
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</c:forEach>
						</div>
						
                    </td>
                </tr>
            </table>
    </div>
</form>

