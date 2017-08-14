<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="${ctx}/jiangcheng/revokeProbation/save" method="post" id="culpritInfo">
 	<c:choose>
 		<c:when test="${empty revokeProbation.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${revokeProbation.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
     
    <div class="easyui-panel" title="撤销缓刑相关信息" style="width:100%;padding:10px;">
     		<input type="hidden" name="id" value="${revokeProbation.id }"></input>
            <table width="100%">
                <tr>
                    <td><span class="c-red">*</span>违纪原因：</td>
                    <td colspan="5">
                    	<input type="hidden" id="reasonTypeId1" value="${fns:getSysDicValueByKey('sf_revoke_probation','REASON_TYPE_ID',revokeProbation.reasonTypeId,'')}"/>
                    	<select  id="reasonTypeId" name="reasonTypeId" editable=false required=true missingMessage="违纪原因不能为空!" value="${revokeProbation.reasonTypeId }" class="easyui-combobox">
									<option value="80001">未按时报到或脱离监管</option>   
							    	<option value="80002">违反监管管理，收到治安管理处罚后不改正</option>   
							    	<option value="80003">收到3次警告不改正</option>   
							   	 	<option value="80004">违反禁止令，情节严重</option>   
							    	<option value="80005">违反其他监督管理，情节严重</option> 
							</select ></td>
                </tr>
                <tr>
                    <td>结案报告:</td>
                    <td><input type="file" multiple="multiple" name="endCasePath" id="endCasePath" value="上传"></input></td>
                </tr>
                <%-- <tr>
                    <td>已上传附件:</td>
                    <td><input name="endCasePathName" id="endCasePathName" value="${revokeProbation.endCasePath }" class="f1 easyui-textbox"></input></td>
                </tr> --%>
                
                 <tr>
                    <td>证据材料:</td>
                    <td><input type="file" name="notePath" id="notePath" value="上传"></input></td>
                </tr>
                <%-- <tr>
                    <td>已上传附件:</td>
                    <td><input name="notePathName" id="notePathName" value="${revokeProbation.notePath }" class="f1 easyui-textbox"></input></td>
                </tr> --%>
                <tr rowspan="5">
                    <td><span class="c-red">*</span>简要违纪情况：</td>
							<td colspan="5"><input type="text" multiline=true name="detailInfo" required=true missingMessage="简要描述不能为空!"
								class="f1 easyui-textbox" value="${revokeProbation.detailInfo }"  style="width:800px;height:80px;"/></td>
                </tr> 
                <tr rowspan="5">
                    <td><span class="c-red">*</span>处理依据：</td>
							<td colspan="5"><input type="text" multiline=true name="fact" required=true missingMessage="简要描述不能为空!"
								class="f1 easyui-textbox" value="${revokeProbation.fact }" style="width:800px;height:80px;"/></td>
                </tr>
                <tr>
                    <td>短信发送至：</td>
					<td></td>
                </tr>  
            </table>
    </div>
     <div align="center">
         <p colspan="4"> 
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存草稿</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveWithSubmit()">保存草稿并上报</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="back()">返回</a>
		  </p>
    </div>
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
	       			 	var url = '${ctx}/jiangcheng/revokeProbation/preSubmit?id=' + id;
			        		 open_layer('撤销缓刑建议书',url);
					} ,
					error:function(result){
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
				error:function(result){
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

function back(){
	 parent.location.reload();
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
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
	
	     //下拉选赋值
      	var value=$("#reasonTypeId1").val();
	     $("#reasonTypeId").combobox('setValue',value);
	     
});
	     
	
</script>
</body>
</html>
