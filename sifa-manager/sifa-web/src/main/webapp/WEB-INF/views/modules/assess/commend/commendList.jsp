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
					<td>所属司法部门： <select id="groupName" name="groupName"
						class="easyui-combotree" style="width: 80%;"
						data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true">
					</select></td>
					<td>申请时间：<input name=doDate class="easyui-datetimebox" editable="false" style="width: 100px;" /></td>
					<td>至：<input name="endDoDate" class="easyui-datetimebox" editable="false" style="width: 100px;" />&nbsp;</td>
					<td>
						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" id="searchbtn" >查询</a>
						<a href="javascript:void(0);"  id="add" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" ">增加</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_list_content" title="表扬列表"
			data-options="singleSelect:true,collapsible:true,fit:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],url:'${ctx}/jiangcheng/commend/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'culpritName',width:150,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">社区矫正人员</th>
					<th data-options="field:'groupName',width:200,align:'center'"
						editor="text" editor="{type:'numberbox',options:{required:true}}">司法所</th>
					<th data-options="field:'reason',width:300,align:'center'"
						editor="text" editor="{type:'numberbox',options:{required:true}}">表扬原因</th>
					<th data-options="field:'sponsor',width:230,align:'center'"
						editor="text" editor="{type:'numberbox',options:{required:true}}">提请人</th>
					<th data-options="field:'dicPrintStatusKey',width:150,align:'center'"
						editor="text" editor="{type:'numberbox',options:{required:true}}">打印状态</th>
					<th data-options="field:'invalid',width:200,align:'center'"
						editor="text" editor="{type:'numberbox',options:{required:true}}">是否作废</th>
					<th data-options="field:'activityName',width:150,align:'center'"
						editor="text">审批状态</th>
				 <th data-options="field:'_opt',width:300,align:'center',formatter:formatOper">操作</th>  

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
	open_layer('新增表扬','${ctx}/jiangcheng/commend/add');
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
		open_layer('表扬流程',url);
	}
	function submitAuditAskLeave(taskId,id,auditType,processId){
		open_layer("表扬审核审批","${ctx}/jiangcheng/commend/commendAudit?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId);
	}
	function askLeaveDetail(id){
		var url = '${ctx}/jiangcheng/commend/detail?id=' + id;
		open_layer('表扬流程详情',url);
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
