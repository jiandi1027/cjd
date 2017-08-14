<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>延长监外执行</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="${ctx}/dailymgr/outOfPrison/save" method="post" id="culpritInfo">
 	<c:choose>
 		<c:when test="${empty outOfPrison.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${outOfPrison.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 	<input type="hidden"  id="roleId" value="${sysAccount.roleId}"/>
    <div class="easyui-panel" title="申请相关信息" style="width:100%;padding:10px;">
     		<input type="hidden" name="id" value="${outOfPrison.id }"></input>
            <table width="100%">
                <tr>
                    <td width="10%">延长期限（月）：</td>
                    <td><input class="easyui-numberbox" data-options="min:0"  name="extendTime" value="${outOfPrison.extendTime }" /></td>
                </tr>
                <tr>
                     <td width="10%">延长期限开始时间：</td>
                    <td><input class="easyui-datebox"  value="${outOfPrison.startDate }" id="startDate" name="startDate" /></td>
                </tr>
                <tr>
                    <td width="10%">延长期限结束时间：</td>
                    <td><input class="easyui-datebox" value="${outOfPrison.endDate }" id="endDate" name="endDate"/></td>
                </tr>
                <tr>
                    <td>鉴定结果是否符合条件:</td>
                    <td><input type="radio" value="1" name="isConform" checked="checked"/>是&nbsp;&nbsp;&nbsp;
                    	<input type="radio" value="0" name="isConform"/>否
                    </td>
                </tr>
                <tr>
                    <td>有无明确期限:</td>
                    <td><input type="radio" value="1" name="isDeadline" checked="checked"/>有&nbsp;&nbsp;&nbsp;
                    	<input type="radio" value="0" name="isDeadline"/>无
                    </td>
                </tr>
                <tr>
                    <td>法律文书：</td>
                    <td colspan="5"><input type="file" multiple="multiple" name="lawNotePath" id="lawNotePath" value="上传"></input></td>
                </tr>
                <tr>
                    <td>已上传法律文书附件:</td>
                    <td><input name="lawNotePathName" id="lawNotePathName" value="${outOfPrison.lawNotePathName }" class="f1 easyui-textbox"></input></td>
                </tr> 
                
                 <tr>
                    <td>证据材料:</td>
                    <td><input type="file" name="notePath" id="notePath" value="上传"></input></td>
                </tr>
                <tr>
                    <td>已上传证据材料附件:</td>
                    <td><input name="notePathName" id="notePathName" value="${outOfPrison.notePathName }" class="f1 easyui-textbox"></input></td>
                </tr> 
                <tr rowspan="5">
                    <td><span class="c-red">*</span>申请延长原因及依据:</td>
							<td colspan="5"><input type="text" name="reason" multiline=true required=true missingMessage="申请延长原因及依据不能为空!"
								class="f1 easyui-textbox" value="${outOfPrison.reason }"  style="width:1100px;height:80px;"/></td>
                </tr> 
            </table>
    </div>
     <div align="center">
         <p colspan="4"> 
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveWithSubmit()">草拟建议书并上报</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="back()">返回</a>
		  </p>
    </div>
    <input type="hidden" name="decideType" id="decideType"/>
</form>
<script>
//保存并上报
function saveWithSubmit(){
	if($('#culpritInfo').form('validate')){
		$.messager.confirm('提示', '是否确定所有信息都已填写完整？上报后不能修改！', function(b){ 
	       if (b){ 
	    	   $.ajax({
					type: 'post' ,
					url: $("#culpritInfo").attr("action"),
					cache:false ,
					data:$('#culpritInfo').serialize() ,
					dataType:'json',
					success:function(data){
						var id=data.data; 
	       			 	var url = '${ctx}/dailymgr/outOfPrison/preSubmit?id=' + id;
			        		 open_layer('延长暂予监外执行建议书',url);
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
