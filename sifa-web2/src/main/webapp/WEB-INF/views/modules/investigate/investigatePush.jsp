<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/investigate/investigateAudit" method="post" id="investigatePush">
	<input type="hidden" name="taskId" value="${investigate.taskId}"/>
	<input type="hidden" name="id" value="${investigate.id}"/>
	<input type="hidden" name="auditType" value="${investigate.auditType}"/>
	
	<div class="easyui-panel" title="被调查人员基本信息" style="width:100%;padding:5px;">
		<table width="100%" class="grid">
	        <tr>
	        	<th width="10%">姓名：</th>
				<td width="23%">${investigate.name}</td>
				<th width="10%">性别：</th>
				<td width="23%">${fns:getSysDicValueByKey('common_table', 'sex', investigate.dicSexKey, '') }</td>
				<th width="10%">民族：</th>
				<td width="23%">${fns:getSysDicValueByKey('common_table', 'nation', investigate.nation, '') }</td>
	        </tr>
						
			<tr>
				<th>曾用名：</th>
				<td>${investigate.oldName}</td>
				<th>别名：</th>
				<td>${investigate.alias}</td>
				<th>身份证号：</th>
				<td>${investigate.relevantNumber}</td>
			</tr>
			
			<tr>
				<th>出生日期：</th>
				<td><fmt:formatDate value="${investigate.bornDate}" pattern="yyyy-MM-dd" /></td>
				<th>籍贯：</th>
				<td>
					<c:choose>
						<c:when test="${ investigate.originProId == '1110000' || investigate.originProId == '1120000' 
									|| investigate.originProId == '1500000' || investigate.originProId == '1310000' }">
							${fns:getAreaValueById(investigate.originProId, '') }${fns:getAreaValueById(investigate.originCityId, '') }
						</c:when> 
						<c:otherwise>
							${fns:getAreaValueById(investigate.originProId, '') }${fns:getAreaValueById(investigate.originCityId, '') }${fns:getAreaValueById(investigate.originCountryId, '')}
						</c:otherwise>
					</c:choose>
				</td>
				<th>家庭住址：</th>
				<td>
					<c:choose>
						<c:when test="${ investigate.addressProId == '1110000' || investigate.addressProId == '1120000' 
									|| investigate.addressProId == '1500000' || investigate.addressProId == '1310000' }">
							${fns:getAreaValueById(investigate.addressProId, '') }${fns:getAreaValueById(investigate.addressCityId, '') }${investigate.addressStreet}${investigate.addressDetail}	
						</c:when> 
						<c:otherwise>
							${fns:getAreaValueById(investigate.addressProId, '') }${fns:getAreaValueById(investigate.addressCityId, '') }${fns:getAreaValueById(investigate.addressCountryId, '') }${investigate.addressStreet}${investigate.addressDetail}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			
			<tr>
				<th>联系方式：</th>
				<td>${investigate.contactPhone}</td>
				<th>案由：</th>
				<td>${investigate.crimeReason}</td>
				<th>经常居住地：</th>
				<td>
					<c:choose>
						<c:when test="${ investigate.habitualResidenceProId == '1110000' || investigate.habitualResidenceProId == '1120000' 
									|| investigate.habitualResidenceProId == '1500000' || investigate.habitualResidenceProId == '1310000' }">
							${fns:getAreaValueById(investigate.habitualResidenceProId, '') }${fns:getAreaValueById(investigate.habitualResidenceCityId, '') }${investigate.habitualResidenceStreet}${investigate.habitualResidenceDetail}	
						</c:when> 
						<c:otherwise>
							${fns:getAreaValueById(investigate.habitualResidenceProId, '') }${fns:getAreaValueById(investigate.habitualResidenceCityId, '') }${fns:getAreaValueById(investigate.habitualResidenceCountryId, '') }${investigate.habitualResidenceStreet}${investigate.habitualResidenceDetail}
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			
			<tr>
				<th>职业：</th>
				<td>${investigate.job}</td>
				<th>拟提请类型：</th>
				<td>${fns:getSysDicValueByKey('sf_investigate', 'entrust_type_id', investigate.entrustTypeId, '') }</td>
				<th>户籍类型：</th>
				<td>${fns:getSysDicValueByKey('common_table', 'hklx', investigate.dicResudenceKey, '') }</td>
			</tr>
			
			<tr>
				<th>附件下载：</th>
				<td colspan="5">
				<div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList}">
					<div id="file_${sysFile.id}">
					${sysFile.originName}
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
				</div>
				</td>
			</tr>
			
		</table>
    </div>
    
    <div class="easyui-panel" title="调查人员基本信息" style="width:100%;padding:5px;margin-bottom: 10px;">
		<table width="100%" class="grid">
	        <tr>
				<th width="10%"><span class="c-red">*</span>姓名：</th>
				<td width="40%"><input id="investigatorId1" name="investigatorId1" class="easyui-combobox" required=true missingMessage="调查人员姓名不能为空!" style="width:173px;"  
					data-options="valueField:'id',textField:'name',limitToList:'true',url:'${ctx}/sys/sysPerson/findSfsPerson?type=52001,52002,52003',panelMaxHeight:'200',panelHeight:'auto'">
					<input type="hidden" id="investigator1" name="investigator1" class="easyui-validatebox" value=""/></td>
				<th width="10%">单位职务：</th>
				<td width="40%"><input id="position1" name="position1" class="easyui-textbox easyui-validatebox" value=""/></td>
			</tr>
			<tr>
				<th>姓名：</th>
				<td><input id="investigatorId2" name="investigatorId2" class="easyui-combobox" style="width:173px;"  
					data-options="valueField:'id',textField:'name',limitToList:'true',url:'${ctx}/sys/sysPerson/findSfsPerson?type=52001,52002,52003',panelMaxHeight:'200',panelHeight:'auto'">
					<input type="hidden" id="investigator2" name="investigator2" class="easyui-validatebox" value=""/></td>
				<th>单位职务：</th>
				<td><input id="position2" name="position2" class="easyui-textbox easyui-validatebox" value=""/></td>
			</tr>
			<tr>
				<th>协理员：</th> 
				<td><input id="assistorId1" name="assistorId1" class="easyui-combobox" style="width:173px;"  
					data-options="valueField:'id',textField:'name',limitToList:'true',url:'${ctx}/sys/sysPerson/findSfsPerson?type=52004',panelMaxHeight:'200',panelHeight:'auto'">
					<input type="hidden" id="assistor1" name="assistor1" class="easyui-validatebox" value=""/></td>
				<th>单位职务：</th>
				<td><input id="position3" name="position3" class="easyui-textbox easyui-validatebox" value=""/></td>
			</tr>
        </table>
    </div>
