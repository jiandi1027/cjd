<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic }/extJs.js"
	charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="deathSearchForm" class="confirmButton"
		style="padding-bottom: 10px; padding-top: 10px;">
		<div data-options="region:'east',border:true,split:false,title:'查询条件'"
			style="width: 250px;">
			<div class="easyui-layout" data-options="fit:true,border:false">
				<div region="center" border="false">
					<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
						<sys:sysGroup hiddenId="groupId" hiddenName="groupId"
							dataGridId="death_list_content" />
					</c:if>
					<div class="easyui-panel search-form"
						data-options="fit:true,border:false" id="p2"
						title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>"
						style="width: 100%;">
						<table>
							<tr>
								<td class="search-title">矫正对象：</td>
								<td><input name="culpritName" class="easyui-textbox" /></td>
							</tr>
							<tr>
								<td class="search-title">死亡起始：</td>
								<td><input name="searchStartDate" id="searchStartDate"
									class="Wdate"
									onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\',{d:-1})}'})" />
								</td>
							</tr>
							<tr>
								<td class="search-title">死亡截止：</td>
								<td><input name="searchEndDate" id="searchEndDate"
									class="Wdate"
									onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate\',{d:1})}'})" />
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div data-options="region:'south',border:false"
					style="height: 30px; line-height: 30px; overflow: hidden; text-align: center; background-color: #eee">
					<a href="#" class="easyui-linkbutton confirmButton"
						id="searchGroupBtn" iconCls="icon-search"
						onclick="javascript:$('#death_list_content').datagrid('load' ,$.serializeObject($('#deathSearchForm')));">查询</a>
					&nbsp;&nbsp; <a href="#" class="easyui-linkbutton"
						id="cleanGroupBtn" iconCls="icon-undo"
						onclick="javascript:$('#deathSearchForm').form('clear');">清空</a>
				</div>
			</div>
		</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="death_list_content" title="死亡登记列表"
			style="height: 400px;"
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:'#deathToolbar',
			loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15,pageList:[5,10,15,20,50],fitColumns:true
			,url:'${ctx}/endcorrect/death/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-death-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-linkbutton-death-map').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle icon-blue'});
                        $('.organization-easyui-linkbutton-death-stop').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
                        $('.organization-easyui-linkbutton-death-clipboard-pencil').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true"></th>
					<th data-options="field:'culpritName',width:'10%',align:'center'">矫正对象</th>
					<th data-options="field:'groupName',width:'10%',align:'center'">司法所</th>
					<th
						data-options="field:'deathlTime',width:'10%',align:'center',sortable:true,formatter:function(value,row,index){
						return formatDate(value,'yyyy-MM-dd');
					}">死亡时间</th>
					<th data-options="field:'deathReason',width:'18%',align:'center'">死亡原因</th>
					<th data-options="field:'situation',width:'20%',align:'center'">死亡相关情况</th>
					<th data-options="field:'activityName',width:'10%',align:'center'">流程状态</th>
					<th
						data-options="field:'_opt',width:'20%',align:'center',formatter:formatOper">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>

<div id="deathToolbar" style="display: none;">
	<shiro:hasPermission name="endcorrect/death/add">
		<a onclick="addDeathStop();" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
	</shiro:hasPermission>

	<shiro:hasPermission name="endcorrect/death/del">
		<a onclick="batchDeleteDeathStop();" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>
	</shiro:hasPermission>
