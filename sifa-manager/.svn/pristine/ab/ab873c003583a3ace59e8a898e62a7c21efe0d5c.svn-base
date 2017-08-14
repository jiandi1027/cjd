<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel"
	style="width: 100%; padding: 5px; margin: 0 auto;">
	<form id="securityPunishment_saveInform" method="post">
		<input type="hidden" name="id" value="${securityPunishment.id }" /> <input
			type="hidden" name="taskId" value="${securityPunishment.taskId}" /> <input
			type="hidden" name="auditType"
			value="${securityPunishment.auditType}" />
		<table width="100%" class="grid">
			<tr>
				<th width="20%"><span class="c-red">*</span>送达方式：</th>
				<td width="80%"><input name="dicSdfsKey" required=true
					class="easyui-combobox"
					data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=sdfs&parentKey=1590000',panelHeight:'auto',editable:false" />
				</td>
			</tr>
			<tr>
				<th>告知材料：</th>
				<td><div id="gzclUpload"></div> <input type="hidden"
					name="gzclUploadUrl" id="gzclUrl"> <input type="hidden"
					name="gzclUploadPathName" id="gzclPathName"> <input
					type="hidden" name="gzclUploadPath" id="gzclPath"></td>
			</tr>
		</table>
	</form>
</div>
<div style="text-align: center; display: none;">
	<a id="securityPunishment_saveInform_btn" class="easyui-linkbutton">提交</a>
</div>

<script type="text/javascript">
	$(function()
	{
		$("#gzclUpload").powerWebUpload(
		{
			auto : true,
			fileNumLimit : 5,
			serverPath : '${ctx}/servlet/file/upload',
			fileType : 'doc,xls,docx,xlsx,pdf'
		});

		$('#securityPunishment_saveInform').form(
		{
			url : '${ctx}/rewardspunishment/securityPunishment/finishInform',
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
				$('#securityPunishment_informDialog').dialog('close');
				parent.$.modalDialog.openner_dataGrid.datagrid('reload');
				parent.$.modalDialog.handler.dialog('close');
			},
			error : function(data)
			{
				parent.$.messager.alert('错误', data.msg, 'error');
			}
		});

		$('#securityPunishment_saveInform_btn').click(function()
		{

			$('#securityPunishment_saveInform').form('submit');
		});

	});
</script>