</form>
<script type="text/javascript">
var type = 1;

$(function() {
	$('#investigatePush').form({
		url:'${ctx}/investigate/investigateAudit?update=true&type=' + type,
		async : false,
   		onSubmit:function(){
   			progressLoad();
   			var isValid = $(this).form('validate');
            if (!isValid) {
            	progressClose();
            	return isValid;
            }
            
            return isValid;
   		},
   		success:function(data){
        	progressClose();
   			data = JSON.parse(data);
   			if(data.status==200){
   				$.messager.show({
   					title:'提示信息!' ,
   					msg:'受理成功'
   				});
   				
   				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                parent.$.modalDialog.handler.dialog('close');
   			}else{
   				parent.$.messager.alert('错误', result.msg, 'error');
   			}
   		}
   	});	
});

$('#investigatorId1').combobox({
	onChange:function(){
		$('#investigator1').val($('#investigatorId1').combobox('getText'));
		progressLoad();
		$.ajax({
			type : 'post',
			url : '${ctx}/sys/sysPerson/findPosition?id=' + $('#investigatorId1').combobox('getValue'),
  			cache : false,
  			async : false, //同步请求
			success : function(result) {
            	progressClose();
				$('#position1').textbox('setValue', result);
			},
			error : function(result) {
            	progressClose();
			}
		});
	}
});
$('#investigatorId2').combobox({
	onChange:function(){ 
		$('#investigator2').val($('#investigatorId2').combobox('getText'));
		progressLoad();
		$.ajax({
			type : 'post',
			url : '${ctx}/sys/sysPerson/findPosition?id=' + $('#investigatorId2').combobox('getValue'),
  			cache : false,
  			async : false, //同步请求
			success : function(result) {
            	progressClose();
				$('#position2').textbox('setValue', result);
			},
			error : function(result) {
            	progressClose();
			}
		});
	}
});
$('#assistorId1').combobox({
	onChange:function(){ 
		$('#assistor1').val($('#assistorId1').combobox('getText'));
		progressLoad();
		$.ajax({
			type : 'post',
			url : '${ctx}/sys/sysPerson/findPosition?id=' + $('#assistorId1').combobox('getValue'),
  			cache : false,
  			async : false, //同步请求
			success : function(result) {
            	progressClose();
				$('#position3').textbox('setValue', result);
			},
			error : function(result) {
            	progressClose();
			}
		});
	}
});

</script>
</body>
</html>