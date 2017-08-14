<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>
<script type="text/javascript">
var accountRold='${sysAccount.roleId}';//此处用于控制上报权限
function specialAreaformatOper(val,row,index){  
	var space = '&nbsp;';
	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="detailSpecialArea(\''+row.id+'\',\''+row.auditType+'\',\''+row.isEnd+'\')">详情</a>';
	if(row.activityName==null){
		<shiro:hasPermission name="dailymgr/specialArea/arrowUp">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-arrow-up" data-options="plain:true,iconCls:\'fi-arrow-up icon-blue\'"  onclick="addSpecialArea(\''+row.id+'\')">上报</a>';
		</shiro:hasPermission>
	}
	/* if(row.hasPermission==1 && (accountRold=='3003')){
		operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" onclick="editSpecialArea(\''+row.id+'\')">修改</a>';
	} */
	if(row.hasPermission==1){
		operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-clipboard-pencil" onclick="submitAuditSpecialArea(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">处理</a>';
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		var processDetailUrl="/dailymgr/specialArea/forProcessDetail?id="+row.id;
		if(row.isEnd==1){
			var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-map" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
		}else{
			var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-map" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
		}
		
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
	
		if(row.isEnd==0 && row.hasPermission==1){
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-stop" onclick="stopProcess(\''+row.taskId+'\')">终止</a>';
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
function submitAuditSpecialArea(taskId,id,auditType,processId){
	var buttonName='审批';
	var icon='fi-clipboard-pencil icon-blue';
	if(auditType=='sfsPrint'){
		buttonName='处理';
	}
	if(auditType!='sfsPrint'){
		parent.$.modalDialog({
		       title : '流程审批',
		       iconCls:icon,
		       width : sy.getBrowerWidth()-300,
		       height : sy.getBrowerHeight()-200,
		       resizable:true,
		       maximizable:true,
		       href : "${ctx}/dailymgr/specialArea/specialAreaAudit?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
		       buttons : [ {
		           text : buttonName,
		           iconCls:'fi-clipboard-pencil icon-blue',
		           handler : function() {
		               parent.$.modalDialog.openner_dataGrid = $('#t_specialArea_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		               var f = parent.$.modalDialog.handler.find('#specialAuditForm');
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
	        href : "${ctx}/dailymgr/specialArea/specialAreaFinishPrint?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
	        buttons : [ {
	            text : "告知",
	            iconCls:'fi-results-demographics icon-blue',
	            handler : function() {
	            	if($('#specialArea_isPrintSHB').html()==''){
	            		$.messager.alert({
        					title : '提示信息!',
        					msg : '请打印后再告知!'
        				});	
	            		return false;
	            	}
	               	parent.$.modalDialog.openner_dataGrid = $('#t_specialArea_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	               	var f = parent.$.modalDialog.handler.find('#specialArea_inform_btn');
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
function detailSpecialArea(id,auditType,isEnd){
	 parent.$.modalDialog({
         title : '进入特定区域管理详情',
         iconCls:'fi-info icon-blue',
         width : sy.getBrowerWidth()-400,
         height : sy.getBrowerHeight()-250,
         resizable:true,
         maximizable:true,
         href : '${ctx}/dailymgr/specialArea/detail?id=' + id,
          buttons : [ {
        	  id : 'listSpecialAreaPrint1',
        	 text : '打印《社区服刑人员进入特定区域（场所）审批表》',
        	 iconCls:'fi-print icon-blue',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#specialAreaPrint1');
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
	 
	 $('#listSpecialAreaPrint1').hide();
		if (isEnd == 1) {
			$('#listSpecialAreaPrint1').show();
		}

}


//流程终止
function stopProcess(taskId){
	$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
	      if (b){  
	    	  $.ajax({
	  			type : 'get',
	  			url :  "${ctx}/dailymgr/specialArea/stopProcess?taskId=" + taskId,
	  			cache : false,
	  			async : false, //同步请求
	  			dataType : 'json',
	  			success : function(result) {
	  				$.messager.show({
 	  					title:'提示信息!',
 	  					msg:result.msg
 	  				});
	  				$('#t_specialArea_list_content').datagrid('reload',{});
	  			}
	  		});
	  		
	      }
	});  
	
}
//增加
function addSpecialArea(id){
	var title='';
	var iconCls='';
	if(id!=null){
		title='上报';
		iconCls='fi-arrow-up icon-blue';
	}else{
		title='新增';
		iconCls='fi-plus icon-green';
	}
	 parent.$.modalDialog({
         title : title,
         iconCls:iconCls,
         width : sy.getBrowerWidth()-350,
         height : sy.getBrowerHeight()-250,
         href : '${ctx}/dailymgr/specialArea/form?id='+id,
         resizable:true,
         maximizable:true,
         buttons : [ {
             text : '保存',
             iconCls:'icon-save',
             handler : function() {
                 parent.$.modalDialog.openner_dataGrid = $('#t_specialArea_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                 var f = parent.$.modalDialog.handler.find('#specialAreaInfo');
                 f.submit();
             }
         },{
        	 text : '上报',
        	 iconCls:'fi-arrow-up icon-blue',
             handler : function() {
            	if($("#specialAreaInfo").form('validate')){
            		$.messager.confirm('提示', '是否确定所有信息都已填写完整？上报后不能修改！', function(b){ 
         		       if (b){ 
         		    	   $.ajax({
         						type: 'post' ,
         						url: '${ctx}/dailymgr/specialArea/submitSpecialArea',
         						cache:false ,
         						data:$.serializeObject($('#specialAreaInfo')) ,
         						dataType:'json',
         						success:function(data){
         							$('#t_specialArea_list_content').datagrid('reload');
                  					parent.$.modalDialog.handler.dialog('close');
                  					$.messager.show({
         			  					title:'提示信息!',
         			  					msg:'上报成功!'
         			  				});
         						} ,
         						error:function(result){
         							$.messager.show({
         			  					title:'提示信息!',
         			  					msg:data.msg
         			  				});
         						}
         					});
         				}else{
         					 $.messager.show({
         						title:'提示信息!' ,
         						msg:'验证失败！请检查数据是否已填写完整!'
         					}); 
         		      	} 
         			});
         		}
            }
         },{
             text : '重置',
             iconCls:'icon-undo',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#specialAreaInfo');
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

//* /修改
 function editSpecialArea(id){
	 parent.$.modalDialog({
        title : '修改申请信息',
        iconCls:'fi-pencil icon-blue',
        width : sy.getBrowerWidth()-350,
        height : sy.getBrowerHeight()-250,
        href : '${ctx}/dailymgr/specialArea/form?id='+id,
        resizable:true,
        maximizable:true,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#t_specialArea_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#specialAreaInfo');
                f.submit();
            }
        },{
        	text : '上报',
        	iconCls:'fi-arrow-up icon-blue',
            handler : function() {
           	if($("#specialAreaInfo").form('validate')){
           		$.messager.confirm('提示', '是否确定所有信息都已填写完整？上报后不能修改！', function(b){ 
        		       if (b){ 
        		    	   $.ajax({
        						type: 'post' ,
        						url: '${ctx}/dailymgr/specialArea/submitSpecialArea',
        						cache:false ,
        						data:$.serializeObject($('#specialAreaInfo')) ,
        						dataType:'json',
        						success:function(data){
        							$('#t_specialArea_list_content').datagrid('reload');
                 					parent.$.modalDialog.handler.dialog('close');
        						} ,
        						error:function(result){
        							$.messager.show({
        			  					title:'提示信息!',
        			  					msg:data.msg
        			  				});
        						}
        					});
        				}else{
        					 $.messager.show({
        						title:'提示信息!' ,
        						msg:'验证失败！请检查数据是否已填写完整!'
        					}); 
        		      	} 
        			});
        		}
           }
        },{
            text : '重置',
            iconCls:'icon-undo',
            handler : function() {
           	 var f = parent.$.modalDialog.handler.find('#specialAreaInfo');
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

//删除
function deleteSpecialArea(){
	var arr = $('#t_specialArea_list_content').datagrid('getSelections');
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
	} else {
		$.messager.confirm('提示信息', '确认删除?', function(r) {
			if (r) {
				$.post('${ctx}/dailymgr/specialArea/delete', {
					id : arr[0].id
				}, function(result) {
					//1 刷新数据表格 
					$('#t_specialArea_list_content').datagrid('reload');
					//2 清空idField   
					$('#t_specialArea_list_content').datagrid('uncheckAll');
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
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
<form id="specialAreaSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
         <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
          <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="t_specialArea_list_content"/>
          </c:if>
           <div class="easyui-panel search-form" data-options="fit:true,border:false" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目</c:if>" style="width:100%;">
        
			<table>
				<tr>
				<td class="search-title">矫正对象：</td>
					<td><input name="culprit.name" class="easyui-textbox"/></td>
				</tr>
				<tr>
				<td class="search-title">申请起始：</td>
					<td><input name="searchStartDate" id="searchStartDate" class="Wdate easyui-validatebox"  editable="false" 
					onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" /></td>
				</tr>
				<tr>
				<td class="search-title" style="text-align:right">申请截止：</td>
					<td><input name="searchEndDate" id="searchEndDate" class="Wdate easyui-validatebox" onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate\')}'})"   editable="false"  /></td>
				</tr>
			</table>
		
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
		 <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#t_specialArea_list_content').datagrid('load' ,$.serializeObject($('#specialAreaSearchForm')));">查询</a> &nbsp;&nbsp; 
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo" onclick="javascript:$('#specialAreaSearchForm').form('clear');$('#t_specialArea_list_content').datagrid('load', {});">清空</a></div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_specialArea_list_content" title="进入特定区域管理列表"
			data-options="singleSelect:true,fit:true,rownumbers:true,collapsible:true,striped:true,toolbar:'#specialArea_toolbar',loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,
			pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/specialArea/list',method:'post',onLoadSuccess:function (data) {
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
					<th data-options="field:'culpritName',width:'7%',align:'center'">矫正对象</th>
					<th data-options="field:'groupName',width:'10%',align:'center'">司法所</th>
					<th data-options="field:'area',width:'30%',align:'center'">申请进入区域</th>
					<th data-options="field:'applyDate',width:'10%',align:'center',sortable:true">申请时间</th>
					<th data-options="field:'activityName',width:'10%',align:'center'">审批状态</th>
				 	<th data-options="field:'_opt',width:'31%',formatter:specialAreaformatOper,align:'center'">操作</th>  

				</tr>
			</thead>
		</table>
	</div>
	<div id="specialArea_toolbar" style="display: none;">
		<shiro:hasPermission name="dailymgr/specialArea/form">
			<a onclick="addSpecialArea(id);" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
        </shiro:hasPermission>
        <!-- <a onclick="editSpecialArea();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-pencil icon-blue'">修改</a>  -->
       <shiro:hasPermission name="dailymgr/specialArea/delete">
        	<a onclick="deleteSpecialArea();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>
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

