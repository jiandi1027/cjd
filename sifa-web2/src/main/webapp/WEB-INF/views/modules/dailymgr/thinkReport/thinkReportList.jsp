<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
<form id="thinkReportSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
   <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
   
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
        	 <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="think_report_list"/>
        </c:if>
         <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
       		
			<table>
				<tr>
				<td class="search-title">矫正对象：</td>
					<td><input name="culpritName" class="easyui-textbox"   /></td>
				</tr>
				<tr>
				<td class="search-title">汇报方式：</td>
					<td>
					<input id="dicReportTypeKey" name="dicReportTypeKey" class="easyui-combobox" data-options="valueField:'key',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_THINK_REPORT&columnName=DIC_REPORT_TYPE_KEY&parentKey=14000&showAll=1',panelHeight:'auto'"
		    				 style="width:142px;"  >
					</td>
				</tr>
				<tr>
				<td class="search-title">汇报状态：</td>
					<td>
					<input id="dicReportStatusKey" name="dicReportStatusKey" class="easyui-combobox" data-options="valueField:'key',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_THINK_REPORT&columnName=DIC_REPORT_STATUS_KEY&parentKey=36000&showAll=1',panelHeight:'auto'"
		    				 style="width:142px;"  >
					</td>
				</tr>
				<tr>
				<td class="search-title">汇报起始：</td>
					<td><input name="searchStartDate" id="searchStartDate" class="Wdate" 
                   			onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" /></td>
				</tr>
				<tr>
				<td class="search-title">汇报截止：</td>
					<td><input name="searchEndDate" id="searchEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate\')}'})" /></td>
				</tr>
				
			</table>
			
		
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" ><a
						href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#think_report_list').datagrid('load' ,$.serializeObject($('#thinkReportSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="$('#dicReportTypeKey').combobox('reset');$('#dicReportStatusKey').combobox('reset');javascript:$('#thinkReportSearchForm').form('clear');">清空</a></div>
		</div>
		
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="think_report_list" title="思想汇报列表"
		style="height: 400px;"
			data-options="singleSelect:true,fit:true,toolbar:'#thinkReportToolbar',collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/thinkReport/list',method:'post',onLoadSuccess:function (data) {
                          $('.thinkReport-easyui-linkbutton-edit').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                          $('.thinkReport-easyui-linkbutton-detail').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                    }" >
                    
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true">编号</th>
				<th data-options="field:'culpritName',width:'15%',align:'center'">矫正对象</th>
				<th data-options="field:'groupName',width:'15%',align:'center'"  >司法所</th>
				<th data-options="field:'dicReportTypeKey',width:'14%',formatter:function(value,rowData,rowIndex){
						return sy.getDicValue('SF_THINK_REPORT','DIC_REPORT_TYPE_KEY',value,'')},align:'center'">汇报方式</th>
				<th data-options="field:'dicReportStatusKey',width:'14%',formatter:function(value,rowData,rowIndex){
						return sy.getDicValue('SF_THINK_REPORT','DIC_REPORT_STATUS_KEY',value,'')},align:'center'">汇报状态</th>
				<th data-options="field:'reportDate',width:'20%',align:'center',sortable:true,formatter:Common.formatDate">汇报日期</th>
				<th data-options="field:'_opt',width:'20%',align:'center',formatter:formatOper" >操作</th>  
			</tr>
		</thead>
	</table>
	</div>
</div>
<div id="thinkReportToolbar" style="display: none;">
   	<a onclick="addThinkReport('');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
        
    
</div>
<script type="text/javascript">
var sysGroupTree;

$(function() {
	sysGroupTree = $('#sysGroupTree').tree({
         url : '${ctx}/sys/sysGroup/loadGroupTree',
         parentField : 'parentId',
         lines : true,
         onClick : function(node) {
        	 $('#think_report_list').datagrid('load', {
        		 groupId: node.id
             });
         }
     });


});




function addThinkReport(id) {

	    
	    parent.$.modalDialog({
	        title : '新增思想汇报',
	        iconCls:'fi-plus icon-green',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : '${ctx}/dailymgr/thinkReport/form?id='+id,
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#think_report_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#thinkReportForm');
	                f.submit();
	            }
	        },{
	            text : '重置',
	            iconCls:'icon-undo',
	            handler : function() {
	           	 var f = parent.$.modalDialog.handler.find('#thinkReportForm');
	           	 f.get(0).reset(); //清空表单数据 
	            }
	        },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 parent.$.modalDialog.handler.dialog('close');
	             }
	        }]
	    });
	}


	
function thinkReportDetail(id) { 
    parent.$.modalDialog({
        title : '思想汇报详情',
        iconCls:'fi-info icon-blue',
        width : 1000,
        height : 500,
        href : '${ctx}/dailymgr/thinkReport/get?id='+id,
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




	
	
function formatOper(val,row,index){  
	var str = '';
    str += $.formatString('<a href="javascript:void(0)" class="thinkReport-easyui-linkbutton-edit" data-options="plain:true"  onclick="addThinkReport(\'{0}\');" >修改</a>', row.id);
    str += '&nbsp;';
    str += $.formatString('<a href="javascript:void(0)" class="thinkReport-easyui-linkbutton-detail" data-options="plain:true" onclick="thinkReportDetail(\'{0}\');" >详情</a>', row.id);
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
