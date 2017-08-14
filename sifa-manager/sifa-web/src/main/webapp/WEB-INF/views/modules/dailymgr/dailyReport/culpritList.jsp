<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>日常报到</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>


<body class="easyui-layout" id="lay">
	<div region="north" border="false" collapsed="true" title="搜索条件"
		style="height: 100px; overflow: hidden;" align="center">
		<form id="searchForm">
			<table width="100%">
				<tr>
					<td width="15%" align="right">所属组织
					</td>
					<td>
						<select id="sysGroupId" name="groupName" class="easyui-combotree" style="width: 80%;"
    data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true">
</select>
						
					</td>
					<td width="15%" align="right">姓名</td>
					<td>
						<input name="culpritName" class="easyui-textbox"
						 style="width: 80%;" />
					</td>
				</tr>
				
				<tr>
					<td width="15%" align="right">开始时间
					</td>
					<td>
						<input name="searchStartDate" style="width: 80%;"  class="easyui-datetimebox"
						value=""/>&nbsp;
					</td>
					<td width="15%" align="right">至</td>
					<td>
						<input name="searchEndDate" class="easyui-datetimebox"
						editable="false" style="width: 80%;"  />
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
		<table class="easyui-datagrid" id="t_list_content" title="日常报到列表"
			style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,striped:true,toolbar:toolbar,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/dailyReport/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'culpritName',width:80,align:'center'"
						editor="text">姓名</th>
					<th data-options="field:'dicOldMonitorGradeKey',width:100,align:'center'"
						editor="text">严管等级</th>
					<th data-options="field:'nextShouldReportDate',width:100,align:'center'"
						editor="text">下一次报到日期</th>
					<th data-options="field:'dicOnscheduleKey',width:100,formatter:function(value,rowData,rowIndex){if(value=='1'){return '按时';}　else {return '未按时'}},align:'center'" editor="text"
						>最近报到结果</th>
				 <th data-options="field:'_opt',width:250,formatter:formatOper,align:'center'">操作</th>  

				</tr>
			</thead>
		</table>
	</div>

	
	<div id="dd"></div>  

</body>
<script type="text/javascript">
	var flag; //undefined 判断新增和修改方法
	var toolbar = [ {
		text : '报到',
		iconCls : 'icon-add',
		handler : function() {
			flag = 'add';
			//$('#mydialog').dialog({
			//	title : '新增用户'
			//});
			//$('#myform').find('input[name!=sex]').val("");
			//$('#myform').get(0).reset();
			//$('#myform').form('clear');
			//$('#mydialog').dialog('open');
			open_layer('报到','${ctx}/dailymgr/dailyReport/add');

		}

	}, '-', {
		text : '查询',
		iconCls : 'icon-search',
		handler : function() {
			$('#lay').layout('expand', 'north');
		}
	}];


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
		var operation='<a href="javascript:void(0);" onclick="detail(\''+row.culpritId+'\')">报到记录</a>';



		
		
	    return operation;
	} 

	function add(id){
		open_layer("新增报到","${ctx}/dailymgr/dailyReport/add?id=" + id);
	}

	function detail(id){
		var url = '${ctx}/dailymgr/dailyReport/dailyReportList?culpritId=' + id;
		open_layer('报到记录',url);
		
	}

	
	
	function open_layer(title,url){
		
		var index = layer.open({
			type: 2,
			title: title,
			content: url
		});
		layer.full(index);
	}
	  //加载树  
    $('#comboTree').combotree({        
        url:'${ctx}/sys/sysGroup/loadGroupTree',  
        onClick:function(node){  
            //单用户单击一个节点的时候，触发  
            $("input[name='culprit.groupId']").val(node.id);  
        },  
        checkbox:false,  
        multiple:false  
    });  
	

</script>

</html>
