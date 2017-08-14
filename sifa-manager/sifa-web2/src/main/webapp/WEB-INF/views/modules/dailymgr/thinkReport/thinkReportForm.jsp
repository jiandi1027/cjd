<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
 <form  action="${ctx}/dailymgr/thinkReport/save" method="post" id="thinkReportForm">
	<input type="hidden" id="id" name="id" value="${thinkReport.id}"></input>
    <c:choose>
 		<c:when test="${empty thinkReport.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${thinkReport.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
   
     <div class="easyui-panel" title="思想汇报" style="width:100%;padding:5px;">
            <table width="100%" class="grid">

                <tr>
                    <th width="10%"><span class="c-red">*</span>汇报方式：</th>
							<td width="23%">
							<input id="dicReportTypeKey" name="dicReportTypeKey" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_THINK_REPORT&columnName=DIC_REPORT_TYPE_KEY&parentKey=14000',panelHeight:'auto'"
		    				required=true missingMessage="汇报方式不能为空!" style="width:173px;" value="${thinkReport.dicReportTypeKey}" >
							</td>
		                    <th width="10%"><span class="c-red">*</span>汇报状态：</th>
							<td width="23%">
							<input id="dicReportStatusKey" name="dicReportStatusKey" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_THINK_REPORT&columnName=DIC_REPORT_STATUS_KEY&parentKey=36000',panelHeight:'auto'"
		    				required=true missingMessage="汇报状态不能为空!" style="width:173px;" value="${thinkReport.dicReportStatusKey}" ></td>
					<th width="10%"><span class="c-red">*</span>汇报日期：</th>
							<td width="23%"><input type="text" name="reportDate" required=true missingMessage="汇报日期不能为空!" value="<fmt:formatDate value="${thinkReport.reportDate}" pattern="yyyy-MM-dd" />"
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
                </tr>
                
                <tr>
							<th width="10%"><span class="c-red">*</span>考核人：</th>
							<td width="23%" colspan="5"><input type="text" name="assessManager" required=true missingMessage="考核人不能为空!"
								class="f1 easyui-textbox" value="${thinkReport.assessManager}" /></td>
                </tr>
                <tr>
                    <th width="10%">备注：</th>
                    <td colspan="5" align="left">
                    <textArea id="note" name="note" class="easyui-validatebox" style="width: 80%;height:50px;overflow:hidden;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200">${thinkReport.note}</textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em
							class="textarea-length c-red">${fn:length(thinkReport.note)}</em>个字。
                    </td>
                </tr>
                <tr>
                    <th width="10%">附件：</th>
                    <td colspan="5" align="left" width="89%">
                    	<div id="uploader"></div>
						<div id="wtdchUploadIng">
						<c:forEach var="sysFile" items="${fileList}">
						<div id="file_${sysFile.id}">
						${sysFile.originName}
						<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
						</c:forEach>
						</div>
                    </td>
                </tr>
            </table>
            </div>

    </form>
    <script>
        function submitForm(){
        	 $('#thinkReportForm').form('submit');
        }
        function clearForm(){
            $('#thinkReportForm').form('clear');
        }
        $(function() {
        	$('#thinkReportForm').form({
        		url:'${ctx}/dailymgr/thinkReport/save',
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
        
        $(function() {
        	$("#uploader").powerWebUpload({ auto: true,fileNumLimit:5,fileSingleSizeLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
        	
        	$('#recidivismPerhapsForm').form({
        		url:'${ctx}/endcorrect/recidivismPerhaps/save',
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
        
        $('#reportBtn2').click(function (){
        	parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
            parent.$.modalDialog.handler.dialog('close');
        });
        
	
    </script>
