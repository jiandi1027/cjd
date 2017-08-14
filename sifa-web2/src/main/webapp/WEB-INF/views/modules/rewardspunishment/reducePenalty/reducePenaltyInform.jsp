<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
<form id="reducePenalty_saveInform">
    <input type="hidden" name="id" value="${reducePenalty.id }"/> 
    <input type="hidden" name="taskId" value="${reducePenalty.taskId}"/>
    <input type="hidden" name="auditType" value="${reducePenalty.auditType}"/>
        <table width="100%" class="grid">
        	<tr>
        		<th width="20%"><span class="c-red">*</span>送达方式：</th>
        		<td width="80%">
        		<input name="dicSdfsKey"  id="dicSdfsKey" required=true class="easyui-combobox" data-options="valueField:'value',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=sdfs&parentKey=1590000',panelHeight:'auto',editable:false"/>
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
	    <a id="reducePenalty_saveInform_btn" class="easyui-linkbutton" >提交</a>
</div>
	
<script type="text/javascript">
$(function() {
	$("#gzclUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});	

	$('#reducePenalty_saveInform_btn').click(function(){
		if($('#reducePenalty_saveInform').form('validate')){
			$.ajax({
				type : 'post',
				url : '${ctx}/rewardspunishment/reducePenalty/finishInform',
				dataType : 'json',
				data:$.serializeObject($('#reducePenalty_saveInform')),
				cache : false,
				async : false, //同步请求
				success : function(result) {
					$.messager.show({
						title:'提示信息!' ,
						msg:result.msg
					});
					 $('#reducePenaltyPrint2').dialog('close');
					 parent.$.modalDialog.openner_dataGrid.datagrid('reload');
	                 parent.$.modalDialog.handler.dialog('close');
				},
				error : function(result) {
					 parent.$.messager.alert('错误', result.msg, 'error');
				}
			}); 
		}
		
	});
	
	

});

</script>

