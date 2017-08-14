<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<style>
 th td{
 font-size:1em;
 }

</style>

<form action="${ctx}/investigate/investigateAudit" method="post" id="submitWorkerReportForm">
	<input type="hidden" name="taskId" value="${investigate.taskId}"/>
	<input type="hidden" name="id" value="${investigate.id}"/>
	<input type="hidden" name="auditType" value="${investigate.auditType}"/>
	
	<div class="easyui-panel" title="被调查人员基本信息" style="width:100%; padding:5px;margin:0 auto;">
		<table width="100%" class="grid" style="table-layout:fixed;">
			<tr>
	        	<th width="10%"><span class="c-red">*</span>姓名：</th>
				<td width="23%"><input type="text" id="name" name="name" class="f1 easyui-textbox " value="${investigate.name }" required=true missingMessage="被调查对象姓名不能为空!" 
					data-options="validType:'length[0,20]'"/></td>
				<th width="10%"><span class="c-red">*</span>性别：</th>
				<td width="23%"><input id="dicSexKey" name="dicSexKey" class="easyui-combobox " value="${investigate.dicSexKey }" 
					data-options="valueField:'id',textField:'value',limitToList:'true',editable:false,
					url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=sex&parentKey=10000',panelMaxHeight:'200',panelHeight:'auto'"
    				required=true missingMessage="性别不能为空!" ></td>
				<th width="10%">民族：</th>
				<td width="23%"><input id="nation" name="nation" class="f1 easyui-combobox" value="${investigate.nation}" 
					data-options="valueField:'id',textField:'value',limitToList:'true',
	 				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=nation&parentKey=104000',panelMaxHeight:'200',panelHeight:'auto'" ></td>
	        </tr>
						
			<tr>
				<th width="10%">曾用名：</th>
				<td width="23%"><input type="text" name="oldName" class="f1 easyui-textbox " value="${investigate.oldName }" 
					data-options="validType:'length[0,20]'"/></td>
				<th width="10%">别名：</th>
				<td width="23%"><input type="text" name="alias" class="f1 easyui-textbox " value="${investigate.alias }" 
					data-options="validType:'length[0,20]'"/></td>
				<th width="10%"><span class="c-red">*</span>身份证号：</th>
				<td width="23%"><input type="text" id="relevantNumber" name="relevantNumber" class="f1 easyui-textbox easyui-validatebox" data-options="validType:'idcard'" 
					value="${investigate.relevantNumber }" required=true data-options="validType:'length[0,18]'"/></td>
			</tr>
			
			<tr>
				<th><span class="c-red">*</span>出生日期：</th>
				<td><input type="text" id="bornDate" name="bornDate" class="Wdate easyui-validatebox" value="<fmt:formatDate value="${investigate.bornDate }"
					pattern="yyyy-MM-dd" />" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" required=true missingMessage="出生日期不能为空!" /></td>
				<th><span class="c-red">*</span>拟提请类型：</th>
				<td><input id="entrustTypeId" name="entrustTypeId" class="f1 easyui-combobox " value="${investigate.entrustTypeId }" 
					data-options="valueField:'id',textField:'value',limitToList:'true',editable:false,
	 				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_investigate&columnName=entrust_type_id&parentKey=20000',panelMaxHeight:'200',panelHeight:'auto'" 
	 				required=true ></td>
				<th><span class="c-red">*</span>户籍类型：</th>
				<td><input id="dicResudenceKey" name="dicResudenceKey" class="f1 easyui-combobox " value="${investigate.dicResudenceKey }" 
					data-options="valueField:'id',textField:'value',limitToList:'true',editable:false,
					url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=hklx&parentKey=12000',panelMaxHeight:'200',panelHeight:'auto'"
					required=true ></td>
			</tr>
			
			<tr>
				<th><span class="c-red">*</span>联系方式：</th>
				<td><input type="text" id="contactPhone" name="contactPhone" class="f1 easyui-textbox easyui-validatebox" data-options="validType:'telNum'" 
					value="${investigate.contactPhone }" maxlength="11" data-options="validType:'length[0,11]'" required=true/></td>
				<th><span class="c-red">*</span>案由：</th>
				<td><input type="text" id="crimeReason" name="crimeReason" value="${investigate.crimeReason }" required=true class="f1 easyui-textbox " 
					data-options="validType:'length[0,333]'"/></td>
				<th>职业：</th>
				<td><input id="job" name="job" class="f1 easyui-combobox " value="${investigate.job }" data-options="valueField:'value',textField:'value',
					url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=job&parentKey=1550000',panelMaxHeight:'200',panelHeight:'auto'" ></td>
			</tr>
			
			<tr>
				<th>籍贯：</th>
				<td colspan="5">
					<input name="originProId" id="originProId" class="easyui-combobox" value="${investigate.originProId }"  
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"></input>省
                   	<input id="originCityId" name="originCityId" class="easyui-combobox" value="${investigate.originCityId }"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'">市
                   	<input id="originCountryId" name="originCountryId" class="easyui-combobox" value="${investigate.originCountryId }"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'">县（区）
                </td>
			</tr>
			
			<tr>
				<th><span class="c-red">*</span>经常居住地：</th>
				<td colspan="5">
					<input name="habitualResidenceProId" id="habitualResidenceProId" class="easyui-combobox" required=true value="${investigate.habitualResidenceProId}"  
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"></input>省
                   	<input name="habitualResidenceCityId" id="habitualResidenceCityId" class="easyui-combobox" required=true value="${investigate.habitualResidenceCityId}"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"></input>市
                   	<input name="habitualResidenceCountryId" id="habitualResidenceCountryId" class="easyui-combobox" required=true value="${investigate.habitualResidenceCountryId}"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"></input>县（区）
                   	<input id="habitualResidenceStreet" name="habitualResidenceStreet" class="easyui-textbox" value="${investigate.habitualResidenceStreet}">乡镇（街道）
                   	<input id="habitualResidenceDetail" name="habitualResidenceDetail" class="f1 easyui-textbox" value="${investigate.habitualResidenceDetail}">(详细门牌号)
				</td>
			</tr>
			
			<tr>
				<th><span class="c-red">*</span>家庭住址：</th>
				<%-- <td><input type="text" id="address" name="address" class="f1 easyui-textbox " value="${investigate.address }"  required=true
					data-options="validType:'length[0,50]'"/></td> --%>
				<td colspan="5" width="80%">
					<input name="addressProId" id="addressProId" class="easyui-combobox" required=true value="${investigate.addressProId }"  
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"></input>省
                   	<input id="addressCityId" name="addressCityId" class="easyui-combobox" required=true value="${investigate.addressCityId }"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'">市
                   	<input id="addressCountryId" name="addressCountryId" class="easyui-combobox" required=true value="${investigate.addressCountryId }"  
                   		data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'">县（区）
                   	<input id="addressStreet" name="addressStreet" class="f1 easyui-textbox" data-options="validType:'length[0,50]'" value="${investigate.addressStreet }" >乡镇（街道）
                   	<input id="addressDetail" name="addressDetail" class="f1 easyui-textbox" data-options="validType:'length[0,50]'" value="${investigate.addressDetail }" >(详细门牌号)
					<a id="btn" href="#" class="easyui-linkbutton" iconCls="fi-page-copy icon-blue" onclick="getAddrFromHR();">同经常居住地</a> 
				</td>
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
				<c:choose>
				<c:when test="${investigate.investigatorId2 == '' || investigate.investigatorId2 == null}">
				<th><span class="c-red">*</span>姓名：</th>
				<td><input id="investigatorId2" name="investigatorId2" class="easyui-combobox" 
					url="${ctx}/sys/sysPerson/findSfsPerson?type=52001,52002,52003" valueField="id" textField="name" value="" 
					required=true missingMessage="调查人员姓名不能为空!" panelHeight="auto" panelMaxHeight="200px" limitToList="true" />
					<input type="hidden" id="investigator2" name="investigator2" value="" /></td>
				<th>单位职务：</th>
				<td><input id="position2" name="position2" value=""/></td>
				</c:when>
				<c:otherwise>
				<th>姓名：</th>
				<td>${investigate.investigator2}</td>
				<th>单位职务：</th>
				<td>${investigate.position2}</td>
				</c:otherwise>
				</c:choose>
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
				<td colspan="3" width="90%"><textArea id="familySituation" name="familySituation" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200">${investigate.familySituation}</textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
			</tr>
	        <tr>
				<th>家庭经济状况：</th>
				<td colspan="3" width="90%"><textArea id="economicStatus" name="economicStatus" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200">${investigate.economicStatus}</textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
			</tr>
	        <tr>
				<th>未成年对象的其他情况：</th>
				<td colspan="3" width="90%"><textArea id="minorOtherCases" name="minorOtherCases" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200">${investigate.minorOtherCases}</textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<table class="easyui-datagrid" id="investigateMember_list" title="家庭成员信息列表" style="width:100%;height:330px" 
						data-options="singleSelect:true,collapsible:true,striped:true,toolbar:'#investigateMemberToolbar',loadMsg: '数据正在加载,请耐心的等待...' ,
						fitColumns:true,url:'${ctx}/investigate/investigateFamily/list?preInvestId=${investigate.id }',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-wrench').linkbutton({text:'修改',plain:true,iconCls:'fi-wrench icon-blue'});
                        $('.organization-easyui-linkbutton-x').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
					<thead>
						<tr>
							<th data-options="field:'id',checkbox:true" >编号</th>
							<th data-options="field:'dicRelationKey',width:'13%',align:'center'" >关系</th>
							<th data-options="field:'name',width:'15%',align:'center'" >姓名</th>
							<th data-options="field:'birthday',width:'15%',align:'center'" >出生日期</th>
							<th data-options="field:'job',width:'15%',align:'center'" >职业</th>
							<th data-options="field:'phone',width:'15%',align:'center'" >联系方式</th>
			 				<th data-options="field:'_opt',width:'20%',align:'center',formatter:formatOper" >操作</th>
						</tr>
					</thead>
					</table>
				</td>
			</tr>
        </table>
    </div>
    <div id="investigateFamily"></div>
    <div id="investigateAuditOpinion"></div>
	<div id="investigateMemberToolbar" style="display: none;">
        <a id="toAddFamily" onclick="addFamily();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
	</div>
	
	<div class="easyui-panel" title="个性特点" style="width:100%;padding:5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">生理状况：</th>
				<td width="40%">
				<input id="physiConditions" name="physiConditions" class="easyui-textbox easyui-validatebox" value="${investigate.physiConditions}"/>
				</td>
				<th width="10%">心理特征：</th>
				<td width="40%">
				<input id="psychFeature" name="psychFeature" class="easyui-textbox easyui-validatebox" value="${investigate.psychFeature}"/>
				</td>
			</tr>
			<tr>
				<th>性格类型：</th>
				<td>
				<input id="mettleType" name="mettleType" class="easyui-textbox easyui-validatebox" value="${investigate.mettleType}"/>
				</td>
				<th>爱好特长：</th>
				<td>
				<input id="hobbies" name="hobbies" class="easyui-textbox easyui-validatebox" value="${investigate.hobbies}"/>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="easyui-panel" title="犯罪前表现" style="width:100%;padding:5px;">
		<table width="100%" class="grid">
			
			<tr>
				<th width="10%">工作(学习)表现：</th>
				<td width="40%">
				<input id="display" name="display" class="easyui-textbox easyui-validatebox" value="${investigate.display}"/>
				</td>
				<th width="10%">业余生活：</th>
				<td width="40%">
				<input id="amateurLife" name="amateurLife" class="easyui-textbox easyui-validatebox" value="${investigate.amateurLife}"/>
				</td>
			</tr>
			<tr>
				<th>邻里关系：</th>
				<td>
				<input id="neighborhoodRelations" name="neighborhoodRelations" class="easyui-textbox easyui-validatebox" value="${investigate.neighborhoodRelations}"/>
				</td>
				<th>社会交往：</th>
				<td>
				<input id="socialInteraction" name="socialInteraction" class="easyui-textbox easyui-validatebox" value="${investigate.socialInteraction}"/>
				</td>
			</tr>
			<tr>
				<th>违纪违法情况：</th>
				<td>
				<input id="badFact" name="badFact" class="easyui-textbox easyui-validatebox" value="${investigate.badFact}"/>
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
				<td width="40%">
				<input id="crimeAcquaint" name="crimeAcquaint" class="easyui-textbox easyui-validatebox" value="${investigate.crimeAcquaint}"/>
				</td>
				<th width="10%">悔过态度：</th>
				<td width="40%">
				<input id="repentantAttitude" name="repentantAttitude" class="easyui-textbox easyui-validatebox" value="${investigate.repentantAttitude}"/>
				</td>
			</tr>
			<tr>
				<th>罚金刑履行情况及履行能力：</th>
				<td>
				<input id="fineFulfillAbility" name="fineFulfillAbility" class="easyui-textbox easyui-validatebox" value="${investigate.fineFulfillAbility}"/>
				</td>
				<th>附带民事赔偿履行情况及履行能力：</th>
				<td>
				<input id="reparationFulfillAbility" name="reparationFulfillAbility" class="easyui-textbox easyui-validatebox" value="${investigate.reparationFulfillAbility}"/>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="easyui-panel" title="社会反响" style="width:100%;padding:5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">被害人或其亲属态度：</th>
				<td width="40%">
				<input id="victimAttitude" name="victimAttitude" class="easyui-textbox easyui-validatebox" value="${investigate.victimAttitude}"/>
				</td>
				<th width="10%">社会公众态度：</th>
				<td width="40%">
				<input id="publicAttitude" name="publicAttitude" class="easyui-textbox easyui-validatebox" value="${investigate.publicAttitude}"/>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="easyui-panel" title="监管条件" style="width:100%;padding:5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">家庭成员态度：</th>
				<td width="40%">
				<input id="familyAttitude" name="familyAttitude" class="easyui-textbox easyui-validatebox" value="${investigate.familyAttitude}"/>
				</td>
				<th width="10%">生活环境：</th>
				<td width="40%">
				<input id="lifeEnvironment" name="lifeEnvironment" class="easyui-textbox easyui-validatebox" value="${investigate.lifeEnvironment}"/>
				</td>
			</tr>
			<tr>
				<th>村（居、社区）基层组织意见：</th>
				<td colspan="3" width="90%"><textArea id="basicView" name="basicView" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200">${investigate.basicView}</textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</p>
				</td>
			</tr>
			<tr>
            	<th>相关附件：</th>
            	<td colspan="3">
            		<div id="basicViewUpload"></div>
					<input type="hidden" name="basicViewUploadUrl" id="basicViewUrl">
					<input type="hidden" name="basicViewUploadPathName" id="basicViewPathName">
					<input type="hidden" name="basicViewUploadPath" id="basicViewPath">
            	</td>
            </tr>
			<tr>
            	<th>已上传附件：</th>
            	<td colspan="3">
            	<div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList1}">
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
	
	<div class="easyui-panel" title="公安派出所意见" style="width:100%;padding:5px;margin-bottom: 10px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">公安派出所意见：</th>
				<td colspan="3" width="90%"><textArea id="policeView" name="policeView" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200">${investigate.policeView}</textArea>
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
						
					</p>
				</td>
			</tr>
			<tr>
            	<th>相关附件：</th>
            	<td colspan="3">
            		<div id="policeViewUpload"></div>
					<input type="hidden" name="policeViewUploadUrl" id="policeViewUrl">
					<input type="hidden" name="policeViewUploadPathName" id="policeViewPathName">
					<input type="hidden" name="policeViewUploadPath" id="policeViewPath">
            	</td>
            </tr>
			<tr>
            	<th>已上传附件：</th>
            	<td colspan="3">
            	<div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList2}">
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
	
	<div class="easyui-panel" title="调查情况" style="width:100%;padding:5px;margin-bottom: 10px;">
		<table width="100%" class="grid">
			<tr>
            	<th width="10%">调查笔录：</th>
            	<td colspan="3" width="90%"><div id="preRecordUpload"></div>
					<input type="hidden" name="preRecordUploadUrl" id="preRecordUrl">
					<input type="hidden" name="preRecordUploadPathName" id="preRecordPathName">
					<input type="hidden" name="preRecordUploadPath" id="preRecordPath">
            	</td>
            </tr>
			<tr>
            	<th>已上传附件：</th>
            	<td colspan="3">
            	<div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList3}">
					<div id="file_${sysFile.id}">
					${sysFile.originName}
					<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
				</div>
            	</td>
            </tr>
			
			<tr style="display:none;" >
				<td colspan="4" align="center">
					<a id="workerReportBtn1" class="easyui-linkbutton" icon="fi-save icon-green">保存</a>
					<a id="workerReportBtn2" class="easyui-linkbutton" icon="fi-checkbox icon-blue">上报</a>
					<a id="workerReportBtn3" class="easyui-linkbutton" icon="fi-x icon-red">关闭</a>
				</td>
			</tr>
		</table>
	</div>
	
