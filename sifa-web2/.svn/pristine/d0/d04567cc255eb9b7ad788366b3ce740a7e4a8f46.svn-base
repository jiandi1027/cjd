<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form>
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
            <table width="100%" class="grid">
                <tr>
                    <th width="10%">新罪名：</th>
							<td width="23%">${recidivism.newCrime}</td>
							<th width="10%">判决法院：</th>
							<td width="23%">${recidivism.judgmentCourt}</td>
					<th width="10%">判决时间：</th>
							<td width="23%"><fmt:formatDate value="${recidivism.judgmentTime }"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                	<th width="10%">立案单位：</th>
							<td width="23%">${recidivism.registerUnit}</td>
					<th width="10%">立案时间：</th>
							<td width="23%"><fmt:formatDate value="${recidivism.registerTime }"
									pattern="yyyy-MM-dd" /></td>
							<th width="10%">掌握信息时间：</th>
							<td width="23%"><fmt:formatDate value="${recidivism.graspTime }"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <th width="10%">掌握信息方式：</th>
							<td colspan="5">${fns:getSysDicValueByKey('SF_RECIDIVISM_PERHAPS','DIC_GRASP_TYPE_KEY',recidivism.dicGraspTypeKey,'')}</td>

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
    
    <script>
	$('#btn2').click(function(){
		history.go(-1);
	});
</script>

