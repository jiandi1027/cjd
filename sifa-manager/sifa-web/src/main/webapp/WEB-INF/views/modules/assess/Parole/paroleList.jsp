<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>假释</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>


<body class="easyui-layout" id="lay">
	<div region="north" border="false" collapsed=""false"" title="搜索条件"
		style="height: 60px; overflow: hidden;background:#E0ECFF;"align="left">
		<form id="searchForm">
			<table>
				<tr>
					<td>姓名: <input name="culpritName" style="width: 100px;" />&nbsp;
					</td>
					<td>所属司法部门: </td>
					<td>
						<select id="sysGroupId"name="sysGroupId"class="easyui-combotree"style="width: 200px;"
							data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true">
						</select>
					</td>
					<td>
						<a href="javascript:void(0);" class="easyui-linkbutton"
						id="searchbtn">搜索</a>
						<a href="javascript:void(0);"
						class="easyui-linkbutton" id="cleanSearch">清空</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_list_content" style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,striped:true,fitColumns:true,fit:true,toolbar:'#toolbar',loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/rewardspunishment/paroleController/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80">编号</th>
					<th data-options="field:'culpritName',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">姓名</th>
					<th data-options="field:'sysGroupName',width:100,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">司法所</th>
					<th data-options="field:'created',width:120,align:'center',sortable:true"
						editor="text">申请时间</th>
					<th data-options="field:'reduceTime',width:200,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">假释年限</th>
					<th data-options="field:'activityName',width:100,align:'center'"
						editor="text">审批状态</th>
				 	<th data-options="field:'_opt',width:200,formatter:formatOperate,align:'center'">操作</th>  
				</tr>
			</thead>
		</table>
	</div>
	<div id="toolbar" style="display: none;">
		<a onclick="open_layer('新增假释','${ctx}/rewardspunishment/paroleController/form');" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" id="addbtn">新增</a>
		<!-- <a onclick="deleteFun();"  href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" id="editbtn">删除</a>   -->
	</div>
</body>
<script type="text/javascript">
$(function(){
	$('#searchbtn').click(
			function() {
				$('#t_list_content').datagrid('load',
						serializeForm($('#searchForm')));
			});
});
//js方法：序列化表单 			
function serializeForm(form) {
	var obj = {};
	$.each(form.serializeArray(),
			function(index) {
				if (obj[this['name']]) {
					obj[this['name']] = obj[this['name']] + ','
							+ this['value'];
				} else {
					obj[this['name']] = this['value'];
				}
			});
	return obj;
}
//删除资源
function deleteFun() {
	//flag = 'delete';
	var arr = $('#t_list_content').datagrid('getSelections');
	if (arr.length <= 0) {
		$.messager.show({
			title : '提示信息!',
			msg : '至少选择一行记录进行删除!'
		});
	} else {
		$.messager.confirm('提示信息', '确认删除?', function(r) {
			if (r) {
				$.post('${ctx}/jiangcheng/revokeProbation/delete', {
					id : arr[0].id
				}, function(result) {
					//1 刷新数据表格 
					$('#t_list_content').datagrid('reload');
					//2 清空idField   
					$('#t_list_content').datagrid('uncheckAll');
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
function formatOperate(val,row,index){  
	var operation=$.formatString('<a href="javascript:detail(\'{0}\');"  title="详细"><span style="color:blue;"><strong><u>详细</u><strong></span></a>', row.id);;
	if(row.activityName==null){
		//var operation=operation+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:submitProbationDetail(\'{0}\');"  title="上报"><span style="color:blue;"><strong><u>上报</u><strong></span></a>', row.id)
		//var operation=operation+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:preSubmit(\'{0}\');"  title="上报"><span style="color:blue;"><strong><u>上报</u><strong></span></a>', row.id)
		var operation=operation+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:edit(\'{0}\');"  title="上报/修改"><span style="color:blue;"><strong><u>上报/修改</u><strong></span></a>', row.id)
	}
	if(row.hasPermission==1){
		operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="submitAuditParole(\''
				+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"><span style="color:blue;"><strong><u>处理</u><strong></span></a>';
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		if(row.isEnd==1){
			var url = '${ctx}/flow/queryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="viewProcess(\''+url+'\')"><span style="color:blue;"><strong><u>查看流程</u><strong></span></a>';
		}else{
			var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="viewProcess(\''+url+'\')"><span style="color:blue;"><strong><u>查看流程</u><strong></span></a>';
		}
		
	}
	
	return operation;
}

$.formatString = function(str) {
		for ( var i = 0; i < arguments.length - 1; i++) {
			str = str.replace("{" + i + "}", arguments[i + 1]);
		}
	return str;
}

function open_layer(title,url){
	
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
//查看流程图
function viewProcess(url){
	//console.log(url);
	open_layer('撤销缓刑流程',url);
}
//详细链接
function detail(id){
	open_layer('假释审核详情','${ctx}/rewardspunishment/paroleController/paroleDetail?id='+id);
}
//流程审批
function submitAuditParole(taskId,id,auditType,processId){
	open_layer("假释审核审批","${ctx}/rewardspunishment/paroleController/paroleAudit?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId);
}
</script>
