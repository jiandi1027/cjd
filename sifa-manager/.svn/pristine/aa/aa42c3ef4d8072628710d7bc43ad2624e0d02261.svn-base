<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel"  style="height:50px;padding:5px; align:left" >
		<form id="searchForm_thinkReport">
			<table>				
				<tr>
					<td>社区矫正人员：</td>
					<td><b>${culprit.name }</b></</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;汇报日期：</td>
					<td>
						<input name="searchStartDate"   class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"value=""/>&nbsp;
					</td>
					<td>至</td>
					<td>
						<input name="searchEndDate"  class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
						editable="false"  />
					</td>
					<td colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="searchbtn_thinkReport">查询</a>
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-undo'"  id="cleanBtn_thinkReport">重置</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="easyui-panel" style="height:90%;padding:5px;" title="思想汇报列表">
		<table class="easyui-datagrid" id="thinkReport_list_content" style="height:100%;"
			data-options="singleSelect:true,noheader:true,rownumbers:true,collapsible:true,toolbar:'#toolbarThinkReport',striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/thinkReport/list?culpritId=${culprit.id }',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详细',plain:true,iconCls:'fi-info icon-blue'}); 
                        $('.organization-easyui-linkbutton-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-fi-x').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'reportDate',width:'20%',align:'center'">汇报日期</th>	
					<th data-options="field:'dicReportTypeKey',width:'25%',formatter:function(value,rowData,rowIndex){
						return sy.getDicValue('SF_THINK_REPORT','DIC_REPORT_TYPE_KEY',value,'')},align:'center'">汇报方式</th>
					<th data-options="field:'dicReportStatusKey',width:'25%',formatter:function(value,rowData,rowIndex){
						return sy.getDicValue('SF_THINK_REPORT','DIC_REPORT_STATUS_KEY',value,'')},align:'center'">汇报状态</th>
					<th data-options="field:'_opt',width:'28%',formatter:formatOper,align:'center'">操作</th>  
				</tr>
			</thead>
		</table>
	</div>
	<%-- <div id="addThinkReport" title="新增思想汇报" modal=true draggable=false resizable=true
	        maximizable=true class="easyui-dialog" closed=true style="width:600px;padding:5px;">
		<form id="addThinkReportForm" action="" method="post">
		<input name="id" value="" type="hidden"/>
			<table >
				<tr>
                    <td width="15%" style="text-align:right"><span class="c-red">*</span>汇报方式：</td>
					<td width="35%"><input id="dicReportTypeKey" name="dicReportTypeKey" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_THINK_REPORT&columnName=DIC_REPORT_TYPE_KEY&parentKey=14000',panelHeight:'auto'" editable="false" 
    				required=true missingMessage="汇报方式不能为空!" style="width:173px;" >
					</td>
                    <td width="15%" style="text-align:right"><span class="c-red">*</span>汇报状态：</td>
					<td width="35%"><input id="dicReportStatusKey" name="dicReportStatusKey" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_THINK_REPORT&columnName=DIC_REPORT_STATUS_KEY&parentKey=36000',panelHeight:'auto'" editable="false" 
    				required=true missingMessage="汇报状态不能为空!" style="width:173px;" ></td>
				<tr>
					<td style="text-align:right"><span class="c-red">*</span>汇报日期：</td>
					<td><input type="text" name="reportDate" id="reportDate"  required=true missingMessage="汇报日期不能为空!" editable="false" 
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
               		<td style="text-align:right"><span class="c-red">*</span>考核人：</td>
					<td ><input type="text" name="rewardspunishmentManager" id="rewardspunishmentManager" required=true missingMessage="考核人不能为空!"
								class="f1 easyui-textbox"/></td>
                </tr>
                <tr>
                    <td style="text-align:right">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
                    <td colspan="3" align="left">
                    <textArea id="note" name="note" class="easyui-validatebox" style="width:80%;height:100px;overflow:hidden;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200"></textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
                    </td>
                </tr>
                <tr align="center">
					<td colspan="4">
						<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" id="saveBtn" onclick="thinkReportSave();">保存</a>
		  					&nbsp;&nbsp;&nbsp;&nbsp;
		  				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-refresh'" id="clearBtn" onclick="$('#addThinkReportForm').form('clear');">清空</a>
		  					&nbsp;&nbsp;&nbsp;&nbsp;
		    			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'" id="closeBtn"  onclick="$('#addThinkReportForm').form('clear');$('#addThinkReport').dialog('close');">关闭</a>
				</tr>
			</table>
		</form>
	</div> --%>
	
	<!-- <div id="toolbarThinkReport" style="display: none;">
	        <a onclick="addThinkReport();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
	</div> -->
	<div id="win"></div>
	
	<div id="thinkReportDialog" title="详情" modal=true  resizable=true data-options="iconCls:'fi-info icon-blue'"
	        maximizable=true class="easyui-dialog" closed=true style="width:500px;padding:5px;">
		<form id="thinkReportForm" action="" method="post">
            <table width="100%" class="grid">
            	<tr>
					<th width="30%">汇报方式：</th>
					<td width="70%" ><span id="dicReportTypeKey"></span></td>
			     <tr>
			     	<th>汇报状态：</th>
					<td><span id="dicReportStatusKey"></span></td>
			     </tr> 
			     <tr>  
					<th>汇报日期：</th>
					<td><span id="reportDate"></span></td>
				</tr>
			</table>    
		</form>
		 <div align="center">
         	<p colspan="4"> 
		     	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#thinkReportForm').form('clear');$('#thinkReportDialog').dialog('close');">关闭</a>
		  	</p>
    	</div> 	
	</div>
	
	
	
