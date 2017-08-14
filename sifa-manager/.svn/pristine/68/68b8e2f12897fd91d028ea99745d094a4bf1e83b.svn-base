<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form:form action="${ctx}/sys/sysGroup/save" method="post"
	class="form form-horizontal" id="sysGroupForm" commandName="sysGroup">
	<form:hidden path="id" id="id" />




	<table width="100%" class="grid">

		<tr>
			<th width="14%"><span class="c-red">*</span>上级部门：</th>
			<td><select id="parentId" name="parentId" style="width:170px;" style="width:170px;"
				class="easyui-combotree" required="true" missingMessage="上级部门不能为空!"
				data-options="url:'${ctx}/sys/sysGroup/loadGroupTree?isAll=1',editable:true,value:'${sysGroup.parentId }'">
			</select></td>
			<th width="14%"><span class="c-red">*</span>部门名称：</th>
			<td><form:input path="name"
					class="f1 easyui-textbox easyui-validatebox" style="width:170px;"
					required="true" missingMessage="部门名称不能为空!" /></td>

		</tr>
		<tr>
			<th>部门编号：</th>
			<td><form:input path="groupSeq" style="width:170px;"
					class="f1 easyui-textbox easyui-validatebox" /></td>
			<th>地址：</th>
			<td><form:input path="address" style="width:170px;"
					class="f1 easyui-textbox easyui-validatebox" /></td>

		</tr>
		<tr>
			<th>机构编码：</th>
			<td><form:input path="jgbm" style="width:170px;"
					class="f1 easyui-textbox easyui-validatebox" /></td>
			<th>机构简称：</th>
			<td><form:input path="jgjc" style="width:170px;"
					class="f1 easyui-textbox easyui-validatebox" /></td>

		</tr>
		<tr>
			<th>英文名称：</th>
			<td><form:input path="ywmc" style="width:170px;"
					class="f1 easyui-textbox easyui-validatebox" /></td>
			<th>机构代码：</th>
			<td><form:input path="jgdm" style="width:170px;"
					class="f1 easyui-textbox easyui-validatebox" /></td>

		</tr>
		<tr>
			<th>机构类别：</th>
			<td><form:input path="dicSfxzjglxKey" style="width:170px;"
					class="f1 easyui-textbox easyui-validatebox" /></td>
			<th>机构行政级别：</th>
			<td><form:input path="dicJgxzjbKey" style="width:170px;"
					class="f1 easyui-textbox easyui-validatebox" /></td>

		</tr>
		<tr>
			<th>联系人：</th>
			<td><form:input path="contactor" style="width:170px;"
					class="f1 easyui-textbox easyui-validatebox" /></td>
			<th>电话：</th>
			<td><form:input path="phone" style="width:170px;"
					class="f1 easyui-textbox easyui-validatebox" /></td>

		</tr>
		<tr>
			<th>级别：</th>
			<td><form:input path="levelNo" style="width:170px;"
					class="f1 easyui-textbox easyui-validatebox" /></td>
			<th>地区编号：</th>
			<td><form:input path="area" style="width:170px;"
					class="f1 easyui-textbox easyui-validatebox" /></td>

		</tr>
		<tr>
			<th>传真号码：</th>
			<td><form:input path="czhm" style="width:170px;"
					class="f1 easyui-textbox easyui-validatebox" /></td>
			<th>电子邮箱：</th>
			<td><form:input path="dzyx" style="width:170px;"
					class="f1 easyui-textbox easyui-validatebox" /></td>

		</tr>


	</table>
</form:form>
<script>
        function submitForm(){
        	 $('#sysGroupForm').form('submit');
        }
        function clearForm(){
            $('#sysGroupForm').form('clear');
        }
        $(function() {
        	$('#sysGroupForm').form({
        		url:'${ctx}/sys/sysGroup/save',
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
        				
        				 parent.$.modalDialog.openner_treeGrid.treegrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                         parent.$.modalDialog.handler.dialog('close');
    					
        			}else{
        				 parent.$.messager.alert('错误', result.msg, 'error');
        			}
        			
        		}
        	});	
        
        });
        
	
    </script>
