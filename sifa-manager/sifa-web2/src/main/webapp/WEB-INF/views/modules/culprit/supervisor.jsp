<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
<form id="supervisorform" action="" method="post">
	<input name="id" type="hidden" value="${culpritSupervisor.id}"/>
	<input name="culpritId" type="hidden" value="${culprit.id}"/>
	<table width="100%" class="grid">
		<tr>
			<th width="30%">工作人员：</th>
			<td width="70%"><input id="accountId" name="accountId" class="easyui-combobox"/></td>
			
		</tr>
		<tr>
			<th>协管员：</th>
			<td><input id="assistantId" class="easyui-combobox" name="assistantId"/></td>
		</tr>
	</table>
</form>
</div>	
<div style="text-align: center;display: none;">
	    <a id="supervisor_saveform_btn" class="easyui-linkbutton" >保存</a>
</div>
<script type="text/javascript">
$('#accountId').combobox({    
    url:'${ctx}/sys/sysAccount/findSysAccount?groupId=${culprit.groupId}',    
    valueField:'id',    
    textField:'accountname',
    panelHeight:'auto',
    limitToList:true
}); 
$('#assistantId').combobox({    
    url:'${ctx}/sys/sysAccount/findSysAccount?groupId=${culprit.groupId}',    
    valueField:'id',    
    textField:'accountname',
    panelHeight:'auto',
    multiple:true,
    limitToList:true
}); 


$(function() {
	$('#supervisorform').form({
		url:'${ctx}/culpritinfo/culprit/saveSupervisor',
		onSubmit:function(){
			 progressLoad();
			/*  var isValid = $(this).form('validate');
             if (!isValid) {
                 progressClose();
             }
             return isValid; */
		},
		success:function(data){
			progressClose();
			$.messager.show({
				title:'提示信息!' ,
				msg:'保存成功！'
			});
			 $('#supervisorDialog').dialog('close');
			 $.ajax({
					type : 'post',
					url : '${ctx}/culpritinfo/culprit/updateFinshInfo?id=${culprit.id}&finshInfo9=1',
					dataType : 'json',
					cache : false,
					async : false, //同步请求
					success : function(result) {
						$('#finshInfo9').html('已完成');
					},
					error : function(result) {
						
					}
				});
		},
		error : function(data) {
			 parent.$.messager.alert('错误', '保存失败', 'error');
		}
	});	
	
	
	
	$('#supervisor_saveform_btn').click(function(){
		$('#supervisorform').form('submit');
	});
	
	

});

</script>