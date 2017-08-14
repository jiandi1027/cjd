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
	<!-- 搜索模块 -->
	<form id="warningForm"  style="padding-bottom: 10px;padding-top: 10px;">
		<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
		<div class="easyui-layout" data-options="fit:true,border:false">
			<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
		 		<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="t_list_warning"/>
			</c:if>
		   <div class="easyui-panel search-form" data-options="fit:true,border:false" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
				<table>
					<tr>
						<td class="search-title" >矫正对象：</td>
						<td> 
							<input name="name" id="name" class="easyui-textbox"  /> 
						</td>
					</tr>
					<tr>
						<td class="search-title" >记录起始：</td>
						 <td>
							<input name="searchStartDate" id="warningSearchStartDate" class="Wdate easyui-validatebox"
								onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'warningSearchEndDate\')}'})"/>
						</td>
					</tr>
					<tr>
						<td class="search-title" >记录截止：</td>
						 <td>
							<input name="searchEndDate" id="warningSearchEndDate" class="Wdate easyui-validatebox" 
								onfocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'warningSearchStartDate\')}',maxDate:'2120-10-01'})"/>
						</td>
					</tr>
				</table>
			</div>
			<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="warningSearchbtn" iconCls="icon-search" >查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="warningCleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#warningForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_list_warning" title="警告列表"
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,
					<shiro:hasPermission name="rewardspunishment/warning/form">
						toolbar:toolbar,
        			</shiro:hasPermission>
					loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/rewardspunishment/warning/list',method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
				  $('.organization-easyui-linkbutton-edit1').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'}); 
				  $('.organization-easyui-linkbutton-edit2').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle  icon-blue'});
				  $('.organization-easyui-linkbutton-edit3').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
		 }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true"></th>
					<th data-options="field:'culpritName',align:'center'"
						style="width: 11%;">矫正对象</th>
					<th data-options="field:'groupName',align:'center'"
						style="width: 14%;">司法所</th>
					<th data-options="field:'fact',align:'center'"
						style="width: 19%;">事实依据</th>
					<th data-options="field:'optTime',align:'center',sortable:true"
						style="width: 13%;">纪录时间</th>
					<th data-options="field:'activityName',align:'center'"
						style="width: 11%;">审批状态</th>
				 	<th data-options="field:'_opt',align:'center',formatter:formatOper" style="width: 30%;">操作</th>  
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
var flag; //undefined 判断新增和修改方法
var toolbar = [ {
	text : '新增',
	iconCls : 'fi-plus icon-green',
	handler : function() {
			 parent.$.modalDialog({
		         title : '新增警告信息',
		         iconCls:'fi-plus icon-green',
		         maximizable:true,
		         resizable:true,
		         width : sy.getBrowerWidth()-250,
		         height : sy.getBrowerHeight()-150,
		         href : '${ctx}/rewardspunishment/warning/add',
		         buttons : [ {
		             text : '保存',
		             iconCls:'icon-save',
		             handler : function() {
						parent.$.modalDialog.openner_dataGrid = $('#t_list_warning')
							.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		                 var f = parent.$.modalDialog.handler.find('#warningInfo')
		                 f.submit();
		             }
		         },{
						text : '关闭',
						iconCls : 'fi-x icon-blue',
						handler : function() {
							parent.$.modalDialog.openner_dataGrid = $('#t_list_warning')
									.datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							parent.$.modalDialog.handler.dialog('close');
						}
					}
		         ]
		     });
	}

}]

