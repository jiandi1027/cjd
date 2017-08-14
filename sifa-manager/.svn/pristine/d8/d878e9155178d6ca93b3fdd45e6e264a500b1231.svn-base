<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="askLeaveSearchForm" class="confirmButton"
		style="padding-bottom: 10px; padding-top: 10px;">
		<div data-options="region:'east',border:true,split:false,title:'查询条件'"
			style="width: 240px;">
			<div class="easyui-layout" data-options="fit:true,border:true">
				<div region="center" border="false">
					<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
						<sys:sysGroup hiddenId="groupId" hiddenName="groupId"
							dataGridId="askleave_list" />
					</c:if>
					<div class="easyui-panel search-form"
						data-options="fit:true,border:false" id="p2"
						title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>"
						style="width: 100%;">
						<table>
							<tr>
								<td class="search-title">矫正对象：</td>
								<td><input name="culprit.name" class="easyui-textbox" /></td>
							</tr>
							<tr>
								<td class="search-title">请假地点：</td>
								<td><input name="place" class="easyui-textbox" /></td>
							</tr>
							<tr>
								<td class="search-title">请假状态：</td>
								<td><input id="dicStatusKey" class="easyui-combobox"
									name="dicStatusKey" editable=false
									data-options="valueField:'key',panelHeight:'auto',textField:'value',url:'${ctx}/sys/sysDic/getListByTabColumnName?tabName=sf_askleave&columnName=dic_status_key&showAll=1'" />
								</td>
							</tr>
							<tr>
								<td class="search-title">请假起始：</td>
								<td><input name="searchStartDate" id="searchStartDate"
									class="Wdate"
									onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" />
								</td>
							</tr>
							<tr>
								<td class="search-title">请假截止：</td>
								<td><input name="searchEndDate" id="searchEndDate"
									class="Wdate"
									onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate\')}'})" />
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div data-options="region:'south',border:false"
					style="height: 30px; line-height: 30px; overflow: hidden; text-align: center; background-color: #eee">
					<a href="#" class="easyui-linkbutton confirmButton"
						iconCls="icon-search"
						onclick="javascript:$('#askleave_list').datagrid('load',$.serializeObject($('#askLeaveSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo"
						onclick="javascript:$('#dicStatusKey').combobox('reset');$('#askLeaveSearchForm').form('clear');">清空</a>
				</div>
			</div>
		</div>
	</form>

	<div data-options="region:'center',border:true">
		<table class="easyui-datagrid" id="askleave_list" title="请假信息列表"
			data-options="singleSelect:true,fit:true,toolbar:'#askLeaveToolbar',collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/askLeave/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-askleave-detail').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-linkbutton-askleave-deal').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-askleave-stop').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
                        $('.organization-easyui-linkbutton-askleave-map').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle icon-blue'});
                        $('.organization-easyui-linkbutton-askleave-arrow-up').linkbutton({text:'上报',plain:true,iconCls:'fi-arrow-up icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th
						data-options="field:'culpritName',width:80,align:'center',formatter:function(value,rowData,rowIndex){  
					    if(rowData.culprit!=null){
					    	return rowData.culprit.name; 
					    }
					}">矫正对象</th>
					<th
						data-options="field:'groupName',width:100,align:'center',formatter:function(value,rowData,rowIndex){  
					    if(rowData.sysGroup!=null){
					    	return rowData.sysGroup.name; 
					    }
					}">司法所</th>
					<th data-options="field:'place',width:250,align:'center'">请假目的地</th>
					<th data-options="field:'leaveDays',width:70,align:'center'">请假天数</th>
					<th
						data-options="field:'beginDate',width:200,align:'center',sortable:true,formatter:function(value,row,index){
						return formatDate(value,'yyyy-MM-dd');
					}">请假开始时间</th>
					<th
						data-options="field:'endDate',width:200,align:'center',sortable:true,formatter:function(value,row,index){
						return formatDate(value,'yyyy-MM-dd');
					}">请假结束时间</th>
					<th
						data-options="field:'dicStatusKey',width:100,align:'center',formatter:function(value,rowData,rowIndex){    
					    if(typeof(rowData.dicStatusKey) != 'undefined' && rowData.dicStatusKey!=''){
					    	 return sy.getDicValue('sf_askleave','dic_status_key',rowData.dicStatusKey,''); 
					    }
					}">请假状态</th>
					<th data-options="field:'activityName',width:100,align:'center'">审批状态</th>
					<th
						data-options="field:'_opt',width:300,align:'center',formatter:formatOper">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="askLeaveToolbar" style="display: none;">
	<shiro:hasPermission name="dailymgr/askLeave/add">
		<a onclick="addAskLeave();" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="dailymgr/askLeave/del">
		<a onclick="deleteAskLeave();" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>
	</shiro:hasPermission>
