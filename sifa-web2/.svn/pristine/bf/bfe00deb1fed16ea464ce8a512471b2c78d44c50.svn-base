<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic }/extJs.js"
	charset="utf-8"></script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="redressStopSearchForm" class="confirmForm"
		style="padding-bottom: 10px; padding-top: 10px;">
		<div data-options="region:'east',border:true,split:false,title:'查询条件'"
			style="width: 240px;">
			<div class="easyui-layout" data-options="fit:true,border:true">
				<div region="center" border="false">
					<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
						<sys:sysGroup hiddenId="groupId" hiddenName="groupId"
							dataGridId="redressStop_list" />
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
								<td class="search-title">终止起始：</td>
								<td><input name="searchStartDate" id="searchStartDate"
									class="Wdate"
									onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" />
								</td>
							</tr>
							<tr>
								<td class="search-title">终止截止：</td>
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
						id="searchGroupBtn" iconCls="icon-search"
						onclick="javascript:$('#redressStop_list').datagrid('load' ,$.serializeObject($('#redressStopSearchForm')));">查询</a>
					&nbsp;&nbsp; <a href="#" class="easyui-linkbutton"
						id="cleanGroupBtn" iconCls="icon-undo"
						onclick="javascript:$('#redressStopSearchForm').form('clear');">清空</a>
				</div>
			</div>
		</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="redressStop_list" title="终止矫正人员列表"
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:'#redressStopToolbar',loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/endcorrect/redressStop/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-redressStop-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-linkbutton-redressStop-map').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle icon-blue'});
                        $('.organization-easyui-linkbutton-redressStop-stop').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
                        $('.organization-easyui-linkbutton-redressStop-clipboard-pencil').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-redressStop-arrow-up').linkbutton({text:'上报',plain:true,iconCls:'fi-arrow-up icon-blue'});
                        $('.organization-easyui-linkbutton-redressStop-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80">编号</th>
					<th data-options="field:'culpritName',width:80,align:'center'">矫正对象</th>
					<th
						data-options="field:'jjrq',width:80,align:'center',sortable:true,formatter:function(value,row,index){
						return formatDate(value,'yyyy-MM-dd');
					}">终止日期</th>
					<th
						data-options="field:'redresstime',width:200,align:'center',formatter:function(value,rowData,rowIndex){
					return formatDate(rowData.redressStartDate,'yyyy-MM-dd') + '至' + formatDate(rowData.redressEndDate,'yyyy-MM-dd');
				}">矫正起止时间</th>
					<th data-options="field:'activityName',width:100,align:'center'">流程状态</th>
					<th
						data-options="field:'_opt',width:250,align:'center',formatter:formatOper">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>

<div id="redressStopToolbar" style="display: none;">
	<shiro:hasPermission name="endcorrect/redressStop/add">
		<a onclick="addRedressStop();" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
	</shiro:hasPermission>

	<shiro:hasPermission name="endcorrect/redressStop/del">
		<a onclick="batchDeleteRedressStop();" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>
	</shiro:hasPermission>
</div>

