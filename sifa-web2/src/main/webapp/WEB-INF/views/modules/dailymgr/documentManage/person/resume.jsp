<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
<form id="resume_saveform" method="post">
     <input type="hidden" name="id" value="${culpritResume.id }" />
	 <input type="hidden" name="culpritId" value="${culpritResume.culpritId }" />
		<table width="100%" class="grid">
			<tr>
				<th width="15%">入职时间：</th>
				<td width="35%"><input  name="startTime" id="resumeStartTime" value="${culpritResume.startTime}"
							class="Wdate easyui-validatebox" onfocus="var resumeEndTime=$dp.$('resumeEndTime');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'resumeEndTime\')}'})" /></td>
				<th width="15%">离职时间：</th>
				<td width="35%"><input name="endTime" id="resumeEndTime" value="${culpritResume.endTime}"
							class="Wdate easyui-validatebox" onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'resumeStartTime\')}'})"></td>			
			</tr>
			<tr>
				<th>工作单位：</th>
				<td><input name="org" id="resumeOrg"class="easyui-textbox" value="${culpritResume.org }"/></td>
				<th>职务：</th>
				<td><input name="role"id="resumeRole" class="easyui-textbox" value="${culpritResume.role }"/></td>
			</tr>
	</table>
</form>
</div>	
<div style="text-align: center;display: none;">
	    <a id="resume_saveform_btn" class="easyui-linkbutton" >保存</a>
</div>
   <script type="text/javascript">
$(function() {
	$('#resume_saveform').form({
		url:'${ctx}/culpritinfo/culpritResume/save',
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
			 $('#resumDialog').dialog('close');
			 $('#resume_content').datagrid('reload');
		},
		error : function(data) {
			 parent.$.messager.alert('错误', '保存失败', 'error');
		}
	});	
	
	
	
	$('#resume_saveform_btn').click(function(){
		$('#resume_saveform').form('submit');
	});
	
	

});

</script>