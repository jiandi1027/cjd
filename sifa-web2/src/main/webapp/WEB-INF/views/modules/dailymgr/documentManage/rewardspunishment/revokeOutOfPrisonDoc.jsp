<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel"  style="height:50px;padding:5px; align:left" >
		<form id="searchForm_askLeave">
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
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="searchbtn_askLeave">查询</a>
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-undo'"  id="cleanBtn_askLeave">重置</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="easyui-panel" style="height:90%;padding:5px;" title="提请撤销暂予监外执行列表">
		<table class="easyui-datagrid" id="revokeOutOfPrison_list_content" style="height:100%;"
			data-options="singleSelect:true,noheader:true,rownumbers:true,collapsible:true,toolbar:'',striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			fitColumns:true,url:'${ctx}/rewardspunishment/revokeOutOfPrison/list?culpritId=${culprit.id }',method:'post',onLoadSuccess:function (data) {
                       $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'created',width:'20%',align:'center',sortable:true"
						editor="text">创建时间</th>
					<th data-options="field:'updated',width:'20%',align:'center',sortable:true"
						editor="text">更新时间</th>
					<th data-options="field:'dicReasonTypeKey',width:'28%',align:'center',formatter:function(value,rowData,rowIndex){    
				return sy.getDicValue('revokeOutOfPrison','dicReasonTypeKey',rowData.dicReasonTypeKey,'');}"
						editor="{type:'validatebox',options:{required:true}}">违纪原因</th>
					<th data-options="field:'_opt',width:'30%',align:'center',formatter:formatOper">操作</th> 
			</tr>
			</thead>
		</table>
	</div>
	
	
	<div id="revokeOutOfPrisonDialog" title="详情" modal=true  resizable=true data-options="iconCls:'fi-info icon-blue'"
	        maximizable=true class="easyui-dialog" closed=true style="width:800px;padding:5px;">
		<form id="revokeOutOfPrisonForm" action="" method="post">
			<input name="id"   type="hidden"/>
             <table width="100%" class="grid">
                <tr rowspan="5">
					<th width="10%">违纪原因：</th>
					<td><span id="dicReasonTypeKey3"></span></td>
                </tr>
                <tr>
                    <th>结案报告：</th>
                    <td><span id="endCasePath3"></span></td>
                </tr>
                <tr>
                    <th>证据材料：</th>
                    <td><span id="notePath3"></span></td>
                </tr>
                <tr>
                    <th>简要违纪情况：</th><td><textarea id="detailInfo3" readOnly=true style="width:80%;height:80px;border: 0 none;"></textarea></td>
                </tr>
                <tr>
                    <th>处理依据：</th><td><textarea id="fact3"  readOnly=true style="width:80%;height:80px;border: 0 none;"></textarea></td>
                </tr>
            </table>      
		</form>
		 <div align="center">
         	<p colspan="4"> 
         		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'"  id="revokeOutOfPrisonPrint1">打印《提请撤销暂予监外执行审批表》</a>
		     	&nbsp;&nbsp;&nbsp;&nbsp;
		     	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#revokeOutOfPrisonForm').form('clear');$('#revokeOutOfPrisonDialog').dialog('close');">关闭</a>
		  	</p>
    	</div> 	
	</div>
	
	<div id="revokeOutOfPrisonPrintDialog"></div>
<script type="text/javascript">
	var id='';
	$(function() {

	
	});

	
	function formatOper(val,row,index){  
		var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" onclick="revokeOutOfPrisonDetail(\''+index+'\')">详情</a>';
	    return operation;
	} 
	

	//详细
	function revokeOutOfPrisonDetail(index){
		$('#revokeOutOfPrison_list_content').datagrid('selectRow',index); 
		var arr = $('#revokeOutOfPrison_list_content').datagrid('getSelections');
	 	$('#revokeOutOfPrisonDialog').dialog({
				title : '详情'
			});
	 	
	 	$('#revokeOutOfPrisonForm').form('clear');
	 	var dicReasonTypeKey=sy.getDicValue('revokeOutOfPrison','dicReasonTypeKey',arr[0].dicReasonTypeKey,'');
	 	$('#dicReasonTypeKey3').html(dicReasonTypeKey);
	 	$('#endCasePath3').html(arr[0].endCasePath);
	 	$('#notePath3').html(arr[0].notePath);
	 	$('#detailInfo3').val(arr[0].detailInfo);
	 	$('#fact3').val(arr[0].fact);
	 	id=arr[0].id;
	 	$('#revokeOutOfPrisonDialog').dialog('open');
	 	$('#revokeOutOfPrison_list_content').datagrid('unselectAll'); 
	}

	$('#revokeOutOfPrisonPrint1').click(function (){
		var url = '${ctx}/rewardspunishment/revokeOutOfPrison/printShenhe?id=' + id;
		$('#revokeOutOfPrisonPrintDialog').dialog({
		    title: '打印提请撤销暂予监外执行审核表',
	        iconCls:'fi-print icon-blue',
		    width: 800,    
		    height: 600,    
		    href: url,    
		    modal: true,
	        resizable : true,
	        maximizable:true, 
		    buttons :[{
				text:'打印',
	            iconCls:'fi-print icon-blue',
				handler:function(){
					$('#printRevokeOutOfPrisonTable').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#revokeOutOfPrisonPrintDialog').dialog('close');
				}
			}]
		});
	});
	
	

</script>
