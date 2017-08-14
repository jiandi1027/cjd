<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>集中点验</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
.texts{
	text-decoration:underline;
}
</style>
</head>


<body class="easyui-layout" id="lay">
	<div region="north" border="false" collapsed="false" title="搜索条件"
		style="height: 75px; overflow: hidden;">
		<form id="searchForm">
			<table>
				<tr>
					<td>被抽查部门：<select id="sysGroupId" name="groupId" class="easyui-combotree" style="width: 80%;"
    				data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true"></select></td>
					<td>抽查时间:<input id="searchStartDate" name="searchStartDate" class="easyui-datetimebox" data-options="showSeconds:true" editable="false" style="width:100px;"/>&nbsp;</td>
					<td>&nbsp;至&nbsp;<input id="searchEndDate" name="searchEndDate" class="easyui-datetimebox" data-options="showSeconds:true" editable="false" style="width:100px;"/>&nbsp;</td>
					<td colspan="2"><a href="javascript:void(0);" class="easyui-linkbutton" id="searchbtn">搜索</a>
					<a href="javascript:void(0);" class="easyui-linkbutton" onclick="cleanSearch();">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div region="center" border="false">
		<div id="toolbar" style="height:auto">
			<a id="tbAdd" href="#" class="easyui-linkbutton" style="float: left;" iconCls="icon-add" plain="true"><span style="color: black;">新增</span></a>
			<div class="datagrid-btn-separator"></div>
			<a href="#" class="easyui-linkbutton" plain="true"><span style="color: black;">&nbsp</span></a>
		</div>
		
		<table class="easyui-datagrid" id="t_list_content" title="审前调查列表"
			style="height: 400px;" 
			data-options="singleSelect:false,collapsible:true,striped:true,toolbar:'#toolbar',loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/inspection/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80">编号</th>
					<th data-options="field:'groupsStr',width:100,align:'center'" editor="text">被抽查司法所</th>
					<th data-options="field:'checkStartTime',width:100,align:'center',formatter:Common.formatDate2" editor="text" >抽查开始时间</th>
					<th data-options="field:'checkEndTime',width:100,align:'center',formatter:Common.formatDate2" editor="text" >抽查结束时间</th>
					<th data-options="field:'groupName',width:100,align:'center',formatter:function(value,rowDate,rowIndex){
					if(rowDate.sysGroup !=null){
					return rowDate.sysGroup.name;
					}
					}" editor="text" >抽查部门</th>
				 <th data-options="field:'_opt',width:250,formatter:formatOper">操作</th>  
				</tr>
			</thead>
		</table>
	</div>

	
</body>
<script type="text/javascript">
	var levelNo = "${sysGroup.levelNo}";
	var groupId = "${sysGroup.id}";
	//取消搜索
	function cleanSearch() {
		$('#t_list_content').datagrid('load', {});
		$('#searchForm').form().find('input').val('');
	}
	
	/* toolbar工具栏方法 	*/
	$('#tbAdd').click(function(){
		open_layer('新增集中点验','${ctx}/dailymgr/inspection/add');
	});
	
	function formatOper(val,row,index){
		var operation='<a href="javascript:void(0);" onclick="inspectionDetail(\''+row.id+'\')"><span style="color:blue;">详情</span></a>';
		if (levelNo == 2) {
			var flag = false;
			var groupStr = row.groupidsStr.split(",");
			for (var i = 0; i < groupStr.length; i++) {
				if(groupId == groupStr[i]) {
					flag = true;
				}
			}
			if (flag) {
				if (Common.formatDate(row.checkEndTime)) {
					operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="inspectionDeal(\''+row.id+'\')"><span style="color:blue;">处理</span></a>';
				}
			}
		}

	    return operation;
	} 
	
	function inspectionDetail(id){
		var url = '${ctx}/dailymgr/inspection/detail?id=' + id;
		open_layer('集中点验详情',url);
	}
	function inspectionDeal(id){
		var url = '${ctx}/dailymgr/inspection/deal?id=' + id;
		open_layer('集中点验处理',url);
	}
	
	$(function() {
		//
		$('#t_list_content').datagrid({
			fit : true
		});
		
		//搜索
		$('#searchbtn').click(function() {
			$('#t_list_content').datagrid('load', serializeForm($('#searchForm')));
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

	//？？？
	function delHsCode(index) {  
        $('#Hsdata').datagrid('selectRow', index);  
        var row = $('#Hsdata').datagrid('getSelected');  
        //if (row.Id != null && row.Id !== undefined)  
        //alert(row.Id);  
    }
	
	function open_layer(title,url){
		
		var index = layer.open({
			type: 2,
			title: title,
			content: url
		});
		layer.full(index);
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
	    },
		formatDate2: function (value) {
	        if (value == null || value == '') {
	            return '';
	        }
	        var dt;
	        if (value instanceof Date) {
	            dt = value;
	        } else {
	            dt = new Date(value);
	        }
	        dt = new Date(dt.format("yyyy-MM-dd hh:mm"));
	        
	        return dt.format("yyyy-MM-dd hh:mm"); //扩展的Date的format方法(上述插件实现)
	    }
	}
	
	function checkDate(bDate)// 日期比较函数
	{
		var standard = new Date();
		bDate=bDate.substring(0,10);
		var temp =bDate.split("-");
		return (Number(temp[0]) == Number(standard.getFullYear())) && (Number(temp[1]) == Number(standard.getMonth()+1)) && (Number(temp[2]) == Number(standard.getDate())); 
	}
	
</script>

</html>
