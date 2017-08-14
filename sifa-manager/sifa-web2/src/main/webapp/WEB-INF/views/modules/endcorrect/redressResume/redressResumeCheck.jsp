<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>特殊原因恢复矫正</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>
 <form  name="redressResumeCheckForm" id="redressResumeCheckForm">
	<c:choose>
 		<c:when test="${empty redressResume.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${redressResume.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="特殊原因恢复矫正信息" style="width:100%;padding:10px;">
     		<input type="hidden" name="id" value="${redressResume.id}"/>
            <table width="100%" class="grid">
            	<tr>
					<th width="10%">矫正恢复时间：</th>
							<td width="23%"><fmt:formatDate value="${redressResume.redressStartTime}"
									pattern="yyyy-MM-dd" /></td>
					<th width="10%">正恢复时间：</th>
							<td width="23%"><fmt:formatDate value="${redressResume.redressEndTime}"
									pattern="yyyy-MM-dd" /></td>
					<th width="10%">处理部门：</th>
							<td width="23%">${redressResume.examineUnitName}</td>
                </tr>
                <tr>
                    <th width="10%">恢复矫正原因：</th>
                    <td colspan="5" align="left">${redressResume.reason}</td>
                </tr>
                <tr>
                    <th width="10%">主要事实：</th>
                    <td colspan="5" align="left">${redressResume.fact}</td>
                </tr>
            </table>
            </div>      
   <c:if test="${redressResume.auditType ne 'workerReport'}">  
      
		<c:if test="${redressResume.auditType ne 'workerPrint'}">  
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
			<c:if test="${redressResume.auditType=='workerPrint'}">  

					<input type="hidden" name="dicDecideType" value="1" />
			</c:if>
			
	</c:if>
    </form>
    

 <script>
        function submitForm(){
        	 $('#redressResumeCheckForm').form('submit');
        }
        function clearForm(){
            $('#redressResumeCheckForm').form('clear');
        }
        $(function() {
        	$('#redressResumeCheckForm').form({
        		url:'${ctx}/endcorrect/redressResume/check',
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
