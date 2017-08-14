<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/investigate/investigateAudit" method="post" id="investigateAssignSave">
	<input type="hidden" name="id" value="${investigate.id}"/>
	<input type="hidden" name="taskId" value="${investigate.taskId}"/>
	<input type="hidden" name="auditType" value="${investigate.auditType}"/>
	
	<div class="easyui-panel" title="指派司法所" style="width:100%;padding: 5px;margin: auto;">
		<table width="100%" class="grid">
			<tr>
				<th width="20%"><span class="c-red">*</span>调查司法所：</th>
				<td width="80%" colspan="3"><select id="sysGroupId" name="sfsGroupId" class="f1 easyui-combotree" value="${investigate.sfsGroupId}"
					data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true,limitToList:'true'" 
					required=true style="width: 173px;"></select>
				<input type="hidden" id="sfsGroupName" name="sfsGroupName" value="${investigate.sfsGroupName }"/></td>
			</tr>
			
			
			<tr style="display:none;" >
				<td colspan="4" align="center">
					<a id="investigateAssign3" class="easyui-linkbutton" icon="fi-save icon-blue">保存</a>
					<a id="investigateAssign1" class="easyui-linkbutton" icon="fi-checkbox icon-blue">指派</a>
					<a id="investigateAssign2" class="easyui-linkbutton" icon="fi-x icon-blue">关闭</a>
				</td>
			</tr>
			
		</table>
	</div>
	
	<div class="easyui-panel" title="委托信息" style="width:100%;padding: 5px;margin: auto;">
		<table width="100%" class="grid">
			<tr>
	        	<th width="20%"><span class="c-red">*</span>委托单位性质：</th>
				<td width="80%">
				<input type="radio" name="dicEntrustUnitTypeKey" value="85001" title="法院" <c:if test="${investigate.dicEntrustUnitTypeKey == '85001' }">checked='checked'</c:if> 
					style="margin-left: 20px;">法院
				<input type="radio" name="dicEntrustUnitTypeKey" value="85002" title="监狱" <c:if test="${investigate.dicEntrustUnitTypeKey == '85002' }">checked='checked'</c:if> 
					style="margin-left: 20px;">监狱
				<input type="radio" name="dicEntrustUnitTypeKey" value="85003" title="检察院" <c:if test="${investigate.dicEntrustUnitTypeKey == '85003' }">checked='checked'</c:if> 
					style="margin-left: 20px;">检察院
				<input type="radio" name="dicEntrustUnitTypeKey" value="85004" title="公安" <c:if test="${investigate.dicEntrustUnitTypeKey == '85004' }">checked='checked'</c:if> 
					style="margin-left: 20px;">公安
    			</td>
	        </tr>
			
	        <tr>
				<th width="20%"><span class="c-red">*</span>委托单位：</th>
				<td width="80%"><input type="text" id="entrustUnit" name="entrustUnit" class="f1 easyui-textbox " value="${investigate.entrustUnit }" data-options="validType:'chinaName'" required=true missingMessage="委托单位不能为空!" 
					data-options="validType:'length[0,20]'"/></td>
			</tr>
			
			<tr>
				<th width="20%"><span class="c-red">*</span>收到委托日期：</th>
				<td width="80%"><input type="text" id="acceptedEntrustTime" name="acceptedEntrustTime" required=true missingMessage="委托日期不能为空!" 
					class="Wdate easyui-validatebox" value="<fmt:formatDate value="${investigate.acceptedEntrustTime }"
					pattern="yyyy-MM-dd" />" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
			</tr>
			
	        <tr>
				<th>委托调查函：</th>
				<td>
					<div id="wtdchUpload"></div>
					<input type="hidden" name="wtdchPathName" id="wtdchPathName" value="${investigate.wtdchPathName }">
					<input type="hidden" name="wtdchPath" id="wtdchPath" value="${investigate.wtdchPath }">
				</td>
			</tr>
			<tr>
				<th>已上传：</th>
				<td colspan="3">
				<div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList}">
					<div id="file_${sysFile.id}">
					${sysFile.originName}
					<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
				</div>
				</td>
			</tr>
		</table>
	</div>
			
	<div class="easyui-panel" title="调查对象信息" style="width:100%;padding: 5px;margin: auto;">
		<table width="100%" class="grid">
			<tr>
				<th width="20%"><span class="c-red">*</span>被调查对象姓名：</th>
				<td width="30%"><input type="text" id="name" name="name" class="f1 easyui-textbox " value="${investigate.name }" data-options="validType:'chinaName'" required=true missingMessage="被调查对象姓名不能为空!" 
					data-options="validType:'length[0,20]'"/></td>
				<th width="20%"><span class="c-red">*</span>性别：</th>
				<td width="30%"><input id="dicSexKey" name="dicSexKey" class="easyui-combobox " data-options="valueField:'id',textField:'value',limitToList:'true',editable:false,
					url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=sex&parentKey=10000',panelMaxHeight:'200',panelHeight:'auto'" value="${investigate.dicSexKey }" 
    				required=true missingMessage="性别不能为空!" ></td>
			</tr>
			
			<tr>
				<th>别名：</th>
				<td><input type="text" name="alias" class="f1 easyui-textbox " value="${investigate.alias }" 
					data-options="validType:'length[0,20]'"/></td>
				<th>曾用名：</th>
				<td><input type="text" name="oldName" class="f1 easyui-textbox " value="${investigate.oldName }" 
					data-options="validType:'length[0,20]'"/></td>
			</tr>
			
			<tr>
				<th>身份证号：</th>
				<td><input type="text" id="relevantNumber" name="relevantNumber" class="f1 easyui-textbox easyui-validatebox" data-options="validType:'idcard'" 
					value="${investigate.relevantNumber }" /></td>
				<th><span class="c-red">*</span>出生日期：</th>
				<td><input type="text" id="bornDate" name="bornDate" class="Wdate easyui-validatebox" value="<fmt:formatDate value="${investigate.bornDate }"
					pattern="yyyy-MM-dd" />" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" required=true missingMessage="出生日期不能为空!" /></td>
			</tr>
			
			<tr>
				<th><span class="c-red">*</span>户籍类型：</th>
				<td><input id="dicResudenceKey" name="dicResudenceKey" class="f1 easyui-combobox " data-options="valueField:'id',textField:'value',limitToList:'true',editable:false,
					url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=hklx&parentKey=12000',panelMaxHeight:'200',panelHeight:'auto'" value="${investigate.dicResudenceKey }" 
					required=true ></td>
				<th>职业：</th>
				<td><input id="job" name="job" class="f1 easyui-combobox " value="${investigate.job }" data-options="valueField:'value',textField:'value',limitToList:true,
					url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=job&parentKey=1550000',panelMaxHeight:'200',panelHeight:'auto'" >
				</td>
			</tr>
			
			<tr>
				<th>民族：</th>
				<td><input id="nation" name="nation" class="f1 easyui-combobox" value="${investigate.nation }" data-options="valueField:'id',textField:'value',limitToList:'true',
	 				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=nation&parentKey=104000',panelMaxHeight:'200',panelHeight:'auto'" ></td>
				<th><span class="c-red">*</span>案由：</th>
				<td><input type="text" id="crimeReason" name="crimeReason" value="${investigate.crimeReason }" required=true class="f1 easyui-textbox " 
					data-options="validType:'length[0,333]'"/></td>
			</tr>
			
			<tr>
				<th>联系方式：</th>
				<td><input type="text" id="contactPhone" name="contactPhone" class="f1 easyui-textbox easyui-validatebox" data-options="validType:'telNum'" 
					value="${investigate.contactPhone }" /></td>
				<th><span class="c-red">*</span>拟提请类型：</th>
				<td><input id="entrustTypeId" name="entrustTypeId" class="f1 easyui-combobox " data-options="valueField:'id',textField:'value',limitToList:'true',editable:false,
	 				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_investigate&columnName=entrust_type_id&parentKey=20000',panelMaxHeight:'200',panelHeight:'auto'" 
	 				required=true value="${investigate.entrustTypeId }" >
				</td>
			</tr>
			<!-- 
			<tr>
				<th>住址：</th>
				<td colspan="3"><input type="text" id="address" name="address" class="f1 easyui-textbox " value="${investigate.address }" 
					data-options="validType:'length[0,50]'" style="width: 513px;"/></td>
			</tr>
			 -->
			<tr>
				<th width="20%">籍贯：</th>
				<td colspan="3" width="80%">
					<input name="originProId" id="originProId" class="easyui-combobox" value="${investigate.originProId }"  
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"></input>省
                   	<input id="originCityId" name="originCityId" class="easyui-combobox" value="${investigate.originCityId }"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'">市
                   	<input id="originCountryId" name="originCountryId" class="easyui-combobox" value="${investigate.originCountryId }"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'">县（区）
				</td>
			</tr>
			
			<tr>
				<th width="20%"><span class="c-red">*</span>户籍所在地：</th>
				<td colspan="3" width="80%">
					<input name="regResidenceProId" id="regResidenceProId" class="easyui-combobox" required=true value="${investigate.regResidenceProId }"  
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"></input>省
                   	<input id="regResidenceCityId" name="regResidenceCityId" class="easyui-combobox" required=true value="${investigate.regResidenceCityId }"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'">市
                   	<input id="regResidenceCountryId" name="regResidenceCountryId" class="easyui-combobox" required=true value="${investigate.regResidenceCountryId }"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'">县（区）<br>
                   	<input id="regResidenceStreet" name="regResidenceStreet" class="f1 easyui-textbox" data-options="validType:'length[0,50]'" value="${investigate.regResidenceStreet }" >乡镇（街道）
                   	<input id="regResidenceDetail" name="regResidenceDetail" class="f1 easyui-textbox" data-options="validType:'length[0,50]'" value="${investigate.regResidenceDetail }" >(详细门牌号)
				</td>
			</tr>
			
			<tr>
				<th width="20%"><span class="c-red">*</span>经常居住地：</th>
				<td colspan="3" width="80%">
					<input name="habitualResidenceProId" id="habitualResidenceProId" class="easyui-combobox" required=true value="${investigate.habitualResidenceProId}"  
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"></input>省
                   	<input name="habitualResidenceCityId" id="habitualResidenceCityId" class="easyui-combobox" required=true value="${investigate.habitualResidenceCityId}"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"></input>市
                   	<input name="habitualResidenceCountryId" id="habitualResidenceCountryId" class="easyui-combobox" required=true value="${investigate.habitualResidenceCountryId}"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"></input>县（区）<br>
                   	<input id="habitualResidenceStreet" name="habitualResidenceStreet" class="easyui-textbox" data-options="validType:'length[0,50]'" value="${investigate.habitualResidenceStreet}">乡镇（街道）
                   	<input id="habitualResidenceDetail" name="habitualResidenceDetail" class="easyui-textbox" data-options="validType:'length[0,50]'" value="${investigate.habitualResidenceDetail}">(详细门牌号)
					<a id="btn" href="#" class="easyui-linkbutton" iconCls="fi-page-copy icon-blue" onclick="getHabitualResidence();">同户籍所在地</a>  
				</td>
			</tr>
			
			<tr>
				<th><span class="c-red">*</span>家庭住址：</th>
				<!-- 
				<td colspan="3"><input type="text" id="address" name="address" class="f1 easyui-textbox " value="${investigate.address }" 
					data-options="validType:'length[0,50]'" style="width: 513px;"/></td>
				 -->
				<td colspan="3" width="80%">
					<input name="addressProId" id="addressProId" class="easyui-combobox" required=true value="${investigate.addressProId }"  
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"></input>省
                   	<input id="addressCityId" name="addressCityId" class="easyui-combobox" required=true value="${investigate.addressCityId }"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'">市
                   	<input id="addressCountryId" name="addressCountryId" class="easyui-combobox" required=true value="${investigate.addressCountryId }"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'">县（区）<br>
                   	<input id="addressStreet" name="addressStreet" class="f1 easyui-textbox" data-options="validType:'length[0,50]'" value="${investigate.addressStreet }" >乡镇（街道）
                   	<input id="addressDetail" name="addressDetail" class="f1 easyui-textbox" data-options="validType:'length[0,50]'" value="${investigate.addressDetail }" >(详细门牌号)
					<a id="btn" href="#" class="easyui-linkbutton" iconCls="fi-page-copy icon-blue" onclick="getAddrFromReg();">同户籍所在地</a> 
					<a id="btn" href="#" class="easyui-linkbutton" iconCls="fi-page-copy icon-blue" onclick="getAddrFromHR();">同经常居住地</a> 
				</td>
			</tr>
		</table>
    </div>