</form>


<script type="text/javascript">
$(function() {
	$("#basicViewUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
	$("#policeViewUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
	$("#preRecordUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
});

$('#workerReportBtn1').click(function (){
	progressLoad();
	if ($('#submitWorkerReportForm').form('validate')) {
        setFilePathAndName('basicViewUpload');
        setFilePathAndName('policeViewUpload');
        setFilePathAndName('preRecordUpload');
		
		$.ajax({
			type : 'post',
			url : '${ctx}/investigate/investigateAudit?update=true',
			data : $('#submitWorkerReportForm').serialize(),
			dataType : 'json',
			async : false,
			success : function(result) {
            	progressClose();
				$.messager.show({
					title : '提示信息',
					msg :  '保存成功'
				});
			},
			error : function(result) {
            	progressClose();
				$.messager.show({
					title :  '提示信息',
					msg :  '保存失败'
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

$('#workerReportBtn2').click(function (){
	progressLoad();
	if ($('#submitWorkerReportForm').form('validate')) {
        setFilePathAndName('basicViewUpload');
        setFilePathAndName('policeViewUpload');
        setFilePathAndName('preRecordUpload');
        
        
		$.ajax({
			type : 'post',
			url : '${ctx}/investigate/investigateAudit?update=true',
			data : $('#submitWorkerReportForm').serialize(),
			dataType : 'json',
			async : false,
			success : function(result) {
		    	progressClose();
				
				doReport();
			},
			error : function(result) {
		    	progressClose();
				$.messager.show({
					title :  '提示信息',
					msg :  '上报失败'
				});
			}
		});
	}else {
    	progressClose();
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能上报!'
		});
	}
});

function doReport(){
	var url = '${ctx}/investigate/investigateAuditOpinion?id=${investigate.id}&taskId=${investigate.taskId}&auditType=${investigate.auditType}';
	$('#investigateAuditOpinion').dialog({    
	    title: '评估上报',    
        iconCls:'fi-arrow-up icon-blue',
	    width: 800,    
	    height: 600,    
	    href: url,    
        resizable : true,
        maximizable:true, 
	    modal: true,
	    buttons :[{
			text:'保存',
			iconCls:'fi-save icon-blue',
			handler:function(){
				$('#auditOpinionBtn1').click();
			}
		}, {
			text:'上报',
			iconCls:'fi-arrow-up icon-blue',
			handler:function(){
				$('#auditOpinionBtn2').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#auditOpinionBtn3').click();
			}
		}]
	});
	$('#investigateAuditOpinion').window('center');
}

$('#workerReportBtn3').click(function (){
	parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
    parent.$.modalDialog.handler.dialog('close');
});

function formatOper(val,row,index){
	var operation ='<a href="javascript:void(0);" class="organization-easyui-linkbutton-wrench" '
		+'onclick="addFamily(\''+row.id+'\')"></a>';
	operation +='&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-x" '
		+'onclick="deleteFamily(\''+row.id+'\')"></a>';

	return operation;
}

$('#investigatorId2').combobox({
	onChange:function(){ 
		$('#investigator2').val($('#investigatorId2').combobox('getText'));
	}
});

function addFamily(id){
	var url = '${ctx}/investigate/investigateFamily/form?preInvestId=${investigate.id}';
	if (id != null && id != '' && id != undefined) {
		url += '&id=' + id;
	}
	
	$('#investigateFamily').dialog({    
	    title: '调查评估家庭成员对象',
        iconCls:'fi-pencil icon-blue',
	    width: 400,    
	    height: 360,    
	    closed: false,
	    cache: false,
	    center: true,
        resizable : true,
        maximizable:true, 
	    href: url,
	    modal: true,
	    buttons : [ {
            text : '保存',
            iconCls:'icon-save',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#investigateMember_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                $('#familyBtn1').click();
            }
        }, {
            text : '重置',
            iconCls:'fi-x icon-blue',
            handler : function() {
            	//$('#investigate_list').datagrid().datagrid('reload');
            	//parent.$.modalDialog.handler.dialog('close');
                parent.$.modalDialog.openner_dataGrid = $('#investigateMember_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                $('#familyBtn2').click();
            }
        } ]
	});
	$('#investigateFamily').window('center');
}

function deleteFamily(id){
	$.messager.confirm('提示信息', '确认删除该家庭成员?', function(r) {
		if (r) {
			//ids = ids.substring(0, ids.length - 1);
			$.post('${ctx}/investigate/investigateFamily/delete', {
				id : id
			}, function(result) {
				//1 刷新数据表格 
				$('#investigateMember_list').datagrid('reload');
				//2 清空idField   
				$('#investigateMember_list').datagrid('uncheckAll');
				//3 给提示信息 
				$.messager.show({
					title : '提示信息!',
					msg : '删除成功!'
				});
			});
		} else {
			return;
		}
	});
}

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
				if (result != null && result != '') {
					$('#position2').val(result);
				}
			},
			error : function(result) {
            	progressClose();
			}
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
	onSelect: function(record){
		$('#habitualResidenceCountryId').combobox({    
			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
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
</body>
</html>