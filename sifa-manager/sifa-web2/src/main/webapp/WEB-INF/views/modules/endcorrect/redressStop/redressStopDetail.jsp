<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="" method="post" id="redressStopInfo">
	<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${redressStop.culpritId}" formId="redressStopInfo" isSelect="false"/>
	
	<div class="easyui-panel" title="矫正终止信息" style="width: 100%; padding: 5px;margin:0 auto;">
		<table width="100%" class="grid">
			<tr>  
				<th width="10%">终止矫正日期：</th>
				<td width="90%"><fmt:formatDate value="${redressStop.jjrq}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>  
				<th width="10%">终止矫正原因：</th>
				<td width="90%">
					<textArea id="jjsm" name="jjsm" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;" readonly="readonly" >${redressStop.jjsm }</textArea>
				</td>
			</tr>
			<tr>
				<th width="10%">采取的措施和处理结果：</th>
				<td width="90%">
					<textArea id="measure" name="measure" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;" readonly="readonly" >${redressStop.measure }</textArea>
				</td>
			</tr>
		</table>
	</div>
	<div class="easyui-panel" title="流程信息" style="width: 100%; padding: 5px;margin:0 auto;margin-bottom: 10px;">
		<table width="100%" class="grid" style="text-align: center;">
			<tr>
				<th style="text-align: center;">操作人</th>
				<th style="text-align: center;">操作时间</th>
				<th style="text-align: center;">操作环节</th>
				<th style="text-align: center;">审批结果</th>
				<th style="text-align: center;">审批意见</th>
			</tr>
			<c:forEach items="${processDetails}" var="processDetail">
			<tr>
				<td>${processDetail.createrCnName }</td>
				<td><fmt:formatDate value="${processDetail.created }" pattern="yyyy-MM-dd" /></td>
				<td>${processDetail.auditName }</td>
				<c:if test="${processDetail.dicDecideType==1 }" >
				<td>同意</td>
				</c:if>
				<c:if test="${processDetail.dicDecideType==2 }" >
				<td>退回</td>
				</c:if>
				<c:if test="${processDetail.dicDecideType==0 }" >
				<td>不同意</td>
				</c:if>
				<td>${processDetail.opinion }</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</form>
<script type="text/javascript">
</script>
</html>
