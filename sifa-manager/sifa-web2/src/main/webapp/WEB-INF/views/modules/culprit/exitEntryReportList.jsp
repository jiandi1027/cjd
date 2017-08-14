<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript">
	$('#searchExitEntrybtn').click(
			function() {
				$('#exitEntryReport_list_content').datagrid('load',
						serializeForm($('#exitEntrySearchForm')));
			});

	$('#cleanExitEntryBtn').click(function () {
		$('#exitEntryReport_list_content').datagrid('load', {});
		$('#exitEntrySearchForm').form().find('input').val('');
		$('#dicBbztKey_search').combobox('reset');
	});
	

	$(function(){
		$('#culpritName_enitEntry').combobox({ 
			url:'${ctx}/inculprit/exitEntryReport/nameList',    
		    valueField:'culpritName',    
		    textField:'culpritName',
		    mode: 'local',
		    editable:'false' ,
		    panelHeight:'auto',
		    limitToList:true,
		    panelMaxHeight:200,
		    filter: function(q, row){ //自动过滤数据
		        var opts = $(this).combobox('options');  
		        return row[opts.textField].indexOf(q) >= 0;
		    }
		}); 
	});
	
	
var accountRold='${sysAccount.roleId}';//此处用于控制上报权限
//操作
function formatterExitEntry(value,row,index){
	var space = '&nbsp;';
	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="exitEntryDetail(\''+row.id+'\',\''+row.auditType+'\',\''+row.isEnd+'\')">详情</a>';
	//证件收缴
	if(row.activityName==null){
		if(row.dicIsCollectKey==0){
			<shiro:hasPermission name="inculprit/exitEntryReport/form">
				operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-arrow-up1" data-options="plain:true,iconCls:\'fi-book icon-blue\'" onclick="dealZJ(\''+row.id+'\')">证件收缴</a>'+space;
			</shiro:hasPermission>
		}else{
			<shiro:hasPermission name="inculprit/exitEntryReport/arrowUp">
				operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-arrow-up" data-options="plain:true,iconCls:\'fi-arrow-up icon-blue\'" onclick="arrowUp(\''+row.id+'\')">上报</a>'+space;
			</shiro:hasPermission>
		}
		
	}
	if(row.hasPermission==1){
		operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-clipboard-pencil" onclick="auditReport(\''+row.taskId+'\',\''+row.id+'\',\''+row.auditType+'\',\''+row.processInstanceId+'\')">处理</a>';
	}
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		 var processDetailUrl="/inculprit/exitEntryReport/forProcessDetail?id="+row.id;
		if(row.isEnd==1){
			var url = '${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId='+row.processDefinitionId+'&resourceType=png';
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-map" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
		}else{
			var url = '${ctx}/flow/queryActivityMap?processInstanceId='+row.processInstanceId;
			operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-map" onclick="viewProcess(\''+url+'&processDetailUrl='+processDetailUrl+'\')">查看流程图</a>';
		} 
	}
    return operation;
	 
}

//流程审批
function auditReport(taskId,id,auditType,processId){
	var buttonName='审批';
	if(auditType=='xjzPrint'){
		buttonName='结束流程';
	}
	parent.$.modalDialog({
        title : '流程审批',
        iconCls:'fi-clipboard-pencil icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-100,
        resizable:true,
        maximizable:true,
        href : "${ctx}/inculprit/exitEntryReport/auditForm?id=" + id+"&taskId="+taskId+"&auditType="+auditType+"&processInstanceId="+processId,
        buttons : [ {
            text : buttonName,
            iconCls:'fi-clipboard-pencil icon-blue',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#exitEntryReport_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#exitEntryReportAuditForm');
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
}

function viewProcess(url){
	 parent.$.modalDialog({
        title : '流程信息',
        iconCls:'fi-shuffle icon-blue',
        width : sy.getBrowerWidth()-200,
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

//上报
function arrowUp(id){
	parent.$.modalDialog({
         title : '报备上报',
         iconCls:'fi-arrow-up icon-blue',
         width : 900,
         height :350,
         resizable:true,
         maximizable:true,
         modal:true,
         onBeforeClose:function(){
        	 var table=parent.$.modalDialog.handler.find('#addTable');
        	 table.remove(); 
         },
         href : '${ctx}/inculprit/exitEntryReport/form?id=' + id,
         buttons : [ {
           	 	text : '上报',
                iconCls:'fi-arrow-up icon-blue',
                handler : function() {  
                	 $.messager.confirm('提示信息', '上报后信息不能修改，确认完成收缴?', function(r) {
        				if (r) {
        				 	parent.$.modalDialog.openner_dataGrid = $('#exitEntryReport_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
        	                var f = parent.$.modalDialog.handler.find('#arrowUpBtn');
        	                f.click(); 
        				} else {
        					return;
        				}
        			}); 

                }
            },{
            	 text : '关闭',
                 iconCls:'fi-x icon-blue',
                 handler : function() {
                	 var table=parent.$.modalDialog.handler.find('#addTable');
                	 table.remove(); 
                	 parent.$.modalDialog.handler.dialog('close');
               }
          }] 		 
     });	
}


//证件收缴
function dealZJ(id){
	parent.$.modalDialog({
         title : '证件收缴',
         iconCls:'fi-book icon-blue',
         width : 900,
         height :350,
         resizable:true,
         maximizable:true,
         modal:true,
         closed:false,
         onBeforeClose:function(){
        	 var table=parent.$.modalDialog.handler.find('#addTable');
        	 table.remove(); 
         },
         href : '${ctx}/inculprit/exitEntryReport/form?id=' + id,
         buttons : [ {
           	 	text : '保存',
                iconCls:'icon-save',
                handler : function() {  
                	parent.$.modalDialog.openner_dataGrid = $('#exitEntryReport_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#saveExitEntryReportBtn');
	                f.click();
                }
            },{
            	 text : '关闭',
                 iconCls:'fi-x icon-blue',
                 handler : function() {
                	 var table=parent.$.modalDialog.handler.find('#addTable');
                	 table.remove();  
                	 parent.$.modalDialog.handler.dialog('close');
                }
            } ] 		 
     });	
}

//详情
function exitEntryDetail(id,auditType,isEnd){
	parent.$.modalDialog({
        title : '详情',
        iconCls:'fi-info icon-blue',
        width : sy.getBrowerWidth()-400,
        height : sy.getBrowerHeight()-200,
        resizable:true,
        maximizable:true,
        modal:true,
        href : '${ctx}/inculprit/exitEntryReport/detail?id=' + id,
        buttons : [ {
        	id:'isPrint',
       	 	text : '打印《法定不批准出境人员通报备案通知书》',
            iconCls:'fi-print icon-blue',
            handler : function() {
             		var f = parent.$.modalDialog.handler.find('#exitEntryReprotPrint1');
             		f.click();			
            	}
        } ,{
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
           	 parent.$.modalDialog.handler.dialog('close');
            }
        }] 
    });	
	$('#isPrint').hide();
	if (isEnd == 1) {
		$('#isPrint').show();
	}
	
}

function serializeForm(form) {
	var obj = {};
	$.each(form.serializeArray(),
			function(index) {
				if (obj[this['name']]) {
					obj[this['name']] = obj[this['name']] + ','
							+ this['value'].toUpperCase();
				} else {
					obj[this['name']] = this['value'].toUpperCase();
				}
			});
	return obj;
}

</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="exitEntrySearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
		<div class="easyui-layout" data-options="fit:true,border:true">
			<div region="center" border="false">
				<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
		          <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="exitEntryReport_list_content"/>
		         </c:if>
		            <div class="easyui-panel search-form" data-options="fit:true,border:false"  title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>"  style="width:100%;">
					<table>
						<tr>
							<td class="search-title">报备对象： </td>
							<td>
								<input name="culpritName" id="culpritName_enitEntry"/>
							</td>	
						</tr>
						<tr>
							<td class="search-title">证件号码： </td>
							<td>
								<input name="cedentialsNumber" class="easyui-textbox" />
							</td>	
						</tr>
						<tr>
							<td class="search-title">期限截止： </td>
							<td>
								<input name="fillEndDate" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" />
							</td>	
						</tr>
						<tr>
							<td class="search-title">报备状态： </td>
							<td>
								<input name="dicBbztKey" id="dicBbztKey_search" class="easyui-combobox" data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_exit_entry_report&columnName=dicBbztKey&parentKey=61000&showAll=1',panelHeight:'auto',editable:false"/>
							</td>	
						</tr> 
					</table>
					</div>
				</div>
			<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchExitEntrybtn" iconCls="icon-search" >查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanExitEntryBtn" iconCls="icon-undo" >清空</a>
			</div>
		</div>
		</div>
	</form>

	<div region="center" border="false">
		
		<table class="easyui-datagrid" id="exitEntryReport_list_content" title="出入境报备人员列表"  
			data-options="singleSelect:true,collapsible:true,rownumbers:true,fit:true,striped:true,fitColumns:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,
			url:'${ctx}/inculprit/exitEntryReport/list',method:'post',onLoadSuccess:function (data) {
						$('.organization-easyui-linkbutton-arrow-up1').linkbutton({text:'证件收缴',plain:true,iconCls:'fi-book icon-blue'});
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-linkbutton-map').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle icon-blue'});
                        $('.organization-easyui-linkbutton-clipboard-pencil').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                   		 $('.organization-easyui-linkbutton-arrow-up').linkbutton({text:'上报',plain:true,iconCls:'fi-arrow-up icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'culpritName',width:'10%',align:'center'">报备对象</th>
					<th data-options="field:'groupName',width:'10%',align:'center'">司法所</th>
					<th data-options="field:'cedentialsNumber',width:'30%',align:'center'">证件号码</th>
					<th data-options="field:'fillDate',width:'15%',align:'center',formatter:function(value,rowData,rowIndex){    
					    	 if(rowData.fillEndDate==null){
					    	 	return '截至时间未录入'
					    	 }else{
					    	 	return rowData.fillStartDate+'至'+ rowData.fillEndDate  
					    	 }}" >报备期限起始</th>
					<th data-options="field:'dicBbztKey',width:'7%',align:'center',formatter:function(value,rowData,rowIndex){    
    	 return sy.getDicValue('sf_exit_entry_report','dicBbztKey',rowData.dicBbztKey,'');  }" >报备状态</th>
    	 			<th data-options="field:'activityName',width:'8%',align:'center'"
						editor="text">审批状态</th>
					<th data-options="field:'action',width:'18%',align:'center'" formatter="formatterExitEntry">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>

