<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="locationhisHisSearchForm" style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        	<div region="center" border="false">
         		<div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="" style="width:100%;">
				<table>
					<tr>
						<td class="search-title">定位地点：</td>
						<td><input name="location" class="easyui-textbox" /></td>
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
                   			onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd hh:mm:ss',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" />
            			</td>
					</tr>
					<tr>
						<td class="search-title">定位截止：</td>
						<td><input name="searchEndDate" id="searchEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd hh:mm:ss',minDate:'#F{$dp.$D(\'searchStartDate\')}'})" />
						</td>
					</tr>
				</table>
				</div>
			</div>
		 	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchGroupBtn" iconCls="icon-search" 
					onclick="javascript:$('#locationhisHis_list').datagrid('load' ,$.serializeObject($('#locationhisHisSearchForm')));">查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" 
					onclick="$('#type').combobox('reset');javascript:$('#locationhisHisSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="locationhisHis_list" title="历史定位列表" 
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,nowrap:false,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],
				fitColumns:true,url:'${ctx}/monitoring/terminalHistory/hislist?mobileNumber=${mobileNumber }',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true" >编号</th>
					<th data-options="field:'culpritName',width:'7%',align:'center'" >矫正对象</th>
					<th data-options="field:'mobileNumber',width:'13%',align:'center'" >定位号码</th>
					<th data-options="field:'groupName',width:'10%',align:'center'" >司法所</th>
					<th data-options="field:'type',width:'10%',align:'center'" >定位方式</th>
					<th data-options="field:'gpstime',width:'15%',align:'center',sortable:true,formatter:Common.formatDate" >定位时间</th>
					<th data-options="field:'location',width:'33%',align:'center'" >定位地点</th>
					<th data-options="field:'_opt2',width:'10%',align:'center',formatter:formatOper2">操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
$(function() {

});

function formatOper2(val,row,index){
	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" '
		+'onclick="locationhisHisDetail(\''+row.id+'\')"></a>';
    return operation;
}

function locationhisHisDetail(id) {
	var url="${ctx}/monitoring/terminalHistory/detail?id=" + id;
	
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