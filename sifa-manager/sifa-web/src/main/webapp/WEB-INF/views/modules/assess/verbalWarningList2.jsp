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
					<td>姓名：<input name="culpritName" style="width:100px;" />&nbsp;</td>
					<td>所属司法部门：<input name="groupName" style="width:100px;"/></td>
					<td>申请时间：<input name="startDate" class="easyui-datetimebox" editable="false" style="width: 100px;" /></td>
					<td>至：<input name="endDate" class="easyui-datetimebox" editable="false" style="width: 100px;" />&nbsp;</td>
					<td>
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" id="searchbtn" >查询</a>
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" id="addbtn">增加</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 定义datagrid -->
	<div region="center" border="false">
		<table id="listContent" style="height: 400px;">
	</table>
	
</body>
<script type="text/javascript">
var flag;		//undefined 判断新增和修改方法
var dataGrid;
$(function(){
	$('.panel-tool-collapse').toggle(
			function(){$('#dd').panel('collapse',true)},
			function(){$('#dd').panel('expand',true)});
	dataGrid = $('#listContent').datagrid({
			url : '${ctx}/jiangcheng/verbalWarning/list', 
			method:'post',
			title:"口头警告列表",
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
				field : 'culpritName',
				title : '姓名',
				width : 80,
				align:'center'
			}, {
				field : 'groupName',
				title : '司法所',
				width : 80,
				align:'center'
			},  {
				field : 'dicReasonTypeKey',
				title : '违纪原因',
				width : 250,
				align:'center',
				
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
					var str="";
					if(row.isEnd==0){
						str=str+$.formatString('<a href="${ctx}/flow/queryActivityMap?processInstanceId={0}"  title="查看流程图"><span style="color:blue;"><strong><u>查看流程图</u><strong></span></a>', row.processInstanceId);
						str=str+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+$.formatString($.formatString('<a href="${ctx}/jiangcheng/verbalWarning/check?id={0}"  title="审批"><span style="color:blue;"><strong><u>审批</u><strong></span></a>', row.id));
					}
					if(row.isEnd==1){
						var pic=row.processDefinitionId+'&resourceType=png';
						str=str+$.formatString('<a href="${ctx}/flow/queryProcessDefinitionResource?processDefinitionId={0}"  title="查看流程图"><span style="color:blue;"><strong><u>查看流程图</u><strong></span></a>', pic);
					}
					str=str+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
								+$.formatString($.formatString('<a href="${ctx}/jiangcheng/verbalWarning/get?id={0}"  title="详细"><span style="color:blue;"><strong><u>详细</u><strong></span></a>', row.id));
								
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
		
	/*$('#searchbtn').click(function(){
		alert("cc");
		$('#listContent').datagrid('load' ,serializeForm($('#searchForm')));
	});*/ 
	 
	 $('#searchbtn').click(
				function() {
					$('#listContent').datagrid('load',serializeForm($('#searchForm')));
				});
	
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


	$('#cleanSearch').click(function(){
		$('#searchForm').get(0).reset(); //清空表单数据 
		$('#listContent').datagrid('reload',{});
		$('#lay').layout('collapse', 'north');
	});
	
	

	
	$('#addbtn').click(function(){
		location.href="${ctx}/jiangcheng/verbalWarning/add";
	}); 
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

function cleanSearch() {
	$('#t_list_content').datagrid('load', {});
	$('#searchForm').form().find('input').val('');
}

</script>

</html>
