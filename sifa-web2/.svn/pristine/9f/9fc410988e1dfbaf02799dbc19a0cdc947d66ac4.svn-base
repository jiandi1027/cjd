<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript">

$(function() {


});

function formatOper(val,row,index){  
	var space = '&nbsp;';
	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="showStatusPrint(\''+row.id+'\')">详情</a>';
	if(row.dicState!="91801"  && row.dicState!="91804" ){//未上报
		<shiro:hasPermission name="statistics/culpritStatusTj/submitTj">
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-tj-arrow-up" data-options="plain:true,iconCls:\'fi-arrow-up icon-blue\'" onclick="submitTj(\''+row.id+'\')">上报</a>';
		</shiro:hasPermission>
	}
    return operation;
} 
 
function showStatusPrint(id){
	//查看
	 parent.$.modalDialog({
         title : '统计详情',
         iconCls:'fi-info icon-blue',
         width : sy.getBrowerWidth()-600,
         height : sy.getBrowerHeight()-150,
         resizable:true,
         maximizable:true,
         href : '${ctx}/statistics/culpritStatusTj/showPrint?id=' + id,
         buttons : [ {
        	 text : '打印',
        	 iconCls:'fi-print icon-blue',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#printTjBtn1');
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

function submitTj(id){
	//上报
	 parent.$.modalDialog({
         title : '上报详情',
         iconCls:'fi-arrow-up icon-blue',
         width : sy.getBrowerWidth()-250,
         height : sy.getBrowerHeight()-150,
         resizable:true,
         maximizable:true,
         href : '${ctx}/statistics/culpritStatusTj/submitTj?id=' + id,
         buttons : [ {
        	 id:'tjArrowUpBtn',
             text : '上报',
             iconCls:'fi-arrow-up icon-blue',
             handler : function() {
                 parent.$.modalDialog.openner_dataGrid = $('#t_culprit_status_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                 var f = parent.$.modalDialog.handler.find('#culpritStatusContent');
                 f.submit();
             }
         },{
        	 id:'endTj',
             text : '完成统计',
             iconCls:'icon-save',
             handler : function() {
            	var a=parent.$.modalDialog.handler.find('.noArrowUp1');
            	var flag=false;
            	a.each(function(){ 
            		if($(this).html()!=''){
            			flag=true;
            			return false;
            		}
                }); 
            	if(flag){
        			$.messager.alert({
							title : '提示信息!',
							msg : '部门数据未全部上报！'
						});
            		return;
            	}
            	
            	 $.ajax({
 					type : 'post',
 					url : '${ctx}/statistics/culpritStatusTj/submit?id='+id+'&dicState=91804',
 					cache : false,
 					async : false, //同步请求
 					dataType : 'json',
 					success : function(result) {
 						if(result.status==200){
 							$.messager.show({
 								title : '提示信息!',
 								msg : result.msg
 							});
 							 $('#t_culprit_status_content').datagrid('reload');
 		       				 parent.$.modalDialog.handler.dialog('close'); 
 						}	
 					}
 				});  
             }
         },{
        	 text : '关闭',
             iconCls:'fi-x icon-blue',
             handler : function() {
            	 parent.$.modalDialog.handler.dialog('close');
             }
         }]
     });
	
	 $('#tjArrowUpBtn').show();
	$('#endTj').hide();
	 	<shiro:hasPermission name="statistics/culpritStatusTj/finishTj">
	 		$('#tjArrowUpBtn').hide();//市局不需提交
	 		$('#endTj').show();//完成统计
		</shiro:hasPermission>
	
}

</script>

<div class="easyui-layout" data-options="fit:true,border:false">
 <form id="searchTjForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
            <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2"  style="width:100%;">
			<table>
				<tr>
				<td class="search-title">统计月份：</td>
					<td><input id="searchStartDate" name="searchStartDate" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM'})"  editable="false"/></td>
				</tr>
				<tr>
				<td class="search-title" style="text-align:right">至：</td>
					<td><input id="searchEndDate" name="searchEndDate"  class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM'})"  editable="false" /></td>
				</tr>
				<tr>
				<tr>	
					<td class="search-title">报表状态： </td>
					<td>
					<input name="dicState" id="search_stutus_dicState" class="easyui-combobox" data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_culprit_tj&columnName=dic_state&parentKey=91800&showAll=1',panelHeight:'auto',editable:false"/>
					</td>
				</tr>
			</table>
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
		 	<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#t_culprit_status_content').datagrid('load' ,$.serializeObject($('#searchTjForm')));">查询</a> &nbsp;&nbsp; 
			<a href="#" class="easyui-linkbutton" id="cleanTjBtn" iconCls="icon-undo" onclick="javascript:$('#t_culprit_status_content').datagrid('load', {});$('#search_stutus_dicState').combobox('reset');$('#searchTjForm').form('clear');">清空</a></div>
		</div>
	</div>
	</form>
    <div data-options="region:'center',border:true" >
        <table class="easyui-datagrid" id="t_culprit_status_content" title="社区矫正人员情况统计表（月表）"
			data-options="singleSelect:true,fit:true,toolbar:'#toolbar',collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/statistics/culpritStatusTj/list',method:'post',onLoadSuccess:function (data) {
                       $('.organization-easyui-tj-arrow-up').linkbutton({text:'处理',plain:true,iconCls:'fi-arrow-up icon-blue'});
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详细',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-linkbutton-down1').linkbutton({text:'导出',plain:true,iconCls:'fi-social-forrst icon-blue'});
                        $('.organization-easyui-linkbutton-record').linkbutton({text:'退回',plain:true,iconCls:'fi-record icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'groupName',width:'20%',align:'center'">单位</th>
					<th data-options="field:'reportDate',width:'20%',align:'center',sortable:true"
						editor="text">统计月份</th>
					<th data-options="field:'dicState',width:'20%',align:'center',sortable:true,
					formatter:function(value,rowData,rowIndex){return sy.getDicValue('sf_culprit_tj','dic_state',value,'')}"
						editor="text">报表状态</th>
				 	<th data-options="field:'_opt',width:'38%',formatter:formatOper,align:'center'">操作</th>  

				</tr>
			</thead>
		</table>
    </div>
</div>

