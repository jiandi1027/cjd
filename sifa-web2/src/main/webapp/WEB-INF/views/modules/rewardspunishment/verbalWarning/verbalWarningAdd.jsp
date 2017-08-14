<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	<form action="${ctx}/rewardspunishment/verbalWarning/save" method="post" class="form form-horizontal" id="verbalWarningForm" name="verbalWarningForm">
 
 	<c:choose>
 		<c:when test="${empty verbalWarning.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${verbalWarning.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
   
    <div class="easyui-panel" title="口头警告信息" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
           		<tr>
                    <th width="10%"><span style="color:red;">*</span>违纪原因：</th>
							<td align="left">
							<input id="dicReasonTypeKey" name="dicReasonTypeKey" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_WARNING_ORAL&columnName=DIC_REASON_TYPE_KEY&parentKey=78000',panelHeight:'auto'"
		    				required=true missingMessage="违纪原因不能为空!" style="width:173px;" >
                </tr>
                <tr>
                    <th width="10%"><span style="color:red;">*</span>简要违纪情况：</th>
							<td align="left">
							<textArea id="detailInfo" name="detailInfo" class="easyui-validatebox" style="width: 80%;height:50px;overflow:hidden;"required=true missingMessage="简要违纪情况不能为空!"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" onMouseOut="textarealength(this,200)"  maxlength="200"></textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">${fn:length(verbalWarning.detailInfo)}</em>个字。
                </tr>
            </table>
          </div>
    </form>
    <script>
        function submitForm(){
        	 $('#verbalWarningForm').form('submit');
        }
        function clearForm(){
            $('#verbalWarningForm').form('clear');
        }
        $(function() {
        	$('#verbalWarningForm').form({
        		url:'${ctx}/rewardspunishment/verbalWarning/save',
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
        				
                        var flag = '${isAddFlag}';
            				if (flag == 1) {
         	   				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
         	            	parent.$.modalDialog.handler.dialog('close');
         				}
            			else {
         					$('#overAlarmDialog').dialog("close");
            			}
        			}else{
        				 parent.$.messager.alert('错误', result.msg, 'error');
        			}
        			
        		}
        	});	
        
        });
        
	
    </script>
