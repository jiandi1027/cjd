<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form  action="" method="post" id="moveInAddInfo">
	<input type="hidden" name="id" id="id" value="${moveIn.id}"/>
	<input type="hidden" name="taskId" value="${moveIn.taskId }" />
	<input type="hidden" name="auditType" value="${moveIn.auditType}" />
	<input type="hidden" name="processInstanceId" value="${moveIn.processInstanceId }" />
	<input type="hidden" name="decideType" value="1" />
	<c:if test="${moveIn.auditType eq 'usertask1' }">
	<div style="display: none;">
		<input type="radio" name="decideType"value="1" checked="checked" />同意 
	</div>
	</c:if>
	 <div class="easyui-panel" title="基本信息" style="width:100%;padding:5px;">
			<table width="100%" class="grid">
				<tr>
					<th width="10%"><span class="c-red">*</span>迁入对象：</th>
					<td width="23%" style="border-right-style:none"><input name="name" value="${moveIn.name }" required=true class="easyui-textbox" data-options="validType:'chinaName'" /></td>
					<td width="10%" style="border-style:none"></td>
					<td width="23%" style="border-style:none"></td>
					<td width="10%" style="border-style:none"></td>
					<td width="23%" style="border-style:none"></td>
				</tr>
				<tr>
					<th><span class="c-red">*</span>身份证号：</th>
					<td><input type="text" name="cedentialsNumber" value="${moveIn.cedentialsNumber }" id="cedentialsNumber" data-options="required:true,validType:'idcard'" class="easyui-textbox" /></td>
					<th>性别：</th>
					<td><input name="dicSexKey" id="dicSexKey" value="${moveIn.dicSexKey }" class="easyui-combobox" required=true value="10001"
                  	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=10000',panelHeight:'auto',editable:false"></input></td>
					<th>民族：</th>
					<td><input name="nation" id="nation" value="${moveIn.nation }" class="easyui-combobox" value="104001"
                  		data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=104000',panelHeight:'130',editable:false"></input></td>
				</tr>
				<tr>
					<th>曾用名：</th>
					<td><input name="alias"  value="${moveIn.alias }" class="easyui-textbox" /></td>
					<th><span class="c-red">*</span>出生日期：</th>
					<td><input name="bornDate" value="<fmt:formatDate value="${moveIn.bornDate}" pattern="yyyy-MM-dd" />" required=true class="Wdate easyui-validatebox"  onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"/></td>
					<th><span class="c-red">*</span>文化程度：</th>
					<td><input name="dicWhcdKey"required=true value="${moveIn.dicWhcdKey}" id="dicWhcdKey" class="easyui-combobox"
                  	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=19000',panelHeight:'auto',editable:false"></input></td>
				</tr>
				<tr>
					<th><span class="c-red">*</span>婚姻状况：</th>
					<td><input name="dicHyzkKey" required=true value="${moveIn.dicHyzkKey}" id="dicHyzkKey" class="easyui-combobox" 
                  	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=11000',panelHeight:'auto',editable:false"></input></td>
					<th>职业：</th>
					<td><input id="job" name="job" class="easyui-combobox " value="${moveIn.job}"  data-options="valueField:'value',textField:'value',limitToList:true,
					url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=job&parentKey=1550000',panelMaxHeight:'200',panelHeight:'auto',editable:false" >
					</td>
					<th>原政治面貌：</th>
					<td><input name="oldPoliticStatusId" class="easyui-combobox" value="${moveIn.oldPoliticStatusId}"
                  	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=65000',panelHeight:'auto',editable:false" /></td>
				</tr>
				<tr>
					<th>原判罪名：</th>
					<td><input  name="crimeInfo" class="easyui-textbox" value="${moveIn.crimeInfo}"/></td>
					<th><span class="c-red">*</span>刑期：</th>
					<td><input name="adjudgePeriod" required=true class="easyui-textbox" value="${moveIn.adjudgePeriod}"/></td>
					<th><span class="c-red">*</span>刑罚执行类别：</th>
					<td><input name="dicPenalTypeKey" required=true class="easyui-combobox" value="${moveIn.dicPenalTypeKey}"
                  	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=20000',panelHeight:'auto',editable:false" /></td>
				</tr>
				<tr>
					<th>刑期变动：</th>
					<td><input type="text" name="adjudgeChange" class="easyui-textbox" value="${moveIn.adjudgeChange}"/></td>
					<th><span class="c-red">*</span>刑期开始日期：</th>
					<td><input name="adjudgeStartTime" id="adjudgeStartTime"  value="<fmt:formatDate value="${moveIn.adjudgeStartTime}" pattern="yyyy-MM-dd" />"  required=true class="Wdate easyui-validatebox" editable=false
					onfocus="var adjudgeEndTime=$dp.$('adjudgeEndTime');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'adjudgeEndTime\')}'})"/></td>
					<th><span class="c-red">*</span>刑期结束日期：</th>
					<td><input name="adjudgeEndTime" id="adjudgeEndTime" value="<fmt:formatDate value="${moveIn.adjudgeEndTime}" pattern="yyyy-MM-dd" />" required=true class="Wdate easyui-validatebox" editable=false
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'adjudgeStartTime\')}'})"/></td>
				</tr>
				
				<tr>
					<th><span class="c-red">*</span>矫正期限：</th>
					<td><input name="redressPeriod" required=true class="easyui-textbox" value="${moveIn.redressPeriod}"/></td>
					<th><span class="c-red">*</span>矫正开始日期：</th>
					<td><input name="redressStartDate" id="redressStartDate" value="<fmt:formatDate value="${moveIn.redressStartDate}" pattern="yyyy-MM-dd" />"  required=true class="Wdate easyui-validatebox" editable=false
					onfocus="var redressEndDate=$dp.$('redressEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'redressEndDate\')}'})"/></td>
					<th><span class="c-red">*</span>矫正结束日期：</th>
					<td><input name="redressEndDate" id="redressEndDate" value="<fmt:formatDate value="${moveIn.redressEndDate}" pattern="yyyy-MM-dd" />" required=true class="Wdate easyui-validatebox" editable=false
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'redressStartDate\')}'})"/></td>
				</tr>
				<tr>
					<th><span class="c-red">*</span>联系方式：</th>
					<td colspan="5"><input name="contactPhone" required=true data-options="validType:'telNum'" value="${moveIn.contactPhone}" class="easyui-numberbox" /></td>
				</tr>
				<tr>
				<th ><span class="c-red">*</span>籍贯：</th>
				<td colspan="5" >
					<input name="originProId" id="originProId" class="easyui-combobox"  required=true  value="${moveIn.originProId}"  
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelMaxHeight:'200',panelHeight:'auto',limitToList:'true',editable:false"></input>省
                   	<input id="originCityId" name="originCityId" class="easyui-combobox" required=true   value="${moveIn.originCityId}"
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true',editable:false">市
                   	<input id="originCountryId" name="originCountryId" class="easyui-combobox"  required=true value="${moveIn.originCountryId}"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true',editable:false">县（区）
				</td>
				</tr>
				<tr>
				<th ><span class="c-red">*</span>户籍所在地：</th>
				<td colspan="5">
					<input name="regResidenceProId1" id="regResidenceProId1" class="easyui-combobox" required=true   value="${moveIn.regResidenceProId1}"
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelMaxHeight:'200',panelHeight:'auto',limitToList:'true',editable:false"></input>省
                   	<input id="regResidenceCityId1" name="regResidenceCityId1" class="easyui-combobox" required=true  value="${moveIn.regResidenceCityId1}"
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true',editable:false">市
                   	<input id="regResidenceCountryId1" name="regResidenceCountryId1" class="easyui-combobox" required=true  value="${moveIn.regResidenceCountryId1}"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true',editable:false">县（区）
                   	<input id="regResidenceStreet1" name="regResidenceStreet1" class="f1 easyui-textbox" data-options="validType:'length[0,50]'"  value="${moveIn.regResidenceStreet1}">乡镇（街道）
                   	<input id="regResidenceDetail1" name="regResidenceDetail1" class="f1 easyui-textbox" data-options="validType:'length[0,50]'"  value="${moveIn.regResidenceDetail1}">(详细门牌号)
				</td>
				</tr>
			
			</table>
		</div>
	 <div class="easyui-panel" title="迁入相关信息" style="width:100%;padding:5px;">
	 	<table width="100%" class="grid" >
			<tr>
				<th width="10%"><span class="c-red">*</span>迁入时间：</th>
				<td width="23%"><input name="moveTime" required=true class="Wdate easyui-validatebox" value='<fmt:formatDate value="${moveIn.moveTime}" pattern="yyyy-MM-dd" />'
				 onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"/></td>
				<th width="10%"><span class="c-red">*</span>原司法所：</th>
				<td width="23%"><input  name="oldGroup" required=true class="easyui-textbox" value="${moveIn.oldGroup}"/></td>
				<th width="10%"><span class="c-red">*</span>拟迁往司法所：</th>
				<td width="23%"><input name="groupId" required=true class="easyui-combotree"
                  	data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:false"  value="${moveIn.groupId}"/></td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>现居住地：</th>
				<td colspan="5"><input name="addressProId" id="addressProId" class="easyui-combobox" required=true
					value="${moveIn.addressProId}" data-options="valueField:'id',textField:'areaName',limitToList:true,url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelHeight:'200',editable:false"></input>省
					<input name="addressCityId" id="addressCityId" class="easyui-combobox" required=true
					value="${moveIn.addressCityId}" data-options="editable:false,limitToList:true"></input>市
					<input name="addressCountryId" id="addressCountryId" class="easyui-combobox" required=true
					value="${moveIn.addressCountryId}" data-options="editable:false,limitToList:true"></input>县（区）
					<input id="addressStreet" name="addressStreet" class="easyui-textbox" value="${moveIn.addressStreet}">乡镇（街道）
					<input id="addressDetaill" name="addressDetail" class="f1 easyui-textbox" value="${moveIn.addressDetail}">(详细门牌号)</td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>拟居住地：</th>
				<td colspan="5"><input name="regResidenceProId"
					id="regResidenceProId" class="easyui-combobox" required=true 
					value="${moveIn.regResidenceProId}"
					data-options="valueField:'id',textField:'areaName',limitToList:true,url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelHeight:'200',editable:false"></input>省
					<input id="regResidenceCityId" name="regResidenceCityId" class="easyui-combobox" required=true
					value="${moveIn.regResidenceCityId}" data-options="editable:false,limitToList:true">市
					<input id="regResidenceCountryId" name="regResidenceCountryId" class="easyui-combobox" required=true
					value="${moveIn.regResidenceCountryId}" data-options="editable:false,limitToList:true">县（区）
					 <input id="regResidenceStreet" name="regResidenceStreet"
					class="f1 easyui-textbox" value="${moveIn.regResidenceStreet}">乡镇（街道）
					<input id="regResidenceDetail" name="regResidenceDetail"
					class="f1 easyui-textbox" value="${moveIn.regResidenceDetail}">(详细门牌号)</td>
			</tr>
			<tr>
				<th>居住地变更原因：</th>
				<td colspan="5">
				<textArea  name="reason" class="easyui-validatebox" style="width: 80%;height:60px;overflow:hidden;"
					onkeydown='textarealength(this,300)' onKeyUp="textarealength(this,300)" onMouseOut="textarealength(this,300)" maxlength="300">${moveIn.reason}</textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em class="textarea-length c-red">${fn:length(moveIn.reason)}</em>个字。
				</td>
			</tr>
			<tr>
				<th>司法所意见：</th>
				<td colspan="5">
				<textArea name="opinion" class="easyui-validatebox" style="width:80%;height:60px;overflow:hidden;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" onMouseOut="textarealength(this,200)" maxlength="200">${moveIn.opinion}</textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">${fn:length(moveIn.opinion)}</em>个字。
				</td>
				</tr>
			<tr>
				<th>备注：</th>
				<td colspan="5">
				<textArea name="note" class="easyui-validatebox" style="width:80%;height:60px;overflow:hidden;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" onMouseOut="textarealength(this,200)" maxlength="200">${moveIn.note}</textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">${fn:length(moveIn.note)}</em>个字。
				</td>
			</tr>
			<tr>
				<th>相关材料：</th>
				<td colspan="5">
					<div id="uploader"></div>
				</td>
			</tr>
			 <c:if test="${not empty moveIn.id}">
                 <tr>
					<th>已上传证据材料：</th>
					<td>
						<c:forEach var="sysFile" items="${fileList}">
						<div id="file_${sysFile.id}">${sysFile.originName}
						<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
					</c:forEach>
					</td>
				</tr>
			</c:if>
		</table>
	 </div>
	</form>
	<div style="text-align: center;display: none;">
    	<a id="zhipanWithSaveBtn" class="easyui-linkbutton" >指派</a>
   	</div>
