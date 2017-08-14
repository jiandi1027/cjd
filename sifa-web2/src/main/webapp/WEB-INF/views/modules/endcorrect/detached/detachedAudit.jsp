<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form id="detachedAuditForm" name="detachedAuditForm" action="${ctx}/endcorrect/detached/submitDetachedAudit" method="post">
	<input type="hidden" name="taskId" value="${detached.taskId}"/>
	<input type="hidden" name="id" value="${detached.id}"/>
	<input type="hidden" name="auditType" value="${detached.auditType}"/>
	<c:choose>
 		<c:when test="${empty detached.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${detached.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
	  <div class="easyui-panel"  title="脱管相关信息" style="width:100%;padding:5px;">
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
   <c:if test="${detached.auditType ne 'sfsPut' }">
   	<div class="easyui-panel" title="审批信息" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
            	<TR>	
					<Th width="10%" >审核结果：</Th>
					<TD>
						<input type="radio" name="decideType" checked="checked" value="1"/>同意
						<input type="radio" name="decideType" value="0"/>不同意
						<input type="radio" name="decideType" value="2" />退回
					</TD>
				</tr>
				<tr>
					<Th  width="10%" >审核意见：</Th>
					<TD>
						<textarea style="width:80%;height:60px" name="opinion" ></textarea>
					</TD>
				</TR>
            
            </table>
    </div>
	</c:if>

	<c:if test="${detached.auditType eq 'sfsPut' }">
	 <input type="hidden" name="decideType" value="1"/>
	 </c:if>
</form>
<script type="text/javascript">
function doAudit(){
	$("#detachedAuditForm").form('submit');
}
$(function() {
	$('#detachedAuditForm').form({
		url:'${ctx}/endcorrect/detached/submitDetachedAudit',
		onSubmit:function(){
			 progressLoad();
			 var isValid = $(this).form('validate');
            if (!isValid) {
                progressClose();
            }
            return isValid;
		},
		success:function(data){
			progressClose();
			data = JSON.parse(data);
			if(data.status==200){
				$.messager.show({
					title:'提示信息!' ,
					msg:data.msg
				});
				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                 parent.$.modalDialog.handler.dialog('close');
				
			}else{
				 parent.$.messager.alert('错误', result.msg, 'error');
			}
			
		}
	});	
});
</script>
</div>