<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
<form id="studySearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
   <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
   
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
        	 <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="study_list"/>
        </c:if>
         <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
       		
			<table>
				<tr>
				<td class="search-title">学习内容：</td>
					<td><input name="studyContent" class="easyui-textbox"  /></td>
				</tr>
				<tr>
				<td class="search-title">学习方式：</td>
					<td>
					<input id="dicStudyTypeKey" name="dicStudyTypeKey" class="easyui-combobox" data-options="valueField:'key',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_STUDY&columnName=DIC_STUDY_TYPE_KEY&parentKey=15000&showAll=1',panelHeight:'auto'"
		    				 style="width:142px;"  >
					</td>
				</tr>
				<tr>
				<td class="search-title">学习开始：</td>
					<td><input name="searchStartDate" id="searchStartDate" class="Wdate" 
                   			onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" /></td>
				</tr>
				<tr>
				<td class="search-title">学习截止：</td>
					<td><input name="searchEndDate" id="searchEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate\')}'})" /></td>
				</tr>
			</table>
			
		
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" ><a
						href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#study_list').datagrid('load' ,$.serializeObject($('#studySearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="$('#dicStudyTypeKey').combobox('reset');javascript:$('#studySearchForm').form('clear');">清空</a></div>
		</div>
		
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="study_list" title="学习教育列表" 
			data-options="singleSelect:true,fit:true,toolbar:'#studyToolbar',collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/study/list',method:'post',onLoadSuccess:function (data) {
                          $('.study-easyui-linkbutton-edit').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                          $('.study-easyui-linkbutton-detail').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                    }" >
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'groupName',width:80,align:'center'"  >司法所</th>
				<th data-options="field:'studyContent',width:80,align:'center'"  >学习内容</th>
				<th data-options="field:'studyDate',width:80,align:'center',sortable:true,formatter:Common.formatDate" >学习日期</th>
				<!--  <th data-options="field:'studyDate',width:80,align:'center',sortable:true,formatter:Common.formatDate" >学习日期</th>-->
				<th data-options="field:'dicStudyTypeKey',width:230,formatter:function(value,rowData,rowIndex){
						return sy.getDicValue('SF_STUDY','DIC_STUDY_TYPE_KEY',value,'')},align:'center'">学习方式</th>
				<th data-options="field:'_opt',width:120,align:'center',formatter:formatOper" >操作</th>  
			</tr>
		</thead>
	</table>
	</div>
</div>
<div id="studyToolbar" style="display: none;">
   
        <a onclick="addStudy('');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增集中学习</a>
        <a onclick="addStudyPersonal('');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增个人学习</a>
        
    
</div>
<script type="text/javascript">
var sysGroupTree;

$(function() {
	sysGroupTree = $('#sysGroupTree').tree({
         url : '${ctx}/sys/sysGroup/loadGroupTree',
         parentField : 'parentId',
         lines : true,
         onClick : function(node) {
        	 $('#study_list').datagrid('load', {
        		 groupId: node.id
             });
         }
     });


});




function addStudy(id) {

	    
	    parent.$.modalDialog({
	        title : '新增学习教育',
	        iconCls:'fi-plus icon-green',
	        width : 1000,
	        height : 600,
	        href : '${ctx}/dailymgr/study/form?id='+id,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#study_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#studyForm');
	                f.submit();
	            }
	        },{
	            text : '重置',
	            iconCls:'icon-undo',
	            handler : function() {
	           	 var f = parent.$.modalDialog.handler.find('#studyForm');
	           	 f.get(0).reset(); //清空表单数据 
	            }
	        }, {
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	           		parent.$.modalDialog.handler.dialog('close');
	            }
	        }  ]
	    });
	}
	
function addStudyPersonal(id) {

    
    parent.$.modalDialog({
        title : '新增学习教育',
        iconCls:'fi-plus icon-green',
        width : 1000,
        height : 600,
        href : '${ctx}/dailymgr/study/formPersonal?id='+id,
        resizable : true,
        maximizable:true,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#study_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#studyFormPersonal');
                f.submit();
            }
        },{
            text : '重置',
            iconCls:'icon-undo',
            handler : function() {
           	 var f = parent.$.modalDialog.handler.find('#studyFormPersonal');
           	 f.get(0).reset(); //清空表单数据 
            }
        }, {
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
           		parent.$.modalDialog.handler.dialog('close');
            }
        }  ]
    });
}


	
function studyDetail(id,studyType) { 
	var url="";
	var h=500;
	if(studyType=='1'){
		url='${ctx}/dailymgr/study/get?id='+id;
		h=450;
	}
	if(studyType=='2'){
		url='${ctx}/dailymgr/study/getPersonal?id='+id;
	}
    parent.$.modalDialog({
        title : '学习教育详情',
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
	if(row.studyType=='1'){
		str += $.formatString('<a href="javascript:void(0)" class="study-easyui-linkbutton-edit" data-options="plain:true"  onclick="addStudy(\'{0}\');" >修改</a>', row.id);
	}
	if(row.studyType=='2'){
		str += $.formatString('<a href="javascript:void(0)" class="study-easyui-linkbutton-edit" data-options="plain:true"  onclick="addStudyPersonal(\'{0}\');" >修改</a>', row.id);
	}
    str += '&nbsp;';
    str += $.formatString('<a href="javascript:void(0)" class="study-easyui-linkbutton-detail" data-options="plain:true" onclick="studyDetail(\'{0}\',\'{1}\');" >详情</a>', row.id,row.studyType);
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
