<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	<form:form  action="${ctx}/rewardspunishment/noDeal/saveRectification" method="post" class="form form-horizontal" id="noDealForm" commandName="noDeal">
	<form:hidden path="id" id="id"/>
            <table width="100%" class="grid">
           
                <tr>
                    <th width="15%">整改原因：</th>
                    <td colspan="5" align="left">
                    <textArea id="rectificationReasons" name="rectificationReasons" class="easyui-validatebox" style="width: 90%;height:50px;overflow:hidden;"required=true missingMessage="整改原因不能为空!"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200">${noDeal.rectificationReasons}</textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red"> 
						<c:if test="${noDeal.rectificationReasons==null}">0</c:if>
						<c:if test="${noDeal.rectificationReasons!=null}">${fn:length(noDeal.rectificationReasons)}</c:if></em>个字。</td>
                </tr>
            </table>

    </form:form>
    <script>
        function submitForm(){
        	 $('#noDealForm').form('submit');
        }
        function clearForm(){
            $('#noDealForm').form('clear');
        }
        $(function() {
        	$('#noDealForm').form({
        		url:'${ctx}/rewardspunishment/noDeal/saveRectification',
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
