<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>监管等级</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>


<body class="easyui-layout" id="lay">
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_list_content" style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,striped:true,fitColumns:true,fit:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/gradeChange/list?culpritId='+'${culprit.id }',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80">编号</th>
					<th data-options="field:'culpritName',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">社区矫正人员</th>
					<th data-options="field:'sysGroupName',width:100,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">司法所</th>
					<th data-options="field:'dicOldMonitorGradeKey',width:120,align:'center',sortable:true"
						editor="text">原监管等级</th>
					<th data-options="field:'dicMonitorGradeKey',width:200,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">新监管等级</th>
					<th data-options="field:'created',width:200,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">变更时间</th>
					<th data-options="field:'printStatus',width:200,align:'center',formatter:function(value,row,index){
							if (value==1){return '已打印';}else{return '未打印';}}"
						editor="{type:'validatebox',options:{required:true}}">打印状态</th>
					<th data-options="field:'blankFlag',width:200,align:'center',formatter:function(value,row,index){
							if (value==2){return '已作废';}else{return '未作废';}}"
						editor="{type:'validatebox',options:{required:true}}">是否作废</th>
					<th data-options="field:'activityName',width:100,align:'center'"
						editor="text">审批状态</th>
				 	<th data-options="field:'_opt',width:200,formatter:formatOperate,align:'center'">操作</th>  
				</tr>
			</thead>
		</table>
	</div>
	 <div id="stop" title="流程作废" modal=true draggable=false
		class="easyui-dialog" closed=true style="padding:10px; top:250px; left:650px;background:#c4d8ed">
		<form id="stopForm" action="" method="post">
			<!-- <input type="hidden" name="id" value="" /> -->
			<table>		
				<tr>
					<td>作废原因:</td>
					<td><select id="flagReasonId" class="easyui-combobox" name="flagReasonId" style="width:200px;">   
    						<option value="0">录入错误</option>   
    						<option value="1">其他</option>     
						</select> 
					</td>
				</tr>
				<tr>
                    <td>相关材料:</td>
                    <td><input type="file" name="flagPathName" id="flagPathName" value="上传"></input></td>
                </tr>
                <tr rowspan="5">
                    <td><span class="c-red">*</span>作废具体原因：</td>
							<td colspan="5"><input type="text" name="flagDetailReason"  multiline=true 
								class="f1 easyui-textbox" value=""  style="width:300px;height:80px;"/></td>
                </tr>
				<tr align="center">
					<td colspan="2"><a href="javascript:void(0)" id="btn1" class="easyui-linkbutton" onclick="stopProcess()">确定</a>
						<a  id="btn2" class="easyui-linkbutton">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
//全局id
var gradeChangeId;
//删除资源
function deleteFun() {
	//flag = 'delete';
	var arr = $('#t_list_content').datagrid('getSelections');
	if (arr.length <= 0) {
		$.messager.show({
			title : '提示信息!',
			msg : '至少选择一行记录进行删除!'
		});
	} else {
		$.messager.confirm('提示信息', '确认删除?', function(r) {
			if (r) {
				$.post('${ctx}/jiangcheng/revokeProbation/delete', {
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
function formatOperate(val,row,index){  
	var operation=$.formatString('<a href="javascript:detail(\'{0}\');"  title="详细"><span style="color:blue;"><strong><u>详细</u><strong></span></a>', row.id);;
	if(row.activityName==null){
		//var operation=operation+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:submitProbationDetail(\'{0}\');"  title="上报"><span style="color:blue;"><strong><u>上报</u><strong></span></a>', row.id)
		//var operation=operation+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:preSubmit(\'{0}\');"  title="上报"><span style="color:blue;"><strong><u>上报</u><strong></span></a>', row.id)
		//var operation=operation+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:edit(\'{0}\');"  title="上报"><span style="color:blue;"><strong><u>上报/修改</u><strong></span></a>', row.id)
	}
	if(row.hasPermission==1){
		if(row.auditType=='firstReport'){
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="submitAuditGradeChange(\''
			+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"><span style="color:blue;"><strong><u>上报</u><strong></span></a>';
		}else{
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="submitAuditGradeChange(\''
			+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"><span style="color:blue;"><strong><u>处理</u><strong></span></a>';
		}
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
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="openStop(\''+row.id+'\')"><span style="color:blue;"><strong><u>作废</u><strong></span></a>';
		}
	}
	return operation;
}

$.formatString = function(str) {
		for ( var i = 0; i < arguments.length - 1; i++) {
			str = str.replace("{" + i + "}", arguments[i + 1]);
		}
	return str;
}
function openStop(id){
	gradeChangeId=id;
	$.messager.confirm('提示', '是否将这条记录作废？作废后不能恢复？', function(b){
		$('#stop').dialog('open');
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
//查看流程图
function viewProcess(url){
	//console.log(url);
	open_layer('修改监管等级',url);
}
//详细链接
function detail(id){
	open_layer('修改监管等级','${ctx}/dailymgr/gradeChange/gradeChangeDetail?id='+id);
}
//流程审批
function submitAuditGradeChange(taskId,id,auditType,processId){
	open_layer("修改监管等级审核审批","${ctx}/dailymgr/gradeChange/gradeChangeAudit?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId);
}
//流程作废
function stopProcess(){
	$.messager.confirm('提示', '确定要终止该流程么?', function(b){  
		 var str = $('#stopForm').serialize()
		 str+=('&id='+gradeChangeId);
	      if (b){  
	    	  $.ajax({
	  			type : 'post',
	  			url : "${ctx}/dailymgr/gradeChange/stopProcess",
	  			cache : false,
	  			data : str,
	  			dataType : 'json',
	  			success : function(result) {
	  				if(result.status!=200){
	  					alert(result.msg);
	  				}
	  				$('#stop').dialog('close');
	  				$('#t_list_content').datagrid('reload',{});
	  			}
	  		});
	  		
	      }
	});  
	
}
</script>
