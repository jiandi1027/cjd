<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic }/extJs.js"
	charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		$('#outofSearchbtn').click(function() {
			$('#t_list_outof').datagrid('load', $.serializeObject($('#searchForm')));
		});
	});

	function cleanSearch() {
		$('#t_list_outof').datagrid('load', {});
		$('#searchForm').form().find('input').val('');
	}

	function formatOper(val, row, index) {
		var operation = '<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-info\'" onclick="outOfDetail(\''
						+row.id+'\',\''+row.isEnd+ '\')">详情</a>';
		if (row.hasPermission == 1) {
			operation = operation
					+ '&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit1" data-options="plain:true,iconCls:\'fi-clipboard-pencil\'" onclick="submitAuditOutOf(\''
					+ row.taskId + '\',\'' + row.id + '\',\'' + row.auditType
					+ '\',\'' + row.processInstanceId + '\')">流程处理</a>';
		}
		if (row.processInstanceId != '' && row.processInstanceId != null) {
			var processDetailUrl = "/endcorrect/outof/forProcessDetail?id=" + row.id;
			if (row.isEnd == 1) {
				var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='
						+ row.processDefinitionId + '&resourceType=png';
				operation = operation
						+ '&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit2" data-options="plain:true,iconCls:\'fi-map\'" onclick="viewProcess(\''
						+ url + '&processDetailUrl=' + processDetailUrl
						+ '\')">查看流程图</a>';
			} else {
				var url = '${ctx}/flow/queryActivityMap?processInstanceId=' + row.processInstanceId;
				operation = operation
						+ '&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit2" data-options="plain:true,iconCls:\'fi-map\'" onclick="viewProcess(\''
						+ url + '&processDetailUrl=' + processDetailUrl
						+ '\')">查看流程图</a>';
			}
		}
		if (row.processInstanceId != '' && row.processInstanceId != null) {
			if (row.isEnd == 0) {
				operation = operation
						+ '&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit3" data-options="plain:true,iconCls:\'fi-map\'" onclick="stopProcess(\''
						+ row.taskId + '\')">终止</a>';
			}
		}
		return operation;
	}
	function viewProcess(url) {
		parent.$.modalDialog({
			title : '迁出流程',
			iconCls : 'fi-shuffle  icon-blue',
			maximizable : true,
	        resizable : true,
			width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
			href : url
		});
	}
	function submitAuditOutOf(taskId, id, auditType, processId) {

		var title ='审核';
		if(auditType=='usertask1'||auditType=='usertask2'){
			title ='上报';
		}
		if(auditType=='usertask5'){
			parent.$.modalDialog({
				title : '文书打印',
				iconCls : 'fi-print icon-blue',
				maximizable : true,
				resizable : true,
				width : 500,
				height : 300,
				href : '${ctx}/endcorrect/outof/outofFinishPrint?id=' +id+ '&taskId=' +taskId+ '&auditType=' + auditType + '&processInstanceId=' + processId, 
				buttons : [ {
		            text : "结束流程",
		            iconCls:'fi-results-demographics icon-blue',
		            handler : function() {
		            	if($('#isPrint').html()==''){
		            		$.messager.alert({
	        					title : '提示信息!',
	        					msg : '请打印后再结束!'
	        				});	
		            		return false;
		            	}
		            	//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		               	parent.$.modalDialog.openner_dataGrid = $('#t_list_outof').datagrid();
		               	var f = parent.$.modalDialog.handler.find('#outof_inform_btn');
		                f.click();
			               
		            }
		         },{
	                	text : '关闭',
	                	iconCls:'fi-x icon-blue',
	               		handler : function() {
	               	 		parent.$.modalDialog.handler.dialog('close');
	                	} 
				}]
			}) ;
		}
		else {
			parent.$.modalDialog({
				title : '迁出审核审批',
				iconCls : 'fi-clipboard-pencil icon-blue',
				width : sy.getBrowerWidth() * 0.8,
				height : sy.getBrowerHeight() * 0.9,
				maximizable:true,
		        resizable:true,
				href : '${ctx}/endcorrect/outof/outOfAudit?id=' + id
						+ '&taskId=' + taskId + '&auditType=' + auditType
						+ '&processInstanceId=' + processId,
				buttons : [ {
					text : title,
					iconCls : 'fi-clipboard-pencil icon-blue',
					handler : function() {
						//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
						parent.$.modalDialog.openner_dataGrid = $('#t_list_outof') .datagrid();
						var f = parent.$.modalDialog.handler.find('#outOfAuditForm');
						f.submit();
					}
				},{
	 				text : '关闭',
					iconCls : 'fi-x icon-blue',
					handler : function() {
						//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
						parent.$.modalDialog.openner_dataGrid = $('#t_list_outof').datagrid();
						parent.$.modalDialog.handler.dialog('close');
					}
	         	}]
			});
		}
	}
	function outOfDetail(id, isEnd) {
		if(isEnd==1){
			 parent.$.modalDialog({
		         title : '迁出流程详情',
		         iconCls:'fi-info icon-blue',
		         resizable : true,
		         maximizable:true,
		         width : sy.getBrowerWidth() - 250,
		         height : sy.getBrowerHeight() - 40,
		         href : '${ctx}/endcorrect/outof/detail?id=' + id,
		         buttons : [ {
		             id : 'outofListPrint',
		             text : '打印社区服刑人员居住地变更审批表',
		             iconCls:'fi-print icon-blue',
		             handler : function() {
		                 var f = parent.$.modalDialog.handler.find('#outofDetailPrint');
		                 f.click();
		             }
		         },{
	                 id : 'outofListClose',
	                 text : '关闭',
	                 iconCls:'fi-x icon-blue',
	                 handler : function() {
	                	//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                     parent.$.modalDialog.openner_dataGrid = $('#t_list_outof').datagrid();
	                     parent.$.modalDialog.handler.dialog('close');
	                 }
		         }]
		     });
		}else{
			parent.$.modalDialog({
				title : '迁出流程详情',
				iconCls : 'fi-info icon-blue',
				width : sy.getBrowerWidth() - 250,
				height : sy.getBrowerHeight() - 40,
				maximizable:true,
		        resizable:true,
				href : '${ctx}/endcorrect/outof/detail?id=' + id,
				buttons:[{
					id : 'outofListClose',
	 				text : '关闭',
					iconCls : 'fi-x icon-blue',
					handler : function() {
						//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
						parent.$.modalDialog.openner_dataGrid = $('#t_list_outof').datagrid();
						parent.$.modalDialog.handler.dialog('close');
					}
	         	}]
			});
		}
	}

	function stopProcess(taskId) {
		$.messager.confirm('提示', '请判断是否要执行该操作?', function(b) {
			if (b) {
				$.ajax({
					type : 'get',
					url : "${ctx}/endcorrect/outof/stopProcess/?taskId=" + taskId,
					cache : false,
					async : false, //同步请求
					dataType : 'json',
					success : function(result) {
						if (result.status == 200) {
							$.messager.show({
								title : '提示信息!',
								msg : result.msg
							});
							self.parent.$('#t_list_outof').datagrid('reload');
						} else {
							$.messager.show({
								title : '提示信息!',
								msg : result.msg
							});
							self.parent.$('#t_list_outof').datagrid('reload');
						}
					}
				});
			}
		});
	}
	function open_layer(title, url) {

		var index = layer.open({
			type : 2,
			title : title,
			content : url
		});
		layer.full(index);
	}

	function addOutOf() {
		parent.$.modalDialog({
			title : '新增',
			iconCls : 'fi-plus icon-green',
			width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
			maximizable : true,
	        resizable : true,
			href : '${ctx}/endcorrect/outof/add',
			buttons : [{
			text : '保存',
			iconCls : 'icon-save',
			handler : function() {
					//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.openner_dataGrid = $('#t_list_outof').datagrid();
					var f = parent.$.modalDialog.handler.find('#culpritInfo');
					f.submit();
				}
			},{
					text : '重置',
					iconCls : 'icon-undo',
					handler : function() {
						var f = parent.$.modalDialog.handler.find('#culpritInfo');
						f.get(0).reset(); //清空表单数据 
				}
			 }]
		});
	}
	function formatIsPrivate(val,row,index){
		 return sy.getDicValue('SF_MOVE_OUT', 'isPrivate', row.isPrivate, '')
	}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
