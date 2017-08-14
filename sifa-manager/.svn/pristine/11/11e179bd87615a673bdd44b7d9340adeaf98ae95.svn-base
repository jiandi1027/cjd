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
<form id="verbalWarning" action="${ctx}/jiangcheng/verbalWarning/save" method="post">
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
                    <td><span style="color:red;">*</span>违纪原因:</td>
							<td align="left">
							 <select　id="dicReasonTypeKey" name="dicReasonTypeKey" class="easyui-combobox" required=true missingMessage="违纪原因不能为空!" style="width:150px;">
							 <option value=""></option>
                    	<c:forEach items="${fns:getSysDicList('SF_WARNING_ORAL','DIC_REASON_TYPE_KEY','78000') }" var="sysDic">
                    		<option value="${sysDic.key }">${sysDic.value}</option>
                    	</c:forEach>
                    </select>
                </tr>
                <tr>
                    <td><span style="color:red;">*</span>简要违纪情况:</td>
							<td align="left"><textarea rows="3" cols="124" id="detailInfo" name="detailInfo" class="f1 easyui-textbox" required=true missingMessage="简要违纪情况不能为空!" style="height:50px;"></textarea></td>
                </tr>
                 <tr>
                <td align="center" colspan="2">
                	<a id="btn1" href="javascript:void(0)" class="easyui-linkbutton" >提交</a>
	    			<a href="javascript:void(0)" class="easyui-linkbutton" >重置</a>
                </td>
                </tr>
            </table>
        
    </div> 	
     </form>
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
		if($('#verbalWarning').form('validate')==true){
			$('#verbalWarning').submit();
		}

	});
	
	
	//定义关闭按钮
	$('#btn2').click(function(){
		$('#verbalWarning').get(0).reset();
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
    	 $('#verbalWarning').form('load',arr[0]);
   	}
    }); 
	
	
})
</script>
</html>
