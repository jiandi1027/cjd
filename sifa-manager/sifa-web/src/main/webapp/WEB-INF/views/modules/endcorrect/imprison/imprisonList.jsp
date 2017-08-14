<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>收监执行</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>


<body class="easyui-layout" id="lay">
	<div region="north" border="false" collapsed="true" title="搜索条件"
		style="height: 60px; overflow: hidden;" align="left">
		<form id="searchForm">
			<table>
				<tr>
					<td>所属司法部门：
						<input name="sysGroup.id" id="sysGroupId" style="width:80%;"  class="easyui-combotree"
						data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true"/>
					</td>
					<td>姓名：<input name="culprit.name" style="width:100px;" />&nbsp;</td>
					<td>创建时间：<input name="searchStartDate" class="easyui-datetimebox" editable="false" style="width: 100px;" /></td>
					<td>至：<input name="searchEndDate" class="easyui-datetimebox" editable="false" style="width: 100px;" />&nbsp;
						<a href="javascript:void(0);" class="easyui-linkbutton" id="searchbtn">搜索</a>
						<a href="javascript:void(0);" class="easyui-linkbutton" id="cleanSearch">取消</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_list_content" title="提请撤销暂予监外执行"
			style="height: 400px;"
			data-options="singleSelect:true,fit:true,rownumbers:true,collapsible:true,striped:true,toolbar:'#toolbar',loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/endcorrect/imprison/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80">编号</th>
					<th data-options="field:'culpritName',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">姓名</th>
					<th data-options="field:'groupName',width:100,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">司法所</th>
					<th data-options="field:'applyDate',width:120,align:'center',sortable:true"
						editor="text">申请提交时间</th>
					<th data-options="field:'dicImprisonTypeKey',width:120,align:'center',
						formatter:formatStatusKey">收监类型</th>
					<th data-options="field:'dicJudgeResultKey',width:200,align:'center',
						formatter:formatStatusKey1">裁定结果</th>
					<th data-options="field:'imprisonDealResult',width:200,align:'center',
						formatter:formatStatusKey2">处理结果</th>
				 	<th data-options="field:'_opt',width:200,formatter:formatOper,align:'center'">操作</th>  

				</tr>
			</thead>
		</table>
	</div>
	<div id="toolbar" style="display: none;">
		<a onclick="$('#lay').layout('expand', 'north');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">查询</a>  
	</div>
	<div id="caiding" class="easyui-window" title="裁定处理" style="width:450px;height250px;background:#c4d8ed"   
        data-options="closed:true">
        <form id="saveCaiding">
        <input type="hidden" name="id" id="imprisonId"/> 
        <table style="margin-left:30px;margin-top:10px">
        	<tr height=30>
        		<td align=right>裁定结果:</td>
        		<td><input type="radio" name="dicJudgeResultKey" value="91501" checked="checked"/>同意
        		&nbsp;&nbsp;&nbsp; &nbsp;
        		<input type="radio" name="dicJudgeResultKey" value="91502"/>拒绝
        		</td>
        	</tr>
        	<tr height=30>
        		<td align=right><span style="color:red">*</span>裁定机关名称:</td>
        		<td><input class="easyui-textbox" required=true missingMessage="请输入裁定机关名称" name="judgeOrg"/></td>
        	</tr>
        	<tr height=30>
        		<td align=right><span style="color:red">*</span>裁定时间:</td>
        		<td><input class= "easyui-datebox" required=true missingMessage="请填入裁定时间" name="judgeTime"/></td>
        	</tr>
        	<tr height=30>
        		<td align=right><span style="color:red">*</span>裁定文书:</td>
        		<td><input type="file" name="judgePathName"/></td>
        	</tr>
         </table>
         </form>
         <div align="center" padding="20px 30px 40px 50px">
         <p colspan="4" > 
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveCaiDing();">确定</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick=" $('#caiding').window('close');">取消</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  </p>
    	</div>
	</div> 
	<div id="shoujian" class="easyui-window" title="收监处理" style="width:450px;height250px;background:#c4d8ed"   
        data-options="closed:true">
        <form id="saveShoujian">  
        <input type="hidden" name="id" id="imprisonId1"/> 
        <table style="margin-left:30px;margin-top:10px">
        	<tr height=100>
        		<td align=right>收监处理：</td>
        		<td height=100>
        			<p><input type="radio" name="imprisonDealResult" value="91401" checked="checked"/>完成收监
        				&nbsp;&nbsp;&nbsp; &nbsp;
        				<input type="radio" name="imprisonDealResult" value="91402"/>在逃
        			<p>
        			<p><input type="radio" name="imprisonDealResult" value="91403"/>监狱拒收
        				&nbsp;&nbsp;&nbsp; &nbsp;
        				<input type="radio" name="imprisonDealResult" value="91404"/>死亡
        			<p>
        			<p><input type="radio" name="imprisonDealResult" value="91405" />监狱管理局驳回<p>
        		</td>
        	</tr>
        	<tr height=30 id="t1">
        		<td align=right><span style="color:red">*</span>收监时间：</td>
        		<td><input class= "easyui-datebox" required=true missingMessage="请填入收监时间" name="imprisonDate" id="imprisonDate"/></td>
        	</tr>
        	<tr height=30 id="t2">
        		<td align=right><span style="color:red">*</span>关押监狱名称：</td>
        		<td><input class="easyui-textbox" required=true missingMessage="请输入监狱名称" name="prisonName" id="prisonName"/></td>
        	</tr>
        	<tr height=30 id="t3" >
        		<td align=right><span style="color:red">*</span>通报时间：</td>
        		<td><input class= "easyui-datebox" required=true missingMessage="请填入通报时间" name="reportDate" id="reportDate"/></td>
        	</tr>
        	<tr height=30 id="t4">
        		<td align=right><span style="color:red">*</span>公安机关名称：</td>
        		<td><input class="easyui-textbox" required=true missingMessage="请输入公安机关名称" name="organizationName" id="organizationName"/></td>
        	</tr>
        	<tr height=30 id="t5">
        		<td align=right><span style="color:red">*</span>通报人：</td>
        		<td><input class="easyui-textbox" required=true missingMessage="请输入通报人" name="reportPersonName" id="reportPersonName"/></td>
        	</tr>
        	<tr height=30 id="t7">
        		<td align=right><span style="color:red">*</span>理由：</td>
        		<td><input class="easyui-textbox" style="height:50px;width:300px;" 
        			required=true missingMessage="请输入理由" name="opposeReason" id="opposeReason"/></td>
        	</tr>
        	<tr height=30 id="t6">
        		<td align=right><span style="color:red">*</span>相关材料:</td>
        		<td><input type="file" name="endCasePath" id="endCasePath"/></td>
        	</tr>
        	
        </table>
        </form>
         <div align="center" padding="20px 30px 40px 50px">
         <p colspan="4" > 
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveShoujian()">确定</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick=" $('#shoujian').window('close');">取消</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  </p>
    	</div>
	</div>   
