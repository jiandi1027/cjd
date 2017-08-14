<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>社区服务</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>

<body>
 <form  action="${ctx}/dailymgr/workfree/save" method="post" id="workfreeFormPersonal">
	<input type="hidden" id="id" name="id" value="${workfree.id}"></input>
	<input type="hidden" id="workfreeType" name="workfreeType" value="2"></input>
    <c:choose>
 		<c:when test="${empty workfree.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${workfree.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="社区服务" style="width:100%;padding:5px;">
            <table width="100%" class="grid">

                <tr>
                    <th width="10%"><span class="c-red">*</span>劳动内容：</th>
							<td><input type="text" name="workContent" required=true missingMessage="劳动内容不能为空!"
								class="f1 easyui-textbox" value="${workfree.workContent}" /></td>
							<th width="10%"><span class="c-red">*</span>劳动地点：</th>
							<td><input type="text" name="workPlace" required=true missingMessage="劳动地点不能为空!"
								class="f1 easyui-textbox" value="${workfree.workPlace}" /></td>
					<th width="10%">劳动日期：</th>
							<td><input type="text" name="workDate" required=true missingMessage="劳动日期不能为空!" value="<fmt:formatDate value="${workfree.workDate}" pattern="yyyy-MM-dd" />"
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
                </tr>
                
                <tr>
                    <th width="10%"><span class="c-red">*</span>工时：</th>
							<td><input type="text" name="taskTime" required=true missingMessage="工时必须是数字!"
								class="f1 easyui-numberbox" min=1  value="${workfree.taskTime}"/></td>
							<th width="10%"><span class="c-red">*</span>考核人：</th>
							<td><input type="text" name="assessManager" required=true missingMessage="考核人不能为空!"
								class="f1 easyui-textbox" value="${workfree.assessManager}" /></td>
					<th width="10%"><span class="c-red">*</span>人员表现：</th>
							<td>
								<input id="statusId" name="statusId" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_STUDY_CULPRIT&columnName=STATUS_ID&parentKey=23000',panelHeight:'auto'"
		    				required=true missingMessage="人员表现不能为空!" style="width:173px;" value="${workfree.statusId}" ></td>
                </tr>
                <tr>
                    <th width="10%">备注：</th>
                    <td colspan="5" align="left">
                    <textArea id="note" name="note" class="easyui-validatebox" style="width: 80%;height:50px;overflow:hidden;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200">${workfree.note}</textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">
						<c:if test="${workfree.note==null}">0</c:if>
						<c:if test="${workfree.note!=null}">${fn:length(workfree.note)}</c:if></em>个字。
                    </td>
                </tr>
                <tr>
                <tr>
                    <td height="10px">
                    </td>
                </tr>
            </table>
            </div>
           
    </form>
    <script>
    function submitForm(){
      	 $('#workfreeFormPersonal').form('submit');
      }
      function clearForm(){
          $('#workfreeFormPersonal').form('clear');
      }
      $(function() {
      	$('#workfreeFormPersonal').form({
      		url:'${ctx}/dailymgr/workfree/save',
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
</body>
</html>
