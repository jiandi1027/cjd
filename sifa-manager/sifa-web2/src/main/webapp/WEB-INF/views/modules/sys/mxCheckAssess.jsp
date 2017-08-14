<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/sys/mxCheck/save" method="post" id="assessform">
	<input type="hidden" name="id" value="${mxCheck.id}"/>
	<input type="hidden" name="infoType" value="${mxCheck.infoType}"/>
	<input type="hidden" name="processInstanceId" value="${mxCheck.processInstanceId}"/>
	
	<div class="easyui-panel" title="" style="width:100%;padding:5px;margin-bottom: 10px;">
		<table width="100%" class="grid">
		<tr>
			<td width="20%" style="border:0"></td>
			<td width="80%" style="border:0"></td>
		</tr>
		<c:forEach var="sysDic" items="${sysDicList }" varStatus="status">
		<c:if test='${not empty map[sysDic.key]}'>
			<c:set var="val" value="${map[sysDic.key].amount }"></c:set>
			<c:set var="check" value="checked='checked'"></c:set>
		</c:if>
		<c:if test='${empty map[sysDic.key]}'>
			<c:set var="val" value="1"></c:set>
			<c:set var="check" value=""></c:set>
		</c:if>
		<tr>
			<td colspan="2" style="border:0" width="100%">
				<input type="checkbox" name="assessCheck" id="assessCheck${status.index }" value="${sysDic.remarks }" ${check} style="margin-left: 10px;"/>
				<label>${sysDic.value}</label>
				<c:if test="${sysDic.key == '100008' || sysDic.key == '101024' }">
				,扣<input id="assessScore${status.index }" class="easyui-numberbox" value="${map[sysDic.key].deduction }" data-options="min:0,precision:1" style="width:40px;"/>分
				</c:if>
				<c:if test="${sysDic.key != '100008' && sysDic.key != '101024' }">
				,共<input id="assessScore${status.index }" class="easyui-numberbox" value="${val}" data-options="min:0" style="width:40px;"/>处
				</c:if>
				<input type="hidden" id="assessChecktype${status.index }" value="${sysDic.key }"/>
			</td>
		</tr>
		</c:forEach>
		
		<tr>
			<td width="20%" style="text-align: center;border:0">具体说明：
			</td>
			<td width="80%" style="border:0">
				<textArea id="detailReason" name="detailReason" style="width: 350px;height: 100px;overflow:hidden;" 
					onkeydown='textarealength(this,150)' onKeyUp="textarealength(this,150)" maxlength="150">${map[qtqkid].detailReason }</textArea>
				<p class="textarea-numberbar">
					备注：此处最多可以输入<em class="c-red">150</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
				</p>
			</td>
		</tr>
		<tr>
			<td colspan="2" width="100%" style="border:0"></td>
		</tr>
		
		<tr align="center" style="display: none;border:0">
			<td colspan="2">
				<a id="assessBtn1" class="easyui-linkbutton" icon="fi-checkbox icon-blue">确定</a>
				<a id="assessBtn2" class="easyui-linkbutton" icon="fi-x icon-red">关闭</a>
			</td>
		</tr>
		</table>
	</div>
	
	
	
</form>
<script type="text/javascript">
var columntype = "${columnname}";
var tablename = "${tablename}";

$(function() {
});


$('#assessBtn1').click(function(){
	var score = 0;
	var checktype = "";
	var flag = true;
	var qtqkscore = true;
	
	$('input:checkbox[name=assessCheck]').each(function(i,checkbox){
		if ($(this).is(":checked")) {
			if ($('#assessChecktype'+i).val() == '100008' || $('#assessChecktype'+i).val() == '101024') {
				if ($('#assessScore'+i).numberbox('getValue') == '' || $('#assessScore'+i).numberbox('getValue') == null) {
					qtqkscore = false;	
				}
				else if ($('#detailReason').val() == '' || $('#detailReason').val() == null) {
					flag = false ;
				}
				else {
					score += $('#assessScore'+i).numberbox('getValue') - 0;
					checktype = checktype + $('#assessChecktype'+i).val() + "-1-" + $('#assessScore'+i).numberbox('getValue') + ",";
				}
			}
			else {
				score += checkbox.value * $('#assessScore'+i).numberbox('getValue');
				checktype = checktype + $('#assessChecktype'+i).val() + "-" + $('#assessScore'+i).numberbox('getValue') + "-" + checkbox.value + ",";
			}
		}
    });
    if (!qtqkscore) {
		$.messager.show({
			title : "提示消息",
			msg : "您选择了其他问题，你填写扣除分数"
		});
		return;
	}
	if (!flag) {
		$.messager.show({
			title : "提示消息",
			msg : "您选择了其他问题，你填写具体说明情况"
		});
		$('#detailReason').focus();
		return;
	}
	
	score = 10 - score;
	if (score < 0) {
		score = 0;
	}
	if (checktype != "") {
		checktype = checktype.substring(0,checktype.length -1);
	}
	var url = "${ctx}/sys/mxCheck/save?checktype="+checktype;
	
	$.ajax({
		type : 'post',
		url : url,
		data : $('#assessform').serialize(),
		dataType : 'json',
		success : function(result) {
        	progressClose();
			
			if (columntype == 'srzl') {
				$('#optScoreLabel').text(score);
				$('#optScore').val(score);
			}
			if (columntype == 'zfzl') {
				$('#zfScoreLabel').text(score);
				$('#zfScore').val(score);
			}
			
			$('#'+tablename).dialog('close');
			//$('#'+tablename).dialog('destroy');
		},
		error : function(result) {
        	progressClose();
			$.messager.show({
				title : '提示信息',
				msg : result.msg
			});
		}
	});
})


$('#assessBtn2').click(function(){
	$('#'+tablename).dialog('close');
	//$('#'+tablename).dialog('destroy');
})
</script>
</body>
</html>