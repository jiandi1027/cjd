<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/rewardspunishment/securityPunishment/save" method="post" id="securityPunishmentInfo">
	<input type="hidden" name="id" id="id" value="${securityPunishment.id}"/>
	
	<c:choose>
 		<c:when test="${empty securityPunishment.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="securityPunishmentInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${securityPunishment.culpritId}" formId="securityPunishmentInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
	
	<div class="easyui-panel" title="治安管理处罚相关信息" style="width:100%;padding:5px;margin-bottom: 10px;">
		<table width="100%" class="grid">
	        <tr>
	        	<th width="10%"><span class="c-red">*</span>违规违纪原因：</th>
				<td width="90%">
				<input id="reasonTypeId" name="reasonTypeId" class="f1 easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_security_punishment&columnName=reason_type_id&parentKey=99000',panelHeight:'auto'"
    				required=true style="width:173px;" value="${securityPunishment.reasonTypeId}" ></td>
	        </tr>
			
			<tr>
            	<th>结案报告：</th>
            	<td><div id="endCaseUpload"></div>
					<input type="hidden" name="endCaseUploadUrl" id="endCaseUrl">
					<input type="hidden" name="endCaseUploadPathName" id="endCasePathName">
					<input type="hidden" name="endCaseUploadPath" id="endCasePath">
            	</td>
            </tr>
            <c:if test="${not empty securityPunishment.id}">
            <tr>
            	<th>结案报告附件：</th>
            	<td>
            	<div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList1}">
					<div id="file_${sysFile.id}">
					${sysFile.originName}
					<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
				</div>
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
            <c:if test="${not empty securityPunishment.id}">
            <tr>
            	<th>证据材料附件：</th>
            	<td>
            	<div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList2}">
					<div id="file_${sysFile.id}">
					${sysFile.originName}
					<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
				</div>
            	</td>
            </tr>
            </c:if>
            <tr>
            	<th>简要违纪情况：</th>
				<td><textArea id="detailInfo" name="detailInfo" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,200)' onKeyUp='textarealength(this,200)' onMouseOut='textarealength(this,200)' maxlength="200">${securityPunishment.detailInfo}</textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
				</td>
            </tr>
            <tr>
            	<th>处理依据：</th>
				<td><textArea id="reason" name="reason" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,200)' onKeyUp='textarealength(this,200)' onMouseOut='textarealength(this,200)' maxlength="200">${securityPunishment.reason}</textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
				</td>
            </tr>
		</table>
    </div>
</form>
<script>
$(function() {
	$("#endCaseUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
	$("#noteUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
	
	$('#securityPunishmentInfo').form({
		url:'${ctx}/rewardspunishment/securityPunishment/save',
		async : true,
   		onSubmit:function(){
   			progressLoad();
   			var isValid = $(this).form('validate');
            if (!isValid) {
            	progressClose();
            }
            setFilePathAndName('endCaseUpload');
            setFilePathAndName('noteUpload');

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
   				$.messager.alert('错误', data.msg, 'error');
   			}
   		}
   	});	
     
});

</script>