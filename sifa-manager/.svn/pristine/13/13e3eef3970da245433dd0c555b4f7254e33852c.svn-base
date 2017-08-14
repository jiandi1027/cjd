<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
<form id="dailyReportSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
   <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
   
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
        	 <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="culprit_list"/>
        </c:if>
         <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
       		
			<table>
				<tr>
				<td class="search-title">矫正对象：</td>
					<td><input name="culpritName" class="easyui-textbox"   /></td>
				</tr>
				<tr>
				<td class="search-title">监管等级：</td>
					<td>
					<input id="dicMonitorGradeKey" name="dicMonitorGradeKey" class="easyui-combobox" data-options="valueField:'key',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_culprit&columnName=dic_gldxjb_key&parentKey=27000&showAll=1',panelHeight:'auto'"
		    				 style="width:142px;"  >
					</td>
				</tr>
				<tr>
				<td class="search-title">报到结果：</td>
				<td>
					<input id="dicReportStatusKey" name="dicReportStatusKey" class="easyui-combobox" data-options="valueField:'key',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_DAILY_REPORT_LAST&columnName=DIC_ONSCHEDULE_KEY&parentKey=169000&showAll=1',panelHeight:'auto'"
		    				 style="width:142px;"  >
					</td>
				</tr>
				<tr>
				<td class="search-title">下次报到&nbsp;&nbsp;&nbsp;&nbsp;<br>开始时间：</td>
					<td><input name="nextShouldReportDateStartDate" id="nextShouldReportDateStartDate" class="Wdate" 
                   			onfocus="var nextShouldReportDateEndDate=$dp.$('nextShouldReportDateEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){nextShouldReportDateEndDate.focus();},maxDate:'#F{$dp.$D(\'nextShouldReportDateEndDate\')}'})" /></td>
				</tr>
				<tr>
				<td class="search-title">下次报到&nbsp;&nbsp;&nbsp;&nbsp;<br>截止时间：</td>
					<td><input name="nextShouldReportDateEndDate" id="nextShouldReportDateEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'nextShouldReportDateStartDate\')}'})" /></td>
				</tr>
			</table>
			
		
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" ><a
						href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#culprit_list').datagrid('load' ,$.serializeObject($('#dailyReportSearchForm')));"
						id="searchGroupBtn">查询</a> &nbsp;&nbsp; <a href="#"
						class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="$('#dicMonitorGradeKey').combobox('reset');$('#dicReportStatusKey').combobox('reset');javascript:$('#dailyReportSearchForm').form('clear');">清空</a></div>
		</div>
		
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="culprit_list" title="日常报到列表"
			data-options="singleSelect:true,fit:true,toolbar:'#dailyReportToolbar',collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/dailyReport/list',method:'post',onLoadSuccess:function (data) {
                        $('.easyui-linkbutton-detail').linkbutton({text:'报到记录',plain:true,iconCls:'fi-list icon-blue'});
                    }">
		<thead>
			<tr>

				<th data-options="field:'id',checkbox:true,width:80">编号</th>
				<th data-options="field:'culpritName',width:80,align:'center'"  >矫正对象</th>
				<th data-options="field:'dicMonitorGradeKey',width:80,formatter:function(value,rowData,rowIndex){
						return sy.getDicValue('sf_culprit','dic_gldxjb_key',value,'')},align:'center'"  >监管等级</th>
				<th data-options="field:'nextShouldReportDate',width:80,align:'center',sortable:true,formatter:Common.formatDate"  >下一次报到日期</th>
				<th data-options="field:'dicReportStatusKey',width:80,formatter:function(value,rowData,rowIndex){
						return sy.getDicValue('SF_DAILY_REPORT_LAST','DIC_ONSCHEDULE_KEY',value,'')},align:'center'" >最近报到结果</th>
				<th data-options="field:'_opt',width:120,align:'center',formatter:formatOper" >操作</th>  
			</tr>
		</thead>
	</table>
	</div>
</div>
<div id="dailyReportToolbar" style="display: none;">

</div>
<script type="text/javascript">

function addDailyReport(id) {
	$.ajax({
			type : 'get',
			url : '${ctx}/dailymgr/dailyReport/refresh',
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			success : function(result) {
				if(result.status==200){
					$.messager.show({
  					title : '提示信息!',
  					msg : '刷新成功!'
  				});
				}
				$('#culprit_list').datagrid('reload',{});
			}
		});
    
    /*parent.$.modalDialog({
        title : '新增日常报到',
        width : 1000,
        height : 600,
        href : '${ctx}/dailymgr/dailyReport/add?id='+id,
        buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#culprit_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
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
    });*/
}



//function dailyReports(culpritId,culpritName) { 
//	var url='${ctx}/dailymgr/dailyReport/dailyReportList?id=' + culpritId;
	
//	addCustomerTab(culpritName+'报到记录',url,'fi-plus icon-green');
//}

function dailyReports(culpritId,culpritName) { 
	 parent.$.modalDialog({
	        title : '报到记录',
	        iconCls:'fi-info icon-blue',
	        width : 1000,
	        height : 600,
	        href : '${ctx}/dailymgr/dailyReport/dailyReportList?culpritId=' + culpritId,
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
	str += $.formatString('<a href="javascript:void(0)" class="easyui-linkbutton-detail" data-options="plain:true" onclick="dailyReports(\'{0}\',\'{1}\');" >报到记录</a>', row.culpritId,row.culpritName);
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
