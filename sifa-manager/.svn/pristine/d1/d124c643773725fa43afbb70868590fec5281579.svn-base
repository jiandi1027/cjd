<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>人员管理</title>
<%@include file="/WEB-INF/views/include/head.jsp" %>
</head>


<body class="easyui-layout" id="lay">
		<div region="north" border="false" collapsed="true" title="搜索条件" style="height: 60px;overflow: hidden;" align="left">
		<form id="searchForm">
			<table>
				<tr>
					<td>单位<input name="parentId" style="width:100px;" />&nbsp;</td>
					<td>姓名<input name="parentId" style="width:100px;" />&nbsp;</td>
					<td>编制类型<input name="groupSeq" class="easyui-datetimebox" editable="false" style="width: 100px;" /></td>
					<td>身份证号<input name="name" class="easyui-datetimebox" editable="false" style="width: 100px;" /><a href="javascript:void(0);" class="easyui-linkbutton" id="searchbtn" >搜索</a><a href="javascript:void(0);" class="easyui-linkbutton" onclick="cleanSearch();">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_list_content" title="人员列表" style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,striped:true,toolbar:toolbar,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/sys/sysPerson/list',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'name',width:80,align:'center'"  editor="{type:'validatebox',options:{required:true}}">姓名</th>
				<th data-options="field:'dicBianzhiKey',width:250,align:'center',formatter:formatBianZhi" editor="text">编制</th>
				<th data-options="field:'sfzh',width:250,align:'center'" editor="text">身份证号</th>
				<th data-options="field:'groupId',width:100,align:'center',formatter:formatGroup" editor="text"  editor="{type:'numberbox',options:{required:true}}">所属单位</th>
				
				<th data-options="field:'mobile',width:80,align:'center',sortable:true"   editor="{type:'validatebox',options:{required:true}}">手机号</th>


			</tr>
		</thead>
	</table>
	</div>
	
	
	<div id="mydialog" title="新增人员" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 500px;">
		<form id="myform" action="" method="post">
			<input type="hidden" name="id" value="" />
			<table>
				<tr>
					<td>姓名:</td>
					<td><input name="name" class="easyui-validatebox"
						
						value="" /></td>
					<td>英文名:</td>
					<td><input type="text" name="ywm"
						class="easyui-validatebox"  value="" /></td>
					
				</tr>
				<tr>
					<td>性别:</td>
					<td><input type="text" name="dicSexKey"
						class="easyui-combobox"
						url="${ctx}/sys/sysDic/findSysDicByTabNameAndColumnName?tabName=common_table&columnName=sex&notNeParentId=0" valueField="value" textField="key"  /></td>
					<td>出生年月:</td>
					<td><input type="text" name="csrq"
						class="easyui-validatebox"  value="" /></td>
					
				</tr>
				<tr>
					<td>编制类型:</td>
					<td><input type="text" name="dicBianzhiKey"
						class="easyui-combobox"
						url="${ctx}/sys/sysDic/findSysDicByTabNameAndColumnName?tabName=sys_person&columnName=bianzhi&notNeParentId=0" valueField="value" textField="key"  /></td>
					<td>身份证号:</td>
					<td><input type="text" name="sfzh"
						class="easyui-validatebox"  value="" /></td>
					
				</tr>
				<tr>
					<td>接收越界短信:</td>
					<td><input type="text" name="isSms"
						class="easyui-combobox"
						url="${ctx}/sys/sysDic/findSysDicByTabNameAndColumnName?tabName=common_table&columnName=yes_no&notNeParentId=0" valueField="value" textField="key"  /></td>
					<td>职务:</td>
					<td><input type="text" name="zw"
						class="easyui-validatebox"  value="" /></td>
					
				</tr>
				<tr>
					<td>单位:</td>
					<td><input type="text" name="groupId"
						class="easyui-validatebox"  /></td>
					<td>民族:</td>
					<td><input type="text" name="mz"
						class="easyui-validatebox"  value="" /></td>
					
				</tr>
				<tr>
					<td>住址:</td>
					<td><input type="text" name="address"
						class="easyui-validatebox"  /></td>
					<td>政治面貌:</td>
					<td><input type="text" name="zzmm"
						class="easyui-validatebox"  value="" /></td>
					
				</tr>
				<tr>
					<td>手机号码:</td>
					<td><input type="text" name="mobile"
						class="easyui-validatebox"  /></td>
					<td>婚姻状况:</td>
					<td><input type="text" name="dicHyzkKey"
						class="easyui-validatebox"  value="" /></td>
					
				</tr>
				<tr>
					<td>工作单位:</td>
					<td><input type="text" name="job"
						class="easyui-validatebox"  /></td>
					<td>参加工作时间:</td>
					<td><input type="text" name="cjgzsj"
						class="easyui-validatebox"  value="" /></td>
					
				</tr>
				<tr>
					<td>电子邮箱:</td>
					<td><input type="text" name="dzyx"
						class="easyui-validatebox"  /></td>
					<td>毕业院校:</td>
					<td><input type="text" name="byyx"
						class="easyui-validatebox"  value="" /></td>
					
				</tr>
				<tr>
					<td>学历:</td>
					<td><input type="text" name="dicQulifKey"
						class="easyui-validatebox"  /></td>
					<td>专业:</td>
					<td><input type="text" name="zy"
						class="easyui-validatebox"  value="" /></td>
					
				</tr>
				
			
				<tr align="center">
					<td colspan="2"><a id="btn1" class="easyui-linkbutton">确定</a>
						<a id="btn2" class="easyui-linkbutton">关闭</a></td>
				</tr>
			</table>
		</form>
	</div>

