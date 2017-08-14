<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<table class="easyui-datagrid" id="death_finish_list_content"
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
			<td>打印1</td>
			<td><a href="javascript:void(0);" class="easyui-linkbutton"
				data-options="iconCls:'fi-print icon-blue',plain:true"
				onclick="death_printone('${death.id}')"><strong>打印</strong></a></td>
			<td><span style="color: red;" name="isPrintONE"
				id="death_isPrintONE"><c:if
						test="${death.isPrintONE==1 }">已打印</c:if> </span></td>
		</tr>
		<tr>
			<td>打印2</td>
			<td><a href="javascript:void(0);" class="easyui-linkbutton"
				data-options="iconCls:'fi-print icon-blue',plain:true"
				onclick="death_printtwo('${death.id}')"><strong>打印</strong></a></td>
			<td><span style="color: red;" name="isPrintTWO"
				id="death_isPrintTWO"><c:if
						test="${death.isPrintTWO==1 }">已打印</c:if> </span></td>
		</tr>
	</tbody>

</table>


<div id="death_printoneDialog"></div>
<div id="death_printtwoDialog"></div>

<div id="death_informDialog"></div>

<div style="text-align: center; display: none;">
	<a id="death_inform_btn" class="easyui-linkbutton">提交</a>
</div>




<form method="post" id="deathWorkerPrintForm">
	<input type="hidden" name="id" value="${death.id}" /> <input
		type="hidden" name="taskId" value="${death.taskId}" /> <input
		type="hidden" name="auditType" value="${death.auditType}" />
</form>



<script>
	function death_printone(id)
	{
		$('#death_printoneDialog').dialog(
		{
			title : '打印《打印1》',
			iconCls : 'fi-print icon-blue',
			width : 800,
			height : 600,
			href : '${ctx}/endcorrect/death/printone?id=' + id,
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
					$('#deathPrintBtn1').click();
				}
			},
			{
				text : '关闭',
				iconCls : 'fi-x icon-blue',
				handler : function()
				{
					$('#death_printoneDialog').dialog('close');
				}
			} ]
		});
			$('#death_printoneDialog').window('center');

	
		 $.ajax(
		 {
		 type : 'post',
		 url : '${ctx}/endcorrect/death/updateFinshInfo?id=' + id
		 + '&isPrintONE=1',
		 dataType : 'json',
		 cache : false,
		 async : false, //同步请求
		 success : function(result)
		 {

		 $('#death_printONEDialog').html('已打印');
		 },
		 error : function(result)
		 {

		 }
		 }); 

	}

	function death_printtwo(id)
	{
		$('#death_printtwoDialog').dialog(
		{
			title : '打印《打印2》',
			iconCls : 'fi-print icon-blue',
			width : 800,
			height : 600,
			href : '${ctx}/endcorrect/death/printtwo?id=' + id,
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
					$('#deathPrintBtn1').click();
				}
			},
			{
				text : '关闭',
				iconCls : 'fi-x icon-blue',
				handler : function()
				{
				
					$('#death_printtwoDialog').dialog('close');
				}
			} ]
		});
		
		$('#death_printtwoDialog').window('center');

	
		 $.ajax(
		 {
		 type : 'post',
		 url : '${ctx}/endcorrect/death/updateFinshInfo?id=' + id
		 + '&isPrintTWO=1',
		 dataType : 'json',
		 cache : false,
		 async : false, //同步请求
		 success : function(result)
		 {

		 $('#death_isPrintTWO').html('已打印');
		 },
		 error : function(result)
		 {

		 }
		 }); 

	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//提交按钮
	$('#death_inform_btn').click(function()
	{
		$('#deathWorkerPrintForm').form('submit');

	});

	//提交 流程结束
	$('#deathWorkerPrintForm').form(
	{

		url : "${ctx}/endcorrect/death/finish",
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
			var data = JSON.parse(data);

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