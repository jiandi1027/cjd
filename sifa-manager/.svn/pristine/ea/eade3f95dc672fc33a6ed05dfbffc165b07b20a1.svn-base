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
    
   
     <div class="easyui-panel" title="重新犯罪详情" style="width:100%;padding:10px;">
     <input type="hidden" name="id" value="${recidivism.id}"/>
            <table width="100%">
                <tr>
                    <td><span class="c-red">*</span>新罪名:</td>
							<td><input type="text" name="newCrime" required=true missingMessage="新罪名不能为空!"
								class="f1 easyui-textbox" value="${recidivism.newCrime}"  /></td>
							<td><span class="c-red">*</span>判决法院:</td>
							<td><input type="text" name="judgmentCourt" required=true missingMessage="判决法院不能为空!"
								class="f1 easyui-textbox" value="${recidivism.judgmentCourt}" /></td>
					<td><span class="c-red">*</span>判决时间:</td>
							<td><input type="text" name="judgmentTime" required=true missingMessage="判决时间不能为空!"
								value="<fmt:formatDate pattern='yyyy-MM-dd'   value='${ recidivism.judgmentTime }' />"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
                </tr>
                <tr>
                	<td><span class="c-red">*</span>立案单位:</td>
							<td><input type="text" name="registerUnit" required=true missingMessage="立案单位不能为空!"
								class="f1 easyui-textbox" value="${recidivism.registerUnit}" /></td>
					<td><span class="c-red">*</span>立案时间:</td>
							<td><input type="text" name="registerTime" required=true missingMessage="立案时间不能为空!"
								value="<fmt:formatDate pattern='yyyy-MM-dd'   value='${ recidivism.registerTime }' />"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
							<td><span class="c-red">*</span>掌握信息时间:</td>
							<td><input type="text" name="graspTime" required=true missingMessage="掌握信息时间不能为空!"
								value="<fmt:formatDate pattern='yyyy-MM-dd'   value='${ recidivism.graspTime }' />"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
					<td></td><td></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>掌握信息方式:</td>
							<td><select　id="dicGraspTypeKey" name="dicGraspTypeKey" class="easyui-combobox" required=true missingMessage="掌握信息方式不能为空!" style="width:150px;">
							 <option value=""></option>
                    	<c:forEach items="${fns:getSysDicList('SF_RECIDIVISM_PERHAPS','DIC_GRASP_TYPE_KEY','96200') }" var="sysDic">
                    		<option value="${sysDic.key }" <c:if test="${sysDic.key==recidivism.dicGraspTypeKey}">selected="selected"</c:if>>${sysDic.value}</option>
                    	</c:forEach>
                    </select>	</td>
							<td colspan="5"></td>

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
