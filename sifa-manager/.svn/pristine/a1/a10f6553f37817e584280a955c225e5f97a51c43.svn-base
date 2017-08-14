<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>迁入管理</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>


<body class="easyui-layout" id="lay">
	<div region="north" border="false" collapsed=""false"" title="搜索条件"
		style="height: 60px; overflow: hidden;background:#E0ECFF;"align="left">
		<form id="searchForm">
			<table>
				<tr>
					<td>姓名: <input name="name" style="width: 100px;" />&nbsp;
					</td>
					<td>迁入时间范围: <input name="startDate" class="easyui-datetimebox"
						editable="false" style="width: 100px;" /></td>
					<td>至: <input name="endDate" class="easyui-datetimebox"
						editable="false" style="width: 100px;" /></td>
					<td><a href="javascript:void(0);" class="easyui-linkbutton"
						id="searchbtn">搜索</a>
					<a href="javascript:void(0);"
						class="easyui-linkbutton" id="cleanSearch">清空</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_list_content" style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,striped:true,fitColumns:true,toolbar:toolbar,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/culprit/moveIn/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80">编号</th>
					<th data-options="field:'name',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">姓名</th>
					<!-- <th data-options="field:'groupId',width:100,align:'center'"
						editor="text" editor="{type:'numberbox',options:{required:true}}">司法所</th>
					<th data-options="field:'oldGroup',width:100,align:'center'"
						editor="text" editor="{type:'numberbox',options:{required:true}}">原司法所</th>
					<th data-options="field:'place',width:250,align:'center'" editor="text">刑罚执行类别</th>
					<th data-options="field:'place',width:250,align:'center'" editor="text">犯罪类型</th>
					<th data-options="field:'place',width:250,align:'center'" editor="text">监管等级</th> -->
					<th data-options="field:'moveTime',width:80,align:'center',sortable:true"
						editor="{type:'validatebox',options:{required:true}}">迁入时间</th>
					<th data-options="field:'cedentialsNumber',width:250,align:'center'" editor="text">身份证号码</th>
					<!--<th data-options="field:'endDate',width:250,align:'center'"
						editor="text">录入时间</th>
					<th data-options="field:'redressPeriod',width:250,align:'center'"
						editor="text">矫正起止时间</th>-->
					<th data-options="field:'activityName',width:250,align:'center'"
						editor="text">流程状态</th>
					<th data-options="field:'action',width:160,align:'center'" formatter="formatterAct">操作</th>
				</tr>
			</thead>
		</table>
	</div>

	<div id="mydialog" title="新增迁入" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 750px;">

		<form id="myform" action="" method="post">
			<div id="tabAdd" class="easyui-tabs">
				<div title="基本信息" style="padding: 5px 5px">
					<input type="hidden" name="id" value="" />
					<table>
						<tr>
							<td>姓&nbsp;&nbsp;名:</td>
							<td><input type="text" name="name" required=true
								class="f1 easyui-textbox" /></td>
						</tr>
						<tr>
							<td>身份证号:</td>
							<td><input type="text" name="cedentialsNumber"
								class="easyui-validatebox" /></td>
							<td>性&nbsp;&nbsp;别:</td>
							<td><input name="dicSexKey" id="dicSexKey" class="easyui-combobox" value="10001"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=10000',panelHeight:'auto'"></input></td>
							<td>民&nbsp;&nbsp;族:</td>
							<td><input name="nation" id="nation" class="easyui-combobox" value="104001"
                    		data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=104000',panelHeight:'130'"></input></td>
						</tr>
						<tr>
							<td>曾用名:</td>
							<td><input type="text" name="alias"
								class="f1 easyui-textbox" /></td>
							
							<td>出生日期:</td>
							<td><input name="bornDate" class="easyui-validatebox"
								 onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
							
							<td>文化程度:</td>
							<td><input name="dicWhcdKey" id="dicWhcdKey" class="easyui-combobox"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=19000',panelHeight:'auto'"></input></td>
						</tr>
						<tr>
							<td>婚姻状况:</td>
							<td><input name="dicHyzkKey" id="dicHyzkKey" class="easyui-combobox" 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=11000',panelHeight:'auto'"></input></td>
							<td>职&nbsp;&nbsp;业:</td>
							<td><input type="text" name="job"
								class="f1 easyui-textbox" /></td>
							<td>原政治面貌:</td>
							<td><input name="oldPoliticStatusId"class="easyui-combobox"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=65000',panelHeight:'130'" /></td>
						</tr>
						<tr>
							<td>籍贯:</td>
							<td><input type="text" name="origin"
								class="f1 easyui-textbox" /></td>
							<td>户籍所在地:</td>
							<td><input type="text" name="regResidence"
								class="easyui-validatebox" /></td>
							<td>联系方式:</td>
							<td><input type="text" name="contactPhone"
								class="easyui-validatebox" /></td>
						</tr>
						<tr>
							<td>原判罪名:</td>
							<td><input type="text" name="crimeInfo"
								class="easyui-validatebox" /></td>
							<td>刑&nbsp;&nbsp;期:</td>
							<td><input type="text" name="adjudgePeriod"class="easyui-validatebox"
								 onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" /></td>
							<td>矫正期限:</td>
							<td><input type="text" name="redressPeriod"class="easyui-validatebox"
								 onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" /></td>
						</tr>
						<tr>
							<td>刑期变动:</td>
							<td><input type="text" name="adjudgeChange"
								class="easyui-validatebox" /></td>
							<td>刑期开始日期:</td>
							<td><input name="adjudgeStartTime" class="easyui-validatebox"
								 onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
							<td>刑期结束日期:</td>
							<td><input name="adjudgeEndTime" class="easyui-validatebox"
								 onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
						</tr>
						<tr>
							<td>刑期执行类别:</td>
							<td><input type="text" name="dicPenalTypeKey"
								class="easyui-validatebox" /></td>
							<td>矫正开始日期:</td>
							<td><input name="redressStartDate" class="easyui-validatebox"
								 onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
							<td>矫正结束日期:</td>
							<td><input name="redressEndDate" class="easyui-validatebox"
								 onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
						</tr>
					</table>
				</div>
				<div title="迁入相关信息" style="padding: 5px 5px">
					<table>
						<tr>
							<td>申请时间:</td>
							<td><input name="moveTime" class="easyui-validatebox" required=true
								 onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
							<td>原司法所:</td>
							<td><input type="text" name="oldGroup" required=true class="easyui-validatebox" /></td>
							<td>拟迁往司法所:</td>
							<td><input name="groupId" required=true class="easyui-validatebox" /></td>
						</tr>
						<tr>
							<td>现居住地:</td>
							<td colspan="6"><input type="text" name="oldPlace"
								class="easyui-validatebox" style="width:583px;"/></td>
						</tr>
						<tr>
							<td>拟居住地:</td>
							<td colspan="6"><input type="text" name="newPlace"
								class="easyui-validatebox" style="width:583px;"/></td>
						</tr>
						<tr rowspan="3">
							<td>居住地变更原因:</td>
							<td colspan="6"><input class="easyui-textbox" name="reason" 
    						data-options="multiline:true,width:583" /></td>
 						</tr>
 						<tr>
 							<td>相关材料:</td>
 							<td><a id="upload" class="easyui-linkbutton" data-options="iconCls:'icon-add'">上传</a></td>
 						</tr>
 						<tr>
 							<td>已上传附件:</td>
							<td></td>
						</tr>
						<tr rowspan="3">
							<td>司法所意见:</td>
							<td colspan="6"><input class="easyui-textbox" name="opinion" 
    						data-options="multiline:true,width:583" /></td>
 						</tr>
 						<tr rowspan="3">
							<td>备注:</td>
							<td colspan="6"><input class="easyui-textbox" name="note" 
    						data-options="multiline:true,width:583" /></td>
 						</tr>
						<tr align="center">
							<td colspan="2"><a id="btn1" class="easyui-linkbutton">保存</a>
								<a id="btn2" class="easyui-linkbutton">关闭</a></td>
						</tr>
					</table>
				</div>
			</form>
		</div>  
		
