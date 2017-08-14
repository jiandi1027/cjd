<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	<form:form  action="${ctx}/sys/sysAccount/save" method="post" class="form form-horizontal" id="sysAccountForm" commandName="sysAccount">
	<form:hidden path="id" id="id"/>
	
	<div class="easyui-panel" title="" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
           
				<tr>
					<th width="14%"><span class="c-red">*</span>账号：</th>
					<td>
					<form:input path="account"
						class="f1 easyui-textbox" style="width: 170px" required="true" validType="remote['${ctx}/sys/sysAccount/checkAccount?id=${sysAccount.id}','account']" missingMessage="账号不能为空!"   message='用户名已经被占用' invalidMessage="账号已存在"/>
					
					</td>
					<th width="14%"><span class="c-red">*</span>密码：</th>
					<td>
					<c:if test="${empty sysAccount.password}">
					<form:input path="password" class="f1 easyui-passwordbox" style="width: 170px"  required="true" missingMessage="密码不能为空!" value="666666"/>
					</c:if>
					<c:if test="${not empty sysAccount.password}">
					<form:input path="password" class="f1 easyui-passwordbox" style="width: 170px"  required="true" missingMessage="密码不能为空!" />
					</c:if>
					
					</td>
					
				</tr>
				<tr>
					<th width="14%"><span class="c-red">*</span>所属部门：</th>
					<td>
					<select id="groupId" name="groupId" class="easyui-combotree" required="true" missingMessage="所属部门不能为空!" 
    data-options="url:'${ctx}/sys/sysGroup/loadGroupTree?isAll=1',editable:true,value:'${sysAccount.groupId }'" style="width: 170px;">
</select>
					</td>
					<th width="14%"><span class="c-red">*</span>角色：</th>
					<td>
					<input id="roleId" name="roleId" class="easyui-combobox" style="width: 170px;"  required="true" missingMessage="角色不能为空!"  
    data-options="valueField:'id',mode:'remote',editable:true,panelHeight:'auto',textField:'name',value:'${sysAccount.roleId }',url:'${ctx}/sys/sysRole/findAllForSelect'" />  
					
					</td>
					
				</tr>
				<tr>
					<th width="14%"><span class="c-red">*</span>手机号码：</th>
					<td>
					<form:input path="mobile"
						class="f1 easyui-textbox" style="width: 170px;" required="true" missingMessage="手机号码不能为空!"/>
					</td>
					<th width="14%"><span class="c-red">*</span>所属人员：</th>
					<td>
					<input id="personId" name="personId" class="easyui-combobox" style="width: 170px;"  required="true" missingMessage="所属人员不能为空!"  
    data-options="valueField:'id',mode:'remote',editable:true,panelHeight:'auto',panelMaxHeight:'200px',textField:'name',value:'${sysAccount.personId }',url:'${ctx}/sys/sysPerson/findAllForSelect?id=${sysAccount.personId}'" />  
					
					</td>
					
					
				</tr>
				<tr>
					<th width="14%">备注：</th>
					<td colspan="3">
					<form:input path="remark" data-options="multiline:true" style="width: 80%;height:100px;"/>
					</td>
					
					
				</tr>
			
                
            </table>
            </div>
    </form:form>
    <script>
        function submitForm(){
        	 $('#sysAccountForm').form('submit');
        }
        function clearForm(){
            $('#sysAccountForm').form('clear');
        }
        $(function() {
        	$('#sysAccountForm').form({
        		url:'${ctx}/sys/sysAccount/save',
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
      				  progressClose();
        				 parent.$.messager.alert('错误', result.msg, 'error');
        			}
        			
        		}
        	});	
        
        });
        
	
    </script>
