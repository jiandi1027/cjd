<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>谈话教育</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>

<body class="easyui-layout" id="lay">
<div region="north" border="false" collapsed="false" title="搜索条件"
		style="height: 60px; overflow: hidden;" align="left">
		<form id="searchForm">
			<table>
				<tr>
					<td>所属司法部门<select id="sysGroupId" name="groupId" class="easyui-combotree" style="width: 80%;"
    data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true">
</select>
					<td>姓名<input id="fCulpritId" name="culpritId" class="easyui-combobox"
								url="${ctx}/culpritinfo/culprit/findAll" valueField="id"
								textField="name" value="" /></td>
					<td>
						<a href="javascript:void(0);" class="easyui-linkbutton"
						id="searchbtn">搜索</a><a href="javascript:void(0);"
						class="easyui-linkbutton" onclick="cleanSearch();">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_list_content" title="谈话教育列表"
			style="height: 400px;"
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:toolbar,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/interview/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80"></th>
					<th style="width: 15%;" data-options="field:'culpritName',align:'center'"
						editor="text">姓名</th>
					<th style="width: 15%;" data-options="field:'groupName',align:'center'"
						editor="text" >司法所</th>
					<th style="width: 15%;" data-options="field:'interviewPerson',align:'center'"
						editor="text">走访人</th>
					<th style="width: 40%;" data-options="field:'interviewPlace',align:'center'"
						editor="text">走访地点</th>
						<th style="width: 15%;"
						data-options="field:'interviewDate',align:'center'"
						>走访时间</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
<script type="text/javascript">
	var flag; //undefined 判断新增和修改方法
	var toolbar = [ {
		text : '新增',
		iconCls : 'icon-add',
		handler : function() {
					open_layer('新增走访登记','${ctx}/dailymgr/interview/add');
		}

	}, '-', {
		text : '修改',
		iconCls : 'icon-edit',
		handler : function() {
			var arr = $('#t_list_content').datagrid('getSelections');
			 if (arr.length <= 0) {
				 $.messager.show({
						title : '提示信息!',
						msg : '至少选择一行记录进行删除!'
					});
			}else{
				open_layer('新增谈话教育','${ctx}/dailymgr/interview/add?id='+arr[0].id);
			}
		}
	}, '-', {
		text : '删除',
		iconCls : 'icon-remove',
		handler : function() {
			var arr = $('#t_list_content').datagrid('getSelections');
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
								ids +=arr[i].id
							} else {
								ids += "&ids=" + arr[i].id;
							}
						}
						$.post('${ctx}/dailymgr/interview/batchDelete', {
							ids : ids
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
	},'-', {
		text : '查看详情',
		iconCls : 'icon-search',
		handler : function() {
			var arr = $('#t_list_content').datagrid('getSelections');
			 if (arr.length <= 0) {
				 $.messager.show({
						title : '提示信息!',
						msg : '至少选择一行记录进行删除!'
					});
			}else{
				open_layer('新增谈话教育','${ctx}/dailymgr/interview/detail?id='+arr[0].id);
			}
		}
	}];
	
	//查询
	$('#searchbtn').click(function() {
		$("#t_list_content").datagrid('load',serializeForm($('#searchForm')));
		
	});
	  //加载树  
    $('#comboTree').combotree({        
        url:'${ctx}/sys/sysGroup/loadGroupTree',  
        onClick:function(node){  
            //单用户单击一个节点的时候，触发  
            $("input[name='groupId']").val(node.id);  
        },  
        checkbox:false,  
        multiple:false  
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
	
	function open_layer(title,url){
		var index = layer.open({
			type: 2,
			title: title,
			content: url
		});
		layer.full(index);
	}
	</script>
</html>