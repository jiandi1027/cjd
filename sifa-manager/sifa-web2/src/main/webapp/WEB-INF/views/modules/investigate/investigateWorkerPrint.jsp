<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<table class="easyui-datagrid" id="investigate_finish_list_content"
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
			<td>打印调查评估意见书</td>
			<td><a href="javascript:void(0);" class="easyui-linkbutton"
				data-options="iconCls:'fi-print icon-blue',plain:true"
				onclick="investigate_printyjs('${investigate.id}')"><strong>打印</strong></a></td>
			<td><span style="color: red;" name="isPrintYJS"
				id="investigate_isPrintYJS"><c:if
						test="${investigate.isPrintYJS==1 }">已打印</c:if></span></td>
		</tr>
		<tr>
			<td>打印审前社会调查表</td>
			<td><a href="javascript:void(0);" class="easyui-linkbutton"
				data-options="iconCls:'fi-print icon-blue',plain:true"
				onclick="investigate_printdcb('${investigate.id}')"><strong>打印</strong></a></td>
			<td><span style="color: red;" name="isPrintDCB"
				id="investigate_isPrintDCB"><c:if
						test="${investigate.isPrintDCB==1 }">已打印</c:if></span></td>
		</tr>
		<tr>
			<td>打印审前社会调查审批表</td>
			<td><a href="javascript:void(0);" class="easyui-linkbutton"
				data-options="iconCls:'fi-print icon-blue',plain:true"
				onclick="investigate_printspb('${investigate.id}')"><strong>打印</strong></a></td>
			<td><span style="color: red;" name="isPrintSPB"
				id="investigate_isPrintSPB"><c:if
						test="${investigate.isPrintSPB==1 }">已打印</c:if></span></td>
		</tr>
	</tbody>

</table>


<div id="investigate_printyjsDialog"></div>
<div id="investigate_printdcbDialog"></div>
<div id="investigate_printspbDialog"></div>

<div id="investigate_informDialog"></div>

<div style="text-align: center; display: none;">
	<a id="investigate_inform_btn" class="easyui-linkbutton">提交</a>
</div>




<form method="post" id="investigateWorkerPrintForm">
	<input type="hidden" name="id" value="${investigate.id}" /> <input
		type="hidden" name="taskId" value="${investigate.taskId}" /> <input
		type="hidden" name="auditType" value="${investigate.auditType}" />
</form>



<script>
	function investigate_printyjs(id)
	{
		var url = '${ctx}/investigate/print?id=${investigate.id}&type=1&processInstanceId=${investigate.processInstanceId}';
		$('#investigate_printyjsDialog').dialog(
		{
			title : '打印调查评估意见书',
			iconCls : 'fi-print icon-blue',
			width : 800,
			height : 600,
			resizable : true,
			maximizable : true,
			href : url,
			modal : true,
			resizable : true,
			buttons :
			[
			{
				text : '打印调查评估意见书',
				iconCls : 'fi-print icon-blue',
				handler : function()
				{
					$('#investigatePrintBtn1').click();
				}
			},
			{
				text : '关闭',
				iconCls : 'fi-x icon-blue',
				handler : function()
				{
					$('#investigate_printyjsDialog').dialog("close");
				}
			} ]
		});

		$.ajax(
		{
			type : 'post',
			url : '${ctx}/investigate/updateFinshInfo?id=' + id
					+ '&isPrintYJS=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result)
			{
				$('#investigate_isPrintYJS').html('已打印');
			},
			error : function(result)
			{

			}
		});

	}

	function investigate_printdcb(id)
	{
		var url = '${ctx}/investigate/print?id=${investigate.id}&type=2&processInstanceId=${investigate.processInstanceId}';
		$('#investigate_printdcbDialog').dialog(
		{
			title : '打印《打印审前社会调查表》',
			iconCls : 'fi-print icon-blue',
			width : 800,
			height : 600,
			href : url,
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
					$('#investigatePrintBtn1').click();
				}
			},
			{
				text : '关闭',
				iconCls : 'fi-x icon-blue',
				handler : function()
				{

					$('#investigate_printdcbDialog').dialog('close');
				}
			} ]
		});

		$('#investigate_printdcbDialog').window('center');

		$.ajax(
		{
			type : 'post',
			url : '${ctx}/investigate/updateFinshInfo?id=' + id
					+ '&isPrintDCB=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result)
			{

				$('#investigate_isPrintDCB').html('已打印');
			},
			error : function(result)
			{

			}
		});

	}

	function investigate_printspb(id)
	{
		var url = '${ctx}/investigate/print?id=${investigate.id}&type=3&processInstanceId=${investigate.processInstanceId}';
		$('#investigate_printspbDialog').dialog(
		{
			title : '打印《打印审前社会调查审批表》',
			iconCls : 'fi-print icon-blue',
			width : 800,
			height : 600,
			href : url,
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
					$('#investigatePrintBtn1').click();
				}
			},
			{
				text : '关闭',
				iconCls : 'fi-x icon-blue',
				handler : function()
				{

					$('#investigate_printspbDialog').dialog('close');
				}
			} ]
		});

		$('#investigate_printspbDialog').window('center');

		$.ajax(
		{
			type : 'post',
			url : '${ctx}/investigate/updateFinshInfo?id=' + id
					+ '&isPrintSPB=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result)
			{

				$('#investigate_isPrintSPB').html('已打印');
			},
			error : function(result)
			{

			}
		});

	}

	//提交按钮
	$('#investigate_inform_btn').click(function()
	{
	
		$('#investigateWorkerPrintForm').form('submit');

	});

	//提交 流程结束
	$('#investigateWorkerPrintForm').form(
	{

		url : "${ctx}/investigate/finish",
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