</div>
<script type="text/javascript">
	$(function()
	{

	});

	function formatOper(val, row, index)
	{
		var operation = '<a href="javascript:void(0);" class="organization-easyui-linkbutton-askleave-detail" onclick="askLeaveDetail(\''
				+ row.taskId
				+ '\',\''
				+ row.id
				+ '\',\''
				+ row.auditType
				+ '\',\'' + row.processInstanceId + '\')">详情</a>';
		if (row.hasPermission == 1)
		{
			<shiro:hasPermission name="dailymgr/askLeave/deal">
			operation = operation
					+ '&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-askleave-deal" onclick="askLeaveSubmitAudit(\''
					+ row.taskId + '\',\'' + row.id + '\',\'' + row.auditType
					+ '\',\'' + row.processInstanceId + '\')">流程处理</a>';
			</shiro:hasPermission>
		}
		if (row.processInstanceId != '' && row.processInstanceId != null)
		{
			var processDetailUrl = "/dailymgr/askLeave/forProcessDetail?id="
					+ row.id;
			if (row.isEnd == 1)
			{
				var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='
						+ row.processDefinitionId + '&resourceType=png';
				operation = operation
						+ '&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-askleave-map" onclick="askLeaveViewProcess(\''
						+ url + '&processDetailUrl=' + processDetailUrl
						+ '\')">查看流程</a>';
			} else
			{
				var url = '${ctx}/flow/queryActivityMap?processInstanceId='
						+ row.processInstanceId;
				operation = operation
						+ '&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-askleave-map" onclick="askLeaveViewProcess(\''
						+ url + '&processDetailUrl=' + processDetailUrl
						+ '\')">查看流程</a>';
			}
		}
		if (row.hasPermission == 1)
		{
			if (row.processInstanceId != '' && row.processInstanceId != null)
			{
				if (row.isEnd == 0 && row.taskId != undefined)
				{
					<shiro:hasPermission name="dailymgr/askLeave/stop">
					operation = operation
							+ '&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-askleave-stop" onclick="askLeaveStopProcess(\''
							+ row.taskId + '\')">终止</a>';
					</shiro:hasPermission>
				}
			}
		}

		return operation;
	}

	function askLeaveViewProcess(url)
	{
		parent.$.modalDialog(
		{
			title : '请销假流程',
			maximizable : true,
			resizable : true,
			iconCls : 'fi-shuffle icon-blue',
			width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
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

	function askLeaveSubmitAudit(taskId, id, auditType, processId)
	{

		var width = sy.getBrowerWidth() - 150;
		if (width > 1300)
		{
			width = 1200;
		} else if (width > 1000)
		{
			width = 1000;
		}
		if (auditType == 'workerReport')
		{
			var url = "${ctx}/dailymgr/askLeave/askLeaveReport?id=" + id
					+ "&taskId=" + taskId + "&auditType=" + auditType
					+ "&processInstanceId=" + processId;
			parent.$.modalDialog(
			{
				title : '请假上报',
				iconCls : 'fi-arrow-up icon-blue',
				width : width,
				//height : sy.getBrowerHeight()-150,
				//width : 800,
				height : 420,
				resizable : true,
				maximizable : true,
				href : url,
				buttons :
				[
						{
							text : '保存',
							iconCls : 'icon-save',
							handler : function()
							{
								parent.$.modalDialog.openner_dataGrid = $('#askleave_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
								$('#askLeaveWorkerReportBtn1').click();
							}
						},
						{
							text : '上报',
							iconCls : 'fi-arrow-up icon-blue',
							handler : function()
							{
								parent.$.modalDialog.openner_dataGrid = $(
										'#askleave_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
								$('#askLeaveWorkerReportBtn2').click();
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
			//工作人员打印
			if (auditType == 'workerPrint')
			{
				parent.$
						.modalDialog(
						{
							title : '文书打印',
							iconCls : 'fi-print icon-blue',
							width : 500,
							height : 300,
							resizable : true,
							maximizable : true,
							href : '${ctx}/dailymgr/askLeave/workerPrint?id='
									+ id + '&taskId=' + taskId + '&auditType='
									+ auditType + '&processInstanceId='
									+ processId,
							buttons :
							[
									{
										text : "提交",
										iconCls : 'fi-check icon-blue',
										handler : function()
										{

											//外出证明 
											if ($('#askLeave_isPrintWCZM')
													.html() == '')
											{
												$.messager.alert(
												{
													title : '提示信息!',
													msg : '请打印后再提交!'
												});
												return false;
											}

									
											parent.$.modalDialog.openner_dataGrid = $('#askleave_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
												
											
											var f = parent.$.modalDialog.handler
													.find('#askLeave_inform_btn');
											f.click();
										}
									},
									{
										text : '关闭',
										iconCls : 'fi-x icon-blue',
										handler : function()
										{
											parent.$.modalDialog.handler
													.dialog('close');
										}
									} ]
						});

			} else
			{
				var url = "${ctx}/dailymgr/askLeave/askLeaveAudit?id=" + id
						+ "&taskId=" + taskId + "&auditType=" + auditType
						+ "&processInstanceId=" + processId;
				parent.$.modalDialog(
				{
					title : '请假审批',
					iconCls : 'fi-clipboard-pencil icon-blue',
					width : 800,
					height : 600,
					resizable : true,
					maximizable : true,
					href : url,
					buttons :
					[
							{
								text : '审批',
								iconCls : 'fi-clipboard-pencil icon-blue',
								handler : function()
								{
									parent.$.modalDialog.openner_dataGrid = $(
											'#askleave_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
									var f = parent.$.modalDialog.handler
											.find('#askLeaveAuditForm');
									f.submit();
								}
							},
							{
								text : '关闭',
								iconCls : 'fi-x icon-blue',
								handler : function()
								{
									parent.$.modalDialog.handler
											.dialog('close');
								}
							} ]
				});
			}
		}
	}

	function askLeaveDetail(taskId, id, auditType, processId)
	{

		parent.$.modalDialog(
		{
			title : '请假流程详情',
			iconCls : 'fi-info icon-blue',
			width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
			resizable : true,
			maximizable : true,
			href : '${ctx}/dailymgr/askLeave/detail?id=' + id + '&taskId='
					+ taskId + '&auditType=' + auditType
					+ '&processInstanceId=' + processId,
			buttons :
			[
					{
						id : 'listWorkerPrint2',
						text : '打印社区服刑人员外出证明',
						iconCls : 'fi-print icon-blue',
						handler : function()
						{
							var f = parent.$.modalDialog.handler
									.find('#askLeaveWorkerPrint1');
							f.click();
						}
					},
					{
						id : 'listWorkerPrint1',
						text : '关闭',
						iconCls : 'fi-x icon-blue',
						handler : function()
						{
							parent.$.modalDialog.handler.dialog('close');
						}
					} ]
		});
	
		if(auditType!='null'&&auditType!='workprint'&&auditType!=null&&auditType!='undefined')
		{
			$('#listWorkerPrint2').hide();
		}
		
		
		
		
		
		
		
		
	}

	function askLeaveStopProcess(taskId)
	{
		$.messager.confirm('提示', '请判断是否要执行该操作?', function(b)
		{
			if (b)
			{
				$.ajax(
				{
					type : 'get',
					url : "${ctx}/dailymgr/askLeave/stopProcess?taskId="
							+ taskId,
					cache : false,
					async : false, //同步请求
					dataType : 'json',
					success : function(result)
					{
						if (result.status == 200)
						{
							$('#askleave_list').datagrid('reload');
							//2 清空idField   
							$('#askleave_list').datagrid('uncheckAll');
							//3 给提示信息 
							$.messager.show(
							{
								title : '提示信息!',
								msg : result.msg
							});
						} else
						{
							$.messager.show(
							{
								title : '提示信息!',
								msg : result.msg
							});
						}
					}
				});

			}
		});

	}

	function addAskLeave()
	{
		parent.$.modalDialog(
		{
			title : '新增请假信息',
			iconCls : 'fi-plus icon-green',
			width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
			resizable : true,
			maximizable : true,
			href : '${ctx}/dailymgr/askLeave/form',
			buttons :
			[
					{
						text : '保存',
						iconCls : 'icon-save',
						handler : function()
						{
							parent.$.modalDialog.openner_dataGrid = $(
									'#askleave_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler
									.find('#culpritInfo');
							f.submit();
						}
					},
					{
						text : '重置',
						iconCls : 'icon-undo',
						handler : function()
						{
							var f = parent.$.modalDialog.handler
									.find('#culpritInfo');
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

	function deleteAskLeave()
	{
		var arr = $('#askleave_list').datagrid('getSelections');
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
					//ids = ids.substring(0, ids.length - 1);
					$.post('${ctx}/dailymgr/askLeave/batchDelete',
					{
						ids : ids
					}, function(result)
					{
						//1 刷新数据表格 
						$('#askleave_list').datagrid('reload');
						//2 清空idField   
						$('#askleave_list').datagrid('uncheckAll');
						//3 给提示信息 
						$.messager.show(
						{
							title : '提示信息!',
							msg : '操作成功!'
						});
					});
				} else
				{
					return;
				}
			});
		}
	}
</script>