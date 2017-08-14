<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统数据字典</title>
<%@include file="/WEB-INF/views/include/head.jsp" %>
	<script type="text/javascript" src="${ctxStatic}/js/plugins/edit-datagrid/jquery.edatagrid.js"></script>	
</head>


<body class="easyui-layout" id="lay">
		<div region="north" border="false" collapsed="true" title="搜索条件" style="height: 60px;overflow: hidden;" align="left">
		<form id="searchForm">
			<table>
				<tr>
					<td>类型KEY<input name="paramLevel" style="width:100px;" />&nbsp;</td>
					<td>创建时间<input name="ccreatedatetimeStart" class="easyui-datetimebox" editable="false" style="width: 100px;" />至<input name="ccreatedatetimeEnd" class="easyui-datetimebox" editable="false" style="width: 100px;" /></td>
					<td>最后修改时间</td>
					<td><input name="cmodifydatetimeStart" class="easyui-datetimebox" editable="false" style="width: 100px;" />至<input name="cmodifydatetimeEnd" class="easyui-datetimebox" editable="false" style="width: 100px;" /><a href="javascript:void(0);" class="easyui-linkbutton" onclick="_search();">搜索</a><a href="javascript:void(0);" class="easyui-linkbutton" onclick="cleanSearch();">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="data-content" title="数据字典列表"  style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,fitColumns:true,pageList:[5,10,15,20,50],url:'${ctx}/sys/sysUser/list',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'type',width:80,align:'right'"  editor="{type:'validatebox',options:{required:true}}">类型</th>
				<th data-options="field:'title',width:100" editor="text"  editor="{type:'numberbox',options:{required:true}}">标题</th>
				<th data-options="field:'remoteAddr',width:80,align:'right',sortable:true"   editor="{type:'validatebox',options:{required:true}}">ip</th>
				<th data-options="field:'params',width:80,sortable:true" editor="{type:'numberbox',options:{required:true}}">参数</th>
				<th data-options="field:'createDate',width:250" editor="text">创建日期</th>
			</tr>
		</thead>
	</table>
	</div>
	<div id="menu" class="easyui-menu" style="width:120px;display: none;">
		<div onclick="add();" iconCls="icon-add">增加</div>
		<div onclick="del();" iconCls="icon-remove">删除</div>
		<div onclick="edit();" iconCls="icon-edit">编辑</div>
	</div>
	
	
	

</body>
<script type="text/javascript">
$(function(){
	$('#data-content').datagrid({fit: true});
});
</script>

</html>
