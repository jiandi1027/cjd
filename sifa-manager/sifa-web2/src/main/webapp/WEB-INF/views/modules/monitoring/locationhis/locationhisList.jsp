<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="locationhisSearchForm" style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        	<div region="center" border="false">
        	
		        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
				<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="locationhis_list"/>
		        </c:if>
         		<div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
				<table>
					<tr>
						<td class="search-title">矫正对象：</td>
						<td><input name="culpritName" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">定位地点：</td>
						<td><input name="location" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">定位号码：</td>
						<td><input name="mobileNumber" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title">定位方式：</td>
						<td>
							<select id="type" name="type" class="easyui-combobox" panelHeight="auto" editable=false>
								<option value="">全部</option>
								<option value="手机">手机</option>
								<option value="定位手环">定位手环</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="search-title">定位起始：</td>
						<td>
                   			<input name="searchStartDate" id="searchStartDate" class="Wdate" 
                   			onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" />
            			</td>
					</tr>
					<tr>
						<td class="search-title">定位截止：</td>
						<td><input name="searchEndDate" id="searchEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate\')}'})" />
						</td>
					</tr>
				</table>
				</div>
			</div>
		 	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchGroupBtn" iconCls="icon-search" 
					onclick="javascript:$('#locationhis_list').datagrid('load' ,$.serializeObject($('#locationhisSearchForm')));">查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" 
					onclick="$('#type').combobox('reset');javascript:$('#locationhisSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="locationhis_list" title="实时轨迹列表" 
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,nowrap:false,
			pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/monitoring/locationhis/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-list').linkbutton({text:'历史记录',plain:true,iconCls:'fi-list-number icon-blue'});
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                    }">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true" >编号</th>
				<th data-options="field:'culpritName',width:'7%',align:'center'" >矫正对象</th>
				<th data-options="field:'mobileNumber',width:'13%',align:'center'" >定位号码</th>
				<th data-options="field:'groupName',width:'10%',align:'center'" >司法所</th>
				<th data-options="field:'type',width:'10%',align:'center'" >定位方式</th>
				<th data-options="field:'gpstime',width:'15%',align:'center',sortable:true,formatter:Common.formatDate" >最新定位时间</th>
				<th data-options="field:'location',width:'28%',align:'center'" >定位地点</th>
			 	<th data-options="field:'_opt',width:'15%',align:'center',formatter:formatOper">操作</th>
			</tr>
		</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
$(function() {

});

console.log(1);
console.log($("#location"));
console.log($("#locationhis_list"));
function formatOper(val,row,index){
	var space = "&nbsp;";
	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-list" '
		+'onclick="locationhisList(\''+row.mobileNumber+'\')"></a>';
	operation=operation + space + '<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" '
		+'onclick="locationhisDetail(\''+row.id+'\')"></a>';
    return operation;
}

function locationhisList(mobileNumber) {
	var ver = Math.random();
	var url = '${ctx}/monitoring/terminalHistory/hislist?mobileNumber='+ mobileNumber + '&v=' + ver;
	var iconCls = "fi-list-number icon-blue";
	addCustomerTab('历史定位记录', url, iconCls);
}

function locationhisDetail(id) {
	var url="${ctx}/monitoring/locationhis/detail?id=" + id;
	
	parent.$.modalDialog({
        title : '定位记录详情',
        iconCls:'fi-info icon-blue',
        //width : sy.getBrowerWidth()-250,
        //height : sy.getBrowerHeight()-150,
        width : 800,
        height : 450,
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