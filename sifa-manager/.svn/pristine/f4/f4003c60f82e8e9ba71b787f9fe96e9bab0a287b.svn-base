<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>进入特定区域管理</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>


<body class="easyui-layout" id="lay">
	<div region="north" border="false" collapsed="true" title="搜索条件"
		style="height: 60px; overflow: hidden;" align="left">
		<form id="searchForm">
			<table>
				<tr>
					<td>所属司法部门：
						<input name="sysGroup.id" id="sysGroupId" style="width:80%;"  class="easyui-combotree"
						data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true"/>
					</td>
					<td>姓名：<input name="culprit.name" style="width:100px;" />&nbsp;</td>
					<td>申请提交时间：<input name="searchStartDate" class="easyui-datetimebox" editable="false" style="width: 100px;" /></td>
					<td>至：<input name="searchEndDate" class="easyui-datetimebox" editable="false" style="width: 100px;" />&nbsp;
						<a href="javascript:void(0);" class="easyui-linkbutton" id="searchbtn">搜索</a>
						<a href="javascript:void(0);" class="easyui-linkbutton" id="cleanSearch">取消</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_list_content" title="提请撤销暂予监外执行"
			style="height: 400px;"
			data-options="singleSelect:true,fit:true,rownumbers:true,collapsible:true,striped:true,toolbar:'#toolbar',loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/specialArea/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80">编号</th>
					<th data-options="field:'culpritName',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">姓名</th>
					<th data-options="field:'groupName',width:100,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">司法所</th>
					<th data-options="field:'area',width:120,align:'center'"
						editor="text">申请进入区域</th>
					<th data-options="field:'applyDate',width:120,align:'center',sortable:true"
						editor="text">申请提交时间</th>
					<!-- <th data-options="field:'dicBlankFlagKey',width:200,align:'center',formatter:formatStatusKey"
						editor="{type:'validatebox',options:{required:true}}">是否作废</th> -->
					<th data-options="field:'activityName',width:100,align:'center'"
						editor="text">审批状态</th>
				 	<th data-options="field:'_opt',width:200,formatter:formatOper,align:'center'">操作</th>  

				</tr>
			</thead>
		</table>
	</div>
	<div id="toolbar" style="display: none;">
		<a onclick="open_layer('新增申请','${ctx}/dailymgr/specialArea/form');" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" id="addbtn">新增</a>
		<a onclick="deleteFun();"  href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" id="editbtn">删除</a>
		<a onclick="$('#lay').layout('expand', 'north');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>  
	</div>
	<div id="pingyi" class="easyui-dialog" title="上传评议表" style="width:400px;height:200px;background:#c4d8ed"   
        data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true"> 
        <table style="margin-left:30px;margin-top:10px">
        	<tr height=30>
        		<td align=right>正在修改:</td>
        		<td>第1条</td>
        	</tr>
        	<tr height=30>
        		<td align=right>评议表:</td>
        		<td></td>
        	</tr>
        	<tr height=30>
        		<td align=right><span style="color:red">*</span>上传:</td>
        		<td><input type="file"/></td>
        	</tr>
        </table>
         <div align="center" padding="20px 30px 40px 50px">
         <p colspan="4" > 
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="">上传</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick=" $('#pingyi').dialog('close');">取消</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  </p>
    </div>
	</div>  
</body>
<script type="text/javascript">

