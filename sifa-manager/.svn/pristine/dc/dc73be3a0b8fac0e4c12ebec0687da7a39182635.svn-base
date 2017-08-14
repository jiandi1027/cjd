<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>脱管管理</title>
<%@include file="/WEB-INF/views/include/head.jsp" %>
<style type="text/css">
	tr{text-align:right;}
</style>
</head>
<body class="easyui-layout" id="lay">
		<!-- 搜索模块 -->
		<div region="north" border="false" collapsed="true" title="搜索条件"
		style="height: 60px; overflow: hidden;" align="left">
		<form id="searchForm">
			<table>
				<tr>
					<td>所属司法部门：
						<input name="sysGroup.id" id="sysGroupId" style="width:80%;"  class="easyui-combotree"
						data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true"/>
					</td>
					<td>姓名：<input name="culprit.name" style="width:100px;" />&nbsp;</td>
					<td>脱管时间：<input name="startCreateDate" class="easyui-datetimebox" editable="false" style="width: 100px;" /></td>
					<td>至：<input name="endCreateDate" class="easyui-datetimebox" editable="false" style="width: 100px;" />&nbsp;
						<a href="javascript:void(0);" class="easyui-linkbutton" id="searchbtn">搜索</a>
						<a href="javascript:void(0);" class="easyui-linkbutton" id="cleanSearch">取消</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 定义datagrid -->
	<div region="center" border="false">
		<table id="listContent" style="height: 400px;"></table>
	</div>
	<div id="toolbar" style="display: none;">
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" id="addbtn">增加</a>
		<a onclick="editFun();"  href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" id="editbtn">修改</a>
		<a onclick="deleteFun();"  href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" id="editbtn">删除</a>
		<a onclick="$('#lay').layout('expand', 'north');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>  
	</div>
	
