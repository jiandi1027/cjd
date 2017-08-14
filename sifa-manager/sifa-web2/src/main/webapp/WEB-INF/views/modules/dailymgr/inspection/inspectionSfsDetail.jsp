<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/dailymgr/inspection/save" method="post" id="inspectionDetailForm" name="inspectionDetailForm">
	<div class="easyui-panel" title="抽查设置" style="width:100%;padding:5px;margin: 0 auto;">
		<table width="100%" class="grid" >
			<tr>
				<th width="20%">抽查部门：</th>
				<td width="30%">
				<input id="sysGroup.name" name="sysGroup.name" class="easyui-textbox" value="${inspection.sysGroup.name }" readonly="readonly" style="width: 70%;"/>
				</td>
				<th width="20%">被抽查部门：</th>
				<td width="30%">
				<input id="groupName" name="groupName" class="easyui-textbox" value="${sysAccount.groupName }" readonly="readonly" style="width: 70%;"/>
				</td>
			</tr>
			<tr>
				<th>抽查开始时间：</th>
				<td>
				<input id="checkStartTime" name="checkStartTime" class="easyui-textbox" editable="false" 
				value="<fmt:formatDate value='${inspection.checkStartTime}' pattern="yyyy-MM-dd HH:mm" />" style="width:70%;"/>
				</td>
				<th>抽查结束时间：</th>
				<td>
				<input id="checkEndTime" name="checkEndTime" class="easyui-textbox" editable="false" 
				value="<fmt:formatDate value='${inspection.checkEndTime}' pattern="yyyy-MM-dd HH:mm" />" style="width:70%;"/>
				</td>
			</tr>
			<tr>
				<th>应到人数：</th>
				<td>
				<input id="amount" name="amount" class="easyui-textbox" value="${empty inspectionSub.amount? '0':inspectionSub.amount }" readonly="readonly" style="width: 70%;"/>
				</td>
				<th>实到人数：</th>
				<td>
				<input id="realCount" name="realCount" class="easyui-textbox" value="${empty inspectionSub.realCount? '0':inspectionSub.realCount }" readonly="readonly" style="width: 70%;"/>
				</td>
			</tr>
			<tr>
				<th>迟到人数：</th>
				<td>
				<input id="lateCount" name="lateCount" class="easyui-textbox" value="${empty inspectionSub.lateCount? '0':inspectionSub.lateCount }" readonly="readonly" style="width: 70%;"/>
				</td>
				<th>未到人数：</th>
				<td>
				<input id="disCount" name="disCount" class="easyui-textbox" value="${empty inspectionSub.disCount? '0':inspectionSub.disCount }" readonly="readonly" style="width: 70%;"/>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="easyui-panel" title="点验人员列表" data-options="fit:true" style="width:100%;padding:5px;margin-bottom: 10px;">
		<table class="easyui-datagrid" id="t_list_content" title=" " style="width: 100%;" data-options="fit:true" 
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
</form>
<script>
</script>
</body>
</html>