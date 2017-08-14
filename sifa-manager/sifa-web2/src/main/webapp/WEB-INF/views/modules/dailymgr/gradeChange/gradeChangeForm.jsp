<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
 <form  action="${ctx}/dailymgr/gradeChange/save" method="post" id="gradeChangeInfo">
 	<input type="hidden" name="dicOldMonitorGradeKey" id="dicOldMonitorGradeKey" value="${culprit.dicMonitorGradeKey }">
 	<c:choose>
 		<c:when test="${empty gradeChange.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${gradeChange.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 
 	
     <div class="easyui-panel" title="相关信息" style="width:100%;padding:5px;margin-bottom: 30px;">
           <input type="hidden" name="id" id="gradeChangeId" value="${gradeChange.id }"></input>
            <table width="100%" class="grid">
            	
                <tr>
                    <th width="10%"><span class="c-red"></span>原监管等级：</th>
                    <td  width="90%" >${fns:getSysDicValueByKey('sf_culprit','dic_gldxjb_key',culprit.dicMonitorGradeKey ,'')} </td>
                    
                </tr>
                <tr>
                	<th ><span class="c-red">*</span>新监管等级：</th>
                    <td  ><input name="dicMonitorGradeKey" id="dicMonitorGradeKey" class="easyui-combobox" required=true  style="width:200px;"
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=27000&key=${culprit.dicMonitorGradeKey }',panelHeight:'auto',editable:false"></input></td>
                </tr>
        
                <tr >
                    <th><span class="c-red"></span>修改原因及依据：</th>
							<td >
								<textArea id="accountOpinion" name="accountOpinion" class="easyui-validatebox" style="width:800px;height:80px;overflow:hidden;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200"></textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
								</td>
                </tr> 
                <tr >
                    <th><span class="c-red"></span>司法所意见：</th>
							<td >
								<textArea id="SFSOpinion" name="SFSOpinion" class="easyui-validatebox" style="width:800px;height:80px;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200"></textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
								</td>
                </tr>
                 <tr>
                    <th>相关材料：</th>
                    <td ><div id="evidencePath" ></div></td>
                </tr>
            </table>           
    </div>
    </form>
    <script type="text/javascript">


    $(function() {
    	
    	$("#evidencePath").powerWebUpload({ auto: true,fileNumLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
    	//保存上报
        
        
        //$('#dicMonitorGradeKey').combobox('setValues', ['27003','27004','27005']);
      	$('#gradeChangeInfo').form({
        		url:'${ctx}/dailymgr/gradeChange/save',
        		onSubmit:function(){
        			return $(this).form('validate');
        		},
        		success:function(data){
        			data = JSON.parse(data);
        			if(data.status==200){
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        				parent.$.modalDialog.handler.dialog('close');
    					
        			}else{
        				alert(data.msg);
        			}
        			
        		}
      	});

        $('#dicMonitorGradeKey1').combobox({
        	onSelect: function(record){
        		var value;
        		if(record.id=='27003'){
        			value=121000;
        		}
        		if(record.id=='27004'){
        			value=83000;
        		}
        		if(record.id=='27005'){
        			value=88000;
        		}
        		$('#dicChangeReasonKey').combobox({
        			
        			url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey='+value,    
        			panelHeight:'200',
        			valueField:'id',    
        		    textField:'value'   
        		});
        		$('#dicChangeReasonKey').combobox({ disabled: false });
			}
		})
    });
    </script>
