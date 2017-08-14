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
		$('#searchbtn2').click(
				function() {
					$('#t_list_draft').datagrid('load',
							$.serializeObject($('#searchForm2')));
				});

		function cleanSearch() {
			$('#t_list_draft').datagrid('load', {});
			$('#searchForm2').form().find('input').val('');
		}
	});

	function formatOper(val, row, index) {
		
		var operation = '<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-info\'" onclick="askLeaveDetail(\''
				+ row.id + '\')">详情</a>';
				operation = operation+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit1" data-options="plain:true,iconCls:\'fi-info\'" onclick="modify(\''
				+ row.id + '\')">编辑</a>';
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
	         width : 708,
	         height : 350,
			href : '${ctx}/homepage/draft/detail?id=' + id,
			buttons : [
						{
							text : '发送',
							iconCls : 'icon-large-smartart',
							handler : function() {
								parent.$.modalDialog.openner_dataGrid = $('#t_list_draft').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
								var f = parent.$.modalDialog.handler.find('#draft');
								f.submit();
							}
						},{
							text : '关闭',
							iconCls : 'fi-x icon-blue',
							handler : function() {
								parent.$.modalDialog.openner_dataGrid = $('#t_list_draft').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
								parent.$.modalDialog.handler.dialog('close');
								//var f = parent.$.modalDialog.handler.find('#draftPrint');
								//f.click();
				            }
						}]
		});

	}
	function modify(id) {

		parent.$.modalDialog({
			title : '修改',
			iconCls : 'fi-info',
	        maximizable: true,
	        resizable: true ,
	        draggable: true ,
	        width : 500,
		    height : 450,
		    href : '${ctx}/homepage/draft/from?id=' + id,
			buttons : [
						{
							text : '保存',
							iconCls : 'icon-save icon-blue', 
							handler : function() {
								parent.$.modalDialog.openner_dataGrid = $('#t_list_draft').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
								var f = parent.$.modalDialog.handler.find('#culpritInfo');
								f.submit();
							}
						},{
							text : '关闭',
							iconCls : 'fi-x icon-blue',
							handler : function() {
								parent.$.modalDialog.openner_dataGrid = $('#t_list_draft').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
								parent.$.modalDialog.handler.dialog('close');
								//var f = parent.$.modalDialog.handler.find('#draftPrint');
								//f.click();
				            }
						}]
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

	
	function deleteAskLeave() {
		var arr = $('#t_list_draft').datagrid('getSelections');
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
						$('#t_list_draft').datagrid('reload');
						//2 清空idField   
						$('#t_list_draft').datagrid('uncheckAll');
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
	        <form id="searchForm2"  style="padding-bottom: 10px;padding-top: 10px;">
				<table>
					<tr>
						<td class="search-title">发布起止：</td>
						<td>
                   			<input name="searchStartDate" id="searchStartDate2" class="Wdate" 
                   			onfocus="var searchEndDate2=$dp.$('searchEndDate2');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){searchEndDate2.focus();},maxDate:'#F{$dp.$D(\'searchEndDate2\')}'})" />
            			</td>
					</tr>
					<tr>
						<td class="search-title">发布截止：</td>
						<td><input name="searchEndDate" id="searchEndDate2" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate2\')}'})" />
						</td>
					</tr>
					<tr>
						<td class="search-title">公文标题：</td>
						<td> <input name="documentTitle" id="documentTitle2" class="easyui-textbox" /> </td>
					</tr>
				</table>
			</form>
			</div>
			<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchbtn2" iconCls="icon-search" >搜索</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn2" iconCls="icon-undo" onclick="javascript:$('#searchForm2').form('clear');">清空</a>
			</div>
		</div>
	</div>
	<div data-options="region:'center',border:true">
		<table class="easyui-datagrid" id="t_list_draft" title="草稿列表" 
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],url:'${ctx}/homepage/draft/list',method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
				  $('.organization-easyui-linkbutton-edit1').linkbutton({text:'编辑',plain:true,iconCls:'fi-pencil icon-blue'}); }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'receiverUnit',width:'17%',align:'center'">收件单位</th>
					<th data-options="field:'sendUnit',width:'17%',align:'center'">发件单位</th>
					<th data-options="field:'documentTitle',width:'20%',align:'center'">公文标题</th>
					<th data-options="field:'takeTime',width:'16%',align:'center',sortable:true">发布日期</th>
					<th data-options="field:'state2',width:'10%',align:'center'">公文状态</th>
					<th data-options="field:'_opt',width:'18%',align:'center',formatter:formatOper">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>

 

