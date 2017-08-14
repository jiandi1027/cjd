<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>口头警告</title>
<%@include file="/WEB-INF/views/include/head.jsp" %>
<style type="text/css">
	tr{text-align:right;}
</style>
</head>
<body class="easyui-layout" id="lay">
		<!-- 搜索模块 -->
		<div region="north" border="false" collapsed="false" title="搜索条件" style="height: 60px;overflow: hidden; background-color: #E0ECFF;" align="left">
		<form id="searchForm">
			<table>
				<tr>
					<!-- 后台标记为查询 -->
					<td><input name="search" value="1" style="display:none;"/></td>
					<td>姓名：<input name="name" style="width:100px;" />&nbsp;</td>
					<td>所属司法部门：<input name="type" style="width:100px;"/></td>
					<td>申请时间：<input name="startCreateDate" class="easyui-datetimebox" editable="false" style="width: 100px;" /></td>
					<td>至：<input name="endCreateDate" class="easyui-datetimebox" editable="false" style="width: 100px;" />&nbsp;</td>
					<td>
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" id="searchbtn" >查询</a>
						<a href="${ctx}/jiangcheng/verbalWarning/add" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" ">增加</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 定义datagrid -->
	<div region="center" border="false">
		<table id="listContent" style="height: 400px;">
	</table>
	</div>
	<!-- 新增或修改模块 -->
	<div id="mydialog" title="新增口头警告" modal=true draggable=false class="easyui-dialog" closed=true style="width:90%;height:80%;">
		<div style="border:1px solid red;">
			<table style="margin:20px auto;width:900px;border:1px solid red">
				<tr>
					<td>
						<span style="color:red;">*</span>姓名：<input id="cc" name="name" value="" required=true missingMessage="名称必填!">
					</td>
				</tr>
				<tr>
					<td>性别：<input type="text" name="url" /></td>
					<td>名族：<input type="text" name="url" /></td>
					<td>身份证号：<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td>曾用名：<input type="text" name="url" /></td>
					<td>出生日期：<input type="text" name="url" /></td>
					<td>文化程度：<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td>婚姻状况：<input type="text" name="url" /></td>
					<td>职业：<input type="text" name="url" /></td>
					<td>原政治面貌：<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td>籍贯：<input type="text" name="url" /></td>
					<td>户籍所在地：<input type="text" name="url" /></td>
					<td>现居住地：<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td >原判罪名：<input type="text" name="url" /></td>
					<td>刑期：<input type="text" name="url" /></td>
					<td>附加刑：<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td>刑期变动：<input type="text" name="url" /></td>
					<td>刑期开始日期：<input type="text" name="url" /></td>
					<td>刑期结束日期：<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td>刑法执行类别：<input type="text" name="url" /></td>
					<td>矫正开始日期：<input type="text" name="url" /></td>
					<td>矫正结束日期：<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td>简要违纪情况：<input type="text"/></td>
					<td>简要违纪情况：<input type="text"/></td>
					<td>简要违纪情况：<input type="text"/></td>
				</tr>
			</table>
		</div>
		<div id="dd" class="easyui-panel" title="口头警告信息" data-options="iconCls:'panel-tool-collapse'" style="border:1px solid red;">
			<form id="myform" action="" method="post">
				<input type="hidden" name="id" id="editId" value="" />
				<table style="margin:20px 42px;border:1px solid red;width:900px;">
				<tr>
					<td>
						<span style="color:red;">*</span>违纪原因：<input id="cc" name="name" value="" required=true missingMessage="名称必填!">
					</td>
				</tr>
				<tr>
					<td>证据材料：<input type="button" value="上传" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>悔过书：<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td>已上传材料：<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td colspan="3">简要违纪情况：<textarea rows="2" cols="107">请简要阐述违纪情况！</textarea></td>
				</tr>
				<tr>
					<!-- 此处两个td为仅仅用于占位 -->
					<td style="visibility:hidden;">简要违纪情：<input type="text"/></td>
					<td style="visibility:hidden;">简要违纪情：<input type="text"/></td>
					<td style="visibility:hidden;">简要违纪情：<input type="text"/></td>
				</tr>
			</table>
			<div align="center">
					<p colspan="2"><a id="btn1" class="easyui-linkbutton">确定</a>
						<a id="btn2" class="easyui-linkbutton">关闭</a></p>
			</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
