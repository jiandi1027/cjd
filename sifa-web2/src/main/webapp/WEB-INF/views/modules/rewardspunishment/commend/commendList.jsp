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
	 <form id="commendForm"  style="padding-bottom: 10px;padding-top: 10px;">

	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
		<div class="easyui-layout" data-options="fit:true,border:false">
	       
	         <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
		 <sys:sysGroup hiddenId="groupName" hiddenName="groupName" dataGridId="t_list_commend"/>
		  </c:if>
		   <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目</c:if>" style="width:100%;">
	         
				<table>
					<tr>
						<td class="search-title">矫正对象：</td>
						<td> <input name="name" id="name"
						class="easyui-textbox"  /> </td>
					</tr>
					<tr>
						<td class="search-title">表扬原因：</td>
						<td ><select  id="commendReason" class="easyui-combobox" name="reason" 
								data-options="panelHeight:'auto',editable:false">
								 	<option value="">全部</option>
									<option value="连续6个月考核合格">连续6个月考核合格</option>
									<option value="其他">其他</option>
						</select></td>
					</tr>
			
					<tr>
						<td class="search-title">记录起始：</td>
						<!-- <td>
							<input name="doDate" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" />
						</td> -->
						<td><input name="doDate" id="doDate" editable="false" class="Wdate easyui-validatebox" 
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDoDate\',{d:-1})}'})"/></td>
					</tr>
					<tr>
						<td class="search-title">记录截止：</td>
						<!-- <td><input name="endDoDate" class="Wdate easyui-validatebox"
						onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
						  /></td> -->
						  <td><input name="endDoDate" id="endDoDate" editable="false"  class="Wdate easyui-validatebox" 
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'doDate\',{d:1})}'})"/></td>

					</tr>
					
				</table>
			
			</div>
			<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchbtn" iconCls="icon-search" >查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="$('#reason').combobox('reset');javascript:$('#commendForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_list_commend" title="表扬列表"
			style="height: 400px;"
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:'#commend_toolbar',loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/rewardspunishment/commend/list',method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
				  $('.organization-easyui-linkbutton-edit1').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'}); 
				  $('.organization-easyui-linkbutton-edit2').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle  icon-blue'});
				  $('.organization-easyui-linkbutton-edit3').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
				  $('.organization-easyui-linkbutton-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
		 }">
				  
			<thead>
				
			<tr>
					<th data-options="field:'id',checkbox:true,width:80"></th>
					<th style="width: 13%;" data-options="field:'culpritName',align:'center'"
						editor="text">矫正对象</th>
					<th style="width: 13%;" data-options="field:'groupName',align:'center'"
						editor="text" >司法所</th>
					<th style="width: 17%;" data-options="field:'reason',align:'center'"
						editor="text">表扬原因</th>
				
					<th style="width: 10%;" data-options="field:'activityName',align:'center'"
						editor="text">审批状态</th>
					<th style="width: 17%;"
						data-options="field:'doDate',align:'center'"
						>记录时间</th>
					 <th style="width: 28%;" data-options="field:'_opt',formatter:formatOper,align:'center'">操作</th>  
			</tr>
			</thead>
		</table>
	</div>

</div>
<div id="commend_toolbar" style="display: none;">
		<shiro:hasPermission name="rewardspunishment/commend/add">
        <a onclick="addCommend(id);" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
    	</shiro:hasPermission>
    	<shiro:hasPermission name="rewardspunishment/commend/del">
		<a onclick="delCommend();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>
		</shiro:hasPermission>
</div>
<script type="text/javascript">
	

$('#searchbtn').click(function() {
	$('#t_list_commend').datagrid('load', serializeForm($('#commendForm')));
});

// 新增
function addCommend(id){
	parent.$.modalDialog({
		title : '新增表扬信息',
        maximizable:true,
        resizable:true,
        iconCls:'fi-plus icon-green',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-180,
        href : '${ctx}/rewardspunishment/commend/add?id='+id,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#t_list_commend').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#commendFrom');		                
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
//删除
function delCommend(){
	var arr = $('#t_list_commend').datagrid('getSelections');
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
					url: '${ctx}/rewardspunishment/commend/delete',
					cache:false ,
					data:{id:arr[0].id},
					dataType:'json',
					success:function(result){
					//1 刷新数据表格 
					$('#t_list_commend').datagrid('reload');
					//2 清空idField   
					$('#t_list_commend').datagrid('uncheckAll');
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
			}else{
				return;
			}
		});
	}
}
	function formatOper(val,row,index){  
		
		var operation='<a href="javascript:void(0);"  class="organization-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-info\'" onclick="commendDetail(\''+row.id+'\')">详情</a>';
		if(row.hasPermission==1){
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit1" data-options="plain:true,iconCls:\'fi-clipboard-pencil\'" onclick="submitAuditCommend(\''+row.taskId+'\',\''+row.roleId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">流程处理</a>';
		}
		if(row.processInstanceId!='' && row.processInstanceId!=null){
			var processDetailUrl="/rewardspunishment/commend/forProcessDetail?id="+row.id;
			if(row.isEnd==1){
				var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
				operation=operation+'&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit2" data-options="plain:true,iconCls:\'fi-map\'" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
			}else{
				var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit2" data-options="plain:true,iconCls:\'fi-map\'" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
			}
			
		}
		if(row.hasPermission==1 && (row.auditType=="sfsReport" || row.auditType=="jzkReport" )){
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="edit(\''+row.id+'\')">修改</a>';
		}
		if(row.processInstanceId!='' && row.processInstanceId!=null){
		
			if(row.isEnd==0 && row.hasPermission==1){
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit3" data-options="plain:true,iconCls:\'fi-stop\'" onclick="stopProcess(\''+row.taskId+'\')">终止</a>';
			}
		}
		
		
	    return operation;
	} 
	function viewProcess(url){
		
		 parent.$.modalDialog({
	         title : '表扬流程',
	         iconCls:'fi-shuffle  icon-blue',
	         maximizable:true,
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         href : url
	     });
	}
	function submitAuditCommend(taskId,roleId,id,auditType,processId){
		if(auditType!="sfsReport"&&auditType!="jzkReport"){
			 parent.$.modalDialog({
		         title : '表扬审核审批',
		         iconCls:'fi-clipboard-pencil icon-blue',
		         maximizable:true,
		         resizable:true,
		         width : sy.getBrowerWidth()-250,
		         height : sy.getBrowerHeight()-150,
		         href : '${ctx}/rewardspunishment/commend/commendAudit?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
		         buttons : [ {
		             text : '审批',
		             iconCls:'fi-clipboard-pencil icon-blue',
		             handler : function() {
		                 parent.$.modalDialog.openner_dataGrid = $('#t_list_commend').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		                 var f = parent.$.modalDialog.handler.find('#commendAuditForm');
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
		}else{
			 parent.$.modalDialog({
		         title : '表扬审核审批',
		         iconCls:'fi-clipboard-pencil icon-blue',
		         maximizable:true,
		         resizable:true,
		         width : sy.getBrowerWidth()-250,
		         height : sy.getBrowerHeight()-150,
		         href : '${ctx}/rewardspunishment/commend/commendAudit?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
		         buttons : [ {
		             text : '上报',
		             iconCls:'fi-clipboard-pencil icon-blue',
		             handler : function() {
		                 parent.$.modalDialog.openner_dataGrid = $('#t_list_commend').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		                 var f = parent.$.modalDialog.handler.find('#commendAuditForm');
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
	function commendDetail(id){
		 parent.$.modalDialog({
	         title : '表扬流程详情',
	         iconCls:'fi-info',
	         maximizable:true,
	         resizable:true,
	         width : sy.getBrowerWidth()-300,
	         height : sy.getBrowerHeight()-200,
	         href : '${ctx}/rewardspunishment/commend/detail?id=' + id,
	         buttons : [ {
					text : '关闭',
					iconCls : 'fi-x icon-blue',
					handler : function() {
						parent.$.modalDialog.handler.dialog('close');
					}
				} ]
	     });
	
	}
	//编辑
	function edit(id){
		parent.$.modalDialog({
	        title : '编辑表扬信息',
	        iconCls:'fi-pencil icon-blue',
	        width : sy.getBrowerWidth()-300,
	        height : sy.getBrowerHeight()-200,
	        resizable:true,
	        maximizable:true,
	        href : '${ctx}/rewardspunishment/commend/add?id='+id,
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#t_list_commend').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var edit = parent.$.modalDialog.handler.find('#commendFrom');
	                edit.submit();
	            }
	        },{
	            text : '重置',
	            iconCls:'icon-undo',
	            handler : function() {
	           	 var reset = parent.$.modalDialog.handler.find('#commendFrom');
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
		  					  
		  					$('#t_list_commend').datagrid('reload');
		  				}else{ 
		  					$.messager.show({
      	       					title:'提示信息!' ,
      	       					msg:result.msg
		  					});
		  					  
		  					$('#t_list_commend').datagrid('reload');
      	       					
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