<script type="text/javascript">
	//新增思想汇报
	function addThinkReport(){
		$('#dicReportTypeKey').attr("readOnly",false);
    	$('#dicReportStatusKey').attr("readOnly",false);
    	$('#reportDate').attr("readOnly",false);
    	$('#rewardspunishmentManager').attr("readOnly",false);
    	$('#note').attr("readOnly",false);
    	$('#saveBtn').linkbutton('enable');
    	$('#clearBtn').linkbutton('enable');
		$('#addThinkReportForm').form('clear');
		$('#addThinkReport').dialog('open');
	}

	
	//保存
	function thinkReportSave(){
		if ($('#addThinkReportForm').form('validate')) {
			$.ajax({
				type : 'post',
				url : '${ctx}/dailymgr/thinkReport/save?culpritId=${culprit.id }',
				cache : false,
				data : $('#addThinkReportForm').serialize(),
				dataType : 'json',
				success : function(result) {
					//1 关闭窗口
					$('#addThinkReport').dialog('close');
					//2刷新datagrid 
					$('#thinkReport_list_content').datagrid('reload');
					//3 提示信息
					$.messager.show({
						title : result.status == 200 ? "ok" : "fail",
						msg : result.msg
					});
				},
				error : function(result) {
					$.meesager.show({
						title : result.status == 200 ? "ok" : "fail",
						msg : result.msg
					});
				}
			});
		} else {
			$.messager.show({
				title : '提示信息!',
				msg : '数据验证不通过,不能保存!'
			});
		}
	}
	
	
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
	
	

	$(function() {
		$('#searchbtn_thinkReport').click(function() {
			$('#thinkReport_list_content').datagrid('load',serializeForm($('#searchForm_thinkReport')));
		});
		$('#cleanBtn_thinkReport').click(function() {
			$('#thinkReport_list_content').datagrid('load', {});
			$('#searchForm_thinkReport').form().find('input').val('');
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

	function formatRole(value, row, index) {
		var str = '';
		$.ajax({
			type : 'get',
			url : '${ctx}/sys/sysRole/findById?id=' + value,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			success : function(result) {
				str = result.name;
			}
		});
		return str;

	}
	
	function delHsCode(index) {  
        $('#Hsdata').datagrid('selectRow', index);  
        var row = $('#Hsdata').datagrid('getSelected');  
        if (row.Id != null && row.Id !== undefined)  
        alert(row.Id);  
    }  
	function formatOper(val,row,index){  
		var space = '&nbsp;';
    	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="thinkDetail(\''+index+'\')">详细</a>'+space; 
    	/* operation+='<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" onclick="thinkUpdate(\''+index+'\')">修改</a>'+space;
    	operation+='<a href="javascript:void(0);" class="organization-easyui-linkbutton-fi-x" onclick="thinkDelete(\''+index+'\')">删除</a>'; */
    	return operation;
	} 
	
	//详细
	function thinkDetail(index){
		$('#thinkReport_list_content').datagrid('selectRow',index); 
		var arr = $('#thinkReport_list_content').datagrid('getSelections');
	 	$('#thinkReportForm').form('clear')
	 	$('#dicReportTypeKey').html(sy.getDicValue('SF_THINK_REPORT','DIC_REPORT_TYPE_KEY',arr[0].dicReportTypeKey,''));
    	$('#dicReportStatusKey').html(sy.getDicValue('SF_THINK_REPORT','DIC_REPORT_STATUS_KEY',arr[0].dicReportStatusKey,''));
    	$('#reportDate').html(arr[0].reportDate);

	 	
	 	$('#thinkReportDialog').dialog('open');
	 	$('#thinkReport_list_content').datagrid('unselectAll'); 
	}
	//修改
	function thinkUpdate(index){ 
		$('#dicReportTypeKey').attr("readOnly",false);
    	$('#dicReportStatusKey').attr("readOnly",false);
    	$('#reportDate').attr("readOnly",false);
    	$('#rewardspunishmentManager').attr("readOnly",false);
    	$('#note').attr("readOnly",false);
    	$('#saveBtn').linkbutton('enable');
    	$('#clearBtn').linkbutton('enable');
		
    	$('#thinkReport_list_content').datagrid('selectRow',index); 
		var arr = $('#thinkReport_list_content').datagrid('getSelections');
	 	$('#addThinkReport').dialog({
				title : '修改'
			});
	 	
	 	$('#addThinkReportForm').form('clear')
	 	$('#addThinkReportForm').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
				id : arr[0].id,
				dicReportTypeKey : arr[0].dicReportTypeKey,
				dicReportStatusKey : arr[0].dicReportStatusKey,
				reportDate : arr[0].reportDate,
				rewardspunishmentManager : arr[0].rewardspunishmentManager,
				note : arr[0].note
			});
	 	$('#addThinkReport').dialog('open');
	 	$('#thinkReport_list_content').datagrid('unselectAll'); 
	 }
	
	 function thinkDelete(index){
	 	   $.messager.confirm('提示信息', '确认删除?', function(r) {
	 			if (r) {
	 				$.post('${ctx}/dailymgr/thinkReport/delete', {
	 					id : id
	 				}, function(result) {
	 					//1 刷新数据表格 
	 					$('#thinkReport_list_content').datagrid('reload');
	 					$.messager.show({
	 						title : '提示信息!',
	 						msg : '删除成功'
	 					});
	 				});
	 			} else {
	 				return;
	 			}
	 		});
	 	}
	
	
	

	
	
	
   
	
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
</script>

