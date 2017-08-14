<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="investigateSearchForm" class="confirmButton" style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        	<div region="center" border="false">
        	
		        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
				<sys:sysGroup hiddenId="sfsGroupId" hiddenName="sfsGroupId" dataGridId="investigate_list"/>
		        </c:if>
         		<div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
				<table>
					<tr>
						<td class="search-title">调查对象：</td>
						<td><input name="name" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">身份证号：</td>
						<td><input name="relevantNumber" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">委托单位：</td>
						<td><input name="entrustUnit" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">调查结果：</td>
						<td>
							<select id="flag" name="flag" class="easyui-combobox" panelHeight="auto" editable=false>
								<option value="">全部</option>
								<option value="0">调查中</option>
								<option value="1">调查终止</option>
								<option value="2">适合</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="search-title">委托起始：</td>
						<td>
                   			<input name="searchStartDate" id="searchStartDate" class="Wdate" 
                   			onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\',{d:-1})}'})" />
            			</td>
					</tr>
					<tr>
						<td class="search-title">委托截止：</td>
						<td><input name="searchEndDate" id="searchEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate\',{d:1})}'})" />
						</td>
					</tr>
				</table>
				</div>
			</div>
		 	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton confirmButton" id="searchGroupBtn" iconCls="icon-search" 
					onclick="javascript:$('#investigate_list').datagrid('load' ,$.serializeObject($('#investigateSearchForm')));">查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="searchGroupBtn" iconCls="icon-search" onclick="searchHistory();">历史记录</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#flag').combobox('reset');$('#investigateSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="investigate_list" title="调查评估对象列表" 
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:'#investigateToolbar',loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/investigate/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-investigate-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-linkbutton-investigate-play').linkbutton({text:'开始调查',plain:true,iconCls:'fi-play icon-blue'});
                        $('.organization-easyui-linkbutton-investigate-map').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle icon-blue'});
                        $('.organization-easyui-linkbutton-investigate-stop').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
                        $('.organization-easyui-linkbutton-investigate-finish').linkbutton({text:'结束流程',plain:true,iconCls:'fi-power icon-red'});
                        $('.organization-easyui-linkbutton-investigate-clipboard-pencil').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-investigate-arrow-up').linkbutton({text:'上报',plain:true,iconCls:'fi-arrow-up icon-blue'});
                        $('.organization-easyui-linkbutton-investigate-pencil').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-investigate-unlock').linkbutton({text:'申请解锁',plain:true,iconCls:'fi-unlock icon-blue'});
                        $('.organization-easyui-linkbutton-investigate-lock').linkbutton({text:'等待解锁',plain:true,iconCls:'fi-lock icon-blue'});
                        $('.organization-easyui-linkbutton-investigate-unlock2').linkbutton({text:'上报解锁',plain:true,iconCls:'fi-unlock icon-blue'});
                        $('.organization-easyui-linkbutton-investigate-arrow-right').linkbutton({text:'指派',plain:true,iconCls:'fi-arrow-right icon-blue'});
                    }">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true" >编号</th>
				<th data-options="field:'name',width:'7%',align:'center'" >调查对象</th>
				<th data-options="field:'relevantNumber',width:'13%',align:'center'" >身份证号</th>
				<th data-options="field:'sfsGroupName',width:'10%',align:'center'" >司法所</th>
				<th data-options="field:'groupName',width:'13%',align:'center',formatter:function(value,rowData,rowIndex){  
				    var time = formatDate(rowData.begTime, 'yyyy-MM-dd') + '至';
				    if(rowData.endTime != null)
				    {
				    	time = time + formatDate(rowData.endTime, 'yyyy-MM-dd');
				    }
				    return time;
				}">调查时间</th>
				<th data-options="field:'entrustUnit',width:'10%',align:'center'" >委托单位</th>
				<th data-options="field:'acceptedEntrustTime',width:'10%',align:'center',sortable:true,formatter:function(value,rowData,rowIndex){
					return formatDate(value, 'yyyy-MM-dd');
				}" >委托时间</th>
				<th data-options="field:'result',width:'7%',align:'center',formatter:function(value,rowData,rowIndex){
				    if(rowData.flag == 1){
				    	return '调查终止';
				    }
				    else if(rowData.auditType=='workerPrint' || rowData.isEnd==1){
				    	return '适合';
				    }
				    else return '调查中';
				}">调查结果</th>
				<th data-options="field:'activityName',width:'8%',align:'center'" >审批状态</th>
			 	<th data-options="field:'_opt',width:'20%',align:'center',formatter:formatOper">操作</th>
			</tr>
		</thead>
		</table>
	</div>
