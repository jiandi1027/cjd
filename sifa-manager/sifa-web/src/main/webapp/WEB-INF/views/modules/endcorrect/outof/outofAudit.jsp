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

	<form id="askLeaveAuditForm" name="askLeaveAuditForm" action="${ctx}/endcorrect/outof/warningAudit" method="post">
		<input type="hidden" name="taskId" value="${outof.taskId}" /> <input
			type="hidden" name="id" value="${outof.id}" /> <input
			type="hidden" name="auditType" value="${outof.auditType}" />
	<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" >
   	<TBODY>
    <TR>
		<TD background="${ctxStatic}/images/r_0.gif" width="100%">
				<TABLE cellSpacing=0 cellPadding=0 width="100%">
					<TBODY>
						<TR>
							<TD>&nbsp;矫正对象基本信息</TD>
							<TD align=right>&nbsp;</TD>
						</TR>
					</TBODY>
				</TABLE>
			</TD>
		</TR>
	<TR>
		<TD>
			<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4
				align=center>
				<TBODY>
				   <TR>
			<TD >
				<TABLE cellSpacing=0 cellPadding=0 width="100%">
					<TBODY>
						<TR>
							<TD>&nbsp;迁出基本信息</TD>
							<TD align=right>&nbsp;</TD>
						</TR>
					</TBODY>
				</TABLE>
			</TD>
		</TR>
				<tr>
                  <td>姓名:</td>
                  <td colspan="5">${culprit.name }</td>
              </tr>
              <tr>
                  <td width="15%">性别:</td>
                  <td>${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'') }</td>
                   <td width="15%">民族:</td>
                  <td>${culprit.nation }</td>
                   <td width="15%">身份证号:</td>
                  <td>${culprit.identification }</td>
              </tr>
              <tr>
                  <td>曾用名:</td>
                  <td>${culprit.alias }</td>
                   <td>出生日期:</td>
                  <td>${culprit.birthday }</td>
                   <td>文化程度:</td>
                  <td>${fns:getSysDicValueByKey('common_table','whcd',culprit.dicWhcdKey,'') }</td>
              </tr>
              
               <tr>
                  <td>婚姻状况:</td>
                  <td>${fns:getSysDicValueByKey('common_table','hyzk',culprit.dicHyzkKey,'') }</td>
                   <td>职业:</td>
                  <td>${culprit.job }</td>
                   <td>原政治面貌:</td>
                  <td>${fns:getSysDicValueByKey('common_table','zzmm',culprit.dicYzzmmKey,'') }</td>
              </tr>
               <tr>
                  <td>籍贯:</td>
                  <td>${culprit.origin }</td>
                   <td>户籍所在地:</td>
                  <td>${culprit.regResidenceStreet }</td>
                   <td>现居住地:</td>
                  <td>${culprit.addressDetail }</td>
              </tr>
              <tr>
                  <td>刑法执行类别:</td>
                  <td></td>
                   <td>矫正开始时间:</td>
                  <td><fmt:formatDate value="${culprit.redressStartDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
                   <td>矫正结束时间:</td>
                  <td><fmt:formatDate value="${culprit.redressEndDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
              </tr>
				</TBODY>
			</TABLE>
		</TD>
	</TR> 
   </TBODY>

</TABLE>

	<TABLE  class="toptable grid" border=1 cellSpacing=1 cellPadding=4
				align=center>
   	<TBODY>
		<tr>
				<td>迁出时间:</td>
				<td><fmt:formatDate value="${outof.moveTime}"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>迁出地点:</td>
				<td>${outof.place }</td>
				<td>是否私自:</td>
				<td>${outof.isPrivate }</td>
			</tr>
			<tr>
				<td>迁出事由:</td>
				<td>${outof.leaveReason }
				</td>
				<td>与矫正人员关系:</td>
				<td>${outof.relation }
						</td>
				<td>职业:</td>
				<td>${outof.job }</td>
			</tr>
			<tr>
				<td>亲属姓名:</td>
				<td >${outof.folkName }</td>
				<td>亲属家庭住址:</td>
				<td >${outof.folkAddress }</td>
				<td>就医情况:</td>
				<td>${outof.hospitalize }</td>
			</tr>
				<tr>
				<td>政治面貌:</td>
				<td >${outof.politicStatus }</td>
				<td>附加1:</td>
				<td >无附件</td>
				<td>附加2:</td>
				<td >无附件</td>
			</tr>
			<tr>
				<td>司法所意见:</td>
				<td >${outof.sfsView }</td>
				<td>备注：</td>
				<td >${outof.note }</td>
			
			</tr>
   </TBODY>

</TABLE>
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%"
			bgColor=#c4d8ed>

			<TBODY>
				<c:if test="${outof.auditType ne 'workerReport' }">
					<TR>

						<TD height=30 width="15%" align=right>审核结果：</TD>
						<TD width="35%">
							<input type="radio" name="decideType"value="1" checked="checked" />同意 
							<input type="radio"name="decideType" value="2" />退回
						<TD height=30 width="15%" align=right>审核意见</TD>
						<TD width="35%"><textarea rows="3" cols="30" name="opinion"
								required=true missingMessage="审核意见不能为空!"></textarea></TD>
					</TR>
				</c:if>
			
			</TBODY>
		</TABLE>
		<c:if test="${outof.auditType eq 'workerReport' }">
			<input type="hidden" name="decideType" value="1" />
		</c:if>

	</form>
	<script type="text/javascript">
		
		$(function() {
			$('#askLeaveAuditForm').form({
				url : '${ctx}/endcorrect/outof/warningAudit',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {
					data = JSON.parse(data);
					if (data.status == 200) {
						$.messager.show({
							title : '提示信息!',
							msg : data.msg
						});
						
						parent.location.reload(); // 父页面刷新
					
						var index = parent.layer.getFrameIndex(window.name);
						
						parent.layer.close(index);
						
					} else {
						alert(data.msg);
					}

				}
			});
		});
	</script>
</body>
</html>