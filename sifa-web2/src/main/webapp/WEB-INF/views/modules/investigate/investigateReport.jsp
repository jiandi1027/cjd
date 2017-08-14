<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>


<form action="${ctx}/investigate/investigateAudit" method="post" id="submitAuditReportForm">
	<input type="hidden" name="taskId" value="${investigate.taskId}"/>
	<input type="hidden" name="id" value="${investigate.id}"/>
	<input type="hidden" name="auditType" value="${investigate.auditType}"/>
	<input type="hidden" name="processInstanceId" value="${investigate.processInstanceId}"/>
	
	<div class="easyui-panel" title="被调查人员基本信息" style="width:100%;padding:5px">
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
	
	<div class="easyui-panel" title="调查人员基本信息" style="width:100%;padding:5px;">
		<table width="100%" class="grid">
	        <tr>
				<th width="10%">姓名：</th>
				<td width="40%">${investigate.investigator1}</td>
				<th width="10%">单位职务：</th>
				<td width="40%">${investigate.position1}</td>
			</tr>
			<tr>
				<th>姓名：</th>
				<td>${investigate.investigator2}</td>
				<th>单位职务：</th>
				<td>${investigate.position2}</td>
			</tr>
			<tr>
				<th>协理员：</th> 
				<td>${investigate.assistor1}</td>
				<th>单位职务：</th>
				<td>${investigate.position3}</td>
			</tr>
			<tr>
				<th>调查起始：</th> 
				<td><fmt:formatDate value="${investigate.begTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<th>调查截止：</th>
				<td><fmt:formatDate value="${investigate.endTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
        </table>
    </div>
    
    <div class="easyui-panel" title="家庭背景" style="width:100%;padding:5px;">
		<table width="100%" class="grid">
	        <tr>
				<th width="10%">家庭成员与调查对象相处情况：</th>
				<td colspan="3" width="90%"><textArea id="familySituation" name="familySituation" class="easyui-validatebox" readonly="readonly" 
					style="width: 80%;height:50px;overflow:auto;resize:none;" >${investigate.familySituation}</textArea>
				</td>
			</tr>
	        <tr>
				<th>家庭经济状况：</th>
				<td colspan="3" width="90%"><textArea id="economicStatus" name="economicStatus" class="easyui-validatebox" readonly="readonly" 
					style="width: 80%;height:50px;overflow:auto;resize:none;" >${investigate.economicStatus}</textArea>
				</td>
			</tr>
	        <tr>
				<th>未成年对象的其他情况：</th>
				<td colspan="3" width="90%"><textArea id="minorOtherCases" name="minorOtherCases" class="easyui-validatebox" readonly="readonly" 
					style="width: 80%;height:50px;overflow:auto;resize:none;" >${investigate.minorOtherCases}</textArea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<table class="easyui-datagrid" id="investigateMember2_list" title="家庭成员信息列表" style="width:100%;height:330px;" 
						data-options="singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
						fitColumns:true,url:'${ctx}/investigate/investigateFamily/list?preInvestId=${investigate.id }',method:'post'">
					<thead>
						<tr>
							<th data-options="field:'dicRelationKey',width:'20%',align:'center'" >关系</th>
							<th data-options="field:'name',width:'17%',align:'center'" >姓名</th>
							<th data-options="field:'birthday',width:'20%',align:'center'" >出生日期</th>
							<th data-options="field:'job',width:'20%',align:'center'" >职业</th>
							<th data-options="field:'phone',width:'20%',align:'center'" >联系方式</th>
						</tr>
					</thead>
					</table>
				</td>
			</tr>
        </table>
    </div>
    <div id="investigateAuditCheck"></div>
	
	<div class="easyui-panel" title="个性特点" style="width:100%;padding:5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">生理状况：</th>
				<td width="40%">${investigate.physiConditions}
				</td>
				<th width="10%">心理特征：</th>
				<td width="40%">${investigate.psychFeature}
				</td>
			</tr>
			<tr>
				<th>性格类型：</th>
				<td>${investigate.mettleType}
				</td>
				<th>爱好特长：</th>
				<td>${investigate.hobbies}
				</td>
			</tr>
		</table>
	</div>
	
	<div class="easyui-panel" title="犯罪前表现" style="width:100%;padding:5px;">
		<table width="100%" class="grid">
			
			<tr>
				<th width="10%">工作(学习)表现：</th>
				<td width="40%">${investigate.display}
				</td>
				<th width="10%">业余生活：</th>
				<td width="40%">${investigate.amateurLife}
				</td>
			</tr>
			<tr>
				<th>邻里关系：</th>
				<td>${investigate.neighborhoodRelations}
				</td>
				<th>社会交往：</th>
				<td>${investigate.socialInteraction}
				</td>
			</tr>
			<tr>
				<th>违纪违法情况：</th>
				<td>${investigate.badFact}
				</td>
				<th></th>
				<td>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="easyui-panel" title="悔罪表现" style="width:100%;padding:5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">对犯罪行为的认识：</th>
				<td width="40%">${investigate.crimeAcquaint}
				</td>
				<th width="10%">悔过态度：</th>
				<td width="40%">${investigate.repentantAttitude}
				</td>
			</tr>
			<tr>
				<th>罚金刑履行情况及履行能力：</th>
				<td>${investigate.fineFulfillAbility}
				</td>
				<th>附带民事赔偿履行情况及履行能力：</th>
				<td>${investigate.reparationFulfillAbility}
				</td>
			</tr>
		</table>
	</div>
	
	<div class="easyui-panel" title="社会反响" style="width:100%;padding:5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">被害人或其亲属态度：</th>
				<td width="40%">${investigate.victimAttitude}
				</td>
				<th width="10%">社会公众态度：</th>
				<td width="40%">${investigate.publicAttitude}
				</td>
			</tr>
		</table>
	</div>
	
	<div class="easyui-panel" title="监管条件" style="width:100%;padding:5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">家庭成员态度：</th>
				<td width="40%">${investigate.familyAttitude}
				</td>
				<th width="10%">生活环境：</th>
				<td width="40%">${investigate.lifeEnvironment}
				</td>
			</tr>
			<tr>
				<th>村（居、社区）基层组织意见：</th>
				<td colspan="3" width="90%"><textArea id="basicView" name="basicView" class="easyui-validatebox" readonly="readonly" 
					style="width: 80%;height:50px;overflow:auto;resize:none;" >${investigate.basicView}</textArea>
				</td>
			</tr>
			<tr>
				<th>相关附件：</th>
				<td colspan="3">
					<div id="wtdchUploadIng">
						<c:forEach var="sysFile" items="${fileList1}">
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
	
	<div class="easyui-panel" title="公安派出所意见" style="width:100%;padding:5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">公安派出所意见：</th>
				<td colspan="3" width="90%"><textArea id="policeView" name="policeView" class="easyui-validatebox" readonly="readonly" 
					style="width: 80%;height:50px;overflow:auto;resize:none;" >${investigate.policeView}</textArea>
				</td>
			</tr>
			<tr>
				<th>相关附件：</th>
				<td colspan="3">
					<div id="wtdchUploadIng">
						<c:forEach var="sysFile" items="${fileList2}">
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

	<div class="easyui-panel" title="调查情况" style="width: 100%; padding: 5px;margin-bottom: 10px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">笔录附件：</th>
				<td colspan="3" width="90%">
					<div id="wtdchUploadIng">
						<c:forEach var="sysFile" items="${fileList3}">
							<div id="file_${sysFile.id}">
								${sysFile.originName}
								<div class="webuploadDelbtn"
									onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
							</div>
						</c:forEach>
					</div>
				</td>
			</tr>
			<tr style="display:none;" >
				<td colspan="4" align="center">
					<a id="reportBtn1" class="easyui-linkbutton" >上报解锁</a>
					<a id="reportBtn2" class="easyui-linkbutton" >审核</a>
					<a id="reportBtn3" class="easyui-linkbutton" >退回</a>
					<a id="reportBtn4" class="easyui-linkbutton" >关闭</a>
				</td>
			</tr>
		</table>
	</div>
	
