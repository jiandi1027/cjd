<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="overAlarmSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        	<div region="center" border="false">
	        	<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
					<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="overAlarm_list"/>
		        </c:if>
         		<div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
				<table>
					<tr>
						<td class="search-title">矫正对象：</td>
						<td><input name="culpritName" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">请假状态：</td>
						<td><input id="askLeaveId" name="askLeaveId" class="easyui-combobox" data-options="valueField:'key',textField:'value',
							url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=yes_no&parentKey=169ef30f5332428da7ac7bb1d576ac3d&showAll=1',panelMaxHeight:'200',panelHeight:'auto'">
						</td>
					</tr>
					<tr>
						<td class="search-title">越界位置：</td>
						<td><input name="location" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">越界起始：</td>
						<td>
                   			<input name="searchStartDate" id="searchStartDate" class="Wdate" 
                   			onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm:ss',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" />
            			</td>
					</tr>
					<tr>
						<td class="search-title">越界截止：</td>
						<td><input name="searchEndDate" id="searchEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'searchStartDate\')}'})" />
						</td>
					</tr>
				</table>
				</div>
			</div>
		 	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchGroupBtn" iconCls="icon-search" onclick="javascript:$('#overAlarm_list').datagrid('load' ,$.serializeObject($('#overAlarmSearchForm')));">查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#askLeaveId').combobox('reset');$('#overAlarmSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>
	<div style="width:100%;" region="center" border="false">
		<table style="width:100%;" class="easyui-datagrid" id="overAlarm_list" title="越界报警列表"
			data-options="singleSelect:true,fit:true,border:true,collapsible:true,striped:true,nowrap:false,
			loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],
			fitColumns:true,url:'${ctx}/monitoring/overAlarm/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-overAlarm-list').linkbutton({text:'越界记录',plain:true,iconCls:'fi-list-number icon-blue'});
                        $('.organization-easyui-linkbutton-overAlarm-pencil').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true" ></th>
					<th data-options="field:'culpritName',align:'center',width:'10%'" editor="text" >姓名</th>
					<th data-options="field:'groupName',align:'center',width:'10%'" editor="text">司法所</th>
					<th data-options="field:'askLeaveflag',align:'center',width: '8%'" editor="text">是否请假</th>
					<th data-options="field:'delmark',align:'center',width: '7%'" editor="text" >扣分</th>
					<th data-options="field:'created',align:'center',width:'15%',sortable:true">最新越界时间</th>
					<th data-options="field:'location',align:'center',width: '20%'" >最新越界位置</th>
					<th data-options="field:'status',align:'center',width: '8%',formatter:function(value,row,index){
						if(row.delmark == null){
							return '未处理';
						}
						else return '已处理';
					}" >状态</th>
					<th data-options="field:'_opt',align:'center',formatter:overformatOper,width:'20%'" >操作</th> 
				</tr>
			</thead>
		</table>
	</div>
</div>

<script type="text/javascript">
function overformatOper(val,row,index){
	var space = '&nbsp;';
	var operation='';
	operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-overAlarm-list" onclick="overList(\''+row.culpritId+'\')"></a>';
	
	<shiro:hasPermission name="monitoring/overAlarm/dispose">
	if (row.delmark == null) {
		operation = operation + space + '<a href="javascript:void(0);" class="organization-easyui-linkbutton-overAlarm-pencil" onclick="pencilover(\''+row.id+'\')"></a>';
	}
	</shiro:hasPermission>
	
    return operation;
}

function overList(id){
	parent.$.modalDialog({
	    title : '历史越界记录',
	    iconCls:'fi-list-number icon-blue',
        width : sy.getBrowerWidth()-250,
        height : 690,
        //height : sy.getBrowerHeight()-150,
	    href : '${ctx}/monitoring/overAlarm/hislist?culpritId='+id,
	    resizable:true,
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

function pencilover(id){
	parent.$.modalDialog({
	    title : '越界报警处理',
	    iconCls:'fi-arrow-up icon-blue',
	    width : 500,
	    height : 320,
	    href : '${ctx}/monitoring/overAlarm/dispose?id='+id,
	    resizable:true,
	    maximizable:true, 
	    buttons : [ {
	        text : '上报',
	        iconCls:'fi-arrow-up icon-blue',
	        handler : function() {
	        	parent.$.modalDialog.openner_dataGrid = $('#overAlarm_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	        	var f = parent.$.modalDialog.handler.find('#overAlarmformAdd');
	            f.submit();
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
        return dt.format("yyyy-MM-dd hh:mm:ss"); //扩展的Date的format方法(上述插件实现)
    }
}
</script>