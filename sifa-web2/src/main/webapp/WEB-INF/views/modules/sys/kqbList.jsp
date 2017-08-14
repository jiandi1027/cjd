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
	$('#kqb_serachbtn').click(
			function()
			{
				$('#kqb_table').datagrid('load',
						$.serializeObject($('#kqb_searchform')));
			});
	$('#kqb_clearbtn').click(function()
	{
		$('#thingrest').combobox('reset');
		$('#kqb_searchform').form('clear');
	});
	$('#kqb_table').datagrid(
	{
		singleSelect : true,
		fit : true,
		collapsible : true,
		striped : true,
		loadMsg : '数据正在加载,请耐心的等待...',
		pagination : true,
		pageSize : 10,
		pageList :
		[ 5, 10, 15, 20, 50 ],
		url : '${ctx}/sys/biaoge/list3?biaoji=2',
		fitColumns : true,
		columns :
		[
		[
		{
			field : 'xuhao',
			title : '序号',
			rowspan : 3,
			width : "4%",
			align : "center"
		},
		{
			field : 'name',
			title : '姓名',
			rowspan : 3,
			width : '8%',
			align : "center"
		},
		{
			field : 'department',
			title : '部门',
			rowspan : 3,
			width : "8%",
			align : "center"
		},
		{
			title : '出勤记录',
			colspan : 11,
			width : "50%",
			align : "center",

		},
		{
			field : 'dakacishu',
			title : '打卡',
			rowspan : 3,
			width : "7%",
			align : "center",
			sortable : true

		},
		{
			field : 'beizhu',
			title : '备注',
			rowspan : 3,
			width : "8%",
			align : "center"
		},
		{
			field : 'time',
			title : '月份',
			rowspan : 3,
			width : "4%",
			align : "center",
			sortable : true
		} ],

		[
		{
			field : 'workday',
			title : '实际上班(天)',
			rowspan : 2,
			width : "7%",
			align : "center",

		},
		{
			field : 'restday',
			title : '休息日(天)',
			rowspan : 2,
			width : "7%",
			align : "center",

		},
		{
			field : 'overday',
			title : '加班(天)',
			rowspan : 2,
			width : "7%",
			align : "center",

		},

		{
			title : '请休假(天)',
			colspan : 5,
			rowspan : 1,
			width : "29%",
			align : "center"
		},

		{
			field : 'overtime',
			title : '迟到(次)',
			rowspan : 2,
			width : "5%",
			align : "center",
			sortable : true

		},

		{
			field : 'earlytime',
			title : '早退(次)',
			rowspan : 2,
			width : "5%",
			align : "center",
			sortable : true

		},
		{
			field : 'absenteeismtime',
			title : '缺卡 (次)',
			rowspan : 2,
			width : "5%",
			align : "center",
			sortable : true
		} ],
		[
		{
			field : 'thingrest',
			title : '事假',
			width : "5%",
			align : "center",
			sortable : true

		},
		{
			field : 'illrest',
			title : '病假',
			width : "5%",
			align : "center",
			sortable : true

		},
		{
			field : 'injurrest',
			title : '工伤假',
			width : "5%",
			align : "center",
			sortable : true

		},
		{
			field : 'birthrest',
			title : '产假',
			width : "5%",
			align : "center",
			sortable : true

		},
		{
			field : 'otherrest',
			title : '其他',
			width : "5%",
			align : "center",
			sortable : true

		} ]

		]
	});
</script>
<div class="easyui-layout" style="width: 100%; height: 100%;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'"
		style="width: 250px;">
		<div class="easyui-layout" data-options="fit:true,border:false">
			<div data-options="region:'center',border:false" class="search-form">
				<form id="kqb_searchform">
					<table>
						<tr>
							<td class="search-title">月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;份：</td>
							<td><input name="time" class="Wdate easyui-validatebox"
								onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM',maxDate:'2120-10'})" /></td>
						</tr>

						<tr>
							<td class="search-title">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
							<td><input name="name" class="easyui-textbox" /></td>
						</tr>
						<tr>
							<td class="search-title">部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门：</td>
							<td><input name="department" class="easyui-textbox" /></td>
						</tr>
						<tr>
							<td class="search-title">请假类型：</td>
							<td><select class="easyui-combobox" name="thingrest" id="thingrest" data-options="editable:false,panelMaxHeight:'200',panelHeight:'auto'">
									<option value="">全部</option>
									<option value="事假">事假</option>
									<option value="病假">病假</option>
									<option value="工伤假">工伤假</option>
									<option value="产假">产假</option>
							</select></td>
						</tr>
						<tr>
							<td class="search-title">迟&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;到：</td>
							<td><input name="overtime" class="easyui-textbox" /></td>
						</tr>
						<tr>
							<td class="search-title">早&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退：</td>
							<td><input name="earlytime" class="easyui-textbox" /></td>
						</tr>
						<tr>
							<td class="search-title">缺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;卡：</td>
							<td><input name="absenteeismtime" class="easyui-textbox" /></td>
						</tr>
					</table>
				</form>
			</div>
			<div data-options="region:'south',border:false"
				style="height: 30px; line-height: 30px; overflow: hidden; text-align: center; background-color: #eee">
				<a href="#" class="easyui-linkbutton" id="kqb_serachbtn"
					iconCls="icon-search">查询</a> &nbsp;&nbsp; <a href="#"
					class="easyui-linkbutton" id="kqb_clearbtn" iconCls="icon-undo">清空</a>
			</div>
		</div>

	</div>
	<div data-options="region:'center'" style="width: 80%">
		<table id="kqb_table" title="考勤统计信息列表" style="text-align: center"></table>
	</div>

</div>
