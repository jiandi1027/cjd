<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/investigate/save" method="post" id="investigateInfo">
	<input type="hidden" name="id" id="id" value="${investigate.id}"/>
	<div id="investigateFormAssign"></div>
	<div class="easyui-panel" title="委托信息" style="width:100%;padding:5px;margin:0 auto;">
		<table width="100%" class="grid">
	        <tr>
	        	<th width="20%"><span class="c-red">*</span>委托单位性质：</th>
				<td width="80%">
					<input type="radio" name="dicEntrustUnitTypeKey" value="85001" title="法院" checked="checked" style="margin-left: 20px;" >法院
					<input type="radio" name="dicEntrustUnitTypeKey" value="85002" title="监狱" style="margin-left: 20px;" >监狱
					<input type="radio" name="dicEntrustUnitTypeKey" value="85003" title="检察院" style="margin-left: 20px;" >检察院
					<input type="radio" name="dicEntrustUnitTypeKey" value="85004" title="公安" style="margin-left: 20px;" >公安
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
				<th width="20%">委托调查函：</th>
				<td width="80%">
					<div id="wtdchUpload"></div>
					<input type="hidden" name="wtdchPathName" id="wtdchPathName" value="${investigate.wtdchPathName }">
					<input type="hidden" name="wtdchPath" id="wtdchPath" value="${investigate.wtdchPath }">
				</td>
			</tr>
		</table>
	</div>
			
	<div class="easyui-panel" title="调查对象信息" style="width:100%;padding:5px;margin:0 auto;">
		<table width="100%" class="grid">
			<tr>
				<th width="20%"><span class="c-red">*</span>被调查对象姓名：</th>
				<td width="30%"><input type="text" id="name" name="name" class="f1 easyui-textbox " value="${investigate.name }" data-options="validType:'chinaName'" required=true missingMessage="被调查对象姓名不能为空!" 
					data-options="validType:'length[0,20]'"/></td>
				<th width="20%"><span class="c-red">*</span>性别：</th>
				<td width="30%"><input id="dicSexKey" name="dicSexKey" class="easyui-combobox " data-options="valueField:'id',textField:'value',limitToList:'true',editable:false,
					url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=sex&parentKey=10000',panelMaxHeight:'200',panelHeight:'auto'"
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
					value="${investigate.relevantNumber }" required=true missingMessage="身份证不能为空!" /></td>
				<th><span class="c-red">*</span>出生日期：</th>
				<td><input type="text" id="bornDate" name="bornDate" class="Wdate easyui-validatebox" value="<fmt:formatDate value="${investigate.bornDate }"
					pattern="yyyy-MM-dd" />" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" required=true missingMessage="出生日期不能为空!" /></td>
			</tr>
			
			<tr>
				<th><span class="c-red">*</span>户籍类型：</th>
				<td><input id="dicResudenceKey" name="dicResudenceKey" class="f1 easyui-combobox " data-options="valueField:'id',textField:'value',limitToList:'true',editable:false,
					url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=hklx&parentKey=12000',panelMaxHeight:'200',panelHeight:'auto'"
					required=true ></td>
				<th>职业：</th>
				<td><input id="job" name="job" class="f1 easyui-combobox " value="${investigate.job }" data-options="valueField:'value',textField:'value',limitToList:true,
					url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=job&parentKey=1550000',panelMaxHeight:'200',panelHeight:'auto'" >
				</td>
			</tr>
			
			<tr>
				<th>民族：</th>
				<td><input id="nation" name="nation" class="f1 easyui-combobox" value="104001" data-options="valueField:'id',textField:'value',limitToList:'true',
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
	 				required=true >
				</td>
			</tr>
			
			
			
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
					<input name="addressProId" id="addressProId" class="easyui-combobox" required=true value="${investigate.addressProId}"  
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"></input>省
                   	<input name="addressCityId" id="addressCityId" class="easyui-combobox" required=true value="${investigate.addressCityId}"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"></input>市
                   	<input name="addressCountryId" id="addressCountryId" class="easyui-combobox" required=true value="${investigate.addressCountryId}"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"></input>县（区）<br>
                   	<input id="addressStreet" name="addressStreet" class="easyui-textbox" data-options="validType:'length[0,50]'" value="${investigate.addressStreet}">乡镇（街道）
                   	<input id="addressDetail" name="addressDetail" class="easyui-textbox" data-options="validType:'length[0,50]'" value="${investigate.addressDetail}">(详细门牌号)
					<a id="btn" href="#" class="easyui-linkbutton" iconCls="fi-page-copy icon-blue" onclick="getAddrFromReg();">同户籍所在地</a> 
					<a id="btn" href="#" class="easyui-linkbutton" iconCls="fi-page-copy icon-blue" onclick="getAddrFromHR();">同经常居住地</a> 
				</td>
			</tr>
			
			<tr style="display:none;" >
				<td colspan="4" align="center">
					<a id="investigateFormBtn2" class="easyui-linkbutton" icon="fi-checkbox icon-blue">保存并指派</a>
				</td>
			</tr>
		</table>
    </div>
</form>
<script>

