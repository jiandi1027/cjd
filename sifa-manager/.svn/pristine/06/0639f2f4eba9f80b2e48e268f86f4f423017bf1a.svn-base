<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="mobileReportSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        	<div region="center" border="false">
			<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
				<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="mobileReport_list"/>
	        </c:if>
         		<div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
				<table>
					<tr>
						<td class="search-title" >姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
						<td><input name="culpritName" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title" >报到结果：</td>
						<td>
						<select name="dicMobilereportId" class="easyui-combobox" panelHeight="auto">
							<option value="">全部</option>
							<option value="1070001">已接通</option>
							<option value="1070002">未接通</option>
						</select>
						</td>
					</tr>
					<tr>
						<td class="search-title" >报到起始：</td>
						<td><input name="searchStartDate" class="Wdate" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
					</tr>
					<tr>
						<td class="search-title" >报到截止：</td>
						<td><input name="searchEndDate" class="Wdate" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
					</tr>
				</table>
				</div>
			</div>
		 	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchGroupBtn" iconCls="icon-search" onclick="javascript:$('#mobileReport_list').datagrid('load' ,$.serializeObject($('#mobileReportSearchForm')));">搜索</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#mobileReportSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>
	<div id="dailyMobileReportHistory"></div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="mobileReport_list" title="电话报到列表" 
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/mobileReport/list',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80" >编号</th>
				<th data-options="field:'culpritName',width:80,align:'center'" >矫正人员姓名</th>
				<th data-options="field:'called',width:100,align:'center'" >声纹识别号码</th>
				<th data-options="field:'groupName',width:100,align:'center'" >所属司法所</th>
				<th data-options="field:'starttime',width:100,align:'center',sortable:true,formatter:Common.formatDate" >报到时间</th>
				<th data-options="field:'dicCheckStateId',width:100,align:'center',formatter:function(value,rowData,rowIndex){
				    return sy.getDicValue('SF_DAILY_MOBILE_REPORT','dic_mobilereport_id',rowData.dicMobilereportId,' ');
				}" >报到结果</th>
				<th data-options="field:'_opt',width:200,align:'center',formatter:formatOper" >注册录音回放</th>
				<th data-options="field:'_opt2',width:200,align:'center',formatter:formatOper2" >操作</th>
			</tr>
		</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
$(function() {

});

function formatRole(value, row, index){
	var str = '';
	if(value!=''){
		$.ajax({
			type : 'get',
			url : '${ctx}/sys/sysRole/findById?id=' + value,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			error: function(XMLHttpRequest, textStatus, errorThrown) {
			},
			success : function(result) {
				if(result!=null && result!=''){
					str = result.name;
				}
			}
		});
	}
	return str;
}

function formatOper(val,row,index){
	var operation='<a href="javascript:void(0);" onclick="playback(\''+row.filepath+'\')"><span style="color:blue;">录音回放</span></a>';
	
	return operation;
}

function formatOper2(val,row,index){
	var operation='<a href="javascript:void(0);" onclick="reporthistory(\''+row.culpritId+'\')"><span style="color:blue;">报到记录</span></a>';
	
	return operation;
}

function reporthistory(id){
	var url = "${ctx}/dailymgr/mobileReportHistory/list?culpritId="+id;
	
	/* parent.$.modalDialog({
        title : '历史记录',
        iconCls:'fi-plus icon-green',
        width : sy.getBrowerWidth()-250,
        height : sy.getBrowerHeight()-150,
        resizable : true,
        href : url
    }); */
	
	$('#dailyMobileReportHistory').dialog({    
	    title: '  ',
	    width: sy.getBrowerWidth()-250,
	    height: sy.getBrowerHeight()-150,
        //width : sy.getBrowerWidth()*0.5,
        //height : sy.getBrowerHeight()*0.5,
	    href: url,
        resizable : true,
	    modal: true
	});
	$('#dailyMobileReportHistory').window('center');
	
}

function playback(sef){
	var ow = window.open("${ctx}/dailymgr/callRegister/player?url=" + sef);
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
        return dt.format("yyyy-MM-dd"); //扩展的Date的format方法(上述插件实现)
    }
}
</script>
</html>
