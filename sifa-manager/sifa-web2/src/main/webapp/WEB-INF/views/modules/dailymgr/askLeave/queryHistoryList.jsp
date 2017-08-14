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
<title>结束运行采购流程查询</title>
<script type="text/javascript">
	function queryorder() {
		$("#queryOrderForm").submit();

	}
</script>

</head>
<body>

	<form id="queryOrderForm" name="queryOrderForm"
		action="${baseurl}/order/queryHistoryOrder.action" method="post">

		

		<TABLE class="toptable grid">
			<TBODY>
				<tr>
					<td>流程实例id</td>
					<td>姓名</td>
					<td>请假天数</td>
					<td>创建时间</td>
					<td>结束时间</td>
					<td>查看任务</td>

				</tr>
				<c:forEach items="${list}" var="askLeaveCustom">
					<tr>
						<td class=category>${askLeaveCustom.processInstanceId}</td>
					<td class=category>${askLeaveCustom.culpritName}</td>
						<td class=category>${askLeaveCustom.leaveDays}</td>
						<td class=category><fmt:formatDate
								value="${askLeaveCustom.processInstanceStartTime}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
						<td class=category><fmt:formatDate
								value="${askLeaveCustom.processInstanceEndTime}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
						<td class=category><a
							href="${ctx}/dailymgr/askLeave/queryOrderTaskByPid?processInstanceId=${askLeaveCustom.processInstanceId}"
							target="_blank">查看任务</a></td>
						
					</tr>
				</c:forEach>
			</TBODY>
		</TABLE>

	</form>

</body>
</html>