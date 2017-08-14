<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>提请治安管理处罚</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
.texts{
	text-decoration:underline;
}
</style>
</head>


<body class="easyui-layout" id="lay">
	<div region="north" border="false" collapsed="false" title="搜索条件"
		style="height: 100px; overflow: hidden;">
		<form id="searchForm">
			<table>
				<tr>
					<td>姓&nbsp;名:<input id="culprit.name" name="culprit.name" class="easyui-textbox" style="width:60%"/>&nbsp;</td>
					<td>司法部门：<select id="sysGroupId" name="culprit.groupId" class="easyui-combotree" style="width: 80%;"
    				data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true"></select></td>
				</tr>
				<tr>
					<td>时间范围:<input id="searchStartDate" name="searchStartDate" class="easyui-datetimebox" data-options="showSeconds:true" editable="false" style="width:100px;"/>&nbsp;</td>
					<td>&nbsp;至&nbsp;<input id="searchEndDate" name="searchEndDate" class="easyui-datetimebox" data-options="showSeconds:true" editable="false" style="width:100px;"/>&nbsp;</td>
					<td colspan="2"><a href="javascript:void(0);" class="easyui-linkbutton" id="searchbtn">搜索</a>
					<a href="javascript:void(0);" class="easyui-linkbutton" onclick="cleanSearch();">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div region="center" border="false">
		<div id="toolbar" style="height:auto">
			<a id="tbAdd" href="#" class="easyui-linkbutton" style="float: left;" iconCls="icon-add" plain="true"><span style="color: black;">新增</span></a>
			<div class="datagrid-btn-separator"></div>
			<a id="tbModify" href="#" class="easyui-linkbutton" style="float: left;" iconCls="icon-edit" plain="true"><span style="color: black;">修改</span></a>
			<div class="datagrid-btn-separator"></div>
			<a id="tbBatchDelete" href="#" class="easyui-linkbutton" style="float: left;" iconCls="icon-remove" plain="true"><span style="color: black;">删除</span></a>
			<div class="datagrid-btn-separator"></div>
			<a id="tbSearch" href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true"><span style="color: black;">查询</span></a>
		</div>
		
		<table class="easyui-datagrid" id="t_list_content" title="审前调查列表"
			style="height: 400px;" 
			data-options="singleSelect:false,collapsible:true,striped:true,toolbar:'#toolbar',loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/jiangcheng/securityPunishment/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80">编号</th>
					<th data-options="field:'culpritName',width:80,align:'center',formatter:function(value,rowDate,rowIndex){
					if(rowDate.culprit !=null){
					return rowDate.culprit.name;
					}
					}" editor="text">姓名</th>
					<th data-options="field:'groupName',width:100,align:'center',formatter:function(value,rowDate,rowIndex){
					if(rowDate.sysGroup !=null){
					return rowDate.sysGroup.name;
					}
					}" editor="text" >司法所</th>
					<th data-options="field:'created',width:100,align:'center',formatter:Common.formatDate" editor="text" >申请提交时间</th>
				 <th data-options="field:'_opt',width:250,formatter:formatOper">操作</th>  
				</tr>
			</thead>
		</table>
	</div>

	
