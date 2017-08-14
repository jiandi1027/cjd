<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/static/kindeditor/kindeditor.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/static/kindeditor/lang/zh_CN.js"></script>
<script language="javascript" type="text/javascript">

   KindEditor.ready(function(K) {

       K.create('#pubcontent', {  

          uploadJson : '<%=request.getContextPath()%>/static/kindeditor/jsp/upload_json.jsp',  

          fileManagerJson : '<%=request.getContextPath()%>/static/kindeditor/jsp/file_manager_json.jsp',  

         allowFileManager : true,

         afterBlur: function(){this.sync();}
			
       }); 

  });  
   KindEditor.ready(function(K) {

       K.create('#pubcontent1', {  

          uploadJson : '<%=request.getContextPath()%>/static/kindeditor/jsp/upload_json.jsp',  

          fileManagerJson : '<%=request.getContextPath()%>/static/kindeditor/jsp/file_manager_json.jsp',

									allowFileManager : true,

									afterBlur : function() {
										this.sync();
									}

								});

			});
   KindEditor.ready(function(K) {

       K.create('#pubcontent2', {  

          uploadJson : '<%=request.getContextPath()%>/static/kindeditor/jsp/upload_json.jsp',  

          fileManagerJson : '<%=request.getContextPath()%>/static/kindeditor/jsp/file_manager_json.jsp',

									allowFileManager : true,

									afterBlur : function() {
										this.sync();
									}

								});

			});
   KindEditor.ready(function(K) {

       K.create('#pubcontent3', {  

          uploadJson : '<%=request.getContextPath()%>/static/kindeditor/jsp/upload_json.jsp',  

          fileManagerJson : '<%=request.getContextPath()%>/static/kindeditor/jsp/file_manager_json.jsp',

									allowFileManager : true,

									afterBlur : function() {
										this.sync();
									}

								});

			});

</script>

</head>


<body class="easyui-layout" id="lay">
	<table>
				<tr>
					<!-- 后台标记为查询 -->
					<td><input name="search" value="1" style="display:none;"/></td>
					<td>监管等级<input name=culpritName style="width:100px;" />&nbsp;</td>
					<td>短信类型：<input name="groupName" style="width:100px;"/></td>
					<td>
						<a href="javascript:void(0);" id="add" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" ">发送</a>
					</td>
				</tr>
			</table>
	<div class="easyui-tabs" data-options="tabWidth:112"
		style="width: 100%; height: 100%">
		<div title="按部门发送" style="width: auto; height: 100%;">
			<div class="easyui-layout" style="width: auto; height: 100%;">
				<div id="p" data-options="region:'west'" title="部门选择"
					style="width: 15%; padding: 10px">
					<ul id="tt" class="easyui-tree"
						url="${ctx}/sys/sysGroup/loadGroupTree" checkbox="true">
					</ul>
				</div>
				<div data-options="region:'center',fit:true" title="信息内容">
					<div>
						<table class="easyui-datagrid"
							data-options="fit:true" style="width: 99%;">
						</table>
					</div>
					<div style="height: auto; width: 100%;">
						<textarea id="pubcontent" name="pubcontent"
							style="height: 770px; width: 99.8%;"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div title="按对象发送" style="width: auto; height: 100%;">
			<div class="easyui-layout" style="width: auto; height: 100%;">
				<div id="p" data-options="region:'west'" title="对象选择"
					style="width: 15%; padding: 10px">
					<ul id="tt" class="easyui-tree"
						url="${ctx}/information/staffGroupMessaging/tree" checkbox="true">
					</ul>
				</div>
				<div data-options="region:'center',fit:true" title="信息内容">
					<div>
						<table class="easyui-datagrid"
							data-options="fit:true" style="width: 99%;">
						</table>
					</div>
					<div style="height: auto; width: 100%;">
						<textarea id="pubcontent1" name="pubcontent1"
							style="height: 770px; width: 99.8%;"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div title="按对象类型发送" style="width: auto; height: 100%;">
			<div class="easyui-layout" style="width: auto; height: 100%;">
				<div id="p" data-options="region:'west'" title="对象选择"
					style="width: 15%; padding: 10px">
					<ul id="tt" class="easyui-tree"
						url="${ctx}/information/staffGroupMessaging/tree" checkbox="true">
					</ul>
				</div>
				<div data-options="region:'center',fit:true" title="信息内容">
					<div>
						<table class="easyui-datagrid"
							data-options="fit:true" style="width: 99%;">
						</table>
					</div>
					<div style="height: auto; width: 100%;">
						<textarea id="pubcontent2" name="pubcontent2"
							style="height: 770px; width: 99.8%;"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div title="按监管等级发送" style="width: auto; height: 100%;">
				<div class="easyui-layout" style="width: auto; height: 100%;">
				<div id="p" data-options="region:'west'" title="对象选择"
					style="width: 15%; padding: 10px">
					<ul id="tt" class="easyui-tree"
						url="${ctx}/information/staffGroupMessaging/tree" checkbox="true">
					</ul>
				</div>
				<div data-options="region:'center',fit:true" title="信息内容">
					<div>
						<table class="easyui-datagrid"
							data-options="fit:true" style="width: 99%;">
						</table>
					</div>
					<div style="height: auto; width: 100%;">
						<textarea id="pubcontent3" name="pubcontent3"
							style="height: 770px; width: 99.8%;"></textarea>
					</div>
				</div>
			</div>
			</div>
		</div>

</body>


</html>
