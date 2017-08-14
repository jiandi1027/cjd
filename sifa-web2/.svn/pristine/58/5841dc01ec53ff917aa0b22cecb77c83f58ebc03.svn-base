<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div data-options="region:'east',border:true,split:false,title:'流程详情'" style="width: 370px;">
	<table class="easyui-datagrid" style="width:370px;"   
        data-options="singleSelect:true,fit:true,collapsible:true,striped:true,loadMsg:'数据正在加载,请耐心的等待...',
        fitColumns:true,url:'${ctx}/flow/processDetail/instanceDetail?processId=${warning.processInstanceId}',method:'post'">   
    <thead>   
        <tr>   
        	<th data-options="field:'createrCnName',align:'center',width:70">操作人</th> 
            <th data-options="field:'created',align:'center',width:150">操作时间</th>   
            <th data-options="field:'auditName',align:'center',width:100">操作环节</th>   
            <th data-options="field:'dicDecideType',width:100,align:'center',formatter:function(value,rowData,rowIndex){    
			    if(typeof(rowData.dicDecideType) != 'undefined' && rowData.dicDecideType!=''){
			    	 return sy.getDicValue('common_table','audit_result',rowData.dicDecideType,''); 
			    }
			}">意见</th>   
        </tr>   
    </thead>   
</table>  
</div>

