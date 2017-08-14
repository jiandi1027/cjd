<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form action="${ctx}/dailymgr/askLeave/save" method="post" id="culpritInfo">
	<input type="hidden" name="id" id="id" value="${askLeave.id}" />
	<c:choose>
		<c:when test="${empty askLeave.culpritId }">
			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true" />
		</c:when>
		<c:otherwise>
			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" 
				required="false" hiddenValue="${askLeave.culpritId}" formId="culpritInfo" isSelect="false" />
		</c:otherwise>
	</c:choose>

	<div class="easyui-panel" title="请假信息" style="width: 100%; padding: 5px;margin: 0 auto;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%"><span class="c-red">*</span>申请日期：</th>
				<td width="23%"><input type="text" name="doDate" id="doDate" value="<fmt:formatDate value="${askLeave.doDate}" pattern="yyyy-MM-dd" />"
					required=true missingMessage="申请日期不能为空!" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
				<th width="10%"><span class="c-red">*</span>外出目的地：</th>
				<td width="23%"><input type="text" name="place" value="${askLeave.place }"
					required=true missingMessage="外出目的地不能为空!" class="f1 easyui-textbox" /></td>
				<th width="10%">经手人：</th>
				<td width="23%"><input type="text" name="approvePerson"
					value="${account.accountname }"
					class="f1 easyui-textbox easyui-validatebox" /></td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>请假开始时间：</th>
				<td><input name="beginDate" id="beginDate"
					class="Wdate easyui-validatebox" required=true missingMessage="请假开始时间不能为空!"
					value="<fmt:formatDate value="${askLeave.beginDate }" pattern="yyyy-MM-dd" />"
					onfocus="var endDate=$dp.$('endDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){endDate.focus();},maxDate:'#F{$dp.$D(\'endDate\')}'})" />
				</td>
				<th><span class="c-red">*</span>请假截止时间：</th>
				<td><input name="endDate" id="endDate"
					class="Wdate easyui-validatebox" required=true
					missingMessage="请假截止时间不能为空!"
					value="<fmt:formatDate value="${askLeave.endDate }" pattern="yyyy-MM-dd" />"
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'beginDate\')}'})" />
				</td>
				<th><span class="c-red">*</span>活动范围：</th>
				<td><input type="text" name="activeArea"
					value="${askLeave.activeArea }" required=true
					missingMessage="活动范围不能为空!" class="f1 easyui-textbox" /></td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>请假理由：</th>
				<td colspan="5"><textArea id="reason" name="reason" class="easyui-validatebox" required=true missingMessage="请假理由不能为空!" 
					style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,100)' onKeyUp='textarealength(this,100)' onMouseOut='textarealength(this,100)' maxlength="100">${askLeave.reason}</textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">100</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
			</tr>
		</table>
	</div>
	<div class="easyui-panel" title="被访问者基本信息" style="width: 100%; padding: 5px; margin-bottom: 10px;margin: 0 auto;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">被访问者姓名：</th>
				<td width="23%"><input type="text" name="askName"
					value="${askLeave.askName }"
					class="f1 easyui-textbox easyui-validatebox" /></td>
				<th width="10%">与矫正对象关系：</th>
				<td width="23%"><input type="text" name="relation"
					value="${askLeave.relation }"
					class="f1 easyui-textbox easyui-validatebox" /></td>
				<th width="10%">职业及工作单位：</th>
				<td width="23%"><input type="text" name="job" id="job"
					value="${askLeave.job }"
					class="f1 easyui-textbox easyui-validatebox" /></td>
			</tr>
			<tr>
				<th>政治面貌：</th>
				<td><input type="text" name="dicPoliticStatusKey"
					class="f1 easyui-textbox easyui-validatebox"
					value="${askLeave.dicPoliticStatusKey }" /></td>
				<th>家庭住址：</th>
				<td colspan="3"><input type="text" name="askAddress"
					class="f1 easyui-textbox easyui-validatebox"
					value="${askLeave.askAddress}" /></td>
			</tr>
		</table>
	</div>
</form>
<script>
function submitForm(){
	 $('#culpritInfo').form('submit');
}
function clearForm(){
    $('#culpritInfo').form('clear');
}
$(function() {
  	$('#culpritInfo').form({
  		url:'${ctx}/dailymgr/askLeave/save',
  		onSubmit:function(){
  			 progressLoad();
  			 var isValid = $(this).form('validate');
             if (!isValid) {
                 progressClose();
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
  				parent.$.messager.alert('错误', result.msg, 'error');
  			}
  		}
  	});	
});
        
	
</script>
