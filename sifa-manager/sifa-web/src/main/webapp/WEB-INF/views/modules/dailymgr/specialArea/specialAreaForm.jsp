<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>进入特定区域管理</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="${ctx}/dailymgr/specialArea/save" method="post" id="culpritInfo">
 	<c:choose>
 		<c:when test="${empty specialArea.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${specialArea.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 	<input type="hidden"  id="roleId" value="${sysAccount.roleId}"/>
    <div class="easyui-panel" title="申请相关信息" style="width:100%;padding:10px;">
     		<input type="hidden" name="id" value="${specialArea.id }"></input>
            <table width="100%">
                <tr>
                   <td width="10%"><span class="c-red">*</span>申请提交时间:</td>
				   <td><input type="text" name="applyDate" id="applyDate" value="<fmt:formatDate value="${specialArea.applyDate}"
									pattern="yyyy-MM-dd" />" required=true missingMessage="提交时间不能为空!"
								class="f1 easyui-datebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
					<td width="10%"><span class="c-red">*</span>申请进入时间:</td>
				   <td><input type="text" name="startDate" id="startDate" value="<fmt:formatDate value="${specialArea.startDate}"
									pattern="yyyy-MM-dd" />" required=true missingMessage="进入时间不能为空!"
								class="f1 easyui-datebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
				<td width="10%"><span class="c-red">*</span>申请离开时间:</td>
				   <td><input type="text" name="endDate" id="endDate" value="<fmt:formatDate value="${specialArea.endDate}"
									pattern="yyyy-MM-dd" />" required=true missingMessage="离开时间不能为空!"
								class="f1 easyui-datebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
              
                </tr>
                <tr>
                    <td><span class="c-red">*</span>申请进入区域:</td>
					<td colspan="5"><input type="text" name="area" value="${specialArea.area }" required=true missingMessage="进入区域不能为空!"
								class="f1 easyui-textbox" /></td>
                </tr>
                <tr rowspan="5">
                    <td><span class="c-red">*</span>申请原因:</td>
					<td colspan="5"><input type="text" name="reason" value="${specialArea.reason }" required=true missingMessage="申请原因不能为空!"
								class="f1 easyui-textbox"  style="width:1100px;height:80px;"/></td>
                </tr>
                 <tr rowspan="5">
                    <td>备注:</td>
					<td colspan="5"><input type="text" name="note" value="${specialArea.note }"
								class="f1 easyui-textbox"  style="width:1100px;height:80px;"/></td>
                </tr>
                
            </table>
    </div>
     <div align="center">
         <p colspan="4"> 
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveWithSubmit()">申请</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="back()">返回</a>
		  </p>
    </div>
    <input type="hidden" name="decideType" id="decideType"/>
</form>
<script>
//申请
function saveWithSubmit(){
	if($('#culpritInfo').form('validate')){
		$.messager.confirm('提示', '是否确定所有信息都已填写完整？申请后不能修改！', function(b){ 
	       if (b){ 
	    	   $.ajax({
					type: 'get' ,
					url: '${ctx}/dailymgr/specialArea/submitSpecialArea',
					cache:false ,
					data:$('#culpritInfo').serialize() ,
					dataType:'json',
					success:function(data){
						parent.location.reload();
		      			var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);
					} ,
					error:function(data){
						$.messager.show({
		  					title:'提示信息!',
		  					msg:data.msg
		  				});
					}
				});
			}else{
				 $.messager.show({
					title:'提示信息!' ,
					msg:'验证失败！请检查数据是否已填写完整!'
				}); 
	      	} 
		});
	}
};
	 	
//保存
 function submitForm(){
	var startDate=$("#startDate").datebox('getValue');
	var endDate=$("#endDate").datebox('getValue');
	if(startDate!=null && endDate!=null){
		if(endDate<=startDate){
			$.messager.show({
					title:'提示信息!',
					msg:'延长期限开始或结束时间错误，请重新输入！'
				});
			return;
		}
	}
	if($("#culpritInfo").form('validate')){
			$.ajax({
				type: 'post' ,
				url: $("#culpritInfo").attr("action"),
				cache:false ,
				data:$('#culpritInfo').serialize() ,
				dataType:'json',
				success:function(data){
					$.messager.show({
	  					title:'提示信息!',
	  					msg:data.msg
	  				});
	  				parent.location.reload();
	      			var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
				} ,
				error:function(data){
					$.messager.show({
	  					title:'提示信息!',
	  					msg:data.msg
	  				});
				}
			});
		}else{
			 $.messager.show({
				title:'提示信息!' ,
				msg:'验证失败！请检查数据是否已填写完整!'
			}); 
		} 
 }
 
 function clearForm(){
     $('#culpritInfo').form('clear');
 }
 
 function back(){
	 parent.location.reload();
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
 }
	     
 //js方法：序列化表单 			
function serializeForm(form){
	var obj = {};
	$.each(form.serializeArray(),function(index){
		if(obj[this['name']]){
			obj[this['name']] = obj[this['name']] + ','+this['value'];
		} else {
			obj[this['name']] =this['value'];
		}
	});
	return obj;
}
 
function open_layer(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}    
	   
$(function() {     
  	$('#culpritId').combogrid({    
   	delay: 500,
   	panelWidth: 300, 
   	striped:true,
   	panelHeight: 300,
	mode: 'remote',  
	idField: 'id',
	textField: 'name',
	url: '${ctx}/culpritinfo/culprit/list',
	columns: [[
		{field:'name',title:'姓名',width:120,align:'center'},
		{field:'dicSexKey',title:'性别',width:80,align:'center'}
	]],
	fitColumns: true,
	pagination: true,           //是否分页  
	     rownumbers: true,           //序号  
	     collapsible: false,         //是否可折叠的  
	     method: 'post',
	     onSelect:function(record){
	     	 var arr = $('#culpritId').combogrid('grid').datagrid('getSelections');
	     	 $('#culpritInfo').form('load',arr[0]);
	    	}
	     }); 
	     
	     
	   //取得分页组件对象  
	     var pager = $('#culpritId').combogrid('grid').datagrid('getPager');  
	     if (pager) {  
	         $(pager).pagination({  
	             pageSize: 10,               //每页显示的记录条数，默认为10  
	             beforePageText: '第',       //页数文本框前显示的汉字  
	             afterPageText: '',
	             displayMsg: ''
	         });  
	     }
	 
	     
});
	     
	
</script>
</body>
</html>