</div>
<div id="investigateToolbar" style="display: none;">
	<shiro:hasPermission name="investigate/add">
        <a onclick="addInvestigate();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'" >新增</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="investigate/del">
        <a onclick="batchDeleteInvestigate();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>
	</shiro:hasPermission>
</div>
<script type="text/javascript">
var personId = "${account.personId}";

$(function() {

});

function addInvestigate(){
	 parent.$.modalDialog({
         title : '新增调查评估',
         iconCls:'fi-plus icon-green',
         //width : sy.getBrowerWidth()-250,
         //height : sy.getBrowerHeight()*0.6,
         width : 800,
         height : 550,
         href : '${ctx}/investigate/form',
         resizable : true,
         maximizable:true, 
         buttons : [{
             text : '保存',
             iconCls:'icon-save',
             handler : function() {
                 parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                 var f = parent.$.modalDialog.handler.find('#investigateInfo');
                 f.submit();
             }
         }, {
             text : '保存并指派',
             iconCls:'fi-arrow-right icon-blue',
             handler : function() {
                 //parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                 //var f = parent.$.modalDialog.handler.find('#investigateInfo');
                 //f.submit();
            	 $('#investigateFormBtn2').click();
             }
         }, {
             text : '重置',
             iconCls:'icon-undo',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#investigateInfo');
            	 f.get(0).reset(); //清空表单数据 
             }
         },{
             text : '关闭',
             iconCls:'fi-x icon-blue',
             handler : function() {
             	parent.$.modalDialog.handler.dialog('close');
             }
         }]
     });
}

