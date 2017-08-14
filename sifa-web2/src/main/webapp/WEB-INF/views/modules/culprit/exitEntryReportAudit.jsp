<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form id="exitEntryReportAuditForm" name="exitEntryReportAuditForm" action="" method="post">
	<input type="hidden" name="taskId" value="${exitEntryReport.taskId}"/>
	<input type="hidden" name="id" id="revokeProbationId" value="${exitEntryReport.id}"/>
	<input type="hidden" name="auditType" value="${exitEntryReport.auditType}"/>
	<c:choose>
 		<c:when test="${empty exitEntryReport.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${exitEntryReport.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
	<div class="easyui-panel"  title="出入境报备相关信息" style="width:100%;padding:5px;">
             <table width="100%" class="grid">
              <c:set value="${fn:split(exitEntryReport.dicZjlxKey,',') }" var="ths"></c:set>
              <c:forEach items="${ths }" var="th" varStatus="status">
              	<tr>
                  <th width="10%">证件类型：</th><td width="23%">${fns:getSysDicValueByKey('common_table','dicZjlxKey',th,'')}</td>
                  <th width="10%">证件号码：</th><td width="56%">${fn:split(exitEntryReport.cedentialsNumber, ',')[status.count-1]}</td>
              	</tr>
              </c:forEach>
              <tr>
                 	<th>收缴时间：</th><td><fmt:formatDate value="${exitEntryReport.filingDate}" pattern="yyyy年MM月dd日" /></td>
              		<th>收缴人：</th><td>${exitEntryReport.handlingPerson}</td>
              </tr>
              <tr>
                    <th width="10%">通报备案事由&nbsp;&nbsp;&nbsp;<br/>及法律依据  ：</th><td colspan="3">
                    <textarea readOnly=true style="width:800px;height:80px;border: 0 none;">通报备案事由:矫正人员${culprit.name }犯${culprit.culpritJudgment.crimeInfo}，于<fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate}" pattern="yyyy年MM月dd日" />被宣告缓刑。 根据《中华人民共和国护照法》第十三条第四项和《中华人民共和国出入境管理法》第八条第三项之规定，应不予批准出境。</textarea></td>
              </tr>
            </table>
    </div>
   	<div class="easyui-panel" title="审批信息" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
            	<c:if test="${exitEntryReport.auditType eq 'xjzCheck'}">
				<tr>
					<Th  width="10%">矫正科审核意见：</Th>
					<TD>
						<textarea rows="7" cols="100" name="jzkOpinion" >同意报备</textarea>
					</TD>
				</TR>
				</c:if>
				<c:if test="${exitEntryReport.auditType eq 'xfgCheck'}">
				<tr>
					<Th  width="10%">通报机关备案意见：</Th>
					<TD>
						<textarea rows="7" cols="100" name="orgOpinion" >同意报备</textarea>
					</TD>
				</TR>
				</c:if>
            </table>
    </div>
    <c:if test="${exitEntryReport.auditType eq 'xjzPrint'}">
    	<!--完成报备  -->
		<input type="hidden" name="dicBbztKey" value="61003"/>
			<table width="100%" class="grid" >
                <tr>
                   <th width="25%"  style="text-align:center;">操作人</th>
                   <th width="25%"  style="text-align:center;">操作时间</th>
                   <th width="25%"  style="text-align:center;">操作环节</th>
                   <th width="24%"  style="text-align:center;">意见</th>
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
	</c:if>
	 <input type="hidden" name="decideType" value="1"/>
</form>

<script type="text/javascript">

 $(function() {
	$('#exitEntryReportAuditForm').form({
		url:'${ctx}/inculprit/exitEntryReport/audit',
		onSubmit:function(){
			progressLoad();
            return true;
		},
		success:function(data){
			progressClose();
			data = JSON.parse(data);
			if(data.status==200){
				$.messager.show({
					title:'提示信息!' ,
					msg:data.msg
				});
				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');
                 parent.$.modalDialog.handler.dialog('close');
                 $('#revokeProbationerewardspunishmentForm').dialog('destroy');
			}else{
				 parent.$.messager.alert('错误', result.msg, 'error');
			}
			
		}
	});	
})

</script>
