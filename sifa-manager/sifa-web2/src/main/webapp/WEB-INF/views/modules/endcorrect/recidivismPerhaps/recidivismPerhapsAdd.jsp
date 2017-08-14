<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>

 <form  action="${ctx}/endcorrect/recidivismPerhaps/save" method="post" id="recidivismPerhapsForm">
     <c:choose>
 		<c:when test="${empty recidivismPerhaps.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${recidivismPerhaps.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="涉嫌重新犯罪" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
                                <tr>
                   <th width="10%"><span class="c-red">*</span>强制措施类型：</th>
							<td>
							<input id="coerciveMeasureKey" name="coerciveMeasureKey" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_RECIDIVISM_PERHAPS&columnName=COERCIVE_MEASURE_KEY&parentKey=96100',panelHeight:'auto'"
		    				required=true missingMessage="强制措施类型不能为空!" style="width:173px;">
							</td>
					<th width="10%"><span class="c-red">*</span>强制措施时间：</th>
							<td><input type="text" name="coerciveMeasureDate" required=true missingMessage="强制措施时间不能为空!"
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
							<th width="10%"><span class="c-red">*</span>掌握信息时间：</th>
							<td><input type="text" name="graspTime" required=true missingMessage="掌握信息时间不能为空!"
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
                </tr>
                <tr>
                    <th width="10%"><span class="c-red">*</span>涉嫌罪名：</th>
							<td><input type="text" name="newCrime" required=true missingMessage="涉嫌罪名不能为空!"
								class="f1 easyui-textbox" /></td>
							<th width="10%"><span class="c-red">*</span>立案单位：</th>
							<td><input type="text" name="registerUnit" required=true missingMessage="立案单位不能为空!"
								class="f1 easyui-textbox" /></td>
					<th width="10%"><span class="c-red">*</span>立案时间：</th>
							<td><input type="text" name="registerTime" required=true missingMessage="立案时间不能为空!"
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
                </tr>
                <tr>
                    <th width="10%"><span class="c-red">*</span>掌握信息方式：</th>
							<td>
							<input id="dicGraspTypeKey" name="dicGraspTypeKey" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_RECIDIVISM_PERHAPS&columnName=DIC_GRASP_TYPE_KEY&parentKey=96200',panelHeight:'auto'"
		    				required=true missingMessage="掌握信息方式不能为空!" style="width:173px;">
							</td>
                </tr>
                <tr>
                    <th width="10%"><span class="c-red">*</span>涉嫌重新犯罪情况：</th>
                    <td colspan="5" align="left" width="89%">
                    <textArea id="crimeDetails" name="crimeDetails" class="easyui-validatebox" style="width: 80%;height:50px;overflow:hidden;" required=true missingMessage="涉嫌重新犯罪情况不能为空!"
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
        	 $('#recidivismPerhapsForm').form('submit');
        }
        function clearForm(){
            $('#recidivismPerhapsForm').form('clear');
        }
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
        
	
    </script>