</form>


<script type="text/javascript">
$(function() {
	/* $('#investigateMember_list').datagrid({
		fit : true
	}); */
});

$('#reportBtn1').click(function (){
	$.messager.confirm('提示信息', '是否确定解除上报锁定?', function(r) {
		if (r) {
			progressLoad();
			$.ajax({
				type : 'post',
				url : '${ctx}/investigate/investigateAudit?type=1',
				data : $('#submitAuditReportForm').serialize(),
				dataType : 'json',
	  			cache : false,
	  			async : false, //同步请求
				success : function(result) {
	            	progressClose();
					$.messager.show({
						title : '提示信息',
						msg : '解锁成功'
					});

					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
				    parent.$.modalDialog.handler.dialog('close');
				},
				error : function(result) {
	            	progressClose();
					$.messager.show({
						title : '提示信息',
						msg : '解锁失败'
					});
				}
			});
		}
	});
});

$('#reportBtn2').click(function (){
	var url = '${ctx}/investigate/investigateAuditCheck?id=${investigate.id}&taskId=${investigate.taskId}&auditType=${investigate.auditType}&processInstanceId=${investigate.processInstanceId}';
	$('#investigateAuditCheck').dialog({    
	    title: '审核评定',    
        iconCls:'fi-clipboard-pencil icon-blue',
	    width: 800,
	    //height: 500,
        //width : sy.getBrowerWidth()-500,
        height : sy.getBrowerHeight()-150,
	    href: url,    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'审核',
			iconCls:'fi-clipboard-pencil icon-blue',
			handler:function(){
                parent.$.modalDialog.openner_dataGrid = $('#investigate_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
				$('#auditCheckBtn1').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#auditCheckBtn2').click();
			}
		}]
	});
	$('#investigateAuditCheck').window('center');
});

$('#reportBtn3').click(function (){
	$.messager.confirm('提示信息', '是否确定退回?', function(r) {
		if (r) {
			progressLoad();
			$.ajax({
				type : 'post',
				url : '${ctx}/investigate/investigateAudit?type=2',
				data : $('#submitAuditReportForm').serialize(),
				dataType : 'json',
	  			cache : false,
	  			async : false, //同步请求
				success : function(result) {
	            	progressClose();
					$.messager.show({
						title : '提示信息',
						msg : '退回成功'
					});

					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
				    parent.$.modalDialog.handler.dialog('close');
				},
				error : function(result) {
	            	progressClose();
					$.messager.show({
						title : '提示信息',
						msg : '退回失败'
					});
				}
			});
		}
	});
});

$('#reportBtn4').click(function (){
	parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
    parent.$.modalDialog.handler.dialog('close');
});

</script>
</body>
</html>