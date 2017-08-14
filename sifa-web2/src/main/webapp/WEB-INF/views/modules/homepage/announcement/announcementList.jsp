<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>
<script type="text/javascript">

	$(function() {
		$('#searchbtn3').click(
				function() {
					$('#t_list_announcement').datagrid('load',
							$.serializeObject($('#searchForm3')));

				});
		function cleanSearch() {
			$('#t_list_announcement').datagrid('load', {});
			$('#searchForm3').form().find('input').val('');
		}
	});

	function formatOper(val, row, index) {
		var operation = '<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-info\'" onclick="askLeaveDetail(\''
				+ row.id + '\')">详情</a>';

		return operation;
	}
	function viewProcess(url) {
		parent.$.modalDialog({
			title : '流程信息',
			iconCls : 'fi-plus icon-green',
			width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
			href : url
		});
	}

	function submitAuditAskLeave(taskId, id, auditType, processId) {
		open_layer("请假审核审批", "${ctx}/dailymgr/askLeave/askLeaveAudit?id=" + id
				+ "&taskId=" + taskId + "&auditType=" + auditType
				+ "&processInstanceId=" + processId);
	}

	function askLeaveDetail(id) {

		parent.$.modalDialog({
			title : '详情',
			iconCls : 'fi-info icon-blue',
	         maximizable:true,
	         resizable:true,
	         width : 822,
	         height : 350,
			href : '${ctx}/homepage/announcement/detail?id=' + id,
			buttons : [ {
				text : '关闭',
				iconCls : 'fi-x icon-blue',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = $('#t_list_announcement')
							.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.handler.dialog('close');
				}
			} ]
		});

	}

	function stopProcess(taskId) {
		$.messager.confirm('提示', '请判断是否要执行该操作?', function(b) {
			if (b) {
				$.ajax({
					type : 'get',
					url : "${ctx}/dailymgr/askLeave/stopProcess?taskId="
							+ taskId,
					cache : false,
					async : false, //同步请求
					dataType : 'json',
					success : function(result) {
						if (result.status == 200) {
							alert(result.msg);
						} else {
							alert(result.msg);
						}
					}
				});

			}
		});

	}

	function open_layer(title, url) {

		var index = layer.open({
			type : 2,
			title : title,
			content : url
		});
		layer.full(index);
	}

	function addAskLeave() {
		parent.$.modalDialog({
			title : '添加公告信息',
			iconCls : 'fi-plus icon-green',
			maximizable : true,
			resizable:true,
			width : 500,
			height : 380,
			href : '${ctx}/homepage/announcement/form',
			resizable : true,
			buttons : [
					{
						text : '发布',
						iconCls : 'icon-large-smartart',
						handler : function() {
							parent.$.modalDialog.openner_dataGrid = $(
									'#t_list_announcement').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler
									.find('#culpritInfo');
							f.submit();
						}
					},
					{
						text : '重置',
						iconCls : 'icon-undo',
						handler : function() {
							var f = parent.$.modalDialog.handler
									.find('#culpritInfo');
							f.get(0).reset(); //清空表单数据 
						}
					} ]
		});
	}

	function deleteAskLeave() {
		var arr = $('#t_list_announcement').datagrid('getSelections');
		if (arr.length <= 0) {
			$.messager.show({
				title : '提示信息!',
				msg : '至少选择一行记录进行删除!'
			});
		} else {

			$.messager.confirm('提示信息', '确认删除?', function(r) {
				if (r) {
					var ids = '';
					for (var i = 0; i < arr.length; i++) {
						if (i == 0) {
							ids += "ids=" + arr[i].id
						} else {
							ids += "&ids=" + arr[i].id;
						}

					}
					//ids = ids.substring(0, ids.length - 1);
					$.post('${ctx}/dailymgr/askLeave/batchDelete', {
						ids : ids
					}, function(result) {
						//1 刷新数据表格 
						$('#t_list_announcement').datagrid('reload');
						//2 清空idField   
						$('#t_list_announcement').datagrid('uncheckAll');
						//3 给提示信息 
						$.messager.show({
							title : '提示信息!',
							msg : '操作成功!'
						});
					});
				} else {
					return;
				}
			});
		}
	}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'east',border:true,split:false" style="width: 240px;">
		<div class="easyui-layout" data-options="fit:true,border:false">
		    <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="查询条件" style="width:100%;">
	        <form id="searchForm3"  style="padding-bottom: 10px;padding-top: 10px;">
				<table>
					<tr>
						<td class="search-title">发布起止：</td>
						<td>
							<input name="searchStartDate" id="searchStartDate3" class="Wdate easyui-validatebox"
								onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'searchEndDate3\')}'})" />
						</td>
					</tr>
					<tr>
						<td class="search-title">发布截止：</td>
						<td>
							<input name="searchEndDate" id="searchEndDate3" class="Wdate easyui-validatebox"
								onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate3\')}',maxDate:'2120-10-01'})"/>
						</td>
					</tr>
					<tr>
						<td class="search-title">公告标题：</td>
						<td> <input name="announcementTopic" id="announcementTopic" class="easyui-textbox"/> </td>
					</tr>
				</table>
			</form>
			</div>
			<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchbtn3" iconCls="icon-search" onclick="">搜索</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn3" iconCls="icon-undo" onclick="javascript:$('#searchForm3').form('clear');">清空</a>
			</div>
		</div>
	</div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_list_announcement" title="公告列表" data-options="singleSelect:true,fit:true,collapsible:true,toolbar:'#toolbar',striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],url:'${ctx}//homepage/announcement/list',method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:'10%'">编号</th>
					<th data-options="field:'releasePeople',width:'18%',align:'center'">发布人</th>
					<th data-options="field:'placeTheUnit',width:'20%',align:'center'">所在单位</th>
					<th data-options="field:'announcementTopic',width:'20%',align:'center'">公告标题</th>
					<th data-options="field:'releaseDate',width:'20%',align:'center',sortable:true">发布日期</th>
					<th data-options="field:'_opt',width:'20%',align:'center',formatter:formatOper">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="toolbar" style="display: none;">
   
        <a onclick="addAskLeave();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>

    
</div>