</form>
<script>
function submitForm(){
	$('#investigateAssignSave').form('submit');
}
function clearForm(){
	$('#investigateAssignSave').form('clear');
}
$(function() {
	$("#wtdchUpload").powerWebUpload({ auto: true,fileNumLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
	
});

$('#investigateAssign1').click(function(){
	progressLoad();

	if ($('#investigateAssignSave').form('validate')) {
		var wtdwxz = $('input:radio[name=dicEntrustUnitTypeKey]:checked')[0].title;
		var wtdw = $('#entrustUnit').val();
		if (wtdw.lastIndexOf(wtdwxz) != (wtdw.length-wtdwxz.length)) {
			$.messager.show({
				title : '提示信息!',
				msg : '委托单位后缀名必须是相应性质单位!'
			});
       		progressClose();
       		return false;
		}

		$.ajax({
			type : 'post',
			url : '${ctx}/investigate/investigateAudit?update=true&type=1',
			data : $('#investigateAssignSave').serialize(),
			dataType : 'json',
			async : false,
			success : function(result) {
            	progressClose();
				$.messager.show({
					title : '提示信息',
					msg : '指派成功'
				});
				
   				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                parent.$.modalDialog.handler.dialog('close');
			},
			error : function(result) {
            	progressClose();
				$.messager.show({
					title : '提示信息',
					msg : '指派失败'
				});
			}
		});
	}else {
    	progressClose();
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能保存!'
		});
	}
});

