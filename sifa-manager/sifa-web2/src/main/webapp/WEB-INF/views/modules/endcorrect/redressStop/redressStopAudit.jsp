<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/endcorrect/redressStop/submitRedressStopAudit" method="post" id="redressStopAuditForm">
	<input type="hidden" name="taskId" value="${redressStop.taskId}"/>
	<input type="hidden" name="id" value="${redressStop.id}"/>
	<input type="hidden" name="auditType" value="${redressStop.auditType}"/>
	
	<div class="easyui-panel" title="矫正终止信息" style="width: 100%; padding: 5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">姓名：</th>
				<td width="40%">${redressStop.culpritName}
				</td>
				<th width="10%">终止矫正日期：</th>
				<td width="40%"><fmt:formatDate value="${redressStop.jjrq}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>  
				<th width="10%">终止矫正原因：</th>
				<td width="90%" colspan="3">
					<textArea id="jjsm" name="jjsm" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;" readonly="readonly" >${redressStop.jjsm }</textArea>
				</td>
			</tr>
			<tr>
				<th width="10%">采取的措施和处理结果：</th>
				<td width="90%" colspan="3">
					<textArea id="measure" name="measure" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;" readonly="readonly" >${redressStop.measure }</textArea>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="easyui-panel" title="流程审批" style="width:100%;padding:5px;margin-bottom:10px;">
		<table width="100%" class="grid">
			<c:if test="${redressStop.auditType ne 'xgzryprint' }">
			<tr>
				<th width="10%" ><span class="c-red"></span>审核结果：</th>
				<td width="90%">
					<input type="radio" name="decideType" value="1" checked="checked"/>同意
					<input type="radio" name="decideType" value="2"/>不同意
				</td>
			</tr>
			<tr>
				<th width="10%" >审核意见：</th>
				<td width="90%">
				<textArea id="opinion" name="opinion" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,150)' onKeyUp="textarealength(this,150)" maxlength="150"></textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">150</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
			</tr>
			</c:if>
		 	<c:if test="${redressStop.auditType eq 'xgzryprint' }">
			<tr>
				<th width="10%">审核结果：</th>
				<td width="90%">
					<input type="radio" name="decideType" value="1" checked="checked"/>结束流程
				</td>
			</tr>
			</c:if>
			<tr style="display: none;">
				<td colspan=2 align=center >
					<a id="redressStopAuditBtn" class="easyui-linkbutton" icon="fi-save icon-green">提交</a>
			  	</td>
			</tr>
		</table>
	</div>
</form>
<script type="text/javascript">
var auditType = '${redressStop.auditType}';
$(function() {
});

$('#redressStopAuditBtn').click(function (){
	progressLoad();
	if ($('#redressStopAuditForm').form('validate')) {
		$.ajax({
			type : 'post',
			url : '${ctx}/endcorrect/redressStop/submitRedressStopAudit',
			data : $('#redressStopAuditForm').serialize(),
			dataType : 'json',
			success : function(result) {
		    	progressClose();
		    	var msg = result.msg;
		    	if (auditType == 'xgzryprint') {
		    		msg = '处理成功';
				}
		    	
		    	$.messager.show({
					title : '提示信息',
					msg : msg
				});

				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
	            parent.$.modalDialog.handler.dialog('close');
			},
			error : function(result) {
		    	progressClose();
		    	var msg = result.msg;
		    	if (auditType == 'xgzryprint') {
		    		msg = '处理失败';
				}
		    	
		    	$.messager.show({
					title : '提示信息',
					msg : msg
				});
			}
		});
	}else {
    	progressClose();
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能提交!'
		});
	}
});

</script>
</body>
</html>