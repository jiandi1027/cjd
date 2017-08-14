<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
<form id="family_saveform" method="post">
     <input type="hidden" name="id" value="${culpritFamily.id }" />
	 <input type="hidden" name="culpritId" value="${culpritFamily.culpritId }" />
		<table width="100%" class="grid">
				<tr>
					<th width="15%"><span class="c-red">*</span>姓名：</th>
					<td width="35%"><input name="name" value="${culpritFamily.name }" class="easyui-textbox" required=true data-options="validType:'chinaName'"/></td>
					<th width="15%"><span class="c-red">*</span>性别：</th>
					<td width="35%"><input name="dicSexKey" class="easyui-combobox" required=true value="${culpritFamily.dicSexKey }"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=10000',panelHeight:'auto',editable:false"></input></td>
				</tr>
				<tr>
					<th><span class="c-red">*</span>关系：</th>
					<td><input name="dicRelationKey" class="easyui-combobox" required=true value="${culpritFamily.dicRelationKey }"
					data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=1530000',panelHeight:'auto',editable:false"/></td>
					<th>现政治面貌：</th>
					<td ><input name="dicZzmmKey" class="easyui-combobox" value="${culpritFamily.dicZzmmKey }"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=65000',panelHeight:'auto',editable:false"></input></td>
				</tr>
				<tr>
					<th>工作单位：</th>
					<td><input name="org" class="easyui-textbox" value="${culpritFamily.org }" /></td>
					<th>职务：</th>
					<td><input name="job" class="easyui-textbox" value="${culpritFamily.job }"/></td>
				</tr>
				<tr>
					<th>电话：</th>
					<td><input name="phone" class="easyui-numberbox" value="${culpritFamily.phone }" data-options="validType:'telno'"/></td>
					<th>出生日期：</th>
					<td><input  name="birthday" id="familyBirthday" value="${culpritFamily.birthday }"
								class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
				</tr>
				<tr>
					<th  width="15%">住址：</th>
					<td colspan="3"><input name="address"  value="${culpritFamily.address }" class="easyui-textbox" style="width:400px;"/></td>
				</tr>
			</table>
</form>
</div>	
<div style="text-align: center;display: none;">
	    <a id="family_saveform_btn" class="easyui-linkbutton" >保存</a>
</div>
   <script type="text/javascript">
$(function() {
	$('#family_saveform').form({
		url:'${ctx}/culpritinfo/culpritFamily/save',
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
			 $('#familyDialog').dialog('close');
			 $('#family_content').datagrid('reload');
		},
		error : function(data) {
			 parent.$.messager.alert('错误', '保存失败', 'error');
		}
	});	
	
	
	
	$('#family_saveform_btn').click(function(){
		$('#family_saveform').form('submit');
	});
	
	

});

</script>