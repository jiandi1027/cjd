<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div>
	 <c:choose>
 		<c:when test="${empty detached.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${detached.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" id="detached_p1" title="脱管相关信息" style="width:100%;padding:5px;">
             <table width="100%" class="grid">
                <tr>
                 	<th width="10%">脱管日期：</th><td width="23%"><fmt:formatDate value="${detached.detachedTime}" pattern="yyyy-MM-dd" /></td>
					<th width="10%">通报民警姓名：</th><td width="23%">${detached.policeName }</td>
					<th width="10%">通报机关名称：</th><td width="23%">${detached.reportUnit }</td>
                </tr>
                <tr>
                    <th>通报公安机关时间：</th><td><fmt:formatDate value="${detached.reportTime }" pattern="yyyy-MM-dd" /></td>
					<th>掌握信息时间：</th><td><fmt:formatDate value="${detached.graspTime }" pattern="yyyy-MM-dd HH:mm" /></td>
					<th>掌握信息方式：</th><td>${fns:getSysDicValueByKey('SF_RECIDIVISM_PERHAPS','DIC_GRASP_TYPE_KEY',detached.dicGraspTypeKey,'')}</td>
                </tr>
                 <tr>
                    <th width="10%">通报人：</th><td colspan="5">${detached.reportPerson }</td>
                </tr>
                <tr>
                    <th width="10%">简要描述情况：</th><td colspan="5"><textarea readOnly=true style="width:80%;height:80px;border: 0 none;">${detached.description }</textarea></td>
                </tr>
            </table>
    </div>
    
     <div class="easyui-panel" id="detached_p2" title="流程信息" style="width:100%;padding:5px;margin-bottom: 30px;">
            <table width="100%" class="grid" >
                <tr>
                   <th width="25%"  style="text-align:center;">操作人</th>
                   <th width="25%"  style="text-align:center;">操作时间</th>
                   <th width="25%"  style="text-align:center;">操作环节</th>
                   <th width="25%"  style="text-align:center;">意见</th>
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr style="text-align:center;">
                  	<td>${processDetail.createrCnName }</td>
                   <td><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                   <td>${processDetail.auditName }</td>
                   <td>
                   		<c:choose>
                   		<c:when test="${processDetail.dicDecideType eq 1 }">同意</c:when>
                   		<c:when test="${processDetail.dicDecideType eq 2 }">退回</c:when>
                   		<c:when test="${processDetail.dicDecideType eq 3 }">不同意</c:when>
                   		</c:choose>
                   </td>
                 
                </tr>
                 </c:forEach>
            </table>
    </div>
</div>