<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
<form id="redressResumeSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
   <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
   
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
        	 <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="redress_resume_list"/>
        </c:if>
         <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">       		
			<table>
				<tr>
				<td class="search-title">矫正对象：</td>
					<td><input name="culpritName" class="easyui-textbox"   /></td>
				</tr>
				<tr>
				<td class="search-title">提交起始：</td>
					<td><input name="searchStartDate" id="searchStartDate" class="Wdate" 
                   			onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" /></td>
				</tr>
				<tr>
				<td class="search-title">提交截止：</td>
					<td><input name="searchEndDate" id="searchEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate\')}'})" /></td>
				</tr>
				<tr>
				<td class="search-title">恢复起始：</td>
					<td><input name="redressStartDate" id="redressStartDate" class="Wdate" 
                   			onfocus="var redressEndDate=$dp.$('redressEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){redressEndDate.focus();},maxDate:'#F{$dp.$D(\'redressEndDate\')}'})" /></td>
				</tr>
				<tr>
				<td class="search-title">恢复截止：</td>
					<td><input name="redressEndDate" id="redressEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'redressStartDate\')}'})" /></td>
				</tr>
			</table>
			
		
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" ><a
						href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#redress_resume_list').datagrid('load' ,$.serializeObject($('#redressResumeSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#redressResumeSearchForm').form('clear');">清空</a></div>
		</div>
		
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="redress_resume_list" title="特殊原因恢复矫正列表" 
			data-options="singleSelect:true,fit:true,toolbar:'#redressResumeToolbar',collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/endcorrect/redressResume/list',method:'post',onLoadSuccess:function (data) {
                          $('.redressResume-easyui-linkbutton-detail').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                          $('.redressResume-easyui-linkbutton-check').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard icon-blue'});
                          $('.redressResume-easyui-linkbutton-activityMap').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle icon-blue'});
                          $('.redressResume-easyui-linkbutton-process-stop').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
                    }" >
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'culpritName',width:60,align:'center'">矫正对象</th>
				<th data-options="field:'groupName',width:70,align:'center'"  >司法所</th>
				<th data-options="field:'redressStartTime',width:100,align:'center',sortable:true,formatter:Common.formatDate"  >恢复时间</th>
				<th data-options="field:'created',width:100,align:'center',sortable:true,formatter:Common.formatDate">提交时间</th>
				<th data-options="field:'_opt',width:120,align:'center',formatter:formatOper" >操作</th>  
			</tr>
		</thead>
	</table>
	</div>
</div>
<div id="redressResumeToolbar" style="display: none;">
   <shiro:hasPermission name="endcorrect/redressResume/add">
        <a onclick="addRedressResume('');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
   </shiro:hasPermission>  
    
</div>
<script type="text/javascript">




function addRedressResume(id) {
	   /*  if (id != undefined&&id!='') {
	    	$('#sys_dict_child').datagrid('select', id);
	    	 var node = $('#sys_dict_child').datagrid('getSelected');
	    	 if (node) {
	    	       id=node.id;
	    	    }
	    } */
	   
	   

	    
	    parent.$.modalDialog({
	        title : '新增特殊原因恢复矫正',
	        iconCls:'fi-plus icon-green',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : '${ctx}/endcorrect/redressResume/add',
	        resizable : true,
	        maximizable:true, 
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#redress_resume_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#redressResumeForm');
	                f.submit();
	            }
	        },{
	            text : '重置',
	            iconCls:'icon-undo',
	            handler : function() {
	           	 var f = parent.$.modalDialog.handler.find('#redressResumeForm');
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


	
function redressResumeDetail(id) { 
    parent.$.modalDialog({
        title : '特殊原因恢复矫正详情',
        iconCls:'fi-info icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        href : '${ctx}/endcorrect/redressResume/get?id='+id,
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

function redressResumeCheck(id,auditType) { 
	if(auditType=='workerPrint'){
		parent.$.modalDialog({
	        title : '特殊原因恢复矫正审批',
	        iconCls:'fi-clipboard icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : '${ctx}/endcorrect/redressResume/forCheck?id='+id+'&auditType='+auditType,
	        resizable : true,
	        maximizable:true, 
	        buttons : [ {
	            text : '结束流程',
	            iconCls:'fi-power icon-red',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#redress_resume_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#redressResumeCheckForm');
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
	}else{
		parent.$.modalDialog({
	        title : '特殊原因恢复矫正审批',
	        iconCls:'fi-clipboard icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : '${ctx}/endcorrect/redressResume/forCheck?id='+id+'&auditType='+auditType,
	        resizable : true,
	        maximizable:true, 
	        buttons : [ {
	            text : '审批',
	            iconCls:'fi-clipboard-pencil icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#redress_resume_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#redressResumeCheckForm');
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

}

	
	function redressResumeActivityMap(processInstanceId,isEnd,processDefinitionId,id) { 
		var processDetailUrl="/endcorrect/redressResume/forProcessDetail?id="+id;
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
	        title : '特殊原因恢复矫正流程',
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
	
	function redressResumeStopProcess(taskId){
		$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
		      if (b){  
		    	  $.ajax({
		  			type : 'get',
		  			url : "${ctx}/endcorrect/redressResume/stopProcess?taskId=" + taskId,
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
		  				$('#redress_resume_list').datagrid('reload',{});
		  			}
		  		});
		  		
		      }
		});  
	}
	
	
function formatOper(val,row,index){  
	var str = '';
    str += $.formatString('<a href="javascript:void(0)" class="redressResume-easyui-linkbutton-detail" data-options="plain:true" onclick="redressResumeDetail(\'{0}\');" >详情</a>', row.id);
    if(row.hasPermission==1){
    	str += '&nbsp;';
    	str=str+$.formatString('<a href="javascript:void(0)" class="redressResume-easyui-linkbutton-check" data-options="plain:true" onclick="redressResumeCheck(\'{0}\',\'{1}\');"  title="处理">处理</a>', row.id,row.auditType);
	}
    str += '&nbsp;';
    str=str+$.formatString('<a href="javascript:void(0)" class="redressResume-easyui-linkbutton-activityMap" data-options="plain:true" onclick="redressResumeActivityMap(\'{0}\',\'{1}\',\'{2}\',\'{3}\');"  title="流程图">流程图</a>', row.processInstanceId,row.isEnd,row.processDefinitionId,row.id);
    if(row.processInstanceId!='' && row.processInstanceId!=null){
		if(row.isEnd==0&&row.taskId!=undefined){
			str=str+'&nbsp;<a href="javascript:void(0);" class="redressResume-easyui-linkbutton-process-stop" onclick="redressResumeStopProcess(\''+row.taskId+'\')">终止</a>';
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
