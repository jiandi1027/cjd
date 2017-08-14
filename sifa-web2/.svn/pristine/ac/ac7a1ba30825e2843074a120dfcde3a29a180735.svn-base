<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<form method="post" id="outofFinishPrint">
	<input type="hidden" name="id" value="${outof.id}"/>
    <input type="hidden" name="taskId" value="${outof.taskId}"/>
    <input type="hidden" name="auditType" value="${outof.auditType}"/>
</form>
	
	<table class="easyui-datagrid" id="outof_finish_list_content" 
			style="height:400px" data-options="singleSelect:true,fit:true,collapsible:false,striped:true,fitColumns:true,rownumbers:true">
			<thead>
				<tr>
					<th data-options="field:'studyDate',width:'50%',align:'center'">文书名称</th>
				 	<th data-options="field:'_opt',width:'29%',align:'center'">操作</th>
				 	<th data-options="field:'_opt1',width:'21%',align:'center'">是否打印</th>  
				</tr>
			</thead>
			<tbody>   
		        <tr>  
 					<td>社区服刑人员居住地变更审批表</td>
	           		<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="domicileChange_print('${outof.id}')"><strong>打印</strong></a></td>
		        	<td><span style="color:red;" name="isPrint" id="isPrint"><c:if test="${outof.isPrint==1 }">已打印</c:if></span></td>
		        </tr>
		    </tbody>   
		</table>
	<div id="outofPrint"></div>
	<div id="outInform"></div>
	<div style="text-align: center;display: none;">
	<a id="outof_inform_btn" class="easyui-linkbutton" >流程结束</a>
    </div>
<script type="text/javascript">

///打印治安管理处罚建议书
function domicileChange_print(id) {
	var url = '${ctx}/endcorrect/outof/print?&id='+id ;
	 $('#outofPrint').dialog({ 
		 title: '打印社区服刑人员居住地变更审批表',
	        iconCls:'fi-print icon-blue',
		    width: 800,    
		    height:600,    
		    href: url,    
		    modal: true,
	        resizable : true,
	        maximizable:true, 
		    buttons :[{
				text:'打印',
	            iconCls:'fi-print icon-blue',
				handler:function(){
					$('#outofPrintBtn').click();
				}
			},{
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#outofPrint').dialog('close');
				}
			}]  
		}); 
		 
	$('#outofPrint').window('center');
	$.ajax({
		type : 'post',
		url : '${ctx}/endcorrect/outof/updateFinshInfo?&id=' + id + '&isPrint=1',
		dataType : 'json',
		cache : false,
		async : false, //同步请求
		success : function(result) {
			$('#isPrint').html('已打印');
		},
		error : function(result) {
			parent.$.messager.alert('错误', '打印错误', 'error') ;
		}
	}); 
}

$('#outof_inform_btn').click(function() {
	$('#outofFinishPrint').form('submit');
});

$('#outofFinishPrint').form({
	url : "${ctx}/endcorrect/outof/submitOutOfAudit",
	onSubmit : function()
	{
		progressLoad();
		var isValid = $(this).form('validate');
		if (!isValid) {
			progressClose();
		}
		return isValid;
	},
	success : function(data) {
		var data=JSON.parse(data);
		progressClose();
		$.messager.show({
			title : '提示信息!',
			msg : data.msg
		});
		
		parent.$.modalDialog.openner_dataGrid.datagrid('reload');
		parent.$.modalDialog.handler.dialog('close');
	},
	error : function(data) {
		parent.$.messager.alert('错误', data.msg, 'error');
	}
});



</script>