$('#formBtn2').click();
function submitForm(){
	$('#investigateInfo').form('submit');
}
function clearForm(){
	$('#investigateInfo').form('clear');
}
$(function() {
	
	$("#wtdchUpload").powerWebUpload({ auto: true,fileNumLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
	
	$('#investigateInfo').form({
		url:'${ctx}/investigate/save',
		async : false,
   		onSubmit:function(){
   			progressLoad();
   			var isValid = $(this).form('validate');
            if (!isValid) {
            	progressClose();
            	$.messager.show({
        			title : '提示信息!',
        			msg : '数据验证不通过,不能保存!'
        		});
            	return isValid;
            }
            
            var wtdwxz = $('input:radio[name=dicEntrustUnitTypeKey]:checked')[0].title;
   			var wtdw = $('#entrustUnit').val();
   			if (wtdw.lastIndexOf(wtdwxz) != (wtdw.length-wtdwxz.length)) {
   				$.messager.show({
   					title : '提示信息!',
   					msg : '委托单位后缀名必须是相应性质单位!'
   				});
   				isValid = false;
            	progressClose();
   			}
            
            return isValid;
   		},
   		success:function(data){
        	progressClose();
   			data = JSON.parse(data);
   			if(data.status==200){
   				$.messager.show({
   					title:'提示信息!' ,
   					msg:data.msg
   				});
   				
   				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                parent.$.modalDialog.handler.dialog('close');
   			}else{
   				parent.$.messager.alert('错误', data.msg, 'error');
   			}
   		}
   	});	
     
});

$('#investigateFormBtn2').click(function(){
	progressLoad();
	
	if ($('#investigateInfo').form('validate')) {
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

    	setFilePathAndName('wtdchUpload');
		
		$.ajax({
			type : 'post',
			url : '${ctx}/investigate/save',
			data : $('#investigateInfo').serialize(),
			dataType : 'json',
			async : false,
			success : function(result) {
            	progressClose();
            	var id = result.data.id;
                var taskId = result.data.taskId;
                var auditType = result.data.auditType;
                var processInstanceId = result.data.processInstanceId;
                
            	assign(id,taskId,auditType,processInstanceId);
			},
			error : function(result) {
            	progressClose();
				$.messager.show({
					title : result.status == 200 ? "ok" : "fail",
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

function assign(id,taskId,auditType,processId){
	$('#investigateFormAssign').dialog({    
	    title: '指派司法所',    
        iconCls:'fi-arrow-right icon-blue',
	    width: 500,    
	    height: 200,    
	    closed: false,
	    cache: false,
	    center: true,
        resizable : true,
        maximizable:true, 
	    href: '${ctx}/investigate/formAssign?id=' + id+'&taskId='+taskId+'&auditType='+auditType+'&processInstanceId='+processId,
	    modal: true,
	    buttons : [ {
            text : '指派',
            iconCls:'fi-arrow-right icon-blue',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                $('#assignFormBtn1').click();
            }
        }, {
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                $('#assignFormBtn2').click();
            }
        } ]
	});
	$('#investigateFormAssign').window('center');
}

$('#sysGroupId').combotree({
	onChange:function(n,o){
		$("#sfsGroupName").val($('#sysGroupId').combotree('getText'));
	}
});

/*选择户籍省触发省下面的市*/
$('#regResidenceProId').combobox({
	onSelect: function(record){
		$('#regResidenceCityId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
		    valueField:'id',    
		    textField:'areaName'
		}); 
	}
});
/*选择户籍市触发市下面的县*/
$('#regResidenceCityId').combobox({
	onSelect: function(record){
		$('#regResidenceCountryId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
		    valueField:'id',    
		    textField:'areaName'
		}); 
	}
});

/*选择经常居住地省触发省下面的市*/
$('#habitualResidenceProId').combobox({
	onSelect: function(record){
		$('#habitualResidenceCityId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
		    valueField:'id',    
		    textField:'areaName'
		}); 
	}
});
/*选择经常居住地市触发市下面的县*/
$('#habitualResidenceCityId').combobox({
	onChange: function(newValue,oldValue){
		$('#habitualResidenceCountryId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent=' + newValue,    
		    valueField:'id',    
		    textField:'areaName'
		});
	}
});
/*选择籍贯省触发省下面的市*/
$('#originProId').combobox({
	onSelect: function(record){
		$('#originCityId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
		    valueField:'id',    
		    textField:'areaName'
		}); 
	}
});
/*选择籍贯市触发市下面的县*/
$('#originCityId').combobox({
	onSelect: function(record){
		$('#originCountryId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
		    valueField:'id',    
		    textField:'areaName'
		}); 
	}
});

/*选择家庭住址省触发省下面的市*/
$('#addressProId').combobox({
	onSelect: function(record){
		$('#addressCityId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
		    valueField:'id',    
		    textField:'areaName'
		}); 
	}
});
/*选择家庭住址地市触发市下面的县*/
$('#addressCityId').combobox({
	onChange: function(newValue,oldValue){
		$('#addressCountryId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
		    valueField:'id',    
		    textField:'areaName'
		});
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

$('#relevantNumber').textbox({
	onChange:function(newValue, oldValue){
		if(newValue==''){
			return;
		}
		$.ajax({
			type : 'get',
			url : '${ctx}/culpritinfo/culprit/isIdCardExist?idcard='+newValue,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			success : function(result) {
				if(result.status==500){	
					$.messager.show({
	  					title:'提示信息!',
	  					msg:result.msg
	  				});
					$('#relevantNumber').textbox('setValue','');
				}
			}
  		});
	}
})
</script>