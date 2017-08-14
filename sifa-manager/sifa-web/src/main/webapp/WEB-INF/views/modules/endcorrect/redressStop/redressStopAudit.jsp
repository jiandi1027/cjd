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
<form id="redressStopAuditForm" name="redressStopAuditForm" action="${ctx}/endcorrect/redressStop/submitRedressStopAudit" method="post">
	<input type="hidden" name="taskId" value="${redressStop.taskId}"/>
	<input type="hidden" name="id" value="${redressStop.id}"/>
	<input type="hidden" name="auditType" value="${redressStop.auditType}"/>
	<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>

   <TBODY>
   <TR>
   
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;终止矫正信息</TD>
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
								 ${redressStop.culpritName}
								</TD>
								<TD height=30 width="10%" align=right >终止矫正日期：</TD>
								<TD class=category width="23%">
								<fmt:formatDate value="${redressStop.jjrq }"
									pattern="yyyy-MM-dd HH:mm:ss" />
								
								</TD>
								<TD height=30 width="10%" align=right >终止矫正原因：</TD>
								<TD class=category >
								${redressStop.jjsm }
								</TD>
								
								
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >采取的措施和处理结果：</TD>
								<TD class=category width="23%">
								${redressStop.measure}
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
    <c:if test="${redressStop.auditType ne 'xgzryprint' }">
<TR>
   			
				<TD height=30 width="15%" align=right >审核结果：</TD>
								<TD  width="35%">
								<input type="radio" name="decideType" value="1" checked="checked"/>同意
								<input type="radio" name="decideType" value="0"/>不同意
								</TD>
								<TD height=30 width="15%" align=right >审核意见</TD>
								<TD  width="35%">
								<textarea rows="3" cols="30" name="opinion" required=true missingMessage="审核意见不能为空!"></textarea>
								</TD>
				</TR>
				</c:if>
				 <c:if test="${redressStop.auditType eq 'xgzryprint' }">
<TR>
				<TD height=30 width="15%" align=right >审核结果：</TD>
								<TD  width="35%">
								<input type="radio" name="decideType" value="0" checked="checked"/>结束流程
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
</form>
<script type="text/javascript">
function doAudit(){
	$("#redressStopAuditForm").submit();
}

$(function() {
	$('#redressStopAuditForm').form({
		url:'${ctx}/endcorrect/redressStop/submitRedressStopAudit',
		onSubmit:function(){
			return $(this).form('validate');
		},
		success:function(result){
			$.messager.show({
				title : result.status == 200 ? "ok" : "fail",
				msg : result.msg
			});

			parent.location.reload(); // 父页面刷新
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		},
		error:function(result) {
			$.messager.show({
				title : result.status == 200 ? "ok" : "fail",
				msg : result.msg
			});
		}
	});	
});
</script>
</body>
</html>