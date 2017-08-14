<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form action="" method="post" id="culpritInfo">
	<input type="hidden" name="id" id="id" value="${culprit.id}" />
	<input type="hidden" name="dicFirstReportGetKey" value="${culprit.dicFirstReportGetKey}" />
	<input type="hidden" name="dicFirstReportTypeKey" value="${culprit.dicFirstReportTypeKey}" />
	<div class="easyui-panel" title="报到情况相关" style="width: 100%; padding: 5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">报道情况：</th>
				<td width="8%" style="border:0;">
					<!-- style为了radio与文字平行 1为正常 2为漏管--> <input type="radio" name="dicReportInfoKey" id="dicReportInfoKey1" value="1"
					<c:if test='${culprit.dicReportInfoKey eq 1 || culprit.dicReportInfoKey==null}'>checked='checked'</c:if>
					style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;" />正常
					
				</td>
				<td width="10%" style="border:0;"><input type="radio" name="dicReportInfoKey" id="dicReportInfoKey2" value="2"
					<c:if test='${culprit.dicReportInfoKey eq 2}'>checked='checked'</c:if>
					style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;" />漏管
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td style="border:0;"><input id="ReportType" class="easyui-combobox" name="dicReportTypeKey" required=true style="width: 200px;"
					value="${culprit.dicReportTypeKey}"
					data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_culprit&columnName=dic_reportType_Key&parentKey=74000',panelHeight:'auto',editable:false,disabled: true,
    				onSelect: function(rec){     
			            if( rec.id=='74002'){
			            	$('#dicWslxKey').combobox({disabled:true});  
			            	$('#indictmentNum1').textbox({disabled:true}); 
			            	$('#legalDocsStartDate').validatebox('disable');
			            	$('#executeNotificationNum').textbox({disabled:true});
			            	$('#executeNotificationDate').validatebox({disabled:true});
			            	$('#legalDocsReceiveT').validatebox({disabled:true});
			            	$('#adjudgeOrg').textbox({disabled:true});
			            	$('#dicCrimeTypeKey').combobox({disabled:true});  
			            	$('#crimeInfo').textbox({disabled:true}); 
			            	$('#dicYpxfKey').combobox({disabled:true});
			            	$('#adjudgeId').textbox({disabled:true});
			            	$('#adjudgeDate').validatebox('disable');
			            	$('#adjudgePeriod').textbox({disabled:true});
			            	$('#adjudgeStartTime').validatebox({disabled:true});
			            	$('#adjudgeEndTime').validatebox({disabled:true});
			            	$('#adjudgeRedressT').validatebox({disabled:true});
			            	$('#dicPenalTypeKey').combobox({disabled:true});
			            	$('#adjudgeRedressOrg').textbox({disabled:true});
			            	$('#redressPeriod').textbox({disabled:true});
			            	$('#redressStartDate').validatebox({disabled:true});
			            	$('#redressEndDate').validatebox({disabled:true});
			            	$('#limitDate').validatebox({disabled:true});
			            	$('#dicSfgtfzKey').attr('disabled',true);
        					$('#dicHaveTogetherKey').attr('disabled',true);
			            }else{
			            	$('#dicWslxKey').combobox({disabled:false});  
			            	$('#indictmentNum1').textbox({disabled:false}); 
			            	$('#legalDocsStartDate').validatebox('enable');
			            	$('#executeNotificationNum').textbox({disabled:false});
			            	$('#executeNotificationDate').validatebox({disabled:false});
			            	$('#legalDocsReceiveT').validatebox({disabled:false});
			            	$('#adjudgeOrg').textbox({disabled:false});
			            	$('#dicCrimeTypeKey').combobox({disabled:false});  
			            	$('#crimeInfo').textbox({disabled:false}); 
			            	$('#dicYpxfKey').combobox({disabled:false});
			            	$('#adjudgeId').textbox({disabled:false});
			            	$('#adjudgeDate').validatebox('enable');
			            	$('#adjudgePeriod').textbox({disabled:false});
			            	$('#adjudgeStartTime').validatebox({disabled:false});
			            	$('#adjudgeEndTime').validatebox({disabled:false});
			            	$('#adjudgeRedressT').validatebox({disabled:false});
			            	$('#dicPenalTypeKey').combobox({disabled:false});
			            	$('#adjudgeRedressOrg').textbox({disabled:false});
			            	$('#redressPeriod').textbox({disabled:false});
			            	$('#redressStartDate').validatebox({disabled:false});
			            	$('#redressEndDate').validatebox({disabled:false});
			            	$('#limitDate').validatebox({disabled:false});
			            	$('#dicSfgtfzKey').attr('disabled',false);
        					$('#dicHaveTogetherKey').attr('disabled',false);
			            }
			        }">
				</td>

			</tr>
		</table>
	</div>
	<div class="easyui-panel" title="基本信息相关" style="width: 100%; padding: 5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%"><span class="c-red">*</span>司法所：</th>
				<td width="20%"><select id="sysGroupId" name="groupId" required=true
					class="easyui-combotree" style="width: 170px;"
					data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:false,value:<c:if test='${culprit.groupId!=null}'>${culprit.groupId}</c:if><c:if test='${culprit.groupId==null}'>''</c:if>">
				</select></td>
				<th width="10%">人员编号：</th>
				<td width="20%"><input name="no" id="no" required=true
					class="f1 easyui-textbox" readonly="readonly" value="${culprit.no}"></input></td>
				<th width="10%">是否成年：</th>
				<td width="20%">
					<!-- style为了radio与文字平行--> <input type="radio" name="dicIsAdultKey"
					value="0"
					<c:if test='${culprit.dicIsAdultKey eq 0 || culprit.dicIsAdultKey==null}'>checked='checked'</c:if>
					style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;" />是&nbsp;&nbsp;&nbsp;
					<input type="radio" name="dicIsAdultKey" value="1"
					<c:if test='${culprit.dicIsAdultKey eq 1}'>checked='checked'</c:if>
					style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;" />否
				</td> 
				<td width="10%" rowspan=5 align="center">
				<img id="headimg" src="${filePath}/${image.path}/${image.name}" style="cursor: pointer;" height="170px;" width="90%;"></td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>姓名：</th>
				<td><input name="name" id="name" class="f1 easyui-textbox" required=true value="${culprit.name}" data-options="validType:'chinaName'" /><br/> 
					<a id="btn" href="#" class="easyui-linkbutton" onclick="readidCard()" data-options="iconCls:'fi-torso icon-blue'">身份证读取</a></td>
				<th><span class="c-red">*</span>证件类型：</th>
				<td><input name="dicZjlxKey" id="dicZjlxKey"
					class="easyui-combobox" required=true
					value="<c:if test='${culprit.dicZjlxKey!=null}'>${culprit.dicZjlxKey}</c:if><c:if test='${culprit.dicZjlxKey==null}'>86001</c:if>"
					data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=86000',panelHeight:'auto',editable:false"></input></td>
				<th><span class="c-red">*</span>证件号码：</th>
				<td><input id="identification"  class="easyui-validatebox"  required=true value="${culprit.identification}" data-options="disabled: true"></input>
					<!-- <br/> 
					<a href="#" class="easyui-linkbutton" onclick="matchInvestigate()" data-options="iconCls:'fi-torso icon-blue'">审前匹配</a> -->
				</td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>性别：</th>
				<td><input name="dicSexKey" id="dicSexKey" class="easyui-combobox" required=true
					value="<c:if test='${culprit.dicSexKey!=null}'>${culprit.dicSexKey}</c:if><c:if test='${culprit.dicSexKey==null}'>10001</c:if>"
					data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=10000',panelHeight:'auto',editable:false"></input></td>
				<th>民族：</th>
				<td><input name="nation" id="nation" class="easyui-combobox"
					value="<c:if test='${culprit.nation!=null}'>${culprit.nation}</c:if><c:if test='${culprit.nation==null}'>104001</c:if>"
					data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=104000',panelHeight:'200',editable:false"></input></td>
				<th><span class="c-red">*</span>籍贯：</th>
				<td><input name="origin" id="origin" class="f1 easyui-textbox"
					required=true value="${culprit.origin}"></input></td>
			</tr>
			<tr>

				<th><span class="c-red">*</span>出生日期：</th>
				<td><input type="text" name="birthday" id="birthday"
					required=true
					value="<fmt:formatDate value="${culprit.birthday}" pattern="yyyy-MM-dd" />"
					editable=false class="Wdate"
					onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
				<th><span class="c-red">*</span>联系方式：</th>
				<td><input name="contactPhone" id="contactPhone"
					class="easyui-numberbox" required=true
					value="${culprit.contactPhone}" data-options="validType:'telno'"></input></td>
				<th>户籍性质：</th>
				<td><input name="dicHklxKey" id="dicHklxKey"
					class="easyui-combobox" required=true
					value="<c:if test='${culprit.dicHklxKey!=null}'>${culprit.dicHklxKey}</c:if><c:if test='${culprit.dicHklxKey==null}'>12001</c:if>"
					data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=12000',panelHeight:'auto',editable:false"></input></td>
			</tr>

			<tr>
				<th>曾用名：</th>
				<td><input name="alias" id="alias" class="easyui-textbox"
					value="${culprit.alias}"></input></td>
				<th>婚姻状况：</th>
				<td><input name="dicHyzkKey" id="dicHyzkKey" class="easyui-combobox" required=true
					value="<c:if test='${culprit.dicHyzkKey!=null}'>${culprit.dicHyzkKey}</c:if><c:if test='${culprit.dicHyzkKey==null}'>11001</c:if>"
					data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=11000',panelHeight:'auto',editable:false"></input></td>
				<th>文化程度：</th>
				<td><input name="dicWhcdKey" id="dicWhcdKey"
					class="easyui-combobox" required=true
					value="<c:if test='${culprit.dicWhcdKey!=null}'>${culprit.dicWhcdKey}</c:if><c:if test='${culprit.dicWhcdKey==null}'>19001</c:if>"
					data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=19000',panelHeight:'auto',editable:false"></input></td>
			</tr>
			<tr>
				<th>出生地：</th>
				<td><input name="homePlace" class="f1 easyui-textbox"
					value="${culprit.homePlace}"></input></td> 
				<th>现在工作单位：</th>
				<td><input name="newJob" id="newJob" class="f1 easyui-textbox"
					value="${culprit.newJob}"></input></td>
				<th width="10%">单位联系方式：</th>
				<td width="20%"><input name="jobPhone" class="easyui-textbox"
					value="${culprit.jobPhone}" data-options="validType:'telNum'"></input></td>
				<td align="center">
					<div id="imageUpload"></div> 
					<input type="hidden" name="imageUploadPathName" id="imagePathName"> 
					<input type="hidden" name="imageUploadUrl" id="imageUrl">
					<input type="hidden" name="imageUploadPath" id="imagePath">
				</td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>户籍详细地址：</th>
				<td colspan="8"><input name="regResidenceProId"
					id="regResidenceProId" class="easyui-combobox" required=true 
					value="${culprit.regResidenceProId}"
					data-options="valueField:'id',textField:'areaName',limitToList:true,url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelHeight:'200',editable:false"></input>省
					<input id="regResidenceCityId" name="regResidenceCityId" class="easyui-combobox" required=true
					value="${culprit.regResidenceCityId}" data-options="editable:false,limitToList:true">市
					<input id="regResidenceCountryId" name="regResidenceCountryId" class="easyui-combobox" required=true
					value="${culprit.regResidenceCountryId}" data-options="editable:false,limitToList:true">县（区）
					 <input id="regResidenceStreet" name="regResidenceStreet"
					class="f1 easyui-textbox" value="${culprit.regResidenceStreet}">乡镇（街道）
					<input id="regResidenceDetail" name="regResidenceDetail"
					class="f1 easyui-textbox" value="${culprit.regResidenceDetail}">(详细门牌号)
				</td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>居住地详细地址：</th>
				<td colspan="8"><input name="addressProId" id="addressProId" class="easyui-combobox" required=true
					value="${culprit.addressProId}" data-options="valueField:'id',textField:'areaName',limitToList:true,url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelHeight:'200',editable:false"></input>省
					<input name="addressCityId" id="addressCityId" class="easyui-combobox" required=true
					value="${culprit.addressCityId}" data-options="editable:false,limitToList:true"></input>市
					<input name="addressCountryId" id="addressCountryId" class="easyui-combobox" required=true
					value="${culprit.addressCountryId}" data-options="editable:false,limitToList:true"></input>县（区）
					<input id="addressStreet" name="addressStreet" class="easyui-textbox" value="${culprit.addressStreet}">乡镇（街道）
					<input id="addressDetail" name="addressDetail" class="f1 easyui-textbox" value="${culprit.addressDetail}">(详细门牌号)
					&nbsp;&nbsp;<a  href="#" class="easyui-linkbutton" data-options="iconCls:'fi-page-copy icon-blue'" onclick="getAddress();">同户籍所在地</a></td>
			</tr>
		</table>

	</div>

	<div class="easyui-panel" title="罪犯押送情况相关"
		style="width: 100%; padding: 5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%"><span class="c-red">*</span>人员接收方式：</th>
				<td width="90%"><input name="dicReceiveTypeKey"
					id="dicReceiveTypeKey" class="easyui-combobox" required=true
					value="${culprit.culpritJudgment.dicReceiveTypeKey }"
					data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=70000',panelHeight:'auto',editable:false,
                    	onSelect: function(rec){       
			           if(rec.id=='70002'){
			           		$('#addPolice').linkbutton({'disabled':false});
			           }else{
			           		$('#addPolice').linkbutton({'disabled':true});
			           }
			        }">
					<%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="addPolice" href="#" class="easyui-linkbutton" onclick="addPolice(${culprit.id})" data-options="iconCls:'fi-plus icon-green'" disabled=true>新增押送民警信息</a></td>  --%>
			</tr>
		</table>
		<!-- <div id="addPolice"></div> -->
		<%-- <table class="easyui-datagrid" id="judg_list_content" style="height: 200px;" disabled=true
			data-options="singleSelect:true,collapsible:true,striped:true,fitColumns:true,loadMsg: '数据正在加载,请耐心的等待...'  ,pagination:true,pageSize: 5 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/sys/culpritJudgment/list',method:'post',queryParams:{culpritId:'1'}">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:true,width:80">编号</th>
					<th data-options="field:'name',width:150,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">执行押送民警姓名</th>
					<th data-options="field:'identification',width:230,align:'center'" editor="text">单位</th>
					<th data-options="field:'groupName',width:200,align:'center'" editor="text">职务</th>
					<th data-options="field:'escortDate',width:200,align:'center'" editor="text">押送时间</th>
					<th data-options="field:'action',width:160,align:'center'" >操作</th><!-- formatter="formatterJudg" -->
				</tr>
			</thead>
		</table> --%>
	</div>
	<div id="lawList" class="easyui-panel" title="法律文书相关"
		style="width: 100%; padding: 5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%"><span class="c-red">*</span>文书类型：</th>
				<td width="20%"><input name="dicWslxKey" id="dicWslxKey" class="easyui-combobox" required=true
					value="<c:if test='${culpritLaw.dicWslxKey!=null}'>${culpritLaw.dicWslxKey}</c:if><c:if test='${culpritLaw.dicWslxKey==null}'>125001</c:if>"
					data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=125000',panelHeight:'auto',editable:false"></input></td>
				<th width="10%"><span class="c-red">*</span>文书编号：</th>
				<td width="20%"><input name="indictmentNum" id="indictmentNum1"
					class="f1 easyui-textbox" required=true
					value="${culpritLaw.indictmentNum}"></input></td>
				<th width="10%"><span class="c-red">*</span>文书生效日期：</th>
				<td width="30%"><input name="legalDocsStartDate"
					id="legalDocsStartDate"
					value="<fmt:formatDate value="${culpritLaw.legalDocsStartDate}"
									pattern="yyyy-MM-dd" />"
					required=true editable=false onblur="checkLimitTime();"
					class="Wdate easyui-validatebox"
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd'})"></input></td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>执行通知书文号：</th>
				<td><input name="executeNotificationNum" id="executeNotificationNum"
					class="f1 easyui-textbox" required=true
					value="${culpritLaw.executeNotificationNum}"></input></td>
				<th><span class="c-red">*</span>执行通知书日期：</th>
				<td><input name="executeNotificationDate" id="executeNotificationDate" required=true
					value="<fmt:formatDate value="${culpritLaw.executeNotificationDate}"
									pattern="yyyy-MM-dd" />"
					editable=false class="Wdate easyui-validatebox"
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd'})"></input></td>
				<th><span class="c-red">*</span>法律文书收到日期：</th>
				<td><input name="legalDocsReceiveT" id="legalDocsReceiveT" required=true
					value="<fmt:formatDate value="${culpritLaw.legalDocsReceiveT}"
									pattern="yyyy-MM-dd" />"
					editable=false class="Wdate easyui-validatebox"
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd'})"></input></td>

			</tr>
			<tr>
				<th><span class="c-red">*</span>审判机关名称：</th>
				<td><input name="adjudgeOrg" id="adjudgeOrg" class="f1 easyui-textbox" data-options="validType:'checkadOrg'"
					required=true value="${culprit.culpritJudgment.adjudgeOrg }"></input></td>
				<th><span class="c-red">*</span>犯罪类型：</th>
				<td><input name="dicCrimeTypeKey" id="dicCrimeTypeKey" class="easyui-combobox"
					required=true value="${culprit.culpritJudgment.dicCrimeTypeKey }"
					data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=26000',panelHeight:'auto',editable:false"></input></td>
				<th><span class="c-red">*</span>具体罪名：</th>
				<td><input name="crimeInfo" id="crimeInfo" class="f1 easyui-textbox"
					required=true value="${culprit.culpritJudgment.crimeInfo }"></input></td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>原判刑罚：</th>
				<td><input name="dicYpxfKey" id="dicYpxfKey" class="easyui-combobox"
					required=true value="${culprit.culpritJudgment.dicYpxfKey }"
					data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=72000',panelHeight:'auto',editable:false"></input></td>
				<th>判决书编号：</th>
				<td><input name="adjudgeId" id="adjudgeId" class="f1 easyui-textbox"
					value="${culprit.culpritJudgment.adjudgeId }"></input></td>
				<th>判决日期：</th>
				<td><input name="adjudgeDate" id="adjudgeDate" 
					value="<fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate}" pattern="yyyy-MM-dd" />" class="Wdate easyui-validatebox"
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd'})"></input></td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>原判刑期：</th>
				<td><input name="adjudgePeriod" id="adjudgePeriod"
					class="f1 easyui-textbox" required=true
					value="${culprit.culpritJudgment.adjudgePeriod }"></input></td>
				<th><span class="c-red">*</span>刑期开始日期：</th>
				<td><input name="adjudgeStartTime" id="adjudgeStartTime"
					required=true
					value="<fmt:formatDate value="${culprit.culpritJudgment.adjudgeStartTime}"
									pattern="yyyy-MM-dd" />"
					editable=false class="Wdate easyui-validatebox"
					onfocus="var adjudgeEndTime=$dp.$('adjudgeEndTime');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'adjudgeEndTime\')}'})"></input></td>
				<th><span class="c-red">*</span>刑期结束日期：</th>
				<td><input name="adjudgeEndTime" id="adjudgeEndTime"
					required=true
					value="<fmt:formatDate value="${culprit.culpritJudgment.adjudgeEndTime}"
									pattern="yyyy-MM-dd" />"
					editable=false class="Wdate easyui-validatebox"
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'adjudgeStartTime\')}'})" /></input></td>
			</tr>
			<tr>
				<th>裁决日期：</th>
				<td><input name="adjudgeRedressT" id="adjudgeRedressT"
					value="<fmt:formatDate value="${culprit.culpritJudgment.adjudgeRedressT}"
									pattern="yyyy-MM-dd" />"
					editable=false class="Wdate easyui-validatebox"
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd'})"></input></td>
				<th><span class="c-red">*</span>矫正类别：</th>
				<td><input name="dicPenalTypeKey" id="dicPenalTypeKey" class="easyui-combobox"
					required=true value="${culprit.culpritJudgment.dicPenalTypeKey }"
					data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=20000',panelHeight:'auto',editable:false"></input></td>
				<th><span class="c-red">*</span>社区矫正决定机关：</th>
				<td><input name="adjudgeRedressOrg" id="adjudgeRedressOrg" class="f1 easyui-textbox" data-options="validType:'checkadOrg'"
					required=true value="${culprit.culpritJudgment.adjudgeRedressOrg}"></input>
					&nbsp;&nbsp;<a  href="#" class="easyui-linkbutton" data-options="iconCls:'fi-page-copy icon-blue'" onclick="equalAdjudgeOrg();">同审判机关</a>
				</td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>矫正期限：</th>
				<td><input name="redressPeriod" id="redressPeriod" class="f1 easyui-textbox"
					id="redressPeriod"  required=true
					value="${culprit.culpritJudgment.redressPeriod }"></input></td>
				<th><span class="c-red">*</span>矫正开始时间：</th>
				<td><input name="redressStartDate" id="redressStartDate"
					required=true
					value="<fmt:formatDate value="${culprit.culpritJudgment.redressStartDate}"
									pattern="yyyy-MM-dd" />"
					editable=false class="Wdate easyui-validatebox"
					onfocus="var redressEndDate=$dp.$('redressEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'redressEndDate\')}'})"></input></td>
				<th><span class="c-red">*</span>矫正结束时间：</th>
				<td><input name="redressEndDate" id="redressEndDate"
					required=true value="<fmt:formatDate value="${culprit.culpritJudgment.redressEndDate}" pattern="yyyy-MM-dd" />"
					editable=false class="Wdate easyui-validatebox"
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'redressStartDate\')}'})"></input>
					&nbsp;&nbsp;<a  href="#" class="easyui-linkbutton" data-options="iconCls:'fi-page-copy icon-blue'" onclick="equalAdjudgeEndTime();">同刑期结束时间</a>
					</td>
			</tr>

			<tr>
				<th>是否共同犯罪：</th>
				<td>
					<input type="radio" name="dicSfgtfzKey" id="dicSfgtfzKey" value="0"
					<c:if test='${culprit.culpritJudgment.dicSfgtfzKey eq "0" }'>checked='checked'</c:if>
					style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;" />是&nbsp;&nbsp;&nbsp;
					<input type="radio" name="dicSfgtfzKey" value="1"
					<c:if test='${culprit.culpritJudgment.dicSfgtfzKey eq "1" || culprit.culpritJudgment.dicSfgtfzKey==null}'>checked='checked'</c:if>
					style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;" />否
				</td>
				<th>有无同矫正对象：</th>
				<td>
					<input type="radio" name="dicHaveTogetherKey" id="dicHaveTogetherKey" value="0"
					<c:if test='${culprit.culpritJudgment.dicHaveTogetherKey eq "0" }'>checked='checked'</c:if>
					style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;" />是&nbsp;&nbsp;&nbsp;
					<input type="radio" name="dicHaveTogetherKey" value="1"
					<c:if test='${culprit.culpritJudgment.dicHaveTogetherKey eq "1" || culprit.culpritJudgment.dicHaveTogetherKey==null}'>checked='checked'</c:if>
					style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;" />否
				</td> 
				<th><span class="c-red">*</span>首次报道截止时间：</th>
				<td><input name="limitDate" id="limitDate" required=true
					value="<fmt:formatDate value="${culprit.culpritJudgment.limitDate}"
									pattern="yyyy-MM-dd" />"
					class="Wdate easyui-validatebox"
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd'})"></input></td>
			</tr>
			<tr rowspan="3">
				<th>主要犯罪事实：</th>
				<td colspan="6"><textarea name="crimeFact" id="crimeFact" class="easyui-validatebox" multiline="true"
						onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)' onMouseOut="textarealength(this,200)" 
						style="width: 80%; height: 80px; overflow: hidden;" maxlength=200>${culprit.culpritJudgment.crimeFact}</textarea> <br />
					<p class="textarea-numberbar">
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em
							class="textarea-length c-red">${fn:length(culprit.culpritJudgment.crimeFact)}</em>个字。
					</p></td>
			</tr>
			<tr>
				<th>上传<span id="lawBook">法律文书</span>：</th>
				<td colspan="6">
					<div id="legalDocsUpload"></div> 
					<input type="hidden" name="legalDocsUploadPathName" id="legalDocsPathName" > 
					<input type="hidden" name="legalDocsUploadUrl" id="legalDocsUrl" >
					<input type="hidden" name="legalDocsUploadPath" id="legalDocsPath" >
				</td>
			</tr>
			<c:if test="${not empty culprit.id}">
			<tr>
				<th>已上传文书：</th>
				<td colspan="6">
					<c:forEach var="sysFile" items="${fileList2}">
					<div id="file_${sysFile.id}">${sysFile.originName}
					<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
				</td>
			</tr>
			</c:if>
			
			<tr style="display: none;">
				<td colspan="7" align="center">
				<a id="culpritAddFormBtn1" class="easyui-linkbutton" icon="fi-save icon-blue">保存</a></td>
			</tr>
		</table>
	</div>
	<%-- <div class="easyui-panel" title="已上传法律文书列表" style="width:100%;padding:5px">
     	<table class="easyui-datagrid" id="judg_list_content" style="height: 200px;"
			data-options="singleSelect:true,collapsible:true,striped:true,fitColumns:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 5,pageList:[5,10,15,20,50] ,fitColumns:true,url:'${ctx}/culprit/culpritLaw/list?culpritId=${culprit.id}',method:'post',onLoadSuccess:function (data) {
                        $('.easyui-linkbutton-fi-x').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:true,width:80">编号</th>
					<th data-options="field:'legalDocsName',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">法律文书名称</th>
					<th data-options="field:'indictmentNum',width:250,align:'center'" editor="text">法律文书编号</th>
					<th data-options="field:'dicWslxKey',width:200,align:'center',formatter:function(value,rowData,rowIndex){    
						    	 return sy.getDicValue('sf_culpritLaw','dicWslxKey',rowData.dicWslxKey,''); }" editor="text">法律文书类型</th>
					<th data-options="field:'created',width:250,align:'center'" editor="text">上传时间</th>
					<th data-options="field:'action',width:160,align:'center'" formatter="formatterLawAct">操作</th>
				</tr>
			</thead>
		</table> 
    </div> --%>
