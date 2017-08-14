<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form action="${ctx}/monitoring/terminal/save" method="post" id="bindingform">
	<div class="easyui-panel" style="width:100%; padding: 5px;">
    	<input type="hidden" name="id" id="id" value="${terminal.id }"/>
        <input type="hidden" name="culpritId" id="culpritId" value="${culprit.id }"/>
        <table width="100%" class="grid">
	        <tr>
	            <th width="20%">编号：</th>
	            <td width="30%">${culprit.no }</td>
	            <th width="20%">所属司法所：</th>
	            <td width="30%">${culprit.groupName }</td>
	        </tr>
	        <tr>
	            <th>矫正对象 ：</th>
	            <td>${culprit.name }</td>
	            <th><span class="c-red">*</span>定位号码：</th>
	            <td>
	            	<input value="${terminal.mobileNumber }" name="mobileNumber" id="mobileNumber" class="easyui-textbox" required="required" missingMessage="定位号码不能为空!"/>
	            </td>
	        </tr>
	        <tr>
	        	<th>终端类型：</th>
	        	<td>
	       			<select class="easyui-combobox" data-options="panelHeight:'auto',panelMaxHeight:'200'" name="type" style="width: 173px;">
						<option value="手机" <c:if test="${terminal.type=='手机' }">selected="selected"</c:if>>手机</option>
						<option value="定位手环"<c:if test="${terminal.type=='定位手环' }">selected="selected"</c:if>>定位手环</option>
	       			</select>
	       		</td>
	       		<th>定位间隔：</th>
	       		<td>
	       			<select  class="easyui-combobox" data-options="panelHeight:'auto',panelMaxHeight:'200'"name="intervalTime" style="width: 173px;"> 
						<option value="5分钟/次" <c:if test="${terminal.intervalTime=='5分钟/次' }">selected='selected'</c:if>>5分钟/次</option>
						<option value="10分钟/次"<c:if test="${terminal.intervalTime=='10分钟/次' }">selected='selected'</c:if>>10分钟/次</option>
						<option value="30分钟/次"<c:if test="${terminal.intervalTime=='30分钟/次' || empty terminal.intervalTime }">selected="selected"</c:if>>30分钟/次</option>
						<option value="1小时/次"<c:if test="${terminal.intervalTime=='1小时/次' }">selected="selected"</c:if>>1小时/次</option>
						<option value="2小时/次"<c:if test="${terminal.intervalTime=='2小时/次' }">selected="selected"</c:if>>2小时/次</option>
						<option value="12小时/次"<c:if test="${terminal.intervalTime=='12小时/次' }">selected="selected"</c:if>>12小时/次</option>
						<option value="24小时/次"<c:if test="${terminal.intervalTime=='24小时/次' }">selected="selected"</c:if>>24小时/次</option>
	       			</select>
	        	</td>
	        </tr>
	        <tr>
	        	<th>绑定电子围栏：</th>
	        	<td colspan="3"><input id='areaName' name="areaId" class="easyui-combobox" value="${terminal.areaId}"/></td>
	        </tr>
	    </table>           
	</div>
</form>
<script>
var reportType;
var tel = '${terminal.mobileNumber }';
function submitForm(){
	 $('#bindingform').form('submit');
}
function clearForm(){
    $('#bindingform').form('clear');
}
$(function() {
	$('#bindingform').form({
		url:'${ctx}/monitoring/terminal/save',
		onSubmit:function(){
			return $(this).form('validate');
		},
		success:function(data){
			data = JSON.parse(data);
			if(data.status==200){
				$.messager.show({
					title:'提示信息!' ,
					msg:data.msg
				});
                parent.$.modalDialog.handler.dialog('close');
			}else{
				$.messager.show({
					title:'提示信息!' ,
					msg:data.msg
				});
			}
			
		}
	});
});
$('#areaName').combobox({
	panelHeight : 'auto',
	panelMaxHeight : '200',
	mode : 'remote',
	valueField : 'id',
	textField : 'name',
	url : '${ctx}/monitoring/terminal/arealist',
	method : 'post'
	//delay : 500
});
    	
$('#mobileNumber').textbox({
	onChange:function(newValue, oldValue){
		$.ajax({
			type : 'get',
			url : '${ctx}/monitoring/terminal/mobile?mobile='+newValue,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			success : function(data) {
				if (data.status != 200) {
					$('#mobileNumber').textbox('setValue','');
					$.messager.show({
						title:'提示信息!' ,
						msg:data.msg
					});
				}
			}
		})
	}
});


if (tel == null || tel == '') {
	$('#jiechu').hide();
}
//else $('#bangding').hide();
</script>