<script type="text/javascript">
	function addRedressStop()
	{
		parent.$.modalDialog(
		{
			title : '新增特殊原因终止矫正',
			iconCls : 'fi-plus icon-green',
			width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
			resizable : true,
			maximizable : true,
			href : '${ctx}/endcorrect/redressStop/add',
			buttons :
			[
					{
						text : '保存',
						iconCls : 'icon-save',
						handler : function()
						{
							parent.$.modalDialog.openner_dataGrid = $(
									'#redressStop_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler
									.find('#redressStopInfo');
							f.submit();
						}
					},
					{
						text : '重置',
						iconCls : 'icon-undo',
						handler : function()
						{
							var f = parent.$.modalDialog.handler
									.find('#redressStopInfo');
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

	function batchDeleteRedressStop()
	{
		var arr = $('#redressStop_list').datagrid('getSelections');
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
					$.post('${ctx}/endcorrect/redressStop/batchDelete',
					{
						ids : ids
					}, function(result)
					{
						//1 刷新数据表格 
						$('#redressStop_list').datagrid('reload');
						//2 清空idField   
						$('#redressStop_list').datagrid('uncheckAll');
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
			var operation = '<a href="javascript:void(0);" class="organization-easyui-linkbutton-redressStop-info" '
					+ 'onclick="redressStopDetail(\'' + row.taskId
					+ '\',\'' + row.id + '\',\'' + row.auditType + '\',\''
					+ row.processInstanceId + '\')"></a>';
		}
		<shiro:hasPermission name="endcorrect/redressStop/audit">
		if (row.hasPermission == 1)
		{
			operation = operation
					+ '&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-redressStop-clipboard-pencil" '
					+ 'onclick="submitAuditredressStop(\'' + row.taskId
					+ '\',\'' + row.id + '\',\'' + row.auditType + '\',\''
					+ row.processInstanceId + '\')"></a>';
		}
		</shiro:hasPermission>
		if (row.processInstanceId != '' && row.processInstanceId != null)
		{
			var processDetailUrl = "/endcorrect/redressStop/forProcessDetail?id="
					+ row.id;
			if (row.isEnd == 1)
			{
				var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='
						+ row.processDefinitionId + '&resourceType=png';
				operation = operation
						+ '&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-redressStop-map" '
						+ 'onclick="viewProcess(\'' + url
						+ '&processDetailUrl=' + processDetailUrl + '\')"></a>';
			} else
			{
				var url = '${ctx}/flow/queryActivityMap?processInstanceId='
						+ row.processInstanceId;
				operation = operation
						+ '&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-redressStop-map" '
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
			title : '特殊情况矫正终止流程',
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
					$('#redressStop_list').datagrid().datagrid('reload');
					parent.$.modalDialog.handler.dialog('close');
				}
			} ]
		});
	}
	function submitAuditredressStop(taskId, id, auditType, processId)
	{

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
				href : '${ctx}/endcorrect/redressStop/workerPrint?id=' + id
						+ '&taskId=' + taskId + '&auditType=' + auditType
						+ '&processInstanceId=' + processId,
				buttons :
				[
						{
							text : "提交",
							iconCls : 'fi-check icon-blue',
							handler : function()
							{
								var printone = $('#redressStop_isPrintONE')
										.html();
								var printtwo = $('#redressStop_isPrintTWO')
										.html();

								//外出证明 
								if (printone == '' || printone == null
										|| printone == 'defined'
										|| printtwo == '' || printtwo == null
										|| printtwo == 'defined')
								{
									$.messager.alert(
									{
										title : '提示信息!',
										msg : '请打印后再提交!'
									});
									return false;
								}

								parent.$.modalDialog.openner_dataGrid = $(
										'#redressStop_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
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

		parent.$.modalDialog(
		{
			title : '特殊情况矫正终止审批',
			iconCls : 'fi-clipboard-pencil icon-blue',
			width : sy.getBrowerWidth() - 300,
			//width : 800,
			height : 500,
			resizable : true,
			maximizable : true,
			href : "${ctx}/endcorrect/redressStop/redressStopAudit?id=" + id
					+ "&taskId=" + taskId + "&auditType=" + auditType
					+ "&processInstanceId=" + processId,
			buttons :
			[
					{
						text : '审批',
						iconCls : 'fi-clipboard-pencil icon-blue',
						handler : function()
						{
							parent.$.modalDialog.openner_dataGrid = $(
									'#redressStop_list').datagrid(); //因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler
									.find('#redressStopAuditBtn');
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
	}

	function redressStopDetail(taskId, id, auditType, processId)
	{
		var url = '${ctx}/endcorrect/redressStop/detail?id=' + id;
		parent.$.modalDialog(
		{
			title : '特殊情况矫正终止流程详情',
			iconCls : 'fi-info icon-blue',
			width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
			resizable : true,
			maximizable : true,
			href : url,
			buttons :
			[{
				id : 'redressStopWorkerPrint1',
				text : '打印特殊原因终止矫正信息表',
				iconCls : 'fi-x icon-blue',
				handler : function()
				{
					var f = parent.$.modalDialog.handler
							.find('#redressStop_printone');
					f.click();
				}
			},
			

			{
				text : '关闭',
				iconCls : 'fi-x icon-blue',
				handler : function()
				{
					$('#redressStop_list').datagrid().datagrid('reload');
					parent.$.modalDialog.handler.dialog('close');
				}
			}

			]
		});
		
		if(auditType!='xgzryprint'&&auditType!=null&&auditType!='null'&&auditType!=''&&auditType!='undefined')	
		{
			$('#redressStopWorkerPrint1').hide();
		
		}
	}
</script>
</body>
</html>