<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>请假管理</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td {
	border: solid #add9c0;
	border-width: 0px 1px 1px 0px;
	padding: 10px 0px;
	text-align: center;
}

table {
	border: solid #add9c0;
	border-width: 1px 0px 0px 1px;
}
</style>
</head>

<body>

	<div class="easyui-panel" id="p1" title="矫正对象基本信息"
		style="width: 100%; padding: 10px;">

		<table width="100%">
			<tr>
				<td>姓名</td>
				<td colspan="5">${culprit.name }</td>
			</tr>
			<tr>
				<td width="10%">性别</td>
				<td>${culprit.dicSexKey }</td>
				<td width="10%">民族</td>
				<td>${culprit.nation }</td>
				<td width="10%">身份证号</td>
				<td>${culprit.identification }</td>
			</tr>
			<tr>
				<td>曾用名</td>
				<td>${culprit.alias }</td>
				<td>出生日期</td>
				<td>${culprit.birthday }</td>
				<td>文化程度</td>
				<td>${culprit.dicWhcdKey }</td>
			</tr>

			<tr>
				<td>婚姻状况</td>
				<td>${culprit.dicHyzkKey }</td>
				<td>职业</td>
				<td>${culprit.job }</td>
				<td>原政治面貌</td>
				<td>${culprit.dicYzzmmKey }</td>
			</tr>
			<tr>
				<td>籍贯</td>
				<td>${culprit.origin }</td>
				<td>户籍所在地</td>
				<td>${culprit.regResidenceStreet }</td>
				<td>现居住地</td>
				<td>${culprit.addressDetail }</td>
			</tr>
			<%-- 
                 <tr>
                    <td>原判罪名:</td>
                    <td><input name="email" class="f1 easyui-textbox"></input></td>
                     <td>刑期:</td>
                    <td><input name="email" class="f1 easyui-textbox"></input></td>
                     <td>附加刑:</td>
                    <td><input name="email" class="f1 easyui-textbox"></input></td>
                </tr>
                 <tr>
                    <td>刑期变动:</td>
                    <td><input name="email" class="f1 easyui-textbox"></input></td>
                     <td>刑期开始时间:</td>
                    <td><input name="email" class="f1 easyui-textbox"></input></td>
                     <td>刑期结束时间:</td>
                    <td><input name="email" class="f1 easyui-textbox"></input></td>
                </tr>
                --%>
			<tr>
				<td>刑法执行类别</td>
				<td></td>
				<td>矫正开始时间</td>
				<td><fmt:formatDate value="${culprit.redressStartDate}"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>矫正结束时间</td>
				<td><fmt:formatDate value="${culprit.redressEndDate}"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>

		</table>

	</div>


	<div class="easyui-panel" id="p2" title="死亡登记信息"
		style="width: 100%; padding: 10px;">
		<table width="100%">
			<tr>
				<td width="10%">死亡日期</td>
				<td><fmt:formatDate value="${death.deathlTime}"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td width="10%">死亡原因</td>
				<td>${death.deathReason }</td>
				<td width="10%">死亡相关情况</td>
				<td>${death.situation }</td>
			</tr>
		</table>
	</div>
	<div class="easyui-panel" id="p3" title="流程信息"
		style="width: 100%; padding: 10px; margin-bottom: 30px;">
		<table width="100%">
			<tr>
				<td>操作人</td>
				<td>操作时间</td>
				<td>审批环节</td>
				<td></td>
			</tr>
			<c:forEach items="${processDetails}" var="processDetail">
				<tr>
					<td>${processDetail.createrCnName }</td>
					<td><fmt:formatDate value="${processDetail.created }"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${processDetail.auditName }</td>
					<c:if test="${processDetail.dicDecideType==1 }" >
						<td>同意</td>
					</c:if>
					<c:if test="${processDetail.dicDecideType==2 }" >
						<td>退回</td>
					</c:if>
					<c:if test="${processDetail.dicDecideType==0 }" >
						<td>不同意</td>
					</c:if>


				</tr>
			</c:forEach>

		</table>
	</div>
	<a href="#" class="easyui-linkbutton"
		onclick="javascript:$('#p').panel('open')">关闭</a>
		<a href="#" class="easyui-linkbutton"
		onclick="javascript:$('#p').panel('open')">打印</a>
</body>
</html>
