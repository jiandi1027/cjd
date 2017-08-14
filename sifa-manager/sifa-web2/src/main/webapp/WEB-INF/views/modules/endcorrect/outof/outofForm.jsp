<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form action="${ctx}/dailymgr/askLeave/save" method="post"
	id="culpritInfo" enctype="multipart/form-data">
	<c:choose>
		<c:when test="${empty outof.culpritId }">

			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId"
				id="culpritName" name="culpritName" required="true" hiddenValue=""
				formId="culpritInfo" isSelect="true" />
		</c:when>
		<c:otherwise>

			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId"
				id="culpritName" name="culpritName" required="false"
				hiddenValue="${outof.culpritId}" formId="culpritInfo"
				isSelect="false" />
		</c:otherwise>
	</c:choose>


	<div class="easyui-panel" title="迁出基本信息"
		style="width: 100%; padding: 5px;">
		<table style="width: 100%;" class="grid">

			<tr>
				<th width="10%">
					<span class="c-red">*</span>迁出时间：
				</th>
				<td width="23%">
					<input type="text" name="moveTime" id="moveTime"
					value="<fmt:formatDate value="${askLeave.doDate}" pattern="yyyy-MM-dd HH:mm:ss" />"
					required=true class="Wdate easyui-validatebox"
					onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" />
				</td>
				<th width="10%">
					<span class="c-red">*</span>迁出地点：
				</th>
				<td width="23%">
					<input type="text" name="place" class="easyui-textbox" required=true />
				</td>
				<th width="10%">
					<span class="c-red">*</span>是否私自：
				</th>
				<td width="23%" >
					<input name="isPrivate" id="isPrivate" class="easyui-combobox" required=true  
						data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=21bdbf479acc4909a408a3babad19467',panelHeight:'auto'" /> 
                </td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>迁出事由：</th>
				<td><input type="text" name="leaveReason"
					class="easyui-textbox" required=true /></td>
				<th>与矫正人员关系：</th>
				<td><input type="text" name="relation" class="easyui-textbox" /></td>
				<th>职业：</th>
				<td><input type="text" name="job" class="easyui-textbox" /></td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>亲属姓名：</th>
				<td><input type="text" name="folkName"
					class="f1 easyui-textbox" required=true /></td>
				<th><span class="c-red">*</span>亲属家庭住址：</th>
				<td><input type="text" name="folkAddress"
					class="f1 easyui-textbox" required=true /></td>
				<th><span class="c-red">*</span>就医情况：</th>
				<td><input type="text" name="hospitalize"
					class="f1 easyui-textbox" required=true /></td>
			</tr>
			<tr>
				<th>政治面貌：</th>
				<td colspan="5"><input type="text" name="politicStatus"
					class="easyui-textbox" /></td>

			</tr>
			<tr>
				<th>附件：</th>
				<td colspan="5">
					<div id="path1"></div>
				</td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>司法所意见：</th>
				<td colspan="5"><textArea class="f1 easyui-validatebox"
						data-options="multiline:true" name="sfsView" required=true
						id="sfsView" style="width: 600px; height: 100px"
						onkeydown='textarealength(this,300)'
						onKeyUp="textarealength(this,300)" maxlength="300"></textArea> <br>
					备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em
					class="textarea-length c-red">0</em>个字。</td>

			</tr>
			<tr>
				<th>备注：</th>
				<td colspan="5"><textArea class="f1 easyui-validatebox"
						data-options="multiline:true" name="note"  id="note"
						style="width: 600px; height: 100px"
						onkeydown='textarealength(this,300)'
						onKeyUp="textarealength(this,300)" maxlength="300"></textArea> <br>
					备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em
					class="textarea-length c-red">0</em>个字。</td>

			</tr>


		</table>
	</div>
</form>
<script>
	$(function() {
		$("#path1").powerWebUpload({
			auto : true,
			fileNumLimit : 10,
			serverPath : '${ctx}/servlet/file/upload',
			fileType : 'doc,xls,docx,xlsx,pdf'
		});

		$('#culpritInfo').form({
			url : '${ctx}/endcorrect/outof/save',
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
				//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
				parent.$.modalDialog.openner_dataGrid.datagrid('reload');
				parent.$.modalDialog.handler.dialog('close');
				if (data.status == 200) {
					$.messager.show({
						title : '提示信息!',
						msg : data.msg
					});
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}

			}
		});

		$('#culpritId').combogrid(
				{
					delay : 500,
					panelWidth : 300,
					striped : true,
					panelHeight : 300,
					mode : 'remote',
					idField : 'id',
					textField : 'name',
					url : '${ctx}/culpritinfo/culprit/list',
					columns : [ [ {
						field : 'name',
						title : '姓名',
						width : 120,
						align : 'center'
					}, {
						field : 'dicSexKey',
						title : '性别',
						width : 80,
						align : 'center'
					} ] ],
					fitColumns : true,
					pagination : true, //是否分页  
					rownumbers : true, //序号  
					collapsible : false, //是否可折叠的  
					method : 'post',
					onSelect : function(record) {
						var arr = $('#culpritId').combogrid('grid').datagrid(
								'getSelections');
						$('#culpritInfo').form('load', arr[0]);
					}
				});

		//取得分页组件对象  
		var pager = $('#culpritId').combogrid('grid').datagrid('getPager');
		if (pager) {
			$(pager).pagination({
				pageSize : 10, //每页显示的记录条数，默认为10  
				beforePageText : '第', //页数文本框前显示的汉字  
				afterPageText : '',
				displayMsg : ''
			});
		}
	});
</script>
