<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div region="center" border="false">
		<table class="easyui-datagrid" id="daily_report_list" title="日常报到列表" 
			data-options="fit:true,singleSelect:true,collapsible:true,striped:true,toolbar:'#sysAccountToolbar',loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/dailyReport/dailyReportList',method:'post',onLoadSuccess:function (data) {
                          $('.easyui-linkbutton-detail').linkbutton({text:'报到记录',plain:true,iconCls:'fi-list icon-blue'});
                    }" >
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'reportDate',align:'center'"  >报到日期</th>
				<th data-options="field:'dicTypeKey',width:10,formatter:function(value,rowData,rowIndex){
						return sy.getDicValue('SF_DAILY_REPORT','DIC_TYPE_KEY',value,'')},align:'center'">报到方式</th>
				<th data-options="field:'reportDate',width:10,align:'center'"  >报到日期</th>
				<th data-options="field:'shouldReportDate',width:10,align:'center'"  >应报到日期</th>
				<th data-options="field:'dicReportStatusKey',width:10,formatter:function(value,rowData,rowIndex){if(value=='0'){return '按时';}　else {return '未按时'}},align:'center'">是否按时</th>
			</tr>
		</thead>
	</table>
	</div>
</div>
<div id="sysAccountToolbar" style="display: none;">
   
</div>
<script type="text/javascript">

function addDailyReport(id) {

	    
	    parent.$.modalDialog({
	        title : '新增日常报到',
	        width : 1000,
	        height : 600,
	        href : '${ctx}/dailymgr/dailyReport/add?id='+id,
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#daily_report_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#dailyReportForm');
	                f.submit();
	            }
	        },{
	            text : '重置',
	            iconCls:'icon-undo',
	            handler : function() {
	           	 var f = parent.$.modalDialog.handler.find('#dailyReportForm');
	           	 f.get(0).reset(); //清空表单数据 
	            }
	        }  ]
	    });
	}


	
function dailyReports(id) { 
	 parent.$.modalDialog({
	        title : '报到记录',
	        iconCls:'fi-info icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : '${ctx}/dailymgr/dailyReport/get?id='+id,
	        resizable : true,
	        maximizable:true,
	    });
}




	
	
function formatOper(val,row,index){  
	var str = '';
    str += $.formatString('<a href="javascript:void(0)" class="easyui-linkbutton-detail" data-options="plain:true" onclick="dailyReports(\'{0}\');" >报到记录</a>', row.id);
	return str;
} 
</script>

</html>
