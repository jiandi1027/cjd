<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>报到记录</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>
	<c:choose>
 		<c:when test="${empty dailyReport.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${dailyReport.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="报到记录" style="width:100%;padding:10px;">
     <input type="hidden" name="id" value="${dailyReport.id}"/>
            <table width="100%">
                <tr>
                	<td>报到时间:</td>
							<td><fmt:formatDate value="${dailyReport.reportDate }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                    <td><span class="c-red">*</span>报到方式:</td>
							<td>${fns:getSysDicValueByKey('SF_DAILY_REPORT','DIC_TYPE_KEY',dailyReport.dicTypeKey,'')}</td>
							<td>是否按时:</td>
							<td><c:if test="${dailyReport.dicOnscheduleKey==1}">是</c:if>  　<c:if test="${dailyReport.dicOnscheduleKey==0}">否</c:if> </td>
					
                </tr>
				<tr>
                    <td>备注:</td>
                    <td colspan="5" align="left">${dailyReport.note}</td>
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
