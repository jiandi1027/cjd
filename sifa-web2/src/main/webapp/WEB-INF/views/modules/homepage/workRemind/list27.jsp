<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!-- 近期需报到提醒(5工作日内) -->
<div class="easyui-layout" id="layOut27" data-options="fit:true">
	<div region="north" border="false" title="查询条件 " style="height:65px;" data-options="collapsed:true">
		<form id="workRemindSearchForm27">
			<table width="100%" class="grid">
				<tr>
					<th class="search-title" width="15%">姓名：</th>
					<td width="25%" ><input name="culpritName" class="easyui-textbox"></td>
					<td class="search-title" style="text-align:left">
						 <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#view_list_workRemind27').datagrid('load' ,$.serializeObject($('#workRemindSearchForm27')));">查询</a> &nbsp;&nbsp; 
						<a href="#" class="easyui-linkbutton"  iconCls="icon-undo" onclick="javascript:$('#layOut27').layout('collapse','north');$('#workRemindSearchForm27').form('clear');$('#view_list_workRemind27').datagrid('load', {});">取消</a></div>
					</td>
				</tr>
			</table>
		</form>
	</div> 
	<div region="center" border="false">
		<table class="easyui-datagrid" id="view_list_workRemind27" title="待办事项列表"
			data-options="singleSelect:true,fit:true,rownumbers:true,toolbar:[{text:'查询',iconCls:'icon-search',handler:function(){$('#layOut27').layout('expand','north');}}],fitColumns:true,collapsible:true,striped:true,
			pagination:true,pageSize: 15,pageList:[5,10,15,20,50],loadMsg: '数据正在加载,请耐心的等待...' ,url:'${ctx}/homepage/workRemind/toViewList?key=${key}&groupId=${groupId}',method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-workRemind-chuli').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
				   $('.organization-easyui-workRemind-info').linkbutton({text:'报到记录',plain:true,iconCls:'fi-info icon-blue'}); 
				   }">
				  
			<thead>
			<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'culpritName',width:'15%',align:'center'">姓名</th>
					<th data-options="field:'groupName',width:'20%',align:'center'">所属单位</th>
					<th data-options="field:'nextShouldReportDateStartDate',width:'18%',align:'center',sortable:true" >下一次报到日期</th>
					<th data-options="field:'taskDate',width:'20%',align:'center',sortable:true" >记录生成时间</th>
					<th data-options="field:'action',width:'25%',align:'center'" formatter="formatterAct">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
	<div id="detail27"></div>
	<div id="audit27"></div>
<script >
function formatterAct(val,row,index){
	var space = '&nbsp;';
	var operation='<a href="javascript:void(0);" class="organization-easyui-workRemind-info" onclick="detailWorkRemind(\''+row.culpritId+'\')"></a>'+space;
	return operation;
}
//查看详情
 function detailWorkRemind(culpritId){ 
	 $('#detail27').dialog({
	        title : '报到记录',
	        iconCls:'fi-info icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        resizable:true,
	        maximizable:true,
	        modal:true,
	        href : '${ctx}/dailymgr/dailyReport/dailyReportList?culpritId=' + culpritId,
	        buttons : [ {
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	            	 $('#detail27').dialog('close');
	            }
	        }] 
	    });	
}

//处理
 function auditWorkRemind(id,dicType){ 
	 $('#audit27').dialog({
	        title : '处理',
	        iconCls:'fi-clipboard-pencil icon-blue',
	        width : 500,
	        height : 150,
	        resizable:true,
	        maximizable:true,
	        modal:true,
	        href : '${ctx}/homepage/workRemind/auditWorkRemind?id='+id+'&dicType'+dicType,
	        buttons : [ {
				text:'提交',
	            iconCls:'icon-save',
				handler:function(){
					$('#auditWorkRemindBtn').click();
				}
			},{
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	            	 $('#audit27').dialog('close');
	            }
	        }] 
	    });	
	 
	 
}



</script>