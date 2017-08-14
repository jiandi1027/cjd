<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<div class="easyui-layout" data-options="fit:true,border:false">
		<!-- 搜索模块 -->
<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
		<div class="easyui-layout" data-options="fit:true,border:false">
		<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
			<sys:sysGroup hiddenId="groupName" hiddenName="groupName" dataGridId="reducePenalty_list_content"/>
			</c:if>
		    <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2"title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目</c:if>" style="width:100%;">
	        <form id="searchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	        
				<table>
					<tr>
						<td width="35%" align="right">矫正对象：</td>
						<td><input name="culprit.name" class="easyui-textbox"/></td>
					</tr>
					<tr>
						<td width="35%" align="right">减刑年限：</td>
						<td> <input name="reduceTime" id="reduceTime" class="easyui-textbox"   /> </td>
					</tr>
					<tr>
						<td class="search-title">申请起止：</td>
						<td>
							<input name="searchStartDate" id="searchStartDate_reduce" class="Wdate easyui-validatebox"
						onfocus="var searchEndDate_reduce=$dp.$('searchEndDate_reduce')+1;WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'searchEndDate_reduce\',{d:-1})}'})"/>
						</td>
					</tr>
					<tr>
						<td class="search-title">申请截止：</td>
						<td><input name="searchEndDate" id="searchEndDate_reduce" class="Wdate easyui-validatebox"
						onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate_reduce\',{d:1})}'})"/></td>
					</tr>
				</table>
			</form>
			</div>
			<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchbtn" iconCls="icon-search" >查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#searchForm').form('clear');$('#reducePenalty_list_content').datagrid('load', {});">清空</a>
			</div>
		</div>
	</div>

	<div region="center" border="false">
		<table class="easyui-datagrid" id="reducePenalty_list_content" title="减刑列表"
			style="height: 400px;"
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:'#reducePenalty_toolbar',loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/rewardspunishment/reducePenalty/list',method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
				  $('.organization-easyui-linkbutton-edit1').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'}); 
				  $('.organization-easyui-linkbutton-edit2').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle  icon-blue'});
				  $('.organization-easyui-linkbutton-edit3').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
		 		 $('.organization-easyui-reducePenalty-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
		 }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true"></th>
					<th data-options="field:'culpritName',align:'center',width:'13%'">矫正对象</th>
					<th data-options="field:'groupName',align:'center',width:'15%'">司法所</th>
					<th data-options="field:'endTime',align:'center',width:'15%'" >申请时间</th>
					<th data-options="field:'reduceTime',align:'center',width:'10%'" >减刑年限</th>
					<th data-options="field:'activityName',align:'center',width:'15%'">审批状态</th>
				 <th data-options="field:'_opt',align:'center',width:'30%',formatter:formatOper" >操作</th>  

				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="reducePenalty_toolbar" style="display: none;">
   	  <shiro:hasPermission name="reducePenalty/add"> 
        	<a onclick="addReducePenalty(id);" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
      </shiro:hasPermission> 
       <!--  <a onclick="editProbationFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-pencil icon-blue'">修改</a> -->
        <%-- <shiro:hasPermission name="rewardspunishment/revokeProbation/delete"> 
        	<a onclick="deleteReducePenalty();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>
		 </shiro:hasPermission> --%>
</div>
<script type="text/javascript">
var flag; //undefined 判断新增和修改方法
//增加
function addReducePenalty(id){
	 parent.$.modalDialog({
         title : '新增减刑信息',
         iconCls:'fi-plus icon-green',
         width : sy.getBrowerWidth()-250,
         height : sy.getBrowerHeight()-200,
         resizable : true,
         maximizable:true, 
         href : '${ctx}/rewardspunishment/reducePenalty/add',
         buttons : [ {
             text : '保存',
             iconCls:'icon-save', 
             handler : function() {
                 parent.$.modalDialog.openner_dataGrid = $('#reducePenalty_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                 var f = parent.$.modalDialog.handler.find('#culpritInfo');
                 f.submit();
             }
         },{
 				text : '关闭',
				iconCls : 'fi-x icon-blue',
				handler : function() {
					parent.$.modalDialog.handler.dialog('close');
				}
         }
         ]
     });
}

function editReducePenalty(id){
	parent.$.modalDialog({
        title : '修改减刑信息',
        iconCls:'fi-pencil icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-200,
        resizable : true,
        maximizable:true, 
        href : '${ctx}/rewardspunishment/reducePenalty/add?id='+id,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save', 
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#reducePenalty_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#culpritInfo');
                f.submit();
            }
        },{
				text : '关闭',
				iconCls : 'fi-x icon-blue',
				handler : function() {
					parent.$.modalDialog.handler.dialog('close');
				}
        }
        ]
    });
}

