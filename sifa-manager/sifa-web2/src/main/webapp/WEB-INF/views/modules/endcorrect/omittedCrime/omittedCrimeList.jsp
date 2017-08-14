<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
<form id="omittedCrimeSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
   <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
   
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
        	 <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="omitted_crime_list"/>
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
						href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#omitted_crime_list').datagrid('load' ,$.serializeObject($('#omittedCrimeSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#omittedCrimeSearchForm').form('clear');">清空</a></div>
		</div>
		
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="omitted_crime_list" title="漏罪列表" 
			data-options="singleSelect:true,fit:true,toolbar:'#omittedCrimeToolbar',collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/endcorrect/omittedCrime/list',method:'post',onLoadSuccess:function (data) {
                          $('.omittedCrime-easyui-linkbutton-detail').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                          $('.omittedCrime-easyui-linkbutton-check').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard icon-blue'});
                          $('.omittedCrime-easyui-linkbutton-activityMap').linkbutton({text:'流程图',plain:true,iconCls:'fi-shuffle icon-blue'});
                          $('.omittedCrime-easyui-linkbutton-process-stop').linkbutton({text:'终止',plain:true,iconCls:'fi-power icon-red'});
                    }" >
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'culpritName',width:60,align:'center'">矫正对象</th>
				<th data-options="field:'groupName',width:70,align:'center'"  >司法所</th>
				<th data-options="field:'newCrime',width:80,align:'center'">涉案罪名</th>
				<th data-options="field:'registerUnit',width:70,align:'center'">立案单位</th>
				<th data-options="field:'created',width:70,align:'center',sortable:true,formatter:Common.formatDate">创建时间</th>
				<th data-options="field:'_opt',width:120,align:'center',formatter:formatOper" >操作</th>   
			</tr>
		</thead>
	</table>
	</div>
</div>
<div id="omittedCrimeToolbar" style="display: none;">
   
        <a onclick="addOmittedCrime('');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
        
    
</div>
<script type="text/javascript">
var sysGroupTree;

$(function() {
	sysGroupTree = $('#sysGroupTree').tree({
         url : '${ctx}/sys/sysGroup/loadGroupTree',
         parentField : 'parentId',
         lines : true,
         onClick : function(node) {
        	 $('#omitted_crime_list').datagrid('load', {
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



function addOmittedCrime(id) {
	   /*  if (id != undefined&&id!='') {
	    	$('#sys_dict_child').datagrid('select', id);
	    	 var node = $('#sys_dict_child').datagrid('getSelected');
	    	 if (node) {
	    	       id=node.id;
	    	    }
	    } */
	   
	   

	    
	    parent.$.modalDialog({
	        title : '新增漏罪',
	        iconCls:'fi-plus icon-green',
	        width : 1000,
	        height : 600,
	        href : '${ctx}/endcorrect/omittedCrime/add',
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#omitted_crime_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#omittedCrimeForm');
	                f.submit();
	            }
	        },{
	            text : '重置',
	            iconCls:'icon-undo',
	            handler : function() {
	           	 var f = parent.$.modalDialog.handler.find('#omittedCrimeForm');
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


	
function omittedCrimeDetail(id) { 
    parent.$.modalDialog({
        title : '漏罪详情',
        iconCls:'fi-info icon-blue',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        href : '${ctx}/endcorrect/omittedCrime/get?id='+id,
        resizable : true,
        maximizable:true,
        buttons : [{
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
           	 parent.$.modalDialog.handler.dialog('close');
            } 
        } ]
    });
}

function omittedCrimeCheck(id,auditType) { 
	if(auditType=='workerPrint'){
		parent.$.modalDialog({
	        title : '漏罪审批',
	        iconCls:'fi-clipboard icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : '${ctx}/endcorrect/omittedCrime/check?id='+id+"&auditType="+auditType,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	        	text : '结束流程',
	            iconCls:'fi-power icon-red',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#omitted_crime_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#omittedCrimeCheckForm');
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
	        title : '漏罪审批',
	        iconCls:'fi-clipboard icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : '${ctx}/endcorrect/omittedCrime/check?id='+id+"&auditType="+auditType,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	        	text : '审批',
	            iconCls:'fi-clipboard-pencil icon-blue',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#omitted_crime_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#omittedCrimeCheckForm');
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


function omittedCrimeActivityMap(processInstanceId,isEnd,processDefinitionId,id) { 
	var processDetailUrl="/endcorrect/omittedCrime/forProcessDetail?id="+id;
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
        title : '漏罪流程',
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
        } ]
    });
}

function omittedCrimeStopProcess(taskId){
	$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
	      if (b){  
	    	  $.ajax({
	  			type : 'get',
	  			url : "${ctx}/endcorrect/omittedCrime/stopProcess?taskId=" + taskId,
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
	  				$('#omitted_crime_list').datagrid('reload',{});
	  			}
	  		});
	  		
	      }
	});  
}
	
function formatOper(val,row,index){  
	var str = '';
    str += $.formatString('<a href="javascript:void(0)" class="omittedCrime-easyui-linkbutton-detail" data-options="plain:true" onclick="omittedCrimeDetail(\'{0}\');" >详情</a>', row.id);
    if(row.hasPermission==1){
    	str += '&nbsp;';
    	str=str+$.formatString('<a href="javascript:void(0)" class="omittedCrime-easyui-linkbutton-check" data-options="plain:true" onclick="omittedCrimeCheck(\'{0}\',\'{1}\');"  title="处理">处理</a>', row.id,row.auditType);
    }
    str += '&nbsp;';
    str=str+$.formatString('<a href="javascript:void(0)" class="omittedCrime-easyui-linkbutton-activityMap" data-options="plain:true" onclick="omittedCrimeActivityMap(\'{0}\',\'{1}\',\'{2}\',\'{3}\');"  title="流程图">流程图</a>', row.processInstanceId,row.isEnd,row.processDefinitionId,row.id);
    if(row.processInstanceId!='' && row.processInstanceId!=null){
		if(row.isEnd==0&&row.taskId!=undefined){
			str=str+'&nbsp;<a href="javascript:void(0);" class="omittedCrime-easyui-linkbutton-process-stop" onclick="omittedCrimeStopProcess(\''+row.taskId+'\')">终止</a>';
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
