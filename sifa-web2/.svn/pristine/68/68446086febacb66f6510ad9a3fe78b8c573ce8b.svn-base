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
	$('#qxjb_searchbtn').click(
			function()
			{
				$('#qxjb_table').datagrid('load',
						$.serializeObject($('#qxjb_searchform')));
			});
	$('#qxjb_clearbtn').click(function()
	{
		$('#qxjb_searchform').form('clear');
	});
</script>
<div class="easyui-layout" style="width: 100%; height: 100%;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'"
		style="width: 250px;">
		<div class="easyui-layout" data-options="fit:true,border:false">
			<div data-options="region:'center',border:false" class="search-form">
				<form id="qxjb_searchform">
					<table>
						<tr>
							<td class="search-title">填表起始：</td>
							<td><input name="searchstart1" id="searchstart1"
								class="Wdate easyui-validatebox"
								onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'searchend1\')}'})" />
							</td>
						</tr>
						<tr>
							<td class="search-title">填表截止：</td>
							<td><input name="searchend1" id="searchend1"
								class="Wdate easyui-validatebox"
								onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchstart1\')}',maxDate:'2120-10-01'})" />
							</td>
						</tr>
						<tr>
							<td class="search-title">申请人员：</td>
							<td><input name="name" class="easyui-textbox" /></td>
						</tr>
						<tr>
							<td class="search-title">申请部门：</td>
							<td><input name="department" class="easyui-textbox" /></td>
						</tr>
						<tr>
							<td class="search-title">请假类型：</td>
							<td><input name="leavetype" class="easyui-textbox" /></td>
						</tr>
						<tr>
							<td class="search-title">请假起始：</td>
							<td><input name="searchstart2" id="searchstart2"
								class="Wdate easyui-validatebox"
								onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'searchend2\')}'})" />
							</td>
						</tr>
						<tr>
							<td class="search-title">请假截止：</td>
							<td><input name="searchend1" id="searchend2"
								class="Wdate easyui-validatebox"
								onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchstart2\')}',maxDate:'2120-10-01'})" />
							</td>
						</tr>

					</table>
				</form>
			</div>
			<div data-options="region:'south',border:false"
				style="height: 30px; line-height: 30px; overflow: hidden; text-align: center; background-color: #eee">
				<a href="#" class="easyui-linkbutton" id="qxjb_searchbtn"
					iconCls="icon-search">查询</a> &nbsp;&nbsp; <a href="#"
					class="easyui-linkbutton" id="qxjb_clearbtn" iconCls="icon-undo">清空</a>
			</div>
		</div>

	</div>
	<div data-options="region:'center'" style="width: 80%">
		<table class="easyui-datagrid" id="qxjb_table" title="请休假统计信息列表"
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],url:'${ctx}/sys/biaoge/list2?biaoji=2',method:'post'">
			<thead>
				<tr>
					<th
						data-options="field:'datetime',width:'10%',align:'center',sortable:true">填表日期</th>
					<th data-options="field:'name',width:'10%',align:'center'">申请人</th>
					<th data-options="field:'department',width:'10%',align:'center'">申请部门</th>
					<th data-options="field:'leavetype',width:'10%',align:'center'">请假类型</th>
					<th
						data-options="field:'starttime1',width:'10%',align:'center',sortable:true">请假起始</th>
					<th data-options="field:'starttime2',width:'10%',align:'center'">起始时段</th>
					<th
						data-options="field:'endtime1',width:'10%',align:'center',sortable:true">截止时间</th>
					<th data-options="field:'endtime2',width:'10%',align:'center'">截止时段</th>
					<th data-options="field:'totalday',width:'10%',align:'center'">合计天数</th>
					<th data-options="field:'reason',width:'9%',align:'center'">事由</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
