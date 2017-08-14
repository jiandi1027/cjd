<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath() %>/static/kindeditor/kindeditor.js"></script>

<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath() %>/static/kindeditor/lang/zh_CN.js"></script>

<script language="javascript" type="text/javascript">

   KindEditor.ready(function(K) {

       K.create('#pubcontent', {  

          uploadJson : '<%=request.getContextPath() %>/static/kindeditor/jsp/upload_json.jsp',  

          fileManagerJson : '<%=request.getContextPath() %>/static/kindeditor/jsp/file_manager_json.jsp',  

         allowFileManager : true,

         afterBlur: function(){this.sync();}
			
       }); 

  });  
   var toolbar = [ {
		text : '发送',
		iconCls : 'icon-add',
		handler : function() {

		}

	}];
   </script>
</head>

<body class="easyui-layout" id="lay">
	<div class="easyui-layout" style="width:auto;height:100%;">
		<div id="p" data-options="region:'west'" title="对象选择" style="width:15%;padding:10px">
		<ul id="tt" class="easyui-tree"
		url="${ctx}/information/staffGroupMessaging/tree"
		checkbox="true">
		</ul>	
		</div>
		<div  data-options="region:'center',fit:true" title="信息内容">
		<div>
		<table class="easyui-datagrid" data-options="toolbar:toolbar,fit:true" style="width:99%;">
		</table>
		</div>
		<div style="height:auto; width:100%;">
		<textarea id="pubcontent" name="pubcontent"  style="height:770px; width:99.8%;"></textarea>
		</div>
		</div>
	</div>
</body>


</html>
