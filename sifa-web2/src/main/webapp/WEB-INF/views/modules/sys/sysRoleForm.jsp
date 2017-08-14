<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form:form action="${ctx}/sys/sysRole/save" method="post"
	class="form form-horizontal" id="sysRoleForm" commandName="sysRole">
	<form:hidden path="id" id="id" />

	<div class="easyui-panel" title=""
		style="width: 100%; padding: 5px; margin: 0 auto;">
		<table width="100%" class="grid">

			<tr>
				<th width="15%"><span class="c-red">*</span>角色名称：</th>
				<td><form:input path="name" class="f1 easyui-textbox"
						style="170px" required="true" missingMessage="角色名称不能为空!" /></td>
			</tr>
			<tr>
				<th width="15%">英文名称：</th>
				<td><form:input path="ename" class="f1 easyui-textbox"
						style="170px" /></td>
			</tr>
			<tr>
				<th width="15%"><span class="c-red">*</span>是否可用：</th>
				<td><input id="isAvailable" class="easyui-combobox"
					required="true" missingMessage="是否可用不能为空!" name="isAvailable"
					data-options="valueField:'key',editable:false,panelHeight:'auto',textField:'value',value:'${sysRole.isAvailable }',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=yes_no&parentKey=169ef30f5332428da7ac7bb1d576ac3d'" />

				</td>


			</tr>
			<tr>
				<th width="15%">备注：</th>
				<td><form:input path="description" class="easyui-textbox"
						data-options="multiline:true" style="width: 270px;height:100px;" />
				</td>


			</tr>

		</table>
	</div>
</form:form>
<script>
        function submitForm(){
        	 $('#sysRoleForm').form('submit');
        }
        function clearForm(){
            $('#sysRoleForm').form('clear');
        }
        $(function() {
        	$('#sysRoleForm').form({
        		url:'${ctx}/sys/sysRole/save',
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
        			if(data.status==200){
        				  progressClose();
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        				
        				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                         parent.$.modalDialog.handler.dialog('close');
    					
        			}else{
        				 parent.$.messager.alert('错误', result.msg, 'error');
        			}
        			
        		}
        	});	
        
        });
        
	
</script>
