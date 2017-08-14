<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form id="verbalWarningForm2"  name="verbalWarningForm2"  method="post">
	<c:choose>
 		<c:when test="${empty verbalWarning.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${verbalWarning.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 	
 	<div class="easyui-panel" title="口头警告信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
                <tr>
                    <th width="10%">违纪原因：</th>
							<td width="90%">${fns:getSysDicValueByKey('SF_WARNING_ORAL','DIC_REASON_TYPE_KEY',warningOral.dicReasonTypeKey,'')}</td>
                </tr>
                <tr>
                    <th width="10%">简要违纪情况：</th>
							<td width="90%">${warningOral.detailInfo }</td>
                </tr>
            </table>
    </div>
    <div class="easyui-panel" title="流程审批" style="width:100%;padding:5px;margin-bottom:10px;margin:0 auto;">
    	
    	<input type="hidden" name="id" id="id" value="${warningOral.id}" />
		<input type="hidden" name="processInstanceId" id="processInstanceId" value="${warningOral.processInstanceId}" />
            <table width="100%" class="grid">
                <tr>
				<th width="10%" >审核意见：</th>
				<td width="90%">
				<textArea id="opinion" name="opinion" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,150)' onKeyUp="textarealength(this,150)" maxlength="150"></textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">150</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
			</tr>
            </table>
        
    </div> 	
 </form>
 <script>
       

        $(function() {
        	$('#verbalWarningForm2').form({
        		url:'${ctx}/rewardspunishment/verbalWarning/check',
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