<script type="text/javascript">
$("#uploader").powerWebUpload({ auto: true,fileNumLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
$('#moveInAddInfo').form({
	url:'${ctx}/culprit/moveIn/save',
	onSubmit:function(){
		 progressLoad();
		 var isValid = $(this).form('validate');
         if (!isValid) {
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
			 parent.$.messager.alert('错误', result.msg, 'error');
		}
		
	}
});	

//指派
$('#zhipanWithSaveBtn').click(function (){
	if($("#moveInAddInfo").form('validate')){
    	   $.ajax({
				type: 'post' ,
				url: '${ctx}/culprit/moveIn/submitMoveInAudit',
				cache:false ,
				data:$.serializeObject($('#moveInAddInfo')) ,
				dataType:'json',
				success:function(data){
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
		             parent.$.modalDialog.handler.dialog('close');
				} ,
				error:function(result){
					$.messager.show({
	  					title:'提示信息!',
	  					msg:data.msg
	  				});
				}
			});
		}else{
			 $.messager.show({
				title:'提示信息!' ,
				msg:'验证失败！请检查数据是否已填写完整!'
			}); 

		} 
});




/*选择户口省触发省下面的市*/
$('#regResidenceProId').combobox({
	onSelect: function(record){
		$('#regResidenceCityId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
		    valueField:'id',    
		    textField:'areaName',
		    editable:'false'   
		}); 
	}
});
/*选择户口省触发省下面的市*/
$('#regResidenceProId1').combobox({
	onSelect: function(record){
		$('#regResidenceCityId1').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
		    valueField:'id',    
		    textField:'areaName',
		    editable:'false'   
		}); 
	}
});
var regflag = false;
/*选择户口市触发市下面的县*/
$('#regResidenceCityId').combobox({
	onChange: function(newValue,oldValue){
		regflag =true;
			$('#regResidenceCountryId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
		    valueField:'id',    
		    textField:'areaName',
	    editable:'false' 
			}); 
	},
	onSelect: function(record){
		if (regflag != true) {
			regflag =true;
   			$('#regResidenceCountryId').combobox({    
   			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
   		    valueField:'id',    
   		    textField:'areaName',
		    editable:'false' 
   			}); 
		}
	}
});
var regflag1 = false;
/*选择户口市触发市下面的县*/
$('#regResidenceCityId1').combobox({
	onChange: function(newValue,oldValue){
		regflag1 =true;
			$('#regResidenceCountryId1').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
		    valueField:'id',    
		    textField:'areaName',
	    editable:'false' 
			}); 
	},
	onSelect: function(record){
		if (regflag1 != true) {
			regflag1 =true;
   			$('#regResidenceCountryId1').combobox({    
   			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
   		    valueField:'id',    
   		    textField:'areaName',
		    editable:'false' 
   			}); 
		}
	}
});
/*选择固定居住省触发省下面的市*/
	$('#addressProId').combobox({    
		onSelect: function(record){
		$('#addressCityId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
		    valueField:'id',    
		    textField:'areaName',
		    editable:'false'    
		}); 
	}   
	}); 
 /*选择固定居住省触发省下面的市*/
	 /* $('#addressCityId').combobox({    
		url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent=46',    
	    valueField:'id',    
	    textField:'areaName',
    editable:'false'    
	});    */

	var addflag2 = false;
/*选择固定市触发市下面的县*/
$('#addressCityId').combobox({
		onChange: function(newValue,oldValue){
		addflag2 = true;
			$('#addressCountryId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
		    valueField:'id',    
		    textField:'areaName',
	    editable:'false' 
			}); 
	},
	onSelect: function(record){
		if(addflag2 != true)
		{
			addflag2 = true;
   			$('#addressCountryId').combobox({    
   			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
   		    valueField:'id',    
   		    textField:'areaName',
		    editable:'false' 
   			}); 
		}
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
 $('#cedentialsNumber').textbox({
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
					$('#cedentialsNumber').textbox('setValue','');
				}
			}
  		});
	}
}) 
</script>