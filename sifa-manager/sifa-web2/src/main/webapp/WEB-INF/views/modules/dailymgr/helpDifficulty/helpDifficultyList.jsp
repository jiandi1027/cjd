<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#searchbtn1').click(
				function() {
					$('#t_list_helpDifficulty').datagrid('load',
							$.serializeObject($('#searchForm')));
				});

		function cleanSearch() {
			$('#t_list_helpDifficulty').datagrid('load', {});
			$('#searchForm').form().find('input').val('');
		}
	});
	function formatOper(val,row,index){  
		var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-info\'" onclick="askLeaveDetail(\''+row.id+'\')">修改</a>';
		operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit1" data-options="plain:true,iconCls:\'fi-info icon-blue\'" onclick="details(\''+row.id+'\')">详情</a>';
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
		parent.$.modalDialog({
			title : '修改',
			iconCls : 'fi-pencil icon-blue',
			width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         maximizable:true,
			href : '${ctx}/dailymgr/helpDifficulty/form?id='+ id,
			buttons : [
						{
							text : '保存',
							iconCls : 'icon-save',
							handler : function() {
								parent.$.modalDialog.openner_dataGrid = $('#t_list_helpDifficulty').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
								var f = parent.$.modalDialog.handler.find('#helpDifficulty');
								f.submit();
							}
						},{
							text : '关闭',
							iconCls : 'fi-x icon-blue',
							handler : function() {
								parent.$.modalDialog.openner_dataGrid = $('#t_list_helpDifficulty')
										.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
								parent.$.modalDialog.handler.dialog('close');
							}
						} 
					]
		});
					
		
	}
	function details(id){
		parent.$.modalDialog({
			title : '修改',
			iconCls : 'fi-info icon-blue',
			width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         maximizable:true,
	         resizable:true,
			href : '${ctx}/dailymgr/helpDifficulty/detail?id='+ id,
			buttons : [{
							text : '关闭',
							iconCls : 'fi-x icon-blue',
							handler : function() {
								parent.$.modalDialog.openner_dataGrid = $('#t_list_helpDifficulty')
										.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
								parent.$.modalDialog.handler.dialog('close');
							}
						} 
					]
		});
					
		
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
	

	
	function add() {
		parent.$.modalDialog({
			title : '新增',
			iconCls : 'fi-plus icon-green',
			width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         maximizable:true,
	         resizable:true,
			href : '${ctx}/dailymgr/helpDifficulty/form',
			buttons : [
					{
						text : '保存',
						iconCls : 'icon-save',
						handler : function() {
							parent.$.modalDialog.openner_dataGrid = $('#t_list_helpDifficulty').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler.find('#helpDifficulty');
							f.submit();
						}
					},
					{
						text : '重置',
						iconCls : 'icon-undo',
						handler : function() {
							var f = parent.$.modalDialog.handler
									.find('#HelpDifficulty');
							f.get(0).reset(); //清空表单数据 
						}
					},{
						text : '关闭',
						iconCls : 'fi-x icon-blue',
						handler : function() {
							parent.$.modalDialog.openner_dataGrid = $('#t_list_warning')
									.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							parent.$.modalDialog.handler.dialog('close');
						}
					} ]
		});
	}
	
	
	
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
<form id="searchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
		<div class="easyui-layout" data-options="fit:true,border:false">
		 <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
		 <sys:sysGroup hiddenId="note" hiddenName="note" dataGridId="t_list_helpDifficulty"/>
		 </c:if>
		 
		    <div class="easyui-panel  search-form" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目</c:if>" data-options="fit:true,border:false" id="p2" >
	       
				<table>
				
					<tr>
						<td class="search-title">矫正对象：</td>
						<td> <input name="culpritName1" id="culpritName1"
						class="easyui-textbox"   /> </td>
					</tr>
					<tr>
						<td class="search-title">监&nbsp;&nbsp;督&nbsp;&nbsp;人：</td>
						<td> <input name="monitorSolve" id=""monitorSolve""
						class="easyui-textbox"   /> </td>
					</tr>
					<tr>
						<td class="search-title">解决方式：</td>
						<td> <input name="dicSolveTypeKey" id="dicSolveTypeKey"
						class="easyui-textbox"   /> </td>
					</tr>
					<tr>
						<td class="search-title">解决单位：</td>
						<td> <input name="solveUnit" id="solveUnit"
						class="easyui-textbox"   /> </td>
					</tr>
					<tr>
						<td class="search-title">解决起始：</td>
						<td>
							<input name="searchStartDate"
						  class="Wdate easyui-validatebox"
						onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" />
						</td>
					</tr>
					<tr>
						<td class="search-title">解决截止：</td>
						<td><input name="searchEndDate" class="Wdate easyui-validatebox"
						onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
						  /></td>
					</tr>
					
				</table>
			
			</div>
			<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchbtn1" iconCls="icon-search" >查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#searchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_list_helpDifficulty" title="帮困解难列表" data-options="singleSelect:true,fit:true,collapsible:true,toolbar:'#toolbar',striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],url:'${ctx}/dailymgr/helpDifficulty/list',method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-linkbutton-edit').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'}); 
				  $('.organization-easyui-linkbutton-edit1').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});}">
				<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:'10%'">编号</th>
					<th data-options="field:'culpritName1',width:'8%',align:'center'"
						>矫正对象</th>
					<th data-options="field:'monitorSolve',width:'10%',align:'center'"
						>监督人</th>
					<th data-options="field:'solveUnit',width:'10%',align:'center'"
						>解决单位</th>
					
					<th data-options="field:'solveDate',width:'15%',align:'center',sortable:true">解决日期</th>
					<th data-options="field:'dicSolveTypeKey',width:'15%',align:'center'"
						editor="text">解决方式</th>
					<th data-options="field:'description',width:'20%',align:'center'"
						>困难说明</th>
				 <th data-options="field:'_opt',width:'20%',formatter:formatOper,align:'center'">操作</th>  

				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="toolbar" style="display: none;">
        <a onclick="add();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>

</div>

