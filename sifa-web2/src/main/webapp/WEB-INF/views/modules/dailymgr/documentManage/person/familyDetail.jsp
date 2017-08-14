<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
		<table width="100%" class="grid">
				<tr>
					<th width="15%">姓名：</th>
					<td width="35%">${culpritFamily.name }</td>
					<th width="15%">性别：</th>
					<td width="35%">${culpritFamily.dicSexKey }</td>
				</tr>
				<tr>
					<th>关系：</th>
					<td>${culpritFamily.dicRelationKey }</td>
					<th>现政治面貌：</th>
					<td>${culpritFamily.dicZzmmKey }</td>
				</tr>
				<tr>
					<th>工作单位：</th>
					<td>${culpritFamily.org }</td>
					<th>职务：</th>
					<td>${culpritFamily.job }</td>
				</tr>
				<tr>
					<th>电话：</th>
					<td>${culpritFamily.phone }</td>
					<th>出生日期：</th>
					<td>${culpritFamily.birthday }</td>
				</tr>
				<tr>
					<th width="15%">住址：</th>
					<td colspan="3">${culpritFamily.address }</td>
				</tr>
			</table>
</div>	