</div>
<script type="text/javascript">
	function addDeathStop()
	{
		parent.$.modalDialog(
		{
			title : '新增死亡登记',
			iconCls : 'fi-plus icon-green',
			width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
			resizable : true,
			maximizable : true,
			href : '${ctx}/endcorrect/death/add',
			buttons :
			[
					{
						text : '保存',
						iconCls : 'icon-save',
						handler : function()
						{
							parent.$.modalDialog.openner_dataGrid = $(
									'#death_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler
									.find('#deathAddform');
							f.submit();
						}
					},
					{
						text : '重置',
						iconCls : 'icon-undo',
						handler : function()
						{
							var f = parent.$.modalDialog.handler
									.find('#deathAddform');
							f.get(0).reset(); //清空表单数据 
						}
					},
					{
						text : '关闭',
						iconCls : 'fi-x icon-blue',
						handler : function()
						{
							parent.$.modalDialog.handler.dialog('close');
						}
					} ]
		});
	}

	function batchDeleteDeathStop()
	{
		var arr = $('#death_list_content').datagrid('getSelections');
		if (arr.length <= 0)
		{
			$.messager.show(
			{
				title : '提示信息!',
				msg : '至少选择一行记录进行删除!'
			});
		} else
		{
			$.messager.confirm('提示信息', '确认删除?', function(r)
			{
				if (r)
				{
					var ids = '';
					for (var i = 0; i < arr.length; i++)
					{
						if (i == 0)
						{
							ids += arr[i].id
						} else
						{
							ids += "," + arr[i].id;
						}
					}
					$.post('${ctx}/endcorrect/death/batchDelete',
					{
						ids : ids
					}, function(result)
					{
						//1 刷新数据表格 
						$('#death_list_content').datagrid('reload');
						//2 清空idField   
						$('#death_list_content').datagrid('uncheckAll');
						//3 给提示信息 
						$.messager.show(
						{
							title : '提示信息!',
							msg : '删除成功!'
						});
					});
				} else
				{
					return;
				}
			});
		}
	}

	function formatOper(val, row, index)
	{
		var operation = '';
		if (row.processInstanceId != '' && row.processInstanceId != null)
		{
			var operation = '<a href="javascript:void(0);" class="organization-easyui-linkbutton-death-info" onclick="deathDetail(\''
					+ row.id + '\')"></a>';
		}
		<shiro:hasPermission name="endcorrect/death/audit">
		if (row.hasPermission == 1)
		{
			operation = operation
					+ '&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-death-clipboard-pencil" onclick="submitAuditDeath(\''
					+ row.taskId + '\',\'' + row.id + '\',\'' + row.auditType
					+ '\',\'' + row.processInstanceId + '\')"></a>';
		}
		</shiro:hasPermission>
		if (row.processInstanceId != '' && row.processInstanceId != null)
		{
			var processDetailUrl = "/endcorrect/death/forProcessDetail?id="
					+ row.id;
			if (row.isEnd == 1)
			{
				var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='
						+ row.processDefinitionId + '&resourceType=png';
				operation = operation
						+ '&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-death-map" '
						+ 'onclick="viewProcess(\'' + url
						+ '&processDetailUrl=' + processDetailUrl + '\')"></a>';
			} else
			{
				var url = '${ctx}/flow/queryActivityMap?processInstanceId='
						+ row.processInstanceId;
				operation = operation
						+ '&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-death-map" '
						+ 'onclick="viewProcess(\'' + url
						+ '&processDetailUrl=' + processDetailUrl + '\')"></a>';
			}
		}

		return operation;
	}

	function viewProcess(url)
	{
		parent.$.modalDialog(
		{
			title : '流程信息',
			iconCls : 'fi-shuffle icon-blue',
			width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
			resizable : true,
			maximizable : true,
			href : url,
			buttons :
			[
			{
				text : '关闭',
				iconCls : 'fi-x icon-blue',
				handler : function()
				{
					parent.$.modalDialog.handler.dialog('close');
				}
			} ]
		});
	}

	function submitAuditDeath(taskId, id, auditType, processInstanceId)
	{
		var height = sy.getBrowerHeight() - 100;
		if (auditType == 'sfsSb')
		{
			height = height - 100;
		}

		if (auditType == 'xgzryprint')
		{
		
			parent.$.modalDialog(
			{
				title : '文书打印',
				iconCls : 'fi-print icon-blue',
				width : 500,
				height : 300,
				resizable : true,
				maximizable : true,
				href : '${ctx}/endcorrect/death/workerPrint?id=' + id
						+ '&taskId=' + taskId + '&auditType=' + auditType
						+ '&processInstanceId=' + processInstanceId,
				buttons :
				[
						{
							text : "提交",
							iconCls : 'fi-check icon-blue',
							handler : function()
							{
								
								
								var printOne=$('#death_isPrintONE').html() ;
								var printTwo=$('#death_isPrintTWO').html() ;
								
							
								//外出证明 
								if (printOne== ''||printOne == null||printOne == 'undefined'||printTwo== ''||printTwo == null||printTwo == 'undefined')
								{
									
									$.messager.alert(
									{
										title : '提示信息!',
										msg : '请打印后再提交!'
									});
									return false;
								}

								parent.$.modalDialog.openner_dataGrid = $(
										'#death_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好

								var f = parent.$.modalDialog.handler
										.find('#death_inform_btn');
								f.click(); 
							}
						},
						{
							text : '关闭',
							iconCls : 'fi-x icon-blue',
							handler : function()
							{
								parent.$.modalDialog.handler.dialog('close');
							}
						} ]
			});
		} else
		{

			parent.$.modalDialog(
			{
				title : '死亡登记审批',
				iconCls : 'fi-clipboard-pencil icon-blue',
				width : sy.getBrowerWidth() - 250,
				height : height,
				resizable : true,
				maximizable : true,
				href : '${ctx}/endcorrect/death/deathAudit?id=' + id
						+ '&taskId=' + taskId + '&auditType=' + auditType
						+ '&processInstanceId=' + processInstanceId,
				buttons :
				[
						{
							text : '提交',
							iconCls : 'fi-clipboard-pencil icon-blue',
							handler : function()
							{
								parent.$.modalDialog.openner_dataGrid = $(
										'#death_list_content').datagrid();
								var f1 = parent.$.modalDialog.handler
										.find('#deathAuditForm');
								f1.submit();
							}
						},
						{
							text : '关闭',
							iconCls : 'fi-x icon-blue',
							handler : function()
							{
								parent.$.modalDialog.handler.dialog('close');
							}
						} ]
			});
		}

	}

	function deathDetail(id)
	{
		var url = '${ctx}/endcorrect/death/detail?id=' + id;
		parent.$.modalDialog(
		{
			title : '流程信息',
			iconCls : 'fi-info icon-blue',
			width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
			resizable : true,
			maximizable : true,
			href : url,
			buttons :
			[
			{
				text : '关闭',
				iconCls : 'fi-x icon-blue',
				handler : function()
				{
					parent.$.modalDialog.handler.dialog('close');
				}
			} ]
		});
	}
</script>