</body>
<script type="text/javascript">
var flag;		//undefined 判断新增和修改方法
var dataGrid;
$(function(){
	dataGrid = $('#listContent').datagrid({
			url : '${ctx}/endcorrect/detached/list', 
			method:'post',
			title:"脱管管理列表",
			idField : 'id',
			treeField : 'name',
			fit : true,
			singleSelect:true,
			fitColumns:true,
			border : false,
			rownumbers: true,
			loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,
			striped:true,
			pageSize: 10 ,
			pageList:[5,10,15,20,50],
			frozenColumns : [ [ {
					title : '编号',
					field : 'id',
					width : 80,
					checkbox:true
				} ,{title : '关联编号',
					field : 'culpritId',
					width : 80,
					hidden : true
				} ] ],
			columns : [ [ {
				field : 'culpritName',
				title : '姓名',
				width : 80,
				align:'center'
			}, {
				field : 'groupName',
				title : '司法所',
				width : 100,
				align:'center'
			}, {
				field : 'reportTime',
				title : '上报时间',
				width :80,
				align:'center',
				sortable:true
			}, {
				field : 'detachedTime',
				title : '脱管日期',
				width :80,
				align:'center',
				sortable:true
			},{
				field : 'updated',
				title : '更新时间',
				width :80,
				align:'center',
				sortable:true
			},{
				field : 'description',
				title : '简要情况',
				width :80,
				align:'center',
				sortable:true
			},{
				field : 'activityName',
				title : '流程状态',
				width :80,
				align:'center'
			},{
				field : 'action',
				title : '操作',
				width :150,
				align:'center',
				formatter : function(value, row, index) {
					var str=$.formatString('<a href="javascript:detachedDetail(\'{0}\');"  title="详细"><span style="color:blue;"><strong><u>详细</u><strong></span></a>', row.id);;
					if(row.activityName==null){
						var str=str+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:submitDetached(\'{0}\');"  title="上报"><span style="color:blue;"><strong><u>上报</u><strong></span></a>', row.id)
					}
					if(row.hasPermission==1){
						str=str+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
						+$.formatString('<a href="javascript:void(0);" onclick="submitDetachedAudit(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"><span style="color:blue;"><strong><u>流程处理</u><strong></span></a>');
					}
					if(row.processInstanceId!='' && row.processInstanceId!=null){
						if(row.isEnd==1){//若流程结束，则查看整个流程图片
							var url = '${ctx}/flow/queryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
							str=str+'&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:void(0);" onclick="viewProcess(\''+url+'\')"><span style="color:blue;"><strong><u>查看流程图</u><strong></span></a>');
						}else{//流程未结束，查看当前流程图
							var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
							str=str+'&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:void(0);" onclick="viewProcess(\''+url+'\')"><span style="color:blue;"><strong><u>查看流程图</u><strong></span></a>');
						}
					}
					if(row.processInstanceId!='' && row.processInstanceId!=null && row.hasPermission==1){
						if(row.isEnd==0){//终止流程
							str=str+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="stopProcess(\''+row.taskId+'\')"><span style="color:blue;"><strong><u>终止</u><strong></span></a>';
						}
					}
					return str;
				}
			},  ] ],
			toolbar : '#toolbar'
		});

	
	
	
	//搜索按钮
	$('#searchbtn').click(function(){
		$('#listContent').datagrid('load' ,serializeForm($('#searchForm')));
	}); 
	//取消按钮
	$('#cleanSearch').click(function(){
		$('#searchForm').get(0).reset(); //清空表单数据 
		$('#listContent').datagrid('reload',{});
		$('#lay').layout('collapse', 'north');
	});

	//新增脱管
	 $('#addbtn').click(function(){
		//location.href="${ctx}/endcorrect/detached/add";
		open_layer('新增托管','${ctx}/endcorrect/detached/add');
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
	
		
	
	/**
	 * 增加formatString功能
	 * 使用方法：$.formatString('字符串{0}字符串{1}字符串','第一个变量','第二个变量');
	 * @returns 格式化后的字符串
	 */
	$.formatString = function(str) {
		for ( var i = 0; i < arguments.length - 1; i++) {
			str = str.replace("{" + i + "}", arguments[i + 1]);
		}
		return str;
	};
	

	
});
//详细
function detachedDetail(id){
	var url = '${ctx}/endcorrect/detached/detail?id=' + id;
	open_layer('脱管详情',url);
}
//修改
function editFun(){
	var arr = $('#listContent').datagrid('getSelections');
	if(arr.length <= 0){
		$.messager.show({
			title : '提示信息!',
			msg : '至少选择一行记录进行上报!'
		});
		return;
	}
	var id=arr[0].id;
	open_layer('脱管管理修改','${ctx}/endcorrect/detached/form?id='+id);
}

//上报
function submitDetached(id){
	//open_layer('审核审批','${ctx}/dailymgr/askLeave/askLeaveAudit');
	$.ajax({
		type : 'get',
		url : "${ctx}/endcorrect/detached/submitDetached?id=" + id,
		cache : false,
		async : false, //同步请求
		dataType : 'json',
		success : function(result) {
			if(result.status==200){
				alert("上报成功！");
			}else{
				alert("上报失败！");
			}
			$('#listContent').datagrid('reload',{});
		}
	});
	
}
//查看流程图
function viewProcess(url){
	//location.href='${ctx}/flow/queryActivityMap?processInstanceId='+processInstanceId;
	open_layer('脱管流程',url);
}
//流程处理
function submitDetachedAudit(taskId,id,auditType,processId){
	open_layer('脱管流程审批',"${ctx}/endcorrect/detached/detachedAudit?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId);
}

//流程终止
function stopProcess(taskId){
	$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
	      if (b){  
	    	  $.ajax({
	  			type : 'get',
	  			url : "${ctx}/endcorrect/detached/stopProcess?taskId=" + taskId,
	  			cache : false,
	  			async : false, //同步请求
	  			dataType : 'json',
	  			success : function(result) {
	  				if(result.status==200){
	  					alert(result.msg);
	  				}else{
	  					alert(result.msg);
	  				}
	  				dataGrid.datagrid('reload',{});
	  			}
	  		});
	  		
	      }
	});  
	
}