</body>
<script type="text/javascript">
	var flag; //undefined 判断新增和修改方法
	var toolbar = [ {
		text : '新增',
		iconCls : 'icon-add',
		handler : function() {
			flag = 'add';
			$('#mydialog').dialog({
				title : '新增用户'
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
			} else {
				$('#mydialog').dialog({
					title : '修改用户'
				});
				$('#mydialog').dialog('open'); //打开窗口
				$('#myform').get(0).reset(); //清空表单数据 
				$('#myform').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
					id : arr[0].id,
					name : arr[0].name,
					cedentialsNumber : arr[0].cedentialsNumber,
					dicSexKey : arr[0].dicSexKey,
					nation : arr[0].nation,
					alias : arr[0].alias,
					bornDate : arr[0].bornDate,
					dicWhcdKey : arr[0].dicWhcdKey,
					dicHyzkKey : arr[0].dicHyzkKey,
					job : arr[0].job,
					oldPoliticStatusId : arr[0].oldPoliticStatusId,
					origin : arr[0].origin,
					regResidence : arr[0].regResidence,
					contactPhone : arr[0].contactPhone,
					crimeInfo : arr[0].crimeInfo,
					adjudgePeriod : arr[0].adjudgePeriod,
					redressPeriod : arr[0].redressPeriod,
					adjudgePeriod : arr[0].adjudgePeriod,
					adjudgeChange : arr[0].adjudgeChange,		
					adjudgeStartTime : arr[0].adjudgeStartTime,
					adjudgeEndTime : arr[0].adjudgeEndTime,
					dicPenalTypeKey : arr[0].dicPenalTypeKey,
					redressStartDate : arr[0].redressStartDate,
					redressEndDate : arr[0].redressEndDate,
					created : arr[0].created,
					oldGroup : arr[0].oldGroup,
					groupId : arr[0].groupId,
					oldPlace : arr[0].oldPlace,
					newPlace : arr[0].newPlace,
					redressStartDate : arr[0].redressStartDate,
					reason : arr[0].reason,
					opinion : arr[0].opinion,
					note : arr[0].notes
					
				});
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
							if(arr.length==1 || i==arr.length-1){
								ids += arr[i].id
							}else{
								ids += arr[i].id+"," ;
							}

						}
						//ids = ids.substring(0, ids.length - 1);
						$.post('${ctx}/culprit/moveIn/batchDelete', {
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
	}];

	/**
	 *  提交表单方法
	 */
	$('#btn1').click(function() {
		if ($('#myform').form('validate')) {
			$.ajax({
				type : 'post',
				url : '${ctx}/culprit/moveIn/save',
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
		$('#cleanSearch').click(function () {
			$('#t_list_content').datagrid('load', {});
			$('#searchForm').form().find('input').val('');
		});
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
	
	function formatOper(val,row,index){  
	    return '<a href="javascript:void(0);" onclick="submitAskLeave('+row.id+')">提交申请</a>';  
	} 
	function submitAskLeave(id){
		alert(id);
		$.ajax({
			type : 'get',
			url : '${ctx}/culprit/moveIn/submitMoveIn?id=' + id,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			success : function(result) {
				if(result.status==200){
					alert("申请成功！");
				}
				
			}
		});
	}
//格式化函数
function formatterAct(value,row,index){
	var str = '';
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		if(row.isEnd==1){//若流程结束，则查看整个流程图片
			var url = '${ctx}/flow/queryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
			str += $.formatString('<a onclick="showPic(\'{0}\');" style="cursor:hand;cursor:pointer;color:" ><span style="color:blue;"><strong><u>查看流程图</u></strong></span></a>&nbsp;&nbsp;&nbsp;&nbsp;',url);
		}else{//流程未结束，查看当前流程图
			var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
			str += $.formatString('<a onclick="showPic(\'{0}\');" style="cursor:hand;cursor:pointer;color:" ><span style="color:blue;"><strong><u>查看流程图</u></strong></span></a>&nbsp;&nbsp;&nbsp;&nbsp;',url);
		}
		str += $.formatString('<a onclick="showDetail(\'{0}\',\'{1}\',\'{2}\');" style="cursor: hand;cursor:pointer;" ><span style="color:blue;"><strong><u>详细</u></strong></span></a>&nbsp;&nbsp;&nbsp;&nbsp;',row.id,row.name);
		if(row.hasPermission==1){
			str += $.formatString('<a onclick="submitAuditMoveIn(\'{0}\',\'{1}\',\'{2}\',\'{3}\');" style="cursor: hand;" ><span style="color:blue;"><strong><u>流程处理</u></strong></span></a>&nbsp;&nbsp;&nbsp;&nbsp;',row.id,row.taskId,row.auditType,row.processInstanceId);
		}
	}else{
		str +=$.formatString('<a onclick="apply(\'{0}\');" style="cursor: hand;" ><span style="color:blue;"><strong><u>提交申请</u></strong></span></a>&nbsp;&nbsp;&nbsp;&nbsp;',row.id);
	}
	return str;
	}
//格式化函数字符串拼接
$.formatString = function(str) {
	for ( var i = 0; i < arguments.length - 1; i++) {
	str = str.replace("{" + i + "}", arguments[i + 1]);
	}
	return str;
	};
function showPic(url){
	open_layer('迁入流程图',url);
};
function deal(id,taskId,auditType,processId){
	alert(id);
	$.ajax({
		type : 'post',
	 	url :"${ctx}/culprit/moveIn/submitMoveInAudit?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
		cache : false,
		async : false, //同步请求
		dataType : 'json',
		success : function(result) {
			if(result.status==200){
				alert("处理成功！");
			}
			
		}
	});
}
function submitAuditMoveIn(id,taskId,auditType,processId){
	//location.href="${ctx}/culprit/moveIn/moveInAudit?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId;
	open_layer('迁入审核审批','${ctx}/culprit/moveIn/moveInAudit?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId);
}
function open_layer(title,url){
	
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
function apply(id){
	$.ajax({
		type : 'get',
		url : '${ctx}/culprit/moveIn/submitMoveIn?id=' + id,
		cache : false,
		async : false, //同步请求
		dataType : 'json',
		success : function(result) {
			if(result.status==200){
				//1 刷新数据表格 
				$('#t_list_content').datagrid('reload');
				//2 清空idField   
				$('#t_list_content').datagrid('uncheckAll');
				//3 给提示信息 
				$.messager.show({
					title : '提示信息!',
					msg : '申请成功!'
				});						
			}		
		}
	});
}
function detail(){
	var arr = $('#t_list_content').datagrid('getSelections');
	$('#mydialog').dialog({
		title : '基本信息'
	});
	$('#mydialog').dialog('open'); //打开窗口
	$('#myform').get(0).reset(); //清空表单数据 
	$('#myform').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
		id : arr[0].id,
		name : arr[0].name,
		cedentialsNumber : arr[0].cedentialsNumber,
		dicSexKey : arr[0].dicSexKey,
		nation : arr[0].nation,
		alias : arr[0].alias,
		bornDate : arr[0].bornDate,
		dicWhcdKey : arr[0].dicWhcdKey,
		dicHyzkKey : arr[0].dicHyzkKey,
		job : arr[0].job,
		oldPoliticStatusId : arr[0].oldPoliticStatusId,
		origin : arr[0].origin,
		regResidence : arr[0].regResidence,
		contactPhone : arr[0].contactPhone,
		crimeInfo : arr[0].crimeInfo,
		adjudgePeriod : arr[0].adjudgePeriod,
		redressPeriod : arr[0].redressPeriod,
		adjudgePeriod : arr[0].adjudgePeriod,
		adjudgeChange : arr[0].adjudgeChange,		
		adjudgeStartTime : arr[0].adjudgeStartTime,
		adjudgeEndTime : arr[0].adjudgeEndTime,
		dicPenalTypeKey : arr[0].dicPenalTypeKey,
		redressStartDate : arr[0].redressStartDate,
		redressEndDate : arr[0].redressEndDate,
		created : arr[0].created,
		oldGroup : arr[0].oldGroup,
		groupId : arr[0].groupId,
		oldPlace : arr[0].oldPlace,
		newPlace : arr[0].newPlace,
		redressStartDate : arr[0].redressStartDate,
		reason : arr[0].reason,
		opinion : arr[0].opinion,
		note : arr[0].notes
		
	});
}
//延迟0.1秒让datagrid先选中在触发
function showDetail(){
	setTimeout("detail()","100")	
}

</script>

</html>