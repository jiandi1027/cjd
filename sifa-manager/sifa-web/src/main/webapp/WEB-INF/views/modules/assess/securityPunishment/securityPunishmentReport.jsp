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
<title>提请治安审核</title>
</head>
<body>
<form id="submitReportForm" name="submitReportForm" action="" method="post">
	<input type="hidden" name="taskId" value="${securityPunishment.taskId}"/>
	<input type="hidden" name="id" value="${securityPunishment.id}"/>
	<input type="hidden" name="auditType" value="${securityPunishment.auditType}"/>
	<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
   		<TBODY>
			<TR>
				<TD>
				 	<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${securityPunishment.culpritId}" formId="submitReportForm" isSelect="false"/>
				</TD>
			</TR>
			
   			<TR>
				<TD background="${ctxStatic}/images/r_0.gif" width="100%">
					<TABLE cellSpacing=0 cellPadding=0 width="100%">
						<TBODY>
							<TR>
								<TD>&nbsp;治安管理处罚相关信息</TD>
								<TD align=right>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			
			<TR>
				<TD>
					<TABLE class="toptable grid" border=1 cellSpacing=1 cellPadding=4 align=center>
						<TBODY>
							<tr>
			                    <td width="10%">违规违纪原因:</td>
								<td class=category>
								<input type="text" name="reasonTypeId" id="reasonTypeId" class="easyui-validatebox" required="true" value="${fns:getSysDicValueByKey('sf_security_punishment', 'reason_type_id', securityPunishment.reasonTypeId, '') }"/>
								</td>
			                </tr>
			                <tr>
			                	<td>
			                	结案报告:
			                	</td>
			                	<td class=category></td>
			                </tr>
			                <tr>
			                	<td>
			                	证据材料:
			                	</td>
								<td class=category></td>
			                </tr>
			                <tr>
			                	<td>
			                	简要违纪情况:
			                	</td>
			                	<td class=category>
			                	<input id="detailInfo" name="detailInfo" readonly="readonly" data-options="multiline:true" class="easyui-textbox" value="${securityPunishment.detailInfo}" style="width: 800px;height:50px;"/>
			                	</td>
			                </tr>
			                <tr>
			                	<td>
			                	处理依据:
			                	</td>
			                	<td class=category>
			                	<input id="reason" name="reason" readonly="readonly" data-options="multiline:true" class="easyui-textbox" value="${securityPunishment.reason}" style="width: 800px;height:50px;"/>
			                	</td>
			                </tr>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
   </TBODY>
</TABLE>

<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>
   <TBODY>
		<tr>
		  <td colspan=4 align=center class=category>
			<a id="submitbtn" class="easyui-linkbutton" iconCls="icon-annex" href="#" onclick="doAudit()">审核</a>
			<a id="cancelbtn" class="easyui-linkbutton" iconCls="icon-cancel" href="#" onclick="doClose()">返回</a>
		  </td>
		</tr>
   </TBODY>
</TABLE>
</form>

