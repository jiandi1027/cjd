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
 		<c:when test="${empty redressResume.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${redressResume.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="特殊原因恢复矫正信息" style="width:100%;padding:10px;">
     		<input type="hidden" name="id" value="${redressResume.id}"/>
            <table width="100%">
            	<tr>
					<td>矫正恢复时间:</td>
							<td><fmt:formatDate value="${redressResume.redressStartTime}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>矫正恢复时间:</td>
							<td><fmt:formatDate value="${redressResume.redressEndTime}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>处理部门:</td>
							<td>${redressResume.examineUnit}</td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>恢复矫正原因:</td>
                    <td colspan="5" align="left">${redressResume.reason}</td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>主要事实:</td>
                    <td colspan="5" align="left">${redressResume.fact}</td>
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
