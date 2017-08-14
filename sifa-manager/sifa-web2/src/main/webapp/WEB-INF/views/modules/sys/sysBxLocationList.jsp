<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<style>
.tab_line {
    height: 21px;
    padding-left: 3px;
}
</style>

<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'east',border:true,split:false,title:'搜索'" style="width: 290px;">
		<div class="easyui-layout" data-options="fit:true,border:false">
		    <div data-options="region:'north',border:false">
	        <form id="sysBxLocationSearchForm" style="padding-bottom: 10px;padding-top: 10px;">
				<table>
					<tr>
						<td width="35%" align="center">手机号码:</td>
						<td><input id="telnos" name="telnos" class="easyui-textbox" data-options="prompt:'(可以用英文格式下的,来分隔号码)',multiline:true" title="aaa"  style="width: 140px;height: 100px;" /></td>
					</tr>
				</table>
			</form>
			</div>
			<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="bxLocationSearchBtn" iconCls="icon-search" >搜索</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="bxLocationCleanBtn" iconCls="icon-undo" onclick="javascript:$('#sysBxLocationSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="sysBxLocation_list" title="北向定位状态查询列表" 
			data-options="singleSelect:false,fit:true,collapsible:true,striped:true,loadMsg: '查询请求已发出，正在查询中,请耐心的等待...' ,
			fitColumns:true,rownumbers:true,url:'${ctx}/sys/bxLocation/list',method:'post'">
		<thead>
			<tr> 
				<th data-options="field:'telno',width:100,align:'center'" >手机号码</th>
				<th data-options="field:'resultCode',width:100,align:'center',formatter:function(value,rowData,rowIndex){
				    if(rowData.resultCode == 0){
				    	return '成功';
				    }
				    else return '失败';
				}" >查询结果</th>
				<th data-options="field:'activeStatus',width:100,align:'center',formatter:function(value,rowData,rowIndex){
				    if(rowData.activeStatus == 1){
				    	return '开机';
				    }
				    else if(rowData.activeStatus == 0){
				    	return '关机';
				    }
				    else return '其他';
				}" >开关机状态</th>
				<th data-options="field:'accountStatus',width:100,align:'center',formatter:function(value,rowData,rowIndex){
				    if(rowData.accountStatus == 0){
				    	return '正常';
				    }
				    else return '停机';
				}" >用户状态</th>
				<th data-options="field:'forwardStatus',width:100,align:'center',formatter:function(value,rowData,rowIndex){
				    if(rowData.forwardStatus == 1){
				    	return '呼转';
				    }
				    else return '无呼转';
				}" >呼转状态</th>
				<th data-options="field:'forwardNumber',width:200,align:'center'" >呼转号码</th>
			</tr>
		</thead>
		</table>
	</div>
</div>
<script type="text/javascript">

$(function() {
});

$('#bxLocationSearchBtn').click(function() {
	var telnos = $('#telnos').val().trim();
	var telnostr = telnos.split(',');
	if (telnos.trim() == '' || telnos ==null) {
		$.messager.show({
			title : "提示",
			msg : "请输入查询号码"
		});
		return;
	}
	for(var i =0; i<telnostr.length;i++){
		if(!(/^1(3|4|5|7|8)\d{9}$/.test(telnostr[i].trim()))){ 
			$.messager.show({
				title : "提示",
				msg : "\"" + telnostr[i].trim() + "\"该号码输入有误,请重新填写"
			});
	        return; 
	    } 
	}
	
	$('#sysBxLocation_list').datagrid('load', $.serializeObject($('#sysBxLocationSearchForm')));
});

function cleanSearch() {
	$('#sysBxLocation_list').datagrid('load', {});
	$('#sysBxLocationSearchForm').form().find('input').val('');
}

function formatRole(value, row, index){
	var str = '';
	if(value!=''){
		$.ajax({
			type : 'get',
			url : '${ctx}/sys/sysRole/findById?id=' + value,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				 /* alert(XMLHttpRequest.status);
				 alert(XMLHttpRequest.readyState);
				 alert(textStatus); */
			},
			success : function(result) {
				if(result!=null && result!=''){
					str = result.name;
				}
			}
		});
	}
	return str;
}
</script>
</html>