//删除资源
function deleteFun() {
	var arr = $('#t_list_content').datagrid('getSelections');
	if (arr.length <= 0) {
		$.messager.show({
			title : '提示信息!',
			msg : '至少选择一行记录进行删除!'
		});
	} else {
		$.messager.confirm('提示信息', '确认删除?', function(r) {
			if (r) {
				$.post('${ctx}/dailymgr/specialArea/delete', {
					id : arr[0].id
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



	$(function() {
		$.formatString = function(str) {
			for ( var i = 0; i < arguments.length - 1; i++) {
				str = str.replace("{" + i + "}", arguments[i + 1]);
			}
		return str;
	}
	

	$('#searchbtn').click(
		function() {
			$('#t_list_content').datagrid('load',serializeForm($('#searchForm')));
		});
	//取消按钮
	$('#cleanSearch').click(function(){
		$('#searchForm').get(0).reset(); //清空表单数据 
		$('#t_list_content').datagrid('load', {});
		$('#lay').layout('collapse', 'north');
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
function delHsCode(index) {  
       $('#Hsdata').datagrid('selectRow', index);  
       var row = $('#Hsdata').datagrid('getSelected');  
       if (row.Id != null && row.Id !== undefined)  
       alert(row.Id);  
   }  

function formatOper(val,row,index){  
	var operation=$.formatString('<a href="javascript:detail(\'{0}\');"  title="详细"><span style="color:blue;"><strong><u>详细</u><strong></span></a>', row.id);;
	if(row.activityName==null){
		var operation=operation+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:edit(\'{0}\');"  title="（申请）修改"><span style="color:blue;"><strong><u>（申请）修改</u><strong></span></a>', row.id)
	}
	if(row.hasPermission==1){
		operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="submitAuditOutOfPrison(\''
				+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"><span style="color:blue;"><strong><u>流程处理</u><strong></span></a>';
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		if(row.isEnd==1){
			var url = '${ctx}/flow/queryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="viewProcess(\''+url+'\')"><span style="color:blue;"><strong><u>查看流程</u><strong></span></a>';
		}else{
			var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="viewProcess(\''+url+'\')"><span style="color:blue;"><strong><u>查看流程</u><strong></span></a>';
		}
		
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null && row.hasPermission==1){
		if(row.isEnd==0){
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="stopProcess(\''+row.taskId+'\')"><span style="color:blue;"><strong><u>终止</u><strong></span></a>';
		}
	}
	return operation;
} 

function pingyi(){
	 $('#pingyi').dialog('open');
}


//查看流程图
function viewProcess(url){
	//console.log(url);
	open_layer('进入特定区域执行流程',url);
}
//流程审批
function submitAuditOutOfPrison(taskId,id,auditType,processId){
	open_layer("进入特定区域审核审批","${ctx}/dailymgr/specialArea/specialAreaAudit?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId);
}
//详细
function detail(id){
	var url = '${ctx}/dailymgr/specialArea/detail?id=' + id;
	open_layer('进入特定区域详情',url);
}
//上报修改页面
function edit(id){
	open_layer('进入特定区域（上报/修改）','${ctx}/dailymgr/specialArea/form?id='+id);
}

//上报时打印撤销假释建议书
/* function preSubmit(id){
	var url = '${ctx}/jiangcheng/revokeProbation/preSubmit?id=' + id;
	open_layer('撤销假释建议书',url);
} */


function stopProcess(taskId){
	$.messager.confirm('提示', '确定要终止该流程么?', function(b){  
	      if (b){  
	    	  $.ajax({
	  			type : 'get',
	  			url : "${ctx}/dailymgr/outOfPrison/stopProcess?taskId=" + taskId,
	  			cache : false,
	  			async : false, //同步请求
	  			dataType : 'json',
	  			success : function(result) {
	  				if(result.status==200){
	  					$.messager.show({
							title : '提示信息!',
							msg : result.msg
						});
	  				}else{
	  					$.messager.show({
							title : '提示信息!',
							msg : result.msg
						});
	  				}
	  				$('#t_list_content').datagrid('reload',{});
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


function formatStatusKey(value, row, index){
	var str = '';
	$.ajax({
		type : 'post',
		url : '${ctx}/sys/sysDic/getDicValue?tabName=sf_revoke_probation&columnName=REASON_TYPE_ID&key='+value,
		cache : false,
		async : false, //同步请求
		data : {
			id : value
		},
		dataType : 'json',
		success : function(result) {
			
			if(result!=null){
				str = result.value;
			}
			
		}
	});
	return str;
}

	
	
</script>

</html>
