<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>口头警告</title>
<%@include file="/WEB-INF/views/include/head.jsp" %>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>
<body>
	<c:choose>
 		<c:when test="${empty verbalWarning.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${verbalWarning.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 	
 	<div class="easyui-panel" id="p2" title="口头警告信息" style="width:100%;padding:10px;">
            <table width="100%">
                <tr>
                    <td width="15%">违纪原因:</td>
							<td>${fns:getSysDicValueByKey('SF_WARNING_ORAL','DIC_REASON_TYPE_KEY',warningOral.dicReasonTypeKey,'')}</td>
                </tr>
                <tr>
                    <td width="15%">简要违纪情况:</td>
							<td>${warningOral.detailInfo }</td>
                </tr>
            </table>
    </div>
    <div class="easyui-panel" id="p2" title="口头警告信息" style="width:100%;padding:10px;">
    	<form id="myform" action="${ctx}/jiangcheng/verbalWarning/check" method="post">
    	<input type="hidden" name="id" id="id" value="${warningOral.id}" />
		<input type="hidden" name="processInstanceId" id="processInstanceId" value="${warningOral.processInstanceId}" />
            <table width="100%">
                <tr>
                    <td>审批意见:</td>
							<td align="left"><textarea rows="3" cols="124" id="opinion" name="opinion"></textarea></td>
                </tr>
                 <tr>
                <td align="center" colspan="2">
                	<a id="btn1" href="javascript:void(0)" class="easyui-linkbutton" >提交</a>
                </td>
                </tr>
            </table>
         </form>
    </div> 	
</body>
<script type="text/javascript">
$(function(){
	
	$('.panel-tool-collapse').toggle(
			function(){$('#dd').panel('collapse',true)},
			function(){$('#dd').panel('expand',true)});
	/**
	 *  提交表单方法
	 */
	$('#btn1').click(function(){
		$('#myform').submit();
		/*	if($('#myform').form('validate')){
				$.ajax({
					type: 'post' ,
					url: '${ctx}/jiangcheng/verbalWarning/save' ,
					cache:false ,
					data:$('#myform').serialize() ,
					dataType:'json' ,
					success:function(result){
						$('#myform').get(0).reset();
						//1 关闭窗口
						$('#mydialog').dialog('close');
						//2刷新datagrid 
						$('#listContent').datagrid('reload',{});
						//3刷新combotree
						$('#cc').combotree('reload');
						
						//4 提示信息
						$.messager.show({
							title:result.status==200?"ok":"fail" , 
							msg:result.msg
						});
					} ,
					error:function(result){
						$.meesager.show({
							title:result.status==200?"ok":"fail" ,  
							msg:result.msg
						});
					}
				});
			} else {
				$.messager.show({
					title:'提示信息!' ,
					msg:'数据验证不通过,不能保存!'
				});
			}*/
		});
	
	
	//定义关闭按钮
	$('#btn2').click(function(){
		$('#myform').get(0).reset();
		history.go(-1);
	});
	
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
	
	//新增资源时选择下拉选图标
	$('#iconCls').combobox({
		data:$.iconData,
		formatter : function(v) {
			return $.formatString('<span class="{0}" style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span>{1}', v.value, v.value);
		}
	}); 
	
	
})
</script>
</html>
