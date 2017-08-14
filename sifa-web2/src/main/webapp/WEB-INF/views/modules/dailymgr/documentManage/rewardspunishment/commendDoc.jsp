<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel"  style="height:50px;padding:5px; align:left" >
		<form id="searchForm_commend">
			<table>				
				<tr>
					<td>社区矫正人员：</td>
					<td><b>${culprit.name }</b></</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考核时间：</td>
					<td>
						<input name="searchStartDate"   class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"value=""/>&nbsp;
					</td>
					<td>至</td>
					<td>
						<input name="searchEndDate"  class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
						editable="false"  />
					</td>
					<td colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="searchbtn_commend">查询</a>
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-undo'"  id="cleanBtn_commend">重置</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="easyui-panel" style="height:90%;padding:5px;" title="表扬列表">
		<table class="easyui-datagrid" id="commend_list_content" style="height:100%;"
			data-options="singleSelect:true,noheader:true,rownumbers:true,collapsible:true,toolbar:'#toolbarCommend',striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/rewardspunishment/commend/list?culpritId=${culprit.id }',method:'post',onLoadSuccess:function (data) {
                       $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true"></th>
					<th style="width: 15%;" data-options="field:'sponsor',align:'center'">申请人</th>
					<th style="width: 20%;" data-options="field:'reason',align:'center'" editor="text">表扬原因</th>
					<th style="width: 10%;" data-options="field:'beginDate',align:'center'">考核开始时间</th>
					<th style="width: 10%;" data-options="field:'endDate',align:'center'">考核结束时间</th>
					<th style="width: 43%;" data-options="field:'_opt',formatter:formatOper,align:'center'">操作</th>  
			</tr>
			</thead>
		</table>
	</div>
	<div id="addCommendDialog" title="详情" modal=true  resizable=true data-options="iconCls:'fi-info icon-blue'"
	        maximizable=true class="easyui-dialog" closed=true style="width:800px;padding:5px;">
		<form id="addCommendForm" action="" method="post">
			<input name="id"   type="hidden"/>
             <table width="100%" class="grid">
                <tr>
                   <th width="15%">处理时间：</th>
					<td width="15%"><span id="doDate_commend"></span></td>
					<th  width="15%">申请人：</th>
					<td width="15%"><span id="sponsor_commend"></span></td>
								
					<th width="15%">表扬原因：</th>
					<td><span id="reason_commend"></span></td>
				<tr>
					<th>其他缘故：</th>
					<td><span id="note_commend"></span></td>
					 <th>考核开始时间：</th>
					<td><span id="beginDate_commend"></span></td>
					 <th>考核结束时间：</th>
					<td><span id="endDate_commend"></span></td>		
				</tr>
				<tr>
					<th>具体事实：</th>
					<td colspan="5"><textarea id="fact_commend" readOnly=true style="width:90%;height:80px;border: 0 none;"></textarea></td>
				</tr>
			</table>      
		</form>
		 <div align="center">
         <p colspan="4"> 
         <!-- <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="submitCommendForm();" id="saveBtn">保存</a>
		  			&nbsp;&nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-refresh'" onclick="$('#addCommendForm').form().find('input').val('');" id="clearBtn">清空</a>
		  &nbsp;&nbsp;&nbsp;&nbsp; -->
		    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#addCommendForm').form('clear');$('#addCommendDialog').dialog('close');">关闭</a>
		  </p>
    	</div> 	
	</div>
	
	
	<!-- <div id="toolbarCommend" style="display: none;">
	        <a onclick="addCommend();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
	</div> -->	
	<div id="talkDialog"></div>


<script type="text/javascript">
$(function(){
	$("#legalDocsUpload").empty();
	$("#legalDocsUpload").powerWebUpload({ auto: true,fileSingleSizeLimit:2,serverPath:'${ctx}/servlet/file/upload',fileType:'rar,zip,doc,xls,docx,xlsx,pdf'});
	
	$('#searchbtn_commend').click(function() {
		$('#commend_list_content').datagrid('load',serializeForm($('#searchForm_commend')));
	});
	$('#cleanBtn_commend').click(function() {
		$('#commend_list_content').datagrid('load', {});
		$('#searchForm_commend').form().find('input').val('');
	});
	
	
})


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