</body>
<script type="text/javascript">
$(function() {
	//不同收监结果处理
	 var results =$('input[name="imprisonDealResult"]'); 
	 if($('input[name="imprisonDealResult"]:checked').val()=='91401'){
		$('#t3').css("display","none");
		$('#t4').css("display","none");
		$('#t5').css("display","none");
		$('#t6').css("display","none");
		$('#t7').css("display","none");
		$('#imprisonDate').datebox({disabled:false});
		$('#prisonName').textbox({disabled:false});
		$('#reportDate').datebox({disabled:true});
		$('#organizationName').textbox({disabled:true});
		$('#reportPersonName').textbox({disabled:true});
		$('#opposeReason').textbox({disabled:true});
	} 
	 for(var i=0;i<results.length;i++){
		results[i].onclick=function(){
			var result=$('input[name="imprisonDealResult"]:checked').val();
			if(result=='91401'){
				$('#t1').show();
				$('#t2').show();
				$('#t3').css("display","none");
				$('#t4').css("display","none");
				$('#t5').css("display","none");
				$('#t6').css("display","none");
				$('#t7').css("display","none");
				$('#imprisonDate').datebox({disabled:false});
				$('#prisonName').textbox({disabled:false});
				$('#reportDate').datebox({disabled:true});
				$('#organizationName').textbox({disabled:true});
				$('#reportPersonName').textbox({disabled:true});
				$('#opposeReason').textbox({disabled:true});
			}else if(result=='91402'){
				$('#t1').css("display","none");
				$('#t2').css("display","none");
				$('#t3').show();
				$('#t4').show();
				$('#t5').show();
				$('#t6').css("display","none");
				$('#t7').css("display","none");
				$('#imprisonDate').datebox({disabled:true});
				$('#prisonName').textbox({disabled:true});
				$('#reportDate').datebox({disabled:false});
				$('#organizationName').textbox({disabled:false});
				$('#reportPersonName').textbox({disabled:false});
				$('#opposeReason').textbox({disabled:true});
			}else{
				$('#t1').css("display","none");
				$('#t2').css("display","none");
				$('#t3').css("display","none");
				$('#t4').css("display","none");
				$('#t5').css("display","none");
				$('#t6').show();
				$('#t7').show();
				$('#imprisonDate').datebox({disabled:true});
				$('#prisonName').textbox({disabled:true});
				$('#reportDate').datebox({disabled:true});
				$('#organizationName').textbox({disabled:true});
				$('#reportPersonName').textbox({disabled:true});
				$('#opposeReason').textbox({disabled:false});
			}
		}
	} 
	 
	
	
	$.formatString = function(str) {
		for ( var i = 0; i < arguments.length - 1; i++) {
			str = str.replace("{" + i + "}", arguments[i + 1]);
		}
	return str;
	}
	
	$('#searchbtn').click(
		function() {
			$('#t_list_content').datagrid('load',serializeForm($('#searchForm')));
		});
	//取消按钮
	$('#cleanSearch').click(function(){
		$('#searchForm').get(0).reset(); //清空表单数据 
		$('#t_list_content').datagrid('load', {});
		$('#lay').layout('collapse', 'north');
	});

	//js方法：序列化表单 			
	function serializeForm(form) {
		var obj = {};
		$.each(form.serializeArray(),
				function(index) {
					if (obj[this['name']]) {
						obj[this['name']] = obj[this['name']] + ','
								+ this['value'];
					} else {
						obj[this['name']] = this['value'];
					}
				});
		return obj;
	}
});

