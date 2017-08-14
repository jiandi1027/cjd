<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<table class="easyui-datagrid" id="securityPunishment_finish_list_content"
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
			<td>打印治安管理处罚建议书</td>
			<td><a href="javascript:void(0);" class="easyui-linkbutton"
				data-options="iconCls:'fi-print icon-blue',plain:true"
				onclick="securityPunishment_printjys('${securityPunishment.id}')"><strong>打印</strong></a></td>
			<td><span style="color: red;" name="isPrintJYS"
				id="securityPunishment_isPrintJYS"><c:if
						test="${securityPunishment.isPrintJYS==1 }">已打印</c:if></span></td>
		</tr>
		<tr>
			<td>打印提请治安管理处罚审核表</td>
			<td><a href="javascript:void(0);" class="easyui-linkbutton"
				data-options="iconCls:'fi-print icon-blue',plain:true"
				onclick="securityPunishment_printshb('${securityPunishment.id}')"><strong>打印</strong></a></td>
			<td><span style="color: red;" name="isPrintSHB"
				id="securityPunishment_isPrintSHB"><c:if
						test="${securityPunishment.isPrintSHB==1 }">已打印</c:if></span></td>
		</tr>
	</tbody>

</table>
<div id="securityPunishment_printjysDialog"></div>
<div id="securityPunishment_printshbDialog"></div>
<div id="securityPunishment_informDialog"></div>


<div style="text-align: center; display: none;">
	<a id="securityPunishment_inform_btn" class="easyui-linkbutton">告知</a>
</div>


<form action="${ctx}/rewardspunishment/securityPunishment/save"
	method="post" id="securityPunishmentWorkerPrintForm">
	<input type="hidden" name="id" value="${securityPunishment.id}" /> <input
		type="hidden" name="taskId" value="${securityPunishment.taskId}" /> <input
		type="hidden" name="auditType" value="${securityPunishment.auditType}" />
</form>
<script>
	///打印治安管理处罚建议书
	function securityPunishment_printjys(id)
	{
		$('#securityPunishment_printjysDialog')
				.dialog(
						{
							title : '打印《打印治安管理处罚建议书》',
							iconCls : 'fi-print icon-blue',
							width : 800,
							height : 600,
							href : '${ctx}/rewardspunishment/securityPunishment/printJianYi?id='
									+ id,
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
											$('#securityPunishmentPrintBtn1')
													.click();
										}
									},
									{
										text : '关闭',
										iconCls : 'fi-x icon-blue',
										handler : function()
										{
											$(
													'#securityPunishment_printjysDialog')
													.dialog('close');
										}
									} ]
						});
		$('#securityPunishment_isPrintJYS').html('已打印');

		$('#securityPunishment_printjysDialog').window('center');

		$
				.ajax(
				{
					type : 'post',
					url : '${ctx}/rewardspunishment/securityPunishment/updateFinshInfo?id='
							+ id + '&isPrintJYS=1',
					dataType : 'json',
					cache : false,
					async : false, //同步请求
					success : function(result)
					{

						$('#securityPunishment_isPrintJYS').html('已打印');
					},
					error : function(result)
					{

					}
				});

	}

	//打印提请治安管理处罚审核表
	function securityPunishment_printshb(id)
	{
		$('#securityPunishment_printshbDialog')
				.dialog(
						{
							title : '打印《打印提请治安管理处罚审核表》',
							iconCls : 'fi-print icon-blue',
							width : 800,
							height : 600,
							href : '${ctx}/rewardspunishment/securityPunishment/printShenHe?id='
									+ id,
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
											$('#securityPunishmentPrintBtn2')
													.click();
										}
									},
									{
										text : '关闭',
										iconCls : 'fi-x icon-blue',
										handler : function()
										{
											$(
													'#securityPunishment_printshbDialog')
													.dialog('close');
										}
									} ]
						});
		$('#securityPunishment_isPrintSHB').html('已打印');

		$('#securityPunishment_printshbDialog').window('center');
		$
				.ajax(
				{
					type : 'post',
					url : '${ctx}/rewardspunishment/securityPunishment/updateFinshInfo?id='
							+ id + '&isPrintSHB=1',
					dataType : 'json',
					cache : false,
					async : false, //同步请求
					success : function(result)
					{
						$('#securityPunishment_isPrintSHB').html('已打印');
					},
					error : function(result)
					{

					}
				});
	}

	$('#securityPunishment_inform_btn')
			.click(
					function()
					{
						$('#securityPunishment_informDialog')
								.dialog(
										{
											title : '告知',
											iconCls : 'fi-results-demographics icon-blue',
											width : 700,
											height : 250,
											href : '${ctx}/rewardspunishment/securityPunishment/inform?id=${securityPunishment.id}&taskId=${securityPunishment.taskId}&auditType=${securityPunishment.auditType}',
											modal : true,
											resizable : true,
											maximizable : true,
											buttons :
											[
													{
														text : '提交',
														iconCls : 'fi-check icon-blue',
														handler : function()
														{
															$(
																	'#securityPunishment_saveInform_btn')
																	.click();
														}
													},
													{
														text : '关闭',
														iconCls : 'fi-x icon-blue',
														handler : function()
														{
															$(
																	'#securityPunishment_informDialog')
																	.dialog(
																			'close');
														}
													} ]
										});
						$('#securityPunishment_informDialog').window('center');
					});
</script>