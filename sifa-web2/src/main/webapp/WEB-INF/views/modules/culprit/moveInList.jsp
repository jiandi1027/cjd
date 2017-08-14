<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>
<div class="easyui-layout" data-options="fit:true,border:false">
<form id="moveInSearchForm" style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:false">
        <div region="center" border="false">
         <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
			<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="moveIn_list_content"/>
	        </c:if>
           <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目</c:if>" style="width:100%;">
			<table>
				<tr>
					<td class="search-title">迁入对象：</td>
					<td>
						<input name="name"  class="easyui-textbox"/>
					</td>
				</tr>
				<tr>
					<td class="search-title">身份证号：</td>
					<td>
						<input name="cedentialsNumber"  class="easyui-textbox"/>
					</td>
				</tr>
				<tr>
					<td class="search-title">迁入起始：</td>
					<td><input name="startDate" id="startDate" editable="false" class="Wdate easyui-validatebox" 
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\',{d:-1})}'})"/></td>
				</tr>
				<tr>
					<td class="search-title">迁入截止：</td>
					<td><input name="endDate" id="endDate" editable="false"  class="Wdate easyui-validatebox" 
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startDate\',{d:1})}'})"/></td>
				</tr>

			</table>
	</div>
	</div>
		<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" ><a
			href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#moveIn_list_content').datagrid('load' ,$.serializeObject($('#moveInSearchForm')));"
			id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
			class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#moveInSearchForm').form('clear');$('#moveIn_list_content').datagrid('load' ,{});">清空</a></div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="moveIn_list_content" style="height: 400px;" title="迁入列表" 
			data-options="singleSelect:true,collapsible:true,fit:true,striped:true,fitColumns:true,toolbar:moveInListToolbar,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/culprit/moveIn/list',method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-moveIn-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
				   $('.organization-easyui-moveIn-play').linkbutton({text:'开始调查',plain:true,iconCls:'fi-play icon-blue'});
				  $('.organization-easyui-moveIn-arrow').linkbutton({text:'指派',plain:true,iconCls:'fi-arrow-right icon-blue'}); 
				   $('.organization-easyui-moveIn-arrow-up').linkbutton({text:'上报',plain:true,iconCls:'fi-arrow-up icon-blue'}); 
				  $('.organization-easyui-moveIn-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
				  $('.organization-easyui-moveIn-clipboard-pencil').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'}); 
				  $('.organization-easyui-moveIn-map').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle  icon-blue'});
				  $('.organization-easyui-moveIn-end').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
				
		 }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:'5%'">编号</th>
					<th data-options="field:'name',width:'13%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">迁入对象</th>
					<th data-options="field:'moveTime',width:'19%',align:'center',sortable:true"
						editor="{type:'validatebox',options:{required:true}}">迁入时间</th>
					<th data-options="field:'cedentialsNumber',width:'19%',align:'center'" editor="text">身份证号码</th>
					<!--<th data-options="field:'endDate',width:250,align:'center'"
						editor="text">录入时间</th>
					<th data-options="field:'redressPeriod',width:250,align:'center'"
						editor="text">矫正起止时间</th>-->
					<th data-options="field:'groupName',width:'10%',align:'center'"
						editor="text">司法所</th>
					<th data-options="field:'activityName',width:'9%',align:'center'"
						editor="text">流程状态</th>
					<th data-options="field:'action',width:'28%',align:'center'" formatter="formatterAct">操作</th>
				</tr>
			</thead>
		</table>
	</div>
<div  id="moveInListToolbar" style="display: none;"> 
	<shiro:hasPermission name="moveIn/add">
        <a onclick="addMoveIn();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'" >新增</a>
     </shiro:hasPermission> 
     <shiro:hasPermission name="moveIn/delete">  
        <a onclick="batchDeleteMoveIn();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>
	</shiro:hasPermission>
</div> 

</div>
<script type="text/javascript">
var hasOpen9=false;
	var flag; //undefined 判断新增和修改方法
	function batchDeleteMoveIn(){
		var arr = $('#moveIn_list_content').datagrid('getSelections');
		if (arr.length <= 0) {
			$.messager.show({
				title : '提示信息!',
				msg : '至少选择一行记录进行删除!'
			});
		} 
		else {
			$.messager.confirm('提示信息', '确认删除?', function(r) {
				if (r) {
					var ids = '';
					for (var i = 0; i < arr.length; i++) {
						if (i == 0) {
							ids += arr[i].id
						} else {
							ids += "," + arr[i].id;
						}
					}
					$.post('${ctx}/culprit/moveIn/batchDelete', {
						ids : ids
					}, function(result) {
						if(result.status==200){
							$.messager.show({
								title : '提示信息!',
								msg : '删除成功!'
							});
						}else{
							$.messager.show({
								title : '提示信息!',
								msg : '删除失败!'
							});
						}
						//1 刷新数据表格 
						$('#moveIn_list_content').datagrid('reload');
						//2 清空idField   
						$('#moveIn_list_content').datagrid('uncheckAll');
						//3 给提示信息 
					});
				} else {
					return;
				}
			});
		}
	}
	
	/**
	 *  提交表单方法
	 */
	
	$(function() {

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
		$('#cleanSearch').click(function () {
			$('#t_list_content').datagrid('load', {});
			$('#searchForm').form().find('input').val('');
		});
	});



