<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel"  style="height:50px;padding:5px; align:left" >
		<form id="searchForm_askLeave">
			<table>				
				<tr>
					<td>社区矫正人员：</td>
					<td><b>${culprit.name }</b></</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申请时间：</td>
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
	<div class="easyui-panel" style="height:90%;padding:5px;" title="治安管理处罚列表">
		<table class="easyui-datagrid" id="securityPunishment_list_content" style="height:100%;"
			data-options="singleSelect:true,noheader:true,rownumbers:true,collapsible:true,toolbar:'',striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			fitColumns:true,url:'${ctx}/rewardspunishment/securityPunishment/list?culpritId=${culprit.id }',method:'post',onLoadSuccess:function (data) {
                       $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
                    }">
			<thead>
				<tr>
				<th data-options="field:'id',checkbox:true">编号</th>
				<th data-options="field:'created',width:'20%',align:'center',sortable:true,formatter:Common.formatDate" editor="text" >申请提交时间</th>
				<th data-options="field:'reasonTypeId',width:'48%',align:'center',formatter:function(value,rowData,rowIndex){    
    if(typeof(rowData.reasonTypeId) != 'undefined' && rowData.reasonTypeId!=''){
    	 return sy.getDicValue('sf_security_punishment','reason_type_id',rowData.reasonTypeId,''); 
    }}">违规违纪原因</th> 
				<th data-options="field:'_opt',width:'30%',align:'center',formatter:formatOper">操作</th> 
				
			</tr>
			</thead>
		</table>
	</div>
	
	<div id="securityPunishmentDialog" title="详情" modal=true  resizable=true data-options="iconCls:'fi-info icon-blue'"
	        maximizable=true class="easyui-dialog" closed=true style="width:800px;padding:5px;">
		<form id="warningForm" action="" method="post">
              <table width="100%" class="grid">
                <tr>
		        	<th width="20%">违规违纪原因：</th>
					<td><span id="reasonTypeId"></span></td>
                </tr>
                <tr>
                	<th>结案报告：</th>
                	<td><span id="endCasePathName"></span></td>
                </tr>
                <tr>
                	<th>证据材料：</th>
					<td><span id="notePathName"></span></td>
                </tr>
                <tr>
                	<th>简要违纪情况:</th>
					<td><textArea id="detailInfo"  readonly="readonly" 
						style="width: 80%;height:100px;overflow:auto;resize:none;border: 0 none;" ></textArea>
					</td>
                </tr>
                <tr>
                	<th>处理依据：</th>
					<td><textArea id="reason" readonly="readonly" 
						style="width: 80%;height:100px;overflow:auto;resize:none;border: 0 none;" ></textArea>
					</td>
                </tr>
            </table>
		</form>
		 <div align="center">
         	<p colspan="4"> 
		     	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'"  id="securityPunishmentPrint1">打印治安管理处罚建议书</a>
		     	&nbsp;&nbsp;&nbsp;&nbsp;
         		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'"  id="securityPunishmentPrint2">打印提请治安管理处罚审核表</a>
		     	&nbsp;&nbsp;&nbsp;&nbsp;
		     	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#securityPunishmentDialog').dialog('close');">关闭</a>
		  	</p>
    	</div> 	
	</div>
	
	<div id="securityPunishmentPrintDialog"></div>
	
<script type="text/javascript">
	var id='';
	var processInstanceId='';
	$(function() {

	
	});

	
	function formatOper(val,row,index){  
		var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" onclick="securityPunishmentDetail(\''+index+'\')">详情</a>';
	    return operation;
	} 
	
	
	function securityPunishmentDetail(index){
		$('#securityPunishment_list_content').datagrid('selectRow',index); 
		var arr = $('#securityPunishment_list_content').datagrid('getSelections');
		var reasonTypeId=sy.getDicValue('sf_security_punishment','reason_type_id',arr[0].reasonTypeId,'');
		$('#reasonTypeId').html(reasonTypeId);
	 	$('#endCasePathName').html(arr[0].endCasePathName);
	 	$('#notePathName').html(arr[0].notePathName); 
	 	$('#detailInfo').val(arr[0].detailInfo); 
	 	$('#reason').val(arr[0].reason); 
	 	
	 	id=arr[0].id;
	 	processInstanceId=arr[0].processInstanceId;
	 	$('#securityPunishmentDialog').dialog('open');
	 	$('#securityPunishment_list_content').datagrid('unselectAll');
	 	
		
	}
	//timestamp转换date
	var Common = {
	    formatDate: function (value) {
	        if (value == null || value == '') {
	            return '';
	        }
	        var dt;
	        if (value instanceof Date) {
	            dt = value;
	        } else {
	            dt = new Date(value);
	        }
	        return dt.format("yyyy-MM-dd"); //扩展的Date的format方法(上述插件实现)
	    }
	}
	

	$('#securityPunishmentPrint2').click(function (){
		var url = '${ctx}/rewardspunishment/securityPunishment/print?id='+id+'&type=2&processInstanceId='+processInstanceId;
		$('#securityPunishmentPrintDialog').dialog({
		    title: '打印提请治安管理处罚审核表',
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
					$('#securityPunishmentPrintDialog').dialog('close');
				}
			}]
		});
		//$('#securityPunishmentPrint').window('center');
	});

	$('#securityPunishmentPrint1').click(function (){
		var url = '${ctx}/rewardspunishment/securityPunishment/print?id='+id+'&type=1&processInstanceId='+processInstanceId;
		$('#securityPunishmentPrintDialog').dialog({
		    title: '打印治安管理处罚建议书',
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
					$('#securityPunishmentPrintDialog').dialog('close');
				}
			}]
		});
		//$('#securityPunishmentPrint').window('center');
	});
	
	
	
</script>
