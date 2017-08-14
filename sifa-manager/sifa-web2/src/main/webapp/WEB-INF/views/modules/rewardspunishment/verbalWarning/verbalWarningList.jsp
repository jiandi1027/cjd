<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
<form id="verbalWarningSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
   <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
   
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
        	 <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="verbal_warning_list"/>
        </c:if>
         <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
       		
			<table>
				<tr>
				<td class="search-title">矫正对象：</td>
					<td><input name="culpritName" class="easyui-textbox"   /></td>
				</tr>
				<tr>
				<td class="search-title">违纪原因：</td>
					<td>
					<input id="dicReasonTypeKey" name="dicReasonTypeKey" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_WARNING_ORAL&columnName=DIC_REASON_TYPE_KEY&parentKey=78000&showAll=1',panelHeight:'auto'"
		    				 style="width:142px;"  >
					</td>
				</tr>
				<tr>
				<td class="search-title">创建起始：</td>
					<td><input name="searchStartDate" id="searchStartDate" class="Wdate" 
                   			onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" /></td>
				</tr>
				<tr>
				<td class="search-title">创建截止：</td>
					<td><input name="searchEndDate" id="searchEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate\')}'})" /></td>
				</tr>
				
			</table>
			
		
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" ><a
						href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#verbal_warning_list').datagrid('load' ,$.serializeObject($('#verbalWarningSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="$('#dicReasonTypeKey').combobox('reset');javascript:$('#verbalWarningSearchForm').form('clear');">清空</a></div>
		</div>
		
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="verbal_warning_list" title="口头警告列表" 
			data-options="singleSelect:true,fit:true,toolbar:'#verbalWarningToolbar',collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
				pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/rewardspunishment/verbalWarning/list',method:'post',onLoadSuccess:function (data) {
                          $('.verbalWarning-easyui-linkbutton-detail').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                          $('.verbalWarning-easyui-linkbutton-check').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard icon-blue'});
                          $('.verbalWarning-easyui-linkbutton-activityMap').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle icon-blue'});
                          $('.verbalWarning-easyui-linkbutton-process-stop').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
                    }" >
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'culpritName',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">矫正对象</th>
					<th data-options="field:'groupName',width:100,align:'center'"
						editor="text">司法所</th>
						
						<th data-options="field:'dicReasonTypeKey',width:230,formatter:function(value,rowData,rowIndex){
						return sy.getDicValue('SF_WARNING_ORAL','DIC_REASON_TYPE_KEY',value,'')},align:'center'">违纪原因 </th>
					
						<th data-options="field:'created',width:100,align:'center',sortable:true,formatter:Common.formatDate">创建时间</th>
				 <th data-options="field:'_opt',width:250,formatter:formatOper,align:'center'">操作</th>  
			</tr>
		</thead>
	</table>
	</div>
</div>
<div id="verbalWarningToolbar" style="display: none;">
   
        <a onclick="addVerbalWarning('');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
        
    
</div>
<script type="text/javascript">
var sysGroupTree;

