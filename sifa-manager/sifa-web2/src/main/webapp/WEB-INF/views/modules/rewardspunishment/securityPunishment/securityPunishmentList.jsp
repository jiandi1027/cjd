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
	<form id="securityPunishmentSearchForm" class="confirmButton"
		style="padding-bottom: 10px; padding-top: 10px;">
		<div data-options="region:'east',border:true,split:false,title:'查询条件'"
			style="width: 240px;">
			<div class="easyui-layout" data-options="fit:true,border:true">
				<div region="center" border="false">
					<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
						<sys:sysGroup hiddenId="groupId" hiddenName="groupId"
							dataGridId="securityPunishment_list" />
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
								<td class="search-title">申请起始：</td>
								<td><input name="searchStartDate" id="searchStartDate"
									class="Wdate"
									onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\',{d:-1})}'})" />
								</td>
							</tr>
							<tr>
								<td class="search-title">申请截止：</td>
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
						onclick="javascript:$('#securityPunishment_list').datagrid('load' ,$.serializeObject($('#securityPunishmentSearchForm')));">查询</a>
					&nbsp;&nbsp; <a href="#" class="easyui-linkbutton"
						id="cleanGroupBtn" iconCls="icon-undo"
						onclick="javascript:$('#securityPunishmentSearchForm').form('clear');">清空</a>
				</div>
			</div>
		</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="securityPunishment_list"
			title="提请治安管理处罚列表"
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:'#securityPunishmentToolbar',loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/rewardspunishment/securityPunishment/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-securityPunishment-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-linkbutton-securityPunishment-map').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle icon-blue'});
                        $('.organization-easyui-linkbutton-securityPunishment-stop').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
                        $('.organization-easyui-linkbutton-securityPunishment-finish').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-securityPunishment-clipboard-pencil').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-securityPunishment-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-securityPunishment-arrow-up').linkbutton({text:'上报',plain:true,iconCls:'fi-arrow-up icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'culpritName',width:'15%',align:'center'"
						editor="text">矫正对象</th>
					<th data-options="field:'groupName',width:'18%',align:'center'"
						editor="text">司法所</th>
					<th
						data-options="field:'created',width:'20%',align:'center',sortable:true,formatter:function(value,row,index){
					return formatDate(value,'yyyy-MM-dd');
				}"
						editor="text">申请时间</th>
					<th data-options="field:'activityName',width:'15%',align:'center'">审批状态</th>
					<th
						data-options="field:'_opt',width:'30%',align:'center',formatter:formatOper">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="securityPunishmentToolbar" style="display: none;">
	<shiro:hasPermission name="rewardspunishment/securityPunishment/add">
		<a onclick="addsecurityPunishment();" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
	</shiro:hasPermission>
	<%-- <shiro:hasPermission name="rewardspunishment/securityPunishment/modify">
		<a onclick="updatesecurityPunishment();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-pencil icon-blue'">修改</a>
	</shiro:hasPermission> --%>
	<shiro:hasPermission name="rewardspunishment/securityPunishment/del">
		<a onclick="batchDeletesecurityPunishment();"
			href="javascript:void(0);" class="easyui-linkbutton"
			data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>
	</shiro:hasPermission>
</div>
<script type="text/javascript">
	var roleId = "${account.roleId}";
	$(function()
	{

	});

	function addsecurityPunishment()
	{
		parent.$.modalDialog(
		{
			title : '新增提请治安管理处罚',
			iconCls : 'fi-plus icon-green',
			width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
			resizable : true,
			maximizable : true,
			href : '${ctx}/rewardspunishment/securityPunishment/form',
			buttons :
			[
					{
						text : '保存',
						iconCls : 'icon-save',
						handler : function()
						{
							parent.$.modalDialog.openner_dataGrid = $(
									'#securityPunishment_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler
									.find('#securityPunishmentInfo');
							f.submit();
						}
					},
					{
						text : '重置',
						iconCls : 'icon-undo',
						handler : function()
						{
							var f = parent.$.modalDialog.handler
									.find('#securityPunishmentInfo');
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

	function updatesecurityPunishment(id)
	{
		/* var arr = $('#securityPunishment_list').datagrid('getSelections');
		if (arr.length != 1) {
			$.messager.show({
				title : '提示信息!',
				msg : '请选择一行记录进行修改!'
			});
		}  */

		parent.$.modalDialog(
		{
			title : '修改提请治安管理处罚',
			iconCls : 'fi-pencil icon-blue',
			width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
			resizable : true,
			maximizable : true,
			href : '${ctx}/rewardspunishment/securityPunishment/form?id=' + id,
			buttons :
			[
					{
						text : '保存',
						iconCls : 'icon-save',
						handler : function()
						{
							parent.$.modalDialog.openner_dataGrid = $(
									'#securityPunishment_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler
									.find('#securityPunishmentInfo');
							f.submit();
						}
					},
					{
						text : '重置',
						iconCls : 'icon-undo',
						handler : function()
						{
							var f = parent.$.modalDialog.handler
									.find('#securityPunishmentInfo');
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

	function batchDeletesecurityPunishment()
	{
		var arr = $('#securityPunishment_list').datagrid('getSelections');
		if (arr.length <= 0)
		{
			$.messager.show(
			{
				title : '提示信息!',
				msg : '至少选择一行记录进行删除!'
			});
		} else
		{
			$.messager
					.confirm(
							'提示信息',
							'确认删除?',
							function(r)
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
									$
											.post(
													'${ctx}/rewardspunishment/securityPunishment/batchDelete',
													{
														ids : ids
													},
													function(result)
													{
														//1 刷新数据表格 
														$(
																'#securityPunishment_list')
																.datagrid(
																		'reload');
														//2 清空idField   
														$(
																'#securityPunishment_list')
																.datagrid(
																		'uncheckAll');
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
		var space = '&nbsp;';
		var operation = '<a href="javascript:void(0);" class="organization-easyui-linkbutton-securityPunishment-info" '
				+ 'onclick="securityPunishmentDetail(\''
				+ row.taskId
				+ '\',\''
				+ row.id
				+ '\',\''
				+ row.auditType
				+ '\',\''
				+ row.processInstanceId + '\',\'' + row.isEnd + '\')"></a>';
		if (row.hasPermission == 1)
		{
			//权限为首次上报   有修改和上报功能
			if (row.auditType == 'firstReport')
			{
				<shiro:hasPermission name="rewardspunishment/securityPunishment/modify">
				operation = operation
						+ space
						+ '<a href="javascript:void(0);" class="organization-easyui-linkbutton-securityPunishment-pencil" '
						+ 'onclick="updatesecurityPunishment(\'' + row.id
						+ '\')"></a>';
				</shiro:hasPermission>
				<shiro:hasPermission name="rewardspunishment/securityPunishment/report">
				operation = operation
						+ space
						+ '<a href="javascript:void(0);" class="organization-easyui-linkbutton-securityPunishment-arrow-up" '
						+ 'onclick="reportProcess(\'' + row.taskId + '\',\''
						+ row.id + '\',\'' + row.auditType + '\',\''
						+ row.processInstanceId + '\')"></a>';
				</shiro:hasPermission>
			}
			//权限不为工作人员打印 的处理 
			else if (row.auditType != 'workerPrint')
			{
				<shiro:hasPermission name="rewardspunishment/securityPunishment/deal">
				operation = operation
						+ space
						+ '<a href="javascript:void(0);" class="organization-easyui-linkbutton-securityPunishment-clipboard-pencil" '
						+ 'onclick="submitAudit(\'' + row.taskId + '\',\''
						+ row.id + '\',\'' + row.auditType + '\',\''
						+ row.processInstanceId + '\')"></a>';
				</shiro:hasPermission>
			} else
			//权限为工作人员打印的处理
			{

				<shiro:hasPermission name="rewardspunishment/securityPunishment/finish">
				operation = operation
						+ space
						+ '<a href="javascript:void(0);" class="organization-easyui-linkbutton-securityPunishment-finish" '
						+ 'onclick="finishProcess(\'' + row.taskId + '\',\''
						+ row.id + '\',\'' + row.auditType + '\',\''
						+ row.processInstanceId + '\')"></a>';
				</shiro:hasPermission>
			}
		}
		//流程图
		if (row.processInstanceId != '' && row.processInstanceId != null)
		{
			var processDetailUrl = "/rewardspunishment/securityPunishment/forProcessDetail?id="
					+ row.id;
			if (row.isEnd == 1)
			{
				var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='
						+ row.processDefinitionId + '&resourceType=png';
				operation = operation
						+ space
						+ '<a href="javascript:void(0);" class="organization-easyui-linkbutton-securityPunishment-map" '
						+ 'onclick="viewProcess(\'' + url
						+ '&processDetailUrl=' + processDetailUrl + '\')"></a>';
			} else
			{
				var url = '${ctx}/flow/queryActivityMap?processInstanceId='
						+ row.processInstanceId;
				operation = operation
						+ space
						+ '<a href="javascript:void(0);" class="organization-easyui-linkbutton-securityPunishment-map" '
						+ 'onclick="viewProcess(\'' + url
						+ '&processDetailUrl=' + processDetailUrl + '\')"></a>';
			}
		}
		if (row.processInstanceId != '' && row.processInstanceId != null)
		{
			//如果流程图没结束， shiro判断有无中止流程图的权限再加按钮
			//if (row.isEnd == 0 && row.hasPermission == 1) {
			if (row.isEnd == 0)
			{
				<shiro:hasPermission name="rewardspunishment/securityPunishment/stop">
				operation = operation
						+ space
						+ '<a href="javascript:void(0);" class="organization-easyui-linkbutton-securityPunishment-stop" '
						+ 'onclick="stopProcess(\'' + row.taskId + '\')"></a>';
				</shiro:hasPermission>
			}
		}

		return operation;
	}
	function viewProcess(url)
	{
		parent.$.modalDialog(
		{
			title : '提请治安管理处罚流程',
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
	function submitAudit(taskId, id, auditType, processId)
	{
		parent.$
				.modalDialog(
				{
					title : '提请治安管理处罚审批',
					iconCls : 'fi-clipboard-pencil icon-blue',
					width : sy.getBrowerWidth() - 250,
					height : sy.getBrowerHeight() - 150,
					resizable : true,
					maximizable : true,
					href : "${ctx}/rewardspunishment/securityPunishment/securityPunishmentReport?id="
							+ id
							+ "&taskId="
							+ taskId
							+ "&auditType="
							+ auditType + "&processInstanceId=" + processId,
					buttons :
					[
							{
								text : '审核',
								iconCls : 'fi-clipboard-pencil icon-blue',
								handler : function()
								{
									parent.$.modalDialog.openner_dataGrid = $(
											'#securityPunishment_list')
											.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
									var f = parent.$.modalDialog.handler
											.find('#checkBtn1');
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
	}
	function reportProcess(taskId, id, auditType, processId, applyUnLock)
	{
		parent.$
				.modalDialog(
				{
					title : '提请治安管理处罚上报',
					iconCls : 'fi-arrow-up icon-blue',
					width : 800,
					height : 700,
					resizable : true,
					maximizable : true,
					href : "${ctx}/rewardspunishment/securityPunishment/securityPunishmentPush?id="
							+ id
							+ "&taskId="
							+ taskId
							+ "&auditType="
							+ auditType + "&processInstanceId=" + processId,
					buttons :
					[
							{
								text : '上报',
								iconCls : 'fi-arrow-up icon-blue',
								handler : function()
								{
									parent.$.modalDialog.openner_dataGrid = $(
											'#securityPunishment_list')
											.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
									var f = parent.$.modalDialog.handler
											.find('#reportBtn1');
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
	}
	//详情
	function securityPunishmentDetail(taskId, id, auditType, processId, isEnd)
	{
	/* 	console.log(auditType);
		alert(auditType); */
	
		var url = '${ctx}/rewardspunishment/securityPunishment/detail?id=' + id
				+ '&taskId=' + taskId + '&auditType=' + auditType
				+ '&processInstanceId=' + processId;
		parent.$.modalDialog(
		{
			title : '提请治安管理处罚详情',
			iconCls : 'fi-info icon-blue',
			width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
			resizable : true,
			maximizable : true,
			href : url,
			buttons : 
			[
					{
						id : 'listWorkerPrint3',
						text : '打印治安管理处罚建议书',
						iconCls : 'fi-print icon-blue',
						handler : function()
						{
							var f = parent.$.modalDialog.handler
									.find('#workerPrint3');
							f.click();
						}
					},
					{
						id : 'listWorkerPrint4',
						text : '打印提请治安管理处罚审核表',
						iconCls : 'fi-print icon-blue',
						handler : function()
						{
							var f = parent.$.modalDialog.handler
									.find('#workerPrint4');
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

		
		if ( auditType == 'firstReport'||auditType == 'sfsCheck'||auditType == 'jzkCheck'||auditType == 'fzkCheck'||auditType == 'xfgCheck')
		{
			$('#listWorkerPrint3').hide();
			$('#listWorkerPrint4').hide();
		}
	}

	function stopProcess(taskId)
	{
		$.messager
				.confirm(
						'提示信息',
						'该流程终止后将不可恢复?',
						function(r)
						{
							if (r)
							{
								$
										.ajax(
										{
											type : 'get',
											url : '${ctx}/rewardspunishment/securityPunishment/stopProcess?taskId='
													+ taskId,
											cache : false,
											async : false, //同步请求
											dataType : 'json',
											success : function(result)
											{
												if (result.status == 200)
												{
													$.messager.show(
													{
														title : '提示信息!',
														msg : '终止成功'
													});

													$(
															'#securityPunishment_list')
															.datagrid('reload');
													//2 清空idField   
													$(
															'#securityPunishment_list')
															.datagrid(
																	'uncheckAll');
												} else
												{
													alert(result.msg);
												}
											}
										});
							}
						});
	}

	function finishProcess(taskId, id, auditType, processId)
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
					href : '${ctx}/rewardspunishment/securityPunishment/workerPrint?id='
							+ id
							+ '&taskId='
							+ taskId
							+ '&auditType='
							+ auditType + '&processInstanceId=' + processId,
					buttons :
					[
							{
								text : "告知",
								iconCls : 'fi-results-demographics icon-blue',
								handler : function()
								{

									//建议书 审批表

									if ($('#securityPunishment_isPrintJYS').html() == ''
											|| $('#securityPunishment_isPrintSHB')
													.html() == '')
									{
										$.messager.alert(
										{
											title : '提示信息!',
											msg : '请打印后再告知!'
										});
										return false;
									}
									parent.$.modalDialog.openner_dataGrid = $(
											'#securityPunishment_list')
											.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
									var f = parent.$.modalDialog.handler
											.find('#securityPunishment_inform_btn');
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

		/* $.messager.confirm('提示信息', '是否确定结束流程?', function(b) {
			if (b){  
				$.ajax({
					type : 'post',
		  			//url : "${ctx}/investigate/stopProcess?id=" + id + "&taskId=" + taskId,
		  			url : '${ctx}/rewardspunishment/securityPunishment/securityPunishmentAudit?type=1&id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
		  			cache : false,
		  			async : false, //同步请求
		  			dataType : 'json',
		  			success : function(result) {
		  				if(result.status==200){
		  					$.messager.show({
		  	   					title:'提示信息!',
		  	   					msg: '流程结束'
		  	   				});
		  					
							$('#securityPunishment_list').datagrid('reload');
							//2 清空idField   
							$('#securityPunishment_list').datagrid('uncheckAll');
		  				}else{
		  					$.messager.alert('提示信息',result.msg);
		  				}
		  			}
		  		});
		     }
		});  */
	}
</script>