$('#investigateAssign2').click(function(){
	parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
    parent.$.modalDialog.handler.dialog('close');
});

$('#investigateAssign3').click(function(){
	progressLoad();

	if ($('#investigateAssignSave').form('validate')) {
		var wtdwxz = $('input:radio[name=dicEntrustUnitTypeKey]:checked')[0].title;
		var wtdw = $('#entrustUnit').val();
		if (wtdw.lastIndexOf(wtdwxz) != (wtdw.length-wtdwxz.length)) {
			$.messager.show({
				title : '提示信息!',
				msg : '委托单位后缀名必须是相应性质单位!'
			});
       		progressClose();
       		return false;
		}

		$.ajax({
			type : 'post',
			url : '${ctx}/investigate/save',
			data : $('#investigateAssignSave').serialize(),
			dataType : 'json',
			async : false,
			success : function(result) {
            	progressClose();
				$.messager.show({
					title : '提示信息',
					msg : result.msg
				});
				
   				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                parent.$.modalDialog.handler.dialog('close');
			},
			error : function(result) {
            	progressClose();
				$.messager.show({
					title : '提示信息',
					msg : result.msg
				});
			}
		});
	}else {
    	progressClose();
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能保存!'
		});
	}
});

$('#sysGroupId').combotree({
	onChange:function(n,o){
		$("#sfsGroupName").val($('#sysGroupId').combotree('getText'));
	}
});

