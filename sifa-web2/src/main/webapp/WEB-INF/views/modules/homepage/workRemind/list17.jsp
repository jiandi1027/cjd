<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" id="layOut17" data-options="fit:true">
	<div region="north" border="false" title="查询条件 " style="height:65px;" data-options="collapsed:true">
		<form id="workRemindSearchForm17">
			<table width="100%" class="grid">
				<tr>
					<th class="search-title" width="15%">姓名：</th>
					<td width="25%" ><input name="culpritName" class="easyui-textbox"></td>
					<td class="search-title" style="text-align:left">
						 <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#view_list_workRemind17').datagrid('load' ,$.serializeObject($('#workRemindSearchForm17')));">查询</a> &nbsp;&nbsp; 
						<a href="#" class="easyui-linkbutton"  iconCls="icon-undo" onclick="javascript:$('#layOut17').layout('collapse','north');$('#workRemindSearchForm17').form('clear');$('#view_list_workRemind17').datagrid('load', {});">取消</a></div>
					</td>
				</tr>
			</table>
		</form>
	</div> 
	<div region="center" border="false">
		<table class="easyui-datagrid" id="view_list_workRemind17" title="待办事项列表"
			data-options="singleSelect:true,fit:true,rownumbers:true,toolbar:[{text:'查询',iconCls:'icon-search',handler:function(){$('#layOut17').layout('expand','north');}}],fitColumns:true,collapsible:true,striped:true,
			pagination:true,pageSize: 15,pageList:[5,10,15,20,50],loadMsg: '数据正在加载,请耐心的等待...' ,url:'${ctx}/homepage/workRemind/toViewList?key=${key}&groupId=${groupId}',method:'post',onLoadSuccess:function (data) {
				 $('.organization-easyui-workRemind-chuli').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
				   $('.organization-easyui-overAlarm-info').linkbutton({text:'越界记录',plain:true,iconCls:'fi-list-number icon-blue'}); 
				   }">
				  
			<thead>
			<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'culpritName',width:'18%',align:'center'">姓名</th>
					<th data-options="field:'groupName',width:'20%',align:'center'">所属单位</th>
					<th data-options="field:'taskDate',width:'25%',align:'center',sortable:true" >最新越界时间</th>
					<th data-options="field:'action',width:'35%',align:'center'" formatter="formatterAct">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
	<div id="detail17"></div>
	<div id="audit17"></div>
<script >
function formatterAct(val,row,index){
	var space = '&nbsp;';
	var operation='<a href="javascript:void(0);" class="organization-easyui-overAlarm-info" onclick="detailWorkRemind(\''+row.culpritId+'\')"></a>';
	<shiro:hasPermission name="homePage/workRemind/sfsAudit">
		operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-workRemind-chuli" onclick="auditWorkRemind(\''+row.recordId+'\')"></a>';
	</shiro:hasPermission>
	return operation;
}
//查看详情
 function detailWorkRemind(culpritId){ 
	 $('#detail17').dialog({
	        title : '历史越界记录',
	        iconCls:'fi-list-number icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-200,
	        resizable:true,
	        maximizable:true,
	        modal:true,
	        href : '${ctx}/monitoring/overAlarm/hislist?culpritId=' + culpritId,
	        buttons : [ {
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	            	 $('#detail17').dialog('close');
	            }
	        }] 
	    });	
}

//处理
 function auditWorkRemind(id){ 
	 $('#audit17').dialog({
	        title : '越界警告处理',
	        iconCls:'fi-clipboard-pencil icon-blue',
	        width : 500,
	        height : 320,
	        resizable:true,
	        maximizable:true,
	        modal:true,
	        href : '${ctx}/monitoring/overAlarm/dispose?id='+id,
	        buttons : [ {
				text:'提交',
	            iconCls:'icon-save',
				handler:function(){
					$('#overAlarmformAdd').form('submit');
					$.ajax({
						type: 'post' ,
						url: '${ctx}/homepage/workRemind/update',
						cache:false ,
						data: {id:id},
						dataType:'json',
						success:function(result){
							$('#audit17').dialog('close');
					   		$('#view_list_workRemind17').datagrid('reload');
					} 
				});
				}
			},{
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	            	 $('#audit17').dialog('close');
	            }
	        }] 
	    });	
	 
	 
}



</script>