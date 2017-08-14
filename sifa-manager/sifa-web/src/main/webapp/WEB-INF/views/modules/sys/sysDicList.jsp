<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统数据字典</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>


<body class="easyui-layout" id="lay">

	<div class="easyui-panel" title="Nested Panel"
		data-options="width:'100%',minHeight:500,noheader:true,border:false"
		style="padding: 10px;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'west',split:false"
				style="height: 400px;width: 400px; ">
				<table class="easyui-datagrid" id="sys_dict_type" title="父数据字典类型列表" style="height: 400px;"
					data-options="singleSelect:true,fit:true,collapsible:true,striped:true,showRefresh:false,toolbar:toolbar2,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,fitColumns:true,url:'${ctx}/sys/sysDic/list?parentKey=1',method:'post'">
					<thead>
						<tr>
							<th data-options="field:'id',checkbox:true,width:80">编号</th>
							<th data-options="field:'tabName',width:80,align:'right'"
								editor="{type:'validatebox',options:{required:true}}">表名</th>
							<th data-options="field:'columnName',width:100" editor="text"
								editor="{type:'numberbox',options:{required:true}}">列名</th>
							<th data-options="field:'remarks',width:100" >描述</th>
						</tr>
					</thead>
				</table>
			</div>
			<div data-options="region:'center'">
				<table class="easyui-datagrid" id="data-content" title="数据字典列表"
					style="height: 400px;"
					data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:toolbar,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,fitColumns:true,pageList:[5,10,15,20,50],url:'${ctx}/sys/sysDic/list',method:'post',queryParams:{type:''}">
					<thead>
						<tr>
							<th data-options="field:'id',checkbox:true,width:80">编号</th>
							<th data-options="field:'tabName',width:80,align:'right'"
								editor="{type:'validatebox',options:{required:true}}">表名</th>
							<th data-options="field:'columnName',width:100" editor="text"
								editor="{type:'numberbox',options:{required:true}}">列名</th>
							<th data-options="field:'key',width:80,align:'right'"
								editor="{type:'validatebox',options:{required:true}}">标签名</th>
							<th data-options="field:'value',width:100" editor="text"
								editor="{type:'numberbox',options:{required:true}}">数据值</th>
							
							<th data-options="field:'dicSort',width:80,sortable:true"
								editor="{type:'numberbox',options:{required:true}}">排序</th>
							<th data-options="field:'remarks',width:250" editor="text">描述</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>

	<%-- 
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
			data-options="singleSelect:true,collapsible:true,striped:true,toolbar:toolbar,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,fitColumns:true,pageList:[5,10,15,20,50],method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'label',width:80,align:'right'"  editor="{type:'validatebox',options:{required:true}}">标签名</th>
				<th data-options="field:'value',width:100" editor="text"  editor="{type:'numberbox',options:{required:true}}">数据值</th>
				<th data-options="field:'type',width:80,align:'right',sortable:true"   editor="{type:'validatebox',options:{required:true}}">类型</th>
				<th data-options="field:'dicSort',width:80,sortable:true" editor="{type:'numberbox',options:{required:true}}">排序</th>
				<th data-options="field:'description',width:250" editor="text">描述</th>
			</tr>
		</thead>
	</table>
	</div>
	<div id="menu" class="easyui-menu" style="width:120px;display: none;">
		<div onclick="add();" iconCls="icon-add">增加</div>
		<div onclick="del();" iconCls="icon-remove">删除</div>
		<div onclick="edit();" iconCls="icon-edit">编辑</div>
	</div>
	
	--%>
<div id="mydialog2" title="新增数据字典" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 300px;">
		<form id="myform" action="" method="post">
			<input type="hidden" name="id" value="" />
			<input type="hidden" name="parentId" value="0" />
			<table>
				<tr>
					<td>表名:</td>
					<td>
				
					<input type="text" name="tabName" id="tabName" class="easyui-validatebox"
						required=true missingMessage="类型必填!" /></td>

				</tr>
				<tr>
					<td>列名:</td>
					<td><input type="text" name="columnName" class="easyui-validatebox"
						required=true missingMessage="类型名称必填!" value="" /></td>
				</tr>
				<tr>
					<td>排序:</td>
					<td><input type="text" name="dicSort" class="easyui-validatebox"
						required=true missingMessage="类型名称必填!" value="" /></td>
				</tr>
				<tr>
					<td>描述:</td>
					<td><input type="text" name="remarks" class="easyui-validatebox"
						 value="" /></td>
				</tr>
				<tr align="center">
					<td colspan="2"><a id="btn1" class="easyui-linkbutton">确定</a>
						<a id="btn2" class="easyui-linkbutton" onclick="javascript:$('#mydialog').dialog('close');">关闭</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="mydialog" title="新增数据字典" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 300px;">
		<form id="myform2" action="" method="post">
			<input type="hidden" name="id" value="" />
			<input type="hidden" name="parentId" value="" />
			<table>
				<tr>
					<td>表名:</td>
					<td>
				
					<input type="text" name="tabName" id="tabName" class="easyui-validatebox"
						required=true missingMessage="类型必填!" /></td>

				</tr>
				<tr>
					<td>列名:</td>
					<td><input type="text" name="columnName" class="easyui-validatebox"
						required=true missingMessage="类型名称必填!" value="" /></td>
				</tr>
				<tr>
					<td>键:</td>
					<td><input type="text" name="key" class="easyui-validatebox"
						required=true missingMessage="键必填!" value="" /></td>
				</tr>
				<tr>
					<td>值:</td>
					<td><input type="text" name="value" class="easyui-validatebox"
						required=true missingMessage="值必填!" value="" /></td>
				</tr>
				<tr>
					<td>排序:</td>
					<td><input type="text" name="dicSort" class="easyui-validatebox"
						required=true missingMessage="类型名称必填!" value="" /></td>
				</tr>
				<tr>
					<td>描述:</td>
					<td><input type="text" name="remarks" class="easyui-validatebox"
						 value="" /></td>
				</tr>
				<tr align="center">
					<td colspan="2"><a id="btn3" class="easyui-linkbutton">确定</a>
						<a id="btn4" class="easyui-linkbutton" onclick="javascript:$('#mydialog').dialog('close');">关闭</a></td>
				</tr>
			</table>
		</form>
	</div>

