<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form id="deathAuditForm" name="deathAuditForm" action="${ctx}/endcorrect/death/submitDeathAudit" method="post">
	<input type="hidden" name="taskId" value="${death.taskId}"/>
	<input type="hidden" name="id" value="${death.id}"/>
	<input type="hidden" name="auditType" value="${death.auditType}"/>
	<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${death.culpritId}" formId="deathAuditForm" isSelect="false"/>
 
	<div class="easyui-panel" title="死亡登记信息" style="width:100%;padding:5px;margin: 0 auto;">
		<table width="100%" class="grid">
			<c:if test="${death.auditType eq 'sfsSb' }">
			<tr>
            	<th width="10%"><span class="c-red">*</span>死亡日期：</th>
				<td width="90%">
					<input name="deathlTime" id="deathlTime" class="Wdate easyui-validatebox" value="<fmt:formatDate value='${death.deathlTime}' pattern='yyyy-MM-dd' />" 
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd'})" required=true missingMessage="死亡时间不能为空!"/>
				</td>
        	</tr>
         	<tr>
            	<th><span class="c-red">*</span>死亡原因：</th>
				<td><textArea id="deathReason" name="deathReason" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					required=true missingMessage="死亡原因不能为空!"
					onkeydown='textarealength(this,800)' onKeyUp="textarealength(this,800)" onMouseOut='textarealength(this,800)' maxlength="800">${death.deathReason }</textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">800</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
         	</tr>
           	<tr>
             	<th><span class="c-red">*</span>具体死亡情况：</th>
				<td><textArea id="situation" name="situation" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					required=true missingMessage="具体死亡情况不能为空!"
					onkeydown='textarealength(this,1000)' onKeyUp="textarealength(this,1000)" onMouseOut='textarealength(this,1000)' maxlength="1000">${death.situation }</textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">1000</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
        	</tr>
        	
	        <tr>
				<th>相关材料：</th>
				<td>
					<div id="deathUpload"></div>
				</td>
			</tr>
           	<tr>
             	<th>已上传：</th>
				<td>
				<div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList}">
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
			<c:if test="${death.auditType ne 'sfsSb' }">
        	<tr>
            	<th width="10%">死亡日期：</th>
				<td width="90%"><fmt:formatDate value='${death.deathlTime}' pattern="yyyy-MM-dd" />
				</td>
        	</tr>
         	<tr>
            	<th>死亡原因：</th>
				<td><textArea id="deathReason" name="deathReason" class="easyui-validatebox" readonly="readonly" 
					style="width: 80%;height:50px;overflow:auto;resize:none;">${death.deathReason }</textArea>
				</td>
         	</tr>
           	<tr>
             	<th>具体死亡情况：</th>
				<td><textArea id="situation" name="situation" class="easyui-validatebox" readonly="readonly" 
					style="width: 80%;height:50px;overflow:auto;resize:none;">${death.situation }</textArea>
				</td>
        	</tr>
           	<tr>
             	<th>相关材料：</th>
				<td>
				<div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList}">
					<div id="file_${sysFile.id}">
					${sysFile.originName}
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
				</div>
				</td>
        	</tr>
			</c:if>
    	</table>
    </div>

	<c:if test="${death.auditType ne 'sfsSb' }">
	<div class="easyui-panel" title="流程信息" style="width:100%;padding:5px;margin: 0 auto;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">审核结果：</th>
				<c:choose>
					<c:when test="${death.auditType eq 'xgzryprint' }">
						<td width="90%"><input type="radio" name="decideType" value="1" checked="checked"/>流程结束</td>
					</c:when>
					<c:otherwise>
						<td width="90%">
							<input type="radio" name="decideType" value="1" checked="checked"/>同意
							<input type="radio" name="decideType" value="0"/>不同意
							<input type="radio" name="decideType" value="2"/>退回
						</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th width="10%">审核意见：</th>
				<td width="90%"><textArea id="situation" name="situation" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,200)' onKeyUp='textarealength(this,200)' onMouseOut='textarealength(this,200)' maxlength="200"></textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
			</tr>
		</table>
	</div>
	</c:if>
	<c:if test="${death.auditType eq 'sfsSb' }">
		<input type="hidden" name="decideType" value="1" />
	</c:if>
	
</form>
<script type="text/javascript">
var audittype = '${death.auditType}';

$(function() {
	$("#deathUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
	
	$('#deathAuditForm').form({
		url:'${ctx}/endcorrect/death/submitDeathAudit',
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
				var msg = data.msg;
				if (audittype == 'sfsSb') {
					msg = '上报成功'
				}
				if (audittype == 'xgzryprint') {
					msg = '流程结束'
				}
				
				$.messager.show({
					title:'提示信息!' ,
					msg:msg
				});
				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                 parent.$.modalDialog.handler.dialog('close');
			}else{
				 parent.$.messager.alert('错误', data.msg, 'error');
			}
			progressClose();
		}
	});	
});
</script>