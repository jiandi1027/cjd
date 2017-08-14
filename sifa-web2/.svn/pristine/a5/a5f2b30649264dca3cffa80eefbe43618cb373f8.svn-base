<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>口头警告管理</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
<form>
	<c:choose>
 		<c:when test="${empty verbalWarning.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${verbalWarning.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    

     <div class="easyui-panel" title="口头警告信息" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
                <tr>
                    <th width="10%">违纪原因：</th>
							<td>${fns:getSysDicValueByKey('SF_WARNING_ORAL','DIC_REASON_TYPE_KEY',warningOral.dicReasonTypeKey,'')}</td>
                </tr>
                <tr>
                    <th width="10%" align="left">简要违纪情况：</th>
							<td><textArea id="note" readonly="readonly" name="note" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					>${warningOral.detailInfo }</textArea></td>
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
</body>

</html>
