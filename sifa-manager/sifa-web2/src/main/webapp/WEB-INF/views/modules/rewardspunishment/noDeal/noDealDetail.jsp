<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

 <form>
 	<c:choose>
 		<c:when test="${empty noDeal.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${noDeal.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
   
    <div class="easyui-panel" title="基本信息" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
           
				<tr>
					<th width="10%">违纪时间：</th>
					<td width="23%"><fmt:formatDate value="${noDeal.disciplinaryTime}"
									pattern="yyyy-MM-dd" />
					</td>
					<th width="10%">处理时间：</th>
					<td width="23%"><fmt:formatDate value="${noDeal.processingTime}"
									pattern="yyyy-MM-dd" />
					</td>
					<th width="10%">事项提醒类型：</th>
							<td width="23%">
							${fns:getSysDicValueByKey('SF_NO_DEAL','EVENT_REMINDER_TYPE',noDeal.eventReminderType,'')}

					</td>
					</tr>
				<tr>
					<th width="10%">不予处理原因：</th>
					<td>
					${fns:getSysDicValueByKey('SF_NO_DEAL','REASON',noDeal.reason,'')}
					</td>
					<th width="10%">处理人：</th>
					<td>${noDeal.processingPeople}
					</td>
					<th width="10%">处理人电话：</th>
					<td>
					${noDeal.processingTelephone}
					</td>
				</tr>
				<tr>
                    <th>具体原因：</th>
                    <td colspan="5" align="left">${noDeal.specificReasons}</td>
                </tr>
                <tr>
                    <th>详细描述：</th>
                    <td colspan="5" align="left">${noDeal.description}</td>
                </tr>
            </table>
     </div>
     
            <c:if test="${not empty noDeal.rectificationMan }">
            <div class="easyui-panel" title="整改信息" style="width:100%;">
                        <table width="100%" class="grid">
           
				<tr>
					<th width="10%">整改人：</th>
					<td width="23%">${noDeal.rectificationManName}
					</td>
					<th width="10%">整改时间：</th>
					<td width="56%" colspan="3"><fmt:formatDate value="${noDeal.rectificationDate}"
									pattern="yyyy-MM-dd" />
					</td>
					</tr>

				<tr>
                    <th width="10%">整改原因：</th>
                    <td colspan="5" align="left">${noDeal.rectificationReasons}</td>
                </tr>
            </table>
            </div>
            </c:if>
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