function batchDeleteInvestigate(){
	var arr = $('#investigate_list').datagrid('getSelections');
	if (arr.length <= 0) {
		$.messager.show({
			title : '提示信息!',
			msg : '至少选择一行记录进行删除!'
		});
	} 
	else {
		$.messager.confirm('提示信息', '确认删除?', function(r) {
			if (r) {
				var ids = '';
				for (var i = 0; i < arr.length; i++) {
					if (i == 0) {
						ids += arr[i].id
					} else {
						ids += "," + arr[i].id;
					}
				}
				//ids = ids.substring(0, ids.length - 1);
				$.post('${ctx}/investigate/batchDelete', {
					ids : ids
				}, function(result) {
					//1 刷新数据表格 
					$('#investigate_list').datagrid('reload');
					//2 清空idField   
					$('#investigate_list').datagrid('uncheckAll');
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

function formatOper(val,row,index){
	var space = '&nbsp;';
	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-investigate-info" '
		+'onclick="investigateDetail(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"></a>';
	if (row.hasPermission==1) {
		if (row.auditType == 'jzkAssign') {
			<shiro:hasPermission name="investigate/assign">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-investigate-arrow-right" '
			+'onclick="startAssign(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"></a>';
			</shiro:hasPermission>
		}
		else if (row.auditType == 'sfsCheck'){
			<shiro:hasPermission name="investigate/start">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-investigate-play" '
			+'onclick="startProcess(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"></a>';
			</shiro:hasPermission>
		}
		else if (row.auditType == 'workerReport'){
			<shiro:hasPermission name="investigate/report">
			if(row.investigatorId1 == personId || row.investigatorId2 == personId) {
				operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-investigate-pencil" '
				+'onclick="updateProcess(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"></a>';
			}
			</shiro:hasPermission>
		}
		else if (row.auditType == 'szCheck'){
			<shiro:hasPermission name="investigate/sfscheck">
			if(row.applyUnLock == '2'){
				operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-investigate-unlock" '
				+'onclick="reportUnLockProcess(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"></a>';
			}
			else if(row.applyUnLock == '1'){
				operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-investigate-lock" '
				+'onclick="waitUnLock()"></a>';
			}
			else operation=operation+space+'&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-investigate-arrow-up" '
			+'onclick="reportProcess(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\',\''+row.applyUnLock+'\')"></a>';
			</shiro:hasPermission>
		}
		else if (row.auditType == 'reportUnlocked'){
			<shiro:hasPermission name="investigate/unlock">
			operation=operation+space+'&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-investigate-unlock2" '
			+'onclick="unLockProcess(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"></a>';
			</shiro:hasPermission>
		}
		else if (row.auditType == 'jzkCheck' || row.auditType == 'fzkCheck' || row.auditType == 'xfgCheck'){
			<shiro:hasPermission name="investigate/check">
			operation=operation+space+'&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-investigate-clipboard-pencil" '
			+'onclick="reportProcess(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\',\''+row.applyUnLock+'\')"></a>';
			</shiro:hasPermission>
		}
		else if (row.auditType == 'workerPrint'){
			//工作人员 有打印权限
			<shiro:hasPermission name="investigate/print">
			operation=operation+space+'&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-investigate-clipboard-pencil" '
			+'onclick="reportProcess(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"></a>';
			</shiro:hasPermission>
		}
		else {
			
			
		}
	
		
		
	}
	
	if (row.processInstanceId!='' && row.processInstanceId!=null) {
		var processDetailUrl="/investigate/forProcessDetail?id="+row.id;
		if(row.isEnd==1){
			var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-investigate-map" '
			+'onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')"></a>';
		}else{
			var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-investigate-map" '
			+'onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')"></a>';
		}
	}
	
	/* if (row.processInstanceId!='' && row.processInstanceId!=null) {
		if (row.isEnd==0 && row.hasPermission==1) {
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-investigate-stop" '
			+'onclick="stopProcess(\''+row.id+'\',\''+row.taskId+'\')"></a>';
		}
	} */
	if (row.hasPermission==1) {
		<shiro:hasPermission name="investigate/stop">
		if (row.auditType == 'sfsCheck') {
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-investigate-stop" '
			+'onclick="stopProcessBySfsCheck(\''+row.id+'\',\''+row.taskId+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"></a>';
		}
		else {
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-investigate-stop" '
			+'onclick="stopProcess(\''+row.taskId+'\')"></a>';
		}
		</shiro:hasPermission>
	}
    return operation;
}

function viewProcess(url){
	parent.$.modalDialog({
        title : '调查评估流程',
        iconCls:'fi-shuffle icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        resizable : true,
        maximizable:true, 
        href : url,
        buttons : [{
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
            	parent.$.modalDialog.handler.dialog('close');
            }
        }]
    });
}
function startAssign(taskId,id,auditType,processId){
	parent.$.modalDialog({
        title : '调查评估指派',
        iconCls:'fi-arrow-right icon-blue',
        width : 800,
        height : 550,
        href : "${ctx}/investigate/assign?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
        resizable : true,
        maximizable:true, 
        buttons : [  {
        	id : 'saveOfAssign',
            text : '保存',
            iconCls:'fi-save icon-blue',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#investigateAssign3');
                f.click();
            }
        }, {
            text : '指派',
            iconCls:'fi-arrow-right icon-blue',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#investigateAssign1');
                f.click();
            }
        }, {
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
            	parent.$.modalDialog.handler.dialog('close');
            }
        } ]
    });
	
	//$('#saveOfAssign').hide();
}
function startProcess(taskId,id,auditType,processId){
	parent.$.modalDialog({
        title : '调查评估受理',
        iconCls:'fi-play icon-blue',
        width : sy.getBrowerWidth()-250,
        height : 500,
        href : "${ctx}/investigate/investigatePush?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
        resizable : true,
        maximizable:true, 
        buttons : [{
            text : '提交',
            iconCls:'fi-arrow-up icon-blue',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#investigatePush');
                f.submit();
            }
        }, {
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
            	parent.$.modalDialog.handler.dialog('close');
            }
		}]
	});
}
function updateProcess(taskId,id,auditType,processId){
	parent.$.modalDialog({
        title : '调查评估内容',
        iconCls:'fi-pencil icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        href : "${ctx}/investigate/investigateWorkerReport?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
        resizable : true,
        maximizable:true, 
        buttons : [{
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#workerReportBtn1');
                f.click();
            }
        }, {
            text : '草拟评估意见上报',
            iconCls:'fi-arrow-up icon-blue',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#workerReportBtn2');
                f.click();
            }
        }, {
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
            	//$('#investigate_list').datagrid().datagrid('reload');
            	//parent.$.modalDialog.handler.dialog('close');
                parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
            	var f = parent.$.modalDialog.handler.find('#workerReportBtn3');
                f.click();
            }
        }]
    });
}
function reportProcess(taskId,id,auditType,processId,applyUnLock){
	

	if(auditType=='workerPrint')
	{
		parent.$.modalDialog(
				{
					title : '文书打印',
					iconCls : 'fi-print icon-blue',
					width : 500,
					height : 300,
					resizable : true,
					maximizable : true,
					href : '${ctx}/investigate/workerPrint?id=' + id
							+ '&taskId=' + taskId + '&auditType=' + auditType
							+ '&processInstanceId=' + processId,
					buttons :
					[
							{
								text : "提交",
								iconCls : 'fi-check icon-blue',
								handler : function()
								{
									
									var printYJS=$('#investigate_isPrintYJS').html() ;
									var printDCB=$('#investigate_isPrintDCB').html() ;
									var printSPB=$('#investigate_isPrintSPB').html() ;
								
									if (printYJS== ''||printYJS == null||printYJS == 'undefined'||printDCB== ''||printDCB == null||printDCB == 'undefined'||printSPB== ''||printSPB == null||printSPB == 'undefined')
									{
									
										$.messager.alert(
										{
											title : '提示信息!',
											msg : '请打印后再提交!'
										});
										return false;
									}

									parent.$.modalDialog.openner_dataGrid = $(
											'#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好

									var f = parent.$.modalDialog.handler
											.find('#investigate_inform_btn');
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
		
		
		
	}else
	{

		
		parent.$.modalDialog({
	        title : '调查评估上报',
	        iconCls:'fi-arrow-up icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        resizable : true,
	        maximizable:true, 
	        href : "${ctx}/investigate/investigateReport?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
	        buttons : [{
	            text : '审核',
	            iconCls:'fi-clipboard-pencil icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#reportBtn2');
	                f.click();
	            }
	        }, {
	            text : '退回',
	            iconCls:'fi-arrow-left icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#reportBtn3');
	                f.click();
	            }
	        }, {
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	            	$('#investigate_list').datagrid().datagrid('reload');
	            	parent.$.modalDialog.handler.dialog('close');
	            }
	        }]
	    });
	}
	
	
	
}
function unLockProcess(taskId,id,auditType,processId){
	parent.$.modalDialog({
        title : '调查评估解锁',
        iconCls:'fi-unlock icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        resizable : true,
        maximizable:true, 
        href : "${ctx}/investigate/investigateReport?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
        buttons : [{
            text : '上报解锁',
            iconCls:'fi-unlock icon-green',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#reportBtn1');
                f.click();
            }
        }, {
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
            	//$('#investigate_list').datagrid().datagrid('reload');
            	//parent.$.modalDialog.handler.dialog('close');
                parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
            	var f = parent.$.modalDialog.handler.find('#reportBtn4');
                f.click();
            }
        }]
    });
}
function waitUnLock(){
	$.messager.show({
		title : "提示信息",
		msg : "已经申请上报解锁，请等待县局解锁处理"
	});
}
function reportUnLockProcess(taskId,id,auditType,processId){
	progressLoad();
	$.ajax({
		type : 'post',
		url : '${ctx}/investigate/investigateAudit?type=1&id=' + id + '&taskId=' + taskId + '&auditType=' + auditType,
		dataType : 'json',
		cache : false,
		async : false, //同步请求
		success : function(result) {
        	progressClose();
			$.messager.show({
				title : '提示信息',
				msg : '解锁成功'
			});

			$('#investigate_list').datagrid('reload');
			//2 清空idField   
			$('#investigate_list').datagrid('uncheckAll');
		},
		error : function(result) {
        	progressClose();
			$.messager.show({
				title : '提示信息',
				msg : '解锁失败'
			});
		}
	});
}
function investigateDetail(taskId,id,auditType,processId){
	var url = '${ctx}/investigate/detail?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId;
	parent.$.modalDialog({
        title : '调查评估详情',
        iconCls:'fi-info icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        resizable : true,
        maximizable:true, 
        href : url,
        buttons : [ {
        	id : 'listWorkerPrint1',
            text : '打印调查评估意见书',
            iconCls:'fi-print icon-blue',
            handler : function() {
                var f = parent.$.modalDialog.handler.find('#workerPrint1');
                f.click();
            }
        }, {
        	id : 'listWorkerPrint2',
            text : '打印审前社会调查表',
            iconCls:'fi-print icon-blue',
            handler : function() {
                var f = parent.$.modalDialog.handler.find('#workerPrint2');
                f.click();
            }
        }, {
        	id : 'listWorkerPrint3',
            text : '打印审前社会调查审批表',
            iconCls:'fi-print icon-blue',
            handler : function() {
            	var f = parent.$.modalDialog.handler.find('#workerPrint3');
                f.click();
            }
        }, {
        	id : 'listWorkerPrint5',
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
            	parent.$.modalDialog.handler.dialog('close');
            }
        }]
	});
	
	if(auditType != 'workerPrint' &&auditType !=''&&auditType !=null&&auditType != 'null'&&auditType != 'undefined')
	{
		$('#listWorkerPrint1').hide();
		$('#listWorkerPrint2').hide();
		$('#listWorkerPrint3').hide();
	}
	
	
	
	
}

