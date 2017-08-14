<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引用jquery easy ui的js库及css -->
<%@include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/css/style.css" />
<style type="text/css">
 .texts{text-decoration:underline;}
</style>
<title>新增集中点验</title>
</head>
<body>
 <form  action="${ctx}/dailymgr/inspection/save" method="post" id="culpritInfo" name="culpritInfo">
       <table border=0 cellSpacing=0 cellPadding=0 width="30%" align="center" bgColor=#c4d8ed style="margin-top: 100px;">
			<tbody>
	   			<tr>
					<td background="${ctxStatic}/images/r_0.gif" width="100%">
						<table cellSpacing=0 cellPadding=0 width="100%">
						<tbody>
							<TR>
								<td>&nbsp;抽查设置</td>
								<td align=right>&nbsp;</td>
							</TR>
						</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="toptable grid" border=1 cellSpacing=1 cellPadding=4 align="center">
						<tbody>
							<tr>
								<td width="25%" align="right">
									抽查开始时间：
								</td>
								<td>
								<input id="checkStartTime" name="checkStartTime" class="easyui-datetimebox" data-options="showSeconds:false" required=true editable="false" style="width:40%;"/>&nbsp;
								</td>
							</tr>
							<tr>
								<td align="right">
									抽查结束时间：
								</td>
								<td>
								<input id="checkEndTime" name="checkEndTime" class="easyui-datetimebox" data-options="showSeconds:false" required=true editable="false" style="width:40%;"/>&nbsp;
								</td>
							</tr>
							<tr>
								<td align="right">
									每个司法所抽查人数：
								</td>
								<td>
									<input type="radio" name="amount" value="2" />全部
									<input type="radio" name="amount" value="1" checked="checked"/>部分抽查(多于100人的司法所随机抽查100人，其余的抽查全部)
								</td>
							</tr>
							<tr height="100px;">
								<td align="right">被抽查部门：
								</td>
								<td>
									<select id="sysGroupId" name="groupidsStr" class="easyui-combotree groupidsStr" multiple="multiple" style="width: 80%;" required=true 
    								data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true"></select>
    								<input type="hidden" id="groupsStr" name="groupsStr" value="" />
								</td>
							</tr>
							<tr>
								<td colspan="2">&nbsp</td>
							</tr>
						</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td align="center">
						<a id="btn1" class="easyui-linkbutton">确定</a>
						<a id="btn2" class="easyui-linkbutton">取消</a>
					</td>
				</tr>
			</tbody>
			</table>
</form>
<script>
	$('#btn1').click(function (){
		var checkStartTime = $('#checkStartTime').datetimebox('getValue');
		var checkEndTime = $('#checkEndTime').datetimebox('getValue');
		if (checkStartTime == '' || checkStartTime == null || checkEndTime == '' || checkEndTime == null) {
			$.messager.show({
				title : '提醒',
				msg : '抽查时间段不能为空！'
			});
			return;
		}
		var result = compareDate(checkStartTime);
		
		if (result / 1000 / 60 / 60 < 1) {
			$.messager.show({
				title : '提醒',
				msg : '抽查开始时间必须大于当前时间<br/>1小时以上,请重新选择！'
			});
			//$('#checkStartTime').datetimebox('setValue', '');
			return;
		}
		if (compareDate2(checkEndTime, checkStartTime)) {
			$.messager.show({
				title : '提醒',
				msg : '抽查结束时间必须大于开始时间,请重新选择！'
			});
			//$('#checkEndTime').datetimebox('setValue', '');
			return;
		}
		if (checkStartTime.substring(0,10) != checkEndTime.substring(0,10)){
			$.messager.show({
				title : '提醒',
				msg : '抽查开始时间和抽查结束时间请选择同一天！'
			});
			return;
		}
   		$('#culpritInfo').form('submit');
	});
    
    function doClose(){
    	parent.location.reload(); // 父页面刷新
    	var index = parent.layer.getFrameIndex(window.name);
    	parent.layer.close(index);
    }
    
    $(function() {
    	$('#culpritInfo').form({
    		url:'${ctx}/dailymgr/inspection/save',
    		onSubmit:function(){
    			return $(this).form('validate');
    		},
    		success:function(data){
    			data = JSON.parse(data);
    			if(data.status==200){
    				$.messager.show({
    					title:'提示信息!' ,
    					msg:data.msg
    				});
    				
    				doClose();
    			}else{
    				alert(data.msg);
    			}
    		}
    	});
    });

    $('#btn2').click(function (){
    	doClose();
    });
    
    
  //选择司法所时赋值司法所名称
	$('#sysGroupId').combotree({
		onChange:function(){
			$('#groupsStr').val($('#sysGroupId').combotree('getText'));
		}
    });
    
    function compareDate(eDate)// 日期比较函数
    {
    	var d1 = new Date(eDate.replace(/\-/g, "\/"));
    	var d2 = new Date();
    	return (d1.getTime() - d2.getTime());
    }
    
    function compareDate2(bDate, eDate) // 日期比较函数
    {
    	var d1 = new Date(bDate);
    	var d2 = new Date(eDate);
    	if (d1 > d2) {
    		return false;
    	} else {
    		return true;
    	}
    }
</script>
</body>
</html>
