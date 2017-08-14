<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>死亡登记</title>
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
		<table class="easyui-datagrid" id="t_list_content" title="越界警告列表"
			style="height: 400px;"
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:toolbar,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/monitoring/overAlarm/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80" style = "width:5%"></th>
					<th data-options="field:'culpritName',align:'center'"
						editor="text" style = "width:10%">姓名</th>
					<th data-options="field:'groupName',align:'center'"
						editor="text" style = "width:15%">司法所</th>
						<th data-options="field:'askLeaveflag',align:'center'"
						editor="text"style="width: 15%">是否请假</th>
					<th data-options="field:'note',align:'center'"
						editor="text" style="width: 20%">备注</th>
					<th data-options="field:'delmark',align:'center'"
						editor="text" style="width: 10%">扣分</th>
					<th data-options="field:'created',width:250,align:'center'"
						editor="text" style="width: 20%">最新越界时间</th>
					<th data-options="field:'delmark',width:250,align:'center'"
						editor="text" style="width: 20%">最新越界位置</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="mydialog" title="处理越界警告" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 600px;">
		<form id="myform" action="" method="post">
			<div id="tabAdd" class="easyui-tabs">
				<div title="处理信息" data-options="iconCls:'icon-view'"
					style="padding: 5px 5px">
					<input type="hidden" name="id" value="" />
					<table>
						<tr>
							<td>矫正对象:</td>
							<td><input id="addCulpritId" name="culpritId" type="text"
								readonly = "readonly"/></td>
							<td>越界时间:</td>
							<td><input id="created" name="created"
								readonly = "readonly" /></td>

						</tr>
						<tr>
							<td>扣分:</td>
							<td><select>
							<option>不扣分</option>
							<option>按未请假扣分</option>
							<option>按未销假扣分</option>
							</select></td>

							<td>处理方案:</td>
							<td><select>
							<option>定位漂移</option>
							<option>临界区</option>
							<option>不处理（情节轻微）</option>
							<option>处理</option>
							</select>
								</td>
							
						</tr>
					<tr align="center">
							<td colspan="2"><a id="btn1" class="easyui-linkbutton">确定</a>
								<a id="btn2" class="easyui-linkbutton">关闭</a></td>
						</tr>
					</table>
				</div>
					
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	var flag; //undefined 判断新增和修改方法
	var toolbar = [{
		text : '处理',
		iconCls : 'icon-edit',
		handler : function() {
			flag = 'edit';
			var arr = $('#t_list_content').datagrid('getSelections');
			if (arr.length != 1) {
				$.messager.show({
					title : '提示信息!',
					msg : '只能选择一行记录进行修改!'
				});
			} else {
				$('#mydialog').dialog({
					title : '处理越界警告'
				});
				$('#mydialog').dialog('open'); //打开窗口
				$('#myform').get(0).reset(); //清空表单数据 
				$('#myform').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
					id: arr[0].id,
					culpritId: arr[0].culpritName,
					created : arr[0].created,
				});
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
						//ids = ids.substring(0, ids.length - 1);
						$.post('${ctx}/endcorrect/death/batchDelete', {
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
	}];
	//搜索
	$('#searchbtn').click(function() {
		$("#t_list_content").datagrid('load',{culpritId:fCulpritId.val(),groupId:sysGroupId.val()});
		
	});
	
	$('#btn1').click(function() {
		$('#mydialog').dialog('close');
		$.messager.show({
			title : '提示信息!',
			msg : '处理成功!'
		});
		
	});
	$('#btn2').click(function() {
		$('#mydialog').dialog('close');
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
	
	function formatOper(val,row,index){  
		var operation='';
		
	    return operation;
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