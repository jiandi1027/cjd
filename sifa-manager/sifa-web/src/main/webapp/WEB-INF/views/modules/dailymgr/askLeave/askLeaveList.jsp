<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>请假管理</title>
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
					<td>
						<select id="sysGroupId" name="sysGroup.id" class="easyui-combotree" style="width: 80%;"
    data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true">
</select>
						
					</td>
					<td width="15%" align="right">请假人</td>
					<td>
						<input name="culprit.name" class="easyui-textbox"
						 style="width: 80%;" />
					</td>
					<td width="15%" align="right">请假状态</td>
					<td>
						<input id="dicStatusKey" class="easyui-combobox" name="dicStatusKey"   
    data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getListByTabColumnName?tabName=sf_askleave&columnName=dic_status_key'" />  

					</td>
				</tr>
				
				<tr>
					<td width="15%" align="right">请假开始时间
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
		<table class="easyui-datagrid" id="t_list_content" title="请假列表"
			style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,striped:true,toolbar:toolbar,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/askLeave/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80">编号</th>
					<th data-options="field:'culpritName',width:80,align:'center',formatter:function(value,rowData,rowIndex){  
    //可以试试这个对不对  
    //return value.name;  
    if(rowData.culprit!=null){
    return rowData.culprit.name; 
    }
     
}"
						editor="{type:'validatebox',options:{required:true}}">姓名</th>
					<th data-options="field:'groupName',width:100,align:'center',formatter:function(value,rowData,rowIndex){  
    //可以试试这个对不对  
    //return value.name;  
    if(rowData.sysGroup!=null){
    return rowData.sysGroup.name; 
    }
     
}"
						editor="text" editor="{type:'numberbox',options:{required:true}}">司法所</th>
					<th data-options="field:'place',width:250,align:'center'"
						editor="text">请假目的地</th>
						<th data-options="field:'leaveDays',width:70,align:'center'"
						editor="text">请假天数</th>
					<th
						data-options="field:'beginDate',width:200,align:'center',sortable:true"
						editor="{type:'validatebox',options:{required:true}}">请假开始时间</th>
					<th data-options="field:'endDate',width:200,align:'center'"
						editor="text">请假结束时间</th>
					<th data-options="field:'dicStatusKey',width:250,align:'center',formatter:formatStatusKey"
						editor="text">请假状态</th>
					<th data-options="field:'activityName',width:100,align:'center'"
						editor="text">审批状态</th>
				 <th data-options="field:'_opt',width:250,formatter:formatOper">操作</th>  

				</tr>
			</thead>
		</table>
	</div>


	<div id="mydialog" title="新增请假" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 700px;">

		<form id="myform" action="" method="post">
			<div id="tabAdd" class="easyui-tabs">
				<div title="基本信息" data-options="iconCls:'icon-view'"
					style="padding: 5px 5px">
					<input type="hidden" name="id" value="" />
					<table>
						<tr>
							<td>矫正对象:</td>
							<td><input name="culpritId" class="easyui-combobox"
								url="${ctx}/culpritinfo/culprit/findAll" valueField="id"
								textField="name" value="" /></td>
							<td>申请日期:</td>
							<td><input type="text" name="doDate"
								class="easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>


						</tr>
						<tr>
							<td>外出目的地:</td>
							<td><input type="text" name="place"
								class="easyui-validatebox" /></td>
							<td>经手人:</td>
							<td><input type="text" name="approvePerson"
								class="easyui-validatebox" /></td>


						</tr>
						<tr>
							<td>请假开始时间:</td>
							<td><input type="text" name="beginDate"
								class="easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
							<td>请假截止时间:</td>
							<td><input type="text" name="endDate"
								class="easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>

						</tr>
						<tr>
							<td>请假天数:</td>
							<td><input type="text" name="askLeaves"
								class="easyui-validatebox" /></td>
							
						</tr>
						<tr>
							<td>请假理由:</td>
							<td><input type="text" name="reason"
								class="easyui-validatebox" /></td>
							<td>活动范围:</td>
							<td><input type="text" name="activeArea"
								class="easyui-validatebox" /></td>

						</tr>
					</table>
				</div>
			</div>
			<div id="tabAdd" class="easyui-tabs">
				<div title="被访问者信息" data-options="iconCls:'icon-view'"
					style="padding: 5px 5px">
					<table>
						<tr>
							<td>被访问者姓名:</td>
							<td><input type="text" name="mobile"
								class="easyui-validatebox" /></td>
							<td>与矫正人关系:</td>
							<td><input type="text" name="mobile"
								class="easyui-validatebox" /></td>

						</tr>
						<tr>
							<td>职业及工作单位:</td>
							<td><input type="text" name="contactor"
								class="easyui-validatebox" /></td>
							<td>政治面貌:</td>
							<td><input type="text" name="dicPoliticStatusKey"
								class="easyui-validatebox" /></td>


						</tr>
						<tr>
							<td>家庭住址:</td>
							<td colspan="3"><input type="text" name="contactor"
								class="easyui-validatebox" /></td>
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
	var flag; //undefined 判断新增和修改方法
	var toolbar = [ {
		text : '新增',
		iconCls : 'icon-add',
		handler : function() {
			flag = 'add';
			//$('#mydialog').dialog({
			//	title : '新增用户'
			//});
			//$('#myform').find('input[name!=sex]').val("");
			//$('#myform').get(0).reset();
			//$('#myform').form('clear');
			//$('#mydialog').dialog('open');
			open_layer('新增请假','${ctx}/dailymgr/askLeave/form');

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
				/* $('#mydialog').dialog({
					title : '修改用户'
				});
				$('#mydialog').dialog('open'); //打开窗口
				$('#myform').get(0).reset(); //清空表单数据 
				$('#myform').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
					id : arr[0].id,
					name : arr[0].name,
					tname : arr[0].tname,
					password : arr[0].password,
					mobile : arr[0].mobile,
					groupId : arr[0].groupId
				}); */
				
				open_layer('新增请假','${ctx}/dailymgr/askLeave/form?id='+arr[0].id);
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
								ids += "ids=" + arr[i].id
							} else {
								ids += "&ids=" + arr[i].id;
							}

						}
						//ids = ids.substring(0, ids.length - 1);
						$.post('${ctx}/dailymgr/askLeave/batchDelete', {
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
		if(row.hasPermission==1){
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="submitAuditAskLeave(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">流程处理</a>';
		}
		if(row.processInstanceId!='' && row.processInstanceId!=null){
			if(row.isEnd==1){
				var url = '${ctx}/flow/queryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="viewProcess(\''+url+'\')">查看流程</a>';
			}else{
				var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="viewProcess(\''+url+'\')">查看流程</a>';
			}
			
		}
		if(row.processInstanceId!='' && row.processInstanceId!=null){
		
			if(row.isEnd==0){
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="stopProcess(\''+row.taskId+'\')">终止</a>';
			}
		}
		
		
	    return operation;
	} 
	function viewProcess(url){
		open_layer('请假流程',url);
	}
	function submitAuditAskLeave(taskId,id,auditType,processId){
		open_layer("请假审核审批","${ctx}/dailymgr/askLeave/askLeaveAudit?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId);
	}
	function askLeaveDetail(id){
		var url = '${ctx}/dailymgr/askLeave/detail?id=' + id;
		open_layer('请假流程详情',url);
		/* $.ajax({
			type : 'get',
			url : "${ctx}/dailymgr/askLeave/submitAskLeave?id=" + id,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			success : function(result) {
				if(result.status==200){
					alert("申请成功！");
				}
				
			}
		}); */
		
	}
	
	function stopProcess(taskId){
		$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
		      if (b){  
		    	  $.ajax({
		  			type : 'get',
		  			url : "${ctx}/dailymgr/askLeave/stopProcess?taskId=" + taskId,
		  			cache : false,
		  			async : false, //同步请求
		  			dataType : 'json',
		  			success : function(result) {
		  				if(result.status==200){
		  					alert(result.msg);
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
</script>

</html>
