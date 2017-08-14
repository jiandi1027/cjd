<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

 <form  action="${ctx}/dailymgr/inspection/save" method="post" id="inspectionDealForm" name="inspectionDealForm">
 
	<div class="easyui-panel" title="抽查设置" style="width:100%;padding:5px;margin: 0 auto;">
		<table width="100%" class="grid">
			<tr>
				<th width="20%">抽查部门：</th>
				<td width="30%">
				<input id="sysGroup.name" name="sysGroup.name" class="easyui-textbox" value="${inspection.sysGroup.name }" readonly="readonly" style="width: 70%;"/>&nbsp;
				</td>
				<th width="20%">被抽查部门：</th>
				<td width="30%">
				<input id="groupName" name="groupName" class="easyui-textbox" value="${sysAccount.groupName }" readonly="readonly" style="width: 70%;"/>&nbsp;
				</td>
			</tr>
			<tr>
				<th>抽查开始时间：</th>
				<td>
				<input id="checkStartTime" name="checkStartTime" class="easyui-textbox" editable="false" 
				value="<fmt:formatDate value='${inspection.checkStartTime}' pattern="yyyy-MM-dd HH:mm" />" style="width:70%;"/>&nbsp;
				</td>
				<th>抽查结束时间：</th>
				<td>
				<input id="checkEndTime" name="checkEndTime" class="easyui-textbox" editable="false" 
				value="<fmt:formatDate value='${inspection.checkEndTime}' pattern="yyyy-MM-dd HH:mm" />" style="width:70%;"/>&nbsp;
				</td>
			</tr>
			<tr>
				<th>应到人数：</th>
				<td>
				<input id="amount" name="amount" class="easyui-textbox" value="${empty inspectionSub.amount? '0':inspectionSub.amount }" readonly="readonly" style="width: 70%;"/>&nbsp;
				</td>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<td align="center" style="display: none;">
					<a id="inspectionDealBtn1" class="easyui-linkbutton">刷新考勤人员</a>
					<a id="inspectionDealBtn2" class="easyui-linkbutton">点验完成</a>
					<a id="inspectionDealBtn3" class="easyui-linkbutton">返回</a>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="easyui-panel" title="点验人员列表" data-options="fit:true" style="width:100%;padding:5px;height: 500px;">
		<table class="easyui-datagrid" id="inspectionDeal_list" title=" " data-options="fit:true" 
			style="width:100%;height: 400px;" 
			data-options="singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,rownumbers:true,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/inspectionDeal/list?inspectionId=${inspection.id }&groupId=${inspectionSub.groupId }',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'culpritName',width:'30%',align:'center'" editor="text">对象名称</th>
					<th data-options="field:'groupName',width:'40%',align:'center'" editor="text">司法所</th>
					<th data-options="field:'dicCheckStatusKey',width:'30%',align:'center',formatter:function(value,rowDate,rowIndex){
					if(rowDate.dicCheckStatusKey !=null){
						var zt = sy.getDicValue('sf_inspection_deal','dic_Check_Status_Key',rowDate.dicCheckStatusKey,'否');
						if(zt == '按时' || zt == '迟到'){
							zt = '是';
						}
						else zt = '否';
						return zt;
					}
					else return '否';
					}" editor="text">是否报到</th>
				</tr>
			</thead>
		</table>
	</div>
	
	<div class="easyui-panel" title="已考勤人员列表" data-options="fit:true" style="width:100%;padding:5px;">
		<table class="easyui-datagrid" id="ifaceRecord_list" title=" " data-options="fit:true" 
			style="width:100%;height: 400px;" 
			data-options="singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,rownumbers:true,pageList:[5,10,15,20,50],fitColumns:true,
			url:'${ctx}/sys/ifaceRecord/list?dealStatus=0&groupId=${inspectionSub.groupId }&searchStartDate=<fmt:formatDate value='${inspection.checkStartTime}' pattern="yyyy-MM-dd HH:mm:ss" />&checkTime='+new Date(),method:'post'">
			<thead>
				<tr>
					<th data-options="field:'name',width:'50%',align:'center'" editor="text">姓名</th>
					<th data-options="field:'checkTime',width:'50%',align:'center',formatter:Common.formatDate" editor="text">考勤时间</th>
				</tr>
			</thead>
		</table>
	</div>
					
</form>
<script>
//搜索
$('#inspectionDealBtn1').click(function() {
	$('#ifaceRecord_list').datagrid('load');
});
   
$('#inspectionDealBtn2').click(function (){
	$.messager.confirm('提示信息', '如果点击确定按钮则不能再录入矫正对象?', function(r) {
		if (r) {
	    	$.ajax({
				type : 'post',
				url : '${ctx}/dailymgr/inspectionDeal/deal?inspectionId=${inspection.id }&groupId=${inspectionSub.groupId }&inspectionSubId=${inspectionSub.id}',
				dataType : 'json',
				success : function(result) {
					if(result.msg == '点验结束'){
						$.messager.show({
							title : "提示",
							msg : "已经点验结束,请查看详情界面"
						});
						return;
					}
					
					$.messager.show({
						title : result.status == 200 ? "ok" : "fail",
						msg : result.msg
					});
					
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
				    parent.$.modalDialog.handler.dialog('close');
					//window.location.href = '${ctx}/dailymgr/inspection/detail?id=${inspection.id }';
				},
				error : function(result) {
					$.messager.show({
						title : result.status == 200 ? "ok" : "fail",
						msg : result.msg
					});
				}
			});
		}
	});
});
   
$('#inspectionDealBtn3').click(function (){
	parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
    parent.$.modalDialog.handler.dialog('close');
});
   
$(function() {
	/* $('#ifaceRecord_list, #inspectionDeal_list').datagrid({
		fit : true
	}); */
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
        return dt.format("yyyy-MM-dd hh:mm"); //扩展的Date的format方法(上述插件实现)
    }
}
</script>
</body>
</html>
