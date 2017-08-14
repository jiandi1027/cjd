<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!-- 尚未完成报备 -->
<div class="easyui-layout" id="layOut23" data-options="fit:true">
	<div region="north" border="false" title="查询条件 " style="height:65px;" data-options="collapsed:true">
		<form id="workRemindSearchForm23">
			<table width="100%" class="grid">
				<tr>
					<th class="search-title" width="15%">姓名：</th>
					<td width="25%" ><input name="culpritName" class="easyui-textbox"></td>
					<td class="search-title" style="text-align:left">
						 <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#view_list_workRemind23').datagrid('load' ,$.serializeObject($('#workRemindSearchForm23')));">查询</a> &nbsp;&nbsp; 
						<a href="#" class="easyui-linkbutton"  iconCls="icon-undo" onclick="javascript:$('#layOut23').layout('collapse','north');$('#workRemindSearchForm23').form('clear');$('#view_list_workRemind23').datagrid('load', {});">取消</a></div>
					</td>
				</tr>
			</table>
		</form>
	</div> 
	<div region="center" border="false">
		<table class="easyui-datagrid" id="view_list_workRemind23" title="待办事项列表"
			data-options="singleSelect:true,fit:true,rownumbers:true,toolbar:[{text:'查询',iconCls:'icon-search',handler:function(){$('#layOut23').layout('expand','north');}}],fitColumns:true,collapsible:true,striped:true,
			pagination:true,pageSize: 15,pageList:[5,10,15,20,50],loadMsg: '数据正在加载,请耐心的等待...' ,url:'${ctx}/homepage/workRemind/toViewList?key=${key}&groupId=${groupId}',method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-workRemind-zjsj').linkbutton({text:'证件收缴',plain:true,iconCls:'fi-book icon-blue'});
				   $('.organization-easyui-workRemind-info').linkbutton({text:'详细',plain:true,iconCls:'fi-info icon-blue'}); 
				   }">
				  
			<thead>
			<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'culpritName',width:'23%',align:'center'">姓名</th>
					<th data-options="field:'groupName',width:'25%',align:'center'">所属单位</th>
					<th data-options="field:'taskDate',width:'25%',align:'center',sortable:true" >记录生成时间</th>
					<th data-options="field:'action',width:'25%',align:'center'" formatter="formatterAct">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
	<div id="detail23"></div>
	<div id="audit23"></div>
<script >
function formatterAct(val,row,index){
	var space = '&nbsp;';
	var operation='<a href="javascript:void(0);" class="organization-easyui-workRemind-info" onclick="detailWorkRemind(\''+row.recordId+'\')"></a>';
	<shiro:hasPermission name="homePage/workRemind/sfsAudit">
		operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-workRemind-zjsj" onclick="dealZJ(\''+row.recordId+'\',\''+row.id+'\')"></a>';
	</shiro:hasPermission>
	return operation;
}
//查看详情
 function detailWorkRemind(id){ 
	 $('#detail23').dialog({
	        title : '详细',
	        iconCls:'fi-info icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        resizable:true,
	        maximizable:true,
	        modal:true,
	        href : '${ctx}/inculprit/exitEntryReport/detail?id=' + id,
	        buttons : [ {
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	            	 $('#detail23').dialog('close');
	            }
	        }] 
	    });	
}

//处理
 function dealZJ(recordId,id){ 
	 $('#audit23').dialog({
	        title : '证件收缴',
	        iconCls:'fi-book icon-blue',
	        width : 900,
	        height : 350,
	        resizable:true,
	        maximizable:true,
	        modal:true,
	        onBeforeClose:function(){
	        	 var table=parent.$.modalDialog.handler.find('#addTable');
	        	 table.remove(); 
	         },
	        href : '${ctx}/inculprit/exitEntryReport/form?workRemindFlag=0&id='+recordId,
	        buttons : [ {
				text:'保存',
	            iconCls:'icon-save',
				handler:function(){
					$('#saveExitEntryReportBtn').click();
					 $.ajax({
							type: 'post' ,
							url: '${ctx}/homepage/workRemind/update',
							cache:false ,
							data: {id:id},
							dataType:'json',
							success:function(result){
								$('#audit23').dialog('close');
						   		$('#view_list_workRemind23').datagrid('reload');
						} 
					});
				}
			},{
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	            	 var table=parent.$.modalDialog.handler.find('#addTable');
                	 table.remove(); 
	            	 $('#audit23').dialog('close');
	            }
	        }] 
	    });	
	 
	 
}



</script>