//格式化函数
function formatterAct(value,row,index){
	var space = '&nbsp;';
	var operation='<a href="javascript:void(0);" class="organization-easyui-moveIn-info" onclick="detailMoveIn(\''+row.id+'\',\''+row.isEnd+'\')">详细</a>';
	if(row.auditType == 'jzkZp' && row.isEnd==0){//修改
		<shiro:hasPermission name="moveIn/edit">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-moveIn-pencil" onclick="editMoveIn(\''+row.id+'\')">修改</a>';
		</shiro:hasPermission> 
	}
	if (row.hasPermission==1) {
		if (row.auditType == 'jzkZp') {
			<shiro:hasPermission name="moveIn/zhiPan">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-moveIn-arrow"  onclick="zhiPanMoveIn(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">指派</a>';
			</shiro:hasPermission>
		}else if(row.auditType == 'sfsAccept'){
			<shiro:hasPermission name="moveIn/diaoCha">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-moveIn-play" onclick="diaoCha(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">开始调查</a>';
			</shiro:hasPermission>
		}else if(row.auditType == 'sfsReport'){
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-moveIn-arrow-up"  onclick="submitMoveIn(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">上报</a>';	
		}else if(row.auditType == 'sfsCheck' || row.auditType == 'jzkCheck' || row.auditType == 'xfgCheck'){
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-moveIn-clipboard-pencil"  onclick="submitMoveIn(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">处理</a>';	
		}else if(row.auditType == 'jzkReport'){//打印
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-moveIn-clipboard-pencil"  onclick="printMoveIn(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">处理</a>';	
		}
	}
	
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		var processDetailUrl="/culprit/moveIn/forProcessDetail?id="+row.id;
		if(row.isEnd==1){
			var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-moveIn-map" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
		}else{
			var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-moveIn-map" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
		}
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		if(row.isEnd==0 && row.hasPermission==1){
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-moveIn-end" onclick="stopProcess(\''+row.taskId+'\')">终止</a>';
		}
	}
    return operation;

}
	
//开始调查	
function diaoCha(taskId,id,auditType,processId){
	parent.$.modalDialog({
        title : '迁入调查受理',
        iconCls:'fi-play icon-blue',
        width : sy.getBrowerWidth()-300,
	    height : 550,
        maximizable:true,
        resizable:true,
        href : '${ctx}/culprit/moveIn/diaoCha?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
        buttons : [ {
            text : '提交',
            iconCls:'fi-arrow-right icon-blue',
            handler : function() {
            	 parent.$.modalDialog.openner_dataGrid = $('#moveIn_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
				$('#diaoChaBtn').click();
            }
        },{text : '退回',
	    	iconCls:'fi-arrow-left icon-blue',
			 handler : function() {
				parent.$.modalDialog.openner_dataGrid = $('#moveIn_list_content').datagrid();
				$('#backMoveIn').dialog({
					buttons : [ {
			            text : '退回',
			            iconCls:'fi-arrow-left icon-blue',
			            handler : function() {
			            	 parent.$.modalDialog.openner_dataGrid = $('#moveIn_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							$('#diaoChaBackBtn').click();
			            }
			        },{text : '关闭',
			        	iconCls:'fi-x icon-blue',
			     		 handler : function() {
			     			$('#backMoveIn').dialog('close');
							parent.$.modalDialog.handler.dialog('close');
							
			     		 }
					}]
				})
				$('#backMoveIn').dialog('open');
			 }
		} ,{text : '关闭',
        	iconCls:'fi-x icon-blue',
    		 handler : function() {
				parent.$.modalDialog.handler.dialog('close');	
    		 }
		}]
       
    });
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

//指派
function zhiPanMoveIn(taskId,id,auditType,processId){
	 parent.$.modalDialog({
	        title : '迁入指派',
	        iconCls:'fi-arrow-right icon-blue',
	        width : sy.getBrowerWidth()-200,
		    height : sy.getBrowerHeight()-150,
	        href : '${ctx}/culprit/moveIn/form?id='+id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
	        resizable : true,
	        maximizable:true, 
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#moveIn_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#moveInAddInfo');
	                f.submit();
	            }
	        },{
	            text : '指派',
	            iconCls:'fi-arrow-right icon-blue',
	            handler : function() {
	            	parent.$.modalDialog.openner_dataGrid = $('#moveIn_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	            	 var f = parent.$.modalDialog.handler.find('#zhipanWithSaveBtn');
	            	f.click();
	            }
	        },{
	       	 	text : '关闭',
	           	iconCls:'fi-x icon-blue',
	         		 handler : function() {
	         			parent.$.modalDialog.openner_dataGrid = $('#moveInAddInfo').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
						parent.$.modalDialog.handler.dialog('close');
	         		
	         		 }
			}  ]
	    });
}	


//处理
function submitMoveIn(taskId,id,auditType,processId){
	var buttonName='审批';
	var title='流程审批';
	var iconCls='fi-clipboard-pencil icon-blue';
	if(auditType=='sfsReport'){
		buttonName='上报';
		title='上报';
		iconCls='fi-arrow-up icon-blue';
	}
	 parent.$.modalDialog({
	        title : title,
	        iconCls:iconCls,
	        width : sy.getBrowerWidth()-200,
		    height : sy.getBrowerHeight()-150,
	        href : '${ctx}/culprit/moveIn/moveInSubmitform?id='+id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
	        resizable : true,
	        maximizable:true, 
	        buttons : [ {
	            text : buttonName,
	            iconCls:iconCls,
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#moveIn_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#moveInAuditInfo');
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

//流程结束打印
function printMoveIn(taskId,id,auditType,processId){
	parent.$.modalDialog({
        title : '文书打印',
        iconCls:'fi-print icon-blue',
        width : 500,
        height :300,
        resizable:true,
        maximizable:true,
        href : "${ctx}/culprit/moveIn/moveInFinishPrint?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
        buttons : [ {
            text : "提交",
            iconCls:'icon-save',
            handler : function() {
            	if($('#moveIn_isPrintBGSP').html()=='' || $('#moveIn_isPrintBGZM').html()==''){
            		$.messager.alert({
    					title : '提示信息!',
    					msg : '请打印后再提交!'
    				});	
            		return false;
            	}
            	$.ajax({
        			type : 'post',
        		 	url :'${ctx}/culprit/moveIn/submitMoveInAudit?id='+id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
        			cache : false,
        			async : false, //同步请求
        			dataType : 'json',
        			success : function(result) {
        				if(result.status==200){
        					$.messager.show({
        						title : '提示信息!',
        						msg : '流程结束!'
        					});
        					$('#moveIn_list_content').datagrid('reload');
        		             parent.$.modalDialog.handler.dialog('close');
        				}	
        			}
        		})
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

	
//新增
function addMoveIn(){
	 parent.$.modalDialog({
        title : '新增迁入管理',
        iconCls:'fi-plus icon-green',
        width : sy.getBrowerWidth()-200,
	     height : sy.getBrowerHeight()-150,
        href : '${ctx}/culprit/moveIn/form',
        resizable : true,
        maximizable:true, 
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#moveIn_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#moveInAddInfo');
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
//修改	
function editMoveIn(id){
	 parent.$.modalDialog({
	        title : '修改迁入管理信息',
	        iconCls:'fi-pencil icon-blue',
	        width : sy.getBrowerWidth()-200,
		    height : sy.getBrowerHeight()-150,
	        href : '${ctx}/culprit/moveIn/form?id='+id,
	        resizable : true,
	        maximizable:true, 
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#moveIn_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#moveInAddInfo');
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
	
	
function detailMoveIn(id,isEnd){
	parent.$.modalDialog({
        title : '详细',
        iconCls:'fi-info icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-200,
        resizable:true,
        maximizable:true,
        modal:true,
        href : '${ctx}/culprit/moveIn/detail?id=' + id,
        buttons : [ {
        	id:'listMoveInPrint1',
       	 	text : '打印《社区服刑人员居住地变更审批表》',
            iconCls:'fi-print icon-blue',
            handler : function() {
             		var f = parent.$.modalDialog.handler.find('#moveInPrint_bgspb');
             		f.click();
            	}
        } ,{
        	id:'listMoveInPrint2',
       	 	text : '打印《社区服刑人员居住地变更证明》',
            iconCls:'fi-print icon-blue',
            handler : function() {
            	var f = parent.$.modalDialog.handler.find('#moveInPrint_bgzm');
         		f.click();	
            }
        }, {
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
           	 parent.$.modalDialog.handler.dialog('close');
            }
        }] 
    });	
	
	$('#listMoveInPrint1').hide();
	$('#listMoveInPrint2').hide();
	if (isEnd == 1) {
		$('#listMoveInPrint1').show();
		$('#listMoveInPrint2').show();
	}
}	
	

function stopProcess(taskId){
	$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
	      if (b){  
	    	  $.ajax({
	  			type : 'get',
	  			url : "${ctx}/culprit/moveIn/stopProcess/?taskId=" + taskId,
	  			cache : false,
	  			async : false, //同步请求
	  			dataType : 'json',
	  			success : function(result) {
	  				if(result.status==200){
	  					$.messager.show({
  	       					title:'提示信息!' ,
  	       					msg:result.msg
	  					});
	  					  
	  					self.parent.$('#moveIn_list_content').datagrid('reload');
	  				}else{ 
	  					$.messager.show({
  	       					title:'提示信息!' ,
  	       					msg:result.msg
	  					});
	  					  
	  					self.parent.$('#moveIn_list_content').datagrid('reload');
  	       					
	  				}
	  				
	  			}
	  		});
	  		
	      }
	});  
	
}


</script>

</html>