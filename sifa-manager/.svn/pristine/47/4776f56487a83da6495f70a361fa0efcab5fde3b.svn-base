<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
<div data-options="region:'north',border:false">
        <form id="sysDicSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
            <table width="100%">
				<tr>
					<td width="10%" align="right">表名:
					</td>
					<td>
						<input name="tabName" class="easyui-textbox" style="width: 150px;"
						  />
						
					</td>
					<td width="10%" align="right">列名:</td>
					<td>
						<input name="columnName" class="easyui-textbox" style="width: 150px;"
						  />
					</td>
					<td width="10%" align="right">键:</td>
					<td>
						<input name="key" class="easyui-textbox" style="width: 150px;"
						  />
					</td>
				</tr>
				<tr>
				<td width="10%" align="right">值:</td>
					<td>
						<input name="value" class="easyui-textbox" style="width: 150px;"
						  />
					</td>
					
					<td colspan="2"><a
						href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#sys_dict_parent').datagrid('load' ,$.serializeObject($('#sysDicSearchForm')));"
						id="searchGroupBtn">搜索</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#sysDicSearchForm').form('clear');">清空</a></td>
				</tr>
				
				
			</table>
        </form>
    </div>
<div class="easyui-layout" data-options="region:'center',border:false" >
		
			<div data-options="region:'west',split:true"
				style="width: 500px; ">
				<table class="easyui-datagrid" id="sys_dict_parent" title="父数据字典类型列表" 
					data-options="singleSelect:true,fit:true,collapsible:true,striped:true,showRefresh:false,toolbar:'#sysDicToolbar',loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,fitColumns:true,url:'${ctx}/sys/sysDic/list?parentKey=1',method:'post',onLoadSuccess:function (data) {
                        $('.easyui-linkbutton-edit').linkbutton({text:'编辑',plain:true,iconCls:'fi-pencil icon-blue'});
                         $('.easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
					<thead>
						<tr>
							<th data-options="field:'id',checkbox:true,width:80,align:'center'">编号</th>
							<th data-options="field:'tabName',width:80,align:'center'">表名</th>
							<th data-options="field:'columnName',width:100,align:'center'" >列名</th>
							<th data-options="field:'_opt',width:100,align:'center',formatter:formatOperParent" >操作</th>  
						</tr>
					</thead>
				</table>
			</div>
			<div data-options="region:'center'">
				<table class="easyui-datagrid" id="sys_dict_child" title="数据字典列表"
					data-options="singleSelect:true,fit:true,toolbar:'#sysDicChildToolbar',collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,fitColumns:true,pageList:[5,10,15,20,50],url:'${ctx}/sys/sysDic/list',method:'post',queryParams:{type:''},onLoadSuccess:function (data) {
                        $('.easyui-linkbutton-edit').linkbutton({text:'编辑',plain:true,iconCls:'fi-pencil icon-blue'});
                         $('.easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
					<thead>
						<tr>
							<th data-options="field:'id',checkbox:true,width:80,align:'center'">编号</th>
							
							<th data-options="field:'key',width:80,align:'center'">标签名</th>
							<th data-options="field:'value',width:100,align:'center'" 
								>数据值</th>
							
							<th data-options="field:'dicSort',width:80,sortable:true,align:'center'"
								>排序</th>
							<th data-options="field:'remarks',width:160,align:'center'" >描述</th>
							<th data-options="field:'_opt',width:100,align:'center',formatter:formatOperChild" >操作</th>  
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>

<div id="sysDicToolbar" style="display: none;">
   
        <a onclick="editParentSysDic('');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-blue'">添加</a>
        <a onclick="deleteSysDic();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">批量删除</a>
    
</div>

<div id="sysDicChildToolbar" style="display: none;">
   
        <a onclick="editChildSysDic('');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-blue'">添加</a>
        <a onclick="deleteSysDic();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">批量删除</a>
    
</div>
<script type="text/javascript">

$(function() {
	
	$('#sys_dict_parent').datagrid({
		onCheck:function(rowIndex,rowData){
		
			$('#sys_dict_child').datagrid('reload', {
				parentKey :rowData.id
	        });
			
		}
	});


});

function editParentSysDic(id) {
 /*    if (id != undefined&&id!='') {
    	//$('#sys_dict_parent').datagrid('select', id);
    	 var node = $('#sys_dict_parent').datagrid('getSelected');
    	 if (node) {
    	       id=node.id;
    	    }
    } */
   
   
    
    
    parent.$.modalDialog({
        title : '编辑数据字典',
        width : 600,
        height : 300,
        href : '${ctx}/sys/sysDic/parentForm?id=' + id,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#sys_dict_parent').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#sysDicParentForm');
                f.submit();
            }
        },{
            text : '重置',
            iconCls:'icon-undo',
            handler : function() {
           	 var f = parent.$.modalDialog.handler.find('#sysDicParentForm');
           	 f.get(0).reset(); //清空表单数据 
            }
        }  ]
    });
}


