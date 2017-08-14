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
						data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=21bdbf479acc4909a408a3babad19467',panelHeight:'auto',editable:false" /> 
                </td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>就医情况：</th>
				<td colspan="5">
					<input type="text" name="hospitalize" class="f1 easyui-textbox" required=true />
				</td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>迁出事由：</th>
				<!-- <td>
					
					<input type="text" name="leaveReason" class="easyui-textbox" required=true /> 
				</td> -->
				<td colspan="5">
					<textArea class="f1 easyui-validatebox" data-options="multiline:true" required=true
						id="leaveReason" name="leaveReason" style="width: 600px; height: 100px"
						onkeydown='textarealength(this,300)' onKeyUp="textarealength(this,300)" maxlength="300"></textArea> 
						<br>
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
				</td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>亲属姓名：</th>
				<td>
					<input type="text" name="folkName" class="f1 easyui-textbox" required=true />
				</td>
				<th>与矫正人员关系：</th>
				<td>
					<input type="text" name="relation" class="easyui-textbox" />
				</td>
				<!-- <th>职业：</th>
				<td>
					<input type="text" name="job" class="easyui-textbox" />
				</td> -->
				<th>职业：</th>
				<td>
					<input id="outofJob" name="job" class="f1 easyui-combobox " data-options="valueField:'value',textField:'value',limitToList:true,
						url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=job&parentKey=1550000',panelMaxHeight:'200',panelHeight:'auto' ,editable:false" >
				</td>
			</tr>
			<tr>
				<th>政治面貌：</th>
				<td colspan="5">
					<input type="text" name="politicStatus" class="easyui-textbox" />
				</td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>亲属家庭住址：</th>
				<!-- <td colspan="5">
					<input type="text" name="folkAddress" class="f1 easyui-textbox" required=true />
				</td> -->
				<td colspan="5" width="80%">
					<input name="outofFolkAddrProId" id="outofFolkAddrProId" class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"></input>省
                   	<input id="outofFolkAddrCityId" name="outofFolkAddrCityId" class="easyui-combobox" required=true 
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'">市
                   	<input id="outofFolkAddrCountryId" name="outofFolkAddrCountryId" class="easyui-combobox" required=true
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'">县（区）
                   	<input id="outofFolkAddrStreet" name="outofFolkAddrStreet" class="f1 easyui-textbox" data-options="validType:'length[0,50]'" >乡镇（街道）
                   	<input id="outofFolkAddrDetail" name="outofFolkAddrDetail" class="f1 easyui-textbox" data-options="validType:'length[0,50]'" >(详细门牌号)
                   	<input type="hidden" name="folkAddress" class="f1 easyui-textbox"/>
				</td>
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
			if( $('#outofFolkAddrProId').combobox('getValue') == '1110000' || $('#outofFolkAddrProId').combobox('getValue') == '1120000' 
				|| $('#outofFolkAddrProId').combobox('getValue') == '1500000' || $('#outofFolkAddrProId').combobox('getValue') == '1310000') {

				$("input[name='folkAddress']").val($('#outofFolkAddrProId').combobox('getText') + $('#outofFolkAddrCountryId').combobox('getText') 
						+ $("input[name='outofFolkAddrStreet']").val() + $("input[name='outofFolkAddrDetail']").val()) ; 
			}
			else {
				$("input[name='folkAddress']").val($('#outofFolkAddrProId').combobox('getText') + $('#outofFolkAddrCityId').combobox('getText')
					 	 + $('#outofFolkAddrCountryId').combobox('getText') + $("input[name='outofFolkAddrStreet']").val() + $("input[name='outofFolkAddrDetail']").val()) ;
			}
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

	$('#culpritId').combogrid({
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

	/*选择户籍省触发省下面的市*/
	$('#outofFolkAddrProId').combobox({
		onSelect: function(record){
			$('#outofFolkAddrCityId').combobox({    
				url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
			    valueField:'id',    
			    textField:'areaName'
			}); 
		}
	});
	/*选择户籍市触发市下面的县*/
	$('#outofFolkAddrCityId').combobox({
		onSelect: function(record){
			$('#outofFolkAddrCountryId').combobox({    
				url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
			    valueField:'id',    
			    textField:'areaName'
			}); 
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
