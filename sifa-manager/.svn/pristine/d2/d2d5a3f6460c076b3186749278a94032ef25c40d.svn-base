<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>请假管理</title>
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
					<td>&nbsp;&nbsp;请假开始时间
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
		<table class="easyui-datagrid" id="t_list_content" title="请假列表"
			style="height: 400px;"
			data-options="singleSelect:true,noheader:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/askLeave/list',method:'post',queryParams: {
		culpritId: '${culprit.id }'}">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80">编号</th>
					<th data-options="field:'created',width:110,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">请假申请时间</th>
					<th data-options="field:'reason',width:150,align:'center'"
						editor="text" editor="{type:'numberbox',options:{required:true}}">请假理由</th>
					<th data-options="field:'place',width:250,align:'center'"
						editor="text">请假地点</th>
					<th
						data-options="field:'beginDate',width:200,align:'center',sortable:true"
						editor="{type:'validatebox',options:{required:true}}">开始时间</th>
					<th data-options="field:'endDate',width:200,align:'center'"
						editor="text">结束时间</th>
					<th data-options="field:'dicStatusKey',width:250,align:'center',formatter:formatStatusKey"
						editor="text">请假状态</th>
					<th data-options="field:'isOverdue',width:80,align:'center',formatter:fomatIsOverdue"
						editor="text">是否逾期</th>
				 <th data-options="field:'_opt',width:200,formatter:formatOper">操作</th>  

				</tr>
			</thead>
		</table>
	</div>

</body>
<script type="text/javascript">

	/**
	 *  提交表单方法
	 */
	$('#btn1').click(function() {
		if ($('#myform').form('validate')) {
			$.ajax({
				type : 'post',
				url : '${ctx}/dailymgr/askLeave/save',
				cache : false,
				data : $('#myform').serialize(),
				dataType : 'json',
				success : function(result) {
					//1 关闭窗口
					$('#mydialog').dialog('close');
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
		var operation='<a href="javascript:void(0);" onclick="askLeaveDetail(\''+row.id+'\')">&nbsp;&nbsp;&nbsp;详情</a>';
		
		
		
	    return operation;
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
