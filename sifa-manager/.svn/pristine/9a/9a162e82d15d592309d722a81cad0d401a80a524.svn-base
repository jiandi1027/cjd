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
	<div class="easyui-panel" style="height:90%;padding:5px;" title="提请撤销缓刑列表">
		<table class="easyui-datagrid" id="revokeProbation_list_content" style="height:100%;"
			data-options="singleSelect:true,noheader:true,rownumbers:true,collapsible:true,toolbar:'',striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			fitColumns:true,url:'${ctx}/rewardspunishment/revokeProbation/list?culpritId=${culprit.id }',method:'post',onLoadSuccess:function (data) {
                       $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'created',width:'20%',align:'center',sortable:true"
						editor="text">创建时间</th>
					<th data-options="field:'updated',width:'20%',align:'center',sortable:true"
						editor="text">更新时间</th>
					<th data-options="field:'reasonTypeId',width:'28%',align:'center',formatter:function(value,rowData,rowIndex){    
				return sy.getDicValue('sf_revoke_probation','REASON_TYPE_ID',rowData.reasonTypeId,'');}"
						editor="{type:'validatebox',options:{required:true}}">违纪原因</th>
					<th data-options="field:'_opt',width:'30%',align:'center',formatter:formatOper">操作</th> 
				</tr>
			</thead>
		</table>
	</div>
	
	
	<div id="revokeProbationDialog" title="详情" modal=true  resizable=true data-options="iconCls:'fi-info icon-blue'"
	        maximizable=true class="easyui-dialog" closed=true style="width:800px;padding:5px;">
		<form id="revokeProbationForm" action="" method="post">
			<input name="id"   type="hidden"/>
            <table width="100%" class="grid">
                <tr rowspan="5">
					<th width="20%">违纪原因：</th>
					<td><span id="reasonTypeId2"></span></td>
                </tr>
                <tr>
                    <th>结案报告：</th>
                    <td><span id="endCasePath2"></span></td>
                </tr>
                <tr>
                    <th>证据材料：</th>
                    <td><span id="notePath2"></span></td>
                </tr>
                <tr>
                    <th>简要违纪情况：</th><td><textarea id="detailInfo2" readOnly=true style="width:80%;height:80px;border: 0 none;"></textarea></td>
                </tr>
                <tr>
                    <th>处理依据：</th><td><textarea id="fact2"  readOnly=true style="width:80%;height:80px;border: 0 none;"></textarea></td>
                </tr>
            </table>   
		</form>
		 <div align="center">
         	<p colspan="4"> 
         		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'"  id="revokeProbationPrint1">打印《撤销缓刑建议书》</a>
		     	&nbsp;&nbsp;&nbsp;&nbsp;
         		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'"  id="revokeProbationPrint2">打印《撤销缓刑审批表》</a>
		     	&nbsp;&nbsp;&nbsp;&nbsp;
		     	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#revokeProbationForm').form('clear');$('#revokeProbationDialog').dialog('close');">关闭</a>
		  	</p>
    	</div> 	
	</div>
	
	<div id="revokeProbationPrintDialog"></div>
	
<script type="text/javascript">
	var id='';
	$(function() {

	
	});

	
	function formatOper(val,row,index){  
		var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" onclick="revokeProbationDetail(\''+index+'\')">详情</a>';
	    return operation;
	} 
	

	function revokeProbationDetail(index){
		$('#revokeProbation_list_content').datagrid('selectRow',index); 
		var arr = $('#revokeProbation_list_content').datagrid('getSelections');
	 	$('#revokeProbationForm').form('clear');
	 	var reasonTypeId=sy.getDicValue('sf_revoke_probation','REASON_TYPE_ID',arr[0].reasonTypeId,'');
	 	$('#reasonTypeId2').html(reasonTypeId);
	 	$('#endCasePath2').html(arr[0].endCasePathName);
	 	$('#notePath2').html(arr[0].notePathName);
	 	$('#detailInfo2').val(arr[0].detailInfo);
	 	$('#fact2').val(arr[0].fact);
	 	
	 	id=arr[0].id
	 	$('#revokeProbationDialog').dialog('open');
	 	$('#revokeProbation_list_content').datagrid('unselectAll'); 
		
	}
	
	$('#revokeProbationPrint1').click(function (){
		var url = '${ctx}/rewardspunishment/revokeProbation/preSubmit?id=' + id+"&detail=2";
		$('#revokeProbationPrintDialog').dialog({
		    title: '打印撤销假释建议书表',
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
					$('#printRevokeProbationBook').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#revokeProbationPrintDialog').dialog('close');
				}
			}]
		});
	});

	$('#revokeProbationPrint2').click(function (){
		var url = '${ctx}/rewardspunishment/revokeProbation/printJianYi?id=' + id;
		$('#revokeProbationPrintDialog').dialog({
		    title: '打印撤销假释审批表',
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
					$('#printRevokeProbationTable').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#revokeProbationPrintDialog').dialog('close');
				}
			}]
		});
	});
	
	
	
	
</script>
