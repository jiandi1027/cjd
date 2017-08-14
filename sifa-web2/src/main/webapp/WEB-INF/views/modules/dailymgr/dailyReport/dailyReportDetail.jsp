<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form>
   <c:choose>
 		<c:when test="${empty culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 	
     <div class="easyui-panel" title="报到记录" style="width:100%;padding:5px;margin-bottom: 10px;">
		<table class="easyui-datagrid" id="t_list_content"  style="width: 100%;height: 350px;" data-options="singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,rownumbers:true,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/dailyReport/dailyReportList?culpritId=${culpritId}',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'shouldReportDate',width:'30%',align:'center'" >应报到日期</th>
					<th data-options="field:'reportDate',width:'40%',align:'center'" >报到日期</th>
					<th data-options="field:'dicTypeKey',width:'28%',align:'center',formatter:function(value,rowData,rowIndex){
						return sy.getDicValue('SF_DAILY_REPORT','DIC_TYPE_KEY',value,'')}" >报到方式</th>
				</tr>
			</thead>
		</table>
	</div>
    
</form>
