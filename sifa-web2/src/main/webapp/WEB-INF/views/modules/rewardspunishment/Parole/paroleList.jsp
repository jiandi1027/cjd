<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<div class="easyui-layout" data-options="fit:true,border:false">	
<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:false">
        <div region="center" border="false">
        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
          <sys:sysGroup hiddenId="sysGroupId" hiddenName="sysGroupId" dataGridId="parole_list_content"/>
          </c:if>
           <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目</c:if>" style="width:100%;">
		<form id="paroleSearchForm" style="padding-bottom: 10px;padding-top: 10px;">
			<table>
				<tr>
					<td class="search-title">矫正对象：</td>
					<td>
						<input name="name" class="easyui-textbox" />
					</td>
				</tr>		
				<tr>
					<td class="search-title">假释年限：</td>
					<td>
						<input name="reduceTime" class="easyui-textbox" />
					</td>
				</tr>
				<tr>
						<td class="search-title">申请起始：</td>
						<td><input name="searchStartDate" id="searchStartDate" editable="false" class="Wdate easyui-validatebox" 
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'searchEndDate\',{d:-1})}'})"/></td>
						<!-- <td>
							<input name="searchStartDate"
						  class="Wdate easyui-validatebox"
						onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" />
						</td> -->
					</tr>
					<tr>
						<td class="search-title">申请截止：</td>
						 <td><input name="searchEndDate" id="searchEndDate" editable="false"  class="Wdate easyui-validatebox" 
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate\',{d:1})}'})"/></td>
						<!-- <td><input name="searchEndDate" class="Wdate easyui-validatebox"
						onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
						  /></td> -->
					</tr>	
			</table>
		</form>
	</div>
	</div>
		<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" ><a
			href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#parole_list_content').datagrid('load' ,$.serializeObject($('#paroleSearchForm')));"
			id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
			class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#paroleSearchForm').form('clear');">清空</a></div>
		</div>
	</div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="parole_list_content" style="height: 400px;"  title="假释列表"
			data-options="singleSelect:true,collapsible:true,striped:true,fitColumns:true,fit:true,toolbar:'#parole_toolbar',loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/rewardspunishment/parole/list',method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
				  $('.organization-easyui-linkbutton-edit1').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'}); 
				  $('.organization-easyui-linkbutton-edit2').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle  icon-blue'});
				  $('.organization-easyui-linkbutton-edit3').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
				  $('.organization-easyui-parole-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
		 }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:'5%'">编号</th>
					<th data-options="field:'culpritName',width:'15%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">矫正对象</th>
					<th data-options="field:'sysGroupName',width:'15%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">司法所</th>
					<th data-options="field:'created',width:'15%',align:'center',sortable:true,formatter:Common.formatDate"
						editor="text">申请时间</th>
					<th data-options="field:'reduceTime',width:'15%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">假释年限</th>
					<th data-options="field:'activityName',width:'15%',align:'center'"
						editor="text">审批状态</th>
				 	<th data-options="field:'_opt',width:'23%',formatter:formatOperate,align:'center'">操作</th>  
				</tr>
			</thead>
		</table>
	</div>
<div id="parole_toolbar" style="display: none;">
   	  <shiro:hasPermission name="rewardspunishment/Parole/add"> 
        	<a onclick="addParole(id);" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
      </shiro:hasPermission> 
       <!--  <a onclick="editProbationFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-pencil icon-blue'">修改</a> -->
        <shiro:hasPermission name="rewardspunishment/Parole/del"> 
        	<a onclick="delParole();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>
		 </shiro:hasPermission>
</div>
<script type="text/javascript">
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
	
