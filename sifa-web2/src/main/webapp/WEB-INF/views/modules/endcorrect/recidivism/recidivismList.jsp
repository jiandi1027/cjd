<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
<form id="recidivismSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
   <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
   
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
        	 <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="recidivism_list"/>
        </c:if>
         <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
       		
			<table>
				<tr>
				<td class="search-title">矫正对象：</td>
					<td><input name="culpritName" class="easyui-textbox"   /></td>
				</tr>
				<tr>
				<td class="search-title">涉嫌罪名：</td>
					<td><input name="newCrime" class="easyui-textbox"   /></td>
				</tr>
				<tr>
				<td class="search-title">立案单位：</td>
					<td><input name="registerUnit" class="easyui-textbox"   /></td>
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
						href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#recidivism_list').datagrid('load' ,$.serializeObject($('#recidivismSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#recidivismSearchForm').form('clear');">清空</a></div>
		</div>
		
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="recidivism_list" title="重新犯罪列表" 
			data-options="singleSelect:true,fit:true,toolbar:'#recidivismToolbar',collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/endcorrect/recidivism/list',method:'post',onLoadSuccess:function (data) {
                          $('.recidivism-easyui-linkbutton-detail').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                          $('.recidivism-easyui-linkbutton-check').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard icon-blue'});
                          $('.recidivism-easyui-linkbutton-activityMap').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle icon-blue'});
                          $('.recidivism-easyui-linkbutton-process-stop').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
                    }" >
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'culpritName',width:60,align:'center'">矫正对象</th>
				<th data-options="field:'groupName',width:60,align:'center'"  >司法所</th>
				<th data-options="field:'newCrime',width:60,align:'center'">涉案罪名</th>
				<th data-options="field:'registerUnit',width:60,align:'center'">立案单位</th>
				<th data-options="field:'created',width:70,align:'center',sortable:true,formatter:Common.formatDate">创建时间</th>
				<th data-options="field:'_opt',width:120,align:'center',formatter:formatOper" >操作</th>  
			</tr>
		</thead>
	</table>
	</div>
</div>
<div id="recidivismToolbar" style="display: none;">
   
        
    
</div>
<script type="text/javascript">
var sysGroupTree;

$(function() {
	sysGroupTree = $('#sysGroupTree').tree({
         url : '${ctx}/sys/sysGroup/loadGroupTree',
         parentField : 'parentId',
         lines : true,
         onClick : function(node) {
        	 $('#recidivism_list').datagrid('load', {
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



function addrecidivism(id) {
	   /*  if (id != undefined&&id!='') {
	    	$('#sys_dict_child').datagrid('select', id);
	    	 var node = $('#sys_dict_child').datagrid('getSelected');
	    	 if (node) {
	    	       id=node.id;
	    	    }
	    } */
	   
	   

	    
	    parent.$.modalDialog({
	        title : '新增重新犯罪',
	        iconCls:'fi-plus icon-green',
	        width : 1000,
	        height : 550,
	        href : '${ctx}/endcorrect/recidivism/add?id='+id,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#recidivism_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#recidivismForm');
	                f.submit();
	            }
	        },{
	            text : '重置',
	            iconCls:'icon-undo',
	            handler : function() {
	           	 var f = parent.$.modalDialog.handler.find('#recidivismForm');
	           	 f.get(0).reset(); //清空表单数据 
	            }
	        },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 parent.$.modalDialog.handler.dialog('close');
	             }
	        }   ]
	    });
	}

	
function recidivismDetail(id) { 
    parent.$.modalDialog({
        title : '重新犯罪详情',
        iconCls:'fi-info icon-blue',
        width : 1000,
        height : 600,
        href : '${ctx}/endcorrect/recidivism/get?id='+id,
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

function recidivismCheck(id,auditType) { 
	if(auditType=='workerPrint'){
		parent.$.modalDialog({
	        title : '重新犯罪流程处理',
	        iconCls:'fi-clipboard icon-blue',
	        width : 1000,
	        height : 650,
	        href : '${ctx}/endcorrect/recidivism/check?id='+id,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '结束流程',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#recidivism_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#recidivismForm');
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
	}else{
		parent.$.modalDialog({
	        title : '重新犯罪流程处理',
	        iconCls:'fi-clipboard icon-blue',
	        width : 1000,
	        height : 650,
	        href : '${ctx}/endcorrect/recidivism/check?id='+id,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '审批',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#recidivism_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#recidivismForm');
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
}


function recidivismActivityMap(processInstanceId,isEnd,processDefinitionId,id) { 
	var processDetailUrl="/endcorrect/recidivism/forProcessDetail?id="+id;
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
        title : '重新犯罪流程',
        iconCls:'fi-shuffle icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        href: url ,
        buttons : [{
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
           	 parent.$.modalDialog.handler.dialog('close');
            }
       }]
    });
}
	
function recidivismStopProcess(taskId){
	$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
	      if (b){  
	    	  $.ajax({
	  			type : 'get',
	  			url : "${ctx}/endcorrect/recidivism/stopProcess?taskId=" + taskId,
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
	  				$('#recidivism_list').datagrid('reload',{});
	  			}
	  		});
	  		
	      }
	});  
}
	
function formatOper(val,row,index){  
	var str = '';
    str += $.formatString('<a href="javascript:void(0)" class="recidivism-easyui-linkbutton-detail" data-options="plain:true" onclick="recidivismDetail(\'{0}\');" >详情</a>', row.id);
    if(row.auditType=='workerReport'){
    	str += '&nbsp;';
    	str += $.formatString('<a href="javascript:void(0)" class="recidivism-easyui-linkbutton-check" data-options="plain:true"  onclick="addrecidivism(\'{0}\');" >处理</a>', row.id);
	}
    if(row.hasPermission==1&&row.auditType!='workerReport'){
    	str += '&nbsp;';
    	str=str+$.formatString('<a href="javascript:void(0)" class="recidivism-easyui-linkbutton-check" data-options="plain:true" onclick="recidivismCheck(\'{0}\',\'{1}\');"  title="处理">处理</a>', row.id,row.auditType);
	}
    str += '&nbsp;';
    str=str+$.formatString('<a href="javascript:void(0)" class="recidivism-easyui-linkbutton-activityMap" data-options="plain:true" onclick="recidivismActivityMap(\'{0}\',\'{1}\',\'{2}\',\'{3}\');"  title="流程图">流程图</a>', row.processInstanceId,row.isEnd,row.processDefinitionId,row.id);
    if(row.processInstanceId!='' && row.processInstanceId!=null){
		if(row.isEnd==0&&row.taskId!=undefined){
			str=str+'&nbsp;<a href="javascript:void(0);" class="recidivism-easyui-linkbutton-process-stop" onclick="recidivismStopProcess(\''+row.taskId+'\')">终止</a>';
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

</html>
