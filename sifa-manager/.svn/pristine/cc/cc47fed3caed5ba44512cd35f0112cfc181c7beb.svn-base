<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>期满解矫</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>

<body>
 <form method="post" id="finishRedressForm" name="finishRedressForm">
     <c:choose>
 		<c:when test="${empty finishRedress.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${finishRedress.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="期满解矫" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
                <tr>
                   <th width="10%"><span class="c-red">*</span>矫正期间表现：</th>
							<td>
							<input id="dicRedressShowKey" name="dicRedressShowKey" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',value:'${finishRedress.dicRedressShowKey}',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_FINISH_REDRESS&columnName=DIC_REDRESS_SHOW_KEY&parentKey=126000',panelHeight:'auto'"
		    				required=true missingMessage="矫正期间表现不能为空!" style="width:173px;">
							</td>
					<th width="10%"><span class="c-red">*</span>认罪态度：</th>
							<td>
							<input id="dicPleaAttitudeKey" name="dicPleaAttitudeKey" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',value:'${finishRedress.dicPleaAttitudeKey}',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_FINISH_REDRESS&columnName=DIC_PLEA_ATTITUDE_KEY&parentKey=127000',panelHeight:'auto'"
		    				required=true missingMessage="认罪态度不能为空!" style="width:173px;">
							</td>
							<th width="10%">是否三无人员：</th>
							<td> <input name="dicSThreeNonKey" type="radio" value="1"  <c:if test="${finishRedress.dicSThreeNonKey=='1'}"> checked="checked"</c:if>　/>是
							 <input name="dicSThreeNonKey" type="radio" value="0" <c:if test="${finishRedress.dicSThreeNonKey=='0'}"> checked="checked"</c:if>/>否</td>
                </tr>
                <tr>
							<th width="10%">是否参加职业技能培训：</th>
							<td> <input name="dicIsTrainKey" type="radio" value="1"  <c:if test="${finishRedress.dicIsTrainKey=='1'}"> checked="checked"</c:if>/>是　 
							<input name="dicIsTrainKey" type="radio" value="0"  <c:if test="${finishRedress.dicIsTrainKey=='0'}"> checked="checked"</c:if>/>否</td>
					<th width="10%">是否获得技能证书：</th>
							<td> <input name="dicSkillsCertificateKey" type="radio" value="1" <c:if test="${finishRedress.dicSkillsCertificateKey=='1'}"> checked="checked"</c:if>/>是　 
							<input name="dicSkillsCertificateKey" type="radio" value="0" <c:if test="${finishRedress.dicSkillsCertificateKey=='0'}"> checked="checked"</c:if>/>否</td>
							<th width="10%">技术特长及等级：</th>
							<td><input type="text" name="skillInfo" id="skillInfo" class="f1 easyui-textbox"  value="${finishRedress.skillInfo}" /></td>
                </tr>
                <tr>
                   <th width="10%"><span class="c-red">*</span>危险性评估：</th>
							<td>
							<input id="riskId" name="riskId" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',value:'${finishRedress.riskId}',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_FINISH_REDRESS&columnName=RISK_ID&parentKey=128000',panelHeight:'auto'"
		    				required=true missingMessage="危险性评估不能为空!" style="width:173px;">
							</td>
					<th width="10%"><span class="c-red">*</span>家庭联系情况：</th>
							<td colspan="3">
							<input id="familyContactId" name="familyContactId" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',value:'${finishRedress.familyContactId}',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_FINISH_REDRESS&columnName=FAMILY_CONTACT_ID&parentKey=129000',panelHeight:'auto'"
		    				required=true missingMessage="家庭联系情况不能为空!" style="width:173px;">
							</td>
                </tr>

                <tr>
                    <th width="10%">特殊情况备注：</th>
                    <td colspan="5" align="left">
                    <textArea id="remark" name="remark" class="easyui-validatebox" style="width: 80%;height:50px;overflow:hidden;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200"></textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，，你已输入<em
							class="textarea-length c-red">${fn:length(finishRedress.remark)}</em>个字。
                    </td>
                </tr>

            </table>
    </div>
    </form>
      <script>
        function submitForm(){
        	 $('#finishRedressForm').form('submit');
        }
        function clearForm(){
            $('#finishRedressForm').form('clear');
        }
        $(function() {
        	$('#finishRedressForm').form({
        		url:'${ctx}/endcorrect/finishRedress/save',
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
