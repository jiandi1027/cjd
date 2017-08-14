<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>特殊原因矫正终止</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>
<title>Insert title here</title>
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
		<table class="easyui-datagrid" id="t_list_content" title="终止矫正人员列表"
			style="height: 400px;"
			data-options="singleSelect:false,fit:true,collapsible:true,striped:true,toolbar:toolbar,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/endcorrect/redressStop/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80"></th>
					<th data-options="field:'culpritName',width:80,align:'center'"
						editor="text">姓名</th>
					<th data-options="field:'groupName',width:100,align:'center'"
						editor="text" ">司法所</th>
					<th style="width: 10%;"
						data-options="field:'created',width:80,align:'center',sortable:true"
						editor="{type:'validatebox'}">创建时间</th>
					<th data-options="field:'creater',width:250,align:'center'"
						editor="text">创建人</th>
						<th data-options="field:'activityName',width:250,align:'center'"
						editor="text">流程状态</th>
						<th data-options="field:'_opt',width:200,formatter:formatOper">操作</th>  

				</tr>
			</thead>
		</table>
	</div>

	<script type="text/javascript">
	var flag; //undefined 判断新增和修改方法
	var toolbar = [ {
		text : '新增',
		iconCls : 'icon-add',
		handler : function() {
					open_layer('新增特殊原因终止矫正','${ctx}/endcorrect/redressStop/add');
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
								ids += "," + arr[i].id;
							}

						}
						//ids = ids.substring(0, ids.length - 1);
						$.post('${ctx}/endcorrect/redressStop/batchDelete', {
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
	/**
	 *提交弹出框信息到controller，增加一条矫正终止登记
	 *	 
	 */
	
	/**
	 * 关闭窗口方法
	 */
	$('#btn2').click(function() {
		$('#mydialog').dialog('close');
	});
	$('#searchbtn').click(function() {
		$("#t_list_content").datagrid('load',serializeForm($('#searchForm')));
		
	});
	//取消搜索
	function cleanSearch() {
		$('#t_list_content').datagrid('load', {});
		//$('#searchForm').get(0).reset();
		$('#searchForm').form().find('input').val('');
	}
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
		if(row.processInstanceId!='' && row.processInstanceId!=null){
			var operation='<a href="javascript:void(0);" onclick="redressStopDetail(\''+row.id+'\')">详情</a>';
		}
		if(row.hasPermission==1){
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="submitAuditredressStop(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">流程处理</a>';
		}
		if(row.processInstanceId!='' && row.processInstanceId!=null){
			if(row.isEnd==1){
				var url = '${ctx}/flow/queryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="viewProcess(\''+url+'\')">查看流程</a>';
			}else{
				var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="viewProcess(\''+url+'\')">查看流程</a>';
			}
		}
		
	    return operation;
	} 
	function viewProcess(url){
		open_layer('特殊情况矫正终止流程',url);
	}
	function submitAuditredressStop(taskId,id,auditType,processId){
		open_layer("特殊情况矫正终止审批","${ctx}/endcorrect/redressStop/redressStopAudit?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId);
	}

	function redressStopDetail(id){
		var url = '${ctx}/endcorrect/redressStop/detail?id=' + id;
		open_layer('特殊情况矫正终止流程详情',url);
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
</body>
</html>