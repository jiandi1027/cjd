<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/dailymgr/inspection/save" method="post" id="inspectionDetailForm" name="inspectionDetailForm">

	<div class="easyui-panel" title="抽查设置" style="width:100%;padding:5px;margin: 0 auto;">
		<table width="100%" class="grid" >
			<tr>
				<th width="20%" align="right">
					被抽查部门：
				</th>
				<td colspan="3">
				<input id="groupsStr" name="groupsStr" class="easyui-textbox" multiple="multiple" value="${inspection.groupsStr }" readonly="readonly" style="height: 50px;width: 80%;"/>&nbsp;
				</td>
			</tr>
			<tr>
				<th width="20%" align="right">
					抽查开始时间：
				</th>
				<td width="30%">
				<input id="checkStartTime" name="checkStartTime" class="easyui-textbox" editable="false" 
				value="<fmt:formatDate value='${inspection.checkStartTime}' pattern="yyyy-MM-dd HH:mm" />" style="width:70%;"/>&nbsp;
				</td>
				<th width="20%" align="right">
					抽查结束时间：
				</th>
				<td width="30%">
				<input id="checkEndTime" name="checkEndTime" class="easyui-textbox" editable="false" 
				value="<fmt:formatDate value='${inspection.checkEndTime}' pattern="yyyy-MM-dd HH:mm" />" style="width:70%;"/>&nbsp;
				</td>
			</tr>
			<tr>
				<th width="20%" align="right">
					抽查部门：
				</th>
				<td width="30%">
				<input id="sysGroup.name" name="sysGroup.name" class="easyui-textbox" value="${inspection.sysGroup.name }" readonly="readonly" style="width: 70%;"/>&nbsp;
				</td>
				<th width="20%" align="right">
					应到人数：
				</th>
				<td width="30%">
				<input id="amount" name="amount" class="easyui-textbox" value="${empty inspection.amount? '0':inspection.amount }" readonly="readonly" style="width: 70%;"/>&nbsp;
				</td>
			</tr>
			<tr>
				<th width="20%" align="right">
					实到人数：
				</th>
				<td width="30%">
				<input id="realCount" name="realCount" class="easyui-textbox" value="${empty inspection.realCount? '0':inspection.realCount }" readonly="readonly" style="width: 70%;"/>&nbsp;
				</td>
				<th width="20%" align="right">
					迟到人数：
				</th>
				<td width="30%">
				<input id="lateCount" name="lateCount" class="easyui-textbox" value="${empty inspection.lateCount? '0':inspection.lateCount }" readonly="readonly" style="width: 70%;"/>&nbsp;
				</td>
			</tr>
			<tr>
				<th width="20%" align="right">
					未到人数：
				</th>
				<td width="30%">
				<input id="disCount" name="disCount" class="easyui-textbox" value="${empty inspection.disCount? '0':inspection.disCount}" readonly="readonly" style="width: 70%;"/>&nbsp;
				</td>
				<th width="20%" align="right">
				</th>
				<td width="30%">
				</td>
			</tr>
		</table>
	</div>
	
	<div class="easyui-panel" title="被抽查人员相关信息" style="width:100%;padding:5px;margin-bottom: 10px;">
		<table class="easyui-datagrid" id="t_list_content" title=" " style="width: 100%;height: 400px;" 
			data-options="singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,rownumbers:true,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/inspectionDeal/list?inspectionId=${inspection.id }',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'culpritName',width:'30%',align:'center'" >矫正对象</th>
					<th data-options="field:'groupName',width:'40%',align:'center'" >所属司法所</th>
					<th data-options="field:'dicCheckStatusKey',width:'30%',align:'center',formatter:function(value,rowDate,rowIndex){
					if(rowDate.dicCheckStatusKey !=null){
						return sy.getDicValue('sf_inspection_deal','dic_Check_Status_Key',rowDate.dicCheckStatusKey,'未抽查');
					}
					else return '未抽查';
					}" >点验结果</th>
				</tr>
			</thead>
		</table>
	</div>
</form>
<script>
</script>
</body>
</html>
