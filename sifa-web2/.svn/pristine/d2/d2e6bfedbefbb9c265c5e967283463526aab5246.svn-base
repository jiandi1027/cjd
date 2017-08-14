<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div>
	 <c:choose>
 		<c:when test="${empty exitEntryReport.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${exitEntryReport.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel"  title="出入境报备相关信息" style="width:100%;padding:5px;margin:0 auto;">
             <table width="100%" class="grid">
              <c:set value="${fn:split(exitEntryReport.dicZjlxKey,',') }" var="ths"></c:set>
              <c:forEach items="${ths }" var="th" varStatus="status">
              	<tr>
                  <th width="10%">证件类型：</th><td width="23%">${fns:getSysDicValueByKey('common_table','dicZjlxKey',th,'')}</td>
                  <th width="10%">证件号码：</th><td width="56%">${fn:split(exitEntryReport.cedentialsNumber, ',')[status.count-1]}</td>
              	</tr>
              </c:forEach>
              <tr>
                 	<th>收缴时间：</th><td><fmt:formatDate value="${exitEntryReport.filingDate}" pattern="yyyy年MM月dd日" /></td>
              		<th>收缴人：</th><td>${exitEntryReport.handlingPerson}</td>
              </tr>
              <tr>
                    <th width="10%">通报备案事由&nbsp;&nbsp;&nbsp;<br/>和法律依据 ：</th><td colspan="3">
                    <textarea readOnly=true style="width:90%;height:40px;border: 0 none;">${exitEntryReport.filingReason}</textarea></td>
              </tr>
            </table>
    </div>
    
     <div class="easyui-panel" title="流程信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid" >
                <tr>
                   <th width="25%"  style="text-align:center;">操作人</th>
                   <th width="25%"  style="text-align:center;">操作时间</th>
                   <th width="25%"  style="text-align:center;">操作环节</th>
                   <th width="24%"  style="text-align:center;">意见</th>
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr style="text-align:center;">
                  	<td>${processDetail.createrCnName }</td>
                   <td><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                   <td>${processDetail.auditName }</td>
                   <td>
                   		<c:choose>
                   		<c:when test="${processDetail.dicDecideType eq 1 }">同意</c:when>
                   		<c:when test="${processDetail.dicDecideType eq 2 }">退回</c:when>
                   		<c:when test="${processDetail.dicDecideType eq 3 }">不同意</c:when>
                   		</c:choose>
                   </td>
                 
                </tr>
                 </c:forEach>
            </table>
    </div>
</div>
<div style="text-align: center;display: none;">
	    <a id="exitEntryReprotPrint1" class="easyui-linkbutton" >打印《法定不批准出境人员通报备案通知书》</a>
</div>
<div id="printExitEntryReprot"></div>
<script type="text/javascript">
$('#exitEntryReprotPrint1').click(function (){
	var url ='${ctx}/inculprit/exitEntryReport/printBATZS?id=${exitEntryReport.id}';
	$('#printExitEntryReprot').dialog({
	    title: '打印《法定不批准出境人员通报备案通知书》',
        iconCls:'fi-print icon-blue',
	    width: 800,    
	    height: 600,    
	    href: url,    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'打印',
            iconCls:'fi-print icon-blue',
			handler:function(){
				$('#exitEntryPrintBtn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#printExitEntryReprot').dialog('close');
			}
		}]
	});
	$('#printExitEntryReprot').window('center');
});
</script>
