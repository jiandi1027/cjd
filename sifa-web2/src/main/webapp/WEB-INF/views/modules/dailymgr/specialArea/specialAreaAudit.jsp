<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form id="specialAuditForm" name="specialAuditForm" action="${ctx}/dailymgr/specialArea/submitSpecialAreaAudit" method="post">
	<input type="hidden" name="taskId" value="${specialArea.taskId}"/>
	<input type="hidden" name="id" id="specialAreaId" value="${specialArea.id}"/>
	<input type="hidden" name="auditType" value="${specialArea.auditType}"/>
	<c:choose>
 		<c:when test="${empty specialArea.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${specialArea.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
	
 <div class="easyui-panel" title="申请相关信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%"  class="grid">
               <tr>
                    <th width="10%">申请提交时间：</th>
                    <td width="23%"><fmt:formatDate value="${specialArea.applyDate }"
									pattern="yyyy-MM-dd" /></td>
                    <th width="10%">申请进入时间：</th>
                    <td width="23%"><fmt:formatDate value="${specialArea.startDate }"
									pattern="yyyy-MM-dd" /></td>
                     <th width="10%">申请离开时间：</th>
                     <td width="23%"><fmt:formatDate value="${specialArea.endDate }"
									pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th width="10%">申请进入区域：</th>
                     <td colspan="5">${specialArea.area }</td>
               </tr>
				<tr>
                     <th width="10%">申请原因：</th>
					<td colspan="5">
						<textarea style="width:80%;height:80px;overflow:hidden;border: 0 none;" readonly="readonly" >${specialArea.reason }</textarea>
					</td>
                </tr>
                <tr>
					<th width="10%">备注：</th>
					<td colspan="5">
						<textarea style="width:80%;height:80px;overflow:hidden;border: 0 none;">${specialArea.note }</textarea>
					</td>
                </tr>
            </table>
    </div>
    <c:if test="${specialArea.auditType ne 'sfsPrint' }">
   	<div class="easyui-panel" title="审批信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
            	<TR>	
					<Th width="10%" >审核结果：</Th>
					<TD>
						<input type="radio" name="decideType" checked="checked" value="1"/>同意
						<input type="radio" name="decideType" value="0"/>不同意
					</TD>
				</tr>
				<tr>
					<Th  width="10%" >审核意见：</Th>
					<TD>
						<textarea style="width:80%;height:60px;" name="opinion" ></textarea>
					</TD>
				</TR>
            
            </table>
    </div>
	</c:if>
	
 	 <c:if test="${specialArea.auditType eq 'sfsPrint'}">
	 <input type="hidden" name="decideType" value="1"/>
	 </c:if>
</form>
 


<script type="text/javascript">

$(function() {
	$('#specialAuditForm').form({
		url:'${ctx}/dailymgr/specialArea/submitSpecialAreaAudit',
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
				parent.$.modalDialog.openner_dataGrid.datagrid('reload');
               parent.$.modalDialog.handler.dialog('close');
			}else{
				 parent.$.messager.alert('错误', result.msg, 'error');
			}
			
		}
	});	
})


</script>
