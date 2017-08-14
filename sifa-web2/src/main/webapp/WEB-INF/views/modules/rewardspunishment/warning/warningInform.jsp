<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
<form id="warning_saveInform" method="post">
    <input type="hidden" name="id" value="${warning.id }"/> 
    <input type="hidden" name="taskId" value="${warning.taskId}"/>
    <input type="hidden" name="auditType" value="${warning.auditType}"/>
        <table width="100%" class="grid">
        	<tr>
        		<th width="20%"><span class="c-red">*</span>送达方式：</th>
        		<td width="80%">
        		<input name="opinion" required=true class="easyui-combobox" data-options="valueField:'value',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=sdfs&parentKey=15900000',panelHeight:'auto',editable:false"/>
        		</td>
        	</tr>
        	<tr>
        		<th>告知材料：</th>
        		<td><div id="gzclUpload"></div>
				</td>
        	</tr>
         </table>
</form>
</div>	
<div style="text-align: center;display: none;">
	    <a id="warning_saveInform_btn" class="easyui-linkbutton" >提交</a>
</div>
	
<script type="text/javascript">
$(function() {
	$("#gzclUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});	

	
		$('#warning_saveInform').form({
			url : '${ctx}/rewardspunishment/warning/finishInform',
			onSubmit:function(){
				 progressLoad();
				 var isValid = $(this).form('validate');
	             if (!isValid) {
	                 progressClose();
	             }
	             return isValid;
			},
			success:function(data){
				data = JSON.parse(data);
				progressClose();
				$.messager.show({
					title:'提示信息!' ,
					msg:data.msg
				});
				 $('#securityPunishmentPrint2').dialog('close');
				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');
	             parent.$.modalDialog.handler.dialog('close');
			},
			error : function(data) {
				 parent.$.messager.alert('错误', data.msg, 'error');
			}
		}); 
	
	$('#warning_saveInform_btn').click(function(){
		$('#warning_saveInform').form('submit');
	});

});

</script>