/*选择户籍省触发省下面的市*/
var changeRegProId = false ;
$('#regResidenceProId').combobox({
	onChange: function(newValue,oldValue){
		$('#regResidenceCityId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
		    valueField:'id',    
		    textField:'areaName'
		});
		$('#regResidenceCityId').combobox('setValue','' ) ;
	},
	onSelect: function(record){
		if( changeRegProId == false ) {
			changeRegProId = true ;
			$('#regResidenceCityId').combobox({    
				url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
			    valueField:'id',    
			    textField:'areaName'
			});
		}
	}
});
/*选择户籍市触发市下面的县*/
var changeRegCityId = false ;
$('#regResidenceCityId').combobox({
	onChange: function(newValue,oldValue){
		$('#regResidenceCountryId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
		    valueField:'id',    
		    textField:'areaName'
		});
		$('#regResidenceCountryId').combobox('setValue','' ) ;
	},
	onSelect: function(record){
		if( changeRegCityId == false ) {
			changeRegCityId = true ;
			$('#regResidenceCountryId').combobox({    
				url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
			    valueField:'id',    
			    textField:'areaName'
			}); 
		}
	}
});

/*选择经常居住地省触发省下面的市*/
var changeHrProId = false ;
$('#habitualResidenceProId').combobox({
	onChange: function(newValue,oldValue){
		$('#habitualResidenceCityId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
		    valueField:'id',    
		    textField:'areaName'
		});
		$('#habitualResidenceCityId').combobox('setValue','' ) ;
	},
	onSelect: function(record){
		if( changeHrProId == false ) {
			changeHrProId = true ;
			$('#habitualResidenceCityId').combobox({    
				url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
			    valueField:'id',    
			    textField:'areaName'
			}); 
		}
	}
});

