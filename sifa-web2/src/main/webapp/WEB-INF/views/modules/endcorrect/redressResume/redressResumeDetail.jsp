<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>特殊原因恢复矫正</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>
<form>
	<c:choose>
 		<c:when test="${empty redressResume.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${redressResume.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="特殊原因恢复矫正信息"  style="width:100%;padding: 5px;">
     		<input type="hidden" name="id" value="${redressResume.id}"/>
            <table width="100%" class="grid">
            	<tr>
					<th width="10%">矫正恢复时间：</th>
							<td width="23%"><fmt:formatDate value="${redressResume.redressStartTime}"
									pattern="yyyy-MM-dd" /></td>
					<th width="10%">矫正恢复时间：</th>
							<td width="23%"><fmt:formatDate value="${redressResume.redressEndTime}"
									pattern="yyyy-MM-dd" /></td>
					<th width="10%">处理部门：</th>
							<td width="23%">${redressResume.examineUnitName}</td>
                </tr>
                <tr>
                    <th width="10%">恢复矫正原因：</th>
                    <td colspan="5" align="left">${redressResume.reason}</td>
                </tr>
                <tr>
                    <th width="10%">主要事实：</th>
                    <td colspan="5" align="left">${redressResume.fact}</td>
                </tr>
            </table>
            </div>      
    
    <c:if test="${not empty processDetails }">
	<div class="easyui-panel" id="p3" title="流程信息"  style="width:100%;padding:5px;margin-bottom: 10px;">
            <table width="100%" class="grid" style="text-align: center;">
                <tr>
                   <th width="15%" style="text-align: center;" >操作人</th>
                   <th width="15%" style="text-align: center;" >操作时间</th>
                   <th width="15%" style="text-align: center;" >操作环节</th>
                   <th width="15%" style="text-align: center;" >意见</th>
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
            </table>
    </div>
    </c:if>
</form>
    <script>
    $('#btn2').click(function(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引  
        parent.layer.close(index);  
	});
</script>
</body>
</html>
