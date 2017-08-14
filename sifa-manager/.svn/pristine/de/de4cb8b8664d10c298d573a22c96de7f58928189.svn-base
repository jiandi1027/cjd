<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>口头警告</title>
<%@include file="/WEB-INF/views/include/head.jsp" %>
<style type="text/css">
	tr{text-align:right;}
</style>
</head>
<body>
	<div id="dd1" class="easyui-panel" title="新增口头警告">
		<div class="easyui-layout" data-options="fit:true" style="width:90%;height:90%;padding:10px;">
           <div data-options="region:'north',split:true" style="height:55%;padding:10px;">
           		<table style="margin:20px auto;padding:10px 400px 30px 40px; border:1px solid red;height:80%;width:90%;">
				<tr>
					<td>
						<span style="color:red;">*</span>姓名：<input id="culprit" name="culprit" value="423" required=true missingMessage="名称必填!">
					</td>
				</tr>
				<tr>
					<td>性别：<input type="text" name="url" /></td>
					<td>名族：<input type="text" name="url" /></td>
					<td>身份证号：<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td>曾用名：<input type="text" name="url" /></td>
					<td>出生日期：<input type="text" name="url" /></td>
					<td>文化程度：<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td>婚姻状况：<input type="text" name="url" /></td>
					<td>职业：<input type="text" name="url" /></td>
					<td>原政治面貌：<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td>籍贯：<input type="text" name="url" /></td>
					<td>户籍所在地：<input type="text" name="url" /></td>
					<td>现居住地：<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td >原判罪名：<input type="text" name="url" /></td>
					<td>刑期：<input type="text" name="url" /></td>
					<td>附加刑：<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td>刑期变动：<input type="text" name="url" /></td>
					<td>刑期开始日期：<input type="text" name="url" /></td>
					<td>刑期结束日期：<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td>刑法执行类别：<input type="text" name="url" /></td>
					<td>矫正开始日期：<input type="text" name="url" /></td>
					<td>矫正结束日期：<input type="text" name="url" /></td>
				</tr>
				<tr>
					<td>简要违纪情况：<input type="text"/></td>
					<td>简要违纪情况：<input type="text"/></td>
					<td>简要违纪情况：<input type="text"/></td>
				</tr>
			</table>
            </div>
            <div data-options="region:'center'" style="padding:10px">
            	<div id="dd" class="easyui-panel" title="口头警告信息" data-options="iconCls:'panel-tool-collapse'">
            	<form id="myform" action="${ctx}/jiangcheng/verbalWarning/save" method="post">
						<input type="hidden" name="id" id="editId" value="" />
						<input type="hidden" name="culpritId" id="culpritId" value="" />
						<table style="margin:20px auto;padding:10px 400px 30px 40px; border:1px solid red;height:65%;width:90%;">
						<tr>
							<td>
								<span style="color:red;">*</span>违纪原因：<input id="dicReasonTypeKey" name="dicReasonTypeKey" value="${warningOral.dicReasonTypeKey}" required=true missingMessage="名称必填!">
							</td>
						</tr>
						<tr>
							<td>证据材料：<input type="button" value="上传" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr>
							<td>悔过书：<input type="text" name="url" /></td>
						</tr>
						<tr>
							<td>已上传材料：<input type="text" name="url" /></td>
						</tr>
						<tr>
							<td colspan="3">简要违纪情况：<textarea rows="3" cols="124" id="detailInfo" name="detailInfo">${warningOral.detailInfo}</textarea></td>
						</tr>
						<tr>
							<!-- 此处两个td为仅仅用于占位 -->
							<td style="visibility:hidden;">简要违纪情：<input type="text"/></td>
							<td style="visibility:hidden;">简要违纪情：<input type="text"/></td>
							<td style="visibility:hidden;">简要违纪情：<input type="text"/></td>
						</tr>
						</table>
						<div align="center">
							<p colspan="3">
											<a id="btn2" class="easyui-linkbutton">关闭</a>
							</p>
						</div>
					</form>
				</div>
			</div>   	
        </div>
    </div>	 
</body>
<script type="text/javascript">
$(function(){
	
	$('.panel-tool-collapse').toggle(
			function(){$('#dd').panel('collapse',true)},
			function(){$('#dd').panel('expand',true)});

	
	
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
