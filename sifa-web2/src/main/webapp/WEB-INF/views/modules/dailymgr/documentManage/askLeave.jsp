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
						<input name="searchStartDate"   class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"value=""/>&nbsp;
					</td>
					<td>至</td>
					<td>
						<input name="searchEndDate"  class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
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
	<div class="easyui-panel" style="height:90%;padding:5px;" title="请假列表">
		<table class="easyui-datagrid" id="askLeave_list_content" style="height:100%;"
			data-options="singleSelect:true,noheader:true,rownumbers:true,collapsible:true,toolbar:'#toolbarDailyReport',striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/askLeave/list?culpritId=${culprit.id }',method:'post',onLoadSuccess:function (data) {
                       $('.easyui-linkbutton-detail').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'created',width:'10%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">请假申请时间</th>
					<th data-options="field:'reason',width:'15%',align:'center'"
						 editor="{type:'numberbox',options:{required:true}}">请假理由</th>
					<th data-options="field:'place',width:'10%',align:'center'">请假目的地</th>
					<th
						data-options="field:'beginDate',width:'10%',align:'center',sortable:true,formatter:Common.formatDate"
						editor="{type:'validatebox',options:{required:true}}">开始时间</th>
					<th data-options="field:'endDate',width:'10%',align:'center',formatter:Common.formatDate">结束时间</th>
					<th data-options="field:'dicStatusKey',width:'10%',align:'center',formatter:function(value,rowData,rowIndex){    
						    if(typeof(rowData.dicStatusKey) != 'undefined' && rowData.dicStatusKey!=''){
						    	 return sy.getDicValue('sf_askleave','dic_status_key',rowData.dicStatusKey,''); 
						    }
						}">请假状态</th>
					<th data-options="field:'isOverdue',width:'10%',align:'center',formatter:fomatIsOverdue">是否逾期</th>
				 <th data-options="field:'_opt',width:'23%',formatter:formatOper,align:'center'">操作</th>  

				</tr>
			</thead>
		</table>
	</div>
	<div id="askLeaveDialog" title="详情" modal=true  resizable=true data-options="iconCls:'fi-info icon-blue'"
	        maximizable=true class="easyui-dialog" closed=true style="width:800px;">
		<div class="easyui-panel" title="请假信息" style="width: 100%; padding: 5px;">
		<form id="askLeaveForm" action="" method="post">
            <table width="100%" class="grid">
			<tr>
				<th width="15%">申请日期：</th>
				<td width="20%"><span id="doDate"></span></td>
				<th width="15%">外出目的地：</th>
				<td width="20%"><span id="place"></span>${askLeave.place }</td>
				<th width="15%">经手人：</th>
				<td width="15%"><span id="approvePerson"></span>${askLeave.approvePerson }</td>
			</tr>
			<tr>
				<th>请假开始时间：</th>
				<td><span id="beginDate"></span></td>
				<th>请假截止时间：</th>
				<td><span id="endDate"></span></td>
				<th>请假理由：</th>
				<td><span id="reason"></span></td>
			</tr>
			<tr>
				<th>活动范围：</th>
				<td colspan="5"><span id="activeArea"></span></td>
			</tr>
		</table>    
		</form>
		</div>
		<div class="easyui-panel" title="被访问者基本信息" style="width: 100%; padding: 5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="15%">被访问者姓名：</th>
				<td width="20%"><span id="askName"></span></td>
				<th width="15%">与矫正人关系：</th>
				<td width="20%"><span id="relation"></span></td>
				<th width="15%">职业及单位：</th>
				<td width="15%"><span id="job"></span></td>
			</tr>
			<tr>
				<th>政治面貌：</th>
				<td><span id="dicPoliticStatusKey"></span></td>
				<th>家庭住址：</th>
				<td colspan="3"><span id="askAddress"></span></td>
			</tr>
		</table>
	</div>
		 <div align="center">
         	<p colspan="4"> 
         		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'"  id="askLeavePrint">打印社区服刑人员外出证明</a>
		     	&nbsp;&nbsp;&nbsp;&nbsp;
		     	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#askLeaveForm').form('clear');$('#askLeaveDialog').dialog('close');">关闭</a>
		  	</p>
    	</div> 	
	</div>
	
	
	<div id="askLeavePrintDialog"></div>
	
	
<script type="text/javascript">
	var id='';
	var processInstanceId='';
	$(function() {

		$('#searchbtn_askLeave').click(function() {
			$('#askLeave_list_content').datagrid('load',serializeForm($('#searchForm_askLeave')));
		});
		$('#cleanBtn_askLeave').click(function() {
			$('#askLeave_list_content').datagrid('load', {});
			$('#searchForm_askLeave').form().find('input').val('');
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
	});

	
	function formatOper(val,row,index){  
		var operation='<a href="javascript:void(0);" class="easyui-linkbutton-detail" onclick="askLeaveDetail(\''+index+'\')">详情</a>';
	    return operation;
	} 

	//详细
	function askLeaveDetail(index){
		$('#askLeave_list_content').datagrid('selectRow',index); 
		var arr = $('#askLeave_list_content').datagrid('getSelections');
	 	$('#askLeaveForm').form('clear');
	 	$('#doDate').html(Common.formatDate(arr[0].doDate));
	 	$('#place').html(arr[0].place);
	 	$('#approvePerson').html(arr[0].approvePerson);
	 	$('#beginDate').html(Common.formatDate(arr[0].beginDate));
	 	$('#endDate').html(Common.formatDate(arr[0].endDate));
	 	$('#reason').html(arr[0].reason);
	 	$('#activeArea').html(arr[0].activeArea);
	 	$('#askName').html(arr[0].askName);
	 	$('#relation').html(arr[0].relation);
	 	$('#job').html(arr[0].job);
	 	$('#dicPoliticStatusKey').html(arr[0].dicPoliticStatusKey);
	 	$('#askAddress').html(arr[0].askAddress);
	 	id=arr[0].id;
	 	processInstanceId=arr[0].processInstanceId;
	 	$('#askLeaveDialog').dialog('open');
	 	$('#askLeave_list_content').datagrid('unselectAll'); 
	}

	 
	$('#askLeavePrint').click(function (){
		var url = '${ctx}/dailymgr/askLeave/print?id='+id+'&processInstanceId='+processInstanceId;
		$('#askLeavePrintDialog').dialog({
		    title: '打印社区服刑人员外出证明',
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
					$('#askLeavePrintBtn1').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#askLeavePrintDialog').dialog('close');
				}
			}]
		});
		//$('#askLeavePrint').window('center');
	});
	 
	
	
   
	
	function formatStatusKey(value, row, index){
		var str = '';
		$.ajax({
			type : 'post',
			url : '${ctx}/sys/sysDic/getDicValue?tabName=sf_askleave&columnName=dic_status_key&key='+value,
			cache : false,
			async : false, //同步请求
			data : {
				id : value
			},
			dataType : 'json',
			success : function(result) {
				
				if(result!=null){
					str = result.value;
				}
				
			}
		});
		return str;
		
	}
	function fomatIsOverdue(value,row,index){
		if(value==1){
			return '是';
		}else{
			return '否';
		}
	}
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
	
	
</script>

