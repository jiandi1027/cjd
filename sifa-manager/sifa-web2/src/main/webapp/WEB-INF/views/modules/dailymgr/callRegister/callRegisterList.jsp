<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="callRegisterSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        	<div region="center" border="false">
			<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
				<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="callRegister_list"/>
	        </c:if>
         		<div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
				<table>
					<tr>
						<td class="search-title" >姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
						<td><input name="culpritName" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title" >注册状态：</td>
						<td>
						<select name="dicRegisterId" class="easyui-combobox" panelHeight="auto">
							<option value="">全部</option>
							<option value="1060001">已注册</option>
							<option value="1060002">注册失败</option>
						</select>
						</td>
					</tr>
					<tr>
						<td class="search-title" >注册起始：</td>
						<td><input name="searchStartDate" class="Wdate" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
					</tr>
					<tr>
						<td class="search-title" >注册截止：</td>
						<td><input name="searchEndDate" class="Wdate" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
					</tr>
				</table>
				</div>
			</div>
		 	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchGroupBtn" iconCls="icon-search" onclick="javascript:$('#callRegister_list').datagrid('load' ,$.serializeObject($('#callRegisterSearchForm')));">搜索</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#callRegisterSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="callRegister_list" title="当前注册信息列表" 
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/callRegister/list',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',checkbox:true,width:80" >编号</th>
				<th data-options="field:'culpritName',width:80,align:'center'" >矫正人员姓名</th>
				<th data-options="field:'callee',width:100,align:'center'" >声纹识别号码</th>
				<th data-options="field:'groupName',width:100,align:'center'" >司法所</th>
				<th data-options="field:'created',width:100,align:'center',sortable:true,formatter:Common.formatDate" >注册时间</th>
				<th data-options="field:'dicRegisterId',width:100,align:'center',formatter:function(value,rowData,rowIndex){
				    return sy.getDicValue('sf_call_register','dic_register_id',rowData.dicRegisterId,' ');
				}" >注册结果</th>
				<th data-options="field:'_opt2',width:200,align:'center',formatter:formatOper2" >注册录音回放</th>
				<th data-options="field:'_opt',width:250,align:'center',formatter:formatOper" >操作</th> 
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
	var operation = "";
	if (row.dicRegisterId == '1060002') {
		operation +='<a href="javascript:void(0);" onclick="callRegister(\''+row.culpritId+'\')"><span style="color:blue;">重新注册</span></a>';
	}
	else operation +='<a href="javascript:void(0);" onclick="callCheck(\''+row.culpritId+'\')"><span style="color:blue;">声纹抽查</span></a>';
	
	return operation;
}

function formatOper2(val,row,index){
	var operation='<a href="javascript:void(0);" onclick="playback(\''+row.filepath+'\')"><span style="color:blue;">录音回放</span></a>';
	
	return operation;
}

function callRegister(id){
	if (confirm("确定重新进行注册?")) {
		progressLoad();
		$.ajax({
			url : '${ctx}/dailymgr/callRegister/register?culpritId=' + id,
			method : 'post',
			dataType : 'json',
			success : function(result) {
				var info = "";
				var resultmsg = result.msg;
				if (resultmsg == "true") {
					//info="声纹采集电话已拨出！";
					setTimeout('getCallBackmsg(' + id + ', "采集")', 3000);
				}
				if (resultmsg == "notelno") {
					info = "未开通声纹识别功能，请先开通声纹识别功能！";
				}
				if (info.length > 0) {
	            	progressClose();
	            	$.messager.show({
	    				title : "提示信息",
	    				msg : info
	    			});
				}
			},
			error : function() {
            	progressClose();
            	$.messager.show({
    				title : "提示信息",
    				msg : "声纹登记失败!请联系管理员！"
    			});
			}
		});
	}
}

function callCheck(id){
	if (confirm("确定进行声纹抽查?")) {
		progressLoad();
		$.ajax({
			url : '${ctx}/dailymgr/callCheck/check?culpritId=' + id,
			method : 'post',
			dataType : 'json',
			success : function(result) {
				var info = "";
				var resultmsg = result.msg;
				if (resultmsg == "true") {
					//info="声纹采集电话已拨出！";
					setTimeout('getCallBackmsg(' + id + ', "抽查")', 3000);
				}
				if (resultmsg == "noRegister") {
					info = "用户未进行注册，请先注册声纹信息！";
				}
				if (info.length > 0) {
	            	progressClose();
	            	$.messager.show({
	    				title : "提示信息",
	    				msg : info
	    			});
				}
			},
			error : function() {
            	progressClose();
            	$.messager.show({
    				title : "提示信息",
    				msg : "声纹抽查失败!请联系管理员！"
    			});
			}
		});
	}
}

function getCallBackmsg(id, str) {
	progressClose();
	$.ajax({
		url : '${ctx}/sys/sysCallBackmsg/callBackmsg?culpritId=' + id,
		method : 'post',
		dataType : 'json',
		success : function(result) {
        	progressClose();
			var info = "";
			var resultmsg = result.msg;
			if (resultmsg == "true") {
				info = "声纹" + str + "电话已拨出！";
			}
			if (resultmsg == "nostate") {
				info = "声纹" + str + "电话已拨出！";
			}
			if (resultmsg == "false") {
				info = "当前线路繁忙，请稍后再试！";
			}
			if (info.length > 0) {
            	$.messager.show({
    				title : "提示信息",
    				msg : info
    			});
			}
		},
		error : function() {
        	progressClose();
        	$.messager.show({
				title : "提示信息",
				msg : "声纹" + str + "失败!请联系管理员！"
			});
		}
	});
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
