<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<div class="easyui-layout" data-options="fit:true,border:false">
	<div region="center" border="false">
		<table class="easyui-datagrid" id="mxCheck_list" title="" 
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			fitColumns:true,url:'${ctx}/sys/mxCheck/list?infoType=${mxCheck.infoType }&processInstanceId=${mxCheck.processInstanceId}',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'dicChecktypeId',width:250,align:'center',formatter:function(value,rowDate,rowIndex){
				if(rowDate.dicChecktypeId !=null){
					if( rowDate.infoType == '1' || rowDate.infoType == '4'){
						return sy.getDicValue('common_table', 'srzl', rowDate.dicChecktypeId, '');
					}
					if( rowDate.infoType == '3' || rowDate.infoType == '2' || rowDate.infoType == '5' || rowDate.infoType == '6'){
						return sy.getDicValue('common_table', 'zfzl', rowDate.dicChecktypeId, '');
					}
				}
				}" >扣分原因</th>
				<th data-options="field:'deduction',width:80,align:'center'" >每处扣分</th>
				<th data-options="field:'amount',align:'center',width:80">共几处</th>
				<th data-options="field:'deductionamount',align:'center',width:80,formatter:function(value,rowDate,rowIndex){
				if(rowDate.deduction != null && rowDate.amount != null){
				return rowDate.deduction * rowDate.amount;
				}
				}">本条总扣分</th>
				<th data-options="field:'detailReason',align:'center',width:250">具体原因</th>
			</tr>
		</thead>
		</table>
	</div>
</div>
</html>
