<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript">

$(function() {
$('#searchDetachedbtn').click(
		function() {
			$('#t_detached_list_content').datagrid('load',
					 $.serializeObject($('#searchDetachedForm')));
});

function cleanSearch() {
	$('#t_detached_list_content').datagrid('load', {});
	$('#searchDetachedForm').form().find('input').val('');
}
});

var accountRold='${sysAccount.roleId}';//此处用于控制上报权限
function formatOper(val,row,index){
    var space = '&nbsp;';
    var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info"  onclick="detachedDetail(\''+row.id+'\')">详情</a>';
    
   /*  if(row.activityName==null){
    	<shiro:hasPermission name="endcorrect/detached/detachedAudit">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-arrow-up" data-options="plain:true,iconCls:\'fi-arrow-up icon-blue\'" onclick="submitDetached(\''+row.id+'\')">上报</a>';
		</shiro:hasPermission>
    } */
    if(row.auditType=="sfsPut"){
    	 <shiro:hasPermission name="endcorrect/detached/edit">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editDetached(\''+row.id+'\')">修改</a>';
		</shiro:hasPermission>
    } 
    
	if(row.hasPermission==1){
		operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-clipboard-pencil" onclick="submitDetachedAudit(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">处理</a>';
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		var processDetailUrl="/endcorrect/detached/forProcessDetail?id="+row.id;
		if(row.isEnd==1){
			var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-map"  onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">流程图</a>';
		}else{
			var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-map" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">流程图</a>';
		}
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
	
		if(row.isEnd==0 && row.hasPermission==1){
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-stop" onclick="stopProcess(\''+row.taskId+'\')">终止</a>';
		}
	}
	
	
    return operation;
} 

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
function submitDetachedAudit(taskId,id,auditType,processId){
	var buttonName='审批';
	if(auditType=='sfsPut'){
		buttonName='处理';
	}
	parent.$.modalDialog({
        title : '流程审批',
        iconCls:'fi-clipboard-pencil icon-blue',
        width : sy.getBrowerWidth()-300,
        height : sy.getBrowerHeight()-290,
        resizable:true,
        maximizable:true,
        href : '${ctx}/endcorrect/detached/detachedAudit?id='+ id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
        buttons : [ {
            text : buttonName,
            iconCls:'fi-clipboard-pencil icon-blue',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#t_detached_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#detachedAuditForm');
                f.submit();
            }
        },{
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
           	 parent.$.modalDialog.handler.dialog('close');
            }
        } ]
    });
}
//详细
function detachedDetail(id){
	 parent.$.modalDialog({
         title : '脱管详情',
         iconCls:'fi-info icon-blue',
         width : sy.getBrowerWidth()-300,
         height : sy.getBrowerHeight()-300,
         resizable:true,
         maximizable:true,
         href : '${ctx}/endcorrect/detached/detail?id=' + id,
         buttons : [{
             text : '关闭',
             iconCls:'fi-x icon-blue',
             handler : function() {
            	 parent.$.modalDialog.handler.dialog('close');
             }
         } ]
     });

}
//上报
/* function submitDetached(id){
	$.ajax({
		type : 'get',
		url : "${ctx}/endcorrect/detached/submitDetached?id=" + id,
		cache : false,
		async : false, //同步请求
		dataType : 'json',
		success : function(result) {
			if(result.status==200){
 					$.messager.show({
  					title : '提示信息!',
  					msg : '上报成功!'
  				});
 				}
			$('#t_detached_list_content').datagrid('reload',{});
		}
	});
} */


//流程终止
function stopProcess(taskId){
	$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
	      if (b){  
	    	  $.ajax({
	  			type : 'get',
	  			url : "${ctx}/endcorrect/detached/stopProcess?taskId=" + taskId,
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
	  				$('#t_detached_list_content').datagrid('reload',{});
	  			}
	  		});
	  		
	      }
	});  
	
}


