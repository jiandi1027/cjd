<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel"  style="height:50px;padding:5px; align:left" >
		<form id="searchForm_warningOrl">
			<table>				
				<tr>
					<td>社区矫正人员：</td>
					<td><b>${culprit.name }</b></</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;创建时间：</td>
					<td>
						<input name="searchStartDate"   class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"value=""/>&nbsp;
					</td>
					<td>至</td>
					<td>
						<input name="searchEndDate"  class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
						editable="false"  />
					</td>
					<td colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="searchbtn_warningOrl">查询</a>
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-undo'"  id="cleanBtn_warningOrl">重置</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="easyui-panel" style="height:90%;padding:5px;" title="口头警告列表">
		<table class="easyui-datagrid" id="warningOrl_list_content" style="height:100%;"
			data-options="singleSelect:true,noheader:true,rownumbers:true,collapsible:true,toolbar:'',striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/rewardspunishment/verbalWarning/list?culpritId=${culprit.id }',method:'post',onLoadSuccess:function (data) {
                       $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
                    }">
			<thead>
				<tr>
						<th data-options="field:'dicReasonTypeKey',width:'30%',formatter:function(value,rowData,rowIndex){
						return sy.getDicValue('SF_WARNING_ORAL','DIC_REASON_TYPE_KEY',value,'')},align:'center'">违纪原因 </th>
					
						<th data-options="field:'created',width:'30%',align:'center'">创建时间</th>
				 <th data-options="field:'_opt',width:'38',formatter:formatOper,align:'center'">操作</th>  
				</tr>
			</thead>
		</table>
	</div>
	
	
	<div id="warningOrlDialog" title="详情" modal=true  resizable=true data-options="iconCls:'fi-info icon-blue'"
	        maximizable=true class="easyui-dialog" closed=true style="width:800px;padding:5px;">
		<form id="revokeParoleForm" action="" method="post">
			<input name="id"   type="hidden"/>
             <table width="100%" class="grid">
                 <tr>
                    <th width="20%">违纪原因：</th>
					<td><span id="dicReasonTypeKey"></span></td>
                </tr>
                <tr>
                    <th>简要违纪情况：</th><td><textarea id="detailInfo" readOnly=true style="width:90%;height:80px;border: 0 none;"></textarea></td>
                </tr>
            </table>      
		</form>
		 <div align="center">
         	<p colspan="4"> 
		     	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#warningOrlDialog').dialog('close');">关闭</a>
		  	</p>
    	</div> 	
	</div>
<script type="text/javascript">

	$(function() {
		$('#searchbtn_warningOrl').click(function() {
			$('#warningOrl_list_content').datagrid('load',serializeForm($('#searchForm_warningOrl')));
		});
		$('#cleanBtn_warningOrl').click(function() {
			$('#warningOrl_list_content').datagrid('load', {});
			$('#searchForm_warningOrl').form().find('input').val('');
		});
	
	});


	//js方法：序列化表单 			
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
	
	function formatOper(val,row,index){  
		var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" onclick="warningOralDetail(\''+index+'\')">详情</a>';
	    return operation;
	} 
	

	function warningOralDetail(index){
		$('#warningOrl_list_content').datagrid('selectRow',index); 
		var arr = $('#warningOrl_list_content').datagrid('getSelections');
		var dicReasonTypeKey=sy.getDicValue('SF_WARNING_ORAL','DIC_REASON_TYPE_KEY',arr[0].dicReasonTypeKey,'');
	 	$('#dicReasonTypeKey').html(dicReasonTypeKey);
	 	$('#detailInfo').val(arr[0].detailInfo); 
	 	
	 	$('#warningOrlDialog').dialog('open');
	 	$('#warningOrl_list_content').datagrid('unselectAll'); 
		
	}
	
	
</script>
