<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>审前调查</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>


<body class="easyui-layout" id="lay">
	<div region="north" border="false" collapsed="false" title="搜索条件"
		style="height: 100px; overflow: hidden;">
		<form id="searchForm">
			<table>
				<tr>
					<td>姓&nbsp;名:<input name="name" class="easyui-textbox" style="width:60%"/>&nbsp;</td>
					<td>委托单位:<input name="entrustUnit" class="easyui-textbox" style="width:60%"/>&nbsp;</td>
					<td>调查单位：<select id="sysGroupId" name="sfsGroupId" class="easyui-combotree" style="width: 80%;"
    				data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true"></select></td>
				</tr>
				<tr>
					<td>收到委托时间:<input id="searchStartDate" name="searchStartDate" class="easyui-datetimebox" data-options="showSeconds:true" editable="false" style="width:100px;"/>&nbsp;</td>
					<td>&nbsp;至&nbsp;<input id="searchEndDate" name="searchEndDate" class="easyui-datetimebox" data-options="showSeconds:true" editable="false" style="width:100px;"/>&nbsp;</td>
					<td colspan="2"><a href="javascript:void(0);" class="easyui-linkbutton" id="searchbtn">搜索</a>
					<a href="javascript:void(0);" class="easyui-linkbutton" onclick="cleanSearch();">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div region="center" border="false">
		<div id="toolbar" style="height:auto">
			<c:if test="${account.roleId == '3002' || account.roleId == '3003'}">
			<a id="tbAdd" href="#" class="easyui-linkbutton" style="float: left;" iconCls="icon-add" plain="true"><span style="color: black;">新增</span></a>
			<div class="datagrid-btn-separator"></div>
			</c:if>
			<c:if test="${account.roleId == '3002' || account.roleId == '3003'}">
			<a id="tbModify" href="#" class="easyui-linkbutton" style="float: left;" iconCls="icon-edit" plain="true"><span style="color: black;">修改</span></a>
			<div class="datagrid-btn-separator"></div>
			</c:if>
			<c:if test="${account.roleId == '3002' || account.roleId == '2006' || account.roleId == '2002' || account.roleId == '2003'}">
			<a id="tbBatchDelete" href="#" class="easyui-linkbutton" style="float: left;" iconCls="icon-remove" plain="true"><span style="color: black;">删除</span></a>
			<div class="datagrid-btn-separator"></div>
			</c:if>
			<a id="tbSearch" href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true"><span style="color: black;">查询</span></a>
		</div>
		
		<table class="easyui-datagrid" id="t_list_content" title="审前调查列表"
			style="height: 400px;" 
			data-options="singleSelect:false,collapsible:true,striped:true,toolbar:'#toolbar',loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/investigate/list',method:'post'">
			
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80">编号</th>
					<th data-options="field:'name',width:80,align:'center'" editor="text">姓名</th>
					<th data-options="field:'relevantNumber',width:100,align:'center'" editor="text" >相关证件号</th>
					<th data-options="field:'sfsGroupName',width:100,align:'center'" editor="text" >司法所</th>
					<th data-options="field:'groupName',width:100,align:'center',formatter:function(value,rowData,rowIndex){  
					    var time = Common.formatDate(rowData.begTime) + '至';
					    if(rowData.endTime != null)
					    {
					    	time = time + Common.formatDate(rowData.endTime);
					    }
					    return time;
					}" editor="text" >调查时间</th>
					<th data-options="field:'entrustUnit',width:100,align:'center'" editor="text" >委托单位</th>
					<th data-options="field:'acceptedEntrustTime',width:100,align:'center',sortable:true,formatter:Common.formatDate" editor="text" >委托时间</th>
					<th data-options="field:'result',width:100,align:'center'" editor="text" >调查结果</th>
					<th data-options="field:'activityName',width:100,align:'center'" editor="text">审批状态</th>
				 <th data-options="field:'_opt',width:250,formatter:formatOper">操作</th>  

				</tr>
			</thead>
		</table>
	</div>


	<div id="mydialog" title="新增请假" modal=true draggable=true class="easyui-dialog" closed=true style="width: 700px;">
		<div id="mask" class="mask"></div>
		<form id="myform" action="" method="post" >
			<div id="tabAdd" class="easyui-tabs" >
				<div title="基本信息" data-options="iconCls:'icon-view'" style="padding: 5px 5px">
					<input type="hidden" id="id" name="id" value="" />
					<table>
						<tr>
							<td><span style="color: red;"><strong>*</strong></span>委托单位性质:</td>
							<td>
							<input id="dicEntrustUnitTypeKey" name="dicEntrustUnitTypeKey" class="easyui-combobox" required=true editable=false style="width:173px;"  
    				data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_investigate&columnName=DIC_ENTRUST_UNIT_TYPE_KEY&parentKey=85000',panelHeight:'auto'">
                    		</td>
							<td><span style="color: red;"><strong>*</strong></span>收到委托日期:</td>
							<td><input id="acceptedEntrustTime" name="acceptedEntrustTime" class="easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" required="true"/></td>
						</tr>
						
						<tr>
							<td><span style="color: red;"><strong>*</strong></span>委托单位:</td>
							<td><input id="entrustUnit" name="entrustUnit" class="easyui-validatebox" value="" required="true"/></td>
							<td><span style="color: red;"><strong>*</strong></span>性别:</td>
							<td><input id="dicSexKey" name="dicSexKey" class="easyui-combobox" required=true editable=false style="width:173px;"  
    				data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=sex&parentKey=10000',panelHeight:'auto'">
    						</td>
						</tr>
						
						<tr>
							<td><span style="color: red;"><strong>*</strong></span>被调查对象姓名:</td>
							<td><input id="name" name="name" class="easyui-validatebox" value=""  required="true"/></td>
							<td>别名:</td>
							<td><input name="alias" class="easyui-validatebox" value="" /></td>
						</tr>
						
						<tr>
							<td>曾用名:</td>
							<td><input name="oldName" class="easyui-validatebox" value="" /></td>
							<td>相关证件号:</td>
							<td><input id="relevantNumber" name="relevantNumber" class="easyui-validatebox" value="" /></td>
						</tr>
						
						<tr>
							<td>户籍类型:</td>
							<td><input id="dicResudenceKey" name="dicResudenceKey" class="easyui-combobox" required=true editable=false style="width:173px;"  
    				data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=hklx&parentKey=12000',panelHeight:'auto'">
							</td>
							<td><span style="color: red;"><strong>*</strong></span>户籍所在地:</td>
							<td><input id="regResudence" name="regResudence" class="easyui-validatebox" value="" required="true"/></td>
						</tr>
						
						<tr>
							<td><span style="color: red;"><strong>*</strong></span>出生日期:</td>
							<td><input id="bornDate" name="bornDate" class="easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" required="true" /></td>
							<td>籍贯:</td>
							<td><input name="origin" class="easyui-validatebox" value="" /></td>
						</tr>
						
						<tr>
							<td>民族:</td>
							<td><input name="nation" class="easyui-validatebox" value="" /></td>
							<td><span style="color: red;"><strong>*</strong></span>经常居住地:</td>
							<td><input id="habitualResidence" name="habitualResidence" class="easyui-validatebox" value="" required="true"/></td>
						</tr>
						
						<tr>
							<td>联系方式:</td>
							<td><input id="contactPhone" name="contactPhone" class="easyui-validatebox" value="" /></td>
							<td>拟提请类型:</td>
							<td><input id="entrustTypeId" name="entrustTypeId" class="easyui-combobox" required=true editable=false style="width:173px;"  
    				data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_investigate&columnName=entrust_type_id&parentKey=20000',panelHeight:'auto'">
							</td>
						</tr>
						
						<tr>
							<td><span style="color: red;"><strong>*</strong></span>调查司法所:</td>
							<!-- 
							<td><input id="sfsGroupId" name="sfsGroupId" class="easyui-combobox" 
							url="${ctx}/investigate/findSfsGroup" valueField="id" textField="name" value="" required="true" editable="false" />
							<input type="hidden" id="sfsGroupName" name="sfsGroupName" class="easyui-validatebox" value=""/></td>
							 -->
							<td id=""><select id="sysGroupId" name="sfsGroupId" class="easyui-combotree addSfsGroupId" required=true style="width: 173px;"
    						data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true"></select>
							<input type="hidden" id="sfsGroupName" name="sfsGroupName" class="easyui-validatebox" value=""/></td>
							<td><span style="color: red;"><strong>*</strong></span>案由:</td>
							<td><input id="crimeReason" name="crimeReason" class="easyui-validatebox" value="" required="true"/></td>
						</tr>
						
						<tr>
							<td>住址:</td>
							<td><input id="address" name="address" class="easyui-validatebox" value="" /></td>
							<td>职业:</td>
							<td><input name="job" class="easyui-validatebox" value="" /></td>
						</tr>
						
						<tr>
							<td>委托调查函:</td>
							<td><a id="upload" class="easyui-linkbutton" data-options="iconCls:'icon-add'">上传</a></td>
						</tr>
						<tr>
							<td>已上传附件:</td>
							<td><input name="wtdchPath" class="easyui-validatebox" value="wtdchPath" /></td>
						</tr>
						
						<tr align="center">
							<td colspan="2"><a id="btn1" class="easyui-linkbutton">确定</a>
								<a id="btn2" class="easyui-linkbutton">关闭</a></td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>
	
	<div id="dd"></div>  

