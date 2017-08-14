<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
 

	<form id="commendAuditForm" name="commendAuditForm" action="${ctx}/rewardspunishment/commend/submitCommendAudit" method="post">
		<input type="hidden" name="taskId" value="${commend.taskId}" /> <input
			type="hidden" name="id" value="${commend.id}" /> <input
			type="hidden" name="auditType" value="${commend.auditType}" />

  	<c:choose>
 		<c:when test="${empty commend.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${commend.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    

<div class="easyui-panel" title="相关信息" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
                <tr>
                   <th width="10%">处理时间：</th>
					<td width="23%"><fmt:formatDate value="${commend.doDate}"
									pattern="yyyy-MM-dd" /></td>
					<th width="10%">申请人：</th>
					<td width="23%"> ${commend.sponsor}</td>
								
					<th width="10%">表扬原因：</th>
					<td width="23%">${commend.reason}</td>
				<tr>
					<th>其他缘故：</th>
					<td>${commend.note}</td>
					 <th>考核开始时间：</th>
					<td><fmt:formatDate value="${commend.beginDate}"
									pattern="yyyy-MM-dd" />
					</td>
					 <th>考核结束时间：</th>
					<td><fmt:formatDate value="${commend.endDate}"
									pattern="yyyy-MM-dd" />
					</td>		
				</tr>
				<tr>
					<th>具体事实：</th>
					<td colspan="5">${commend.fact} </td>
				
				</tr>
			<tr>
						<th>上传附件：</th>
					<td style="border-right-style:none" colspan="5">
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
			</table>
    </div>
   <c:if test="${commend.auditType ne 'sfsReport' and commend.auditType ne 'jzkReport'}">
<div class="easyui-panel" title="审核意见" style="width:100%;padding:5px;">
		<table  width="100%" class="grid">
					<TR>

						<th width="10%">审核结果：</th>
						<td width="90%">
							<input type="radio" name="decideType"value="1" checked="checked" />同意 
							<input type="radio"name="decideType" value="2" />退回

						</td>
					</TR>
				    <tr>
				    	<th ><span class="c-red">*</span>审核意见：</th>
						<td>
						<textArea class="f1 easyui-validatebox"
					data-options="multiline:true" name="opinion" 
					style="width: 600px; height: 100px" onkeydown='textarealength(this,300)' onKeyUp="textarealength(this,300)" maxlength="300" required=true></textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。</td>
				    </tr>
		</table>
</div>
</c:if>
		<%-- <c:if test="${commend.auditType ne 'sfsReport'}">
			<input type="hidden" name="decideType" value="1" /><div style="display:none;">同意</div> 
		</c:if> --%>

	</form>
	<script type="text/javascript">
	     $(function() {
	        	$('#commendAuditForm').form({
	        		url:'${ctx}/rewardspunishment/commend/submitCommendAudit',
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
	        			progressClose();
	        			if(data.status==200){
	        				$.messager.show({
	        					title:'提示信息!' ,
	        					msg:data.msg
	        				});
	        				
	        				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
	                         parent.$.modalDialog.handler.dialog('close');
	    					
	        			}else{
	        				 parent.$.messager.alert('错误', data.msg, 'error');
	        			}
	        			
	        		}
	        	});
	        });
	
	</script>
