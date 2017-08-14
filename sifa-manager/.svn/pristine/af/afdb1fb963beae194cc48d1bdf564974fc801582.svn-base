<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
 <form id="sysGroupSearchForm" style="padding-bottom: 10px;padding-top: 10px;">
 
 
 
 <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
        <sys:sysGroup hiddenId="parentId" hiddenName="parentId" dataGridId="sys_group_list" isAll="1" isTreeGrid="1"/>
        
           <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="查询项目 " style="width:100%;">
			<table>
				<tr>
				<td class="search-title">部门名称：</td>
					<td><input name="name" class="easyui-textbox"   /></td>
				</tr>
				
			</table>
			
		
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" ><a
						href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#sys_group_list').treegrid('load' ,$.serializeObject($('#sysGroupSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#sysGroupSearchForm').form('clear');">清空</a></div>
		</div>
		
	</div>
 
 
	
     </form>
	<div region="center" border="false">
		<table class="easyui-treegrid" id="sys_group_list" title="部门列表" 
			data-options="singleSelect:true,fit:true,toolbar:'#sysGroupToolbar',idField :'id',treeField : 'name', parentField : 'parentId',collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/sys/sysGroup/treeGrid',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-edit').linkbutton({text:'编辑',plain:true,iconCls:'fi-pencil icon-blue'});
                         $('.organization-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'name',width:130,align:'left'"  >部门名称</th>
				<th data-options="field:'contactor',width:80,align:'center'"  >联系人</th>
				<th data-options="field:'phone',width:160,align:'center'" >联系号码</th>
				<th data-options="field:'_opt',width:100,align:'center',formatter:formatOper" id="operation">操作</th>  

			</tr>
		</thead>
	</table>
	</div>
<div id="sysGroupToolbar" style="display: none;">
   
        <a onclick="editSysGroup('');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
        <a onclick="deleteSysGroup();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">批量删除</a>
    
</div>
<script type="text/javascript">

function editSysGroup(id) {
    if (id != undefined&&id!='') {
    	$('#sys_group_list').treegrid('select', id);
    	 var node = $('#sys_group_list').treegrid('getSelected');
    	 if (node) {
    	       id=node.id;
    	    }
    }
    
    parent.$.modalDialog({
        title : '编辑组织',
        width : 800,
        height : 400,
        resizable : true,
        maximizable:true, 
        iconCls:'fi-pencil icon-blue',
        href : '${ctx}/sys/sysGroup/form?id=' + id,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_treeGrid = $('#sys_group_list').treegrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#sysGroupForm');
                f.submit();
            }
        },{
            text : '重置',
            iconCls:'icon-undo',
            handler : function() {
           	 var f = parent.$.modalDialog.handler.find('#sysGroupForm');
           	 f.get(0).reset(); //清空表单数据 
            }
        }  ]
    });
}

function deleteSysGroup(id) {
    if (id != undefined&&id!='') {
    	$('#sys_group_list').treegrid('select', id);
    }
    var node = $('#sys_group_list').treegrid('getSelected');
    if (node) {
        parent.$.messager.confirm('询问', '您是否要删除当前组织？删除当前组织会连同子组织一起删除!', function(b) {
            if (b) {
                progressLoad();
                $.post('${ctx}/sys/sysGroup/delete', {
                    id : node.id
                }, function(result) {
                    if (result.success) {
                        parent.$.messager.alert('提示', result.msg, 'info');
                        $('#sys_group_list').treegrid('reload');
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
          str += $.formatString('<a href="javascript:void(0)" class="organization-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'"  onclick="editSysGroup(\'{0}\');" >编辑</a>', row.id);
          str += '&nbsp;';
          str += $.formatString('<a href="javascript:void(0)" class="organization-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteSysGroup(\'{0}\');" >删除</a>', row.id);
          return str;
} 

</script>

</div>
