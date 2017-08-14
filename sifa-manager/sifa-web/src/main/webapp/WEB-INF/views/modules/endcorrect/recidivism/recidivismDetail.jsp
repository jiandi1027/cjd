<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>涉嫌重新犯罪</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>
	<c:choose>
 		<c:when test="${empty recidivism.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${recidivism.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="重新犯罪" style="width:100%;padding:10px;">
     <input type="hidden" name="id" value="${recidivism.id}"/>
            <table width="100%">
                <tr>
                    <td>>新罪名:</td>
							<td>${recidivism.newCrime}</td>
							<td>判决法院:</td>
							<td>${recidivism.judgmentCourt}</td>
					<td>判决时间:</td>
							<td><fmt:formatDate value="${recidivism.judgmentTime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
                <tr>
                	<td>立案单位:</td>
							<td>${recidivism.registerUnit}</td>
					<td><span class="c-red">*</span>立案时间:</td>
							<td><fmt:formatDate value="${recidivism.registerTime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><span class="c-red">*</span>掌握信息时间:</td>
							<td><fmt:formatDate value="${recidivism.graspTime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>掌握信息方式:</td>
							<td>${fns:getSysDicValueByKey('SF_RECIDIVISM_PERHAPS','DIC_GRASP_TYPE_KEY',recidivism.dicGraspTypeKey,'')}</td>
							<td colspan="5"></td>

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
    
    <script>
	$('#btn2').click(function(){
		history.go(-1);
	});
</script>
</body>
</html>
