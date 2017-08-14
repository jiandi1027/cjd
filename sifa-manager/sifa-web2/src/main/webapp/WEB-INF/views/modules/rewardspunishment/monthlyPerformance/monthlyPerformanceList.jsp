<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="monthlySearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        	<div region="center" border="false">
	        	<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
					<sys:sysGroup hiddenId="sfsGroupId" hiddenName="sfsGroupId" dataGridId="monthly_list"/>
		        </c:if>
         		<div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
				<table>
					<tr>
						<td class="search-title" >姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
						<td><input name="name" class="easyui-textbox" /></td>
					</tr>
				</table>
				</div>
			</div>
		 	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchGroupBtn" iconCls="icon-search" onclick="javascript:$('#monthly_list').datagrid('load' ,$.serializeObject($('#monthlySearchForm')));">搜索</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#monthlySearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="monthly_list" title="考核列表" 
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:'#sysAccountToolbar',loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,
			url:'${ctx}//rewardspunishment/monthlyPerformance/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-linkbutton-map').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle icon-blue'});
                        $('.organization-easyui-linkbutton-stop').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
                        $('.organization-easyui-linkbutton-clipboard-pencil').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                    }">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true" style = "width:15%"></th>
				<th data-options="field:'culpritName',align:'center'"  style = "width:15%">社区矫正人员</th>
				<th data-options="field:'groupName',align:'center'" style = "width:15%">司法所</th>
				<th data-options="field:'monthlyDate',align:'center'" style = "width:15%">考核月份</th>
				<th data-options="field:'monthlyPerGradeId',align:'center'" style = "width:15%">评定等级</th>
				<th data-options="field:'isAgreeStr',align:'center'" style = "width:15%">是否完成考评</th>
				<th data-options="field:'_opt',align:'center',formatter:formatOper" style = "width:20%">操作</th>  
			</tr>
		</thead>
	</table>
	</div>

</div>
<div id="sysAccountToolbar" style="display: none;">
   
        <!-- <a onclick="editSysAccount('');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-blue'">添加</a>
        <a onclick="deleteSysAccount();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">批量删除</a> -->
    
</div>
<script type="text/javascript">
var sysGroupTree;

$(function() {
	sysGroupTree = $('#sysGroupTree').tree({
         url : '${ctx}/sys/sysGroup/loadGroupTree',
         parentField : 'parentId',
         lines : true,
         onClick : function(node) {
        	 $('#monthly_list').datagrid('load', {
        		 groupId: node.id
             });
         }
     });


});
function formatRole(value, row, index){
	var str = '';
	if(value!=''){
		$.ajax({
			type : 'get',
			url : '${ctx}/sys/sysRole/findById?id='+value,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				 /* alert(XMLHttpRequest.status);
				 alert(XMLHttpRequest.readyState);
				 alert(textStatus); */
				   },
			success : function(result) {
				if(result!=null && result!=''){
					str = result.name;
				}
				
			}
		});
	}
	
	
	return str;
	
}
	function deleteSysAccount(id) {
	}
	function submitMonthly(id){
		 parent.$.modalDialog({
	         title : '上报月度考核',
	         iconCls:'fi-plus icon-green',
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         href : '${ctx}/rewardspunishment/monthlyPerformance/submit?id='+id,
	         buttons : [ {
	             text : '上报',
	             iconCls:'icon-save',
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#monthly_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#submitform');
	                 f.submit();
	             }
	         }
	         ]
	     });
	}
	function monthlyDetail(id){
		 parent.$.modalDialog({
	         title : '月度考核详情',
	         iconCls:'fi-plus icon-green',
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         href : '${ctx}/rewardspunishment/monthlyPerformance/detail?id='+id,
	         buttons : [ {
	             text : '打印',
	             iconCls:'icon-search',
	             handler : function() {
	                 
	             }
	         }
	         ]
	     });
	}
	function submitAuditMonthly(taskId,id,auditType,processInstanceId){
		 parent.$.modalDialog({
	         title : '月度考核审批',
	         iconCls:'fi-plus icon-green',
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         href : '${ctx}/rewardspunishment/monthlyPerformance/submitAudit?id='+id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processInstanceId,
	         buttons : [ {
	             text : '同意',
	             iconCls:'icon-save',
	             handler : function() {
	            	 parent.$.modalDialog.openner_dataGrid = $('#monthly_list').datagrid();
	                 var f1 = parent.$.modalDialog.handler.find('#submitAuditform');
	                 f1.submit(); 
	             }
	         }
	         ]
	     });
	}
	function viewProcess(url){
		 parent.$.modalDialog({
	         title : '流程信息',
	         iconCls:'fi-plus icon-green',
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         href : url
	     });
	}
	function formatOper(val,row,index){  
		var operation='';
		if(row.processInstanceId!='' && row.processInstanceId!=null){
			var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="monthlyDetail(\''+row.id+'\')"></a>';
		}else{
			var operation='<a href="javascript:void(0);" class="easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="submitMonthly(\''+row.id+'\')">上报</a>';
		}
		if(row.hasPermission==1){
			operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-clipboard-pencil" onclick="submitAuditMonthly(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">流程处理</a>';
		}
		if(row.processInstanceId!='' && row.processInstanceId!=null){
			if(row.isEnd==1){
				var url = '${ctx}/flow/queryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);"class="organization-easyui-linkbutton-map" onclick="viewProcess(\''+url+'\')"></a>';
			}else{
				var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
				operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-map" onclick="viewProcess(\''+url+'\')"></a>';
			}
		}
		
	    return operation;
	} 
</script>

</html>