//保存裁定处理
function saveCaiDing(){
	 if($("#saveCaiding").form('validate')){
			$.ajax({
				type: 'post' ,
				url: '${ctx}/endcorrect/imprison/save',
				cache:false ,
				data:$('#saveCaiding').serialize() ,
				dataType:'json',
				success:function(data){
					$.messager.show({
	  					title:'提示信息!',
	  					msg:data.msg
	  				});
					$('#caiding').window('close');
					$('#t_list_content').datagrid('load', {});
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
 
//保存收监处理
function saveShoujian(){
	 if($("#saveShoujian").form('validate')){
			$.ajax({
				type: 'post' ,
				url: '${ctx}/endcorrect/imprison/save',
				cache:false ,
				data:$('#saveShoujian').serialize() ,
				dataType:'json',
				success:function(data){
					$.messager.show({
	  					title:'提示信息!',
	  					msg:data.msg
	  				});
					$('#shoujian').window('close');
					$('#t_list_content').datagrid('load', {});
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
 
 
	
	
function formatRole(value, row, index) {
	var str = '';
	$.ajax({
		type : 'get',
		url : '${ctx}/sys/sysRole/findById?id=' + value,
		cache : false,
		async : false, //同步请求
		dataType : 'json',
		success : function(result) {
			str = result.name;
		}
	});
	return str;

}
function delHsCode(index) {  
       $('#Hsdata').datagrid('selectRow', index);  
       var row = $('#Hsdata').datagrid('getSelected');  
       if (row.Id != null && row.Id !== undefined)  
       alert(row.Id);  
   }  

function formatOper(val,row,index){  
	var operation=$.formatString('<a href="javascript:detail(\'{0}\');"  title="详细"><span style="color:blue;"><strong><u>详细</u><strong></span></a>', row.id);
	if(row.dicJudgeResultKey=='' || row.dicJudgeResultKey==null){
		operation=operation+'&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:caiding(\'{0}\');"  title="裁定收监"><span style="color:blue;"><strong><u>裁定收监</u><strong></span></a>', row.id);
	}
	if(row.imprisonDealResult!='91401' && row.imprisonDealResult!='91404'){
		operation=operation+'&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:shoujian(\'{0}\');"  title="收监处理"><span style="color:blue;"><strong><u>收监处理</u><strong></span></a>', row.id);
	}
	return operation;
} 

function caiding(id){
	$('#imprisonId').val(id);
	$('#caiding').window('open');
}
function shoujian(id){
	$('#imprisonId1').val(id);
	 $('#shoujian').window('open');
}


//详细
function detail(id){
	var url = '${ctx}/endcorrect/imprison/detail?id=' + id;
	open_layer('收监执行详细',url);
}


function open_layer(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}


function formatStatusKey(value, row, index){
	var str = '';
	$.ajax({
		type : 'post',
		url : '${ctx}/sys/sysDic/getDicValue?tabName=comme_table&columnName=DIC_IMPRISON_TYPE_KEY&key='+value,
		cache : false,
		async : false, //同步请求
		data : {
			id : value
		},
		dataType : 'json',
		success : function(result) {
			if(result!=null){
				str = result.value;
			}
			
		}
	});
	return str;
}

function formatStatusKey1(value, row, index){
	var str = '<span style="color:red">待处理<span>';
	$.ajax({
		type : 'post',
		url : '${ctx}/sys/sysDic/getDicValue?tabName=SF_IMPRISON&columnName=DIC_JUDGE_RESULT_KEY&key='+value,
		cache : false,
		async : false, //同步请求
		data : {
			id : value
		},
		dataType : 'json',
		success : function(result) {
			if(result!=null){
				str = result.value;
			}
		}
	});
	return str;
}

function formatStatusKey2(value, row, index){
	var str = '<span style="color:red">待处理<span>';
	$.ajax({
		type : 'post',
		url : '${ctx}/sys/sysDic/getDicValue?tabName=SF_IMPRISON&columnName=IMPRISON_DEAL_RESULT&key='+value,
		cache : false,
		async : false, //同步请求
		data : {
			id : value
		},
		dataType : 'json',
		success : function(result) {
			if(result!=null){
				str = result.value;
			}
		}
	});
	return str;
}

	
	
</script>

</html>
