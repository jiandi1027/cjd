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
 <form method="post" id="dailyReportForm" name="dailyReportForm">
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
           <table width="100%" class="grid">
                <tr>
                	<th width="10%"><span class="c-red">*</span>报到时间：</th>
							<td width="23%"><input type="text" name="reportDate" required=true missingMessage="报到时间不能为空!"
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
                    <th width="10%"><span class="c-red">*</span>报到方式：</th>
							<td width="23%">
							<input id="dicTypeKey" name="dicTypeKey" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_DAILY_REPORT&columnName=DIC_TYPE_KEY&parentKey=50200',panelHeight:'auto'"
		    				required=true missingMessage="认罪态度不能为空!" style="width:173px;" >
							</td>
							<th width="10%"><span class="c-red">*</span>是否按时：</th>
							<td width="23%"> <input name="dicOnscheduleKey" type="radio" checked="checked" value="1"/>是　 <input name="dicOnscheduleKey" type="radio" value="0"/>否</td>
					
                </tr>
				<tr>
                    <th width="10%">备注：</th>
                    <td colspan="5" align="left">
                    <textArea id="note" name="note" class="easyui-validatebox" style="width: 80%;height:50px;overflow:hidden;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200"></textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</td>
                </tr>
            </table>
    </div>
    </form>
    <script>
        function submitForm(){
        	 $('#dailyReportForm').form('submit');
        }
        function clearForm(){
            $('#dailyReportForm').form('clear');
        }
        $(function() {
        	$('#dailyReportForm').form({
        		url:'${ctx}/dailymgr/dailyReport/save',
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
