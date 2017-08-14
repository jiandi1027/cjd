<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
<form id="monitor_saveform" method="post">
     <input type="hidden" name="id" value="${monitor.id }" />
	 <input type="hidden" name="culpritId" value="${monitor.culpritId }" />
		<table width="100%" class="grid">
				<tr>
					<th width="15%"><span class="c-red">*</span>姓名：</th>
					<td width="35%"><input name="name" value="${monitor.name }" class="easyui-textbox" required=true data-options="validType:'chinaName'"/></td>
					<th width="15%"><span class="c-red">*</span>成员类型：</th>
					<td width="35%"><input name="xzcylx" value="${monitor.xzcylx }" class="easyui-combobox" required=true value=""
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=38000',panelHeight:'auto',editable:false"></input></td>
				</tr>
				<tr>
					<th>工作单位：</th>
					<td><input name="org" class="easyui-textbox" value="${monitor.org }"/></td>
					<th>性别：</th>
					<td ><input name="dicSexKey" class="easyui-combobox" value="${monitor.dicSexKey }"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=10000',panelHeight:'auto',editable:false"></input></td>
				</tr>
				<tr>
					<th>联系电话：</th>
					<td><input name="mobile" class="easyui-textbox" value="${monitor.mobile }" data-options="validType:'telno'"/></td>
					<th>学历：</th>
					<td><input name="qulifId" class="easyui-combobox" value="${monitor.qulifId }" 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=19000',panelHeight:'auto',editable:false"></input></td>
				</tr>
				<tr>
					<th>成员类别：</th>
					<td colspan="3">
						<select class="easyui-combobox" name="groupTypeId" value="${monitor.groupTypeId}" style="width:173px;" required=true data-options="panelHeight:'auto',editable:false">   
						    <option value="组长" <c:if test="${monitor.groupTypeId eq '组长'}">selected = "selected"</c:if>>组长</option>   
						    <option value="成员" <c:if test="${monitor.groupTypeId eq '成员'}">selected = "selected"</c:if>>成员</option>    
						</select>  
					</td>
				</tr>
				<tr>
					<th>家庭住址：</th>
					<td colspan="3"><input name="address" class="easyui-textbox" value="${monitor.address }" style="width:400px;"/></td>
				</tr>
			</table>
</form>
</div>	
<div style="text-align: center;display: none;">
	    <a id="monitor_saveform_btn" class="easyui-linkbutton" >保存</a>
</div>
   <script type="text/javascript">
$(function() {
	$('#monitor_saveform').form({
		url:'${ctx}/culpritinfo/Monitor/save',
		onSubmit:function(){
			 progressLoad();
			 var isValid = $(this).form('validate');
             if (!isValid) {
                 progressClose();
             }
             return isValid; 
		},
		success:function(data){
			progressClose();
			$.messager.show({
				title:'提示信息!' ,
				msg:'保存成功！'
			});
			 $('#monitorDialog').dialog('close');
			 $('#monitor_content').datagrid('reload');
		},
		error : function(data) {
			 parent.$.messager.alert('错误', '保存失败', 'error');
		}
	});	
	
	
	
	$('#monitor_saveform_btn').click(function(){
		$('#monitor_saveform').form('submit');
	});
	
	

});

</script>