<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="driftSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        	<div region="center" border="false">
	        	<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
					<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="drift_list"/>
		        </c:if>
         		<div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
				<table>
					<tr>
						<td class="search-title">矫正对象：</td>
						<td><input name="culpritName" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">反&nbsp;&nbsp;馈&nbsp;&nbsp;人：</td>
						<td><input name="createrName" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">实际位置：</td>
						<td><input name="newLocation" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">定位起始：</td>
						<td>
                   			<input name="searchStartDate" id="searchStartDate" class="Wdate" 
                   			onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm:ss',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" />
            			</td>
					</tr>
					<tr>
						<td class="search-title">定位截止：</td>
						<td><input name="searchEndDate" id="searchEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'searchStartDate\')}'})" />
						</td>
					</tr>
				</table>
				</div>
			</div>
		 	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchGroupBtn" iconCls="icon-search" onclick="javascript:$('#drift_list').datagrid('load' ,$.serializeObject($('#driftSearchForm')));">查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#driftSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>
	<div style="width:100%;" region="center" border="false">
		<table style="width:100%;" class="easyui-datagrid" id="drift_list" title="定位漂移反馈信息列表"
			data-options="singleSelect:true,fit:true,border:true,collapsible:true,striped:true,nowrap:false,
			loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],
			fitColumns:true,url:'${ctx}/monitoring/drift/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true" ></th>
					<th data-options="field:'culpritName',align:'center',width:'10%'" editor="text" >矫正对象</th>
					<th data-options="field:'groupName',align:'center',width:'10%'" editor="text">司法所</th>
					<th data-options="field:'gpstime',align:'center',width:'10%',sortable:true,formatter:function(value,row,index){
						return formatDate(value, 'yyyy-MM-dd hh:mm:ss');
					}" >定位时间</th>
					<th data-options="field:'newLocation',align:'center',width: '23%'" >实际位置</th>
					<th data-options="field:'note',align:'center',width: '15%'" editor="text" >说明</th>
					<th data-options="field:'createrName',align:'center',width:'10%'">反馈人</th>
					<th data-options="field:'_opt',align:'center',formatter:overformatOper,width:'20%'" >操作</th> 
				</tr>
			</thead>
		</table>
	</div>
</div>

<script type="text/javascript">
function overformatOper(val,row,index){
	var operation='';
	operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="driftDetail(\''+row.id+'\')"></a>';
    return operation;
}

function driftDetail(id){
	var url="${ctx}/monitoring/drift/detail?id=" + id;
	
	parent.$.modalDialog({
        title : '定位漂移详情',
        iconCls:'fi-info icon-blue',
        //width : sy.getBrowerWidth()-250,
        //height : sy.getBrowerHeight()-150,
        width : 800,
        height : 620,
        resizable : true,
        maximizable:true, 
        href : url,
        buttons : [{
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
            	parent.$.modalDialog.handler.dialog('close');
            }
        } ]
    });
}

</script>