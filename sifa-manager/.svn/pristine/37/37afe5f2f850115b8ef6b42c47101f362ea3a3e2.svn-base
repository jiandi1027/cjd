<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引用jquery easy ui的js库及css -->
<%@include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/css/style.css" />
</head>
<body>
<form id="deathAuditForm" name="deathAuditForm" action="${ctx}/endcorrect/death/submitDeathAudit" method="post">
	<input type="hidden" name="taskId" value="${death.taskId}"/>
	<input type="hidden" name="id" value="${death.id}"/>
	<input type="hidden" name="auditType" value="${death.auditType}"/>
	<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>

   <TBODY>
   <TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;死亡登记信息</TD>
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
								<TD height=30 width="10%" align=right >姓名：</TD>
								<TD class=category width="23%">
								 ${death.culpritName}
								</TD>
								
								<TD height=30 width="10%" align=right >死亡时间：</TD>
								<TD class=category width="23%">
								<fmt:formatDate value="${death.deathlTime }"
									pattern="yyyy-MM-dd HH:mm:ss" />
								
								</TD>
								<TD height=30 width="10%" align=right >死亡原因：</TD>
								<TD class=category >
								${death.deathReason }
								</TD>
								
								
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >死亡相关情况：</TD>
								<TD class=category width="23%">
								${death.situation}
								</TD>
								
								
								
							</TR>
						
							</TBODY>
						</TABLE>
					</TD>
				</TR>
   </TBODY>
</TABLE>

<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>

   <TBODY>
   <c:if test="${death.auditType ne 'sfsSb' }">
    <c:if test="${death.auditType ne 'xgzryprint' }">
<TR>
   			
				<TD height=30 width="15%" align=right >审核结果：</TD>
								<TD  width="35%">
								<input type="radio" name="decideType" value="1" checked="checked"/>同意
								<input type="radio" name="decideType" value="0"/>不同意
								<input type="radio" name="decideType" value="2" />退回
								</TD>
								<TD height=30 width="15%" align=right >审核意见</TD>
								<TD  width="35%">
								<textarea rows="3" cols="30" name="opinion" required=true missingMessage="审核意见不能为空!"></textarea>
								</TD>
				</TR>
				</c:if>
				</c:if>
				 <c:if test="${death.auditType eq 'xgzryprint' }">
<TR>
				<TD height=30 width="15%" align=right >审核结果：</TD>
								<TD  width="35%">
								<input type="radio" name="decideType" value="1" checked="checked"/>结束流程
								</TD>
				</TR>
				</c:if>
				<tr>
							  <td colspan=4 align=center class=category>
								<input type ="button"id="submitbtn"  class="easyui-linkbutton"  value="提交"  iconCls="icon-save" href="#" onclick="doAudit()"/>
							  </td>
							</tr>
   </TBODY>
</TABLE>
	 <c:if test="${death.auditType eq 'sfsSb' }">
	 <input type="hidden" name="decideType" value="1"/>
	 </c:if>
	
</form>
<script type="text/javascript">
function doAudit(){
	$("#deathAuditForm").submit();
	
}
</script>
</body>
</html>