<form id="searchForm"
					style="padding-bottom: 10px; padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'"
		style="width: 240px;">
		
		<div class="easyui-layout" data-options="fit:true,border:false">
			<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
				<sys:sysGroup hiddenId="groupName" hiddenName="groupName"
					dataGridId="t_list_outof" />
			</c:if>
			<div class="easyui-panel search-form"
				data-options="fit:true,border:false" id="p2"
				title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目</c:if>"
				style="width: 100%;">
			<table>
			<tr>
				<td class="search-title">矫正对象：</td>
				<td>
					<input name="name" id="name" class="easyui-textbox" />
				</td>
			</tr>
			<tr>
				<td class="search-title">迁&nbsp;出&nbsp;地：</td>
				<td>
					<input name="place" id="place" class="easyui-textbox" />
				</td>
			</tr>
			<tr>
				<td class="search-title">是否私自：</td>
				<td> 
					<input id="isPrivate" class="easyui-combobox" name="isPrivate"   editable="false"
 							data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?parentKey=22000&showAll=1&columnName=isPrivate&tabName=SF_MOVE_OUT',panelHeight:'auto'" /> 
 				</td>
			</tr>
			<tr>
				<td class="search-title">迁出起始：</td>
				<td>
					<input name="searchStartDate" id="outofSearchStartDate" class="Wdate easyui-validatebox" 
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'outofSearchEndDate\')}'})"/>
				</td>
			</tr>
			<tr>
				<td class="search-title">迁出截止：</td>
				<td>
					<input name="searchEndDate" id="outofSearchEndDate" class="Wdate easyui-validatebox" 
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'outofSearchStartDate\')}',maxDate:'2120-10-01'})"/>
				</td>
			</tr>
		</table>
	</div>
			<div data-options="region:'south',border:false"
				style="height: 30px; line-height: 30px; overflow: hidden; text-align: center; background-color: #eee">
				<a href="#" class="easyui-linkbutton" id="outofSearchbtn"
					iconCls="icon-search">查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton"  iconCls="icon-undo" id="outofCleanGroupBtn"
					onclick="$('#name').textbox('reset');$('#place').textbox('reset');$('#isPrivate').combobox('reset');javascript:$('#searchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
