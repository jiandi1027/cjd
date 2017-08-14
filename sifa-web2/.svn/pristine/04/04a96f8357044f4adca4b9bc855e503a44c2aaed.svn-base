<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	<form:form  action="${ctx}/sys/sysDic/save" method="post" class="form form-horizontal" id="sysDicParentForm" commandName="sysDic">
	<form:hidden path="id" id="id"/>
	<form:hidden path="parentKey" value="1"/>
            <table width="100%" class="grid">
           
				<tr>
					
					<th width="10%"><span class="c-red">*</span>表名：</th>
					<td width="40%">
						<form:input path="tabName" required="required" missingMessage="表名不能为空!" class="f1 easyui-textbox" style="width:70%;height: 29px;"/>
					</td>
					<th width="10%">列名：</th>
					  <td>
					  <form:input path="columnName" required="required" missingMessage="列名不能为空!"  class="f1 easyui-textbox " style="width:70%;height: 29px;"/>
					</td>
					
				</tr>
				<tr>
					
					<th>排序：</th>
					<td>
					<form:input path="dicSort"  placeholder="请输入资源路径" value="0"  class="easyui-numberspinner" style="width: 120px; height: 29px;" required="required" data-options="editable:false"/>
					</td>
					<th>描述：</th>
					<td>
					<form:input path="remarks"  placeholder="请输入资源路径" class="f1 easyui-textbox " style="width:70%;height: 29px;"/>
					</td>
					
				</tr>
				
                
            </table>
    </form:form>
    <script>
        function submitForm(){
        	 $('#sysDicParentForm').form('submit');
        }
        function clearForm(){
            $('#sysDicParentForm').form('clear');
        }
        $(function() {
        	$('#sysDicParentForm').form({
        		url:'${ctx}/sys/sysDic/save',
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
