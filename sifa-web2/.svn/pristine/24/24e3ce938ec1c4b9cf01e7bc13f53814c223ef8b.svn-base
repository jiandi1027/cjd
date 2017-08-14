<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>


<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="sysLogSearchForm"
			style="padding-bottom: 10px; padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'"
		style="width: 240px;">
		
			<div class="easyui-layout" data-options="fit:true,border:true">
				<div region="center" border="false">

					<div class="easyui-panel search-form"
						data-options="fit:true,border:false" id="p2"
						style="width: 100%;">

						<table>
							<tr>
								<td class="search-title">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：</td>
								<td>
									<input id="type" class="easyui-combobox" name="dicStatusKey" editable=false 
    					data-options="valueField:'key',panelHeight:'auto',textField:'value',url:'${ctx}/sys/sysDic/getListByTabColumnName?tabName=sys_log&columnName=type&showAll=1'" />
								</td>
							</tr>
							<tr>
								<td class="search-title">操&nbsp;&nbsp;作&nbsp;&nbsp;人：</td>
								<td><input id="creater" class="easyui-textbox"
									name="creater" /></td>
							</tr>
							<tr>
								<td class="search-title">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
								<td><input id="title" class="easyui-textbox"
									name="title" /></td>
							</tr>
							<tr>
								<td class="search-title">IP：</td>
								<td><input name="remoteAddr" class="easyui-textbox" /></td>
							</tr>

						</table>

					</div>
				</div>
				<div data-options="region:'south',border:false"
					style="height: 30px; line-height: 30px; overflow: hidden; text-align: center; background-color: #eee">
					<a href="#" class="easyui-linkbutton" iconCls="icon-search"
						onclick="javascript:$('#sys_log_list').datagrid('load' ,$.serializeObject($('#sysLogSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo"
						onclick="javascript:$('#sysLogSearchForm').form('clear');">清空</a>
				</div>
			</div>
		
	</div>
</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="sys_log_list" title="数据字典列表"  
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,fitColumns:true,pageList:[5,10,15,20,50],url:'${ctx}/sys/sysLog/list',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
					<th data-options="field:'createrCnName',width:80,align:'center'" >操作人</th>
					<th data-options="field:'created',width:100,sortable:true,align:'center'" >操作时间</th>
				<th data-options="field:'type',width:80,align:'center',formatter:function(value,rowData,rowIndex){
				   return sy.getDicValue('sys_log','type',rowData.type,'');
				}" >类型</th>
				<th data-options="field:'title',width:100,align:'center'" >标题</th>
				<th data-options="field:'remoteAddr',width:100,align:'center',sortable:true"  >ip</th>
				<th data-options="field:'params',width:150,align:'center'" >参数</th>
				
			</tr>
		</thead>
	</table>
	</div>
	
	
	

</div>

