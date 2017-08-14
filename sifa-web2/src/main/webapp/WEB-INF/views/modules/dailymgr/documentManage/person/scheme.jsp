<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
<form id="scheme_saveform" method="post">
     <input type="hidden" name="id" value="${scheme.id }" />
	 <input type="hidden" name="culpritId" value="${scheme.culpritId }" />
		<table width="100%" class="grid">
				<tr>
                    <th width="15%"><span class="c-red">*</span>矫正方案名称：</th>
                    <td>
                    <textarea  name="schemeName" class="easyui-validatebox"  multiline="true"  required=true missingMessage="方案名称不能为空!"
						onkeydown='textarealength(this,100)' onkeyup='textarealength(this,100)' 
							style="width:400px;height:18px;overflow:hidden;" maxlength=100>${scheme.schemeName }</textarea>
						<br/>
						<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">100</em>个字，你已输入<em class="textarea-length c-red">${fn:length(scheme.schemeName)}</em>个字。
						</p>
                    </td>
                </tr>
                 <tr>
                    <th><span class="c-red">*</span>矫正意见：</th>
					<td>
					<textarea  name="schemeOpinion"  class="easyui-validatebox"  multiline="true" 
						onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)'  required=true
							style="width:600px;height:200px;overflow:hidden;" maxlength=200>${scheme.schemeOpinion }</textarea>
						<br/>
						<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">${fn:length(scheme.schemeOpinion)}</em>个字。
						</p>
					</td>
                </tr> 
                <tr>
                    <th><span class="c-red">*</span>矫正措施：</th>
					<td>
					<textarea  name="schemeStep" class="easyui-validatebox"  multiline="true"
						onkeydown='textarealength(this,500)' onkeyup='textarealength(this,500)'  required=true
							style="width:600px;height:200px;overflow:hidden;" maxlength=500>${scheme.schemeStep }</textarea>
						<br/>
						<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">500</em>个字，你已输入<em class="textarea-length c-red">${fn:length(scheme.schemeStep)}</em>个字。
						</p>
					</td>
                </tr>
			</table>
</form>
</div>	
<div style="text-align: center;display: none;">
	    <a id="scheme_saveform_btn" class="easyui-linkbutton" >保存</a>
</div>
   <script type="text/javascript">
$(function() {
	$('#scheme_saveform').form({
		url:'${ctx}/sys/scheme/save',
		onSubmit:function(){
			 progressLoad();
			/*  var isValid = $(this).form('validate');
             if (!isValid) {
                 progressClose();
             }
             return isValid; */
		},
		success:function(data){
			progressClose();
			$.messager.show({
				title:'提示信息!' ,
				msg:'保存成功！'
			});
			 $('#schemeDialog').dialog('close');
			 $('#scheme_content').datagrid('reload');
		},
		error : function(data) {
			 parent.$.messager.alert('错误', '保存失败', 'error');
		}
	});	
	
	
	
	$('#scheme_saveform_btn').click(function(){
		$('#scheme_saveform').form('submit');
	});
	
	

});

</script>