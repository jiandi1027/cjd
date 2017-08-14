<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>警告</title>
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
					<td>姓名：<input name=creater style="width:100px;" />&nbsp;</td>
					<td>申请时间：<input name="searchStartDate" class="easyui-datetimebox" editable="false" style="width: 100px;" /></td>
					<td>至：<input name="searchEndDate" class="easyui-datetimebox" editable="false" style="width: 100px;" />&nbsp;</td>
					<td>短信类型：<input name=culpritName style="width:100px;" />&nbsp;</td>
					<td>发送状态：<input name=culpritName style="width:100px;" />&nbsp;</td>
					<td>
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" id="searchbtn" >查询</a>

					</td>
				</tr>
			</table>
		</form>
	</div>
	<div  region="center" border="false">
		<table class="easyui-datagrid" id="t_list_content" title="历史信息列表"
			style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,striped:true,fit:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/smsCulprit/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'created',width:200,align:'center',sortable:true"
						editor="{type:'numberbox',options:{required:true}}">发起时间</th>
					<th data-options="field:'creater',width:150,align:'center'"
						editor="text" editor="{type:'numberbox',options:{required:true}}">发送人</th>
					<th data-options="field:'culpritId',width:150,align:'center'"
						editor="text" editor="{type:'numberbox',options:{required:true}}">接收人</th>
					<th data-options="field:'invalid',width:150,align:'center'"
						editor="text" editor="{type:'numberbox',options:{required:true}}">短信类型</th>
					<th data-options="field:'smsId',width:500,align:'center'"
						editor="text">内容</th>
					<th data-options="field:'dicStatusKey',width:200,align:'center'"
						editor="text">发送状态</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
<script type="text/javascript">

$('#searchbtn').click(function() {
	$('#t_list_content').datagrid('load', serializeForm($('#searchForm')));
});
$('#add').click(function() {
	open_layer('新增警告','${ctx}/jiangcheng/warning/add');
});
	function formatOper(val,row,index){  
		var operation='<a href="javascript:void(0);" onclick="askLeaveDetail(\''+row.id+'\')">详情</a>';
		if(row.hasPermission==1){
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="submitAuditAskLeave(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">流程处理</a>';
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
		if(row.processInstanceId!='' && row.processInstanceId!=null){
		
			if(row.isEnd==0){
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="stopProcess(\''+row.taskId+'\')">终止</a>';
			}
		}
		
		
	    return operation;
	} 
	function viewProcess(url){
		open_layer('警告流程',url);
	}
	function submitAuditAskLeave(taskId,id,auditType,processId){
		open_layer("警告审核审批","${ctx}/jiangcheng/warning/warningAudit?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId);
	}
	function askLeaveDetail(id){
		var url = '${ctx}/jiangcheng/warning/detail?id=' + id;
		open_layer('警告流程详情',url);
	}
	
	function stopProcess(taskId){
		$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
		      if (b){  
		    	  $.ajax({
		  			type : 'get',
		  			url : "${ctx}/jiangcheng/commend/stopProcess/?taskId=" + taskId,
		  			cache : false,
		  			async : false, //同步请求
		  			dataType : 'json',
		  			success : function(result) {
		  				if(result.status==200){
		  					alert(result.msg);
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

	



</script>

</html>
