<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
 <form  action="${ctx}/rewardspunishment/revokeOutOfPrison/save" method="post" id="outOfPrisonInfo">
 	<input type="hidden" name="id" id="id" value="${revokeOutOfPrison.id}"/>
 	<c:choose>
 		<c:when test="${empty revokeOutOfPrison.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${revokeOutOfPrison.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 	<input type="hidden"  id="roleId" value="${sysAccount.roleId}"/>
    <div class="easyui-panel" title="撤销暂予监外执行相关信息" style="width:100%;padding:5px;magin:0 auto">
            <table width="100%" class="grid">
                <tr>
                    <th width="10%"><span class="c-red">*</span>违规违纪原因：</th>
                    <td>
                    <input name="dicReasonTypeKey" id="search_dicReasonTypeKey" class="easyui-combobox" value="${revokeOutOfPrison.dicReasonTypeKey}"
                    style="width:300px" required=true missingMessage="违纪原因不能为空!" data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=revokeOutOfPrison&columnName=dicReasonTypeKey&parentKey=81000',panelHeight:'auto',editable:false">
                    	</td>
                </tr>
                <tr>
                    <th>结案报告：</th>
                     <td><div id="endCaseUpload"></div>
                    	<input type="hidden" name="endCaseUploadUrl" id="endCaseUrl">
	     				<input type="hidden" name="endCaseUploadPathName" id="endCasePathName">
						<input type="hidden" name="endCaseUploadPath" id="endCasePath">
                    </td>
                </tr>
                 <c:if test="${not empty revokeOutOfPrison.id}">
                <tr>
					<th>已上传结案报告：</th>
					<td>
						<c:forEach var="sysFile" items="${fileList1}">
						<div id="file_${sysFile.id}">${sysFile.originName}
						<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
					</c:forEach>
					</td>
				</tr>
				</c:if>
				<tr>
                    <th>证据材料：</th>
                    <td><div id="noteUpload"></div>
                    	<input type="hidden" name="noteUploadUrl" id="noteUrl">
	     				<input type="hidden" name="noteUploadPathName" id="notePathName">
						<input type="hidden" name="noteUploadPath" id="notePath">
                    </td>
                </tr>
                <c:if test="${not empty revokeOutOfPrison.id}">
                 <tr>
					<th>已上传证据材料：</th>
					<td>
						<c:forEach var="sysFile" items="${fileList2}">
						<div id="file_${sysFile.id}">${sysFile.originName}
						<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
					</c:forEach>
					</td>
				</tr>
				</c:if>
                <tr>
                    <th><span class="c-red">*</span>简要违纪情况：</th>
					<td>
						<textarea  name="detailInfo"  class="easyui-validatebox" id="revokeOutOfPrison_detailInfo" multiline="true" required=true missingMessage="简要描述不能为空!" 
							onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)' 
							style="width:80%;height:80px;overflow:hidden;" maxlength=200>${revokeOutOfPrison.detailInfo }</textarea>
						<br/>
						<p class="textarea-numberbar">
							备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">${fn:length(revokeOutOfPrison.detailInfo )}</em>个字。
						</p>
					</td>
                </tr> 
                <tr>
                    <th><span class="c-red">*</span>处理依据：</th>
					<td>
						<textarea  name="fact" class="easyui-validatebox" id="revokeOutOfPrison_fact" multiline="true" required=true missingMessage="处理依据不能为空!" 
							onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)' 
							style="width:80%;height:80px;overflow:hidden;" maxlength=200>${revokeOutOfPrison.fact }</textarea>
						<br/>
						<p class="textarea-numberbar">
							备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">${fn:length(revokeOutOfPrison.fact )}</em>个字。
						</p>
                </tr>
               <!--  <tr>
                    <th>短信发送至：</th>
					<td></td>
                </tr>   -->
            </table>
    </div>
    <c:if test="${sysAccount.roleId eq 3003}">
           <input type="hidden" name="decideType" type="text" value="4"/>
     </c:if>
     <c:if test="${sysAccount.roleId ne 3003}">
            <input type="hidden" name="decideType" type="text" value="5"/>
     </c:if>
     <div style="text-align: center;display: none;">
	    <a id="submitOutOfPrisonBtn" class="easyui-linkbutton" >上报</a>
    </div>
</form>
<script>    
$(function() { 
	$("#endCaseUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});	
	$("#noteUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});	
	$('#outOfPrisonInfo').form({
		url:'${ctx}/rewardspunishment/revokeOutOfPrison/save',
		onSubmit:function(){
			setFilePathAndName('endCaseUpload');
			setFilePathAndName('noteUpload');
			 progressLoad();
			 var isValid = $(this).form('validate');
             if (!isValid) {
                 progressClose();
             }
             return isValid;
		},
		success:function(data){
			progressClose();
			data = JSON.parse(data);
			if(data.status==200){
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
	
  	$('#culpritId').combogrid({    
   	delay: 500,
   	panelWidth: 300, 
   	striped:true,
   	panelHeight: 300,
	mode: 'remote',  
	idField: 'id',
	textField: 'name',
	url: '${ctx}/culpritinfo/culprit/list',
	columns: [[
		{field:'name',title:'姓名',width:120,align:'center'},
		{field:'dicSexKey',title:'性别',width:80,align:'center'}
	]],
	fitColumns: true,
	pagination: true,           //是否分页  
	     rownumbers: true,           //序号  
	     collapsible: false,         //是否可折叠的  
	     method: 'post',
	     onSelect:function(record){
	     	 var arr = $('#culpritId').combogrid('grid').datagrid('getSelections');
	     	 $('#culpritInfo').form('load',arr[0]);
	    	}
	     }); 
	     
	     
	   //取得分页组件对象  
	     var pager = $('#culpritId').combogrid('grid').datagrid('getPager');  
	     if (pager) {  
	         $(pager).pagination({  
	             pageSize: 10,               //每页显示的记录条数，默认为10  
	             beforePageText: '第',       //页数文本框前显示的汉字  
	             afterPageText: '',
	             displayMsg: ''
	         });  
	     }
}); 

$('#submitOutOfPrisonBtn').click(function (){
	setFilePathAndName('endCaseUpload');
	setFilePathAndName('noteUpload');
	if($("#outOfPrisonInfo").form('validate')){
    	   $.ajax({
				type: 'post' ,
				url: '${ctx}/rewardspunishment/revokeOutOfPrison/submitRevokeOutOfPrison',
				cache:false ,
				data:$.serializeObject($('#outOfPrisonInfo')) ,
				dataType:'json',
				success:function(data){
					$('#t_outOfParole_list_content').datagrid('reload');
    					parent.$.modalDialog.handler.dialog('close');
				} ,
				error:function(result){
					$.messager.show({
	  					title:'提示信息!',
	  					msg:data.msg
	  				});
				}
			});
		}else{
			 $.messager.show({
				title:'提示信息!' ,
				msg:'验证失败！请检查数据是否已填写完整!'
			}); 

		} 
});



</script>
