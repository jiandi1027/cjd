<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>


<div class="easyui-layout" data-options="fit:true,border:false">
	 <form id="sysPermissionSearchForm" style="padding-bottom: 10px;padding-top: 10px;">
		 <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
         <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" style="width:100%;">
       		
			<table>
				<tr>
				<td class="search-title">父&nbsp;&nbsp;资&nbsp;&nbsp;源：</td>
					<td>	
					<select id="parentId" name="parentId" class="easyui-combotree" 
    data-options="url:'${ctx}/sys/sysPermisson/selectDownTree',editable:true" >
</select></td>
				</tr>
				<tr>
				<td class="search-title">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
					<td><input name="name" class="easyui-textbox"/>
					</td>
				</tr>
				<tr>
				<td class="search-title">U&nbsp;&nbsp;&nbsp;&nbsp;R&nbsp;&nbsp;&nbsp;&nbsp;L：</td>
					<td><input name="url" class="easyui-textbox"/>
					</td>
				</tr>
				<tr>
				<td class="search-title">权限类型：</td>
					<td><input name="type" class="easyui-textbox"/>
					</td>
				</tr>
				
			</table>
			
		
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" ><a
						href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#sys_permission_list').treegrid('load' ,$.serializeObject($('#sysPermissionSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#sysPermissionSearchForm').form('clear');">清空</a></div>
		</div>
		
	</div>
		 
		
	</form>
	<div region="center" border="false">
		<table  class="easyui-treegrid" id="sys_permission_list" title="资源列表" style="height: 400px;"
			data-options="singleSelect:true,fit:true,idField :'id',treeField : 'name', parentField : 'parentId',collapsible:true,striped:true,toolbar:'#sysPermissonToolbar',loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/sys/sysPermisson/tree',method:'post',onLoadSuccess:function (data) {
                        $('.easyui-linkbutton-edit').linkbutton({text:'编辑',plain:true,iconCls:'fi-pencil icon-blue'});
                         $('.easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }"">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'name',width:160,align:'left'"  editor="{type:'validatebox',options:{required:true}}">名称</th>
				<th data-options="field:'url',width:100,align:'center'" >地址</th>
				<th data-options="field:'available',width:80,align:'center',formatter:function(value,rowData,rowIndex){    
					    if(typeof(rowData.available) != 'undefined' && rowData.available!=''){
					    	 return sy.getDicValue('common_table','yes_no',rowData.available,''); 
					    }
					}"   >是否可用</th>
				
				<th data-options="field:'_opt',width:100,align:'center',formatter:formatOper" id="operation">操作</th>  
				
			</tr>
		</thead>
	</table>
	</div>

</div>
<div id="sysPermissonToolbar" style="display: none;">
   
        <a onclick="editSysPermisson('');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-blue'">添加</a>
        <a onclick="deleteAskLeave();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>
    
</div>
<script type="text/javascript">

$(function(){
	
	


});
function editSysPermisson(id) {
    if (id != undefined&&id!='') {
    	$('#sys_permission_list').treegrid('select', id);
    	 var node = $('#sys_permission_list').treegrid('getSelected');
    	 if (node) {
    	       id=node.id;
    	    }
    }
   
   
    
    
    parent.$.modalDialog({
        title : '编辑资源',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        href : '${ctx}/sys/sysPermisson/form?id=' + id,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_treeGrid = $('#sys_permission_list').treegrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#sysPermissonForm');
                f.submit();
            }
        },{
            text : '重置',
            iconCls:'icon-undo',
            handler : function() {
           	 var f = parent.$.modalDialog.handler.find('#sysPermissonForm');
           	 f.get(0).reset(); //清空表单数据 
            }
        }  ]
    });
}

function deleteSysPermisson(id) {
    if (id != undefined&&id!='') {
    	$('#sys_permission_list').treegrid('select', id);
    }
    var node = $('#sys_permission_list').treegrid('getSelected');
    if (node) {
        parent.$.messager.confirm('询问', '您是否要删除当前资源？删除当前资源会连同子资源一起删除!', function(b) {
            if (b) {
                progressLoad();
                $.post('${ctx}/sys/sysPermisson/delete', {
                    id : node.id
                }, function(result) {
                    if (result.success) {
                        parent.$.messager.alert('提示', result.msg, 'info');
                        $('#sys_permission_list').treegrid('reload');
                    }else{
                        parent.$.messager.alert('提示', result.msg, 'info');
                    }
                    progressClose();
                }, 'JSON');
            }
        });
    }
}

function formatOper(val,row,index){  
	  var str = '';
        str += $.formatString('<a href="javascript:void(0)" class="easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'"  onclick="editSysPermisson(\'{0}\');" >编辑</a>', row.id);
        str += '&nbsp;';
        str += $.formatString('<a href="javascript:void(0)" class="easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteSysPermisson(\'{0}\');" >删除</a>', row.id);
        return str;
} 
</script>

