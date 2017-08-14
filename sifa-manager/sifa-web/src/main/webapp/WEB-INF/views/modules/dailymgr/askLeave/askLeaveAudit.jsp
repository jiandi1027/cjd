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
<title>采购单审核</title>
</head>
<body>

<form id="askLeaveAuditForm" name="askLeaveAuditForm" action="${ctx}/dailymgr/askLeave/submitAskLeaveAudit" method="post">
	<input type="hidden" name="taskId" value="${askLeave.taskId}"/>
	<input type="hidden" name="id" value="${askLeave.id}"/>
	<input type="hidden" name="auditType" value="${askLeave.auditType}"/>
	<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>

   <TBODY>
   <TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;请假基本信息</TD>
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
								<TD height=30 width="10%" align=right >申请日期：</TD>
								<TD class=category width="23%">
									<fmt:formatDate value="${askLeave.doDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />
								</TD>
								
								<TD height=30 width="10%" align=right >外出目的地：</TD>
								<TD class=category width="23%">
								${askLeave.place }
								</TD>
								<TD height=30 width="10%" align=right >经手人：</TD>
								<TD class=category >
								${askLeave.creater }
								</TD>
								
								
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >请假开始日期：</TD>
								<TD class=category width="23%">
								<fmt:formatDate value="${askLeave.beginDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />
								</TD>
								
								<TD height=30 width="10%" align=right >请假截至日期：</TD>
								<TD class=category width="23%">
								<fmt:formatDate value="${askLeave.endDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />
								</TD>
								<TD height=30 width="10%" align=right >请假事由：</TD>
								<TD class=category >
								${askLeave.reason }
								</TD>
								
								
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >活动范围：</TD>
								<TD class=category colspan="5">
								${askLeave.activeArea }
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
   <TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;被访问者基本信息</TD>
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
								<TD height=30 width="10%" align=right >被访问者姓名：</TD>
								<TD class=category width="23%">
								${askLeave.askName }
								</TD>
								
								<TD height=30 width="10%" align=right >与矫正人员关系：</TD>
								<TD class=category width="23%">
								${askLeave.relation }
								</TD>
								<TD height=30 width="10%" align=right >职业及工作单位：</TD>
								<TD class=category >
								${askLeave.job }
								</TD>
								
								
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >政治面貌：</TD>
								<TD class=category width="23%">
								${askLeave.dicPoliticStatusKey }
								</TD>
								
								<TD height=30 width="10%" align=right >被访问者家庭住址：</TD>
								<TD class=category colspan="3">
								${askLeave.askAddress }
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
   <c:if test="${askLeave.auditType ne 'workerReport' }">
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
				<tr>
							  <td colspan=4 align=center class=category>
								<a id="submitbtn"  class="easyui-linkbutton"   iconCls="icon-save" href="#" onclick="doAudit()">提交</a>
							  </td>
							</tr>
   </TBODY>
</TABLE>
	 <c:if test="${askLeave.auditType eq 'workerReport' }">
	 <input type="hidden" name="decideType" value="1"/>
	 </c:if>
	
</form>
<script type="text/javascript">
function doAudit(){
	 $('#askLeaveAuditForm').form('submit');
}
$(function() {
	$('#askLeaveAuditForm').form({
		url:'${ctx}/dailymgr/askLeave/submitAskLeaveAudit',
		onSubmit:function(){
			return $(this).form('validate');
		},
		success:function(data){
			data = JSON.parse(data);
			if(data.status==200){
				$.messager.show({
					title:'提示信息!' ,
					msg:data.msg
				});
				parent.location.reload(); // 父页面刷新
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
			}else{
				alert(data.msg);
			}
		
		}
	});	
});

</script>
</body>
</html>