</form>
<script type="text/javascript">

$('#culpritAddFormBtn1').click(function(){
	setFilePathAndName('imageUpload');
	setFilePathAndName('legalDocsUpload');
	//progressLoad();
	if ($('#culpritInfo').form('validate')) {
		$.ajax({
			type : 'post',
			url : '${ctx}/culpritinfo/culprit/save?flag=0',
			data : $('#culpritInfo').serialize(),
			dataType : 'json',
			async : false,
			success : function(result) {
            	//progressClose();
            	parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
      		 	parent.$.modalDialog.handler.dialog('close');	
				$.messager.show({
					title : '提示信息!',
					msg : result.msg
				});
			},
			error : function(result) {
            	//progressClose();
				$.messager.show({
					title : '提示信息!',
					msg : result.msg
				});
			}
		});
	}else {
    	//progressClose();
		$.messager.show({
			title : '提示信息!',
			msg : '数据验证不通过,不能保存!'
		});
	}
});


   $(function(){
	   $("#legalDocsUpload").powerWebUpload({ auto: true,fileNumLimit:1,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});	
	   $("#imageUpload").powerWebUpload({ auto: true,fileNumLimit:1,serverPath:'${ctx}/servlet/file/upload',imageId:"headimg",selectTitle:"上传照片",fileType:'jpg'});	
        /* $('#culpritInfo').form({
    		url:'${ctx}/culpritinfo/culprit/save',
    		onSubmit:function(o){
    			o.flag=0;
    			setFilePathAndName('imageUpload');
    			setFilePathAndName('legalDocsUpload');
    			return $(this).form('validate');
    		},
    		success:function(data){
    			data = JSON.parse(data);
    			if(data.status==200){
    				$.messager.show({
    					title:'提示信息!' ,
    					msg:data.msg
    				});	
      		 	parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
      		 	parent.$.modalDialog.handler.dialog('close');	
    			
    			}else{
    				alert(data.msg);
    			}
    			
    		}
    	}); */
        
        
        $('#dicZjlxKey').combobox({
        	onSelect: function(record){
        		$('#identification').textbox({ disabled: false });
        		$("#identification").removeAttr("name");
        		if(record.key=="86001"){
        			$("#identification").attr("name","identification");
        			$('#identification').textbox({ validType:'idcard'});
        		}else if(record.key=="86002"){
        			$("#identification").attr("name","passportNum");
        			$('#identification').textbox({ validType:'passportNum' });
        		}else if(record.key=="86003"){
        			$("#identification").attr("name","returnCardNum");
        		}else{
        			$("#identification").attr("name","compatriotsCardNum");
        		}

        	}
        });
    	
    	 $('#identification').textbox({ 
			onChange:function(newValue, oldValue){
				if(newValue==''){
					return;
				}
				$.ajax({
	   				type : 'get',
	   				url : '${ctx}/culpritinfo/culprit/matchInvestigateAndMoveIn?identification='+newValue,
	   				cache : false,
	   				async : false, //同步请求
	   				dataType : 'json',
	   				success : function(result) {
	   					if(result.status==500){	
	   						$('#culpritInfo').form('clear');
	   						//$('#name').textbox('setValue','');
	   						//$('#identification').textbox('setValue','');
		   						$.messager.alert({
			   	  					title:'提示信息!',
			   	  					msg:result.msg
			   	  				});
	   						}
	   					if(result.status==200){
	   							var culprit=result.data.culprit;
	   							var culpritJudgment=result.data.culpritJudgment;
	   							var culpritLaw=result.data.culpritLaw;
	   							$('#culpritInfo').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
	   	   							id : culprit.id,
	   	   							dicFirstReportGetKey:culprit.dicFirstReportGetKey,
	   	   							dicFirstReportTypeKey:culprit.dicFirstReportTypeKey,
	   	   							dicReportInfoKey:culprit.dicReportInfoKey,
	   	   							dicReportTypeKey:culprit.dicReportTypeKey,
	   	   							groupId:culprit.groupId,
	   	   							no:culprit.no,
	   	   							dicIsAdultKey:culprit.dicIsAdultKey,
	   	   							name:culprit.name,
	   	   							dicZjlxKey:culprit.dicZjlxKey,
	   	   							dicSexKey:culprit.dicSexKey,
	   	   							nation:culprit.nation,
	   	   							origin:culprit.origin,
	   	   							birthday:culprit.birthday,
	   	   							contactPhone:culprit.contactPhone,
	   	   							dicHklxKey:culprit.dicHklxKey,
	   	   							alias:culprit.alias,
	   	   							dicWhcdKey:culprit.dicWhcdKey,
	   	   							homePlace:culprit.homePlace,
	   	   							newJob:culprit.newJob,
	   	   							jobPhone:culprit.jobPhone,
		   	   						regResidenceProId:culprit.regResidenceProId,
		   							regResidenceCityId:culprit.regResidenceCityId,
		   							regResidenceCountryId:culprit.regResidenceCountryId,
		   							regResidenceStreet:culprit.regResidenceStreet,
		   							regResidenceDetail:culprit.regResidenceDetail,
		   							addressProId:culprit.addressProId,
		   							addressCityId:culprit.addressCityId,
		   							addressCountryId:culprit.addressCountryId,
		   							addressStreet:culprit.addressStreet,
		   							addressDetail:culprit.addressDetail,
		   							dicReceiveTypeKey:culpritJudgment.dicReceiveTypeKey,
		   							dicWslxKey:culpritLaw.dicWslxKey,
		   							indictmentNum:culpritLaw.indictmentNum,
		   							legalDocsStartDate:culpritLaw.legalDocsStartDate,
		   							executeNotificationNum:culpritLaw.executeNotificationNum,
		   							executeNotificationDate:culpritLaw.executeNotificationDate,
		   							legalDocsReceiveT:culpritLaw.legalDocsReceiveT,
		   							adjudgeOrg:culpritJudgment.adjudgeOrg,
		   							dicCrimeTypeKey:culpritJudgment.dicCrimeTypeKey,
		   							crimeInfo:culpritJudgment.crimeInfo,
		   							dicYpxfKey:culpritJudgment.dicYpxfKey,
		   							adjudgeId:culpritJudgment.adjudgeId,
		   							adjudgeDate:culpritJudgment.adjudgeDate,
		   							adjudgePeriod:culpritJudgment.adjudgePeriod,
		   							adjudgeStartTime:culpritJudgment.adjudgeStartTime,
		   							adjudgeEndTime:culpritJudgment.adjudgeEndTime,
		   							adjudgeRedressT:culpritJudgment.adjudgeRedressT,
		   							dicPenalTypeKey:culpritJudgment.dicPenalTypeKey,
		   							adjudgeRedressOrg:culpritJudgment.adjudgeRedressOrg,
		   							redressPeriod:culpritJudgment.redressPeriod,
		   							redressStartDate:culpritJudgment.redressStartDate,
		   							redressEndDate:culpritJudgment.redressEndDate,
		   							dicSfgtfzKey:culpritJudgment.dicSfgtfzKey,
		   							dicHaveTogetherKey:culpritJudgment.dicHaveTogetherKey,
		   							limitDate:culpritJudgment.limitDate,
		   							crimeFact:culpritJudgment.crimeFact
		   							
	   	   						});
	   						} 
	   					}
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
       
   		var addflag = false;
       /*选择固定市触发市下面的县*/
       $('#addressCityId').combobox({
       		onChange: function(newValue,oldValue){
				addflag = true;
       			$('#addressCountryId').combobox({    
       			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
       		    valueField:'id',    
       		    textField:'areaName',
    		    editable:'false' 
       			}); 
			},
			onSelect: function(record){
				if(addflag != true)
				{
					addflag = true;
	       			$('#addressCountryId').combobox({    
	       			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
	       		    valueField:'id',    
	       		    textField:'areaName',
	    		    editable:'false' 
	       			}); 
				}
			}

		});
       
       
       /*选择司法所后动态生成人员编号*/
       $('#sysGroupId').combotree({
   			onSelect:function(node) {
	   			$.ajax({
	   				type : 'get',
	   				url : '${ctx}/culpritinfo/culprit/findNumByGroupId?groupId=' + node.id,
	   				cache : false,
	   				async : false, //同步请求
	   				dataType : 'json',
	   				success : function(result) {
	   					$('#no').textbox('setValue',result);
	   				}
	   			});
   			}
   		})
   		//选正常下拉框失效
        $('#dicReportInfoKey1').click(function(){
        	$('#ReportType').combobox({ 'disabled': true });
        	$('#ReportType').combobox('setValue',''); 
        	$('#dicWslxKey').combobox({disabled:false});  
        	$('#indictmentNum1').textbox({disabled:false}); 
        	$('#legalDocsStartDate').validatebox('enable');
        	$('#executeNotificationNum').textbox({disabled:false});
        	$('#executeNotificationDate').validatebox({disabled:false});
        	$('#legalDocsReceiveT').validatebox({disabled:false});
        	$('#adjudgeOrg').textbox({disabled:false});
        	$('#dicCrimeTypeKey').combobox({disabled:false});  
        	$('#crimeInfo').textbox({disabled:false}); 
        	$('#dicYpxfKey').combobox({disabled:false});
        	$('#adjudgeId').textbox({disabled:false});
        	$('#adjudgeDate').validatebox('enable');
        	$('#adjudgePeriod').textbox({disabled:false});
        	$('#adjudgeStartTime').validatebox({disabled:false});
        	$('#adjudgeEndTime').validatebox({disabled:false});
        	$('#adjudgeRedressT').validatebox({disabled:false});
        	$('#dicPenalTypeKey').combobox({disabled:false});
        	$('#adjudgeRedressOrg').textbox({disabled:false});
        	$('#redressPeriod').textbox({disabled:false});
        	$('#redressStartDate').validatebox({disabled:false});
        	$('#redressEndDate').validatebox({disabled:false});
        	$('#limitDate').validatebox({disabled:false});
        	$('#dicSfgtfzKey').attr('disabled',false);
			$('#dicHaveTogetherKey').attr('disabled',false);
        });
        $('#dicReportInfoKey2').click(function(){
        	$('#ReportType').combobox({ 'disabled': false });
        });
        
        
        
       //自动计算矫正结束时间
        /* $("#redressPeriod").numberbox({//对延长期限添加onchang函数
            "onChange": function () {
           	var redressPeriod=parseInt($('#redressPeriod').numberbox('getValue'));//矫正期限必须小于刑法期限
          	if($('#adjudgePeriod').numberbox('getValue')!=''){
          		var adjudgePeriod=parseInt($('#adjudgePeriod').numberbox('getValue'));
          		if(redressPeriod>adjudgePeriod){
          			$.messager.show({
  					title:'提示信息!',
  					msg:'矫正期限必须小于或等于刑法期限'
  				});
          			$('#redressPeriod').numberbox('setValue','');
          			return false;
          		}
          	}

           	 var redressStartDate= $('#redressStartDate').val();
       		 var redressEndDate=null;
           	 if(redressPeriod!='' && redressStartDate!=''){
           		redressEndDate=new Date(redressStartDate);
               	 var month=parseInt(redressEndDate.getMonth());
               	 var date=parseInt(redressEndDate.getDate());
               	 var year=parseInt(redressEndDate.getFullYear());
               	redressEndDate.setMonth(month+redressPeriod);
               	redressEndDate.setDate(date); 
           	 } 
           	redressEndDate = redressEndDate.format("yyyy-MM-dd");

           	 $('#redressEndDate').val(redressEndDate);
              }
          }); */
       
       

   		/* $("#redressStartDate").blur(function(){
   			var redressPeriod=parseInt($('#redressPeriod').numberbox('getValue'));
   		    var redressStartDate= $('#redressStartDate').val();
   			var redressEndDate=null;
   			 if(redressPeriod!='' && redressStartDate!=''){
   				redressEndDate=new Date(redressStartDate);
   	           	 var month=parseInt(redressEndDate.getMonth());
   	           	 var date=parseInt(redressEndDate.getDate());
   	           	 var year=parseInt(redressEndDate.getFullYear());
   	          	redressEndDate.setMonth(month+redressPeriod);
   	       		redressEndDate.setDate(date); 
   	       	 }
   			redressEndDate = redressEndDate.format("yyyy-MM-dd");
   			$('#redressEndDate').val(redressEndDate);

   		}); */

   		
    /*  //自动计算刑期结束
        $("#adjudgePeriod").numberbox({//对延长期限添加onchang函数
            "onChange": function () {
           	 var adjudgePeriod=parseInt($('#adjudgePeriod').numberbox('getValue'));
           	 var adjudgeStartTime= $('#adjudgeStartTime').val();
       		 var adjudgeEndTime=null;
           	 if(adjudgePeriod!='' && adjudgeStartTime!=''){
           		adjudgeEndTime=new Date(adjudgeStartTime);
               	 var month=parseInt(adjudgeEndTime.getMonth());
               	 var date=parseInt(adjudgeEndTime.getDate());
               	 var year=parseInt(adjudgeEndTime.getFullYear());
               	adjudgeEndTime.setMonth(month+adjudgePeriod);
               	adjudgeEndTime.setDate(date); 
           	 } 
           	 if(adjudgeEndTime!=null){
           		adjudgeEndTime = adjudgeEndTime.format("yyyy-MM-dd");
           	 }
           	$('#adjudgeEndTime').val(adjudgeEndTime);
              }
          });
         
     	
   		$("#adjudgeStartTime").blur(function(){
   			var adjudgePeriod=parseInt($('#adjudgePeriod').numberbox('getValue'));
   			var adjudgeStartTime=$('#adjudgeStartTime').val();
   			var adjudgeEndTime=null;
   			 if(adjudgePeriod!='' && adjudgeStartTime!=''){
   				adjudgeEndTime=new Date(adjudgeStartTime);
   	           	 var month=parseInt(adjudgeEndTime.getMonth());
   	           	 var date=parseInt(adjudgeEndTime.getDate());
   	           	 var year=parseInt(adjudgeEndTime.getFullYear());
   	          	adjudgeEndTime.setMonth(month+adjudgePeriod);
   	       		adjudgeEndTime.setDate(date); 
   	       	 }
   			if(adjudgeEndTime!=null){
           		adjudgeEndTime = adjudgeEndTime.format("yyyy-MM-dd");
           	 }
   		 	$('#adjudgeEndTime').val(adjudgeEndTime);
   		});
   		 */
   		    
        
   	//文书类型
        $('#dicWslxKey').combobox({
        	onSelect: function(record){
        		$('#lawBook').html(record.value);
        		$('#adjudgeRedressT').validatebox('enable');
        		$('#adjudgeId').textbox({ disabled: false });
    			$('#adjudgeDate').validatebox('enable');
        		if(record.key=="125001"){
        			$('#adjudgeRedressT').val('');
        			$('#adjudgeRedressT').validatebox('disable');
        		}else if(record.key=="125002"){
        			$('#adjudgeId').textbox('setValue','');
        			$('#adjudgeId').textbox({ disabled: true });
        			$('#adjudgeDate').val('');
        			$('#adjudgeDate').validatebox('disable');
        		}else if(record.key=="125003"){
        			
        		}
        	}
        });
       
 });
        
  
   
  //自动生成截至首次报道时间，文书日期+10天
   function checkLimitTime(){
	  var legalDocsStartDate=$('#legalDocsStartDate').val();
	   var limitDate=null;
		 if(legalDocsStartDate!=''){
		    limitDate=new Date(legalDocsStartDate);
           	var date=parseInt(limitDate.getDate());
       		limitDate.setDate(date+10); 
       	 }
		if(limitDate!=null){
			limitDate = limitDate.format("yyyy-MM-dd");
       	 }
		$('#limitDate').val(limitDate);
   }  
   
        
        //居住地同户籍所在地
        function getAddress(){
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
      	//同审判机关
        function  equalAdjudgeOrg(){
        	var adjudgeOrg=$('#adjudgeOrg').textbox('getValue');
        	$('#adjudgeRedressOrg').textbox('setValue',adjudgeOrg);
        }
      	//同刑期结束时间
        function  equalAdjudgeEndTime(){
        	var adjudgeEndTime=$('#adjudgeEndTime').val();
        	$('#redressEndDate').val(adjudgeEndTime);
        }

        //增加押送民警信息
        function addPolice(culpritId){
        	 $('#addPolice').dialog({    
				    title: '新增押送民警信息',    
				    width: sy.getBrowerWidth()-800,    
				    height: sy.getBrowerHeight()-100,    
				    closed: false,    
				    cache: false,    
				    href: '${ctx}/sys/escorted/list?culpritId=' + culpritId,    
				    modal: true   
				});    
    	 }
      
      //保存上传文书
        function savelaw(){
        	 setFilePathAndName('legalDocsUpload');
        	 $('#showlaw').textbox('setValue', $('#legalDocsPathName').val());
        	 $('#addCulpritlaw').dialog('close');
        }	
        
      //操作
        function formatterLawAct(value,row,index){
        	var space = '&nbsp;';
        	var operation='';
        	//司法所办理入矫
        	operation=operation+'<a href="javascript:void(0);" class="easyui-linkbutton-fi-x" onclick="deleteLaw(\''+row.id+'\')">删除</a>';
            return operation; 
        }
      //删除
        function deleteLaw(id){
        	$.messager.confirm('提示信息', '确认删除?', function(r) {
    			if (r) {
    				$.post('${ctx}/culprit/culpritLaw/delete', {
    					id : id
    				}, function(result) {
    					//1 刷新数据表格 
    					$('#judg_list_content').datagrid('reload');
    					//2 清空idField   
    					$('#judg_list_content').datagrid('uncheckAll');
    					//3 给提示信息 
    					$.messager.show({
    						title : '提示信息!',
    						msg : '操作成功!'
    					});
    				});
    			} else {
    				return;
    			}
    		});
        }
      
      //审前匹配
       function matchInvestigate(){
    	  regflag = false;
    	  //addflag = false;
    	   var identification=$('#identification').val();
    	   if(identification!=''){
    		   $.ajax({
   				type: 'post' ,
   				url: '${ctx}/culpritinfo/culprit/matchInvestigate?identification='+identification,
   				cache:false ,
   				async : false, //同步请求
   				dataType:'json',
   				success:function(result){
   					if(result.status==200){
   						var data=result.data;
   						$.ajax({
   			   				type : 'get',
   			   				url : '${ctx}/culpritinfo/culprit/findNumByGroupId?groupId=' + data.sfsGroupId,
   			   				cache : false,
   			   				async : false, //同步请求
   			   				dataType : 'json',
   			   				success : function(result) {
   			   					$('#no').textbox('setValue',result);
   			   				}
   			   			});
   						
   						$('#culpritInfo').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
   							groupId : data.sfsGroupId,
   							name:data.name,
   							alias:data.oldName,
   							dicSexKey:data.dicSexKey,
   							origin:(sy.getAreaValue(data.originProId))+(sy.getAreaValue(data.originCityId))+(sy.getAreaValue(data.originCountryId)),
   							nation:data.nation,
   							birthday:data.bornDate,
   							contactPhone:data.contactPhone,
   							newJob:data.workUnits,
   							crimeInfo:data.crime,
   							dicHklxKey:sy.getDicValue('common_table','hklx',data.dicResudenceKey,''),
   							regResidenceProId:data.regResidenceProId,
   							regResidenceCityId:data.regResidenceCityId,
   							regResidenceCountryId:data.regResidenceCountryId,
   							regResidenceStreet:data.regResidenceStreet,
   							regResidenceDetail:data.regResidenceDetail,
   							addressProId:data.habitualResidenceProId,
   							addressCityId:data.habitualResidenceCityId,
   							addressCountryId:data.habitualResidenceCountryId,
   							addressStreet:data.habitualResidenceStreet,
   							addressDetail:data.habitualResidenceDetail
   						});
   					};
   					
   					$.messager.show({
	   	  					title:'提示信息!',
	   	  					msg:result.msg
	   	  				});
   					} 
   				});  
    	   }else{
    		   $.messager.show({
	  					title:'提示信息!',
	  					msg:'请输入证件号码!'
	  			});
    	   }
    	  
       }
      
      
var filepath = '${filePath}';
var cardName="";
var cardSex="";
var cardNation="";
var cardBorn="";
var cardCardNo="";
var cardAddress="";
var cardImage="";

function readidCard(){
	var ax = new ActiveXObject("IDRCONTROL.IdrControlCtrl.1");  
	ReadCard();
	try {  
	} catch(e) {  
		console.log("未安装身份证识别仪驱动,请下载安装!");
        /* window.parent.showTab_new("tree_panel_8", "tree_menu_8", "mrn_8_1", '../dataManagement/dataDownloads/dataDownload.jsp');  */
	}
}
                	 
function ReadCard()
{
	var result;
  	var photoname;
  	var cardname;
  	var cardsn;
  	var photoBase64;
    var cardFileName= getdatenum();
      
      
  	//result=IdrControl1.RepeatRead(1);   //设置是否重复读卡  0-不重复  1-重复
    //result=IdrControl1.setMute(1);   //设置是否静音读卡  0-不静音  1-静音

    //注意：第一个参数为对应的设备端口，USB型为1001，串口型为1至16
	//result=IdrControl1.ReadCard("1001","c:\\ocx\\test.jpg");
  	result=IdrControl1.ReadCard("1001","e:\\sifa\\file\\temp\\idcard\\"+ cardFileName +".jpg");
  	if (result==1){
  		cardName=IdrControl1.GetName();
  		cardSex=IdrControl1.GetSex();
  		cardNation=IdrControl1.GetFolk();
  		photoBase64 = IdrControl1.GetCardPhotobuf();
  		cardBorn=IdrControl1.GetBirthYear() + "-" + IdrControl1.GetBirthMonth() + "-" + IdrControl1.GetBirthDay();
  		cardAddress=IdrControl1.GetAddress();
  		cardCardNo=IdrControl1.GetCode();
  		//cardImage='C:\\Users\\Administrator\\Desktop\\photo.jpg';
  		
  		$('#name').textbox('setValue',cardName);
  		cardNation = cardNation + '族';
  		$('#nation').combobox('setValue',sy.getDicKey('common_table','nation', cardNation, ''));
  		$('#dicSexKey').combobox('setValue',sy.getDicKey('common_table','sex', cardSex, ''));
  		$('#birthday').val(cardBorn);
  		$('#dicZjlxKey').combobox('setValue','86001');
  		$('#identification').textbox('setValue',cardCardNo);
  		$('#headimg').attr('src', filepath + '\\idcard\\'+ cardFileName +'.jpg');
  		$('#imagePath').val('\\idcard\\'+ cardFileName +'.jpg');
  	}else{
  		if (result==-1)
			$.messager.alert('提示消息','端口初始化失败！');
  		if (result==-2)
			$.messager.alert('提示消息','读请重新将卡片放到读卡器上！');
  		if (result==-3)
  			$.messager.alert('提示消息','读取数据失败！');
  		if (result==-4)
  			$.messager.alert("生成照片文件失败，请检查设定路径和磁盘空间！");
  	}
  }
  
function getdatenum(){
	var date = new Date();
	var month = date.getMonth() + 1;
	var strDate = date.getDate();
	var hours = date.getHours();
	var minutes = date.getMinutes();
	var seconds = date.getSeconds();
	
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    if (hours >= 0 && hours <= 9) {
    	hours = "0" + hours;
    }
    if (minutes >= 0 && minutes <= 9) {
    	minutes = "0" + minutes;
    }
    if (seconds >= 0 && seconds <= 9) {
    	seconds = "0" + seconds;
    }
	
	return date.getFullYear() + month + strDate + hours + minutes + seconds + date.getMilliseconds();
}
</script>