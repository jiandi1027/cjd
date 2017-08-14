<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>报到</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>
 <form  action="${ctx}/dailymgr/dailyReport/save" method="post" id="culpritInfo">
	<c:choose>
 		<c:when test="${empty dailyReport.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${dailyReport.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="报到详情" style="width:100%;padding:10px;">
     <input type="hidden" name="id" value="${dailyReport.id}"/>
            <table width="100%">
                <tr>
                	<td><span class="c-red">*</span>报到时间:</td>
							<td><input type="text" name="reportDate" required=true missingMessage="报到时间不能为空!"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
                    <td><span class="c-red">*</span>报到方式:</td>
							<td><select　id="dicTypeKey" name="dicTypeKey" class="easyui-combobox" required=true missingMessage="认罪态度不能为空!" style="width:150px;">
							 <option value=""></option>
                    	<c:forEach items="${fns:getSysDicList('SF_DAILY_REPORT','DIC_TYPE_KEY','50200')}" var="sysDic">
                    		<option value="${sysDic.key }">${sysDic.value}</option>
                    	</c:forEach>
                    </select></td>
							<td><span class="c-red">*</span>是否按时:</td>
							<td> <input name="dicOnscheduleKey" type="radio" checked="checked" value="1"/>是　 <input name="dicOnscheduleKey" type="radio" value="0"/>否</td>
					
                </tr>
				<tr>
                    <td>备注:</td>
                    <td colspan="5" align="left"><textarea rows="3" cols="124" id="note" name="note" style="height:50px;"
								class="f1 easyui-textbox"></textarea></td>
                </tr>
                <tr>
                <td align="center" colspan="5">
                	<a id="btn1" href="javascript:void(0)" class="easyui-linkbutton" >提交</a>
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
