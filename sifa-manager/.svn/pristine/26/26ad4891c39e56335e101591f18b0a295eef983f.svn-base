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

	<form id="askLeaveAuditForm" name="askLeaveAuditForm" action="${ctx}/jiangcheng/reducePenalty/submitCommendAudit" method="post">
		<input type="hidden" name="taskId" value="${reducePenalty.taskId}" /> <input
			type="hidden" name="id" value="${reducePenalty.id}" /> <input
			type="hidden" name="auditType" value="${reducePenalty.auditType}" />
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
                  <td>${culprit.dicYzzmmKey }</td>
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

		<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%"
			bgColor=#c4d8ed>

			<TBODY>
				<TR>
					<TD background="${ctxStatic}/images/r_0.gif" width="100%">
						<TABLE cellSpacing=0 cellPadding=0 width="100%">
							<TBODY>
								<TR>
									<TD>&nbsp;减刑基本信息</TD>
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

								 <tr>
                   <td>证据材料:</td>
							<td>无附件</td>
                </tr>
                <tr>
                    <td>结案报告:</td>
					<td>无附件</td>
                </tr>
                <tr>
                    <td>法律依据:</td>
					<td ><input class="easyui-textbox" data-options="multiline:true" value=${reducePenalty.reason }  style="width:300px"></td>
                </tr>
                <tr>
                    <td>表现情况:</td>
					<td ><input class="easyui-textbox" data-options="multiline:true" value=${reducePenalty.actions } style="width:300px"></td>
                </tr>


							</TBODY>
						</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>

		<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%"
			bgColor=#c4d8ed>

			<TBODY>
				<c:if test="${commend.auditType ne 'workerReport' }">
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
				<tr>
					<td colspan=4 align=center class=category><a id="submitbtn"
						class="easyui-linkbutton" iconCls="icon-save" href="#"
						onclick="doAudit()">提交</a></td>
				</tr>
			</TBODY>
		</TABLE>
		<c:if test="${commend.auditType eq 'workerReport' }">
			<input type="hidden" name="decideType" value="1" />
		</c:if>

	</form>
	<script type="text/javascript">
		function doAudit() {
			$('#askLeaveAuditForm').form('submit');
		}
		$(function() {
			$('#askLeaveAuditForm').form({
				url : '${ctx}/jiangcheng/reducePenalty/submitCommendAudit',
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