function editChildSysDic(id) {
   /*  if (id != undefined&&id!='') {
    	$('#sys_dict_child').datagrid('select', id);
    	 var node = $('#sys_dict_child').datagrid('getSelected');
    	 if (node) {
    	       id=node.id;
    	    }
    } */
   
   
    var column=$('#sys_dict_parent').datagrid('getSelected');
    if(column==null){
		$.messager.show({
			title : '提示信息!',
			msg : '请选择父数据字典！'
		});
		return;
	}
    
    parent.$.modalDialog({
        title : '编辑数据字典',
        width : 600,
        height : 300,
        href : '${ctx}/sys/sysDic/form?id=' + id+"&parentKey="+column.id+"&tabName="+column.tabName+"&columnName="+column.columnName,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#sys_dict_child').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#sysDicForm');
                f.submit();
            }
        },{
            text : '重置',
            iconCls:'icon-undo',
            handler : function() {
           	 var f = parent.$.modalDialog.handler.find('#sysDicForm');
           	 f.get(0).reset(); //清空表单数据 
            }
        }  ]
    });
}

function deleteSysDic(id,action) {
 /*    if (id != undefined&&id!='') {
    	$('#t_list_content').treegrid('select', id);
    } */
    
	  parent.$.messager.confirm('询问', '您是否要删除当前数据字典？删除当前数据字典会连同子数据字典一起删除!', function(b) {
          if (b) {
              progressLoad();
              $.post('${ctx}/sys/sysDic/delete', {
                  id : id
              }, function(result) {
                  if (result.success) {
                      parent.$.messager.alert('提示', result.msg, 'info');
                      if(action==0){
                      	$('#sys_dict_parent').datagrid('reload');
                      }else{
                      	$('#sys_dict_child').datagrid('reload');
                      }
                      
                  }else{
                      parent.$.messager.alert('提示', result.msg, 'info');
                  }
                  progressClose();
              }, 'JSON');
          }
      });
}
function formatOperParent(val,row,index){  
	  var str = '';
        str += $.formatString('<a href="javascript:void(0)" class="easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'"  onclick="editParentSysDic(\'{0}\');" >编辑</a>', row.id);
        str += '&nbsp;';
        str += $.formatString('<a href="javascript:void(0)" class="easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteSysDic(\'{0}\',0);" >删除</a>', row.id);
        return str;
} 

function formatOperChild(val,row,index){  
	  var str = '';
      str += $.formatString('<a href="javascript:void(0)" class="easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'"  onclick="editChildSysDic(\'{0}\');" >编辑</a>', row.id);
      str += '&nbsp;';
      str += $.formatString('<a href="javascript:void(0)" class="easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteSysDic(\'{0}\',1);" >删除</a>', row.id);
      return str;
} 
</script>

</html>
