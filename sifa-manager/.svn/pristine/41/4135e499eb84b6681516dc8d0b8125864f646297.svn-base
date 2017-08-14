<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引用jquery easy ui的js库及css -->
<%@include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/css/style.css" />
<title>当前运行采购流程</title>
<script type="text/javascript">
	function queryorder() {
		$("#queryOrderForm").submit();

	}


</script>

</head>
<body>

	<form id="queryOrderForm" name="queryOrderForm"
		action="${ctx}/orderflow/queryActivityOrder.action" method="post">

		<!-- <TABLE class="table_search">
			<TBODY>
				<TR>
					<TD class="left">采购单号：</td>
					<td><input type="text" name="orderCustom.name" /></TD>
					<TD class="left">采购单名称：</TD>
					<td><INPUT type="text" name="orderCustom.name" /></TD>

					<td><a id="btn" href="#" onclick="queryorder()"
						class="easyui-linkbutton" iconCls='icon-search'>查询</a></td>
				</TR>

			</TBODY>
		</TABLE> -->

		<TABLE class="toptable grid">
			<TBODY>
				<tr>
					<td>流程实例id</td>
					<td>姓名</td>
					<td>请假天数</td>
					<td>创建时间</td>
					<td>当前活动</td>
					<td>查看任务</td>
					<td>查看流程图</td> 
				</tr>
				<c:forEach items="${list}" var="askLeaveCustom">
					<tr>
						<td class=category>${askLeaveCustom.processInstanceId}</td>
						<td class=category>${askLeaveCustom.culpritName}</td>
						<td class=category>${askLeaveCustom.leaveDays}</td>
						<td class=category><fmt:formatDate
								value="${askLeaveCustom.created}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
						<td class=category>${askLeaveCustom.activityName}</td>
						<td class=category><a
							href="${ctx}/dailymgr/askLeave/queryOrderTaskByPid.action?processInstanceId=${askLeaveCustom.processInstanceId}"
							target="_blank">查看任务</a></td>
						<td class=category><a
							href="${ctx}/flow/queryActivityMap?processInstanceId=${askLeaveCustom.processInstanceId}"
							target="_blank">查看流程图</a></td>
					</tr>
				</c:forEach>
			</TBODY>
		</TABLE>

	</form>

</body>
</html>