<div id="mydialog" title="评估上报" modal=true draggable=true class="easyui-dialog" closed=true style="width: 600px;">

		<form id="myform" action="" method="post" >
		<!-- 
			<div id="tabAdd" class="easyui-tabs" >
				<div title="调查评估意见书" data-options="iconCls:'icon-view'" style="padding: 5px 5px">
		 -->
					<input type="hidden" id="id" name="id" value="${securityPunishment.id}" />
					<input type="hidden" name="taskId" value="${securityPunishment.taskId}"/>
					<input type="hidden" name="auditType" value="${securityPunishment.auditType}"/>
					<table border=0 cellSpacing=0 cellPadding=0 width="600px" bgColor=#c4d8ed>
					<tbody>
					
						<!-- 治安管理处罚建议书   -->
			   			<tr>
							<td background="${ctxStatic}/images/r_0.gif" width="100%">
								<table cellSpacing=0 cellPadding=0 width="100%">
								<tbody>
									<TR>
										<td>&nbsp;治安管理处罚建议书</td>
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
										<td align="center"><span style="font-size: 30px;">治安管理处罚建议书</span></td>
									</tr>
									<tr>
										<td>
										<p class="textp" style="font-size:15px;margin-top:3px;text-indent:28px;line-height:38px;">
										社区矫正人员<span class="texts">&nbsp;${securityPunishment.culprit.name}&nbsp;</span>，
										<span class="texts">&nbsp;${fns:getSysDicValueByKey('common_table', 'sex', securityPunishment.culprit.dicSexKey, '') }&nbsp;</span>，
										<span class="texts">&nbsp;<fmt:formatDate value="${securityPunishment.culprit.birthday}" pattern="yyyy年MM月dd日"/>&nbsp;</span>出生，
										<span class="texts">&nbsp;${securityPunishment.culprit.nation}&nbsp;</span>族，
										居住地<span class="texts">&nbsp;${securityPunishment.culprit.address}&nbsp;</span> ，
										户籍地<span class="texts">&nbsp;${securityPunishment.culprit.regResidence}&nbsp;</span>，
										身份证号码<span class="texts">&nbsp;${securityPunishment.culprit.identification}&nbsp;</span>。
										因<span class="texts">&nbsp;<c:if test="${securityPunishment.culprit.crimeInfo ne null }">
											${securityPunishment.culprit.crimeInfo}
											</c:if> <c:if test="${securityPunishment.culprit.crimeInfo eq null }">
													${securityPunishment.culprit.crimeInfo}
											</c:if> &nbsp;</span>经
										<span class="texts">&nbsp;${securityPunishment.culprit.dicPenalTypeKey}&nbsp;</span>于
										<span class="texts">&nbsp;&nbsp;</span>
										判处<span class="texts">&nbsp;&nbsp;</span>。
										<span class="texts"></span>
										经<span class="texts">&nbsp;</span>（公安局、监狱管理局）裁定（决定、批准）
										<span class="texts">&nbsp;</span>,
										在<span class="texts">&nbsp;&nbsp;</span>
										期间，依法实行社区矫正。社区矫正期限自<span class="texts">&nbsp;
										<fmt:formatDate value="${securityPunishment.culprit.redressStartDate}" pattern="yyyy年MM月dd日"/>&nbsp;</span>
										起至<span class="texts">&nbsp;<fmt:formatDate value="${securityPunishment.culprit.redressEndDate}" pattern="yyyy年MM月dd日"/>&nbsp;</span>止。
										</p>
										<p class="textp" style="font-size:15px;margin-top:3px;text-indent:28px;line-height:30px;">
										该社区矫正人员有违反社区矫正监督管理规定(人民法院禁止令)的行为，具体事实如下：<span class="texts">
										</span>
										</p>
										</td>
									</tr>
									<tr>
										<td style="padding-left: 40px;">
										<input id="concreteFacts" name="concreteFacts" data-options="multiline:true" class="easyui-textbox" required="true" 
										value="${securityPunishment.concreteFacts}" style="width:95%;height:150px;"/>
										</td>
									</tr>
									<tr>
										<td>
										<p class="textp" style="font-size:15px;;margin-top:3px;text-indent:28px;line-height:30px;">
												根据《中华人民共和国治安管理处罚法》第六十条、《社区矫正实施办法》第二十四条之规定，建议对社区矫正人员<span class="texts">&nbsp;${securityPunishment.culprit.name}&nbsp;</span>给予治安管理处罚。
										</p>
										</td>
									</tr>
								</tbody>
								</table>
							</td>
						</tr>
						
						<!-- 审批意见 -->
						<tr>
							<td background="${ctxStatic}/images/r_0.gif" width="100%">
								<table cellSpacing=0 cellPadding=0 width="100%">
								<tbody>
									<TR>
										<td>&nbsp;审批意见</td>
										<td align=right>&nbsp;</td>
									</TR>
								</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<table class="toptable grid" border=1 cellSpacing=1 cellPadding=4 style="text-align: center;">
								<tbody>
									<tr>
										<td>审批环节</td>
										<td>处理时间</td>
										<td>处理人</td>
										<td>意见</td>
										<td>备注</td>
									</tr>
									<c:forEach items="${processDetails}" var="processDetail">
									<tr>
										<td class=category>${processDetail.createrCnName }
										</td>
										<td class=category><fmt:formatDate value='${processDetail.created}' pattern="yyyy-MM-dd HH:mm:ss" />
										</td>
										<td class=category>${processDetail.auditName}
										</td>
										<td class=category>
										<c:choose>
										<c:when test="${processDetail.dicDecideType == '2' || processDetail.dicDecideType == '4'}">
										退回
										</c:when>
										<c:when test="${processDetail.dicDecideType == '1' || processDetail.dicDecideType == '3'}">
										同意
										</c:when>
										<c:otherwise>
										</c:otherwise>
										</c:choose>
										</td>
										<td class=category>${processDetail.opinion}
										</td>
									</tr>
					                </c:forEach>
								</tbody>
								</table>
							</td>
						</tr>
						
						<!-- 审核意见 -->
						<tr>
							<td background="${ctxStatic}/images/r_0.gif" width="100%">
								<table cellSpacing=0 cellPadding=0 width="100%">
								<tbody>
									<TR>
										<td>&nbsp;审核意见</td>
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
									<tr style="text-align: left;;">
										<td><span style="color: red;">*</span>审核意见：</td>
										<td>
										<input type="radio" name="decideType" value="1" checked="checked"/>同意
										<c:choose>
										<c:when test="${securityPunishment.auditType == 'jzkCheck'}">
										<input type="radio" name="decideType" value="2" />退回司法所
										<input type="radio" name="decideType" value="4" />退回矫正科
										</c:when>
										<c:otherwise>
										<input type="radio" name="decideType" value="2" />退回
										</c:otherwise>
										</c:choose>
										</td>
									</tr>
									<tr>
										<td>具体意见：
										</td>
										<td>
										<input id="opinion" name="opinion" data-options="multiline:true" class="easyui-textbox" value="" style="width: 350px;height:50px;"/>
										</td>
									</tr>
								</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td align="center">
								<a id="btn1" class="easyui-linkbutton">提交</a>
								<a id="btn2" class="easyui-linkbutton">取消</a>
							</td>
						</tr>
						<tr><td>&nbsp</td></tr>
					</tbody>
					</table>
					<!-- 
				</div>
			</div>
					 -->
		</form>
	</div>
<script type="text/javascript">
function doAudit(){
	$('#mydialog').dialog({
		title : '审核'
	});
	$('#mydialog').dialog('open');
}
function doClose(){
	parent.location.reload(); // 父页面刷新
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}

$('#btn1').click(function (){
	if ($('#myform').form('validate')) {
		$.ajax({
			type : 'post',
			url : '${ctx}/jiangcheng/securityPunishment/securityPunishmentAudit',
			data : $('#myform').serialize(),
			dataType : 'json',
  			cache : false,
  			async : false, //同步请求
			success : function(result) {
				$.messager.show({
					title : result.status == 200 ? "ok" : "fail",
					msg : result.msg
				});

				$('#mydialog').dialog('close');
				doClose();
			},
			error : function(result) {
				$.messager.show({
					title : result.status == 200 ? "ok" : "fail",
					msg : result.msg
				});
			}
		});
	}else {
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能保存!'
		});
	}
});

$('#btn2').click(function (){
	$('#mydialog').dialog('close');
});

</script>
</body>
</html>