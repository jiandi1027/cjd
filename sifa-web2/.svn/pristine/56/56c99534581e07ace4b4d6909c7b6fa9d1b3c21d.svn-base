<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<form action="${ctx}/investigate/investigateAudit" method="post" id="investigateFormAssignForm">
	<input type="hidden" name="id" value="${investigate.id}"/>
	<input type="hidden" name="taskId" value="${investigate.taskId}"/>
	<input type="hidden" name="auditType" value="${investigate.auditType}"/>
	
	<div class="easyui-panel" title="" style="width:100%;padding: 5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="40%"><span class="c-red">*</span>调查司法所：</th>
				<td width="60%" colspan="3"><select id="sysGroupId" name="sfsGroupId" class="f1 easyui-combotree" data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true,limitToList:'true'" 
					required=true style="width: 173px;"></select>
				<input type="hidden" id="sfsGroupName" name="sfsGroupName" value="${investigate.sfsGroupName }"/></td>
			</tr>
			
			
			<tr style="display:none;" >
				<td colspan="4" align="center">
					<a id="assignFormBtn1" class="easyui-linkbutton" icon="fi-checkbox icon-blue">指派</a>
					<a id="assignFormBtn2" class="easyui-linkbutton" icon="fi-x icon-blue">关闭</a>
				</td>
			</tr>
		</table>
	</div>
</form>
<script>
$('#sysGroupId').combotree({
	onChange:function(n,o){
		$("#sfsGroupName").val($('#sysGroupId').combotree('getText'));
	}
});

$('#assignFormBtn1').click(function(){
	progressLoad();
	
	if ($('#investigateFormAssignForm').form('validate')) {
		$.ajax({
			type : 'post',
			url : '${ctx}/investigate/investigateAudit?update=true&type=1',
			data : $('#investigateFormAssignForm').serialize(),
			dataType : 'json',
			async : false,
			success : function(result) {
            	progressClose();
				$.messager.show({
					title : '提示信息',
					msg : '指派成功'
				});
				

            	$('#investigateFormAssign').dialog("close");
   				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                parent.$.modalDialog.handler.dialog('close');
			},
			error : function(result) {
            	progressClose();
				$.messager.show({
					title : '提示信息',
					msg : '指派失败'
				});
			}
		});
	}else {
    	progressClose();
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能保存!'
		});
	}
});

$('#assignFormBtn2').click(function(){
	$('#investigateFormAssign').dialog("close");
	parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
    parent.$.modalDialog.handler.dialog('close');
})
</script>