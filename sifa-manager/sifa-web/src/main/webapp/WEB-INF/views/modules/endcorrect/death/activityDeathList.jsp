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
<title>死亡登记待处理列表</title>
<script type="text/javascript">
	function querydeath() {
		$("#queryOrderForm").submit();

	}
	
	function PageQuery(page_index,page_size){
		$("#page_index").val(page_index);
		$("#page_size").val(page_size);
		querydeath();
	}
</script>

</head>
<body>

	<form id="queryOrderForm" name="queryOrderForm"
		action="${ctx}/endcorrect/DeathCustomTaskList.action"
		method="post">
		<input type="hidden" id="page_index" name="page_index" value="1"/>
		<input type="hidden" id="page_size" name="page_size" value="15"> 
		<!-- <TABLE class="table_search">
			<TBODY>
				<TR>
					<TD class="left">采购单号：</td>
					<td><input type="text" name="askLeaveCustomCustom.name" /></TD>
					<TD class="left">采购单名称：</TD>
					<td><INPUT type="text" name="askLeaveCustomCustom.name" /></TD>

					<td><a id="btn" href="#" onclick="queryaskLeaveCustom()"
						class="easyui-linkbutton" iconCls='icon-search'>查询</a></td>
				</TR>

			</TBODY>
		</TABLE> -->

		<TABLE class="toptable grid" >
			<TBODY>
				<tr>
					<td>任务id</td>
					<td>任务名称</td>
					<td>任务标识</td>
					<td>姓名</td>
					<td>创建时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${list }" var="death">
					<tr>
						<td class=category>${death.taskId}</td>
						<td class=category>${death.taskName }</td>
						<td class=category>${death.taskDefinitionKey }</td>
						<td class=category>${death.culpritName}</td>
						<td class=category><fmt:formatDate value="${death.created}"
								pattern="yyyy-MM-dd hh:mm:ss" /></td>
						<td class=category>
						  <c:if
								test="${death.taskDefinitionKey=='sfsSb' }">
								<a href="${ctx}/dailymgr/askLeave/askLeaveAudit?taskId=${askLeaveCustom.taskId}&id=${death.id}&auditType=${death.taskDefinitionKey}">工作人员上报</a>

							</c:if>
						<c:if
								test="${death.taskDefinitionKey=='sfsCheck' }">
								<a href="${ctx}/dailymgr/askLeave/askLeaveAudit?taskId=${death.taskId}&id=${death.id}&auditType=${death.taskDefinitionKey}">司法所审核</a>

							</c:if> <c:if test="${death.taskDefinitionKey=='jzkCheck' }">
								<a
									href="${ctx}/dailymgr/askLeave/askLeaveAudit?taskId=${death.taskId}&auditType=${death.taskDefinitionKey}&id=${death.id}">县矫正科审核</a>

							</c:if> <c:if test="${death.taskDefinitionKey=='xfgCheck' }">
								<a
									href="${ctx}/dailymgr/askLeave/askLeaveAudit?taskId=${death.taskId}&auditType=${death.taskDefinitionKey}&deathId=${death.id}">县分管审核</a>

							</c:if> <c:if test="${death.taskDefinitionKey=='workerPrint' }">
								<a
									href="${ctx}/dailymgr/askLeave/askLeaveAudit?taskId=${death.taskId}&auditType=${death.taskDefinitionKey}&deathId=${death.id}">司法所打印</a>

							</c:if>
						</td>
					</tr>
				</c:forEach>
			</TBODY>
		</TABLE>

		
	</form>

</body>
</html>