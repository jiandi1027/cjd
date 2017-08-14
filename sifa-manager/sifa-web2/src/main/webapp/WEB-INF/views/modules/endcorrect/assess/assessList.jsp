<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
<form id="noDealSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
   <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
   
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
        	 <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="recidivism_perhaps_list"/>
        </c:if>
         <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
       		
			<table>
				<tr>
				<td class="search-title">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
					<td><input name="culpritName" class="easyui-textbox"   /></td>
				</tr>
				
			</table>
			
		
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" ><a
						href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#no_deal_list').datagrid('load' ,$.serializeObject($('#noDealSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#noDealSearchForm').form('clear');">清空</a></div>
		</div>
		
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="sys_account_list" title="矫正终止到期警示列表" 
			data-options="singleSelect:true,fit:true,toolbar:'#toolbar',collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/endcorrect/rewardspunishment/list',method:'post',onLoadSuccess:function (data) {
                    }">
		<thead>
			<tr>
				<th data-options="field:'groupName',width:80,align:'center'">单位</th>
				<th data-options="field:'name',width:80,align:'center'"  >姓名</th>
				<th data-options="field:'accountName',width:100,align:'center'" >联系人</th>
				<th data-options="field:'adjudgeOrg',width:80,align:'center'" >犯罪类别</th>
				<th data-options="field:'dicCrimeTypeKey',width:80,align:'center'" >刑罚执行类别</th>
				<th data-options="field:'redressEndDate',width:130,align:'center'">矫正截止时间</th>
				<th data-options="field:'_opt',width:120,align:'center',formatter:formatOper" >操作</th>  
			</tr>
		</thead>
	</table>
	</div>

</div>

<script type="text/javascript">
var sysGroupTree;

$(function() {
	sysGroupTree = $('#sysGroupTree').tree({
         url : '${ctx}/sys/sysGroup/loadGroupTree',
         parentField : 'parentId',
         lines : true,
         onClick : function(node) {
        	 $('#sys_account_list').datagrid('load', {
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
function editSysAccount(id) {
	   /*  if (id != undefined&&id!='') {
	    	$('#sys_dict_child').datagrid('select', id);
	    	 var node = $('#sys_dict_child').datagrid('getSelected');
	    	 if (node) {
	    	       id=node.id;
	    	    }
	    } */
	   
	   

	    
	    parent.$.modalDialog({
	        title : '编辑账号',
	        width : 600,
	        height : 300,
	        href : '${ctx}/sys/sysAccount/form?id=' + id,
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#sys_account_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#sysAccountForm');
	                f.submit();
	            }
	        },{
	            text : '重置',
	            iconCls:'icon-undo',
	            handler : function() {
	           	 var f = parent.$.modalDialog.handler.find('#sysAccountForm');
	           	 f.get(0).reset(); //清空表单数据 
	            }
	        }  ]
	    });
	}

	function deleteSysAccount(id) {
	 /*    if (id != undefined&&id!='') {
	    	$('#t_list_content').treegrid('select', id);
	    } */
	    
		  parent.$.messager.confirm('询问', '您是否要删除当前账号？删除当前账号会连同子账号一起删除!', function(b) {
	          if (b) {
	              progressLoad();
	              $.post('${ctx}/sys/sysAccount/delete', {
	                  id : id
	              }, function(result) {
	                  if (result.success) {
	                		$('#sys_account_list').datagrid('reload');
	                  }else{
	                      parent.$.messager.alert('提示', result.msg, 'info');
	                  }
	                  progressClose();
	              }, 'JSON');
	          }
	      });
	}
function formatOper(val,row,index){  
	  var str = '';
    return str;
} 
</script>

</html>
