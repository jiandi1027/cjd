<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>思想汇报</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>

<body>
 <form  action="${ctx}/dailymgr/thinkReport/save" method="post" id="culpritInfo">
	<input type="hidden" id="id" name="id" value="${thinkReport.id}"></input>
    <c:choose>
 		<c:when test="${empty thinkReport.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${thinkReport.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
   
     <div class="easyui-panel" title="思想汇报" style="width:100%;padding:10px;">
            <table width="100%">

                <tr>
                    <td><span class="c-red">*</span>汇报方式:</td>
							<td><select　id="dicReportTypeKey" name="dicReportTypeKey" class="easyui-combobox" required=true missingMessage="汇报方式不能为空!" style="width:150px;">
							 <option value=""></option>
		                    	<c:forEach items="${fns:getSysDicList('SF_THINK_REPORT','DIC_REPORT_TYPE_KEY','14000') }" var="sysDic">
		                    		<option value="${sysDic.key }" <c:if test='${sysDic.key==thinkReport.dicReportTypeKey}'> selected="selected"</c:if>>${sysDic.value}</option>
		                    	</c:forEach>
		                    </select></td>
		                    <td><span class="c-red">*</span>汇报状态:</td>
							<td><select　id="dicReportStatusKey" name="dicReportStatusKey" class="easyui-combobox" required=true missingMessage="汇报状态不能为空!" style="width:150px;">
							 <option value=""></option>
		                    	<c:forEach items="${fns:getSysDicList('SF_THINK_REPORT','DIC_REPORT_STATUS_KEY','36000') }" var="sysDic">
		                    		<option value="${sysDic.key }" <c:if test='${sysDic.key==thinkReport.dicReportStatusKey}'> selected="selected"</c:if>>${sysDic.value}</option>
		                    	</c:forEach>
		                    </select></td>
					<td><span class="c-red">*</span>汇报日期:</td>
							<td><input type="text" name="reportDate" required=true missingMessage="汇报日期不能为空!" value="<fmt:formatDate value="${thinkReport.reportDate}" pattern="yyyy-MM-dd HH:mm:ss" />"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
                </tr>
                
                <tr>
							<td><span class="c-red">*</span>考核人:</td>
							<td><input type="text" name="assessManager" required=true missingMessage="考核人不能为空!"
								class="f1 easyui-textbox" value="${thinkReport.assessManager}" /></td>
					<td></td><td></td>
					<td></td><td></td>
                </tr>
                <tr>
                    <td>备注:</td>
                    <td colspan="5" align="left"><textarea rows="3" cols="124" id="note" name="note" style="height:50px;">${thinkReport.note}</textarea></td>
                </tr>
                <tr>
                <td align="center" colspan="6">
                	<a id="btn1" href="javascript:void(0)" class="easyui-linkbutton" >提交</a>
	    			<a href="javascript:void(0)" class="easyui-linkbutton" >重置</a>
                </td>
                </tr>
            </table>
            </div>

    </form>
    <script>
        function clearForm(){
            $('#culpritInfo').form('clear');
        }
        $(function() {
        	$('#btn1').click(function(){
        		if($('#culpritInfo').form('validate')==true){
        			$('#culpritInfo').submit();
        		}
        	});	
        });
        
        
    </script>
</body>
</html>
