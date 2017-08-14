<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="removeAlarmSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        	<div region="center" border="false">
	        	<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
					<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="removeAlarm_list"/>
		        </c:if>
         		<div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
				<table>
					<tr>
						<td class="search-title">矫正对象：</td>
						<td><input name="culpritName" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">拆卸位置：</td>
						<td><input name="location" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">拆卸起始：</td>
						<td>
                   			<input name="searchStartDate" id="searchStartDate" class="Wdate" 
                   			onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm:ss',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" />
            			</td>
					</tr>
					<tr>
						<td class="search-title">拆卸截止：</td>
						<td><input name="searchEndDate" id="searchEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'searchStartDate\')}'})" />
						</td>
					</tr>
				</table>
				</div>
			</div>
		 	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchGroupBtn" iconCls="icon-search" onclick="javascript:$('#removeAlarm_list').datagrid('load' ,$.serializeObject($('#removeAlarmSearchForm')));">查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#removeAlarmSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>
	<div style="width:100%;" region="center" border="false">
		<table style="width:100%;" class="easyui-datagrid" id="removeAlarm_list" title="拆卸报警列表"
			data-options="singleSelect:true,fit:true,border:true,collapsible:true,striped:true,nowrap:false,
			loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],
			fitColumns:true,url:'${ctx}/monitoring/removeAlarm/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-removeAlarm-list').linkbutton({text:'拆卸记录',plain:true,iconCls:'fi-list-number icon-blue'});
                        $('.organization-easyui-linkbutton-removeAlarm-pencil').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true" ></th>
					<th data-options="field:'culpritName',align:'center',width:'10%'" editor="text">姓名</th>
					<th data-options="field:'groupName',align:'center',width:'10%'" editor="text">司法所</th>
					<th data-options="field:'created',align:'center',width:'15%',sortable:true,formatter:function(value,row,index){
						return formatDate(value,'yyyy-MM-dd hh:mm:ss');
					}">最新拆卸时间</th>
					<th data-options="field:'location',align:'center',width: '35%'" >最新拆卸位置</th>
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
	operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-removeAlarm-list" onclick="remove_overList(\''+row.culpritName+'\',\''+row.culpritId+'\')"></a>';
	
	<shiro:hasPermission name="monitoring/removeAlarm/dispose">
	if (row.delmark == null) {
		operation = operation + space + '<a href="javascript:void(0);" class="organization-easyui-linkbutton-removeAlarm-pencil" onclick="remove_pencilover(\''+row.id+'\')"></a>';
	}
	</shiro:hasPermission>
	
    return operation;
}

function remove_overList(name, id){
	parent.$.modalDialog({
	    title : name + '历史拆卸记录',
	    iconCls:'fi-list-number icon-blue',
        width : sy.getBrowerWidth()-250,
        height : 690,
        //height : sy.getBrowerHeight()-150,
	    href : '${ctx}/monitoring/removeAlarm/hislist?culpritId='+id,
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

function remove_pencilover(id){
	parent.$.modalDialog({
	    title : '拆卸报警处理',
	    iconCls:'fi-arrow-up icon-blue',
	    width : 500,
	    height : 320,
	    href : '${ctx}/monitoring/removeAlarm/dispose?id='+id,
	    resizable:true,
	    maximizable:true, 
	    buttons : [ {
	        text : '上报',
	        iconCls:'fi-arrow-up icon-blue',
	        handler : function() {
	        	parent.$.modalDialog.openner_dataGrid = $('#removeAlarm_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	        	var f = parent.$.modalDialog.handler.find('#removeAlarmformAdd');
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
        return dt.format("yyyy-MM-dd HH:mm:ss"); //扩展的Date的format方法(上述插件实现)
    }
}
</script>