function stopProcess(taskId) {
	$.messager.confirm('提示', '终止后不可再进行操作?', function(b) {
		if (b) {
			$.ajax({
				type : 'get',
				url : "${ctx}/investigate/stopProcess?taskId=" + taskId,
				cache : false,
				async : false, //同步请求
				dataType : 'json',
				success : function(result) {
					if(result.status==200){
	  					$.messager.show({
		  					title : '提示信息!',
		  					msg : '终止成功!'
		  				});
	  				}
	  				$('#investigate_list').datagrid('reload',{});
				}
			});
		}
	});
}

function stopProcessBySfsCheck(id,taskId,auditType,processId){
	var url = '${ctx}/investigate/investigateStopProcess?id='+id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId;
	parent.$.modalDialog({
        title : '调查评估终止',
        iconCls:'fi-power icon-red',
        width : 600,
        height : 250,
        resizable : true,
        maximizable:true, 
        href : url,
        buttons : [ {
        	id : 'listStop1',
            text : '提交',
            iconCls:'fi-check icon-blue',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
            	var f = parent.$.modalDialog.handler.find('#investigateStopBtn1');
                f.click();
            }
        }, {
        	id : 'listStop2',
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
            	parent.$.modalDialog.handler.dialog('close');
            }
        } ]
    });
}

function finishProcess(id,taskId,auditType,processId){
	$.messager.confirm('提示信息', '是否确定结束流程?', function(b) {
	      if (b){  
	    	  $.ajax({
	  			type : 'post',
	  			//url : "${ctx}/investigate/stopProcess?id=" + id + "&taskId=" + taskId,
	  			url : '${ctx}/investigate/investigateAudit?type=1&id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
	  			cache : false,
	  			async : false, //同步请求
	  			dataType : 'json',
	  			success : function(result) {
	  				if(result.status==200){
						$('#investigate_list').datagrid('reload');
						//2 清空idField   
						$('#investigate_list').datagrid('uncheckAll');
	  				}else{
	  					$.messager.alert('提示信息',result.msg);
	  				}
	  			}
	  		});
	      }
	});  
}

//历史记录
function searchHistory(){
	var o = $.serializeObject($('#investigateSearchForm'));
	o['noteqflag'] = '0';
	$('#investigate_list').datagrid('load' ,o);
}
</script>