<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<div region="center" border="false">
		<table class="easyui-datagrid" id="change_record_list_content" style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,fit:true,rownumbers:true,striped:true,fitColumns:true,fit:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/gradeChange/list?culpritId='+'${culprit.id }'+'&logo=1',method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-linkbutton-edit4').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
				  $('.organization-easyui-linkbutton-edit5').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'}); 
				  $('.organization-easyui-linkbutton-edit6').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle  icon-blue'});
				  $('.organization-easyui-linkbutton-edit7').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
				  }">
			<thead>
				<tr>
					<th data-options="field:'culpritName',width:'12%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">矫正对象</th>
					<th data-options="field:'groupName',width:'12%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">司法所</th>
					<th data-options="field:'dicOldMonitorGradeKey',width:'10%',align:'center',formatter:formatOldGrade"
						editor="text">原监管等级</th>
					<th data-options="field:'dicMonitorGradeKey',width:'9%',align:'center',formatter:formatNewGrade"
						editor="{type:'validatebox',options:{required:true}}">新监管等级</th>
					<th data-options="field:'created',width:'14%',align:'center',sortable:true"
						editor="{type:'validatebox',options:{required:true}}">变更时间</th>
				<!-- 	<th data-options="field:'printStatus',width:'10%',align:'center',formatter:function(value,row,index){
							if (value==1){return '已打印';}else{return '未打印';}}"
						editor="{type:'validatebox',options:{required:true}}">打印状态</th> -->
					<th data-options="field:'blankFlag',width:'10%',align:'center',formatter:function(value,row,index){
							if (value==2){return '已作废';}else{return '未作废';}}"
						editor="{type:'validatebox',options:{required:true}}">是否作废</th>
					<th data-options="field:'activityName',width:'10%',align:'center'"
						editor="text">审批状态</th>
				 	<th data-options="field:'_opt',width:'24%',formatter:formatOperate,align:'center'">操作</th>  
				</tr>
			</thead>
		</table>
	</div>
	<div id="sumbit" ></div>
	<div id="process"></div>
	 <div id="stop" title="流程作废" modal=true draggable=false
		class="easyui-dialog" closed=true style="padding:5px; top:250px; left:300px;width: 400px;">
		<form id="stopForm" action="" method="post">
			<!-- <input type="hidden" name="id" value="" /> -->
			<table class="grid">		
				<tr>
					<th>作废原因:</th>
					<td><select id="flagReasonId" class="easyui-combobox" name="flagReasonId" style="width:200px;"data-options="panelHeight:'auto'">   
    						<option value="0">录入错误</option>   
    						<option value="1">其他</option>     
						</select> 
					</td>
				</tr>
                <tr rowspan="5">
                    <th><span class="c-red">*</span>作废具体原因：</th>
							<td colspan="5"><input type="text" name="flagDetailReason"  required=true
								class="f1 easyui-textbox" value=""  style="width:300px;height:80px;"/></td>
                </tr>
				<tr align="center">
					<td colspan="6" align="center"><a href="javascript:void(0)" id="btn1" class="easyui-linkbutton" onclick="GradeStopProcess()">确定</a>
						<a  class="easyui-linkbutton" onclick="$('#stop').dialog('close');">取消</a></td>
				</tr>
			</table>
		</form>
		<div id="changeRecord"></div>
	</div>
