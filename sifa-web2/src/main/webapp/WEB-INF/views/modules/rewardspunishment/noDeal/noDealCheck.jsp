<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form:form  action="${ctx}/rewardspunishment/noDeal/save" method="post" class="form form-horizontal" id="noDealForm" commandName="noDeal">
	<form:hidden path="id" id="id"/>
	<form:hidden path="processInstanceId" id="processInstanceId"/>
 
 	<c:choose>
 		<c:when test="${empty noDeal.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${noDeal.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
   
    <div class="easyui-panel" title="基本信息" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
           
				<tr>
					<th width="10%">违纪时间：</th>
					<td width="20%"><fmt:formatDate value="${noDeal.disciplinaryTime}"
									pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<th width="10%">处理时间：</th>
					<td width="20%"><fmt:formatDate value="${noDeal.processingTime}"
									pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<th width="10%">事项提醒类型：</th>
							<td width="20%">
							${fns:getSysDicValueByKey('SF_NO_DEAL','EVENT_REMINDER_TYPE',noDeal.eventReminderType,'')}

					</td>
					</tr>
				<tr>
					<th width="10%">不予处理原因：</th>
					<td>
					${fns:getSysDicValueByKey('SF_NO_DEAL','REASON',noDeal.reason,'')}
					</td>
					<th width="10%">处理人：</th>
					<td>${noDeal.processingPeople}
					</td>
					<th width="10%">处理人电话：</th>
					<td>
					${noDeal.processingTelephone}
					</td>
				</tr>
				<tr>
                    <th>具体原因：</th>
                    <td colspan="5" align="left">${noDeal.specificReasons}</td>
                </tr>
                <tr>
                    <th>详细描述：</th>
                    <td colspan="5" align="left">${noDeal.description}</td>
                </tr>
            </table>
     </div>
     
            <c:if test="${not empty noDeal.rectificationMan }">
            <div class="easyui-panel" title="整改信息" style="width:100%;padding:10px;">
                        <table width="100%" class="grid">
           
				<tr>
					<th width="10%">整改人：</th>
					<td width="23%">${noDeal.rectificationManName}
					</td>
					<th width="10%">整改时间：</th>
					<td width="23%"><fmt:formatDate value="${noDeal.rectificationDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					</tr>

				<tr>
                    <th>整改原因：</th>
                    <td colspan="5" align="left">${noDeal.rectificationReasons}</td>
                </tr>
            </table>
            </div>
            </c:if>
            <div class="easyui-panel" id="p3" title="审批信息" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%" class="grid">
				<tr>
                    <th width="10%">审批意见：</th>
                    <td colspan="3" align="left"><textarea rows="3" cols="124" id="opinion" name="opinion"></textarea></td>
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
        		url:'${ctx}/rewardspunishment/noDeal/check',
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
