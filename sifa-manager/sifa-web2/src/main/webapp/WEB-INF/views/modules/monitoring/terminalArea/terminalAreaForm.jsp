<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form action="${ctx}/monitoring/terminalArea/addArea" method="post" id="bindingAddform">
	<div class="easyui-panel" style="width:100%; padding: 5px;margin:0 auto;">
        <input type="hidden" name="remark" id="remark" value="${remark }"/>
        <div align="center" style="margin-top: 20px;margin-bottom: 20px;">
			自定义地区名称：<input id="custompoName" name="custompoName" class="easyui-textbox" required="required"/>
		</div>
	</div>
</form>
<script>
function submitForm(){
	 $('#bindingAddform').form('submit');
}
function clearForm(){
    $('#bindingAddform').form('clear');
}
$(function() {
	$('#bindingAddform').form({
		url:'${ctx}/monitoring/terminalArea/addArea',
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

				for (var i = 0, l = polylineEditors.length; i < l; i++) {
       	   			polylineEditors[i].close();
       	   	    }
           	 	for (var i = 0, l = polygons.length; i < l; i++) {
           			polygons[i].setMap(null);
           		}
           		polygons = [];
				
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

$('#custompoName').textbox({ 
	onChange:function(newValue, oldValue){
		if(newValue==''){
			return;
		}
		$.ajax({
			type : 'post',
			url : '${ctx}/monitoring/terminalArea/iscustomponame?custompoName='+newValue,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			success : function(result) {
				if(result.status==500){
					$('#custompoName').textbox('setValue','');
  					$.messager.show({
   	  					title:'提示信息!',
   	  					msg:result.msg
   	  				});
				}
			}
		});
	}
}); 
</script>