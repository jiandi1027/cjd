<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel"  style="height:50px;padding:5px; align:left" >
		<form id="searchForm_warning">
			<table>				
				<tr>
					<td>社区矫正人员：</td>
					<td><b>${culprit.name }</b></</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;记录时间：</td>
					<td>
						<input name="searchStartDate"   class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"value=""/>&nbsp;
					</td>
					<td>至</td>
					<td>
						<input name="searchEndDate"  class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
						editable="false"  />
					</td>
					<td colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="searchbtn_warning">查询</a>
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-undo'"  id="cleanBtn_warning">重置</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="easyui-panel" style="height:90%;padding:5px;" title="警告列表">
		<table class="easyui-datagrid" id="warning_list_content" style="height:100%;"
			data-options="singleSelect:true,noheader:true,rownumbers:true,collapsible:true,toolbar:'',striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/rewardspunishment/warning/list?culpritId=${culprit.id }',method:'post',onLoadSuccess:function (data) {
                       $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
                    }">
			<thead>
				<tr>
					<th data-options="field:'fact',align:'center',width:'40%'">事实依据</th>
					<th data-options="field:'optTime',align:'center',sortable:true,width:'30%'">记录时间</th>
				 	<th data-options="field:'_opt',align:'center',formatter:formatOper,width:'28%'">操作</th>  
				</tr>
			</thead>
		</table>
	</div>
	
	
	<div id="warningDialog" title="详情" modal=true  resizable=true data-options="iconCls:'fi-info icon-blue'"
	        maximizable=true class="easyui-dialog" closed=true style="width:800px;padding:5px;">
		<form id="warningForm" action="" method="post">
             <table width="100%" class="grid">
             	<tr>
                   <th width="20%">违纪原因：</th>
                   <td width="80%"><span id="dicReasonTypeKey"></span></td>
                 </tr>
                <tr>
                   <th>警告附件：</th>
                   <td><span id="pathName"></span></td>
                </tr>
                <tr>
                   <th>悔过书：</th>
                   <td><span id="repenteancePathName"></span></td>
                </tr> 
                <tr>	
					<th>证据材料附件：</th>
					<td><span id="notePathName"></span></td>
				</tr>
				<tr>
					<th>主要事实：</th>
					<td><textarea id="fact" readOnly=true style="width:90%;height:80px;border: 0 none;"></textarea></td>
				</tr> 
                <tr>
                    <th>处理依据：</th><td><textarea id="legalBasis" readOnly=true style="width:90%;height:80px;border: 0 none;"></textarea></td>
                </tr>
            </table>      
		</form>
		 <div align="center">
         	<p colspan="4"> 
         		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'"  id="warningPrint1">打印社区服刑人员警告审批表</a>
		     	&nbsp;&nbsp;&nbsp;&nbsp;
		     	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'"  id="warningPrint2">打印违反社区矫正规定警告决定书</a>
		     	&nbsp;&nbsp;&nbsp;&nbsp;
		     	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#warningDialog').dialog('close');">关闭</a>
		  	</p>
    	</div> 	
	</div>
	
	<div id="warningPrintDialog"></div>
<script type="text/javascript">
	var id='';
	$(function() {

	
	});

	
	function formatOper(val,row,index){  
		var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" onclick="warningDetail(\''+index+'\')">详情</a>';
	    return operation;
	} 
	

	function warningDetail(index){
		$('#warning_list_content').datagrid('selectRow',index); 
		var arr = $('#warning_list_content').datagrid('getSelections');
		//var dicReasonTypeKey=sy.getDicValue('SF_WARNING_ORAL','DIC_REASON_TYPE_KEY',arr[0].dicReasonTypeKey,'');
		$('#dicReasonTypeKey').html(arr[0].dicReasonTypeKey);
	 	$('#pathName').html(arr[0].pathName);
	 	$('#repenteancePathName').html(arr[0].repenteancePathName); 
	 	$('#notePathName').html(arr[0].notePathName); 
	 	$('#fact').val(arr[0].fact); 
	 	$('#legalBasis').val(arr[0].legalBasis); 
	 	
	 	id=arr[0].id
	 	$('#warningDialog').dialog('open');
	 	$('#warning_list_content').datagrid('unselectAll'); 
	}
	

	$('#warningPrint1').click(function (){
		var url = '${ctx}/rewardspunishment/warning/print?id='+id+'&type=1';
		$('#warningPrintDialog').dialog({
		    title: '打印社区服刑人员警告审批表',
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
					$('#securityPunishmentPrintBtn2').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#warningPrintDialog').dialog('close');
				}
			}]
		});
		//$('#securityPunishmentPrint').window('center');
	});

	$('#warningPrint2').click(function (){
		var url = '${ctx}/rewardspunishment/warning/print?id='+id+'&type=2';
		$('#warningPrintDialog').dialog({
		    title: '违反社区矫正规定警告决定书',
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
					$('#securityPunishmentPrintBtn1').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#warningPrintDialog').dialog('close');
				}
			}]
		});
		//$('#securityPunishmentPrint').window('center');
	});
	
	
	
</script>
