<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">

	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_list_toBeProcessed" title="待办事项列表"
			style="height: 400px;"
			data-options="singleSelect:true,fit:true,rownumbers:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/todo/toBeProcessed/list',method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-linkbutton-edit').linkbutton({text:'查看',plain:true,iconCls:'fi-magnifying-glass icon-blue'}); }">
				  
			<thead>
				
			<tr>
					<th data-options="field:'id'" hidden="true"></th>
					<th style="width: 57%;" data-options="field:'name',align:'center'"
						editor="text" >提醒事项</th>
					<th style="width: 20%;" data-options="field:'amount',align:'center'"
						editor="text" >事项数量</th>
					 <th style="width: 23%;" data-options="field:'_opt',formatter:formatOper,align:'center'">操作</th>  
			</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">

	function formatOper(val,row,index){ 
		if(row.amount==0){
			var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-info\'">查看</a>';
		    return operation;
		}else{
			var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-info\'" onclick="toView(\''+row.id+'\')">查看</a>';
		    return operation;
		}
		
	} 
	function toView(id){
		 parent.$.modalDialog({
	         title : '查看',
	         iconCls:'fi-magnifying-glass icon-blue',
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         maximizable:true,
	         resizable:true,
	         href : '${ctx}/todo/toBeProcessed/toView?id='+id
	     });
	}
</script>


