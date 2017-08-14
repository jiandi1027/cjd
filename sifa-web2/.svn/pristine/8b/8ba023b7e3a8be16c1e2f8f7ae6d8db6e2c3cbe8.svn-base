<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<table class="easyui-datagrid" id="redressStop_finish_list_content"
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
			<td>打印特殊原因终止矫正信息表</td>
			<td><a href="javascript:void(0);" class="easyui-linkbutton"
				data-options="iconCls:'fi-print icon-blue',plain:true"
				onclick="redressStop_printone('${redressStop.id}')"><strong>打印</strong></a></td>
			<td><span style="color: red;" name="isPrintONE"
				id="redressStop_isPrintONE"> <c:if
						test="${redressStop.isPrintONE==1 }">已打印</c:if> </span></td>
		</tr>
		
	</tbody>

</table>


<div id="redressStop_printoneDialog"></div>

<div id="redressStop_informDialog"></div>

<div style="text-align: center; display: none;">
	<a id="redressStop_inform_btn" class="easyui-linkbutton">提交</a>
</div>




<form method="post" id="redressStopWorkerPrintForm">
	<input type="hidden" name="id" value="${redressStop.id}" /> <input
		type="hidden" name="taskId" value="${redressStop.taskId}" /> <input
		type="hidden" name="auditType" value="${redressStop.auditType}" />
</form>



<script>
	function redressStop_printone(id)
	{
		var width=sy.getBrowerWidth()-250;
	    var height=sy.getBrowerHeight()-150;
		if(width>800)
		{
			 var width=800;
		}
		if(height>750)
		{
			 var height=750;
		}
		$('#redressStop_printoneDialog').dialog(
		{
			title : '打印《社区矫正人员脱逃、下落不明及死亡情况登记表》',
			iconCls : 'fi-print icon-blue',
			width : width,
			height : height,
			href : '${ctx}/endcorrect/redressStop/printone?id=' + id,
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
					 $('#redressStopPrintBtn1').click();
				}
			},
			{
				text : '关闭',
				iconCls : 'fi-x icon-blue',
				handler : function()
				{
					$('#redressStop_printoneDialog').dialog('close');
				}
			} ]
		});
		
		$('#redressStop_isPrintONE').html('已打印');

		$('#redressStop_printoneDialog').window('center');

		
		 $.ajax(
		 {
		 type : 'post',
		 url : '${ctx}/endcorrect/redressStop/updateFinshInfo?id=' + id
		 + '&isPrintONE=1',
		 dataType : 'json',
		 cache : false,
		 async : false, //同步请求
		 success : function(result)
		 {

		 $('#redressStop_isPrintONE').html('已打印');
		 },
		 error : function(result)
		 {

		 }
		 }); 

	}

	
	
	
	
	
	
	
	
	
	
	
	
	//提交按钮
	$('#redressStop_inform_btn').click(function()
	{
		$('#redressStopWorkerPrintForm').form('submit');

	});

	//提交 流程结束
	$('#redressStopWorkerPrintForm').form(
	{

		url : "${ctx}/endcorrect/redressStop/finish",
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