$('#warningSearchbtn').click(function() {
	var endDate = $("input[name='searchEndDate']").val() ;
	$("input[name='searchEndDate']").val( endDate +' '+ '23:59:59' ) ;
	$('#t_list_warning').datagrid('load', serializeForm($('#warningForm')));
	$("input[name='searchEndDate']").val( endDate ) ;
});

	function formatOper(val,row,index){  
		var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-info\'" onclick="warningDetail(\''+row.id+'\',\''+row.isEnd+'\')">详情</a>';
		if(row.hasPermission==1){
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit1" data-options="plain:true,iconCls:\'fi-clipboard-pencil\'" onclick="submitAuditAskLeave(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">流程处理</a>';
		}
		if(row.processInstanceId!='' && row.processInstanceId!=null){
			var processDetailUrl="/rewardspunishment/warning/forProcessDetail?id="+row.id;
			if(row.isEnd==1){
				var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
				operation=operation+'&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit2" data-options="plain:true,iconCls:\'fi-map\'" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
			}else{
				var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit2" data-options="plain:true,iconCls:\'fi-map\'" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
			}
			
		}
		if(row.processInstanceId!='' && row.processInstanceId!=null){
			if(row.isEnd==0 && row.hasPermission==1){
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit3" data-options="plain:true,iconCls:\'fi-map\'" onclick="stopProcess(\''+row.taskId+'\')">终止</a>';
			}
		}
		
	    return operation;
	} 
	function viewProcess(url){
		 parent.$.modalDialog({
	         title : '警告流程',
	         maximizable:true,
	         iconCls:'fi-plus icon-green',
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         href : url
	     });
		
	}
	function submitAuditAskLeave(taskId,id,auditType,processId){
		
		var buttonName='审批';
		if(auditType=='usertask2'||auditType=='usertask1'){
			buttonName='上报'
		}
		if(auditType=='usertask6'){
			 parent.$.modalDialog({
		         title : '文书打印',
		         iconCls:'fi-print icon-blue',
		         maximizable:true,
		         resizable:true,
		         width : 500,
			     height :300,
		         href : '${ctx}/rewardspunishment/warning/warningFinishPrint?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
		         buttons : [ {
			            text : "告知",
			            iconCls:'fi-results-demographics icon-blue',
			            handler : function() {
			            	if($('#isPrintJYS').html()=='' || $('#isPrintSHB').html()==''){
			            		$.messager.alert({
		        					title : '提示信息!',
		        					msg : '请打印后再告知!'
		        				});	
			            		return false;
			            	}
			            	//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
			               	parent.$.modalDialog.openner_dataGrid = $('#t_list_warning').datagrid();
			               	var f = parent.$.modalDialog.handler.find('#warning_inform_btn');
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
		}else{
			 parent.$.modalDialog({
		         title : '警告审核审批',
		         iconCls:'fi-clipboard-pencil icon-blue',
		         maximizable:true,
		         resizable:true,
		         width : sy.getBrowerWidth()-250,
		         height : sy.getBrowerHeight()-150,
		         href : '${ctx}/rewardspunishment/warning/warningAudit?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
		         buttons : [ {
		             text : buttonName,
		             iconCls:'icon-save',
		             handler : function() {
		            	//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
						parent.$.modalDialog.openner_dataGrid = $('#t_list_warning').datagrid();
						var f = parent.$.modalDialog.handler.find('#askWarningAuditForm');
						f.submit();
		             }
		         },{
	                 id : 'listWorkerPrint1',
	                 text : '关闭',
	                 iconCls:'fi-x icon-blue',
	                 handler : function() {
	                	//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
						parent.$.modalDialog.openner_dataGrid = $('#t_list_warning').datagrid();
						parent.$.modalDialog.handler.dialog('close');
	                 }
	         	}]
		     });
		}
	}
	function warningDetail(id,isEnd){
		if(isEnd==1){
			 parent.$.modalDialog({
		         title : '警告流程详情',
		         iconCls:'fi-info icon-blue',
		         resizable : true,
		         maximizable:true,
		         width : sy.getBrowerWidth()-250,
		         height : sy.getBrowerHeight()-100,
		         href : '${ctx}/rewardspunishment/warning/detail?id=' + id,
		         buttons : [ {
		             id : 'listWorkerPrint3',
		             text : '打印违反社区矫正规定警告决定书',
		             iconCls:'fi-print icon-blue',
		             handler : function() {
		                 var f = parent.$.modalDialog.handler.find('#workerPrint3');
		                 f.click();
		             }
		         },  {
		             id : 'listWorkerPrint4',
		             text : '打印社区服刑人员警告审批表',
		             iconCls:'fi-print icon-blue',
		             handler : function() {
		                 var f = parent.$.modalDialog.handler.find('#workerPrint4');
		                 f.click();
		                 }
		             },{
		                 id : 'listWorkerPrint1',
		                 text : '关闭',
		                 iconCls:'fi-x icon-blue',
		                 handler : function() {
		                     parent.$.modalDialog.openner_dataGrid = $('#t_list_warning').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		                     parent.$.modalDialog.handler.dialog('close');
		                 }
		         
		         } ]
		     });
		} else {
			 parent.$.modalDialog({
		         title : '警告流程详情',
		         iconCls:'fi-info icon-blue',
		         resizable : true,
		         maximizable:true,
		         width : sy.getBrowerWidth()-250,
		         height : sy.getBrowerHeight()-100,
		         href : '${ctx}/rewardspunishment/warning/detail?id=' + id,
		         buttons : [ {
		                 id : 'listWorkerPrint1',
		                 text : '关闭',
		                 iconCls:'fi-x icon-blue',
		                 handler : function() {
		                     parent.$.modalDialog.openner_dataGrid = $('#t_list_warning').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		                     parent.$.modalDialog.handler.dialog('close');
		                 }
		         
		         } ]
		     });
		}
	}
	
	function stopProcess(taskId){
		$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
		      if (b){  
		    	  $.ajax({
		  			type : 'get',
		  			url : "${ctx}/rewardspunishment/commend/stopProcess/?taskId=" + taskId,
		  			cache : false,
		  			async : false, //同步请求
		  			dataType : 'json',
		  			success : function(result) {
		  				if(result.status==200){
		  					$.messager.show({
      	       					title:'提示信息!' ,
      	       					msg:result.msg
		  					});
		  					  
		  					self.parent.$('#t_list_warning').datagrid('reload');
		  				}else{ 
		  					$.messager.show({
      	       					title:'提示信息!' ,
      	       					msg:result.msg
		  					});
		  					  
		  					self.parent.$('#t_list_warning').datagrid('reload');
      	       					
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
			warning: url
		});
		layer.full(index);
	}
	
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

	



</script>


