<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

 <form  action="${ctx}/dailymgr/study/save" method="post" id="studyFormPersonal" name="studyFormPersonal">
	<input type="hidden" id="id" name="id" value="${study.id}"></input>
	<input type="hidden" id="studyType" name="studyType" value="2"></input>
    <c:choose>
 		<c:when test="${empty study.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${study.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
   
     <div class="easyui-panel" title="学习教育" style="width:100%;padding:5px;">
            <table width="100%" class="grid">

                <tr>
                    <th width="10%"><span class="c-red">*</span>学习内容：</th>
							<td width="23%"><input type="text" name="studyContent" required=true missingMessage="学习内容不能为空!"
								class="f1 easyui-textbox" value="${study.studyContent}" /></td>
							<th width="10%"><span class="c-red">*</span>学习方式：</th>
							<td width="23%">
							<input id="dicStudyTypeKey" name="dicStudyTypeKey" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_STUDY&columnName=DIC_STUDY_TYPE_KEY&parentKey=15000',panelHeight:'auto'"
		    				required=true missingMessage="学习形式不能为空!" style="width:173px;" value="${study.dicStudyTypeKey}" >
							</td>
					<th width="10%"><span class="c-red">*</span>学习时间：</th>
							<td width="23%"><input type="text" name="studyDate" required=true missingMessage="学习时间不能为空!" value="<fmt:formatDate value="${study.studyDate}" pattern="yyyy-MM-dd" />"
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
                </tr>
                
                <tr>
                    <th width="10%"><span class="c-red">*</span>学习时长：</th>
							<td width="23%"><input type="text" name="studyTime" required=true missingMessage="学习时长必须是数字"
								class="f1 easyui-numberbox" min=1  value="${study.studyTime}"/></td>
							<th width="10%"><span class="c-red">*</span>考核人：</th>
							<td width="23%"><input type="text" name="assessManager" required=true missingMessage="考核人不能为空!"
								class="f1 easyui-textbox" value="${study.assessManager}" /></td>
							<th width="10%"><span class="c-red">*</span>人员表现：</th>
							<td width="23%">
								<input id="statusId" name="statusId" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_STUDY_CULPRIT&columnName=STATUS_ID&parentKey=23000',panelHeight:'auto'"
		    				required=true missingMessage="人员表现不能为空!" style="width:173px;" value="${study.statusId}" ></td>
                </tr>
                <tr>
                    <th width="10%">备注：</th>
                    <td width="89%" colspan="5" align="left">
                    <textArea id="note" name="note" class="easyui-validatebox" style="width: 80%;height:50px;overflow:hidden;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200">${study.note}</textArea>
					<br>
					备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em
							class="textarea-length c-red">${fn:length(study.note)}</em>个字。
                    </td>
                </tr>
                <tr>
                    <td height="10px">
                    </td>
                </tr>
            </table>
            </div>
    </form>
    <script>
    function submitForm(){
   	 $('#studyFormPersonal').form('submit');
   }
   function clearForm(){
       $('#studyFormPersonal').form('clear');
   }
   $(function() {
   	$('#studyFormPersonal').form({
   		url:'${ctx}/dailymgr/study/save',
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

