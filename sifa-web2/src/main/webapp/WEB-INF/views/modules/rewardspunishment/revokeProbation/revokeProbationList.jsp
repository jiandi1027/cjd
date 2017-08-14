<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>
<script type="text/javascript">

$(function() {
/* $('#searchProbationBtn').click(
		function() {
			$('#t_probation_list_content').datagrid('load',
					 $.serializeObject($('#searchProbationForm')));
});

function cleanSearch() {
	$('#t_probation_list_content').datagrid('load', {});
	$('#searchProbationForm').form().find('input').val('');
} */
});

var accountRold='${sysAccount.roleId}';//此处用于控制上报权限
function formatOper(val,row,index){  
	var space = '&nbsp;';
	var operation='<a href="javascript:void(0);" class="organization-easyui-revokeProbation-info" onclick="detail(\''+row.id+'\',\''+row.auditType+'\',\''+row.isEnd+'\')">详情</a>';
	if(row.activityName==null ){
		<shiro:hasPermission name="rewardspunishment/revokeProbation/arrowUp">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-revokeProbation-arrow-up"  data-options="plain:true,iconCls:\'fi-arrow-up icon-blue\'"  onclick="addProbationFun(\''+row.id+'\')">上报</a>';
		</shiro:hasPermission>
	}
	
	if(row.auditType=="sfsReport" ){
		<shiro:hasPermission name="rewardspunishment/revokeProbation/edit1">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-revokeProbation-pencil" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editProbationFun(\''+row.id+'\')">修改</a>';
		</shiro:hasPermission>
	}
	if(row.auditType=="jzkReport" ){
		<shiro:hasPermission name="rewardspunishment/revokeProbation/edit2">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-revokeProbation-pencil" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editProbationFun(\''+row.id+'\')">修改</a>';
		</shiro:hasPermission>
	}
	
	if(row.hasPermission==1){
		operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-revokeProbation-clipboard-pencil" onclick="submitAuditProbation(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">处理</a>';
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		var processDetailUrl="/rewardspunishment/revokeProbation/forProcessDetail?id="+row.id;
		if(row.isEnd==1){
			var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-revokeProbation-map" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
		}else{
			var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-revokeProbation-map" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
		}
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
	
		if(row.isEnd==0 && row.hasPermission==1){
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-revokeProbation-stop" onclick="stopProcess(\''+row.taskId+'\')">终止</a>';
		}
	}
    return operation;
} 

function viewProcess(url){
	 parent.$.modalDialog({
         title : '流程信息',
         iconCls:'fi-shuffle icon-blue',
         width : sy.getBrowerWidth()-300,
         height : sy.getBrowerHeight()-200,
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
function submitAuditProbation(taskId,id,auditType,processId){
	var buttonName='审批';
	if(auditType=='sfsReport' || auditType=='jzkReport'){
		buttonName='处理';
	}
	if(auditType!='sfsPrint' && auditType!='jzkPrint'){
		parent.$.modalDialog({
	        title : '流程审批',
	        iconCls:'fi-clipboard-pencil icon-blue',
	        width : sy.getBrowerWidth()-350,
	        height : sy.getBrowerHeight()-100,
	        resizable:true,
	        maximizable:true,
	        href : "${ctx}/rewardspunishment/revokeProbation/revokeProbationAudit?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
	        buttons : [ {
	            text : buttonName,
	            iconCls:'fi-clipboard-pencil icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_probation_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#revokeProbationAuditForm');
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
	        href : "${ctx}/rewardspunishment/revokeProbation/revokeProbationFinishPrint?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
	        buttons : [ {
	            text : "告知",
	            iconCls:'fi-results-demographics icon-blue',
	            handler : function() {
	            	if($('#revokeProbation_isPrintJYS').html()=='' || $('#revokeProbation_isPrintSHB').html()==''){
	            		$.messager.alert({
        					title : '提示信息!',
        					msg : '请打印后再告知!'
        				});	
	            		return false;
	            	}
	               	parent.$.modalDialog.openner_dataGrid = $('#t_probation_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	               	var f = parent.$.modalDialog.handler.find('#revokeProbation_inform_btn');
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
function detail(id,auditType,isEnd){
	 parent.$.modalDialog({
         title : '提请撤销缓刑详情',
         iconCls:'fi-info icon-blue',
         width : sy.getBrowerWidth()-300,
         height : sy.getBrowerHeight()-200,
         resizable:true,
         maximizable:true,
         href : '${ctx}/rewardspunishment/revokeProbation/detail?id=' + id,
          buttons : [ {
        	 id : 'listRevokeProbationPrint1',
             text : '打印《撤销缓刑建议书》',
             iconCls:'fi-print icon-blue',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#revokeProbationPrint1');
                 f.click();
             }
         },{
        	 id : 'listRevokeProbationPrint2',
        	 text : '打印《撤销缓刑审批表》',
             iconCls:'fi-print icon-blue',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#revokeProbationPrint2');
                 f.click();
             }
         },{
             text : '关闭',
             iconCls:'fi-x icon-blue',
             handler : function() {
            	parent.$.modalDialog.handler.dialog('close');
             }
         }   ] 
     });

	 $('#listRevokeProbationPrint1').hide();
	 $('#listRevokeProbationPrint2').hide();
		if (isEnd == 1) {
			$('#listRevokeProbationPrint1').show();
			$('#listRevokeProbationPrint2').show();
		}
}


//流程终止
function stopProcess(taskId){
	$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
	      if (b){  
	    	  $.ajax({
	  			type : 'get',
	  			url :  "${ctx}/rewardspunishment/revokeProbation/stopProcess?taskId=" + taskId,
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
	  				$('#t_probation_list_content').datagrid('reload',{});
	  			}
	  		});
	  		
	      }
	});  
	
}



//增加
function addProbationFun(id){
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
         height : sy.getBrowerHeight()-200,
         resizable:true,
         maximizable:true,
         href : '${ctx}/rewardspunishment/revokeProbation/form?id='+id,
         buttons : [ {
             text : '保存',
             iconCls:'icon-save',
             handler : function() {
                 parent.$.modalDialog.openner_dataGrid = $('#t_probation_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                 var add = parent.$.modalDialog.handler.find('#probationInfo');
                 add.submit();
             }
         },{
             text : '保存并上报',
             iconCls:'fi-arrow-up icon-blue',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#saveWithSubmitBtn');
                 f.click();
             } 
         },{
             text : '重置',
             iconCls:'icon-undo',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#probationInfo');
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



//编辑
function editProbationFun(id){
	/* var arr = $('#t_probation_list_content').datagrid('getSelections');
	if(arr.length <= 0){
		$.messager.show({
			title : '提示信息!',
			msg : '至少选择一行记录进行修改!'
		});
		return;
	}
	var id=arr[0].id; */
	 parent.$.modalDialog({
        title : '编辑提请撤销缓刑信息',
        iconCls:'fi-pencil icon-blue',
        width : sy.getBrowerWidth()-300,
        height : sy.getBrowerHeight()-200,
        resizable:true,
        maximizable:true,
        href : '${ctx}/rewardspunishment/revokeProbation/form?id='+id,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#t_probation_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var edit = parent.$.modalDialog.handler.find('#probationInfo');
                edit.submit();
            }
        },{
            text : '重置',
            iconCls:'icon-undo',
            handler : function() {
           	 var reset = parent.$.modalDialog.handler.find('#probationInfo');
           	reset.get(0).reset(); //清空表单数据 
            }
        },{
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
           	 parent.$.modalDialog.handler.dialog('close');
            }
        }    ]
    });
} 

//删除
function deleteProbationFun(){
	var arr = $('#t_probation_list_content').datagrid('getSelections');
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
					url: '${ctx}/rewardspunishment/revokeProbation/delete',
					cache:false ,
					data:{id:arr[0].id},
					dataType:'json',
					success:function(result){
						//1 刷新数据表格 
						$('#t_probation_list_content').datagrid('reload');
						//2 清空idField   
						$('#t_probation_list_content').datagrid('uncheckAll');
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
 	<form id="probationSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
   <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
        	<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="t_probation_list_content"/>
        </c:if>
           <div class="easyui-panel search-form" data-options="fit:true,border:false"  title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
       
			<table>
				<tr>
				<td class="search-title">矫正对象：</td>
					<td><input name="culprit.name" class="easyui-textbox"/></td>
				</tr>
				<tr>
					<td class="search-title">违纪原因：</td>
					<td>
						<input name="reasonTypeId" id="search_reasonTypeId" class="easyui-combobox" data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_revoke_probation&columnName=REASON_TYPE_ID&parentKey=80000&showAll=1',panelHeight:'auto',editable:false"/>
					</td>
				</tr>
				<tr>
					<td class="search-title">创建起始：</td>
					<td><input name="startCreateDate" id="startCreateDate" class="Wdate easyui-validatebox" 
					  editable="false"  onfocus="var endCreateDate=$dp.$('endCreateDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm:ss',onpicked:function(){endCreateDate.focus();},maxDate:'#F{$dp.$D(\'endCreateDate\')}'})" /></td>
				</tr>
				<tr>
				<td class="search-title" style="text-align:right">创建截至：</td>
					<td><input name="endCreateDate" id="endCreateDate" class="Wdate easyui-validatebox"   editable="false" 
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startCreateDate\')}'})"/></td>
				</tr>
			</table>
		
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
		 <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#t_probation_list_content').datagrid('load' ,$.serializeObject($('#probationSearchForm')));"
		 				id="searchDetachedBtn">查询</a> &nbsp;&nbsp; 
			<a href="#" class="easyui-linkbutton" id="cleanDetachedBtn" iconCls="icon-undo" onclick="javascript:$('#search_reasonTypeId').combobox('reset');$('#probationSearchForm').form('clear');$('#t_probation_list_content').datagrid('load', {});">清空</a></div>
		</div>
	</div>
	</form>
    <div data-options="region:'center',border:true" >
        <table class="easyui-datagrid" id="t_probation_list_content" title="提请撤销缓刑列表"
			data-options="singleSelect:true,fit:true,toolbar:'#probation_toolbar',rownumbers: true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/rewardspunishment/revokeProbation/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-revokeProbation-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-revokeProbation-map').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle icon-blue'});
                        $('.organization-easyui-revokeProbation-stop').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
                        $('.organization-easyui-revokeProbation-clipboard-pencil').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                   		 $('.organization-easyui-revokeProbation-arrow-up').linkbutton({text:'上报',plain:true,iconCls:'fi-arrow-up icon-blue'});
                    	 $('.organization-easyui-revokeProbation-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'culpritName',width:'7%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">矫正对象</th>
					<th data-options="field:'groupName',width:'10%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">司法所</th>
					<th data-options="field:'created',width:'13%',align:'center',sortable:true"
						editor="text">创建时间</th>
					<th data-options="field:'updated',width:'13%',align:'center',sortable:true"
						editor="text">更新时间</th>
					<th data-options="field:'reasonTypeId',width:'22%',align:'center',formatter:function(value,rowData,rowIndex){    
				return sy.getDicValue('sf_revoke_probation','REASON_TYPE_ID',rowData.reasonTypeId,'');}"
						editor="{type:'validatebox',options:{required:true}}">违纪原因</th>
					<th data-options="field:'activityName',width:'10%',align:'center'"
						editor="text">审批状态</th>
				 	<th data-options="field:'_opt',width:'23%',formatter:formatOper,align:'center'">操作</th>  

				</tr>
			</thead>
		</table>
    </div>
</div>
<div id="probation_toolbar" style="display: none;">
   		<shiro:hasPermission name="rewardspunishment/revokeProbation/form">
        	<a onclick="addProbationFun(id);" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
        </shiro:hasPermission>
       <!--  <a onclick="editProbationFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-pencil icon-blue'">修改</a> -->
        <shiro:hasPermission name="rewardspunishment/revokeProbation/delete">
        	<a onclick="deleteProbationFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>
		 </shiro:hasPermission>
</div>
