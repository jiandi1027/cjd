<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>思想汇报</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>
	<c:choose>
 		<c:when test="${empty thinkReport.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${thinkReport.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="思想汇报" style="width:100%;padding:10px;">
     <input type="hidden" name="id" value="${thinkReport.id}"/>
            <table width="100%">
                <tr>
                    <td>汇报方式:</td>
							<td>${fns:getSysDicValueByKey('SF_THINK_REPORT','DIC_REPORT_TYPE_KEY',thinkReport.dicReportTypeKey,'')}</td>
		                    <td>汇报状态:</td>
							<td>${fns:getSysDicValueByKey('SF_THINK_REPORT','DIC_REPORT_STATUS_KEY',thinkReport.dicReportStatusKey,'')}</td>
					<td><span class="c-red">*</span>汇报日期:</td>
							<td><fmt:formatDate value="${thinkReport.reportDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
                <tr>
	                <td align="center" colspan="6">
	                	<a id="btn2" class="easyui-linkbutton">关闭</a>
	                </td>
                </tr>
            </table>
    </div>
    

    
    <script>
    $('#btn2').click(function(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引  
        parent.layer.close(index);  
	});
</script>
</body>
</html>
