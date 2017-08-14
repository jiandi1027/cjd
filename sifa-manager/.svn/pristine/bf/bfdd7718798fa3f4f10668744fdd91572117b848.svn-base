<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>档案管理</title>
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
					<td><select id="groupName" name="groupName"
						class="easyui-combotree" style="width: 80%;"
						data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true">
					</select></td>
					<td width="15%" align="right">姓名</td>
					<td>
						<input name="name" class="easyui-textbox"
						 style="width: 80%;" />
					</td>
					
				</tr>
				<tr>
					<td width="15%" align="right">时间
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
		<table class="easyui-datagrid" id="t_list_content" title="档案列表"
			style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,striped:true,toolbar:toolbar,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/fileManagement/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'',checkbox:true,width:80">序号</th>
					<th data-options="field:'no',width:70,align:'center'"
						editor="text">编号</th>
					<th data-options="field:'name',width:70,align:'center'"
						editor="text">姓名</th>
					<th data-options="field:'contactPhone',width:70,align:'center'"
						editor="text">绑定号码</th>
					<th data-options="field:'dicStatusKey',width:70,align:'center'"
						editor="text">状态</th>
					<th data-options="field:'crimeInfo',width:70,align:'center'"
						editor="text">主要罪名</th>
					<th data-options="field:'accountName',width:100,align:'center'"
						editor="text">监管人员</th>
					<th data-options="field:'groupName',width:100,align:'center'"
						editor="text">所属单位</th>
					<th
						data-options="field:'createdTime',width:150,align:'center',sortable:true"
						editor="{type:'validatebox',options:{required:true}}">建档时间</th>
					<th
						data-options="field:'redressEndDate',width:150,align:'center',sortable:true"
						editor="{type:'validatebox',options:{required:true}}">期满时间</th>
					
				 <th data-options="field:'_opt',width:150,formatter:formatOper,align:'center'">操作</th>  

				</tr>
			</thead>

		</table>
	</div>



</body>
<script type="text/javascript">
	var flag; //undefined 判断新增和修改方法
	var toolbar = [  {
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
		var operation='<a href="javascript:void(0);" onclick="askLeaveDetail(\''+row.id+'\')">详情</a>';
		operation +='&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+$.formatString('<a onclick="update(\'{0}\');" style="cursor: hand;" ><span style="color:blue;"><strong><u>修改</u></strong></span></a>&nbsp;&nbsp;&nbsp;&nbsp;',row.id);
		
	    return operation;
	} 
	//格式化函数字符串拼接
	$.formatString = function(str) {
		for ( var i = 0; i < arguments.length - 1; i++) {
		str = str.replace("{" + i + "}", arguments[i + 1]);
		}
		return str;
		};
	
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
	function update(id){
		open_layer('档案修改','${ctx}/culpritinfo/culprit/update?id=' + id)
	}
</script>

</html>
