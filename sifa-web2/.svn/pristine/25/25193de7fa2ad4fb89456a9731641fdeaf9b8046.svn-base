<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

 <form  action="${ctx}/endcorrect/death/save" method="post" id="deathAddform">
 	<c:choose>
 		<c:when test="${empty death.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="deathAddform" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${death.culpritId}" formId="deathAddform" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 
 	
     <div class="easyui-panel" title="死亡登记信息" style="width:100%;padding:5px;margin-bottom: 10px;">
           <input type="hidden" name="id" id="paroleId" />
            <table width="100%" class="grid">
				<tr>
					<th width="10%"><span class="c-red">*</span>死亡时间：</th>
					<td width="90%">
						<input name="deathlTime" id="deathlTime" class="Wdate easyui-validatebox" onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd'})" required=true missingMessage="死亡时间不能为空!"/>
					</td>
				<tr>
                    <th><span class="c-red">*</span>死亡原因：</th>
					<td><textArea id="deathReason" name="deathReason" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
						required=true missingMessage="死亡原因不能为空!"
						onkeydown='textarealength(this,800)' onKeyUp="textarealength(this,800)" onMouseOut='textarealength(this,800)' maxlength="800">${death.deathReason }</textArea>
						<p class="textarea-numberbar">
							备注：此处最多可以输入<em class="c-red">800</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
						</p>
					</td>
                </tr> 
                <tr>
                	<th><span class="c-red">*</span>具体死亡情况：</th>
					<td><textArea id="situation" name="situation" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
						required=true missingMessage="具体死亡情况不能为空!"
						onkeydown='textarealength(this,1000)' onKeyUp="textarealength(this,1000)" onMouseOut='textarealength(this,1000)' maxlength="1000">${death.situation }</textArea>
						<p class="textarea-numberbar">
							备注：此处最多可以输入<em class="c-red">1000</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
						</p>
					</td>
                </tr> 
	            <tr>
	            	<th>相关材料：</th>
	            	<td>
						<div id="deathUpload"></div>
	            	</td>
	            </tr>
            </table>           
    </div>
    </form>
<script type="text/javascript">
var reportType;
$(function() {
	$("#deathUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});

	$('#deathAddform').form({
		url:'${ctx}/endcorrect/death/save',
		onSubmit:function(){
   			progressLoad();
   			var isValid = $(this).form('validate');
            if (!isValid) {
            	progressClose();
            	return isValid;
            }
			return isValid;
		},
		success:function(data){
        	progressClose();
			data = JSON.parse(data);
			if(data.status==200){
   				$.messager.show({
   					title:'提示信息!' ,
   					msg:data.msg
   				});
				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
				parent.$.modalDialog.handler.dialog('close');
			}else{
				$.messager.show({
					title:'提示信息!' ,
					msg:data.msg
				});
			}
        			
		}
	});	
});
</script>
