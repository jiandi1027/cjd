<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<table class="easyui-datagrid" id="askLeave_finish_list_content"
	style="height: 400px"
	data-options="singleSelect:true,fit:true,collapsible:false,striped:true,fitColumns:true,rownumbers:true">
	<thead>
		<tr>
			<th data-options="field:'studyDate',width:'50%',align:'center'">文书名称</th>
			<th data-options="field:'_opt',width:'29%',align:'center'">操作</th>
			<th data-options="field:'_opt1',width:'21%',align:'center'">是否打印</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>打印社区服刑人员外出证明书</td>
			<td><a href="javascript:void(0);" class="easyui-linkbutton"
				data-options="iconCls:'fi-print icon-blue',plain:true"
				onclick="askLeave_printwczm('${askLeave.id}')"><strong>打印</strong></a></td>
			<td><span style="color: red;" name="isPrintWCZM"
				id="askLeave_isPrintWCZM"><c:if
						test="${askLeave.isPrintWCZM==1 }">已打印</c:if></span></td>
		</tr>

	</tbody>

</table>


<div id="askLeave_printwczmDialog"></div>

<div id="askLeave_informDialog"></div>

<div style="text-align: center; display: none;">
	<a id="askLeave_inform_btn" class="easyui-linkbutton">提交</a>
</div>




<form 
	method="post" id="askLeaveWorkerPrintForm">
	<input type="hidden" name="id" value="${askLeave.id}" /> <input
		type="hidden" name="taskId" value="${askLeave.taskId}" /> <input
		type="hidden" name="auditType" value="${askLeave.auditType}" />
</form>



<script>
	///打印外出证明
	function askLeave_printwczm(id)
	{
		$('#askLeave_printwczmDialog').dialog(
		{
			title : '打印《打印社区服刑人员外出证明书》',
			iconCls : 'fi-print icon-blue',
			width : 800,
			height : 600,
			href : '${ctx}/dailymgr/askLeave/printwczm?id=' + id,
			modal : true,
			resizable : true,
			maximizable : true,
			buttons :
			[
			{
				text : '打印',
				iconCls : 'fi-print icon-blue',
				handler : function()
				{
					$('#askLeavePrintBtn1').click();
				}
			},
			{
				text : '关闭',
				iconCls : 'fi-x icon-blue',
				handler : function()
				{
					$('#askLeave_printwczmDialog').dialog('close');
				}
			} ]
		});
		$('#askLeave_isPrintWCZM').html('已打印');

		$('#askLeave_printwczmDialog').window('center');

		$.ajax(
		{
			type : 'post',
			url : '${ctx}/dailymgr/askLeave/updateFinshInfo?id=' + id
					+ '&isPrintWCZM=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result)
			{

				$('#askLeave_isPrintWCZM').html('已打印');
			},
			error : function(result)
			{

			}
		});

	}

	//提交按钮
	$('#askLeave_inform_btn').click(function()
	{
		$('#askLeaveWorkerPrintForm').form('submit');

	});
	
	
	$('#askLeaveWorkerPrintForm').form(
			{
				
				url : "${ctx}/dailymgr/askLeave/finish",
				onSubmit : function()
				{
					progressLoad();
					var isValid = $(this).form('validate');
					if (!isValid)
					{
						progressClose();
					}
					return isValid;
				},
				success : function(data)
				{
					var data=JSON.parse(data);

					progressClose();
					$.messager.show(
					{
						title : '提示信息!',
						msg : data.msg
					});
					
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');
					parent.$.modalDialog.handler.dialog('close');
				},
				error : function(data)
				{
					parent.$.messager.alert('错误', data.msg, 'error');
				}
			});

</script>