var flag;		//undefined 判断新增和修改方法
var dataGrid;
$(function(){
	$('.panel-tool-collapse').toggle(
			function(){$('#dd').panel('collapse',true)},
			function(){$('#dd').panel('expand',true)});
	dataGrid = $('#listContent').datagrid({
			url : '${ctx}/jiangcheng/noDeal/list', 
			method:'post',
			title:"待处理作不处理列表",
			idField : 'id',
			treeField : 'name',
			fit : true,
			singleSelect:true,
			fitColumns:true,
			border : false,
			rownumbers: true,
			loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,
			pageSize: 10 ,
			pageList:[5,10,15,20,50],
			frozenColumns : [ [ {
				title : '编号',
				field : 'id',
				width : 150,
				hidden : false
			} ] ],
			columns : [ [ {
				field : 'behaviorId',
				title : 'behaviorId',
				width : 80,
				align:'center'
			}, {
				field : 'beManageId',
				title : 'beManageId',
				width : 80,
				align:'center'
			},  {
				field : 'dicReasonTypeKey',
				title : '违纪原因',
				width : 250,
				align:'center'
			}, {
				field : 'created',
				title : '创建日期',
				width :80,
				align:'center',
				sortable:true
			}, {
				field : 'updated',
				title : '更新日期',
				width :80,
				align:'center',
				sortable:true
			},{
				field : 'action',
				title : '操作',
				width :150,
				align:'center',
				formatter : function(value, row, index) {
					var str = $.formatString('<a href="javascript:editFun(\'{0}\');"  title="查看流程图"><span style="color:blue;"><strong><u>查看流程图</u><strong></span></a>', row.id)
								+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
								+$.formatString($.formatString('<a href="javascript:editFun(\'{0}\');"  title="详细"><span style="color:blue;"><strong><u>详细</u><strong></span></a>', row.id));
					return str;
				}
			},  ] ],
			toolbar : '#toolbar'
		});

	/* //新增口头警告时，根据姓名查询
	$('#cc').combobox({
		url:"${ctx}/sys/sysPermission/selectToTree",
		valueField:'id',
		width:'173px',
	    textField:'text' 
	});	
	 */
	
	/**
	 * 关闭窗口方法
	 */
	$('#btn2').click(function(){
		$('#myform').get(0).reset();
		$('#mydialog').dialog('close');
	});
		
	$('#searchbtn').click(function(){
		$('#listContent').datagrid('load' ,serializeForm($('#searchForm')));
	}); 

	$('#cleanSearch').click(function(){
		$('#searchForm').get(0).reset(); //清空表单数据 
		$('#listContent').datagrid('reload',{});
		$('#lay').layout('collapse', 'north');
	});

	/**
	 *  提交表单方法
	 */
	$('#btn1').click(function(){
			//提交表单时，判断名称是否改变，若改变了则开启验证
			if(flag=="edit"){
				var arr = $('#listContent').datagrid('getSelections');
				if(arr[0].name!=$("#name").val()){
					$('#name').validatebox('enableValidation');
				}
			} 
			if($('#myform').form('validate')){
				$.ajax({
					type: 'post' ,
					url: '${ctx}/sys/sysPermission/save' ,
					cache:false ,
					data:$('#myform').serialize() ,
					dataType:'json' ,
					success:function(result){
						$('#myform').get(0).reset();
						//1 关闭窗口
						$('#mydialog').dialog('close');
						//2刷新datagrid 
						$('#listContent').datagrid('reload',{});
						//3刷新combotree
						$('#cc').combotree('reload');
						
						//4 提示信息
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
	/**
	 * 增加formatString功能
	 * 使用方法：$.formatString('字符串{0}字符串{1}字符串','第一个变量','第二个变量');
	 * @returns 格式化后的字符串
	 */
	$.formatString = function(str) {
		for ( var i = 0; i < arguments.length - 1; i++) {
			str = str.replace("{" + i + "}", arguments[i + 1]);
		}
		return str;
	};
	
	//新增资源时选择下拉选图标
	$('#iconCls').combobox({
		data:$.iconData,
		formatter : function(v) {
			return $.formatString('<span class="{0}" style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span>{1}', v.value, v.value);
		}
	}); 
	
	
	
});
//新增资源
function addFun(){
	flag = 'add';
	$('#mydialog').dialog({
		title : '新增口头警告'
	});
	//$('#myform').find('input[name!=sex]').val("");
	$('#myform').get(0).reset();
	//$('#myform').form('clear');
	$('#mydialog').dialog('open');
	//新增资源时开启名称验证
	$('#name').validatebox('enableValidation');
}

//修改资源
function editFun(id) {
	console.log(11111);
	flag = 'edit';
	if (id != undefined) {
		datagrid.datagrid('select', id);
	}
	var arr = $('#listContent').datagrid('getSelections');
	if(arr.length <= 0){
		$.messager.show({
			title : '提示信息!',
			msg : '至少选择一行记录进行修改!'
		});
		return;
	}
	//判断parent是否为空
	var parentName=null;
	if(arr[0].parent!=null){   
		parentName=arr[0].parent.name;
	}
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
		
		$('#cc').combotree('setValue',parentName);//导入父资源名称
		$('#myform').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
			id : id,
			_parentId:arr[0]._parentId,
			name : arr[0].name,
			type : arr[0].type,
			url : arr[0].url,
			percode : arr[0].percode,
			perSort : arr[0].perSort,
			available : arr[0].available,
			iconCls:arr[0].iconCls
		});
		//修改时先关闭名称验证
		$('#name').validatebox('disableValidation');
	}
};

//删除资源
function deleteFun(id) {
	flag = 'delete';
	var arr = $('#listContent').datagrid('getSelections');
	console.log(arr[0].id);
	if (arr.length <= 0) {
		$.messager.show({
			title : '提示信息!',
			msg : '至少选择一行记录进行删除!'
		});
	} else {
		$.messager.confirm('提示信息', '确认删除?', function(r) {
			if (r) {
				$.post('${ctx}/sys/sysPermission/batchDelete', {
					ids : id
				}, function(result) {
					//1 刷新数据表格 
					$('#listContent').datagrid('reload',{});
					//2 清空idField   
					$('#listContent').datagrid('uncheckAll');
					//刷新combotree
					$('#cc').combotree('reload');
					//3 给提示信息 
					$.messager.show({
						title : '提示信息!',
						msg : result.msg
					});
				});
			} else {
				return;
			}
		});
	}
	}

//查询功能
function search(event){
	$('#lay').layout('expand', 'north');
}

</script>

</html>
