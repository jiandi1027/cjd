<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

 <form  action="${ctx}/endcorrect/recidivism/check" method="post" id="recidivismForm">
	<c:choose>
 		<c:when test="${empty recidivism.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${recidivism.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="重新犯罪详情" style="width:100%;padding:5px;margin:0 auto;">
     <input type="hidden" name="id" value="${recidivism.id}"/>
            <table width="100%" class="grid">
                <tr>
                    <th width="10%"><span class="c-red">*</span>新罪名：</th>
							<td width="23%"><input type="text" name="newCrime" required=true missingMessage="新罪名不能为空!"
								class="f1 easyui-textbox" value="${recidivism.newCrime}"  /></td>
							<th width="10%"><span class="c-red">*</span>判决法院：</th>
							<td width="23%"><input type="text" name="judgmentCourt" required=true missingMessage="判决法院不能为空!"
								class="f1 easyui-textbox" value="${recidivism.judgmentCourt}" /></td>
					<th width="10%"><span class="c-red">*</span>判决时间：</th>
							<td width="23%"><input type="text" name="judgmentTime" required=true missingMessage="判决时间不能为空!"
								value="<fmt:formatDate pattern='yyyy-MM-dd'   value='${ recidivism.judgmentTime }' />"
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
                </tr>
                <tr>
					<th width="10%"><span class="c-red">*</span>立案单位：</th>
							<td width="23%"><input type="text" name="registerUnit" required=true missingMessage="立案单位不能为空!"
								class="f1 easyui-textbox" value="${recidivism.registerUnit}" /></td>
					<th width="10%"><span class="c-red">*</span>立案时间：</th>
							<td width="23%"><input type="text" name="registerTime" required=true missingMessage="立案时间不能为空!"
								value="<fmt:formatDate pattern='yyyy-MM-dd'   value='${ recidivism.registerTime }' />"
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
							<th width="10%"><span class="c-red">*</span>掌握信息时间：</th>
							<td width="23%"><input type="text" name="graspTime" required=true missingMessage="掌握信息时间不能为空!"
								value="<fmt:formatDate pattern='yyyy-MM-dd'   value='${ recidivism.graspTime }' />"
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
                </tr>
                <tr>
                    <th width="10%">&nbsp;&nbsp;<span class="c-red">*</span>掌握信息方式：</th>
							<td width="23%"  colspan="5">
							<input id="dicGraspTypeKey" name="dicGraspTypeKey" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_RECIDIVISM_PERHAPS&columnName=DIC_GRASP_TYPE_KEY&parentKey=96200',panelHeight:'auto'"
		    				required=true missingMessage="掌握信息方式不能为空!" style="width:173px;">
							</td>
                </tr>
                
            </table>
    </div>
    </form>
    <script>
        function submitForm(){
        	 $('#recidivismForm').form('submit');
        }
        function clearForm(){
            $('#recidivismForm').form('clear');
        }
        $(function() {
        	$('#recidivismForm').form({
        		url:'${ctx}/endcorrect/recidivism/check',
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

