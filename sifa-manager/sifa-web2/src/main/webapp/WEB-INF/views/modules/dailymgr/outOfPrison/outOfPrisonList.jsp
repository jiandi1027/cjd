<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	$("#flagUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});	
})

var accountRold='${sysAccount.roleId}';//此处用于控制上报权限
function d_outOfPrisonformatOper(val,row,index){  
	var space = '&nbsp;';
	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="detailOutOfPrison_d(\''+row.id+'\',\''+row.isEnd+'\')">详情</a>';
	if(row.activityName==null){
		<shiro:hasPermission name="dailymgr/outOfPrison/arrowUp">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-arrow-up" data-options="plain:true,iconCls:\'fi-arrow-up icon-blue\'"  onclick="addOutOfPrison_d(\''+row.id+'\')">上报</a>';
		</shiro:hasPermission>
	}
	if(row.auditType=="sfsReport"){
		<shiro:hasPermission name="dailymgr/outOfPrison/edit1">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editOutOfPrison_d(\''+row.id+'\')">修改</a>';
		</shiro:hasPermission>
	}
	
	if(row.auditType=="jzkReport"){
		<shiro:hasPermission name="dailymgr/outOfPrison/edit2">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editOutOfPrison_d(\''+row.id+'\')">修改</a>';
		</shiro:hasPermission>
	}
	
	if(row.hasPermission==1){
		operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-clipboard-pencil" onclick="submitAuditOutOfPrison_d(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">处理</a>';
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		var processDetailUrl="/dailymgr/outOfPrison/forProcessDetail?id="+row.id;
		if(row.isEnd==1){
			var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-map" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
		}else{
			var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-map" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
			/* +space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-x-circle" onclick="flag();">作废</a>'; */
		}
		
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
	
		if(row.isEnd==0 && row.hasPermission==1){
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-stop" onclick="stopProcess(\''+row.taskId+'\')">终止</a>';
		}
	}
	
	
    return operation;
} 
//作废
function flag(){
	$.messager.confirm('提示', '是否确定将该条记录作废?作废后将不可回复!', function(b){
		 if (b){  
			$('#flag').window('open');
		}
	})
}

//处理作废
function saveFalg(){
	var arr = $('#d_outOfParole_list_content').datagrid('getSelections');
	if($('#saveFlag').form('validate')){
		 $.ajax({
				type: 'post' ,
				url: '${ctx}/dailymgr/outOfPrison/saveFlag?id='+arr[0].id+"&&taskId="+arr[0].taskId, 
				cache:false ,
				data:$('#saveFlag').serialize(),
				dataType:'json',
				success:function(data){
					$('#flag').window('close');//关闭窗口
					//1 刷新数据表格 
					$('#d_outOfParole_list_content').datagrid('reload');
					//2 清空idField   
					$('#d_outOfParole_list_content').datagrid('uncheckAll');
					//3 给提示信息 
					$.messager.show({
						title : '提示信息!',
						msg : data.msg
					});
				} ,
				error:function(data){
					$.messager.show({
						title:'提示信息!',
						msg:data.msg
					});
				}
			});
		}
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
function submitAuditOutOfPrison_d(taskId,id,auditType,processId){
	var buttonName='审批';
	if(auditType=='sfsReport' || auditType=='jzkReport'){
		buttonName='处理';
	}
	if(auditType!='sfsPrint' && auditType!='jzkPrint'){
		parent.$.modalDialog({
		       title : '流程审批',
		       iconCls:'fi-clipboard-pencil icon-blue',
		       width : sy.getBrowerWidth()-300,
		       height : sy.getBrowerHeight()-150,
		       resizable:true,
		       maximizable:true,
		       href : "${ctx}/dailymgr/outOfPrison/outOfPrisonAudit?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
		       buttons : [ {
		           text : buttonName,
		           iconCls:'fi-clipboard-pencil icon-blue',
		           handler : function() {
		               parent.$.modalDialog.openner_dataGrid = $('#d_outOfParole_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		               var f = parent.$.modalDialog.handler.find('#outOfPrisonAuditForm');
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
	        href : "${ctx}/dailymgr/outOfPrison/outOfPrisonFinishPrint?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
	        buttons : [ {
	            text : "告知",
	            iconCls:'fi-results-demographics icon-blue',
	            handler : function() {
	            	if($('#outOfPrison_isPrintJYS').html()=='' || $('#outOfPrison_isPrintSHB').html()=='' || $('#outOfPrison_isPrintYiXue').html()==''){
	            		$.messager.alert({
        					title : '提示信息!',
        					msg : '请打印后再告知!'
        				});	
	            		return false;
	            	}
	               	parent.$.modalDialog.openner_dataGrid = $('#d_outOfParole_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	               	var f = parent.$.modalDialog.handler.find('#outOfPrison_inform_btn');
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
function detailOutOfPrison_d(id,isEnd){
	 parent.$.modalDialog({
         title : '延长暂予监外执行详情',
         iconCls:'fi-info icon-blue',
         width : sy.getBrowerWidth()-250,
         height : sy.getBrowerHeight()-150,
         resizable:true,
         maximizable:true,
         href : '${ctx}/dailymgr/outOfPrison/detail?id=' + id,
          buttons : [ {
        	 id : 'listOutOfPrisonPrint1',
        	 text : '打印《延长暂予监外执行建议书》',
        	 iconCls:'fi-print icon-blue',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#outOfPrisonPrint1');
                 f.click();
             }
         },{
        	 id : 'listOutOfPrisonPrint2',
        	 text : '打印《延长暂予监外执行审核表》',
        	 iconCls:'fi-print icon-blue',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#outOfPrisonPrint2');
                 f.click();
             }
         },{
        	 id : 'listOutOfPrisonPrint3',
        	 text : '打印《社区矫正人员医学司法鉴定委托书》',
        	 iconCls:'fi-print icon-blue',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#outOfPrisonPrint3');
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
	 $('#listOutOfPrisonPrint2').hide();
	 $('#listOutOfPrisonPrint3').hide();
		if (isEnd == 1) {
			$('#listOutOfPrisonPrint1').show();
			 $('#listOutOfPrisonPrint2').show();
			 $('#listOutOfPrisonPrint3').show();
		}

}


//流程终止
function stopProcess(taskId){
	$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
	      if (b){  
	    	  $.ajax({
	  			type : 'get',
	  			url :  "${ctx}/dailymgr/outOfPrison/stopProcess?taskId=" + taskId,
	  			cache : false,
	  			async : false, //同步请求
	  			dataType : 'json',
	  			success : function(result) {
	  				$.messager.show({
 	  					title:'提示信息!',
 	  					msg:result.msg
 	  				});
	  				$('#d_outOfParole_list_content').datagrid('reload',{});
	  			}
	  		});
	  		
	      }
	});  
	
}
//增加
function addOutOfPrison_d(id){
	var title="新增延长监外执行";
	var icon='fi-plus icon-green';
	if(id!=''){
		title="上报";
		icon='fi-arrow-up icon-blue';
	}
	 parent.$.modalDialog({
         title : title,
         iconCls:icon,
         width : sy.getBrowerWidth()-250,
         height : sy.getBrowerHeight()-160,
         href : '${ctx}/dailymgr/outOfPrison/form?id='+id,
         resizable:true,
         maximizable:true,
         buttons : [ {
             text : '保存',
             iconCls:'icon-save',
             handler : function() {
                 parent.$.modalDialog.openner_dataGrid = $('#d_outOfParole_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                 var f = parent.$.modalDialog.handler.find('#d_outOfPrisonInfo');
                 f.submit();
             }
         },{
        	 text : '保存并上报',
             iconCls:'fi-arrow-up icon-blue',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#saveWithSubmitOutPrisonBtn');
                 f.click();
            }
         },{
             text : '重置',
             iconCls:'icon-undo',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#d_outOfPrisonInfo');
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
function editOutOfPrison_d(id){
	/* var arr = $('#d_outOfParole_list_content').datagrid('getSelections');
	if(arr.length <= 0){
		$.messager.show({
			title : '提示信息!',
			msg : '至少选择一行记录进行上报!'
		});
		return;
	}
	var id=arr[0].id; */
	 parent.$.modalDialog({
        title : '编辑提请撤销监外执行信息',
        iconCls:'fi-pencil icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        href : '${ctx}/dailymgr/outOfPrison/form?id='+id,
        resizable:true,
        maximizable:true,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#d_outOfParole_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#d_outOfPrisonInfo');
                f.submit();
            }
        },{
            text : '重置',
            iconCls:'icon-undo',
            handler : function() {
           	 var f = parent.$.modalDialog.handler.find('#d_outOfPrisonInfo');
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
function deleteOutOfPrison_d(){
	var arr = $('#d_outOfParole_list_content').datagrid('getSelections');
	if (arr.length <= 0) {
		$.messager.alert({
			title : '提示信息!',
			msg : '请至少选择一行记录进行删除!'
		});
	}else if(arr[0].processInstanceId!='' && arr[0].processInstanceId!=null){
		$.messager.alert({
			title : '提示信息!',
			msg : '流程已启动，无权限执行该操作!'
		});
	} else {

		$.messager.confirm('提示信息', '确认删除?', function(r) {
			if (r) {
				$.ajax({
					type: 'post' ,
					url: '${ctx}/dailymgr/outOfPrison/delete',
					cache:false ,
					data:{id:arr[0].id},
					dataType:'json',
					success:function(result){
						//1 刷新数据表格 
						$('#d_outOfParole_list_content').datagrid('reload');
						//2 清空idField   
						$('#d_outOfParole_list_content').datagrid('uncheckAll');
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


function formatStatusKey(val, row, index){
	var str = '<span style="color:red">未作废<span>';
	var result=sy.getDicValue('common_table','dicBlankFlagKey',row.dicBlankFlagKey,'');
	if(result!=null && result!=''){
		return result;
	}else{
		return str;
	}
}

function formatExtendTime(val, row, index){
	var str = '无明确期限';
	if(val!=null && val!=''){
		return val;
	}else{
		return str;
	}
}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	 <form id="d_outOfprisonSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
          <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="d_outOfParole_list_content"/>
          </c:if>
           <div class="easyui-panel search-form" data-options="fit:true,border:false"  title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目</c:if>" style="width:100%;">
       
			<table>
				<tr>
				<td class="search-title">矫正对象：</td>
					<td><input name="culprit.name" class="easyui-textbox"   /></td>
				</tr>
				<tr>
					<td class="search-title">明确期限：</td>
						<td><select  class="easyui-combobox" name="isDeadline" panelHeight=auto  value=""> 
							    <option value="">全部</option>   
							    <option value="1">有明确期限</option>   
							    <option value="0">无明确期限</option>   
							</select>  
						</td>
				</tr>
				<tr>
					<td class="search-title">延长期限：</td>
						<td><input name="extendTime" class="easyui-numberbox"   data-options="min:0"/></td>
				</tr>
				<!-- <tr>
					<td class="search-title">至：</td>
						<td><input name="extendTimeEnd" class="easyui-numberbox"  data-options="min:0" /></td>
				</tr> -->
				<tr>
				<td class="search-title">开始起始：</td>
					<td><input name="searchStartDate" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"  editable="false"  /></td>
				</tr>
				<tr>
					<td class="search-title" style="text-align:right">开始截至：</td>
					<td><input name="searchEndDate" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"  editable="false"   /></td>
				</tr>
				<tr>
				<td class="search-title">结束起始：</td>
					<td><input name="searchStartDate1" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"  editable="false"  /></td>
				</tr>
				<tr>
					<td class="search-title" style="text-align:right">结束截至：</td>
					<td><input name="searchEndDate1" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"  editable="false"   /></td>
				</tr>
			</table>
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
		 <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#d_outOfParole_list_content').datagrid('load' ,$.serializeObject($('#d_outOfprisonSearchForm')));">查询</a> &nbsp;&nbsp; 
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo" onclick="javascript:$('#d_outOfprisonSearchForm').form('clear');$('#d_outOfParole_list_content').datagrid('load', {});">清空</a></div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="d_outOfParole_list_content" title="延长暂予监外执行列表"
			data-options="singleSelect:true,fit:true,rownumbers:true,fitColumns:true,collapsible:true,striped:true,toolbar:'#outOfPrison_toolbar_d',loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15,pageList:[5,10,15,20,50],fitColumns:true,
			url:'${ctx}/dailymgr/outOfPrison/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-linkbutton-map').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle  icon-blue'});
                        $('.organization-easyui-linkbutton-stop').linkbutton({text:'终止',plain:true,iconCls:'fi-power  icon-red'});
                        $('.organization-easyui-linkbutton-clipboard-pencil').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-arrow-up').linkbutton({text:'上报',plain:true,iconCls:'fi-arrow-up icon-blue'});
                        $('.organization-easyui-linkbutton-x-circle').linkbutton({text:'作废',plain:true,iconCls:'fi-x-circle icon-red'});
                   		$('.organization-easyui-linkbutton-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'culpritName',width:'10%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">姓名</th>
					<th data-options="field:'groupName',width:'10%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">司法所</th>
					<th data-options="field:'extendTime',width:'10%',align:'center',formatter:formatExtendTime"
						editor="{type:'validatebox',options:{required:true}}">延长期限（月）</th>
					<th data-options="field:'startDate',width:'17%',align:'center',sortable:true"
						editor="text">延长期限开始时间</th>
					<th data-options="field:'endDate',width:'16%',align:'center',sortable:true"
						editor="text">延长期限结束时间</th>
					<!-- <th data-options="field:'dicBlankFlagKey',width:100,align:'center',formatter:formatStatusKey"
						editor="{type:'validatebox',options:{required:true}}">是否作废</th> -->
					<th data-options="field:'activityName',width:'10%',align:'center'"
						editor="text">审批状态</th>
				 	<th data-options="field:'_opt',width:'25%',formatter:d_outOfPrisonformatOper,align:'center'">操作</th>  

				</tr>
			</thead>
		</table>
	</div>
	<div id="outOfPrison_toolbar_d" style="display: none;">
		<shiro:hasPermission name="dailymgr/outOfPrison/form">
			<a onclick="addOutOfPrison_d(id);" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
        </shiro:hasPermission>
        <shiro:hasPermission name="dailymgr/outOfPrison/delete">	
        	<a onclick="deleteOutOfPrison_d();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>
		</shiro:hasPermission>
	</div>
	<div id="flag" class="easyui-dialog" title="作废" style="width:500px;height:310px;"  
        data-options="closed:true,resizable:true,maximizable:true,modal: true,iconCls:'fi-x-circle icon-red',draggable:false"> 
        <form id="saveFlag">
        <table width="100%" class="grid">
        	<tr>
        		<th width="30%"><span style="color:red">*</span>作废原因：</th>
        		<td width="70%"><select style="width:100px"  id="flagReasonId" name="flagReasonId"
        			data-options="panelHeight:50" editable=false required=true missingMessage="作废原因不能为空!" class="easyui-combobox" >
									<option value="136001">录入错误</option>   
							    	<option value="136002">其他</option>   
					</select ></td>
        	</tr>
        	<tr>
        		<th>相关材料：</th>
        		<td><div id="flagUpload"></div>
	     				<input type="hidden" name="flagPathName" id="flagPathName">
						<input type="hidden" name="flagPath" id="flagPath">
        		</td>
        	</tr>
        	<tr>
        		<th >作废具体原因：</th>
        		<td><input class="easyui-textbox" id="flagDetailReason" name="flagDetailReason" style="width:200px;height:100px" data-options="multiline: true"> </td>
        	</tr>
        </table>
        </form>
         <div align="center" padding="20px 30px 40px 50px">
         <p colspan="4" > 
         <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'"  onclick="saveFalg();">保存</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'" onclick="$('#flag').window('close');">关闭</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;
		  </p>
    </div>
	</div>  
</div>


