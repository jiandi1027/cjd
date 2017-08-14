<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	<form id="askLeaveAuditForm" name="askLeaveAuditForm"
		action="${ctx}/rewardspunishment/reducePenalty/submitCommendAudit" method="post">
		<input type="hidden" name="taskId" value="${reducePenalty.taskId}" />
		<input type="hidden" name="id" value="${reducePenalty.id}" /> 
		<input type="hidden" name="auditType" value="${reducePenalty.auditType}" />
		<c:choose>
			<c:when test="${empty reducePenalty.culpritId }">
				<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId"
					id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true" />
			</c:when>
			<c:otherwise>
				<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false"
					hiddenValue="${reducePenalty.culpritId}" formId="culpritInfo" isSelect="false" />
			</c:otherwise>
		</c:choose>
		<div class="easyui-panel" id="p2" title="减刑信息" style="width: 100%; padding: 5px;">
			<table width="100%" class="grid">
				<tr>
                   <th width="10%">减刑年限：</th>
					<td>
						${reducePenalty.reduceTime}
					</td>
				</tr>
				 <tr>
                    <th width="10%">表现情况：</th>
					<td width="90%"><textarea readOnly=true style="width:80%;height:100px;border: 0 none;">${reducePenalty.actions }</textarea> </td>
                </tr>
				<tr>
					<th width="10%">附件下载：</th>
					<td><div id="wtdchUploadIng">
							<c:forEach var="sysFile" items="${fileList}">
								<div id="file_${sysFile.id}">
									${sysFile.originName}
									<div class="webuploadDelbtn"
										onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
								</div>
							</c:forEach>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<c:if test="${reducePenalty.auditType ne 'sfsReport' && reducePenalty.auditType ne 'gS'}">
			<div class="easyui-panel"  title="审批信息" style="width: 100%; padding: 5px;">
			<table width="100%" class="grid">
				<tr>
					<th width="10%">审核结果：</th>
					<td><input type="radio" name="decideType" value="1" checked="checked" />同意
						<c:if test="${reducePenalty.auditType ne 'JcyCheck'}">
					 	<input type="radio" name="decideType" value="2" />退回
					 	</c:if>
					 	<c:if test="${reducePenalty.auditType eq 'JcyCheck' || reducePenalty.auditType eq 'sfgCheck'}">
					 		<input type="radio" name="decideType" value="0" />不同意
					 	</c:if>
					</td>
				</tr>
				<tr>
					<th>审核意见：</th>
					<TD><textArea class="f1 easyui-validatebox" style="width: 80%; height: 80px;"
							data-options="multiline:true" name="opinion" id="opinion" style="width: 280px; height: 100px"
							onkeydown='textarealength(this,300)'
							onKeyUp="textarealength(this,300)" maxlength="300"></textArea> <br>
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em
						class="textarea-length c-red">0</em>个字。</TD>
				</tr>
			</table>
			</div>
		</c:if>
		<!-- 公示 -->
		<c:if test="${reducePenalty.auditType eq 'gS' }">
			<div class="easyui-panel"  title="公示信息" style="width: 100%; padding: 5px;">
			<table width="100%" class="grid">
				<tr>
					<th width="10%">公示结果：</th>
					<td><input type="radio" name="decideType" value="10" checked="checked" />优秀
					 <input type="radio" name="decideType" value="11" />良好
					 <input type="radio" name="decideType" value="12" />一般
					 <input type="radio" name="decideType" value="13" />较差
					</td>
				</tr>
				<tr>
					<th>公示意见：</th>
					<TD><textArea class="f1 easyui-validatebox" style="width: 80%; height: 80px;"
							data-options="multiline:true" name="opinion" 
							onkeydown='textarealength(this,300)'
							onKeyUp="textarealength(this,300)" maxlength="300"></textArea> <br>
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em
						class="textarea-length c-red">0</em>个字。</TD>
				</tr>
			</table>
			</div>
		</c:if>
		<c:if test="${reducePenalty.auditType eq 'sfsReport' }">
			<input type="hidden" name="decideType" value="1" />
		</c:if>

	</form>
	<script type="text/javascript">
		$(function() {
			$('#askLeaveAuditForm').form({
					url : '${ctx}/rewardspunishment/reducePenalty/submitCommendAudit',
					onSubmit : function() {
						progressLoad();
						var isValid = $(this).form('validate');
						if (!isValid) {
							progressClose();
						}
						return isValid;
					},
					success : function(data) {
						data = JSON.parse(data);
						progressClose();
						if (data.status == 200) {
							$.messager.show({
								title : '提示信息!',
								msg : data.msg
							});

							parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
							parent.$.modalDialog.handler.dialog('close');
						} else {
							parent.$.messager.alert('错误',
									result.msg, 'error');
						}

					}
				});
		});
	</script>