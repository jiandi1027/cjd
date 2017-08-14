<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>漏罪</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>
 <form  action="${ctx}/endcorrect/omittedCrime/check" method="post" id="omittedCrimeCheckForm" name="omittedCrimeCheckForm">
	<c:choose>
 		<c:when test="${empty omittedCrime.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${omittedCrime.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="漏罪信息" style="width:100%;padding:5px;">
     		<input type="hidden" name="id" value="${omittedCrime.id}"/>
            <table width="100%" class="grid">
                <tr>
                   <th width="10%">强制措施类型:</th>
							<td width="23%">${fns:getSysDicValueByKey('SF_RECIDIVISM_PERHAPS','COERCIVE_MEASURE_KEY',omittedCrime.coerciveMeasureKey,'')}</td>
					<th width="10%">强制措施时间:</th>
							<td width="23%"><fmt:formatDate value="${omittedCrime.coerciveMeasureDate}"
									pattern="yyyy-MM-dd" /></td>
							<th width="10%">掌握信息时间:</th>
							<td width="23%"><fmt:formatDate value="${omittedCrime.graspTime}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <th width="10%">涉嫌罪名:</th>
							<td width="23%">${omittedCrime.newCrime}</td>
							<th width="10%">立案单位:</th>
							<td width="23%">${omittedCrime.registerUnit}</td>
					<th width="10%">立案时间:</th>
							<td width="23%"><fmt:formatDate value="${omittedCrime.registerTime}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <th width="10%">掌握信息方式:</th>
							<td width="23%" colspan="5">${fns:getSysDicValueByKey('SF_RECIDIVISM_PERHAPS','DIC_GRASP_TYPE_KEY',omittedCrime.dicGraspTypeKey,'')}</td>
							 
					
                </tr>
                <tr>
                    <th>漏罪情况:</th>
                    <td colspan="5" align="left">${omittedCrime.crimeDetails}</td>
                </tr>
            </table>
            </div>
             
   <c:if test="${omittedCrime.auditType ne 'workerReport'}">  
    
		<c:if test="${omittedCrime.auditType ne 'workerPrint'}">  
		  <div class="easyui-panel" title="流程审批" style="width:100%;padding:5px;margin-bottom:10px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%" ><span class="c-red"></span>审核结果：</th>
				<td width="89%">
					<input type="radio" name="dicDecideType" value="1" checked="checked"/>同意
					<input type="radio" name="dicDecideType" value="2"/>不同意
				</td>
			</tr>
			<tr>
				<th width="10%" >审核意见：</th>
				<td width="89%">
				<textArea id="opinion" name="opinion" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,150)' onKeyUp="textarealength(this,150)" maxlength="150"></textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">150</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
			</tr>
			</table>
		</div>
			</c:if>
			<c:if test="${omittedCrime.auditType=='workerPrint'}">  

					<input type="hidden" name="dicDecideType" value="1"/>

			
			</c:if>
			
	</c:if>
    </form>
 <script>
        function submitForm(){
        	 $('#omittedCrimeCheckForm').form('submit');
        }
        function clearForm(){
            $('#omittedCrimeCheckForm').form('clear');
        }
        $(function() {
        	$('#omittedCrimeCheckForm').form({
        		url:'${ctx}/endcorrect/omittedCrime/check',
        		onSubmit:function(){
        			 progressLoad();
        			 var isValid = $(this).form('validate');
                     if (!isValid) {
                    	 progressClose();
                     }
                     return isValid;
        		},
        		success:function(data){
        			data = JSON.parse(data);
        			if(data.status==200){
        				  progressClose();
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        				
        				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                         parent.$.modalDialog.handler.dialog('close');
    					
        			}else{
        				 parent.$.messager.alert('错误', result.msg, 'error');
        			}
        			
        		}
        	});	
        
        });
        
	
    </script>
</body>
</html>
