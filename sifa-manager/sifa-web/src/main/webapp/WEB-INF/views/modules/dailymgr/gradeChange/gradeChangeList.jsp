<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>监管等级</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>


<body class="easyui-layout" id="lay">
	<div region="north" border="false" collapsed="false" title="搜索条件"
		style="height: 60px; overflow: hidden;background:#E0ECFF;" align="left">
		<form id="searchForm">
			<table>
				<tr>
					<td >所属组织
					</td>
					<td>
						<select id="sysGroupId" name="sysGroup.id" class="easyui-combotree" style="width: 150px;"
    					data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true">
						</select>
						
					</td>
					<td >矫正人员姓名</td>
					<td>
						<input name="name" class="easyui-textbox"
						 style="width: 150px;" />
					</td>
					<td >监管等级</td>
					<td>
						<input id="dicGldxjbKey" class="easyui-combobox" name="dicGldxjbKey"   
    							data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=27000',panelHeight:'auto'" />
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
		<table class="easyui-datagrid" id="t_list_content" style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,striped:true,fitColumns:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/culpritinfo/culprit/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80">编号</th>
					<th data-options="field:'name',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">姓名</th>
					<th data-options="field:'groupName',width:200,align:'center'" editor="text">司法所</th>
				<!--<th data-options="field:'dicPenalTypeKey',width:250,align:'center'" editor="text">刑罚执行类别</th>formatter="formatterAct" -->
					<th data-options="field:'culpritJudgment.dicCrimeTypeKey',width:250,align:'center',formatter:crimeType" editor="text" >犯罪类型</th>
					<th data-options="field:'culpritJudgment.dicPenalTypeKey',width:250,align:'center',formatter:penalType" editor="text">社区矫正类型</th>
					<th data-options="field:'dicGldxjbKey',width:250,align:'center'" editor="text">监管等级</th>
					<th data-options="field:'action',width:160,align:'center'" formatter="formatterAct" >操作</th>
				</tr>
			</thead>
		</table>
	</div>


</body>
<script type="text/javascript">

	var flag; //undefined 判断新增和修改方法
	var toolbar = [ {
		text : '新增',
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
			open_layer('新增请假','${ctx}/dailymgr/askLeave/form');

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
			} else {
				/* $('#mydialog').dialog({
					title : '修改用户'
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
				}); */
				
				open_layer('新增请假','${ctx}/dailymgr/askLeave/form?id='+arr[0].id);
			}

		}
	}, '-', {
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
							if (i == 0) {
								ids += "ids=" + arr[i].id
							} else {
								ids += "&ids=" + arr[i].id;
							}

						}
						//ids = ids.substring(0, ids.length - 1);
						$.post('${ctx}/dailymgr/askLeave/batchDelete', {
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
	}];

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
	//1犯罪类型转翻译
	function crimeType(value,row,index){
		//alert(row.culpritJudgment);
			if(row.culpritJudgment){
				return row.culpritJudgment.dicCrimeTypeKey;
			}else{
				return value;
			}
			
		}
	//1矫正类型
	function penalType(value,row,index){
		if(row.culpritJudgment){
			return row.culpritJudgment.dicPenalTypeKey;
		}else{
			return value;
		}
	
	}
	//操作的追加
	function formatterAct(val,row,index){
		var operation=$.formatString('<a href="javascript:changeRecord(\'{0}\');"  title="变更记录"><span style="color:blue;"><strong><u>变更记录</u><strong></span></a>', row.id);
		operation +='&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:amend(\'{0}\');"  title="修改监管等级"><span style="color:blue;"><strong><u>修改监管等级</u><strong></span></a>', row.id)
		return operation;
	}
	$.formatString = function(str) {
		for ( var i = 0; i < arguments.length - 1; i++) {
			str = str.replace("{" + i + "}", arguments[i + 1]);
		}
	return str;
}
	function amend(id){
		open_layer('新增修改监管等级','${ctx}/dailymgr/gradeChange/form?culpritId='+id);
	}
	function changeRecord(id){
		open_layer('修改监管等级','${ctx}/dailymgr/gradeChange/changeRecord?culpritId='+id);
	}

function open_layer(title,url){
	
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
</script>

</html>
