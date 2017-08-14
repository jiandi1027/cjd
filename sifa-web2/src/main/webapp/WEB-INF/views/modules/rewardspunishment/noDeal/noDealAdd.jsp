<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	<form:form  action="${ctx}/rewardspunishment/noDeal/save" method="post" class="form form-horizontal" id="noDealForm" commandName="noDeal">
	<form:hidden path="id" id="id"/>
 
 	<c:choose>
 		<c:when test="${empty noDeal.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${noDeal.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
   
    <div class="easyui-panel" title="待处理作不处理信息" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
           
				<tr>
					<th width="10%"><span class="c-red">*</span>违纪时间：</th>
					<td width="23%">
					<form:input path="disciplinaryTime" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
						class="Wdate easyui-validatebox" style="width: 170px" required="true"  missingMessage="违纪时间不能为空!"/>
					
					</td>
					<th width="10%"><span class="c-red">*</span>处理时间：</th>
					<td width="23%">
					<form:input path="processingTime" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
						class="Wdate easyui-validatebox" style="width: 170px"  required="true" missingMessage="处理时间不能为空!"/>
					</td>
					<th width="10%"><span class="c-red">*</span>事项提醒类型：</th>
							<td width="23%">
							<select　id="eventReminderType" name="eventReminderType" class="easyui-combobox" required=true missingMessage="事项提醒类型不能为空!" style="width:173px;">
							 <option value=""></option>
                    	<c:forEach items="${fns:getSysDicList('SF_NO_DEAL','EVENT_REMINDER_TYPE','76000') }" var="sysDic">
                    		<option value="${sysDic.key }">${sysDic.value}</option>
                    	</c:forEach>
                    </select>	
					</td>
					</tr>
				<tr>
					<th width="10%"><span class="c-red">*</span>不予处理原因：</th>
					<td width="23%">
					<input id="reason" name="reason" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_NO_DEAL&columnName=REASON&parentKey=115000',panelHeight:'auto'"
		    				required=true missingMessage="不予处理原因不能为空!" style="width:173px;" >
					</td>
					<th width="10%">处理人：</th>
					<td width="23%">
					<form:input path="processingPeople"
						class="f1 easyui-textbox" style="width: 170px" />
					</td>
					<th width="10%">处理人电话：</th>
					<td width="23%">
					<form:input path="processingTelephone"
						class="f1 easyui-textbox" style="width: 170px"/>
					</td>
				</tr>
				<tr>
                    <th width="10%">具体原因：</th>
                    <td colspan="5" align="left">
                    <textArea id="specificReasons" name="specificReasons" class="easyui-validatebox" style="width: 80%;height:50px;overflow:hidden;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200"></textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
                    </td>
                </tr>
                <tr>
                    <th width="10%">详细描述：</th>
                    <td colspan="5" align="left">
                    <textArea id="description" name="description" class="easyui-validatebox" style="width: 80%;height:50px;overflow:hidden;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200"></textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
                    </td>
                </tr>
            </table>
    	</div>
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
        		url:'${ctx}/rewardspunishment/noDeal/save',
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
