<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
<form id="workfreeSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
   <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
   
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
        	 <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="workfree_list"/>
        </c:if>
         <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
       		
			<table>
				<tr>
				<td class="search-title">劳动内容：</td>
					<td><input name="workContent" class="easyui-textbox"  /></td>
				</tr>
				<tr>
				<td class="search-title">劳动地点：</td>
					<td><input name="workPlace" class="easyui-textbox"  /></td>
				</tr>
				<tr>
				<td class="search-title">劳动开始：</td>
					<td><input name="searchStartDate" id="searchStartDate" class="Wdate" 
                   			onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" /></td>
				</tr>
				<tr>
				<td class="search-title">劳动截止：</td>
					<td><input name="searchEndDate" id="searchEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate\')}'})" /></td>
				</tr>
				
			</table>
			
		
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" ><a
						href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#workfree_list').datagrid('load' ,$.serializeObject($('#workfreeSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#workfreeSearchForm').form('clear');">清空</a></div>
		</div>
		
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="workfree_list" title="社区服务列表" 
			data-options="singleSelect:true,fit:true,toolbar:'#workfreeToolbar',collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/workfree/list',method:'post',onLoadSuccess:function (data) {
                          $('.workfree-easyui-linkbutton-edit').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                          $('.workfree-easyui-linkbutton-detail').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                    }" >
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'groupName',width:80,align:'center'"  >组织单位</th>
				<th data-options="field:'workContent',width:80,align:'center'"  >劳动内容</th>
				<th data-options="field:'workDate',width:80,align:'center',sortable:true,formatter:Common.formatDate"  >劳动日期</th>
				<th data-options="field:'workPlace',width:80,align:'center'"  >劳动地点</th>
				<th data-options="field:'_opt',width:120,align:'center',formatter:formatOper" >操作</th>  
			</tr>
		</thead>
	</table>
	</div>
</div>
<div id="workfreeToolbar" style="display: none;">
   		<a onclick="addWorkfree('');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增集中社区服务</a>
        <a onclick="addWorkfreePersonal('');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增个人社区服务</a>
        
    
</div>
<script type="text/javascript">
var sysGroupTree;

$(function() {
	sysGroupTree = $('#sysGroupTree').tree({
         url : '${ctx}/sys/sysGroup/loadGroupTree',
         parentField : 'parentId',
         lines : true,
         onClick : function(node) {
        	 $('#workfree_list').datagrid('load', {
        		 groupId: node.id
             });
         }
     });


});




function addWorkfree(id) {

	    
	    parent.$.modalDialog({
	        title : '新增社区服务',
	        iconCls:'fi-plus icon-green',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : '${ctx}/dailymgr/workfree/form?id='+id,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#workfree_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#workfreeForm');
	                f.submit();
	            }
	        },{
	            text : '重置',
	            iconCls:'icon-undo',
	            handler : function() {
	           	 var f = parent.$.modalDialog.handler.find('#workfreeForm');
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

function addWorkfreePersonal(id) {

    
    parent.$.modalDialog({
        title : '新增社区服务',
        iconCls:'fi-plus icon-green',
        width : 1000,
        height : 600,
        href : '${ctx}/dailymgr/workfree/formPersonal?id='+id,
        resizable : true,
        maximizable:true,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#workfree_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#workfreeFormPersonal');
                f.submit();
            }
        },{
            text : '重置',
            iconCls:'icon-undo',
            handler : function() {
           	 var f = parent.$.modalDialog.handler.find('#workfreeFormPersonal');
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

	
function workfreeDetail(id,workfreeType) { 
	var url="";
	var h=500;
	if(workfreeType=='1'){
		url='${ctx}/dailymgr/workfree/get?id='+id;
		h=450;
	}
	if(workfreeType=='2'){
		url='${ctx}/dailymgr/workfree/getPersonal?id='+id;
	}
    parent.$.modalDialog({
        title : '社区服务详情',
        iconCls:'fi-info icon-blue',
        width : 1000,
        height : h,
        href : url,
        resizable : true,
        maximizable:true,
        buttons : [ {
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
           		parent.$.modalDialog.handler.dialog('close');
            }
        }]
    });
}





	
	
function formatOper(val,row,index){  
	var str = '';
	if(row.workfreeType=='1'){
		str += $.formatString('<a href="javascript:void(0)" class="workfree-easyui-linkbutton-edit" data-options="plain:true"  onclick="addWorkfree(\'{0}\');" >修改</a>', row.id);
	}
	if(row.workfreeType=='2'){
		str += $.formatString('<a href="javascript:void(0)" class="workfree-easyui-linkbutton-edit" data-options="plain:true"  onclick="addWorkfreePersonal(\'{0}\');" >修改</a>', row.id);
	}
    str += '&nbsp;';
    str += $.formatString('<a href="javascript:void(0)" class="workfree-easyui-linkbutton-detail" data-options="plain:true" onclick="workfreeDetail(\'{0}\',\'{1}\');" >详情</a>', row.id,row.workfreeType);
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
