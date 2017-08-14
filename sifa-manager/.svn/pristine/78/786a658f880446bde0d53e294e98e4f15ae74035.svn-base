<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>未转发轨迹查询</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>


<body class="easyui-layout" id="lay">
	<div region="north" border="false" collapsed="true" title="查询条件"
		style="height: 60px; overflow: hidden;" align="left">
		<form id="searchForm">
			<table>
				<tr>
					<td>所属服务器<input name="terminalSn"  style="width: 100px;" /></td>
					<td>终端序号<input name="terminalSn"  style="width: 100px;" /></td>
					<td>手机号<input name="terminalSn"  style="width: 100px;" /></td>
					<td>GPS接收时间<input name="startDate" class="easyui-datetimebox" editable="false" style="width: 100px;" /></td>
					<td>—<input name="endDate" class="easyui-datetimebox" editable="false" style="width: 100px;" /></td>
					<td>数据接收时间<input name="startRcvTime" class="easyui-datetimebox" editable="false" style="width: 100px;" /></td>
					<td>—<input name="endRcvTime" class="easyui-datetimebox" editable="false" style="width: 100px;" /><a href="javascript:void(0);" class="easyui-linkbutton" id="searchbtn" >搜索</a><a href="javascript:void(0);" class="easyui-linkbutton" onclick="cleanSearch();">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_user" title="未转发轨迹列表"
			style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,striped:true,toolbar:toolbar,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/vehicle/terminalStatusNoSend/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80">设备编号</th>
					<th data-options="field:'terminalSn',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">终端序号</th>
					<th data-options="field:'mobileNumber',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">手机号</th>
					<th data-options="field:'serverName',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">所属服务器</th>

					
					<th data-options="field:'lon',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">经度</th>
					<th data-options="field:'lat',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">纬度</th>
					<th data-options="field:'rcvTime',width:80,align:'center',sortable:true"
						editor="{type:'validatebox',options:{required:true}}">数据接收时间</th>
					<th data-options="field:'gpsTime',width:80,align:'center',sortable:true"
						editor="{type:'validatebox',options:{required:true}}">定位时间</th>
					<th data-options="field:'speed',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">速度</th>
					<th data-options="field:'addr',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">详细地址</th>
				</tr>
			</thead>
		</table>
	</div>

</body>
<script type="text/javascript">
	var flag; //undefined 判断新增和修改方法
	var toolbar = [ {
		text : '查询',
		iconCls : 'icon-search',
		handler : function() {
			$('#lay').layout('expand', 'north');
		}
	} ];

	/**
	 *  提交表单方法
	 */
	$('#btn1').click(function() {
		if ($('#myform').form('validate')) {
			$.ajax({
				type : 'post',
				url : '${ctx}/sys/sysUser/save',
				cache : false,
				data : $('#myform').serialize(),
				dataType : 'json',
				success : function(result) {
					//1 关闭窗口
					$('#mydialog').dialog('close');
					//2刷新datagrid 
					$('#t_user').datagrid('reload');
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

		$('#t_user').datagrid({
			fit : true
		});
		/**
		 * 关闭窗口方法
		 */
		$('#btn2').click(function() {
			$('#mydialog').dialog('close');
		});

		$('#searchbtn').click(function() {
			$('#t_user').datagrid('load', serializeForm($('#searchForm')));
		});

		function cleanSearch() {
			$('#t_user').datagrid('load', {});
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
</script>

</html>
