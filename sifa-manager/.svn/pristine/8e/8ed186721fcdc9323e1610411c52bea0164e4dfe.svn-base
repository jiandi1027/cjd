<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>口头警告管理</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>
	<c:choose>
 		<c:when test="${empty verbalWarning.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${verbalWarning.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" id="p2" title="口头警告信息" style="width:100%;padding:10px;">
            <table width="100%">
                <tr>
                    <td width="15%">违纪原因:</td>
							<td>${fns:getSysDicValueByKey('SF_WARNING_ORAL','DIC_REASON_TYPE_KEY',warningOral.dicReasonTypeKey,'')}</td>
                </tr>
                <tr>
                    <td width="15%">简要违纪情况:</td>
							<td>${warningOral.detailInfo }</td>
                </tr>
                <c:if test="${empty processDetails }">
                <tr>
	                <td align="center" colspan="5">
	                	<a id="btn2" class="easyui-linkbutton">关闭</a>
	                </td>
                </tr>
    			</c:if>
            </table>
    </div>
    <c:if test="${not empty processDetails }">
    <div class="easyui-panel" id="p3" title="流程信息" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%">
                <tr>
                   <td>操作人</td>
                   <td>操作时间</td>
                   <td>审批环节</td>
                   <td>意见</td>
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr>
                  	<td>${processDetail.createrCnName }</td>
                   <td><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                   <td>${processDetail.auditName }</td>
                   <td>${processDetail.opinion }</td>
                 
                </tr>
                 </c:forEach>
                <tr>
                <td align="center" colspan="5">
                	<a id="btn2" class="easyui-linkbutton">关闭</a>
                </td>
                </tr>
            </table>
    </div>
    </c:if>
    
</body>
<script>
	$('#btn2').click(function(){
		 var index = parent.layer.getFrameIndex(window.name); //获取窗口索引  
         parent.layer.close(index);  
	});
</script>
</html>
