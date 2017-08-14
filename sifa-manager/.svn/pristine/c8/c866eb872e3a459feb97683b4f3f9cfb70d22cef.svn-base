<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>详细</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
th{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>

</head>

<body>
     	<div style="height:100%">
            <table width="100%">
            
           		<tr>
            		<th></th>
            		<th>首次报到事项</th>
            		<th>操作</th>
            	</tr>
            	<tr>
	           		<th>1</th>
	           		<th>社区矫正人员脸谱指纹信息采集</th>
	           		<th>IFACE登记</u></strong></span></a></th>
	           	</tr>
	           	<tr>
	           		<th>2</th>
	           		<th>社区矫正人员资料</th>
	           		<th><a href="javascript:void(0);" class="easyui-linkbutton" id="detail">编辑</a></th>
	           	</tr>
	           	<tr>
	           		<th>3</th>
	           		<th>监管人员指定</th>
	           		<th><a href="javascript:void(0);" class="easyui-linkbutton" id="assigner">指定人员</a></th>
	           	</tr>
	           	<tr>
	           		<th>4</th>
	           		<th>监管等级</th>
	           		<th>查看</th>
	           	</tr>
	           	<tr>
	           		<th>5</th>
	           		<th>社区矫正人员首次谈话笔录</th>
	           		<th>编辑</th>
	           	</tr>
	           	<tr>
	           		<th>6</th>
	           		<th>矫正方案</th>
	           		<th>编辑</th>
	           	</tr>
	           	<tr>
	           		<th>7</th>
	           		<th>心理测试</th>
	           		<th>测试</th>
	           	</tr>
	           	<tr>
	           		<th>8</th>
	           		<th>社区矫正宣告书</th>
	           		<th>打印</th>
	           	</tr>
	           	<tr>
	           		<th>9</th>
	           		<th>社区矫正责任书</th>
	           		<th>打印</th>
	           	</tr>
	           	<tr>
	           		<th>10</th>
	           		<th>社区矫正志愿者帮教协议书</th>
	           		<th>上传</th>
	           	</tr>
 			</table>
 	</div>
 	<div id="mydialog" title="指定人员" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 300px;">
		<form id="myform" action="" method="post">
			<input type="hidden" name="id" value="" />
			<table>
				<tr>
					<td>姓名:</td>
					<td><input id="accountId" name="accountId" class="easyui-combobox" /></td>
					
				</tr>
				<tr>
					<td>协管员:</td>
					<td><input id="assistantId" class="easyui-combobox" name="assistantId"/></td>
				</tr>
				<tr align="center">
					<td colspan="2"><a id="btn1" class="easyui-linkbutton">确定</a>
						<a id="btn2" class="easyui-linkbutton">关闭</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
$(function(){
	$('#detail').click(
		function(){
			var id="${culprit.id}";
			open_layer('社区人员基本信息','${ctx}/culpritinfo/culprit/detail?id=' + id);
		
		});
	//指定人员
	$('#assigner').click(
			function(){
				var id="${culprit.id}";
				$('#myform').get(0).reset();
				$("#myform input[name='id']").attr("value","");
				//$('#myform').form('clear');
				$('#mydialog').dialog('open');
			});
	$('#btn2').click(function(){
		$('#mydialog').dialog('close');
		
	});
	$('#btn1').click(function(){
		var data=$('#myform').serialize()
		data+='&culpritId='+'${culprit.id}';
		$.ajax({
			type : 'post',
			url : '${ctx}/culpritinfo/culprit/saveSupervisor',
			cache : false,
			data : data,
			dataType : 'json',
			success : function(result) {
				//1 关闭窗口
				$('#mydialog').dialog('close');
				//3 提示信息
				$.messager.show({
					title : result.status == 200 ? "ok" : "fail",
					msg : result.msg
				});
			},
			error : function(result) {
				$.meesager.show({
					title : result.status == 200 ? "ok" : "fail",
					msg : result.msg
				});
			}
		});
	});
});
	
	function open_layer(title,url){
		
		var index = layer.open({
			type: 2,
			title: title,
			content: url
		});
		layer.full(index);
	}
	$('#accountId').combobox({    
	    url:'${ctx}/sys/sysAccount/findSysAccount?groupId='+'${culprit.groupId}',    
	    valueField:'id',    
	    textField:'accountname',
	    panelHeight:'auto'
	}); 
	$('#assistantId').combobox({    
	    url:'${ctx}/sys/sysAccount/findSysAccount?groupId='+'${culprit.groupId}',    
	    valueField:'id',    
	    textField:'accountname',
	    panelHeight:'auto'
	}); 
</script>
</script>
</html>
