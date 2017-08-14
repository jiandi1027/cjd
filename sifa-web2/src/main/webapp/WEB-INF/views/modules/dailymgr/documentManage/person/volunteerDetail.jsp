<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
		<table width="100%" class="grid">
				<tr>
					<th width="15%">姓名：</th>
					<td width="35%">${volunteer.name }</td>
					<th width="15%">性别：</th>
					<td width="35%">${fns:getSysDicValueByKey('common_table','sex',volunteer.dicSexKey ,'')}</td>
				</tr>
				<tr>
					<th>聘用开始日期：</th>
					<td><fmt:formatDate value="${volunteer.startDate }" pattern="yyyy-MM-dd" /></td>
					<th>聘用结束日期：</th>
					<td><fmt:formatDate value="${volunteer.endDate }" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th>聘用时限(年)：</th>
					<td>${volunteer.limit }</td>
					<th>手机号：</th>
					<td>${volunteer.linkMobile }</td>
					
				</tr>
				<tr>
					<th>工作单位：</th>
					<td colspan="3">${volunteer.job }</td>
				</tr>
				<tr>
					<th>住址：</th>
					<td colspan="3">${volunteer.address }</td>
				</tr>
			</table>
</div>	