//删除
function deleteReducePenalty(){
	var arr = $('#reducePenalty_list_content').datagrid('getSelections');
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
					url: '${ctx}/rewardspunishment/reducePenalty/delete',
					cache:false ,
					data:{id:arr[0].id},
					dataType:'json',
					success:function(result){
						//1 刷新数据表格 
						$('#reducePenalty_list_content').datagrid('reload');
						//2 清空idField   
						$('#reducePenalty_list_content').datagrid('uncheckAll');
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

$('#searchbtn').click(function() {
	$('#reducePenalty_list_content').datagrid('load', serializeForm($('#searchForm')));
});

	
	function formatOper(val,row,index){  
		var space = '&nbsp;';
		var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-info\'" onclick="reducePenaltyDetail(\''+row.id+'\',\''+row.isEnd+'\')">详情</a>';
		if(row.auditType=="sfsReport" ){
				operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-reducePenalty-pencil"  onclick="editReducePenalty(\''+row.id+'\')">修改</a>';
		}
		if(row.hasPermission==1){
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit1" data-options="plain:true,iconCls:\'fi-clipboard-pencil\'" onclick="submitAuditReducePenalty(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">流程处理</a>';
		}
		if(row.processInstanceId!='' && row.processInstanceId!=null){
			var processDetailUrl="/rewardspunishment/reducePenalty/forProcessDetail?id="+row.id;
			if(row.isEnd==1){
				var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
				operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit2" data-options="plain:true,iconCls:\'fi-map\'" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
			}else{
				var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
				operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit2" data-options="plain:true,iconCls:\'fi-map\'" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
			}
			
		}
		/* if(row.processInstanceId!='' && row.processInstanceId!=null){
		
			if(row.isEnd==0){
				operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit3" data-options="plain:true,iconCls:\'fi-map\'" onclick="stopProcess(\''+row.taskId+'\')">终止</a>';
			}
		} */
		
		
	    return operation;
	} 
	function viewProcess(url){
		 parent.$.modalDialog({
	         title : '减刑流程',
	         iconCls:'fi-shuffle  icon-blue',
	         resizable : true,
	         maximizable:true, 
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         href : url
	     });
		
	}
	function submitAuditReducePenalty(taskId,id,auditType,processId){
		var text = '审批';
		var title='流程审批';
		var iconCls='fi-clipboard-pencil icon-blue';
		if(auditType=='sfsReport'){
			text='上报';
			title='上报';
			iconCls='fi-arrow-up icon-blue';
		}if(auditType=='gS'){
			text='提交';
			title='公示';
			iconCls='fi-clipboard-pencil icon-blue';
		}
		if(auditType=='sgzryPrint'){
			parent.$.modalDialog({
		         title : '文书打印',
		         iconCls:'fi-clipboard-pencil icon-blue',
		         width : 500,
			     height :300,
		         resizable : true,
		         maximizable:true, 
		         href : '${ctx}/rewardspunishment/reducePenalty/reducePenaltyPrint?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
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
			               	parent.$.modalDialog.openner_dataGrid = $('#reducePenalty_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
			               	var f = parent.$.modalDialog.handler.find('#reducePenalty_inform_btn');
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
		         title : title,
		         iconCls:iconCls,
		         width : sy.getBrowerWidth()-250,
		         height : sy.getBrowerHeight()-200,
		         resizable : true,
		         maximizable:true, 
		         href : '${ctx}/rewardspunishment/reducePenalty/reducePenaltyAudit?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
		         buttons : [ {
		             text : text,
		             iconCls:iconCls,
		             handler : function() {
		                 parent.$.modalDialog.openner_dataGrid = $('#reducePenalty_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		                 var f = parent.$.modalDialog.handler.find('#askLeaveAuditForm');
		                 f.submit();
		             }
		         },{
		 				text : '关闭',
						iconCls : 'fi-x icon-blue',
						handler : function() {
							parent.$.modalDialog.handler.dialog('close');
						}
		         }]
		     });
		}
		 

	}
	function reducePenaltyDetail(id,isEnd){
		if(isEnd==0){
			 parent.$.modalDialog({
		         title : '减刑流程详情',
		         iconCls:'fi-info icon-blue',
		         width : sy.getBrowerWidth()-300,
		         height : sy.getBrowerHeight()-150,
		         resizable : true,
		         maximizable:true, 
		         href : '${ctx}/rewardspunishment/reducePenalty/detail?id=' + id,
		         buttons : [ {
		 				text : '关闭',
						iconCls : 'fi-x icon-blue',
						handler : function() {
							parent.$.modalDialog.handler.dialog('close');
						}
		         }]
		     });
		}else{
			 parent.$.modalDialog({
		         title : '减刑流程详情',
		         iconCls:'fi-info icon-blue',
		         width : sy.getBrowerWidth()-300,
		         height : sy.getBrowerHeight()-150,
		         resizable : true,
		         maximizable:true, 
		         href : '${ctx}/rewardspunishment/reducePenalty/detail?id=' + id,
		         buttons : [ {
		             id : 'listreducePenalty',
		             text : '打印社区服刑人员减刑建议书',
		             iconCls:'fi-print icon-blue',
		             handler : function() {
		                 var f = parent.$.modalDialog.handler.find('#reducePenalty1');
		                 f.click();
		             }
		         },{
		 				text : '关闭',
						iconCls : 'fi-x icon-blue',
						handler : function() {
							parent.$.modalDialog.handler.dialog('close');
						}
		         }]
		     });
		}
		
		
	}
	
	function stopProcess(taskId){
		$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
		      if (b){  
		    	  $.ajax({
		  			type : 'get',
		  			url : "${ctx}/rewardspunishment/reducePenalty/stopProcess/?taskId=" + taskId,
		  			cache : false,
		  			async : false, //同步请求
		  			dataType : 'json',
		  			success : function(result) {
		  				if(result.status==200){
		  					$.messager.show({
      	       					title:'提示信息!' ,
      	       					msg:result.msg
		  					});
		  					  
		  					self.parent.$('#reducePenalty_list_content').datagrid('reload');
		  				}else{ 
		  					$.messager.show({
      	       					title:'提示信息!' ,
      	       					msg:result.msg
		  					});
		  					  
		  					self.parent.$('#reducePenalty_list_content').datagrid('reload');
      	       					
		  				}
		  				
		  			}
		  		});
		  		
		      }
		});  
		
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