</body>
<script type="text/javascript">
	var personId = "${account.personId}";
	var flag; //undefined 判断新增和修改方法
	
	/* toolbar工具栏方法 	*/
	$('#tbAdd').click(function(){
		flag = 'add';
		open_layer('新增治安管理处罚','${ctx}/jiangcheng/securityPunishment/form');
	});
	
	$('#tbModify').click(function(){
		flag = 'edit';
		var arr = $('#t_list_content').datagrid('getSelections');
		if (arr.length != 1) {
			$.messager.show({
				title : '提示信息!',
				msg : '只能选择一行记录进行修改!'
			});
		} else {
			open_layer('修改治安管理处罚','${ctx}/jiangcheng/securityPunishment/form?id=' + arr[0].id);
		}
	});

	$('#tbBatchDelete').click(function(){
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
							ids += arr[i].id
						} else {
							ids += "," + arr[i].id;
						}
					}
					$.post('${ctx}/jiangcheng/securityPunishment/batchDelete', {
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
	});

	$('#tbSearch').click(function(){
		$('#lay').layout('expand', 'north');
	});
	
	
	//取消搜索
	function cleanSearch() {
		$('#t_list_content').datagrid('load', {});
		//$('#searchForm').get(0).reset();
		$('#searchForm').form().find('input').val('');
	}
	
	$(function() {
		//
		$('#t_list_content').datagrid({
			fit : true
		});
		
		/**
		 * 关闭窗口方法
		 */
		$('#btn2').click(function() {
			$('#mydialog').dialog('close');
		});

		//搜索
		$('#searchbtn').click(function() {
			$('#t_list_content').datagrid('load', serializeForm($('#searchForm')));
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
	});

	function formatRole(value, row, index) {
		var str = '';
		$.ajax({
			type : 'get',
			url : '${ctx}/sys/sysRole/findById?id=' + value,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			success : function(result) {
				str = result.name;
			}
		});
		return str;

	}
	
	
	//？？？
	function delHsCode(index) {  
        $('#Hsdata').datagrid('selectRow', index);  
        var row = $('#Hsdata').datagrid('getSelected');  
        if (row.Id != null && row.Id !== undefined)  
        alert(row.Id);  
    }
	
	function formatOper(val,row,index){
		var operation='<a href="javascript:void(0);" onclick="securityPunishmentDetail(\''+row.id+'\')"><span style="color:blue;">详情</span></a>';
		
		if (row.hasPermission==1) {
			if (row.auditType == 'firstReport'){
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="reportProcess(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"><span style="color:blue;">上报</span></a>';
			}
			else if (row.auditType == 'workerPrint'){
			}
			else {
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="submitAudit(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"><span style="color:blue;">审核</span></a>';
			}
		}
		if (row.processInstanceId!='' && row.processInstanceId!=null) {
			if (row.isEnd==1) {
				var url = '${ctx}/flow/queryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="viewProcess(\''+url+'\')"><span style="color:blue;">查看流程</span></a>';
			} else {
				var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="viewProcess(\''+url+'\')"><span style="color:blue;">查看流程</span></a>';
			}
		}
		if (row.processInstanceId!='' && row.processInstanceId!=null) {
			if (row.isEnd==0) {
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="stopProcess(\''+row.taskId+'\')"><span style="color:blue;">终止</span></a>';
			}
		}
		
	    return operation;
	} 
	
	function viewProcess(url){
		open_layer('治安管理流程',url);
	}
	function submitAudit(taskId,id,auditType,processId){
		open_layer("提请治安审批","${ctx}/jiangcheng/securityPunishment/securityPunishmentReport?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId);
	}
	function reportProcess(taskId,id,auditType,processId){
		open_layer("提请治安上报","${ctx}/jiangcheng/securityPunishment/securityPunishmentPush?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId);
	}
	function securityPunishmentDetail(id){
		var url = '${ctx}/jiangcheng/securityPunishment/detail?id=' + id;
		open_layer('治安管理详情',url);
	}
	
	function stopProcess(taskId){
		$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
		      if (b){  
		    	  $.ajax({
		  			type : 'get',
		  			url : "${ctx}/jiangcheng/securityPunishment/stopProcess?taskId=" + taskId,
		  			cache : false,
		  			async : false, //同步请求
		  			dataType : 'json',
		  			success : function(result) {
		  				if(result.status==200){
							$('#t_list_content').datagrid('reload');
							//2 清空idField   
							$('#t_list_content').datagrid('uncheckAll');
		  				}else{
		  					alert(result.msg);
		  				}
		  			}
		  		});
		      }
		});  
	}
	
	
	function open_layer(title,url){
		
		var index = layer.open({
			type: 2,
			title: title,
			content: url
		});
		layer.full(index);
	}
	
	//timestamp转换date
	var Common = {
	    formatDate: function (value) {
	        if (value == null || value == '') {
	            return '';
	        }
	        var dt;
	        if (value instanceof Date) {
	            dt = value;
	        } else {
	            dt = new Date(value);
	        }
	        return dt.format("yyyy-MM-dd"); //扩展的Date的format方法(上述插件实现)
	    }
	}
	
</script>

</html>
