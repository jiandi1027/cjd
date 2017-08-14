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
<title>脱管审核</title>
</head>
<body>

<form id="detachedAuditForm" name="detachedAuditForm" action="${ctx}/endcorrect/detached/submitDetachedAudit" method="post">
	<input type="hidden" name="taskId" value="${detached.taskId}"/>
	<input type="hidden" name="id" value="${detached.id}"/>
	<input type="hidden" name="auditType" value="${detached.auditType}"/>
	<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>

   <TBODY>
   <TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;脱管人员信息</TD>
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
								<TD height=30 width="10%" align=right >具体描述：</TD>
								<TD class=category width="23%">
									${detached.description}
								</TD>
								
								<TD height=30 width="10%" align=right >掌握方式：</TD>
								<TD class=category width="23%">
								${detached.dicGraspTypeKey }
								</TD>
								<TD height=30 width="10%" align=right >掌握时间：</TD>
								<TD class=category >
								<fmt:formatDate value="${detached.graspTime }"
									pattern="yyyy-MM-dd HH:mm:ss" />
								</TD>
								
								
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >通报公安机关时间：</TD>
								<TD class=category width="23%">
								<fmt:formatDate value="${detached.reportTime}"
									pattern="yyyy-MM-dd HH:mm:ss" />
								</TD>
								
								<TD height=30 width="10%" align=right >民警姓名：</TD>
								<TD class=category width="23%">
								${detached.policeName }
								</TD>
								<TD height=30 width="10%" align=right >通报公安机关名称：</TD>
								<TD class=category >
								${detached.reportUnit}
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
   <%-- <TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;脱管人员基本信息</TD>
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
								${detached.culpritName }
								</TD>
								
								<TD height=30 width="10%" align=right >与矫正人员关系：</TD>
								<TD class=category width="23%">
								${detached.relation }
								</TD>
								<TD height=30 width="10%" align=right >职业及工作单位：</TD>
								<TD class=category >
								${detached.job }
								</TD>
							</TR>
							<TR>
								<TD height=30 width="10%" align=right >政治面貌：</TD>
								<TD class=category width="23%">
								${detached.dicPoliticStatusKey }
								</TD>
								
								<TD height=30 width="10%" align=right >被访问者家庭住址：</TD>
								<TD class=category colspan="3">
								${detached.askAddress }
								</TD>
								
								
								
							</TR>
							
							
						
							</TBODY>
						</TABLE>
					</TD>
				</TR> --%>
   </TBODY>
</TABLE>

<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>

   <TBODY>
   <c:if test="${detached.auditType ne 'sfsPut' }">
   <TR>	
		<TD height=30 width="15%" align=right >审核结果：</TD>
		<TD  width="35%">
			<input type="radio" name="decideType" value="1" checked="checked"/>同意
			<c:if test="${detached.auditType ne 'xfgCheck' }"><input type="radio" name="decideType" value="0"/>不同意</c:if>
			<input type="radio" name="decideType" value="2" />退回
		</TD>
		<TD height=30 width="15%" align=right >审核意见</TD>
		<TD  width="35%">
			<textarea rows="3" cols="30" name="opinion" ></textarea>
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
	<c:if test="${detached.auditType eq 'sfsPut' }">
	 <input type="hidden" name="decideType" value="1"/>
	 </c:if>
</form>
<script type="text/javascript">
function doAudit(){
	if($("#detachedAuditForm").form('validate')){
		$.ajax({
			type: 'post' ,
			url: $("#detachedAuditForm").attr("action"),
			cache:false ,
			data:$('#detachedAuditForm').serialize() ,
			dataType:'json',
			success:function(data){
				$.messager.show({
  					title:'提示信息!',
  					msg:data.msg
  				});
  				parent.location.reload();
      			var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
			} ,
			error:function(result){
				$.messager.show({
  					title:'提示信息!',
  					msg:data.msg
  				});
			}
		});
	}else{
		 $.messager.show({
			title:'提示信息!' ,
			msg:'验证失败！请检查数据是否已填写完整!'
		}); 
	} 
}
</script>
</body>
</html>