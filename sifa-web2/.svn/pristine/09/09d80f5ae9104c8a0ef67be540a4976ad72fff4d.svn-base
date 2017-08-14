<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

 <form method="post" id="finishRedressFormCheck" name="finishRedressFormCheck">
	<c:choose>
 		<c:when test="${empty finishRedress.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${finishRedress.culpritId}" formId="finishRedressFormCheck" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   <div id="finishRedressQmjdb"></div>
   <div id="finishRedressJcjzzms"></div>
   <div id="finishRedressJcsqjzxgs"></div>
   <div id="finishRedressJztzs"></div>
     <div class="easyui-panel" title="期满解矫信息" style="width:100%;padding:5px;">
     		<input type="hidden" name="id" id="id" value="${finishRedress.id}"/>
            <table width="100%" class="grid">
                <tr>
                   <th width="10%">矫正期间表现：</th>
							<td width="23%">${fns:getSysDicValueByKey('SF_FINISH_REDRESS','DIC_REDRESS_SHOW_KEY',finishRedress.dicRedressShowKey,'')}</td>
					<th width="10%">认罪态度：</th>
							<td width="23%">${fns:getSysDicValueByKey('SF_FINISH_REDRESS','DIC_PLEA_ATTITUDE_KEY',finishRedress.dicPleaAttitudeKey,'')}</td>
							<th width="10%">是否三无人员：</th>
							<td width="23%"><c:if test="${finishRedress.dicSThreeNonKey==1}">是</c:if>  　<c:if test="${finishRedress.dicSThreeNonKey==0}">否</c:if> </td>
                </tr>
                <tr>
							<th width="10%">是否参加职业技能培训：</th>
							<td width="23%"> <c:if test="${finishRedress.dicIsTrainKey==1}">是</c:if>  　<c:if test="${finishRedress.dicIsTrainKey==0}">否</c:if></td>
					<th width="10%">是否获得技能证书：</th>
							<td width="23%"><c:if test="${finishRedress.dicSkillsCertificateKey==1}">是</c:if>  　<c:if test="${finishRedress.dicSkillsCertificateKey==0}">否</c:if> </td>
							<th width="10%">技术特长及等级：</th>
							<td width="23%">${finishRedress.skillInfo}</td>
                </tr>
				<tr>
                   <th width="10%">危险性评估：</th>
							<td>${fns:getSysDicValueByKey('SF_FINISH_REDRESS','RISK_ID',finishRedress.riskId,'')}</td>
					<th width="10%">家庭联系情况：</th>
							<td>${fns:getSysDicValueByKey('SF_FINISH_REDRESS','FAMILY_CONTACT_ID',finishRedress.familyContactId,'')}</td>
							<td></td>
							<td></td>
                </tr>
                <tr>
                    <th width="10%">特殊情况备注：</th>
                    <td colspan="5" align="left">${finishRedress.remark}</td>
                </tr>
            </table>
            </div>
   <c:if test="${finishRedress.auditType ne 'workerReport'}">  
      
		<c:if test="${finishRedress.auditType ne 'workerPrint'}">  
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
			<c:if test="${finishRedress.auditType=='workerPrint'}">  
					<input type="hidden" name="dicDecideType" value="1" />

			</c:if>

	</c:if>
	</form>
  <script>
  $('#qmjdb').click(function (){
		 var id=$("#id").val();
		 var url="${ctx}/endcorrect/finishRedress/qmjdb?finishRedressId="+id;
		 $('#finishRedressQmjdb').dialog({    
			    title: '社区服刑人员矫正期满鉴定表',    
			    width: 800,
			    height: 650,
			    href: url,
		        iconCls:'fi-print icon-blue',
		        resizable : true,
		        maximizable:true, 
			    modal: true,
		        resizable : true,
			    buttons :[{
		            text : '打印社区服刑人员矫正期满鉴定表',
		            iconCls:'fi-print icon-blue',
		            handler : function() {
		                $('#qmjdbPrint').click();
		            }
		        },{
					text:'关闭',
					iconCls:'fi-x icon-blue',
					handler:function(){
						$('#finishRedressQmjdb').dialog('close');
					}
				}]
			});
			$('#finishRedressQmjdb').window('center');
	 });
	 
	 $('#jcjzzms').click(function (){
		 var id=$("#id").val();
		 var url="${ctx}/endcorrect/finishRedress/jcjzzms?finishRedressId="+id;
		$('#finishRedressJcjzzms').dialog({    
		    title: '解除社区矫正证明书',    
		    top: 100,
		    width: 850,
		    height: 600,
		    href: url,
	        iconCls:'fi-print icon-blue',
	        resizable : true,
	        maximizable:true, 
		    modal: true,
	        resizable : true,
		    buttons :[{
	            text : '打印解除社区矫正证明书',
	            iconCls:'fi-print icon-blue',
	            handler : function() {
	                $('#jcjzzmsPrint').click();
	            }
	        },{
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#finishRedressJcjzzms').dialog('close');
				}
			}]
		});
		$('#finishRedressJcjzzms').window('center');
	 });
	 
	 $('#jcsqjzxgs').click(function (){
		 var id=$("#id").val();
		 var url="${ctx}/endcorrect/finishRedress/jcsqjzxgs?finishRedressId="+id;
			$('#finishRedressJcsqjzxgs').dialog({    
			    title: '解除社区矫正宣告书',    
			    width: 800,
			    height: 650,
			    href: url,
		        iconCls:'fi-print icon-blue',
			    modal: true,
		        resizable : true,
			    buttons :[{
		            text : '打印解除社区矫正宣告书',
		            iconCls:'fi-print icon-blue',
		            handler : function() {
		                $('#jcsqjzxgsPrint').click();
		            }
		        },{
					text:'关闭',
					iconCls:'fi-x icon-blue',
					handler:function(){
						$('#finishRedressJcsqjzxgs').dialog('close');
					}
				}]
			});
			$('#finishRedressJcsqjzxgs').window('center');
		 
	 });
	 
	 $('#jztzs').click(function (){
		 var id=$("#id").val();
		 var url="${ctx}/endcorrect/finishRedress/jztzs?finishRedressId="+id;
		 var content = '<iframe src="' + url + '" width="100%" height="900" frameborder="0" scrolling="no"></iframe>';
			$('#finishRedressJztzs').dialog({    
			    title: '解除社区矫正通知书',    
			    width: 1150,
			    height: 600,
			    content: content,
		        iconCls:'fi-print icon-blue',
			    modal: true,
		        resizable : true,
			    buttons :[{
		            text : '打印解除社区矫正宣告书',
		            iconCls:'fi-print icon-blue',
		            handler : function() {
		                $('#jztzsPrint').click();
		            }
		        },{
					text:'关闭',
					iconCls:'fi-x icon-blue',
					handler:function(){
						$('#finishRedressJztzs').dialog('close');
					}
				}]
			});
			$('#finishRedressJztzs').window('center');
		 
	 });
 
 function submitForm(){
	 $('#finishRedressFormCheck').form('submit');
}
function clearForm(){
    $('#finishRedressFormCheck').form('clear');
}
$(function() {
	
	$('#finishRedressFormCheck').form({
		url:'${ctx}/endcorrect/finishRedress/check',
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