function addCommend(){
	$('#addCommendForm').form('clear');
	$('#addCommendDialog').dialog('open');		
}
//保存表扬
function submitCommendForm(){
	setFilePathAndName('legalDocsUpload');
	if($('#addCommendForm').form('validate')){	
		$.ajax({
			type: 'post' ,
			url: '${ctx}/rewardspunishment/commend/save?culpritId=${culprit.id }',
			data:$('#addCommendForm').serialize(),
			dataType:'json' ,
			success:function(result){
				$.messager.show({
					title:'提示信息!' ,
					msg:result.msg
				});
				$('#addCommendForm').form('clear');
				$('#addCommendDialog').dialog('close');
				$('#commend_list_content').datagrid('reload');
			} ,
			error:function(result){
				$.messager.show({
					title:'提示信息!' ,
					msg:result.msg
				});
			}
		});
	} else {
		$.messager.show({
			title:'提示信息!' ,
			msg:'数据验证不通过'
		});
	}	
}

function formatOper(val,row,index){  
	var operation='<a href="javascript:void(0);"  class="organization-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-info\'" onclick="commendDetail1(\''+index+'\')">详情</a>';
    return operation;
} 

//详细
function commendDetail1(index){
	$('#commend_list_content').datagrid('selectRow',index); 
	var arr = $('#commend_list_content').datagrid('getSelections');
 	$('#addCommendDialog').dialog({
			title : '详情'
		});
 	
 	$('#addCommendForm').form('clear');
 	$('#doDate_commend').html(arr[0].doDate);
	$('#sponsor_commend').html(arr[0].sponsor);
	$('#reason_commend').html(arr[0].reason);
	$('#note_commend').html(arr[0].note);
	$('#beginDate_commend').html(arr[0].beginDate);
	$('#endDate_commend').html(arr[0].endDate);
	$('#fact_commend').html(arr[0].fact);

 	$('#addCommendDialog').dialog('open');
 	$('#commend_list_content').datagrid('unselectAll'); 
}





/* $('#searchbtn').click(function() {
	$('#t_list_commend').datagrid('load', serializeForm($('#searchForm')));
});

var flag; //undefined 判断新增和修改方法
var toolbarCommend = [ {
	text : '新增',
	iconCls : 'fi-plus icon-green',
	handler : function() {
			 parent.$.modalDialog({
		         title : '新增表扬信息',
		         iconCls:'fi-plus icon-green',
		         width : sy.getBrowerWidth()-250,
		         height : sy.getBrowerHeight()-150,
		         href : '${ctx}/rewardspunishment/commend/add',
		         buttons : [ {
		             text : '保存',
		             iconCls:'icon-save',
		             handler : function() {
		                 parent.$.modalDialog.openner_dataGrid = $('#t_list_commend').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
		                 var f = parent.$.modalDialog.handler.find('#culpritInfo');
		                 f.submit();
		             }
		         }
		         ]
		     });
	}
}]
	function formatOper(val,row,index){  
		
		var operation='<a href="javascript:void(0);"  class="organization-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-info\'" onclick="askLeaveDetail(\''+row.id+'\')">详情</a>';
		if(row.hasPermission==1){
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit1" data-options="plain:true,iconCls:\'fi-clipboard-pencil\'" onclick="submitAuditAskLeave(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">流程处理</a>';
		}
		if(row.processInstanceId!='' && row.processInstanceId!=null){
			var processDetailUrl="/rewardspunishment/commend/forProcessDetail?id="+row.id;
			if(row.isEnd==1){
				var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
				operation=operation+'&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit2" data-options="plain:true,iconCls:\'fi-map\'" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
			}else{
				var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit2" data-options="plain:true,iconCls:\'fi-map\'" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
			}
			
		}
		if(row.processInstanceId!='' && row.processInstanceId!=null){
		
			if(row.isEnd==0){
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit3" data-options="plain:true,iconCls:\'fi-stop\'" onclick="stopProcess(\''+row.taskId+'\')">终止</a>';
			}
		}
		
		
	    return operation;
	} 
	function viewProcess(url){
		
		 parent.$.modalDialog({
	         title : '表扬流程',
	         iconCls:'fi-plus icon-green',
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         href : url
	     });
	}
	function submitAuditAskLeave(taskId,id,auditType,processId){
	
		 parent.$.modalDialog({
	         title : '表扬审核审批',
	         iconCls:'fi-plus icon-green',
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         href : '${ctx}/rewardspunishment/commend/commendAudit?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
	         buttons : [ {
	             text : '上报',
	             iconCls:'icon-save',
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#t_list_commend').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#askLeaveAuditForm');
	                 f.submit();
	             }
	         }]
	     });
	}


	
	
	} */

	



</script>


