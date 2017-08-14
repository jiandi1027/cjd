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
	<c:choose>
 		<c:when test="${empty omittedCrime.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${omittedCrime.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="漏罪信息" style="width:100%;padding:10px;">
     		<input type="hidden" name="id" value="${omittedCrime.id}"/>
            <table width="100%">
                <tr>
                   <td>强制措施类型:</td>
							<td>${fns:getSysDicValueByKey('SF_RECIDIVISM_PERHAPS','COERCIVE_MEASURE_KEY',omittedCrime.coerciveMeasureKey,'')}</td>
					<td>强制措施时间:</td>
							<td><fmt:formatDate value="${omittedCrime.coerciveMeasureDate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>法律文书:</td>
							<td></td>
                </tr>
                <tr>
                    <td>漏罪罪名:</td>
							<td>${omittedCrime.newCrime}</td>
							<td><span class="c-red">*</span>立案单位:</td>
							<td>${omittedCrime.registerUnit}</td>
					<td>立案时间:</td>
							<td><fmt:formatDate value="${omittedCrime.registerTime}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
                <tr>
                    <td>掌握信息方式:</td>
							<td>${fns:getSysDicValueByKey('SF_RECIDIVISM_PERHAPS','DIC_GRASP_TYPE_KEY',omittedCrime.dicGraspTypeKey,'')}</td>
							<td><span class="c-red">*</span>掌握信息时间:</td>
							<td><fmt:formatDate value="${omittedCrime.graspTime}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td></td><td></td>
                </tr>
                <tr>
                    <td>漏罪情况:</td>
                    <td colspan="5" align="left">${omittedCrime.crimeDetails}</td>
                </tr>
            </table>
    </div>
    
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
    <script>
    $('#btn2').click(function(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引  
        parent.layer.close(index);  
	});
</script>
</body>
</html>
