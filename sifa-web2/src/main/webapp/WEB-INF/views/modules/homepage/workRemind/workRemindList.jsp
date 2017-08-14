<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>
<div class="easyui-layout" data-options="fit:true,border:false">
 	<form id="workRemindSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
   <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
        	<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="t_list_workRemind"/>
        </c:if>
           <div class="easyui-panel search-form" data-options="fit:true,border:false"  title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
       
			<table>
				<tr>
				<td class="search-title">提醒事项：</td>
					<td><input name="searchWorkRemindVal" id="searchWorkRemindVal" class="easyui-combobox" data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_NO_DEAL&columnName=EVENT_REMINDER_TYPE&parentKey=76000',panelHeight:'auto',panelMaxHeight:200,editable:false"/></td>
				</tr>
			</table>
		
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
		 <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#t_list_workRemind').datagrid('load' ,$.serializeObject($('#workRemindSearchForm')));"
		 				id="searchDetachedBtn">查询</a> &nbsp;&nbsp; 
			<a href="#" class="easyui-linkbutton" id="cleanDetachedBtn" iconCls="icon-undo" onclick="javascript:$('#searchWorkRemindVal').combobox('reset');$('#workRemindSearchForm').form('clear');$('#t_list_workRemind').datagrid('load', {});">清空</a></div>
		</div>
	</div>
	</form>
    <div data-options="region:'center',border:true" >
        <table class="easyui-datagrid" id="t_list_workRemind" title="待办事项列表"
			data-options="singleSelect:true,fit:true,rownumbers:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/homepage/workRemind/list',method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-toBeprocess-edit').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
				 $('.organization-easyui-toBeprocess-edit1').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-gray'});
				 $('.organization-easyui-toBeprocess-edit2').linkbutton({text:'查看',plain:true,iconCls:'fi-zoom-in icon-blue'});
				  $('.organization-easyui-toBeprocess-view1').linkbutton({text:'查看',plain:true,iconCls:'fi-zoom-in icon-gray'});
				  $('.organization-easyui-toBeprocess-view2').linkbutton({text:'查看',plain:true,iconCls:'fi-zoom-in icon-blue'});
				   },rowStyler: function(index,row){if(row.key==null){ return 'display:none';  } }">
				  
			<thead>
			<tr>
					<th data-options="field:'id'" hidden="true"></th>
					<th style="width: 57%;" data-options="field:'value',align:'center'">提醒事项</th>
					<th style="width: 20%;" data-options="field:'amount',align:'center',styler:function(value,row,rowIndex){  
					if(row.amount !='0'){
						  return  'color:red;';
						 }
    	 			}">事项数量</th>
					 <th style="width: 21%;" data-options="field:'_opt',formatter:formatOper,align:'center'">操作</th>  
			</tr>
			</thead>
		</table> 
    </div>
</div>
<script type="text/javascript">
	function formatOper(val,row,index){ 
			if(row.key==null){
				var examAndAppListSize1=row.examAndAppListSize;
				var workRemindListSize1=row.workRemindListSize;
				$('#examAndAppOfIndex').text(examAndAppListSize1);
				$('#workRemindOfIndex').text(workRemindListSize1);
				$('.panel-title').each(function(){
					if ($(this).text().indexOf('待办事项') > -1) {
						var amount3=(examAndAppListSize1-0)+(workRemindListSize1-0);
						$(this).text('待办事项('+amount3+')');
						return;
					}
				});
				examAndAppListSize1='';
				workRemindListSize1='';
				return;
			 }
			if(row.amount==0){
				if(row.key!= "76026" && row.key!= "76027"){//手机、手环数量或者近5日内报到提醒
					<shiro:hasPermission name="homePage/workRemind/sfsAudit">//当前账号有处理权限，列表显示处理，否则显示查看
						var operation='<a href="javascript:void(0);" class="organization-easyui-toBeprocess-edit1">处理（灰色）</a>';
					</shiro:hasPermission>
					<shiro:hasPermission name="homePage/workRemind/view">//当前账号有查看权限
						var operation='<a href="javascript:void(0);" class="organization-easyui-toBeprocess-view1"></a>';
					</shiro:hasPermission>
				}else{
					var operation='<a href="javascript:void(0);" class="organization-easyui-toBeprocess-view1"></a>';
				}
			    return operation;
			}else{
				if(row.key!= "76026" && row.key!= "76027"){//查看手机、手环数量或者近5日内报到提醒
					<shiro:hasPermission name="homePage/workRemind/sfsAudit">//当前账号有权限，列表显示处理，否则显示查看
						var operation='<a href="javascript:void(0);" class="organization-easyui-toBeprocess-edit" onclick="toView1(\''+row.key+'\',\''+row.value+'\')">处理</a>';
					</shiro:hasPermission>
					<shiro:hasPermission name="homePage/workRemind/view">//当前账号有查看权限
						var operation='<a href="javascript:void(0);" class="organization-easyui-toBeprocess-edit2" onclick="toView1(\''+row.key+'\',\''+row.value+'\')">查看</a>';
					</shiro:hasPermission>
				}else{
					var operation='<a href="javascript:void(0);" class="organization-easyui-toBeprocess-view2" onclick="toView2(\''+row.key+'\',\''+row.value+'\')">查看</a>';
				}
				return operation;
			}
		
	} 

	function toView1(key,value){
		var groupId=$('#groupId').val();//部门id
		if(typeof(groupId)=="undefined"){ //司法所groupId设置为空
			groupId='';
		} 
		 parent.$.modalDialog({
			iconCls:'fi-zoom-in icon-blue',
 			href:'${ctx}/homepage/workRemind/toView?key='+key+'&groupId='+groupId,
 			title:value,
 			width : 900,
 	        height : 750,
 			shadow:false,
 		    modal:true,
 		    resizable:true,
 	        maximizable:true,
 	        loadingMessage:'加载中...',
 	        buttons :[{
 				text:'关闭',
 				iconCls:'fi-x icon-blue',
 				handler:function(){
 					parent.$.modalDialog.handler.dialog('close');
 				}
 			}]
	     });
	}
	//查看手机及手环数
	function toView2(key,value){
		 parent.$.modalDialog({
			iconCls:'fi-clipboard-pencil icon-blue',
			href:'${ctx}/homepage/workRemind/toView?key='+key,
			title:value,
			width : sy.getBrowerWidth()-300,
	        height : sy.getBrowerHeight()-200,
			shadow:false,
		    modal:true,
		    resizable:true,
	        maximizable:true,
	        loadingMessage:'加载中...',
	        buttons :[{
	        	id:'shoujiBtn',
				text:'打印',
				iconCls:'fi-print icon-blue',
				handler:function(){
					 var f = parent.$.modalDialog.handler.find('#phoneAndShPrintBtn');
	                 f.click();
				}
	        },{
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					parent.$.modalDialog.handler.dialog('close');
				}
			}]
	     });
		 
		 $('#shoujiBtn').hide();
		 if(key=='76026'){
			 $('#shoujiBtn').show();
		 }
	}
	
</script>