/*选择经常居住地市触发市下面的县*/
var changeHrCityId = false;
$('#habitualResidenceCityId').combobox({
	onChange: function(newValue,oldValue){
		$('#habitualResidenceCountryId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
		    valueField:'id',    
		    textField:'areaName'
		});
		$('#habitualResidenceCountryId').combobox('setValue','' ) ;
	},
	onSelect: function(record){
		if(changeHrCityId != true){
			changeHrCityId = true;
			$('#habitualResidenceCountryId').combobox({    
				url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
			    valueField:'id',    
			    textField:'areaName'
			}); 
		}
	}
});
/*选择籍贯省触发省下面的市*/
var changeOriginProId = false ;
$('#originProId').combobox({
	onChange: function(newValue,oldValue){
		$('#originCityId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
		    valueField:'id',    
		    textField:'areaName'
		});
		$('#originCityId').combobox('setValue','' ) ;
	},
	onSelect: function(record){
		if( changeOriginProId == false ) {
			changeOriginProId =  true ;
			$('#originCityId').combobox({    
				url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
			    valueField:'id',    
			    textField:'areaName'
			}); 
		}
	}
});
/*选择籍贯市触发市下面的县*/
var changeOriginCityId = false ;
$('#originCityId').combobox({
	onChange: function(newValue,oldValue){
		$('#originCountryId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
		    valueField:'id',    
		    textField:'areaName'
		});
		$('#originCountryId').combobox('setValue','') ;
	},
	onSelect: function(record){
		if( changeOriginCityId == false ) {
			changeOriginCityId = true ;
			$('#originCountryId').combobox({    
				url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
			    valueField:'id',    
			    textField:'areaName'
			}); 
		}
	}
});
/*选择家庭住址省触发省下面的市*/
var changeAddrProId =  false ;
$('#addressProId').combobox({
	onChange: function( newValue, oldValue ) {
		$('addressCityId').combobox({
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
		    valueField:'id',    
		    textField:'areaName'
		});
		$('#addressCityId').combobox('setValue','') ;
	},
	onSelect: function(record){
		$('#addressCityId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
		    valueField:'id',    
		    textField:'areaName'
		}); 
	}
});
/*选择家庭住址地市触发市下面的县*/
var changeAddrCityId = false ;
$('#addressCityId').combobox({
	onChange: function(newValue,oldValue){
		$('#addressCountryId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
		    valueField:'id',    
		    textField:'areaName'
		}); 
		$('#addressCountryId').combobox('setValue','') ;
	},
	onSelect: function(record){
		if(changeAddrCityId != true){
			changeAddrCityId = true;
			$('#addressCountryId').combobox({    
				url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
			    valueField:'id',    
			    textField:'areaName'
			}); 
		}
	}
});

//居住地同户籍所在地
function getHabitualResidence(){
	var regResidenceProId=$('#regResidenceProId').combobox('getValue');
	var regResidenceCityId=$('#regResidenceCityId').combobox('getValue');
	var regResidenceCountryId=$('#regResidenceCountryId').combobox('getValue');
	var regResidenceStreet=$('#regResidenceStreet').val();
	var regResidenceDetail=$('#regResidenceDetail').val();
	$('#habitualResidenceProId').combobox('setValue',regResidenceProId);
	$('#habitualResidenceCityId').combobox('setValue',regResidenceCityId);
	$('#habitualResidenceCountryId').combobox('setValue',regResidenceCountryId);
	$('#habitualResidenceStreet').textbox('setValue',regResidenceStreet);
	$('#habitualResidenceDetail').textbox('setValue',regResidenceDetail);
}


//家庭住址同户籍所在地
function getAddrFromReg() {
	var regResidenceProId=$('#regResidenceProId').combobox('getValue');
	var regResidenceCityId=$('#regResidenceCityId').combobox('getValue');
	var regResidenceCountryId=$('#regResidenceCountryId').combobox('getValue');
	var regResidenceStreet=$('#regResidenceStreet').val();
	var regResidenceDetail=$('#regResidenceDetail').val();
	$('#addressProId').combobox('setValue',regResidenceProId);
	$('#addressCityId').combobox('setValue',regResidenceCityId);
	$('#addressCountryId').combobox('setValue',regResidenceCountryId);
	$('#addressStreet').textbox('setValue',regResidenceStreet);
	$('#addressDetail').textbox('setValue',regResidenceDetail);
}

//家庭住址同经常居住地
function getAddrFromHR() {
	var habitualResidenceProId=$('#habitualResidenceProId').combobox('getValue');
	var habitualResidenceCityId=$('#habitualResidenceCityId').combobox('getValue');
	var habitualResidenceCountryId=$('#habitualResidenceCountryId').combobox('getValue');
	var habitualResidenceStreet=$('#habitualResidenceStreet').val();
	var habitualResidenceDetail=$('#habitualResidenceDetail').val();
	$('#addressProId').combobox('setValue',habitualResidenceProId);
	$('#addressCityId').combobox('setValue',habitualResidenceCityId);
	$('#addressCountryId').combobox('setValue',habitualResidenceCountryId);
	$('#addressStreet').textbox('setValue',habitualResidenceStreet);
	$('#addressDetail').textbox('setValue',habitualResidenceDetail);
}
</script>