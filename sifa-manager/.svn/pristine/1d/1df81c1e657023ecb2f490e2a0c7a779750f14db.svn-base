<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>
<script type="text/javascript">

$(function() {
/* $('#searchOutOfParoleBtn').click(
		function() {
			$('#t_outOfParole_list_content').datagrid('load',
					 $.serializeObject($('#searchOutOfParoleBtn')));
});

function cleanOutOfParoleSearch() {
	$('#t_outOfParole_list_content').datagrid('load', {});
	$('#searchOutOfParoleBtn').form().find('input').val('');
} */
});

var accountRold='${sysAccount.roleId}';//此处用于控制上报权限
function outOfPrisonformatOper(val,row,index){  
	var space = '&nbsp;';
	var operation='<a href="javascript:void(0);" class="organization-easyui-revokeOutOfPrison-info" onclick="detailOutOfPrison(\''+row.id+'\',\''+row.auditType+'\',\''+row.isEnd+'\')">详情</a>';
	if(row.activityName==null){
		<shiro:hasPermission name="rewardspunishment/revokeOutOfPrison/arrowUp">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-revokeOutOfPrison-arrow-up" data-options="plain:true,iconCls:\'fi-arrow-up icon-blue\'"  onclick="addOutOfPrisonFun(\''+row.id+'\')">上报</a>';
		</shiro:hasPermission>
	}
	if(row.auditType=="sfsReport"){
		<shiro:hasPermission name="rewardspunishment/revokeOutOfPrison/edit1">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-revokeOutOfPrison-pencil" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editOutOfPrisonFun(\''+row.id+'\')">修改</a>';
		</shiro:hasPermission>
	}
	if(row.auditType=="jzkReport"){
		<shiro:hasPermission name="rewardspunishment/revokeOutOfPrison/edit2">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-revokeOutOfPrison-pencil" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editOutOfPrisonFun(\''+row.id+'\')">修改</a>';
		</shiro:hasPermission>
	}
	
	if(row.hasPermission==1){
		operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-revokeOutOfPrison-clipboard-pencil" onclick="submitAuditOutOfPrison(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">处理</a>';
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		var processDetailUrl="/rewardspunishment/revokeOutOfPrison/forProcessDetail?id="+row.id;
		if(row.isEnd==1){
			var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-revokeOutOfPrison-map" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
		}else{
			var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-revokeOutOfPrison-map" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
		}
		
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		if(row.isEnd==0 && row.hasPermission==1){
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-revokeOutOfPrison-stop" onclick="stopProcess(\''+row.taskId+'\')">终止</a>';
		}
	}
    return operation;
} 


//查看流程图
function viewProcess(url){
	 parent.$.modalDialog({
        title : '流程信息',
        iconCls:'fi-shuffle icon-blue',
        width : sy.getBrowerWidth()-300,
        height : sy.getBrowerHeight()-100,
        resizable:true,
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

//流程审批
function submitAuditOutOfPrison(taskId,id,auditType,processId){
	var buttonName='审批';
	if(auditType=='sfsReport' || auditType=='jzkReport'){
		buttonName='处理';
	}
	if(auditType!='sfsPrint' && auditType!='jzkPrint'){
		parent.$.modalDialog({
	        title :'流程审批',
	        iconCls:'fi-clipboard-pencil icon-blue',
	        width : sy.getBrowerWidth()-350,
	        height : sy.getBrowerHeight()-100,
	        resizable:true,
	        maximizable:true,
	        href : "${ctx}/rewardspunishment/revokeOutOfPrison/revokeOutOfPrisonAudit?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
	        buttons : [ {
	            text : buttonName,
	            iconCls:'fi-clipboard-pencil icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_outOfParole_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#revokeOutOfPrisonAuditForm');
	                f.submit();
	                }
	            },{
	                text : '关闭',
	                iconCls:'fi-x icon-blue',
	                handler : function() {
	               	 parent.$.modalDialog.handler.dialog('close');
	                } 
	        }]		
	    });
	}else{
		parent.$.modalDialog({
	        title : '文书打印',
	        iconCls:'fi-print icon-blue',
	        width : 500,
	        height :300,
	        resizable:true,
	        maximizable:true,
	        href : "${ctx}/rewardspunishment/revokeOutOfPrison/revokeOutOfPrisonFinishPrint?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
	        buttons : [ {
	            text : "告知",
	            iconCls:'fi-results-demographics icon-blue',
	            handler : function() {
	            	if($('#revokeOutOfPrison_isPrintSHB').html()==''){
	            		$.messager.alert({
        					title : '提示信息!',
        					msg : '请打印后再告知!'
        				});	
	            		return false;
	            	}
	               	parent.$.modalDialog.openner_dataGrid = $('#t_outOfParole_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	               	var f = parent.$.modalDialog.handler.find('#revokeOutOfPrison_inform_btn');
	                f.click();
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

}
//详细
function detailOutOfPrison(id,auditType,isEnd){
	 parent.$.modalDialog({
         title : '提请撤销暂予监外执行详情',
         iconCls:'fi-info icon-blue',
         width : sy.getBrowerWidth()-300,
         height : sy.getBrowerHeight()-130,
         resizable:true,
         maximizable:true,
         href : '${ctx}/rewardspunishment/revokeOutOfPrison/detail?id=' + id,
          buttons : [ {
       		 id:'listOutOfPrisonPrint1',
        	 text : '打印《提请撤销暂予监外执行审批表》',
        	 iconCls:'fi-print icon-blue',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#outofPrisonPrint1');
                 f.click();	
					
             }
         },{
        	 text : '关闭',
             iconCls:'fi-x icon-blue',
             handler : function() {
            	 parent.$.modalDialog.handler.dialog('close');
             }
         }] 
     });
	 
	 $('#listOutOfPrisonPrint1').hide();
		if (isEnd == 1) {
			$('#listOutOfPrisonPrint1').show();
		}

}


//流程终止
function stopProcess(taskId){
	$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
	      if (b){  
	    	  $.ajax({
	  			type : 'get',
	  			url :  "${ctx}/rewardspunishment/revokeOutOfPrison/stopProcess?taskId=" + taskId,
	  			cache : false,
	  			async : false, //同步请求
	  			dataType : 'json',
	  			success : function(result) {
	  				$.messager.show({
 	  					title:'提示信息!',
 	  					msg:result.msg
 	  				});
	  				$('#t_outOfParole_list_content').datagrid('reload',{});
	  			}
	  		});
	  		
	      }
	});  
	
}
//增加
function addOutOfPrisonFun(id){
	var title='新增';
	var icon='fi-plus icon-green';
	if(id!=''){
		title="上报";
		icon='fi-arrow-up icon-blue';
	}
	 parent.$.modalDialog({
         title : title,
         iconCls:icon,
         width : sy.getBrowerWidth()-300,
         height : sy.getBrowerHeight()-130,
         resizable:true,
         maximizable:true,
         href : '${ctx}/rewardspunishment/revokeOutOfPrison/form?id='+id,
         buttons : [ {
             text : '保存',
             iconCls:'icon-save',
             handler : function() {
                 parent.$.modalDialog.openner_dataGrid = $('#t_outOfParole_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                 var f = parent.$.modalDialog.handler.find('#outOfPrisonInfo');
                 f.submit();
             }
         },{
        	 text : '上报',
             iconCls:'fi-arrow-up icon-blue',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#submitOutOfPrisonBtn');
                 f.click();
            }
         },{
             text : '重置',
             iconCls:'icon-undo',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#outOfPrisonInfo');
            	 f.get(0).reset(); //清空表单数据 
             }
         },{
        	 text : '关闭',
             iconCls:'fi-x icon-blue',
             handler : function() {
            	 parent.$.modalDialog.handler.dialog('close');
             }
         }  ]
     });
}

//修改
function editOutOfPrisonFun(id){
	/* var arr = $('#t_outOfParole_list_content').datagrid('getSelections');
	if(arr.length <= 0){
		$.messager.show({
			title : '提示信息!',
			msg : '至少选择一行记录进行上报!'
		});
		return;
	}
	var id=arr[0].id; */
	 parent.$.modalDialog({
        title : '修改提请撤销监外执行信息',
        iconCls:'fi-pencil icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        resizable:true,
        maximizable:true,
        href : '${ctx}/rewardspunishment/revokeOutOfPrison/form?id='+id,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#t_outOfParole_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#outOfPrisonInfo');
                f.submit();
            }
        },{
        	 text : '关闭',
             iconCls:'fi-x icon-blue',
             handler : function() {
            	 parent.$.modalDialog.handler.dialog('close');
             }
        }  ]
    });
}

//删除
function deleteOutOfPrisonFun(){
	var arr = $('#t_outOfParole_list_content').datagrid('getSelections');
	if (arr.length <= 0) {
		$.messager.alert({
			title : '提示信息!',
			msg : '请至少选择一行记录进行删除!'
		});
	} else if(arr[0].processInstanceId!='' && arr[0].processInstanceId!=null){
		$.messager.alert({
			title : '提示信息!',
			msg : '流程已启动，无权限执行该操作!'
		});
	}else {
		$.messager.confirm('提示信息', '确认删除?', function(r) {
			if (r) {
				$.ajax({
					type: 'post' ,
					url: '${ctx}/rewardspunishment/revokeOutOfPrison/delete',
					cache:false ,
					data:{id:arr[0].id},
					dataType:'json',
					success:function(result){
						//1 刷新数据表格 
						$('#t_outOfParole_list_content').datagrid('reload');
						//2 清空idField   
						$('#t_outOfParole_list_content').datagrid('uncheckAll');
						//3 给提示信息 
						$.messager.show({
							title : '提示信息!',
							msg : result.msg
						});
					} ,
					error:function(result){
						$.messager.show({
		  					title:'提示信息!',
		  					msg:'删除失败'
		  				});
					}
				});
			} else {
				return;
			}
		});
	}
}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
 	<form id="outOfprisonSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:false">
        <div region="center" border="false">
        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
          <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="t_outOfParole_list_content"/>
          </c:if>
           <div class="easyui-panel search-form" data-options="fit:true,border:false" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目</c:if>" style="width:100%;">
       
			<table>
				<tr>
				<td class="search-title">矫正对象：</td>
					<td><input name="culprit.name" class="easyui-textbox"  /></td>
				</tr>
				<tr>
					<td class="search-title">违纪原因：</td>
					<td>
						<input name="dicReasonTypeKey" id="search_dicReasonTypeKey" class="easyui-combobox" data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=revokeOutOfPrison&columnName=dicReasonTypeKey&parentKey=81000&showAll=1',panelHeight:'auto',editable:false">
					</td>
				</tr>
				<tr>
				<td class="search-title">创建起始：</td>
					<td><input name="searchStartDate" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"  editable="false"  /></td>
				</tr>
				<tr>
				<td class="search-title" style="text-align:right">创建截止：</td>
					<td><input name="searchEndDate" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"  editable="false" /></td>
				</tr>
			</table>
		
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
		 <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#t_outOfParole_list_content').datagrid('load' ,$.serializeObject($('#outOfprisonSearchForm')));">查询</a> &nbsp;&nbsp; 
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo" onclick="javascript:$('#search_dicReasonTypeKey').combobox('reset');$('#outOfprisonSearchForm').form('clear');$('#t_outOfParole_list_content').datagrid('load', {});">清空</a></div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_outOfParole_list_content" title="提请撤销暂予监外执行"
			data-options="singleSelect:true,fit:true,rownumbers:true,collapsible:true,striped:true,toolbar:'#outOfPrison_toolbar',
			loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/rewardspunishment/revokeOutOfPrison/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-revokeOutOfPrison-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-revokeOutOfPrison-map').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle icon-blue'});
                        $('.organization-easyui-revokeOutOfPrison-stop').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
                        $('.organization-easyui-revokeOutOfPrison-clipboard-pencil').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                   		 $('.organization-easyui-revokeOutOfPrison-arrow-up').linkbutton({text:'上报',plain:true,iconCls:'fi-arrow-up icon-blue'});
                   		 $('.organization-easyui-revokeOutOfPrison-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'culpritName',width:'10%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">矫正对象</th>
					<th data-options="field:'groupName',width:'10%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">司法所</th>
					<th data-options="field:'created',width:'10%',align:'center',sortable:true"
						editor="text">创建时间</th>
					<th data-options="field:'updated',width:'10%',align:'center',sortable:true"
						editor="text">更新时间</th>
					<th data-options="field:'dicReasonTypeKey',width:'25%',align:'center',formatter:function(value,rowData,rowIndex){    
				return sy.getDicValue('revokeOutOfPrison','dicReasonTypeKey',rowData.dicReasonTypeKey,'');}">违纪原因</th>
					<th data-options="field:'activityName',width:'10%',align:'center'"
						editor="text">审批状态</th>
				 	<th data-options="field:'_opt',width:'23%',formatter:outOfPrisonformatOper,align:'center'">操作</th>  

				</tr>
			</thead>
		</table>
	</div>
	<div id="outOfPrison_toolbar" style="display: none;">
		<shiro:hasPermission name="rewardspunishment/revokeOutOfPrison/form">
			<a onclick="addOutOfPrisonFun(id);" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
        </shiro:hasPermission>
        <shiro:hasPermission name="rewardspunishment/revokeOutOfPrison/delete">	
        	<a onclick="deleteOutOfPrisonFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">删除</a> 
		</shiro:hasPermission>
	</div>
	<div id="outOfPrison_pingyi" class="easyui-dialog" title="上传评议表" style="width:400px;height:200px;background:#c4d8ed"   
        data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true"> 
        <table style="margin-left:30px;margin-top:10px">
        	<tr height=30>
        		<td align=right>正在修改:</td>
        		<td>第1条</td>
        	</tr>
        	<tr height=30>
        		<td align=right>评议表:</td>
        		<td></td>
        	</tr>
        	<tr height=30>
        		<td align=right><span style="color:red">*</span>上传:</td>
        		<td><input type="file"/></td>
        	</tr>
        </table>
         <div align="center" padding="20px 30px 40px 50px">
         <p colspan="4" > 
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="">上传</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick=" $('#pingyi').dialog('close');">取消</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  </p>
    </div>
	</div>  
</div>