<script type="text/javascript">
//全局id
var gradeChangeId;
//删除资源
function deleteFun() {
	//flag = 'delete';
	var arr = $('#t_list_content').datagrid('getSelections');
	if (arr.length <= 0) {
		$.messager.show({
			title : '提示信息!',
			msg : '至少选择一行记录进行删除!'
		});
	} else {
		$.messager.confirm('提示信息', '确认删除?', function(r) {
			if (r) {
				$.post('${ctx}/rewardspunishment/revokeProbation/delete', {
					id : arr[0].id
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

function formatOperate(val,row,index){  
	
	var operation='<a href="javascript:void(0);"  class="organization-easyui-linkbutton-edit4" data-options="plain:true,iconCls:\'formatterAct\'" class="organization-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-info icon-blue\'" onclick="detail(\''+row.id+'\',\''+row.isEnd+'\')">详情</a>';
	if(row.hasPermission==1){
		operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit5" onclick="reportAuditGradeChange(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">流程处理</a>';
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		var processDetailUrl="/dailymgr/gradeChange/forProcessDetail?id="+row.id;
		if(row.isEnd==1){
			var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
			operation=operation+'&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);"  class="organization-easyui-linkbutton-edit6" data-options="plain:true,iconCls:\'formatterAct\'" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
		}else{
			var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);"  class="organization-easyui-linkbutton-edit6" data-options="plain:true,iconCls:\'formatterAct\'" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
		}
		
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
	
		if(row.isEnd==0){
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);"  class="organization-easyui-linkbutton-edit7" data-options="plain:true,iconCls:\'fi-stop\'" onclick="openStop(\''+row.taskId+'\',\''+row.id+'\')">终止</a>';
		}
	}
	
	
    return operation;
} 

$.formatString = function(str) {
		for ( var i = 0; i < arguments.length - 1; i++) {
			str = str.replace("{" + i + "}", arguments[i + 1]);
		}
	return str;
}
function openStop(taskId,id){
	
	$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
	      if (b){  
	    	  $.ajax({
	  			type : 'get',
	  			url : "${ctx}/dailymgr/gradeChange/stopProcess?taskId="+taskId+"&id="+id,
	  			cache : false,
	  			async : false, //同步请求
	  			dataType : 'json',
	  			success : function(result) {
	  				if(result.status==200){
	  					$.messager.show({
	       					title:'提示信息!' ,
	       					msg:result.msg
	  					});
	  					  
	  					self.parent.$('#change_record_list_content').datagrid('reload');
	  				}else{ 
	  					$.messager.show({
	       					title:'提示信息!' ,
	       					msg:result.msg
	  					});
	  					  
	  					self.parent.$('#change_record_list_content').datagrid('reload');
	       					
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
//查看流程图
function viewProcess(url){
	/* $('#process').dialog({
		href : url,
		title:'',
		iconCls:'fi-plus icon-green',
		width : sy.getBrowerWidth()-250,
	    height : sy.getBrowerHeight()-150,
        loadingMessage:'加载中...'
	}); */
	
	$('#process').dialog({    
	    title: '流程图',    
        iconCls:'fi-shuffle  icon-blue',
		width : sy.getBrowerWidth()-250,
	    height : sy.getBrowerHeight()-150,
	    href: url,    
	    modal: true,
        resizable : true,
        maximizable:true
	});

	$('#process').window('center');
}
//流程处理
function submitAuditGradeChange(taskId,id,auditType,processId){
	 parent.$.modalDialog({
         title : '审核',
         iconCls:'fi-plus icon-green',
         width : sy.getBrowerWidth()-250,
         height : sy.getBrowerHeight()-150,
 		 href:'${ctx}/dailymgr/gradeChange/gradeChangeAudit?id='+id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
         buttons : [ {
             text : '上报',
             iconCls:'icon-save',
             handler : function() {
                 parent.$.modalDialog.openner_dataGrid = $('#change_record_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                 var f = parent.$.modalDialog.handler.find('#culpritInfo');
                 f.submit();
             }
         }]
     });
}
//详细链接
function detail(id,isEnd){
	//open_layer('修改监管等级','${ctx}/dailymgr/gradeChange/gradeChangeDetail?id='+id);

	if(isEnd==1){
		$('<div id="detail"></div>').dialog({
			href:'${ctx}/dailymgr/gradeChange/gradeChangeDetail?id='+id,
			title:'详情',
			maximizable:true,
	        resizable:true,
			iconCls:'fi-info icon-blue',
		    width: sy.getBrowerWidth()-250,
		    height: sy.getBrowerHeight()-150,
	        loadingMessage:'加载中...',
	        onClose:function(){
	        	
	        	$(this).dialog("destroy");
	        },
	        buttons : [ /* { 
	            id:'print',
	       		text : '打印《社区服刑人员管理类别调整登记表》',
	            iconCls:'fi-print icon-blue',
	            handler : function() {
	                $('#printAudit').click()
	              	                
	            }
	            }, */{
					text : '关闭',
					iconCls : 'fi-x icon-blue',
					handler : function() {
						$('#detail').dialog("close");
						
		            }
	        }]
	       
		});
	}else{
		$('<div id="detail"></div>').dialog({
			href:'${ctx}/dailymgr/gradeChange/gradeChangeDetail?id='+id,
			title:'详情',
			 maximizable:true,
	         resizable:true,
			iconCls:'fi-info icon-blue',
		    width: sy.getBrowerWidth()-250,
		    height: sy.getBrowerHeight()-150,
	        loadingMessage:'加载中...',
	        onClose:function(){
	        	
	        	$(this).dialog("destroy");
	        },
	        buttons : [ {
					text : '关闭',
					iconCls : 'fi-x icon-blue',
					handler : function() {
						$('#detail').dialog("close");
						
		            }
	        }]
	       
		});
	}
	
	
}

//流程上报
function reportAuditGradeChange(taskId,id,auditType,processInstanceId){
	
	if("firstReport"==auditType){
		$('#changeRecord').dialog({    
		    title: '上报',    
		    iconCls : 'fi-clipboard-pencil icon-blue',
		    width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
		    href: '${ctx}/dailymgr/gradeChange/gradeChangeAudit?id='+id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processInstanceId,   
		    modal: true,
	        resizable : true,
		    buttons :[{
				text:'上报',
				iconCls:'fi-clipboard-pencil icon-blue',
				handler:function(){
					$('#returnId1').click();
					parent.$.modalDialog.openner_dataGrid = $('#grade_change_list_content')
					.datagrid();
				}
				},{
					text:'关闭',
					iconCls:'fi-x icon-blue',
					handler:function(){
						$('#returnId').click();
						parent.$.modalDialog.openner_dataGrid = $('#grade_change_list_content')
						.datagrid();
					}
			}]
		}) 
	}else{
 	$('#changeRecord').dialog({    
	    title: '审核',    
	    iconCls : 'fi-clipboard-pencil icon-blue',
	    width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
	    href: '${ctx}/dailymgr/gradeChange/gradeChangeAudit?id='+id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processInstanceId,   
	    modal: true,
        resizable : true,
	    buttons :[{
			text:'审核',
			iconCls:'fi-clipboard-pencil icon-blue',
			handler:function(){
				$('#levelId').click();
				parent.$.modalDialog.openner_dataGrid = $('#grade_change_list_content')
				.datagrid();
			}
			},{
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#returnId').click();
					parent.$.modalDialog.openner_dataGrid = $('#grade_change_list_content')
					.datagrid();
	                 
				}
		}]
	}) 
	} 
	/*    
	 parent.$.modalDialog({
         title : '审批',
         iconCls:'fi-plus icon-green',
         width : sy.getBrowerWidth()-250,
         height : sy.getBrowerHeight()-150,
         href:'${ctx}/dailymgr/gradeChange/gradeChangeAudit?id='+id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processInstanceId,
         buttons : [ {
             text : '上报',
             iconCls:'icon-save',
             handler : function() {
                 parent.$.modalDialog.openner_dataGrid = $('#change_record_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                 var f = parent.$.modalDialog.handler.find('#culpritInfo');
                 f.submit();
             }
         },{
 				text : '关闭',
				iconCls : 'fi-x icon-blue',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = $('#change_record_list_content')
							.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.handler.dialog('close');

				}
		
		}]
	});  */
	$('#changeRecord').window('center');



}
//流程作废
function GradeStopProcess(taskId){
	$.messager.confirm('提示', '确定要终止该流程么?', function(b){  
	      if (b){  
	    	  $.ajax({
	  			type : 'post',
	  			url : "${ctx}/dailymgr/gradeChange/stopProcess?taskId=" + taskId,
	  			dataType : 'json',
	  			success : function(result) {
	  				if(result.status!=200){
	  					alert(result.msg);
	  				}
	  				$('#stop').dialog('close');
	  				$('#t_list_content').datagrid('reload',{});
	  			}
	  		});
	  		
	      }
	});  

}


function formatOldGrade(val,row,index){
	if(row.dicOldMonitorGradeKey){
		return sy.getDicValue('sf_culprit', 'dic_gldxjb_key', row.dicOldMonitorGradeKey, '')
	}else{
		return ''
	}
	
}
function formatNewGrade(val,row,index){
	if(row.dicMonitorGradeKey){
		return sy.getDicValue('sf_culprit', 'dic_gldxjb_key', row.dicMonitorGradeKey, '')
	}else{
		return ''
	}
	
}
</script>
</div>
