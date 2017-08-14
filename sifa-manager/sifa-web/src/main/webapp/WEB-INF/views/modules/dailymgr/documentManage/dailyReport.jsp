<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>日常报到</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>


<body class="easyui-layout" id="lay">
	<div region="north" border="false" noheader="true" collapsed="false" title="搜索条件"
		style="height: 35px; overflow: hidden;background:#E0ECFF;"align="left" >
		<form id="searchForm">
			<table>				
				<tr>
					<td>社区矫正人员:</td>
					<td>${culprit.name }</td>
					<td>&nbsp;&nbsp;时间
					</td>
					<td>
						<input name="searchStartDate"   class="easyui-datetimebox"
						value=""/>&nbsp;
					</td>
					<td>至</td>
					<td>
						<input name="searchEndDate" class="easyui-datetimebox"
						editable="false"  />
					</td>
					<td colspan="2"><a
						href="javascript:void(0);" class="easyui-linkbutton"
						id="searchbtn">搜索</a><a href="javascript:void(0);"
						class="easyui-linkbutton" onclick="cleanSearch();">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_list_content" title="日常报到"
			data-options="singleSelect:true,noheader:true,collapsible:true,striped:true,toolbar:toolbar,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/dailyReport/dailyReportList',method:'post'">
			<!--,queryParams: {culpritId: '${culprit.id }'}-->
		<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80">编号</th>
					<th data-options="field:'reportDate',width:110,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">报到日期</th>
					<th data-options="field:'dicTypeKey',width:150,align:'center',formatter:function(value,rowData,rowIndex){
						return sy.getDicValue('SF_DAILY_REPORT','DIC_TYPE_KEY',value,'')}"
						editor="text" editor="{type:'numberbox',options:{required:true}}">报到方式</th>
					<th data-options="field:'dicOnscheduleKey',width:250,align:'center',formatter:isTime" 
						editor="text">是否按时</th>
					<th
						data-options="field:'dicReportStatusKey',width:200,align:'center',sortable:true"
						editor="{type:'validatebox',options:{required:true}}">报到结果</th>
					<th data-options="field:'jlr',width:200,align:'center'"
						editor="text">记录人</th>
					<th data-options="field:'updater',width:250,align:'center'"
						editor="text">处理人</th>
					<th data-options="field:'reportStatus',width:150,align:'center'"
						editor="text">处理结果</th>
				 <th data-options="field:'_opt',width:200,formatter:formatOper">操作</th>  

				</tr>
			</thead>
		</table>
	</div>
	<div id="add" title="新增记录" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 400px;padding:10px; top:250px; left:650px;background:#c4d8ed">
		<form id="addForm" action="" method="post">
			<input type="hidden" name="culpritId" value="${culprit.id }" />
			<table>
				<tr>
					<td>报到日期:</td>
					<td>
					<input type="text" name="reportDate" id="reportDate" required=true 
							class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
				</tr>
				<tr>
					<td>报到方式</td>
					<td><select id="dicTypeKey" data-options="panelHeight:'auto'" class="easyui-combobox" name="dicTypeKey" style="width:200px;">   
						    <option value="50202">其他</option>   
						    <option value="50203">电话</option>   

						</select>  
					</td>
				</tr>
				<tr>
					<td>是否按时</td>
					<td><select id="dicOnscheduleKey" data-options="panelHeight:'auto'" class="easyui-combobox" name="dicOnscheduleKey" style="width:200px;">   
						    <option value="1">是</option>   
						    <option value="0">否</option>   

						</select>  
					</td>
				</tr>
				<tr>
					<td>备注:</td>
					<td><input type="text" name="note" multiline="true"
						class="easyui-textbox" required=true 
						data-options="width:260,height:100"
						 value="" /></td>
				</tr>
				<tr align="center">
					<td colspan="2"><a id="btn3" class="easyui-linkbutton">确定</a>
						<a href="javascript:void(0)" id="btn2" class="easyui-linkbutton" onclick=" $('#add').dialog('close');">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
var toolbar = [{
	text : '新增',
	iconCls : 'icon-add',
	handler : function() {
		$('#add').dialog({
			title : '新增'
		});
		//$('#myform').find('input[name!=sex]').val("");
		//$('#add').get(0).reset();
		$('#addForm').form('clear');
		$('#add').dialog('open');
		//open_layer('报到','${ctx}/dailymgr/dailyReport/add');

	}

}];
	/**
	 *  提交表单方法
	 */
	$('#btn3').click(function() {
		if ($('#addform').form('validate')) {
			$.ajax({
				type : 'post',
				url : '${ctx}/dailymgr/dailyReport/saveDoc',
				cache : false,
				data : $('#addForm').serialize(),
				dataType : 'json',
				success : function(result) {
					//1 关闭窗口
					$('#add').dialog('close');
					//2刷新datagrid 
					$('#t_list_content').datagrid('reload');
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
	});
	$(function() {

		$('#t_list_content').datagrid({
			fit : true
		});
		/**
		 * 关闭窗口方法
		 */
		$('#btn2').click(function() {
			$('#mydialog').dialog('close');
		});

		$('#searchbtn').click(
				function() {
					$('#t_list_content').datagrid('load',
							serializeForm($('#searchForm')));
				});

		function cleanSearch() {
			$('#t_list_content').datagrid('load', {});
			$('#searchForm').form().find('input').val('');
		}

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

	function isTime(value,rowData,rowIndex){
		if(value=='1'){
			return '按时';
		}else {
			return '未按时'
		}
	}
	function delHsCode(index) {  
        $('#Hsdata').datagrid('selectRow', index);  
        var row = $('#Hsdata').datagrid('getSelected');  
        if (row.Id != null && row.Id !== undefined)  
        alert(row.Id);  
    }  
	function formatOper(val,row,index){  
		var operation='<a href="javascript:void(0);" onclick="detail(\''+row.id+'\')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;详情</a>';
		
		
		
	    return operation;
	} 
	function detail(id){
		var url = '${ctx}/dailymgr/dailyReport/get?id=' + id;
		open_layer('报到详情',url);
		
	}

	function askLeaveDetail(id){
		var url = '${ctx}/dailymgr/askLeave/detail?id=' + id;
		open_layer('请假流程详情',url);
		
	}
	
	
	
	function open_layer(title,url){
		
		var index = layer.open({
			type: 2,
			title: title,
			content: url
		});
		layer.full(index);
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

</html>
