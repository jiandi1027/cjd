<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统定位单位</title>
<%@include file="/WEB-INF/views/include/head.jsp" %>
</head>


<body class="easyui-layout" id="lay">
		<div region="north" border="false" collapsed="true" title="搜索条件" style="height: 60px;overflow: hidden;" align="left">
		<form id="searchForm">
			<table>
				<tr>
					<td>单位名称<input name="unitName" style="width:100px;" />&nbsp;</td>
					<td>单位代码<input name="unitCode" class="easyui-datetimebox" editable="false" style="width: 100px;" /></td>
					<td>ip<input name="ip" class="easyui-datetimebox" editable="false" style="width: 100px;" /><a href="javascript:void(0);" class="easyui-linkbutton" id="searchbtn" >搜索</a><a href="javascript:void(0);" class="easyui-linkbutton" onclick="cleanSearch();">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_location_unit" title="定位单位列表" style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,striped:true,toolbar:toolbar,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/sys/locationUnit/list',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'unitName',width:80,align:'center'"  editor="{type:'validatebox',options:{required:true}}">名称</th>
				<th data-options="field:'unitCode',width:100,align:'center'" editor="text"  editor="{type:'numberbox',options:{required:true}}">代码</th>
				<th data-options="field:'ip',width:80,align:'center',sortable:true"   editor="{type:'validatebox',options:{required:true}}">ip</th>
				<th data-options="field:'priority',width:250,align:'center'" editor="text">优先级</th>
			</tr>
		</thead>
	</table>
	</div>
	
	
	<div id="mydialog" title="新增定位单位" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 300px;">
		<form id="myform" action="" method="post">
			<input type="hidden" name="id" value="" />
			<table>
				<tr>
					<td>名称:</td>
					<td><input type="text" name="unitName"
						class="easyui-validatebox" required=true
						 missingMessage="名称必填!"
						 value="" /></td>
					
				</tr>
				<tr>
					<td>代码:</td>
					<td><input type="text" name="unitCode"
						class="easyui-validatebox" required=true
						 missingMessage="代码必填!"
						 value="" /></td>
				</tr>
				<tr>
					<td>ip:</td>
					<td><input type="text" name="ip"
						class="easyui-validatebox" required=true
						 missingMessage="密码必填!" value="" /></td>
				</tr>
				
				<tr>
					<td>优先级:</td>
					<td><input id="priority" type="text" name="priority" value="" class="easyui-validatebox" digits="只能输入整数"
					/></td>
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
			title : '新增定位单位'
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
		var arr = $('#t_location_unit').datagrid('getSelections');
		if (arr.length != 1) {
			$.messager.show({
				title : '提示信息!',
				msg : '只能选择一行记录进行修改!'
			});
		}else {
			$('#mydialog').dialog({
				title : '修改定位单位'
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
		var arr = $('#t_location_unit').datagrid('getSelections');
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
					$.post('${ctx}/sys/locationUnit/batchDelete', {
						ids : ids
					}, function(result) {
						//1 刷新数据表格 
						$('#t_location_unit').datagrid('reload');
						//2 清空idField   
						$('#t_location_unit').datagrid('uncheckAll');
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
				url: '${ctx}/sys/locationUnit/save' ,
				cache:false ,
				data:$('#myform').serialize() ,
				dataType:'json' ,
				success:function(result){
					//1 关闭窗口
					$('#mydialog').dialog('close');
					//2刷新datagrid 
					$('#t_location_unit').datagrid('reload');
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
	
	
	$('#t_location_unit').datagrid({fit: true});
/**
 * 关闭窗口方法
 */
$('#btn2').click(function(){
	$('#mydialog').dialog('close');
});

	
$('#searchbtn').click(function(){
	$('#t_location_unit').datagrid('load' ,serializeForm($('#searchForm')));
});

function cleanSearch() {
	$('#t_location_unit').datagrid('load', {});
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
