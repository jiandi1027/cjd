<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="ifaceRecordSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        	<div region="center" border="false">
	        	<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
				<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="ifaceRecord_list"/>
		        </c:if>
         		<div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
				<table>
					<tr>
						<td class="search-title" >设&nbsp;&nbsp;备&nbsp;&nbsp;号：</td>
						<td><input name="macSn" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title" >设备名称：</td>
						<td><input name="macName" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title" >I&nbsp;&nbsp;P&nbsp;&nbsp;地址：</td>
						<td><input name="ipAddress" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title" >联机起始：</td>
						<td><input name="searchStartDate" class="Wdate" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm'})" /></td>
					</tr>
					<tr>
						<td class="search-title" >联机截止：</td>
						<td><input name="searchEndDate" class="Wdate" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm'})" /></td>
					</tr>
				</table>
				</div>
			</div>
		 	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchGroupBtn" iconCls="icon-search" onclick="javascript:$('#ifaceRecord_list').datagrid('load' ,$.serializeObject($('#ifaceRecordSearchForm')));">查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#ifaceRecordSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="ifaceRecord_list" title="考勤设备列表" 
			data-options="singleSelect:false,fit:true,collapsible:true,striped:true,toolbar:'#ifaceRecordToolbar',loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/sys/ifaceMachine/list',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80" >编号</th>
				<th data-options="field:'macSn',width:100,align:'center'" >设备序列号</th>
				<th data-options="field:'macName',width:100,align:'center'" >设备名称</th>
				<th data-options="field:'macNumber',width:100,align:'center'" >设备名称</th>
				<th data-options="field:'groupName',width:100,align:'center'" >司法所名称</th>
				<th data-options="field:'transTimes',width:100,align:'center',sortable:true,formatter:function(value,row,index){
						return formatDate(value,'yyyy-MM-dd hh:mm');
					}" >上传指定时刻</th>
				<th data-options="field:'transInterval',width:80,align:'center'" >刷新间隔时间(分钟)</th>
				<th data-options="field:'ipAddress',width:80,align:'center'" >ip地址</th>
				<th data-options="field:'newTime',width:100,align:'center',sortable:true,formatter:function(value,row,index){
						return formatDate(value,'yyyy-MM-dd hh:mm');
					}" >最新联机时间</th>
				<th data-options="field:'attCount',width:80,align:'center'" >考勤记录数</th>
				<th data-options="field:'userCount',width:80,align:'center'">人数</th>
			</tr>
		</thead>
		</table>
	</div>
</div>
<script type="text/javascript">

$(function() {

});


//timestamp转换date
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
        return dt.format("yyyy-MM-dd HH:mm"); //扩展的Date的format方法(上述插件实现)
    }
}

</script>
</html>
