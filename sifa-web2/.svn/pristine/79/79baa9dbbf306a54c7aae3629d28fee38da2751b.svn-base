<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic }/extJs.js"
	charset="utf-8"></script>
<script type="text/javascript">
	$('#tjb_searchbtn').click(
			function()
			{
				$('#tjb_table').datagrid('load',
						$.serializeObject($('#tjb_searchform')));
			});
	$('#tjb_clearbtn').click(function()
	{
		$('#tjb_searchform').form('clear');
	});
</script>
<div class="easyui-layout" style="width: 100%; height: 100%;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'"
		style="width: 250px;">
		<div class="easyui-layout" data-options="fit:true,border:false">
			<div data-options="region:'center',border:false" class="search-form">
				<form id="tjb_searchform">
					<table>
						<tr>
							<td class="search-title">部门名称：</td>
							<td><input name="department" class="easyui-textbox" /></td>
						</tr>
						<tr>
							<td class="search-title">人员姓名：</td>
							<td><input name="name" class="easyui-textbox" /></td>
						</tr>
						<tr>
							<td class="search-title">日期起始：</td>
							<td><input name="searchStartDate" id="searchStartDate"
								class="Wdate easyui-validatebox" 
								onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" />
							</td>
						</tr>
						<tr>
							<td class="search-title">日期截止：</td>
							<td><input name="searchEndDate" id="searchEndDate"
								class="Wdate easyui-validatebox"
								onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate\')}',maxDate:'2120-10-01'})" />
							</td>
						</tr>
						<tr>
							<td class="search-title">打卡次数：</td>
							<td><input name="dakacishu" class="easyui-textbox" /></td>
						</tr>
					</table>
				</form>
			</div>
			<div data-options="region:'south',border:false"
				style="height: 30px; line-height: 30px; overflow: hidden; text-align: center; background-color: #eee">
				<a href="#" class="easyui-linkbutton" id="tjb_searchbtn"
					iconCls="icon-search">查询</a> &nbsp;&nbsp; <a href="#"
					class="easyui-linkbutton" id="tjb_clearbtn" iconCls="icon-undo">清空</a>
			</div>
		</div>

	</div>
	<div data-options="region:'center'" style="width: 80%">
		<table class="easyui-datagrid" id="tjb_table" title="统计结果信息列表"
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],url:'${ctx}/sys/biaoge/list1?biaoji=2',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'department',width:'15%',align:'center'">部门名称</th>
					<th data-options="field:'bianhao',width:'15%',align:'center'">人员编号</th>
					<th data-options="field:'name',width:'15%',align:'center'">姓名</th>
					<th
						data-options="field:'datetime',width:'15%',align:'center',sortable:true">日期</th>
					<th data-options="field:'dakacishu',width:'15%',align:'center'">打卡次数</th>
					<th data-options="field:'dakashijian',width:'24%',align:'center'">打卡时间</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