//增加
function addDetached(){
	 parent.$.modalDialog({
         title : '新增脱管信息',
         iconCls:'fi-plus icon-green',
         width : sy.getBrowerWidth()-300,
         height : sy.getBrowerHeight()-260,
         resizable:true,
         maximizable:true,
         href : '${ctx}/endcorrect/detached/add',
         buttons : [ {
             text : '保存',
             iconCls:'icon-save',
             handler : function() {
                 parent.$.modalDialog.openner_dataGrid = $('#t_detached_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                 var f = parent.$.modalDialog.handler.find('#detachedInfo');
                 f.submit();
             }
         },{
             text : '重置',
             iconCls:'icon-undo',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#detachedInfo');
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
function editDetached(id){
	 parent.$.modalDialog({
        title : '编辑脱管信息',
        iconCls:'fi-pencil icon-blue',
        width : sy.getBrowerWidth()-300,
        height : sy.getBrowerHeight()-260,
        resizable:true,
        maximizable:true,
        href : '${ctx}/endcorrect/detached/add?id='+id,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#t_detached_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#detachedInfo');
                f.submit();
            }
        },{
            text : '重置',
            iconCls:'icon-undo',
            handler : function() {
           	 var f = parent.$.modalDialog.handler.find('#detachedInfo');
           	 f.get(0).reset(); //清空表单数据 
            }
        },{
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
           	 parent.$.modalDialog.handler.dialog('close');
            }
        }   ]
    });
}


function deleteDetached(){
	var arr = $('#t_detached_list_content').datagrid('getSelections');
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
					url: '${ctx}/endcorrect/detached/delete',
					cache:false ,
					data:{id:arr[0].id},
					dataType:'json',
					success:function(result){
						//1 刷新数据表格 
						$('#t_detached_list_content').datagrid('reload');
						//2 清空idField   
						$('#t_detached_list_content').datagrid('uncheckAll');
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

//timestamp转换date
/* var Common_detached = {
    formatDate: function (value) {
    	console.log(value);
        if (value == null || value == '') {
            return '';
        }
        var dt;
        if (value instanceof Date) {
            dt = value;
        } else {
            dt = new Date(value);
        }
        return dt.format("yyyy-MM-dd HH:mm"); //扩展的Date的format方法(上述插件实现)
    }
} */
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
	 <form id="detachedSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
   <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
         <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
          <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="t_detached_list_content"/>
           </c:if>
          <div class="easyui-panel search-form" data-options="fit:true,border:false" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目</c:if>" style="width:100%;">
			<table>
				<tr>
				<td class="search-title">矫正对象：</td>
					<td><input name="culprit.name" class="easyui-textbox" /></td>
				</tr>
				<tr>
				<td class="search-title">上报起始：</td>
					<td><input name="reportTimeStart" id="reportTimeStart" class="Wdate easyui-validatebox" editable=false
					onfocus="var reportTimeEnd=$dp.$('reportTimeEnd');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'reportTimeEnd\')}'})"  /></td>
				</tr>
				<tr>
				<td class="search-title" style="text-align:right">上报截止：</td>
					<td><input name="reportTimeEnd" id="reportTimeEnd" class="Wdate easyui-validatebox" 
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'reportTimeStart\')}'})" editable="false"   /></td>
				</tr>
				<tr>
				<td class="search-title">脱管起始：</td>
					<td><input name="detachedTimeStart" id="detachedTimeStart" class="Wdate easyui-validatebox" 
					onfocus="var detachedTimeEnd=$dp.$('detachedTimeEnd');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'detachedTimeEnd\')}'})" editable="false"   /></td>
				</tr>
				<tr>
				<td class="search-title" style="text-align:right">脱管截止：</td>
					<td><input name="detachedTimeEnd" id="detachedTimeEnd" class="Wdate easyui-validatebox" 
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'detachedTimeStart\')}'})"  editable="false"  /></td>
				</tr>
				<tr>
				<td class="search-title">掌握起始：</td>
					<td><input name="graspTimeStart" id="graspTimeStart" class="Wdate easyui-validatebox" 
					onfocus="var graspTimeEnd=$dp.$('graspTimeEnd');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd  HH:mm',maxDate:'#F{$dp.$D(\'graspTimeEnd\')}'})" editable="false" /></td>
				</tr>
				<tr>
				<td class="search-title" style="text-align:right">掌握截至：</td>
					<td><input name="graspTimeEnd" id="graspTimeEnd" class="Wdate easyui-validatebox" 
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd  HH:mm',minDate:'#F{$dp.$D(\'graspTimeStart\')}'})"  editable="false"  /></td>
				</tr>
			</table>
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
		 <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#t_detached_list_content').datagrid('load' ,$.serializeObject($('#detachedSearchForm')));"
		 				id="searchDetachedBtn">查询</a> &nbsp;&nbsp; 
			<a href="#" class="easyui-linkbutton" id="cleanDetachedBtn" iconCls="icon-undo" onclick="javascript:$('#detachedSearchForm').form('clear');$('#t_detached_list_content').datagrid('load', {});">清空</a></div>
		</div>
	</div>
	</form>
    <div data-options="region:'center',border:true" >
        <table class="easyui-datagrid" id="t_detached_list_content" title="脱管管理列表"
			data-options="singleSelect:true,fit:true,toolbar:'#detached_toolbar',rownumbers: true,
			collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/endcorrect/detached/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-linkbutton-map').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle icon-blue'});
                        $('.organization-easyui-linkbutton-stop').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
                        $('.organization-easyui-linkbutton-clipboard-pencil').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                   		 $('.organization-easyui-linkbutton-arrow-up').linkbutton({text:'上报',plain:true,iconCls:'fi-arrow-up icon-blue'});
                    	$('.organization-easyui-linkbutton-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'culpritName',width:'10%',align:'center'">矫正对象</th>
					<th data-options="field:'groupName',width:'10%',align:'center'">司法所</th>
					<th data-options="field:'reportTime',width:'10%',align:'center',sortable:true">上报时间</th>
					<th data-options="field:'detachedTime',width:'15%',align:'center',sortable:true">脱管时间</th>
					<th data-options="field:'graspTime',width:'15%',align:'center',sortable:true">掌握信息时间</th>
					<th data-options="field:'activityName',width:'10%',align:'center'">审批状态</th>
				 <th data-options="field:'_opt',width:'28%',align:'center',formatter:formatOper">操作</th>  

				</tr>
			</thead>
		</table>
    </div>
</div>
<div id="detached_toolbar" style="display: none;">
		 <shiro:hasPermission name="endcorrect/detached/add">
        <a onclick="addDetached();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
        </shiro:hasPermission>
        <!-- <a onclick="editDetached();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-pencil icon-blue'">修改</a> -->
         <shiro:hasPermission name="endcorrect/detached/delete">
        <a onclick="deleteDetached();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>
		</shiro:hasPermission>
</div>



