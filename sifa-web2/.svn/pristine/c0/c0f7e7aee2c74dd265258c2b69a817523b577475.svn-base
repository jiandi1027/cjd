<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- 引用jquery easy ui的js库及css -->
		<%@include file="/WEB-INF/views/include/head.jsp"%>
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css" />
		<title>审核</title>	
	</head>
	
	<body>

		<form id="askWarningAuditForm" name="askWarningAuditForm" action="${ctx}/rewardspunishment/warning/submitWarningAudit" method="post">
			<input type="hidden" name="taskId" value="${warning.taskId}" /> 
			<input type="hidden" name="id" value="${warning.id}" /> 
			<input type="hidden" name="auditType" value="${warning.auditType}" />
		  	<c:choose>
		 		<c:when test="${empty warning.culpritId }">
		 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
		 		</c:when>
		 		<c:otherwise>
		 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${warning.culpritId}" formId="culpritInfo" isSelect="false"/>
		 		</c:otherwise>
		 	</c:choose>
           
 			<div class="easyui-panel" title="相关信息" style="width:100%;padding:10px;">
	           <table width="100%" class="grid">
	                <tr>
						<th width="10%">违纪原因：</th>
						<td colspan="5">${warning.dicReasonTypeKey} </td>
	                </tr> 
					<tr>
						<th>处理依据：</th>
						<td colspan="5">
							<c:choose>
								<c:when test="${warning.legalBasis != null && warning.legalBasis != ''}">
									<c:choose>
										<c:when test="${warning.notePathName != null && warning.notePathName != ''}">
											1、${warning.legalBasis}<br>
											2、${warning.notePathName}
											<c:if test="${warning.legalBasisItems != null && warning.legalBasisItems != ''}">
												<br>3、${warning.legalBasisItems}
											</c:if>
										</c:when>
										<c:when test="${warning.legalBasisItems != null && warning.legalBasisItems != ''}">
											1、${warning.legalBasis}<br>
											2、${warning.legalBasisItems}
										</c:when>
										<c:otherwise>
											${warning.legalBasis}
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${warning.notePathName != null && warning.notePathName != ''}">
									<c:choose>
										<c:when test="${warning.legalBasisItems != null && warning.legalBasisItems != ''}">
											1、${warning.notePathName}<br>
											2、${warning.legalBasisItems}
										</c:when>
										<c:otherwise>
											${warning.notePathName}
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${warning.legalBasisItems != null && warning.legalBasisItems != ''}">
									${warning.legalBasisItems}
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr>	
						<th >附件下载：</th>
						<td colspan="5">
 							<c:forEach var="sysFile" items="${fileList}">
								<div id="file_${sysFile.id}">
									${sysFile.originName}
									<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
								</div>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th>主要事实：</th>
						<td colspan="5">${warning.fact }</td>
					</tr>
				</table>
    		</div>
    		<c:if test="${sysAccount ne 3003 && sysAccount ne 2007 }">
			<div class="easyui-panel" title="审核意见" style="width:100%;padding:10px;">
				<table  width="100%" class="grid">
					<c:if test="${warning.auditType ne 'workerReport' }">
						<TR>
							<th width="10%"><span class="c-red">*</span>审核结果：</th>
						<TD >
							<input type="radio" name="decideType"value="1" checked="checked" />同意 
							<c:if test="${sysAccount eq 2002 }">
								<input type="radio"name="decideType" value="0" />不同意
							</c:if>
							<c:if test="${sysAccount ne 3003 }">
								<input type="radio"name="decideType" value="2" />退回
							</c:if>
						</TD>
						</TR>
						<tr>
							<th >审核意见：</th>
							<td width="23%">
								<textArea class="f1 easyui-textbox" data-options="multiline:true" name="opinion" 
									style="width: 75%; height: 120px" onkeydown='textarealength(this,300)' onKeyUp="textarealength(this,300)" maxlength="300"></textArea>
								<br>
									备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
							</td>
						</tr>
				</c:if>
				</table>
			</div>
			</c:if>
			<c:if test="${warning.auditType eq 'usertask1' }">
				<c:if test="${sysAccount eq 3003 }">
					<input type="hidden" name="decideType" value="1" /><div style="display:none;">同意</div> 
				</c:if>
				<c:if test="${sysAccount eq 2007 }">
					<input type="hidden" name="decideType" value="3" /><div style="display:none;">同意</div> 
				</c:if>
			</c:if>
	</form>
	<script type="text/javascript">
	  $(function() {
      	$('#askWarningAuditForm').form({
      		url:'${ctx}/rewardspunishment/warning/submitWarningAudit',
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
      			//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
 				parent.$.modalDialog.openner_dataGrid.datagrid('reload');
                parent.$.modalDialog.handler.dialog('close');
      			if(data.status==200){
      				$.messager.show({
      					title:'提示信息!' ,
      					msg:data.msg
      				});
      			}else{
      				 parent.$.messager.alert('错误', result.msg, 'error');
      			}
      		}
      	});
      });
		
	</script>
</body>
</html>