</body>
<script type="text/javascript">


var flag ;		//undefined 判断新增和修改方法
var toolbar2 = [ {
	text : '新增',
	iconCls : 'icon-add',
	handler : function() {
		flag = 'add';
		
		$('#mydialog2').dialog({
			title : '新增数据字典类型'
		});
		//$('#myform').find('input[name!=sex]').val("");
		$('#myform').get(0).reset();
		//$('#myform').form('clear');
		$('#mydialog2').dialog('open');

	}

}, '-', {
	text : '修改',
	iconCls : 'icon-edit',
	handler : function() {
		flag = 'edit';
		var arr = $('#sys_dict_type').datagrid('getSelections');
		if (arr.length != 1) {
			$.messager.show({
				title : '提示信息!',
				msg : '只能选择一行记录进行修改!'
			});
		}else {
			$('#mydialog2').dialog({
				title : '修改数据字典类型'
			});
			$('#mydialog2').dialog('open'); //打开窗口
			$('#myform').get(0).reset(); //清空表单数据 
			$('#myform').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
				id : arr[0].id,
				name : arr[0].type,
				tname : arr[0].typeName
			});
		}
	

	}
},  '-', {
	text : '删除',
	iconCls : 'icon-remove',
	handler : function() {
		var arr = $('#sys_dict_type').datagrid('getSelections');
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
						$('#sys_dict_type').datagrid('reload');
						//2 清空idField   
						$('#sys_dict_type').datagrid('uncheckAll');
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

	$(function() {
		var pager = $('#sys_dict_type').datagrid('getPager');    //得到DataGrid页面
		pager.pagination({
			layout:['first','prev','next','last','refresh']
		});
		
		$('#sys_dict_type').datagrid({
			onCheck:function(rowIndex,rowData){
				$('#data-content').datagrid('reload', {
					parentKey :rowData.id
		        });
			}
		});

	
	});

	var toolbar = [ {
		text : '新增',
		iconCls : 'icon-add',
		handler : function() {
			var column=$('#sys_dict_type').datagrid('getSelected');
			if(column==null){
				$.messager.show({
					title : '提示信息!',
					msg : '请选择父数据字典！'
				});
				return;
			}
			
			$('#mydialog').dialog({
				title : '修改数据字典类型'
			});
			$('#mydialog').dialog('open'); //打开窗口
			$('#myform2').get(0).reset(); //清空表单数据 
			$('#myform2').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
				parentId : column.id,
				tabName : column.tabName,
				columnName : column.columnName,
				remarks:column.remarks
			});

		}

	}, '-', {
		text : '修改',
		iconCls : 'icon-edit',
		handler : function() {
			flag = 'edit';
			var arr = $('#data-content').datagrid('getSelections');
			if (arr.length != 1) {
				$.messager.show({
					title : '提示信息!',
					msg : '只能选择一行记录进行修改!'
				});
			} else {
				var index = $('#data-content').datagrid('getRowIndex', arr[0]);
				$('#data-content').edatagrid('editRow', index);
			}

		}
	}, '-', {
		text : '保存',
		iconCls : 'icon-save',
		handler : function() {
			$('#data-content').edatagrid('saveRow');
		}
	}, '-', {
		text : '删除',
		iconCls : 'icon-remove',
		handler : function() {
			var arr = $('#data-content').datagrid('getSelections');
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
							ids += arr[i].id + ',';
						}
						ids = ids.substring(0, ids.length - 1);
						$.post('UserServlet?method=delete', {
							ids : ids
						}, function(result) {
							//1 刷新数据表格 
							$('#t_user').datagrid('reload');
							//2 清空idField   
							$('#t_user').datagrid('uncheckAll');
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
	}, '-', {
		text : '取消编辑',
		iconCls : 'icon-undo',
		handler : function() {
			$('#data-content').edatagrid('cancelRow')
		}
	} ];
	
	
	/**
	 *  提交表单方法
	 */
	$('#btn1').click(function(){
			if($('#myform').form('validate')){
				$.ajax({
					type: 'post' ,
					url: '${ctx}/sys/sysDic/save' ,
					cache:false ,
					data:$('#myform').serialize() ,
					dataType:'json' ,
					success:function(result){
						//1 关闭窗口
						$('#mydialog2').dialog('close');
						//2刷新datagrid 
						$('#sys_dict_type').datagrid('reload');
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
	
	/**
	 *  提交表单方法
	 */
	$('#btn3').click(function(){
			if($('#myform2').form('validate')){
				$.ajax({
					type: 'post' ,
					url: '${ctx}/sys/sysDic/save' ,
					cache:false ,
					data:$('#myform2').serialize() ,
					dataType:'json' ,
					success:function(result){
						//1 关闭窗口
						$('#mydialog').dialog('close');
						//2刷新datagrid 
						$('#data-content').datagrid('reload');
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

</script>

</html>