$(function() {
	sysGroupTree = $('#sysGroupTree').tree({
         url : '${ctx}/sys/sysGroup/loadGroupTree',
         parentField : 'parentId',
         lines : true,
         onClick : function(node) {
        	 $('#verbal_warning_list').datagrid('load', {
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



function addVerbalWarning(id) {
	   /*  if (id != undefined&&id!='') {
	    	$('#sys_dict_child').datagrid('select', id);
	    	 var node = $('#sys_dict_child').datagrid('getSelected');
	    	 if (node) {
	    	       id=node.id;
	    	    }
	    } */
	   
	   

	    
	    parent.$.modalDialog({
	        title : '新增口头警告',
	        iconCls:'fi-plus icon-green',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : '${ctx}/rewardspunishment/verbalWarning/add',
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#verbal_warning_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#verbalWarningForm');
	                f.submit();
	            }
	        },{
	            text : '重置',
	            iconCls:'icon-undo',
	            handler : function() {
	           	 var f = parent.$.modalDialog.handler.find('#verbalWarningForm');
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


	
function verbalWarningDetail(id) { 
    parent.$.modalDialog({
        title : '口头警告详情',
        iconCls:'fi-info icon-blue',
        width : sy.getBrowerWidth()-250,
        height :680,
        href : '${ctx}/rewardspunishment/verbalWarning/get?id='+id,
        resizable : true,
        maximizable:true,
        buttons : [{
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
           	 parent.$.modalDialog.handler.dialog('close');
            }
       }]
    });
}


function verbalWarningCheck(id) { 
    parent.$.modalDialog({
        title : '口头警告审批',
        iconCls:'fi-clipboard icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        href : '${ctx}/rewardspunishment/verbalWarning/forCheck?id='+id,
        resizable : true,
        maximizable:true,
        buttons : [ {
            text : '审批',
            iconCls:'fi-clipboard-pencil icon-blue',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#verbal_warning_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#verbalWarningForm2');
                f.submit();
            }
        },{
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
           	 parent.$.modalDialog.handler.dialog('close');
            }
       } ]
    });
}

function verbalWarningActivityMap(processInstanceId,isEnd,processDefinitionId,id) { 
	var processDetailUrl="/rewardspunishment/verbalWarning/forProcessDetail?id="+id;
	var url="";
	if(isEnd==0){
		url="${ctx}/flow/queryActivityMap?processInstanceId="+processInstanceId;
	}
	if(isEnd==1){
		var pic=processDefinitionId+'&resourceType=png';
		url="${ctx}/flow/forQueryProcessDefinitionResource?processDefinitionId="+pic;
	}
	url = url+"&processDetailUrl="+processDetailUrl;
    parent.$.modalDialog({
        title : '口头警告流程',
        iconCls:'fi-shuffle icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        href: url ,
        resizable : true,
        maximizable:true,
        buttons : [{
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
           	 parent.$.modalDialog.handler.dialog('close');
            }
       }]
    });
}


function verbalWarningStopProcess(taskId){
	$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
	      if (b){  
	    	  $.ajax({
	  			type : 'get',
	  			url : "${ctx}/rewardspunishment/verbalWarning/stopProcess?taskId=" + taskId,
	  			cache : false,
	  			async : false, //同步请求
	  			dataType : 'json',
	  			success : function(result) {
	  				if(result.status==200){
	  					$.messager.show({
		  					title : '提示信息!',
		  					msg : '终止成功!'
		  				});
	  				}
	  				$('#verbal_warning_list').datagrid('reload',{});
	  			}
	  		});
	  		
	      }
	});  
}

	
function formatOper(val,row,index){  
	var str = '';
    str += $.formatString('<a href="javascript:void(0)" class="verbalWarning-easyui-linkbutton-detail" data-options="plain:true" onclick="verbalWarningDetail(\'{0}\');" >详情</a>', row.id);
    if(row.hasPermission==1){
    	str += '&nbsp;';
    	str=str+$.formatString('<a href="javascript:void(0)" class="verbalWarning-easyui-linkbutton-check" data-options="plain:true" onclick="verbalWarningCheck(\'{0}\',\'{1}\');"  title="处理">处理</a>', row.id,row.auditType);
    }
    str += '&nbsp;';
    str=str+$.formatString('<a href="javascript:void(0)" class="verbalWarning-easyui-linkbutton-activityMap" data-options="plain:true" onclick="verbalWarningActivityMap(\'{0}\',\'{1}\',\'{2}\',\'{3}\');"  title="流程图">流程图</a>', row.processInstanceId,row.isEnd,row.processDefinitionId,row.id);
	if(row.processInstanceId!='' && row.processInstanceId!=null){
		if(row.isEnd==0&&row.taskId!=undefined){
			str=str+'&nbsp;<a href="javascript:void(0);" class="verbalWarning-easyui-linkbutton-process-stop" onclick="verbalWarningStopProcess(\''+row.taskId+'\')">终止</a>';
		}
	}
    return str;
} 

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
</script>