//增加
function addParole(id){
	 parent.$.modalDialog({
         title : '新增假释信息',
         iconCls:'fi-plus icon-green',
         width : sy.getBrowerWidth()-250,
         height : sy.getBrowerHeight()-200,
         resizable : true,
         maximizable:true, 
         href : '${ctx}/rewardspunishment/parole/form',
         buttons : [ {
             text : '保存',
             iconCls:'icon-save', 
             handler : function() {
            	 parent.$.modalDialog.openner_dataGrid = $('#parole_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
            	 var f = parent.$.modalDialog.handler.find('#paroleAddInfo');
            	 reportType=1;
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
//修改
function editParole(id){
	parent.$.modalDialog({
        title : '修改假释信息',
        iconCls:'fi-pencil icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-200,
        resizable : true,
        maximizable:true, 
        href : '${ctx}/rewardspunishment/parole/form?id='+id,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save', 
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#parole_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#paroleAddInfo');
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
function delParole(){
	var arr = $('#parole_list_content').datagrid('getSelections');
	if (arr.length <= 0) {
		$.messager.alert({
			title : '提示信息!',
			msg : '请至少选择一行记录进行删除!'
		});
	}else {
		$.messager.confirm('提示信息', '确认删除?', function(r) {
			if (r) {
				$.ajax({
					type: 'post' ,
					url: '${ctx}/rewardspunishment/parole/delete',
					cache:false ,
					data:{id:arr[0].id},
					dataType:'json',
					success:function(result){
						//1 刷新数据表格 
						$('#parole_list_content').datagrid('reload');
						//2 清空idField   
						$('#parole_list_content').datagrid('uncheckAll');
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

$(function(){
	$('#searchbtn').click(
			function() {
				$('#parole_list_content').datagrid('load',
						serializeForm($('#searchForm')));
			});
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
//终止流程
function stopProcess(taskId){
	$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
	      if (b){  
	    	  $.ajax({
	  			type : 'get',
	  			url : "${ctx}/rewardspunishment/parole/stopProcess/?taskId=" + taskId,
	  			cache : false,
	  			async : false, //同步请求
	  			dataType : 'json',
	  			success : function(result) {
	  				if(result.status==200){
	  					$.messager.show({
	       					title:'提示信息!' ,
	       					msg:result.msg
	  					});
	  					  
	  					self.parent.$('#parole_list_content').datagrid('reload');
	  				}else{ 
	  					$.messager.show({
	       					title:'提示信息!' ,
	       					msg:result.msg
	  					});
	  					  
	  					self.parent.$('#parole_list_content').datagrid('reload');
	       					
	  				}
	  				
	  			}
	  		});
	  		
	      }
	});  
}
function formatOperate(val,row,index){  
	var space = '&nbsp;';
	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-info\'" onclick="detail(\''+row.id+'\',\''+row.isEnd+'\')">详情</a>';
	/* if(row.activityName==null){
		//var operation=operation+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:submitProbationDetail(\'{0}\');"  title="上报"><span style="color:blue;"><strong><u>上报</u><strong></span></a>', row.id)
		//var operation=operation+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:preSubmit(\'{0}\');"  title="上报"><span style="color:blue;"><strong><u>上报</u><strong></span></a>', row.id)
		var operation=operation+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:edit(\'{0}\');"   class="organization-easyui-linkbutton-edit1" data-options="plain:true,iconCls:\'fi-clipboard-pencil\'" title="上报/修改"></a>', row.id)
	} */
	if(row.hasPermission==1 && row.auditType=="sfsReport"){
		operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-parole-pencil"  onclick="editParole(\''+row.id+'\')">修改</a>';
		}
	if(row.hasPermission==1){
		operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit1" data-options="plain:true,iconCls:\'fi-clipboard-pencil\'" onclick="submitAuditParole(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">流程处理</a>';
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		var processDetailUrl="/rewardspunishment/parole/forProcessDetail?id="+row.id;
		if(row.isEnd==1){
			var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
			operation=operation+'&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit2" data-options="plain:true,iconCls:\'fi-map\'" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
		}else{
			var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit2" data-options="plain:true,iconCls:\'fi-map\'" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
		}
		
	}
	/* if(row.processInstanceId!='' && row.processInstanceId!=null){
		
		if(row.isEnd==0 && row.hasPermission==1){
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit3" data-options="plain:true,iconCls:\'fi-map\'" onclick="stopProcess(\''+row.taskId+'\')">终止</a>';
		}
	} */
	
	return operation;
}

/* $.formatString = function(str) {
		for ( var i = 0; i < arguments.length - 1; i++) {
			str = str.replace("{" + i + "}", arguments[i + 1]);
		}
	return str;
} */

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
	 parent.$.modalDialog({
         title : '假释流程',
         resizable : true,
         maximizable:true,
         iconCls:'fi-shuffle  icon-blue',
         width : sy.getBrowerWidth()-250,
         height : sy.getBrowerHeight()-150,
         href : url
     });
}
//详细链接
function detail(id,isEnd){
	if(isEnd!=0){
	 parent.$.modalDialog({
         title : '假释审核详情',
         iconCls:'fi-info icon-blue',
         resizable : true,
         maximizable:true,
         width : sy.getBrowerWidth()-250,
         height : sy.getBrowerHeight()-150,
         href : '${ctx}/rewardspunishment/parole/paroleDetail?id='+id,
         buttons :[
                   {
                	   text : '打印社区服刑人员假释建议书',  
                	   iconCls : 'fi-print icon-blue',
                	   handler:function(){
                		   var f = parent.$.modalDialog.handler.find('#parole1');
  		                	 f.click();
           			}
                   },
                   {
				text : '关闭',
				iconCls : 'fi-x icon-blue',
				handler : function() {
					parent.$.modalDialog.handler.dialog('close');
				}
			}
                   
                   ]
     });
	}else{
		parent.$.modalDialog({
	         title : '假释审核详情',
	         iconCls:'fi-info icon-blue',
	         resizable : true,
	         maximizable:true,
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         href : '${ctx}/rewardspunishment/parole/paroleDetail?id='+id,
	         buttons :[
	                   {
					text : '关闭',
					iconCls : 'fi-x icon-blue',
					handler : function() {
						parent.$.modalDialog.handler.dialog('close');
					}
				}
	                   
	                   ]
	     });
	}
}
//流程审批
function submitAuditParole(taskId,id,auditType,processId){
	var text = '审批';
	var title='流程审批';
	var iconCls='fi-clipboard-pencil icon-blue';
	if(auditType=='sfsReport'){
		text='上报';
		title='上报';
		iconCls='fi-arrow-up icon-blue';
	}if(auditType=='gs'){
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
	         href : '${ctx}/rewardspunishment/parole/parolePrint?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
	         buttons : [ {
		            text : "告知",
		            iconCls:'fi-results-demographics icon-blue',
		            handler : function() {
		            	if($('#isPrintJYS').html()==''){
		            		$.messager.alert({
	        					title : '提示信息!',
	        					msg : '请打印后再告知!'
	        				});	
		            		return false;
		            	}
		               	parent.$.modalDialog.openner_dataGrid = $('#parole_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		               	var f = parent.$.modalDialog.handler.find('#parole_inform_btn');
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
	         href : '${ctx}/rewardspunishment/parole/paroleAudit?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
	         buttons : [ {
	             text : text,
	             iconCls:iconCls,
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#parole_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#paroleAuditForm');
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
</script>
</div>