</body>
<script type="text/javascript">
var flag ;		//undefined 判断新增和修改方法
var toolbar = [ {
	text : '新增',
	iconCls : 'icon-add',
	handler : function() {
		flag = 'add';
		$('#mydialog').dialog({
			title : '新增人员'
		});
		//$('#myform').find('input[name!=sex]').val("");
		$('#myform').get(0).reset();
		//$('#myform').form('clear');
		$('#mydialog').dialog('open');

	}

}, '-', {
	text : '修改',
	iconCls : 'icon-edit',
	handler : function() {
		flag = 'edit';
		var arr = $('#t_list_content').datagrid('getSelections');
		if (arr.length != 1) {
			$.messager.show({
				title : '提示信息!',
				msg : '只能选择一行记录进行修改!'
			});
		}else {
			$('#mydialog').dialog({
				title : '修改人员'
			});
			$('#mydialog').dialog('open'); //打开窗口
			$('#myform').get(0).reset(); //清空表单数据 
			$('#myform').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
				id : arr[0].id,
				name : arr[0].name,
				tname : arr[0].tname,
				password : arr[0].password,
				mobile : arr[0].mobile,
				groupId : arr[0].groupId
			});
		}
	

	}
},  '-', {
	text : '删除',
	iconCls : 'icon-remove',
	handler : function() {
		var arr = $('#t_list_content').datagrid('getSelections');
		if (arr.length <= 0) {
			$.messager.show({
				title : '提示信息!',
				msg : '至少选择一行记录进行删除!'
			});
		} else {

			$.messager.confirm('提示信息', '确认删除?', function(r) {
				if (r) {
					var ids = '';
					for (var i = 0; i < arr.length; i++) {
						if(i==0){
							ids+="ids="+arr[i].id
						}else{
							ids +="&ids="+arr[i].id ;
						}
						
					}
					//ids = ids.substring(0, ids.length - 1);
					$.post('${ctx}/sys/sysPerson/batchDelete', {
						ids : ids
					}, function(result) {
						//1 刷新数据表格 
						$('#t_list_content').datagrid('reload');
						//2 清空idField   
						$('#t_list_content').datagrid('uncheckAll');
						//3 给提示信息 
						$.messager.show({
							title : '提示信息!',
							msg : '操作成功!'
						});
					});
				} else {
					return;
				}
			});
		}
	}
}, '-', {
	text : '查询',
	iconCls : 'icon-search',
	handler : function() {
		$('#lay').layout('expand', 'north');
	}
} ];

/**
 *  提交表单方法
 */
$('#btn1').click(function(){
		if($('#myform').form('validate')){
			$.ajax({
				type: 'post' ,
				url: '${ctx}/sys/sysPerson/save' ,
				cache:false ,
				data:$('#myform').serialize() ,
				dataType:'json' ,
				success:function(result){
					//1 关闭窗口
					$('#mydialog').dialog('close');
					//2刷新datagrid 
					$('#t_list_content').datagrid('reload');
					//3 提示信息
					$.messager.show({
						title:result.status==200?"ok":"fail" , 
						msg:result.msg
					});
				} ,
				error:function(result){
					$.meesager.show({
						title:result.status==200?"ok":"fail" ,  
						msg:result.msg
					});
				}
			});
		} else {
			$.messager.show({
				title:'提示信息!' ,
				msg:'数据验证不通过,不能保存!'
			});
		}
});
$(function(){
	
	
	$('#t_list_content').datagrid({fit: true});
/**
 * 关闭窗口方法
 */
$('#btn2').click(function(){
	$('#mydialog').dialog('close');
});

	
$('#searchbtn').click(function(){
	$('#t_list_content').datagrid('load' ,serializeForm($('#searchForm')));
});

function cleanSearch() {
	$('#t_list_content').datagrid('load', {});
	$('#searchForm').form().find('input').val('');
}

//js方法：序列化表单 			
function serializeForm(form){
	var obj = {};
	$.each(form.serializeArray(),function(index){
		if(obj[this['name']]){
			obj[this['name']] = obj[this['name']] + ','+this['value'];
		} else {
			obj[this['name']] =this['value'];
		}
	});
	return obj;
}
});

function formatBianZhi(value, row, index){
	var str = '';
	$.ajax({
		type : 'get',
		url : '${ctx}/sys/sysDic/getDicValue?tabName=sys_person&columnName=bianzhi&value='+value,
		cache : false,
		async : false, //同步请求
		dataType : 'json',
		success : function(result) {
			str = result.key;
		}
	});
	return str;
	
}


function formatGroup(value, row, index){
	var str = '';
	$.ajax({
		type : 'get',
		url : '${ctx}/sys/sysGroup/findById?id='+value,
		cache : false,
		async : false, //同步请求
		dataType : 'json',
		success : function(result) {
			str = result.name;
		}
	});
	return str;
	
}
</script>

</html>
