<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统定位人员</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>


<body id="lay">
	<div class="easyui-panel" title="Nested Panel"
		data-options="width:'100%',minHeight:500,noheader:true,border:false"
		style="padding: 10px;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'west',split:false" title="定位单位"
				style="width: 190px; padding: 5px">
				<ul id="contentCategoryTree" class="easyui-tree"
					data-options="url:'${ctx}/sys/locationUnit/tree',animate: true,method : 'GET'">
				</ul>
			</div>
			<div data-options="region:'center'" >
				<table class="easyui-datagrid" id="t_location_person" title="定位人员列表"
					data-options="toolbar:toolbar,singleSelect:false,collapsible:true,pagination:true,method:'post',pageSize:20,url:'${ctx}/sys/locationPerson/list',fitColumns:true,queryParams:{unitId:''}">
					<thead>
						<tr>
							<th data-options="field:'id',checkbox:true,width:30,align:'center'">ID</th>
							<th data-options="field:'name',width:120,align:'center'">姓名</th>
							<th data-options="field:'simCardNum',width:100,align:'center'">手机号</th>
							<th data-options="field:'unitId',width:120,align:'center'">所属单位</th>
							<th
								data-options="field:'inteval',width:60,align:'center'">定位间隔</th>
							<th
								data-options="field:'nextLocateTime',width:100,align:'center'">下次定位时间</th>
							<th
								data-options="field:'createDate',width:130,align:'center'">创建日期</th>
							<th
								data-options="field:'updateDate',width:130,align:'center'">更新日期</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>


	<div id="mydialog" title="新增定位人员" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 300px;">
		<form id="myform" action="" method="post">
			<input type="hidden" name="id" value="" />
			<table>
				<tr>
					<td>所属单位:</td>
					<td>
					<input type="hidden" name="unitId" id="unitId"/>
					<input type="text" name="unitName" id="unitName"/></td>

				</tr>
				<tr>
					<td>姓名:</td>
					<td><input type="text" name="ip" class="easyui-validatebox"
						required=true missingMessage="姓名必填!" value="" /></td>
				</tr>
				<tr>
					<td>手机号:</td>
					<td><input type="text" name="simCardNum"
						class="easyui-validatebox" required=true missingMessage="手机号必填!"
						value="" /></td>
				</tr>
				<tr>
					<td>状态:</td>
					<td>
					<%-- ${fns:getSysDictLabel() } --%>
					<input type="text" name="status"
						class="easyui-validatebox" required=true missingMessage="状态必填!"
						value="" /></td>
				</tr>
				

				<tr>
					<td>定位间隔:</td>
					<td><input id="inteval" type="text" name="inteval" value="15"
						class="easyui-validatebox" digits="定位间隔必填" /></td>
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
	var flag; //undefined 判断新增和修改方法
	var toolbar = [ {
		text : '新增',
		iconCls : 'icon-add',
		handler : function() {
			var node = $("#contentCategoryTree").tree("getSelected");
	    	if(!node){
	    		$.messager.alert('提示','新增内容必须选择一个单位!');
	    		return ;
	    	}
	    	
	    	
	   
			flag = 'add';
			$('#mydialog').dialog({
				title : '新增定位人员'
			});
			//$('#myform').find('input[name!=sex]').val("");
			$('#myform').get(0).reset();
			
			$('#myform').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
	    		unitName : node.text,
	    		unitId : node.id
	    		
			});
			//$('#myform').form('clear');
			$('#mydialog').dialog('open');

		}

	}, '-', {
		text : '修改',
		iconCls : 'icon-edit',
		handler : function() {
			flag = 'edit';
			var arr = $('#t_location_person').datagrid('getSelections');
			if (arr.length != 1) {
				$.messager.show({
					title : '提示信息!',
					msg : '只能选择一行记录进行修改!'
				});
			} else {
				$('#mydialog').dialog({
					title : '修改定位人员'
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
	}, '-', {
		text : '删除',
		iconCls : 'icon-remove',
		handler : function() {
			var arr = $('#t_location_person').datagrid('getSelections');
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
						$.post('${ctx}/sys/locationPerson/batchDelete', {
							ids : ids
						}, function(result) {
							//1 刷新数据表格 
							$('#t_location_person').datagrid('reload');
							//2 清空idField   
							$('#t_location_person').datagrid('uncheckAll');
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
	$('#btn1').click(function() {
		if ($('#myform').form('validate')) {
			$.ajax({
				type : 'post',
				url : '${ctx}/sys/locationPerson/save',
				cache : false,
				data : $('#myform').serialize(),
				dataType : 'json',
				success : function(result) {
					//1 关闭窗口
					$('#mydialog').dialog('close');
					//2刷新datagrid 
					$('#t_location_person').datagrid('reload');
					//3 提示信息
					$.messager.show({
						title : result.status == 200 ? "ok" : "fail",
						msg : result.msg
					});
				},
				error : function(result) {
					$.meesager.show({
						title : result.status == 200 ? "ok" : "fail",
						msg : result.msg
					});
				}
			});
		} else {
			$.messager.show({
				title : '提示信息!',
				msg : '数据验证不通过,不能保存!'
			});
		}
	});
	$(function() {

		$('#t_location_person').datagrid({
			fit : true
		});
		/**
		 * 关闭窗口方法
		 */
		$('#btn2').click(function() {
			$('#mydialog').dialog('close');
		});

		$('#searchbtn').click(
				function() {
					$('#t_location_person').datagrid('load',
							serializeForm($('#searchForm')));
				});

		function cleanSearch() {
			$('#t_location_person').datagrid('load', {});
			$('#searchForm').form().find('input').val('');
		}

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
		
		
		var tree = $("#contentCategoryTree");
		var datagrid = $("#t_location_person");
		tree.tree({
			onClick : function(node){
				
				datagrid.datagrid('reload', {
					unitId :node.id
		        });
			}
		});
	});
</script>

</html>
