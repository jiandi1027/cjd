<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
<table width="100%" class="grid">
		<tr>
			<th width="15%">姓名：</th><td width="35%">${monitor.name }</td>
			<th width="15%">成员类型：</th>
			<td width="35%">${fns:getSysDicValueByKey('common_table','xzcylx',monitor.xzcylx,'')}</td>
		</tr>
		<tr>
			<th>工作单位：</th>
			<td>${monitor.org }</td>
			<th>性别：</th>
			<td>${fns:getSysDicValueByKey('common_table','sex',monitor.dicSexKey,'')}</td>
		</tr>
		<tr>
			<th>联系电话：</th>
			<td>${monitor.mobile }</td>
			<th>学历：</th>
			<td>${fns:getSysDicValueByKey('common_table','whcd',monitor.qulifId,'')}</td>
		</tr>
		<tr>
			<th>成员类别：</th>
			<td colspan="3">${monitor.groupTypeId}</td>
		</tr>
		<tr>
			<th>家庭住址：</th>
			<td colspan="3">${monitor.address }</td>
			</tr>
		</table>
</div>	
