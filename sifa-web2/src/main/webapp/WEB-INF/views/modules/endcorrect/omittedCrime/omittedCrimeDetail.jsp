<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>漏罪</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>
<form>
	<c:choose>
 		<c:when test="${empty omittedCrime.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${omittedCrime.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="漏罪信息" style="width:100%;padding:5px;">
     		<input type="hidden" name="id" value="${omittedCrime.id}"/>
            <table width="100%" class="grid">
                <tr>
                   <th width="10%">强制措施类型:</th>
							<td width="23%">${fns:getSysDicValueByKey('SF_RECIDIVISM_PERHAPS','COERCIVE_MEASURE_KEY',omittedCrime.coerciveMeasureKey,'')}</td>
					<th width="10%">强制措施时间:</th>
							<td width="23%"><fmt:formatDate value="${omittedCrime.coerciveMeasureDate}"
									pattern="yyyy-MM-dd" /></td>
							<th width="10%">掌握信息时间:</th>
							<td width="23%"><fmt:formatDate value="${omittedCrime.graspTime}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <th width="10%">涉嫌罪名:</th>
							<td width="23%">${omittedCrime.newCrime}</td>
							<th width="10%">立案单位:</th>
							<td width="23%">${omittedCrime.registerUnit}</td>
					<th width="10%">立案时间:</th>
							<td width="23%"><fmt:formatDate value="${omittedCrime.registerTime}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <th width="10%">掌握信息方式:</th>
							<td width="23%" colspan="5">${fns:getSysDicValueByKey('SF_RECIDIVISM_PERHAPS','DIC_GRASP_TYPE_KEY',omittedCrime.dicGraspTypeKey,'')}</td>
							 
					
                </tr>
                <tr>
                    <th>漏罪情况:</th>
                    <td colspan="5" align="left">${omittedCrime.crimeDetails}</td>
                </tr>
            </table>
            </div>
    
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
</form>
</body>
</html>
