<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
 <form id="sysRoleSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
 	 <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
         <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" style="width:100%;">
       		
			<table>
				<tr>
				<td class="search-title">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
					<td><input name="name" class="easyui-textbox"   /></td>
				</tr>
				<tr>
				<td class="search-title">英文名称：</td>
					<td><input name="ename" class="easyui-textbox"   />
					</td>
				</tr>
				
			</table>
			
		
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" ><a
						href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#sys_role_list').datagrid('load' ,$.serializeObject($('#sysRoleSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#sysRoleSearchForm').form('clear');">清空</a></div>
		</div>
		
	</div>
 
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="sys_role_list" title="角色列表" style="height: 400;px"
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:'#sysRoleToolbar',loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/sys/sysRole/list',method:'post',onLoadSuccess:function(data){
                $('.role-easyui-linkbutton-ok').linkbutton({text:'授权'});
                $('.role-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.role-easyui-linkbutton-del').linkbutton({text:'删除'});
            }">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'name',width:80,align:'center'" >名称</th>
				<th data-options="field:'ename',width:100,align:'center'" >英文名称</th>
				<th data-options="field:'isAvailable',width:80,align:'center',formatter:function(value,rowData,rowIndex){
				   return sy.getDicValue('common_table','yes_no',rowData.isAvailable,'');
				}"   >是否可用</th>
				<th data-options="field:'_opt',width:100,align:'center',formatter:formatOper" >操作</th>  
			</tr>
		</thead>
	</table>
	</div>
	
</div>
<div id="sysRoleToolbar" style="display: none;">
   <c:if test="${sysAccount.roleId == 1 }">
        <a onclick="editSysRole('');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
        <a onclick="deleteSysRole();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">批量删除</a>
   </c:if>
    
</div>
<script type="text/javascript">

function editSysRole(id) {
	   /*  if (id != undefined&&id!='') {
	    	$('#sys_dict_child').datagrid('select', id);
	    	 var node = $('#sys_dict_child').datagrid('getSelected');
	    	 if (node) {
	    	       id=node.id;
	    	    }
	    } */
	   
	   

	    
	    parent.$.modalDialog({
	        title : '编辑角色',
	        width : 600,
	        height : 300,
	        resizable : true,
	        maximizable:true, 
	        iconCls:'fi-pencil icon-blue',
	        href : '${ctx}/sys/sysRole/form?id=' + id,
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#sys_role_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#sysRoleForm');
	                f.submit();
	            }
	        },{
	            text : '重置',
	            iconCls:'icon-undo',
	            handler : function() {
	           	 var f = parent.$.modalDialog.handler.find('#sysRoleForm');
	           	 f.get(0).reset(); //清空表单数据 
	            }
	        }  ]
	    });
	}

	function deleteSysRole(id) {
	 /*    if (id != undefined&&id!='') {
	    	$('#t_list_content').treegrid('select', id);
	    } */
	    
		  parent.$.messager.confirm('询问', '您是否要删除当前角色？删除当前角色会连同子角色一起删除!', function(b) {
	          if (b) {
	              progressLoad();
	              $.post('${ctx}/sys/sysRole/delete', {
	                  id : id
	              }, function(result) {
	                  if (result.success) {
	                		$('#sys_role_list').datagrid('reload');
	                  }else{
	                      parent.$.messager.alert('提示', result.msg, 'info');
	                  }
	                  progressClose();
	              }, 'JSON');
	          }
	      });
	}

function grantRoleFun(id) {
    if (id == undefined) {
        var rows = $("#sys_role_list").datagrid('getSelections');
        id = rows[0].id;
    } else {
        $("#sys_role_list").datagrid('unselectAll').datagrid('uncheckAll');
    }
    
    parent.$.modalDialog({
        title : '授权',
        width : 400,
        height : 500,
        resizable : true,
        maximizable:true, 
        iconCls:'fi-check icon-blue',
        href : '${ctx}/sys/sysRole/grantPage?id=' + id,
        buttons : [ {
            text : '确定',
            iconCls:'fi-check icon-blue',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $("#sys_role_list").datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#roleGrantForm');
                f.submit();
            }
        } ]
    });
}
function formatAvailable(value, row, index){
	var str = '';
	$.ajax({
		type : 'post',
		url : '${ctx}/sys/sysDic/getDicValue?tabName=common_table&columnName=yes_no&value='+value,
		cache : false,
		async : false, //同步请求
		data : {
			id : value
		},
		dataType : 'json',
		success : function(result) {
			str = result.key;
		}
	});
	return str;
	
}
function formatOper(val,row,index){
	 var str = '';
         str += $.formatString('<a href="javascript:void(0)" class="role-easyui-linkbutton-ok" data-options="plain:true,iconCls:\'fi-check icon-blue\'" onclick="grantRoleFun(\'{0}\');" >授权</a>', row.id);
         str += '&nbsp;';
         str += $.formatString('<a href="javascript:void(0)" class="role-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editSysRole(\'{0}\');" >编辑</a>', row.id);
         //str += '&nbsp;';
         //str += $.formatString('<a href="javascript:void(0)" class="role-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteSysRole(\'{0}\');" >删除</a>', row.id);
 return str;
}
</script>

</html>
