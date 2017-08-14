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

<form id="moveInAuditForm" name="moveInAuditForm" action="${ctx}/culprit/moveIn/submitMoveInAudit" method="post">
	<input type="hidden" name="taskId" value="${moveIn.taskId}"/>
	<input type="hidden" name="id" value="${moveIn.id}"/>
	<input type="hidden" name="auditType" value="${moveIn.auditType}"/>
	<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>

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
								<TD height=30 width="10%" align=right >姓名：</TD>
								<TD class=category width="23%">
									<!--<fmt:formatDate value="${askLeave.doDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />-->
									${moveIn.name }
								</TD>
								
								<TD height=30 width="10%" align=right >性别：</TD>
								<TD class=category width="23%">
								${moveIn.dicSexKey }
								</TD>
								<TD height=30 width="10%" align=right >原政治面貌：</TD>
								<TD class=category >
								${moveIn.oldPoliticStatusId }
								</TD>
								
								
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >原判罪名：</TD>
								<TD class=category >
								${moveIn.crimeInfo }
								</TD>
								<TD height=30 width="10%" align=right >刑期开始日期：</TD>
								<TD class=category width="23%">
								<fmt:formatDate value="${moveIn.adjudgeStartTime}"
									pattern="yyyy-MM-dd HH:mm:ss" />
								</TD>
								
								<TD height=30 width="10%" align=right >刑期结束日期：</TD>
								<TD class=category width="23%">
								<fmt:formatDate value="${moveIn.adjudgeEndTime}"
									pattern="yyyy-MM-dd HH:mm:ss" />
								</TD>
								
								
								
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >矫正开始日期：</TD>
								<TD class=category width="23%">
								<fmt:formatDate value="${moveIn.redressStartDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />
								</TD>
								
								<TD height=30 width="10%" align=right >矫正结束日期：</TD>
								<TD class=category width="23%">
								<fmt:formatDate value="${moveIn.redressEndDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />
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
								<TD>&nbsp;迁入基本信息</TD>
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
								<TD height=30 width="10%" align=right >申请时间：</TD>
								<TD class=category width="23%">
								
								<fmt:formatDate value="${moveIn.moveTime}"
									pattern="yyyy-MM-dd HH:mm:ss" />
								</TD>
								
								<TD height=30 width="10%" align=right >原司法所：</TD>
								<TD class=category width="23%">
								${moveIn.oldGroup }
								</TD>
								<TD height=30 width="10%" align=right >拟迁入司法所：</TD>
								<TD class=category >
								${moveIn.groupId }
								</TD>
								
								
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >居住地变更原因：</TD>
								<TD class=category width="23%">
								${moveIn.reason }
								</TD>
								
								<TD height=30 width="10%" align=right >司法所意见：</TD>
								<TD class=category colspan="3">
								${moveIn.opinion }
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
   <c:if test="${moveIn.auditType eq 'sfsCheck' || moveIn.auditType eq 'sjzkCheck' || moveIn.auditType eq 'xfgCheck'}">
   <TR>	
		<TD height=30 width="15%" align=right >审核结果：</TD>
		<TD  width="35%">
			<input type="radio" name="decideType" value="1"/>评定
			<input type="radio" name="decideType" value="2" />退回
		</TD>
		<TD height=30 width="15%" align=right >审核意见</TD>
		<TD  width="35%">
			<textarea rows="3" cols="30" name="opinion" ></textarea>
		</TD>
	</TR>
	
	<tr>
	  <td colspan=4 align=center class=category>
		<a id="submitbtn"  class="easyui-linkbutton"   iconCls="icon-save" href="#" onclick="doAudit()">提交</a>
	  </td>
	</tr>
	</c:if>
	 <c:if test="${moveIn.auditType eq 'sfsAccept' || moveIn.auditType eq 'workerReporting' }">
	 	<tr>
	  		<td colspan=4 align=center class=category>
				<a id="submitbtn"  class="easyui-linkbutton"   iconCls="icon-save" href="#" onclick="doAudit()">上报</a>
	  		</td>
		</tr>
	</c:if>
	<c:if test="${moveIn.auditType eq 'sgzryPrint'}">
		<tr>
	  		<td colspan=4 align=center class=category>
				<a id="submitbtn"  class="easyui-linkbutton"   iconCls="icon-save" href="#" onclick="doAudit()">打印</a>
	  		</td>
		</tr>
	</c:if>
   </TBODY>
</TABLE>
	 <c:if test="${moveIn.auditType eq 'sfsAccept' || moveIn.auditType eq 'workerReporting' || moveIn.auditType eq sgzryPrint}">
	 <input type="hidden" name="decideType" value="1"/>
	 
	 </c:if>

</form>
<script type="text/javascript">
function doAudit(){
	$("#moveInAuditForm").submit();
	
}
</script>
</body>
</html>