</body>
<script type="text/javascript">
	var personId = "${account.personId}";
	var flag; //undefined 判断新增和修改方法
	
	/* toolbar工具栏方法 	*/
	$('#tbAdd').click(function(){
		flag = 'add';
		$('#mydialog').dialog({
			title : '新增用户'
		});
		$('#myform').get(0).reset();
		resetcombobox();//清空下拉框选择
		
		$('#mydialog').dialog('open');
	});
	
	$('#tbModify').click(function(){
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
			resetcombobox();//清空下拉框选择

			$('#myform').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
				id : arr[0].id,
				acceptedEntrustTime : Common.formatDate(arr[0].acceptedEntrustTime),
				entrustUnit : arr[0].entrustUnit,
				name : arr[0].name,
				alias : arr[0].alias,
				oldName : arr[0].oldName,
				relevantNumber : arr[0].relevantNumber,
				regResudence : arr[0].regResudence,
				bornDate : Common.formatDate(arr[0].bornDate),
				origin : arr[0].origin,
				nation : arr[0].nation,
				habitualResidence : arr[0].habitualResidence,
				contactPhone : arr[0].contactPhone,
				crimeReason : arr[0].crimeReason,
				address : arr[0].address,
				job : arr[0].job,
				sfsGroupName : arr[0].sfsGroupName,
				entrustTypeId : arr[0].entrustTypeId,
				dicSexKey : arr[0].dicSexKey,
				dicResudenceKey : arr[0].dicResudenceKey,
				dicEntrustUnitTypeKey : arr[0].dicEntrustUnitTypeKey
			});
			
			$('.addSfsGroupId').combotree('setValue',arr[0].sfsGroupId);
		}
	});

	$('#tbBatchDelete').click(function(){
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
							ids += arr[i].id
						} else {
							ids += "," + arr[i].id;
						}
					}
					$.post('${ctx}/investigate/batchDelete', {
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
	});

	$('#tbSearch').click(function(){
		$('#lay').layout('expand', 'north');
	});
	
	/* var toolbar = [ {
		text : '新增',
		iconCls : 'icon-add',
		handler : function() {
			flag = 'add';
			$('#mydialog').dialog({
				title : '新增用户'
			});
			$('#myform').get(0).reset();
			resetcombobox();//清空下拉框选择
			
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
				resetcombobox();//清空下拉框选择

				$('#myform').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
					id : arr[0].id,
					acceptedEntrustTime : Common.formatDate(arr[0].acceptedEntrustTime),
					entrustUnit : arr[0].entrustUnit,
					name : arr[0].name,
					alias : arr[0].alias,
					oldName : arr[0].oldName,
					relevantNumber : arr[0].relevantNumber,
					regResudence : arr[0].regResudence,
					bornDate : Common.formatDate(arr[0].bornDate),
					origin : arr[0].origin,
					nation : arr[0].nation,
					habitualResidence : arr[0].habitualResidence,
					contactPhone : arr[0].contactPhone,
					crimeReason : arr[0].crimeReason,
					address : arr[0].address,
					job : arr[0].job,
					sfsGroupName : arr[0].sfsGroupName,
					entrustTypeId : arr[0].entrustTypeId,
					dicSexKey : arr[0].dicSexKey,
					dicResudenceKey : arr[0].dicResudenceKey,
					dicEntrustUnitTypeKey : arr[0].dicEntrustUnitTypeKey
				});
				
				$('.addSfsGroupId').combotree('setValue',arr[0].sfsGroupId);
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
								ids += arr[i].id
							} else {
								ids += "," + arr[i].id;
							}
						}
						$.post('${ctx}/investigate/batchDelete', {
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
	}]; */

	/**
	 *  提交表单方法
	 */
	$('#btn1').click(function() {
		if ($('#myform').form('validate')) {
			var wtdwxz = $('#dicEntrustUnitTypeKey').combobox('getText');
			var wtdw = $('#entrustUnit').val();
			if (wtdw.lastIndexOf(wtdwxz) != (wtdw.length-wtdwxz.length)) {
				$.messager.show({
					title : '提示信息!',
					msg : '委托单位后缀名必须是相应性质单位!'
				});
				return ;
			}
			$.ajax({
				type : 'post',
				url : '${ctx}/investigate/save',
				cache : false,
				data : $('#myform').serialize(),
				dataType : 'json',
				beforeSend :function (){
				},
				success : function(result) {
					$('#myform').get(0).reset(); //清空表单数据 
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
					$.messager.show({
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
	
	//取消搜索
	function cleanSearch() {
		$('#t_list_content').datagrid('load', {});
		//$('#searchForm').get(0).reset();
		$('#searchForm').form().find('input').val('');
	}
	
	$(function() {
		//
		$('#t_list_content').datagrid({
			fit : true
		});
		
		/**
		 * 关闭窗口方法
		 */
		$('#btn2').click(function() {
			$('#mydialog').dialog('close');
		});

		//搜索
		$('#searchbtn').click(function() {
			$('#t_list_content').datagrid('load', serializeForm($('#searchForm')));
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
	
	//？？？
	function delHsCode(index) {  
        $('#Hsdata').datagrid('selectRow', index);  
        var row = $('#Hsdata').datagrid('getSelected');  
        if (row.Id != null && row.Id !== undefined)  
        alert(row.Id);  
    }
	
	function formatOper(val,row,index){
		var operation='<a href="javascript:void(0);" onclick="investigateDetail(\''+row.id+'\')"><span style="color:blue;">详情</span></a>';
		
		if (row.hasPermission==1) {
			if (row.auditType == 'sfsCheck'){
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="startProcess(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"><span style="color:blue;">开始调查</span></a>';
			}
			else if (row.auditType == 'workerReport'){
				if(row.investigatorId1 == personId || row.investigatorId2 == personId) {
					operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="updateProcess(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"><span style="color:blue;">修改</span></a>';
				}
			}
			else if (row.auditType == 'szCheck'){
				if(row.applyUnLock == '2'){
					operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="reportUnLockProcess(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"><span style="color:blue;">申请解锁</span></a>';
				}
				else if(row.applyUnLock == '1'){
					operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="waitUnLock()"><span style="color:blue;">等待解锁</span></a>';
				}
				else operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="reportProcess(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"><span style="color:blue;">上报</span></a>';
			}
			else if (row.auditType == 'reportUnlocked'){
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="unLockProcess(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"><span style="color:blue;">上报解锁</span></a>';
			}
			else if (row.auditType == 'jzkCheck'){
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="reportProcess(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"><span style="color:blue;">评定</span></a>';
			}
			else if (row.auditType == 'fzkCheck'){
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="reportProcess(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"><span style="color:blue;">评定</span></a>';
			}
			else if (row.auditType == 'xfgCheck'){
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="reportProcess(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')"><span style="color:blue;">审批</span></a>';
			}
			else {
				
			}
		}
		if (row.processInstanceId!='' && row.processInstanceId!=null) {
			if (row.isEnd==1) {
				var url = '${ctx}/flow/queryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="viewProcess(\''+url+'\')"><span style="color:blue;">查看流程</span></a>';
			} else {
				var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="viewProcess(\''+url+'\')"><span style="color:blue;">查看流程</span></a>';
			}
		}
		if (row.processInstanceId!='' && row.processInstanceId!=null) {
			if (row.isEnd==0) {
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="stopProcess(\''+row.taskId+'\')"><span style="color:blue;">终止</span></a>';
			}
		}
		
	    return operation;
	} 
	function viewProcess(url){
		open_layer('审前调查流程',url);
	}
	
	function submitAuditInvestigate(taskId,id,auditType,processId){
		open_layer("审前调查审批","${ctx}/investigate/investigateAudit?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId);
	}
	function startProcess(taskId,id,auditType,processId){
		open_layer("审前调查受理","${ctx}/investigate/investigatePush?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId);
	}
	function updateProcess(taskId,id,auditType,processId){
		open_layer("审前调查内容","${ctx}/investigate/investigateWorkerReport?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId);
	}
	function reportProcess(taskId,id,auditType,processId){
		open_layer("审前调查上报","${ctx}/investigate/investigateReport?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId);
	}
	function unLockProcess(taskId,id,auditType,processId){
		open_layer("审前调查解锁","${ctx}/investigate/investigateReport?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId);
	}
	function waitUnLock(){
		$.messager.show({
			title : "提示信息",
			msg : "请等待县局解除上报锁定"
		});
	}
	function reportUnLockProcess(taskId,id,auditType,processId){
		$.ajax({
			type : 'post',
			url : '${ctx}/investigate/investigateAudit?type=1&id=' + id + '&taskId=' + taskId + '&auditType=' + auditType,
			dataType : 'json',
  			cache : false,
  			async : false, //同步请求
			success : function(result) {
				$.messager.show({
					title : result.status == 200 ? "ok" : "fail",
					msg : result.msg
				});

				$('#t_list_content').datagrid('reload');
				//2 清空idField   
				$('#t_list_content').datagrid('uncheckAll');
			},
			error : function(result) {
				$.messager.show({
					title : result.status == 200 ? "ok" : "fail",
					msg : result.msg
				});
			}
		});
	}
	
	function investigateDetail(id){
		var url = '${ctx}/investigate/detail?id=' + id;
		open_layer('审前调查详情',url);
	}
	
	function stopProcess(taskId){
		$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
		      if (b){  
		    	  $.ajax({
		  			type : 'get',
		  			url : "${ctx}/investigate/stopProcess?taskId=" + taskId,
		  			cache : false,
		  			async : false, //同步请求
		  			dataType : 'json',
		  			success : function(result) {
		  				if(result.status==200){
							$('#t_list_content').datagrid('reload');
							//2 清空idField   
							$('#t_list_content').datagrid('uncheckAll');
		  				}else{
		  					alert(result.msg);
		  				}
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
	
	//timestamp转换date
	var Common = {
	    formatDate: function (value) {
	        if (value == null || value == '') {
	            return '';
	        }
	        var dt;
	        if (value instanceof Date) {
	            dt = value;
	        } else {
	            dt = new Date(value);
	        }
	        return dt.format("yyyy-MM-dd"); //扩展的Date的format方法(上述插件实现)
	    }
	}
	
	//清除easyui中combobox的选择
	function resetcombobox(){
		$('#id').val('');
		$('.addSfsGroupId').combotree('setValue','');
		$('#dicSexKey').combobox('setValue','');
		$('#dicEntrustUnitTypeKey').combobox('setValue','');
		$('#dicResudenceKey').combobox('setValue','');
		$('#entrustTypeId').combobox('setValue','');
	}
	
	//选择司法所时赋值司法所名称
	$('.addSfsGroupId').combotree({
		onSelect:function(record){ 
			$('#sfsGroupName').val(record.text);
		}
    });

	
	//测试新增用
	$('#dicEntrustUnitTypeKey').combobox({
		onChange:function(){
			if ($('#dicEntrustUnitTypeKey').combobox('getValue') != 0) {
				if (flag == 'add') {
					var test = $('#dicEntrustUnitTypeKey').combobox('getText');
					$('#acceptedEntrustTime').val('2017-03-23');
					$('#entrustUnit').val('测试数据' + test);
					$('#bornDate').val('2000-03-23');
					$('#name').val(test + '测试人员');
					$('#crimeReason').val(test + '杀人案');
					$('#habitualResidence').val(test + '测试地点xxxxxx');
					$('#regResudence').val(test + '测试地点12345123');
					$('#relevantNumber').val('330324111111114569');
					$('#contactPhone').val('15166666666');
					$('#address').val(test + '测试住址123xxx');
					
					$(".addSfsGroupId").combotree('setValue','71');
					$("#sfsGroupName").val('新桥司法所');
					$('#dicSexKey').combobox('setValue', '10002');
					$('#dicResudenceKey').combobox('setValue', '12002');
					$('#entrustTypeId').combobox('setValue', '20003');
				}
			}
		}
    });
</script>

</html>
