<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统资源</title>
<%@include file="/WEB-INF/views/include/head.jsp" %>
</head>


<body class="easyui-layout" id="lay">
		<div region="north" border="false" collapsed="true" title="搜索条件" style="height: 60px;overflow: hidden;" align="left">
		<form id="searchForm">
			<table>
				<tr>
					<td>名称<input name="name" style="width:100px;" />&nbsp;</td>
					<td>英文名称<input name="ename" class="easyui-datetimebox" editable="false" style="width: 100px;" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="listContent" title="资源列表" style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,striped:true,toolbar:toolbar,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/sys/sysPermission/list',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'name',width:80,align:'center'"  editor="{type:'validatebox',options:{required:true}}">名称</th>
				<th data-options="field:'ename',width:100,align:'center'" editor="text"  editor="{type:'numberbox',options:{required:true}}">英文名称</th>
				<th data-options="field:'available',width:80,align:'center'"   editor="{type:'validatebox',options:{required:true}}">是否可用</th>
				<th data-options="field:'createDate',width:250,align:'center'" editor="text">创建日期</th>
				<th data-options="field:'updateDate',width:250,align:'center'" editor="text">修改日期</th>
			</tr>
		</thead>
	</table>
	</div>
	
	
	<div id="mydialog" title="新增资源" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 300px;">
		<form id="myform" action="" method="post">
			<input type="hidden" name="id" value="" />
			<table>
				<tr>
					<td>父资源:</td>
					<td>
					<input type="hidden" name="parent.id" id="parentId"/>
					<form:hidden path="parent.id" id="parentId"/>
					<input type="text" name="parent.name" id="parentName"
						class="easyui-validatebox" required=true
						 missingMessage="名称必填!"
						 value="" readonly="readonly" class="input-text" onclick="selectPermission('选择父资源','${ctx}/sys/sysPermission/select',330,500)"/></td>
					
				</tr>
				<tr>
					<td>名称:</td>
					<td><input type="text" name="name"
						class="easyui-validatebox" required=true
						 missingMessage="名称必填!"
						 value="" /></td>
				</tr>
				<tr>
					<td>类型:</td>
					<td><input type="text" name="name"
						class="easyui-validatebox" required=true
						 missingMessage="类型必填!"
						 value="" /></td>
				</tr>
				<tr>
					<td>地址:</td>
					<td><input type="text" name="name"
						 value="" /></td>
				</tr>
				<tr>
					<td>权限代码:</td>
					<td><input type="text" name="percode"
						 value="" /></td>
				</tr>
				<tr>
					<td>排序:</td>
					<td><input type="text" name="perSort"
						class="easyui-validatebox" required=true
						 missingMessage="排序必填!"
						 value="" /></td>
				</tr>
				
				<tr>
					<td>是否可用:</td>
					<td> <form:radiobuttons path="available" items="<%-- ${fns:getSysDictList('is_available')} --%>" itemLabel="label" itemValue="value" htmlEscape="false" /></td>
				</tr>
				
				<tr align="center">
					<td colspan="2"><a id="btn1" class="easyui-linkbutton">确定</a>
						<a id="btn2" class="easyui-linkbutton">关闭</a></td>
				</tr>
			</table>
		</form>
	</div>

</body>
<script type="text/javascript">
var flag ;		//undefined 判断新增和修改方法
var toolbar = [ {
	text : '新增',
	iconCls : 'icon-add',
	handler : function() {
		flag = 'add';
		$('#mydialog').dialog({
			title : '新增资源'
		});
		//$('#myform').find('input[name!=sex]').val("");
		$('#myform').get(0).reset();
		//$('#myform').form('clear');
		$('#mydialog').dialog('open');

	}

}, '-', {
	text : '修改',
	iconCls : 'icon-edit',
	handler : function() {
		flag = 'edit';
		var arr = $('#listContent').datagrid('getSelections');
		if (arr.length != 1) {
			$.messager.show({
				title : '提示信息!',
				msg : '只能选择一行记录进行修改!'
			});
		}else {
			$('#mydialog').dialog({
				title : '修改资源'
			});
			$('#mydialog').dialog('open'); //打开窗口
			$('#myform').get(0).reset(); //清空表单数据 
			$('#myform').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
				id : arr[0].id,
				name : arr[0].name,
				tname : arr[0].tname,
				password : arr[0].password,
				mobile : arr[0].mobile,
				groupId : arr[0].groupId
			});
		}
	

	}
},  '-', {
	text : '删除',
	iconCls : 'icon-remove',
	handler : function() {
		var arr = $('#listContent').datagrid('getSelections');
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
						if(i==0){
							ids+="ids="+arr[i].id
						}else{
							ids +="&ids="+arr[i].id ;
						}
						
					}
					//ids = ids.substring(0, ids.length - 1);
					$.post('${ctx}/sys/sysPermission/batchDelete', {
						ids : ids
					}, function(result) {
						//1 刷新数据表格 
						$('#listContent').datagrid('reload');
						//2 清空idField   
						$('#listContent').datagrid('uncheckAll');
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
}, '-', {
	text : '查询',
	iconCls : 'icon-search',
	handler : function() {
		$('#lay').layout('expand', 'north');
	}
} ];

/**
 *  提交表单方法
 */
$('#btn1').click(function(){
		if($('#myform').form('validate')){
			$.ajax({
				type: 'post' ,
				url: '${ctx}/sys/sysPermission/save' ,
				cache:false ,
				data:$('#myform').serialize() ,
				dataType:'json' ,
				success:function(result){
					//1 关闭窗口
					$('#mydialog').dialog('close');
					//2刷新datagrid 
					$('#listContent').datagrid('reload');
					//3 提示信息
					$.messager.show({
						title:result.status==200?"ok":"fail" , 
						msg:result.msg
					});
				} ,
				error:function(result){
					$.meesager.show({
						title:result.status==200?"ok":"fail" ,  
						msg:result.msg
					});
				}
			});
		} else {
			$.messager.show({
				title:'提示信息!' ,
				msg:'数据验证不通过,不能保存!'
			});
		}
});
$(function(){
	
	
	$('#listContent').datagrid({fit: true});
/**
 * 关闭窗口方法
 */
$('#btn2').click(function(){
	$('#mydialog').dialog('close');
});

	
$('#searchbtn').click(function(){
	$('#listContent').datagrid('load' ,serializeForm($('#searchForm')));
});

function cleanSearch() {
	$('#listContent').datagrid('load', {});
	$('#searchForm').form().find('input').val('');
}

//js方法：序列化表单 			
function serializeForm(form){
	var obj = {};
	$.each(form.serializeArray(),function(index){
		if(obj[this['name']]){
			obj[this['name']] = obj[this['name']] + ','+this['value'];
		} else {
			obj[this['name']] =this['value'];
		}
	});
	return obj;
}
});
</script>

</html>