</form>
	
	<div data-options="region:'center',border:true">
		<table class="easyui-datagrid" id="t_list_outof" title="迁出列表"
			style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,toolbar:'#outoftoolbar',fit:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/endcorrect/outof/list',method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
				  $('.organization-easyui-linkbutton-edit1').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'}); 
				  $('.organization-easyui-linkbutton-edit2').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle  icon-blue'});
				  $('.organization-easyui-linkbutton-edit3').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
		 }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:'10%'">编号</th>
					<th data-options="field:'culpritName',width:'14%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">矫正对象</th>
					<th data-options="field:'place',width:'18%',align:'center'"
						editor="{type:'numberbox',options:{required:true}}">迁出地</th>
					<th data-options="field:'moveTime',width:'16%',align:'center'">迁出日期</th>
					<th data-options="field:'isPrivate',width:'10%',align:'center',formatter:formatIsPrivate">是否私自</th>
					<th data-options="field:'activityName',align:'center'" style="width: 10%;">审批状态</th>
					<th data-options="field:'_opt',align:'center',width:'30%',formatter:formatOper">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="outoftoolbar" style="display: none;">
<c:if test="${account.roleId == '3003' }">
	<a onclick="addOutOf();" href="javascript:void(0);"
		class="easyui-linkbutton"
		data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
</c:if>

</div>

