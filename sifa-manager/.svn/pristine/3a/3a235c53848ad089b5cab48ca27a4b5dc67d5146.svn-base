<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>重新犯罪</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>
 <form  action="${ctx}/endcorrect/recidivism/check" method="post" id="culpritInfo">
	<c:choose>
 		<c:when test="${empty recidivism.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${recidivism.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   <div class="easyui-panel" title="重新犯罪" style="width:100%;padding:10px;">
     <input type="hidden" name="id" value="${recidivism.id}"/>
            <table width="100%">
                <tr>
                    <td>新罪名:</td>
							<td>${recidivism.newCrime}</td>
							<td>判决法院:</td>
							<td>${recidivism.judgmentCourt}</td>
					<td>判决时间:</td>
							<td><fmt:formatDate value="${recidivism.judgmentTime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
                <tr>
                	<td>立案单位:</td>
							<td>${recidivism.registerUnit}</td>
					<td><span class="c-red">*</span>立案时间:</td>
							<td><fmt:formatDate value="${recidivism.registerTime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><span class="c-red">*</span>掌握信息时间:</td>
							<td><fmt:formatDate value="${recidivism.graspTime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>掌握信息方式:</td>
							<td>${fns:getSysDicValueByKey('SF_RECIDIVISM_PERHAPS','DIC_GRASP_TYPE_KEY',recidivism.dicGraspTypeKey,'')}</td>
							<td colspan="5"></td>

                </tr>
            </table>
    </div>

	<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>

   <TBODY>
   <c:if test="${recidivism.auditType ne 'workerPrint' and recidivism.auditType ne 'workerReport'}">
   <TR>
   			
				<TD height=30 width="15%" align=right >审核结果：</TD>
								<TD  width="15%">
								<input type="radio" name="dicDecideType" value="1" checked="checked"/>同意
								</TD>
								<TD height=30 width="15%" align=right>审核意见</TD>
								<TD  width="55%">
								<textarea rows="3" cols="30" name="opinion" required=true missingMessage="审核意见不能为空!"></textarea>
								</TD>
				</TR>
				</c:if>
				<tr>
							  <td colspan=4 align=center class=category>
								<a id="btn1"  class="easyui-linkbutton"   iconCls="icon-save" href="javascript:void(0)" >提交</a>
							  </td>
							</tr>
   </TBODY>
</TABLE>
    </form>
    <script>
        function clearForm(){
            $('#culpritInfo').form('clear');
        }
        $(function() {
        	$('#btn1').click(function(){
        		//alert($('dicDecideType'));
        		$('#culpritInfo').submit();
        	});	
        });	
        
        
        
	
    </script>
</body>
</html>