function open_layer(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}



/* //详细
function editFun(id) {
	var arr = $('#listContent').datagrid('getSelections');
	if(arr.length <= 0){
		$.messager.show({
			title : '提示信息!',
			msg : '至少选择一行记录进行上报!'
		});
		return;
	}
	var culpritId=arr[0].culpritId;
	$('#mydialog').dialog({
		title : '修改'
	});
	$('#myform').get(0).reset(); //清空表单数据 
	$('#form1').get(0).reset(); //清空表单数据 
	$('#mydialog').dialog('open'); //打开窗口
	$('#name').combobox('setValue',arr[0].culpritName);//载入服刑人员信息数据
	//var url = '${ctx}/endcorrect/detached/loadMsg?id='+culpritId; 
	$.ajax({
		type: 'post' ,
		url:'${ctx}/endcorrect/detached/loadMsg',
		cache:false ,
		data:{id:culpritId},
		dataType:'json',
		success:function(result){
			$('#form1').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
				nation: result.rows[0].nation,
				dicSexKey:result.rows[0].dicSexKey,
				nation:result.rows[0].nation,
				identification:result.rows[0].identification,
				alias:result.rows[0].alias,
				birthday:result.rows[0].birthday,
				dicWhcdKey:result.rows[0].dicWhcdKey,
				dicHyzkKey:result.rows[0].dicHyzkKey,
				job:result.rows[0].job,
				dicYzzmmKey:result.rows[0].dicYzzmmKey,
				origin:result.rows[0].origin,
				regResidence:result.rows[0].regResidence,
				addressDetail:result.rows[0].addressDetail,
				crimeInfo:result.rows[0].crimeInfo,
				adjudgePeriod:result.rows[0].adjudgePeriod,
				accessoryPunishment:result.rows[0].accessoryPunishment,
				adjudgeChange:result.rows[0].adjudgeChange,
				adjudgeStartTime:result.rows[0].adjudgeStartTime,
				adjudgeEndTime:result.rows[0].adjudgeEndTime,
				dicPenalTypeKey:result.rows[0].dicPenalTypeKey,
				redressStartDate:result.rows[0].redressStartDate,
				redressEndDate:result.rows[0].redressEndDate});
		} 
	});
	
	$('#myform').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
		id : arr[0].id,
		culpritId:arr[0].culpritId,
		detachedTime:arr[0].detachedTime,
		dicGraspTypeKey:arr[0].dicGraspTypeKey,
		graspTime:arr[0].graspTime,
		reportTime:arr[0].reportTime,
		reportPerson:arr[0].reportPerson,
		policeName:arr[0].policeName,
		reportUnit:arr[0].reportUnit,
		detachedTime:arr[0].detachedTime,
		description:arr[0].description
	});
  };
 */
//删除资源
function deleteFun() {
	//flag = 'delete';
	var arr = $('#listContent').datagrid('getSelections');
	if (arr.length <= 0) {
		$.messager.show({
			title : '提示信息!',
			msg : '至少选择一行记录进行删除!'
		});
	} else {
		$.messager.confirm('提示信息', '确认删除?', function(r) {
			if (r) {
				$.post('${ctx}/endcorrect/detached/delete', {
					id : arr[0].id
				}, function(result) {
					//1 刷新数据表格 
					$('#listContent').datagrid('reload',{});
					//2 清空idField   
					$('#listContent').datagrid('uncheckAll');
					//刷新combotree
					//$('#cc').combotree('reload');
					//3 给提示信息 
					$.messager.show({
						title : '提示信息!',
						msg : result.msg
					});
				});
			} else {
				return;
			}
		});
	}
	}

//查询功能
function search(event){
	$('#lay').layout('expand', 'north');
}


</script>

</html>
