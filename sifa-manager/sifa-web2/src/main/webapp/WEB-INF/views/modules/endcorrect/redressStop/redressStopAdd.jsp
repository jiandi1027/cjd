<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/endcorrect/redressStop/save" method="post" id="redressStopInfo">
	
	<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="redressStopInfo" isSelect="true"/>
	
	<div class="easyui-panel" title="特殊原因终止矫正信息" style="width:100%;padding:5px;margin: 0 auto;">
		<table width="100%" class="grid">
			<tr>
                <th width="10%"><span class="c-red">*</span>终止矫正日期：</th>
				<td width="90%"><input type="text" name="jjrq" id="jjrq" required=true missingMessage="终止矫正日期不能为空!" 
					class="f1 Wdate easyui-validatebox" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"/></td>
            </tr>
            <tr>
            	<th><span class="c-red">*</span>终止矫正原因：</th>
				<td colspan="5">
				<textArea id="jjsm" name="jjsm" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;" required=true missingMessage="终止矫正原因不能为空!" 
					onkeydown='textarealength(this,300)' onKeyUp='textarealength(this,300)' onMouseOut='textarealength(this,300)' maxlength="300"></textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
            </tr> 
            <tr>
                <th><span class="c-red">*</span>采取的措施和处理结果：</th>
				<td colspan="5">
				<textArea id="measure" name="measure" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;" required=true missingMessage="终止矫正原因不能为空!" 
					onkeydown='textarealength(this,800)' onKeyUp='textarealength(this,800)' onMouseOut='textarealength(this,800)' maxlength="800"></textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">800</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
            </tr>
            <tr style="display: none;">
	            <td>
			        <a href="javascript:void(0)" class="easyui-linkbutton">保存</a>
			  		<a href="javascript:void(0)" class="easyui-linkbutton">重置</a>
	            </td>
            </tr>
		</table>
	</div>
</form>
<script>
function submitForm(){
	 $('#redressStopInfo').form('submit');
}
function clearForm(){
    $('#redressStopInfo').form('clear');
}
$(function() {
	
	$('#redressStopInfo').form({
		url:'${ctx}/endcorrect/redressStop/save',
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
				
   				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                parent.$.modalDialog.handler.dialog('close');
			}else{
				$.messager.alert('提示消息',data.msg);
			}
		}
	});	
});

</script>