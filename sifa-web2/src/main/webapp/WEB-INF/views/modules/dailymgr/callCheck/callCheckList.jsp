<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic}/js/cLodop/LodopFuncs.js"></script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="callCheckSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        	<div region="center" border="false">
				
	        <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
				<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="callCheck_list"/>
	        </c:if>
         		<div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
				<table>
					<tr>
						<td class="search-title" >姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
						<td><input name="culpritName" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title" >抽查结果：</td>
						<td>
						<select name="dicRegisterId" class="easyui-combobox" panelHeight="auto">
							<option value="">全部</option>
							<option value="1090001">验证通过</option>
							<option value="1090002">验证失败</option>
						</select>
						</td>
					</tr>
					<tr>
						<td class="search-title" >抽查状态：</td>
						<td>
						<select name="dicCheckStateId" class="easyui-combobox" panelHeight="auto">
							<option value="">全部</option>
							<option value="1100004">认证失败1次</option>
							<option value="1100005">认证失败2次</option>
							<option value="1100006">认证失败3次</option>
							<option value="1100007">用户超时未接电话</option>
							<option value="1100008">用户未注册</option>
							<option value="1100009">线路繁忙</option>
						</select>
						</td>
					</tr>
					<tr>
						<td class="search-title" >抽查起始：</td>
						<td><input name="searchStartDate" class="Wdate" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
					</tr>
					<tr>
						<td class="search-title" >抽查截止：</td>
						<td><input name="searchEndDate" class="Wdate" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
					</tr>
				</table>
				</div>
			</div>
		 	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchGroupBtn" iconCls="icon-search" onclick="javascript:$('#callCheck_list').datagrid('load' ,$.serializeObject($('#callCheckSearchForm')));">搜索</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#callCheckSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="callCheck_list" title="当前抽查信息列表" 
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/callCheck/list',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80" >编号</th>
				<th data-options="field:'culpritName',width:80,align:'center'" >矫正人员姓名</th>
				<th data-options="field:'callee',width:100,align:'center'" >声纹识别号码</th>
				<th data-options="field:'groupName',width:100,align:'center'" >司法所</th>
				<th data-options="field:'created',width:100,align:'center',sortable:true,formatter:Common.formatDate" >抽查时间</th>
				<th data-options="field:'dicRegisterId',width:100,align:'center',formatter:function(value,rowData,rowIndex){
				    return sy.getDicValue('sf_call_check','dic_register_id',rowData.dicRegisterId,' ');
				}" >抽查结果</th>
				<th data-options="field:'dicCheckStateId',width:100,align:'center',formatter:function(value,rowData,rowIndex){
				    return sy.getDicValue('sf_call_check','dic_Check_State_Id',rowData.dicCheckStateId,' ');
				}" >抽查状态</th>
				<th data-options="field:'_opt',width:200,align:'center',formatter:formatOper" >抽查录音回放</th>
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
