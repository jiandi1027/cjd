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

	<form id="outOfAuditForm" name="outOfAuditForm" action="${ctx}/endcorrect/outof/submitOutOfAudit" method="post">
		<input type="hidden" name="taskId" value="${outof.taskId}" /> <input
			type="hidden" name="id" value="${outof.id}" /> <input
			type="hidden" name="auditType" value="${outof.auditType}" />
	  	<c:choose>
 		<c:when test="${empty outof.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${outof.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    

<div class="easyui-panel" title="相关信息" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
         <tr>
				<th width="10%">迁出时间：</th>
				<td width="23%"><fmt:formatDate value="${outof.moveTime}"
						pattern="yyyy-MM-dd" /></td>
				<th width="10%">迁出地点：</th>
				<td width="23%">${outof.place }</td>
				<th width="10%">是否私自：</th>
				<td width="23%"> ${fns:getSysDicValueByKey('SF_MOVE_OUT','isPrivate',outof.isPrivate ,'')}</td>
			</tr>
			<tr>
				<th>迁出事由：</th>
				<td>${outof.leaveReason }
				</td>
				<th>与矫正人员关系：</th>
				<td>${outof.relation }
						</td>
				<th>职业：</th>
				<td>${outof.job }</td>
			</tr>
			<tr>
				<th>亲属姓名：</th>
				<td >${outof.folkName }</td>
				<th>亲属家庭住址：</th>
				<td >${outof.folkAddress }</td>
				<th>就医情况：</th>
				<td>${outof.hospitalize }</td>
			</tr>
			<tr>
				<th>政治面貌：</th>
				<td >${outof.politicStatus }</td>
				<th>司法所意见：</th>
				<td >${outof.sfsView }</td>
				<th>备注：</th>
				<td >${outof.note }</td>
				
			</tr>
			<tr>
				<th>附加：</th>
				<td ><div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList}">
					<div id="file_${sysFile.id}">
					${sysFile.originName}
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
				</div></td>
			</tr>
			</table>
    </div>
    <c:if test="${sysAccount ne 3003 }">
		<div class="easyui-panel" title="审核意见" style="width:100%;padding:5px;">
		<table  width="100%" class="grid">
					<TR>
						<th width="10%">审核结果：</th>
						<td width="90%">
							<input type="radio" name="decideType" value="1" checked="checked" />同意 
							<input type="radio" name="decideType" value="0" />不同意
							<input type="radio" name="decideType" value="2" />退回
						</td>
					</TR>
				    <tr>
				    	<th >审核意见：</th>
						<td width="23%">
							<!-- 
							<textArea class="f1 easyui-validatebox" data-options="multiline:true" name="opinion" 
								style="width: 75%; height: 100px" onkeydown='textarealength(this,300)' onKeyUp="textarealength(this,300)" maxlength="300"></textArea>
							-->
							<textArea class="f1 easyui-textbox" data-options="multiline:true" name="opinion" 
								style="width: 75%; height: 120px" onkeydown='textarealength(this,300)' onKeyUp="textarealength(this,300)" maxlength="300"></textArea>
							<br>
							备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
						</td>
				    </tr>
				    
				
		</table>
</div>
</c:if>
		<c:if test="${outof.auditType eq 'usertask1' ||outof.auditType eq 'usertask5'}">
			<input type="hidden" name="decideType" value="1" /><div style="display:none;">同意</div>
		</c:if>

	</form>

	</form>
	<script type="text/javascript">
	
        $(function() {
        	$('#outOfAuditForm').form({
        		url:'${ctx}/endcorrect/outof/submitOutOfAudit',
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
        			} else {
        				 parent.$.messager.alert('错误', result.msg, 'error');
        			}
        		}
        	});
        });
	</script>
</body>
</html>