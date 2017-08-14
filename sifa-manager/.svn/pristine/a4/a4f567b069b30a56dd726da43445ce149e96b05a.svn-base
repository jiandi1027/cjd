<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>刑罚执行信息</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body >
 <form  action="${ctx}/culpritinfo/culpritComplicity/save" method="post" id="culpritInfo">
     <div class="easyui-panel" title="基本信息" style="width:100%;padding:10px;">
            <table width="100%">
            	<tr>
            		<td>
            			<input type="hidden" name="id" value="${culprit.id }" />
            		</td>
            	</tr>
           		<tr>
                    <td>户籍详细地址:</td>
                    <td colspan="8"><input name="regResidenceProId" id="regResidenceProId" class="easyui-combobox" readonly="readonly" ></input>省
                    	<input type="hidden" id="regResidencePro" name="regResidencePro" value="${culprit.regResidencePro }" >
                    	<input id="regResidenceCityId" name="regResidenceCityId" class="easyui-combobox" readonly="readonly">市
                    	<input type="hidden" id="regResidenceCity" name="regResidenceCity" value="${culprit.regResidenceCity }">
                    	<input id="regResidenceCountryId" name="regResidenceCountryId" class="easyui-combobox" readonly="readonly" >县（区）
                    	<input type="hidden" id="regResidenceCountry" name="regResidenceCountry" value="${culprit.regResidenceCountry}" >
                    	<input id="regResidenceStreet" name="regResidenceStreet" class="f1 easyui-textbox" readonly="readonly" value="${culprit.regResidenceStreet}">乡镇（街道）
                    	<input name="regResidenceDetail" id="regResidenceDetail" class="f1 easyui-textbox" readonly="readonly" value="${culprit.regResidenceDetail}">（详细门牌号）
                    </td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>居住地详细地址:</td>
                    <td colspan="8"><input name="addressProId" id="addressProId" class="easyui-combobox" required=true></input>省
                    	<input type="hidden" id="addressPro" name="addressPro" value="${culprit.addressPro}">
                    	<input name="addressCityId" id="addressCityId" class="easyui-combobox" required=true></input>市
                    	<input type="hidden" id="addressCity" name="addressCity" value="${culprit.addressCity}">
                    	<input name="addressCountryId" id="addressCountryId" class="easyui-combobox" required=true></input>县（区）
                    	<input type="hidden" id="addressCountry" name="addressCountry"  value="${culprit.addressCountry}">
                    	<input id="addressStreet" name="addressStreet" class="f1 easyui-textbox" value="${culprit.addressStreet}">乡镇（街道）
                    	<input name="addressDetail" id="addressDetail" class="f1 easyui-textbox" value="${culprit.addressDetail}">（详细门牌号）
                    </td>
                </tr> 
                <tr>
                	<c:if test="${empty culprit.dicHealthyStatusKey }">
	                	<td width="10%"><span class="c-red">*</span>健康状况：</td>
						<td ><input name="DicHealthyStatusKey" id="DicHealthyStatusKey" class="easyui-combobox" required=true value="41001"
	                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=41000',panelHeight:'auto'"></input></td>
                   	</c:if>
                   	<c:if test="${!empty culprit.dicHealthyStatusKey }">
                   		<td width="10%"><span class="c-red">*</span>健康状况：</td>
						<td ><input name="DicHealthyStatusKey" id="DicHealthyStatusKey" class="easyui-combobox" required=true value="${culprit.dicHealthyStatusKey }"
	                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=41000',panelHeight:'auto'"></input></td>
                   	</c:if>
                	<td>是否有传染病史：</td>
	 				<td>
			 			<c:if test="${culprit.dicSfycrbsKey ne 0 }">
			 				<input id="dicSfycrbsKey0" type="radio" name="dicSfycrbsKey" value="0"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicSfycrbsKey1" type="radio" name="dicSfycrbsKey" value="1"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
			 			<c:if test="${culprit.dicSfycrbsKey eq 0 }">
			 				<input id="dicSfycrbsKey0"  type="radio" name="dicSfycrbsKey" value="0"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicSfycrbsKey1"  type="radio" name="dicSfycrbsKey" value="1" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
	 				</td>
	 				<td>心里是否健康：</td>
		 			<td>
			 			<c:if test="${culprit.dicXlsfjkKey eq 1 }">
			 				<input type="radio" id="dicXlsfjkKey0" name="dicXlsfjkKey" value="0"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input type="radio" id="dicXlsfjkKey1" name="dicXlsfjkKey" value="1"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
			 			<c:if test="${culprit.dicXlsfjkKey ne 1 }">
			 				<input type="radio" id="dicXlsfjkKey0" name="dicXlsfjkKey" value="0"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input type="radio" id="dicXlsfjkKey1" name="dicXlsfjkKey" value="1"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
		 			</td>
                </tr>
                <tr>
                   <td width="10%">具体健康状况：</td>
							<td><input type="text" name="healthyStatusInfo" id="healthyStatusInfo" value="${ culprit.healthyStatusInfo}"
								class="f1 easyui-textbox" /></td>
					<td width="10%">具体传染病史：</td>
							<td ><input name="contagionId" id="contagionId" class="easyui-combobox"  value="${culprit.contagionId}"
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=64000',panelHeight:'auto'"></input></td>
							<td width="10%">具体心里状况：</td>
							<td ><input type="text" name="mentalInfo" id="mentalInfo" value="${culprit.mentalInfo}"
								class="f1 easyui-textbox"  /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>文化程度：</td>
					<td><input name="dicWhcdKey" id="dicWhcdKey" class="easyui-combobox" required=true value="${culprit.dicWhcdKey}"
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=19000',panelHeight:'auto'"></input></td>
					<td><span class="c-red">*</span>就业就学情况：</td>
					<td><input name="dicWorkStatusKey" id="dicWorkStatusKey" class="easyui-combobox" required=true value="${culprit.dicWorkStatusKey}"
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=66000',panelHeight:'auto'"></input></td>
					<td width="10%">鉴定机构：</td>
					<td ><input type="text" name="identifyOrg" id="identifyOrg" value="${culprit.identifyOrg}"
								class="f1 easyui-textbox"  /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>婚姻状况：</td>
					<td ><input name="dicHyzkKey"  id="dicHyzkKey" class="easyui-combobox" required=true ></input></td>
                    <td>原政治面貌：</td>
					<td ><input name="dicYzzmmKey" class="easyui-combobox"  value="${culprit.dicYzzmmKey}"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=65000',panelHeight:'auto'"></input></td>
					<td>现政治面貌：</td>
					<td ><input name="dicXzzmmKey" class="easyui-combobox" value="${culprit.dicXzzmmKey}"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=65000',panelHeight:'auto'"></input></td>
                </tr>
                <tr>
               	 	<td width="10%">原工作单位及职务：</td>
					<td ><input type="text" name="job" id="job" value="${culprit.job}" class="f1 easyui-textbox"  /></td>
	                <td width="10%">工作单位：</td>
					<td ><input type="text" name="newJob" id="newJob" value="${culprit.newJob}" class="f1 easyui-textbox"  /></td>
					<td width="10%">单位联系电话：</td>
					<td ><input type="text" name="jobPhone" id="jobPhone" value="${culprit.jobPhone}" class="f1 easyui-textbox"  /></td>
				</tr>
				<tr>
					<td><span class="c-red">*</span>联系方式：</td>
					<td ><input type="text" name="contactPhone" id="contactPhone" value="${culprit.contactPhone}" class="f1 easyui-textbox" required=true /></td>
	                <td width="10%">管理分区：</td>
					<td ><input type="text" name="" id="" value="无" class="f1 easyui-textbox"  /></td>
				</tr>
               
                
            </table>
    </div>
     <div class="easyui-panel" title="刑罚执行信息" style="width:100%;padding:10px;">
            <table width="100%">
            	<tr>
            		<td>姓名：</td>
            		<td>${culprit.name }</td>
            		<td width="10%">原羁押场所：</td>
					<td><input type="text" name="detainPlace" id="detainPlace" value="${ culpritJudgment.detainPlace}"
								class="f1 easyui-textbox" />
					</td>
					<td>交付执行日期</td>
					<td>
						<input type="text" name="turnOver" id="turnOver" value="${ culpritJudgment.turnOver}"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
            	</tr>
            	<tr>
            		<td width="10%">剥夺政治权利期限：</td>
					<td><input type="text" name="deprivePolitical" id="deprivePolitical" value="${ culpritJudgment.deprivePolitical}"
								class="f1 easyui-textbox" />
					</td>
					<td>剥权开始日期：</td>
					<td>
						<input type="text" name="deprivePoliticalStartDate" id="deprivePoliticalStartDate" value="${ culpritJudgment.deprivePoliticalStartDate}"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
					<td>剥权结束日期：</td>
					<td>
						<input type="text" name="deprivePoliticalEndDate" id="deprivePoliticalEndDate" value="${ culpritJudgment.deprivePoliticalEndDate}"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
            	</tr>
            	<tr>
            		<td width="10%">接受公安机关：</td>
					<td><input type="text" name="reciveSecurityOrg" id="reciveSecurityOrg" value="${ culpritJudgment.reciveSecurityOrg}"
								class="f1 easyui-textbox" />
					</td>
					<td width="10%">接受人：</td>
					<td><input type="text" name="reciveSecurityPerson" id="reciveSecurityPerson" value="${ culpritJudgment.reciveSecurityPerson}"
								class="f1 easyui-textbox" />
					</td>
					<td>移交日期：</td>
					<td>
						<input type="text" name="transferDate" id="transferDate" value="${ culpritJudgment.transferDate}"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
            	</tr>
            	<tr>
            		<td width="10%">矫正期限：</td>
					<td><input type="text" name="redressPeriod" id="redressPeriod" value="${ culpritJudgment.redressPeriod}"
								class="f1 easyui-textbox" />
					</td>
					<td>是否累惯犯：</td>
	 				<td>
			 			<c:if test="${culpritJudgment.dicOldLagKey ne 0 }">
			 				<input id="dicOldLagKey0" type="radio" name="dicOldLagKey" value="0"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicOldLagKey1" type="radio" name="dicOldLagKey" value="1"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
			 			<c:if test="${culpritJudgment.dicOldLagKey eq 0 }">
			 				<input id="dicOldLagKey0"  type="radio" name="dicOldLagKey" value="0"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicOldLagKey1"  type="radio" name="dicOldLagKey" value="1" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
	 				</td>
	 				<td>是否实行信息化管理：</td>
	 				<td>
			 			<c:if test="${culpritJudgment.dicIsInfManageKey ne 0 }">
			 				<input id="dicIsInfManageKey0" type="radio" name="dicIsInfManageKey" value="0"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicIsInfManageKey1" type="radio" name="dicIsInfManageKey" value="1"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
			 			<c:if test="${culpritJudgment.dicIsInfManageKey eq 0 }">
			 				<input id="dicIsInfManageKey0"  type="radio" name="dicIsInfManageKey" value="0"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicIsInfManageKey1"  type="radio" name="dicIsInfManageKey" value="1" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
	 				</td>
            	</tr>
            	<tr>
            		<td>是否被宣告禁止令：</td>
	 				<td>
			 			<c:if test="${culpritJudgment. dicIsBanKey ne 0 }">
			 				<input id="dicIsBanKey0" type="radio" name="dicIsBanKey" value="0"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicIsBanKey1" type="radio" name="dicIsBanKey" value="1"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
			 			<c:if test="${culpritJudgment. dicIsBanKey eq 0 }">
			 				<input id="dicIsBanKey0"  type="radio" name="dicIsBanKey" value="0"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicIsBanKey1"  type="radio" name="dicIsBanKey" value="1" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
	 				</td>
	 				<td>禁止开始日期：</td>
					<td>
						<input type="text" name="startBan" id="startBan" value="${ culpritJudgment.startBan}"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
					<td>禁止结束日期：</td>
					<td>
						<input type="text" name="endBan" id="endBan" value="${ culpritJudgment.endBan}"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</td>
            	</tr>
            	<tr>
            		<td width="10%">禁止期限：</td>
					<td><input type="text" name="timeBan" id="timeBan" value="${ culpritJudgment.timeBan}"
								class="f1 easyui-textbox" />
					</td>
					<td width="10%">刑期变动：</td>
					<td><input type="text" name="adjudgeChange" id="adjudgeChange" value="${ culpritJudgment.adjudgeChange}"
								class="f1 easyui-textbox" />
					</td>
            	</tr>
            	<tr rowspan="5">
                    <td><span class="c-red">*</span>禁止内容：</td>
							<td colspan="5"><input type="text" name="contentBan"multiline=true 
								class="f1 easyui-textbox" value="${ culpritJudgment.contentBan}" style="width:800px;height:80px;"/></td>
                </tr>
                <tr>
                	<td>是否发放定位手机：</td>
	 				<td>
			 			<c:if test="${culpritJudgment.dicHaveMobileKey ne 0 }">
			 				<input id="dicHaveMobileKey0" type="radio" name="dicHaveMobileKey" value="0"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicHaveMobileKey1" type="radio" name="dicHaveMobileKey" value="1"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
			 			<c:if test="${culpritJudgment.dicHaveMobileKey eq 0 }">
			 				<input id="dicHaveMobileKey0"  type="radio" name="dicHaveMobileKey" value="0"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicHaveMobileKey1"  type="radio" name="dicHaveMobileKey" value="1" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
	 				</td>
	 				<td>是否建立矫正小组：</td>
	 				<td>
			 			<c:if test="${culpritJudgment.dicMemeberKey ne 0 }">
			 				<input id="dicMemeberKey0" type="radio" name="dicMemeberKey" value="0"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicMemeberKey1" type="radio" name="dicMemeberKey" value="1"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
			 			<c:if test="${culpritJudgment.dicMemeberKey eq 0 }">
			 				<input id="dicMemeberKey0"  type="radio" name="dicMemeberKey" value="0"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicMemeberKey1"  type="radio" name="dicMemeberKey" value="1" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
	 				</td>
                </tr>
                <tr>
                	<td>是否三涉：</td>
                	<td colspan="5">
                		<input type="checkbox" name="dicTreeKey" value="71001" id="dicTreeKey1"/>否&nbsp;&nbsp;
                		<input type="checkbox" name="dicTreeKey" value="71002" id="dicTreeKey2"/>涉毒&nbsp;&nbsp;
                		<input type="checkbox" name="dicTreeKey" value="71003" id="dicTreeKey3"/>涉黑&nbsp;&nbsp;
                		<input type="checkbox" name="dicTreeKey" value="71004" id="dicTreeKey4"/>涉枪&nbsp;&nbsp;
                	</td>
                </tr>
                <tr>
                	<td>是否四史：</td>
                	<td colspan="5">
                		<input type="checkbox" name="dicFourKey" value="69002" id="dicFourKey2"/>吸毒史&nbsp;&nbsp;
                		<input type="checkbox" name="dicFourKey" value="69003" id="dicFourKey3"/>逃脱史&nbsp;&nbsp;
                		<input type="checkbox" name="dicFourKey" value="69004" id="dicFourKey4"/>自杀史&nbsp;&nbsp;
                		<input type="checkbox" name="dicFourKey" value="69005" id="dicFourKey5"/>袭警史&nbsp;&nbsp;
                		<input type="checkbox" name="dicFourKey" value="69001" id="dicFourKey1"/>否&nbsp;&nbsp;
                	</td>
                </tr>
                 <tr>
                	<td>附加刑：</td>
                	<td colspan="5">
                		<input type="checkbox" name="accessoryPunishment" value="68001" id="accessoryPunishment1"/>无&nbsp;&nbsp;
                		<input type="checkbox" name="accessoryPunishment" value="68002" id="accessoryPunishment2"/>罚金&nbsp;&nbsp;
                		<input type="checkbox" name="accessoryPunishment" value="68003" id="accessoryPunishment3"/>剥夺政治权利&nbsp;&nbsp;
                		<input type="checkbox" name="accessoryPunishment" value="68004" id="accessoryPunishment4"/>没收财产&nbsp;&nbsp;
                		<input type="checkbox" name="accessoryPunishment" value="68005" id="accessoryPunishment5"/>驱逐出境&nbsp;&nbsp;
                	</td>
                </tr>
                <tr>
                	<td width="10%">具体罚金金额：</td>
					<td><input type="text" name="forfeit" id="forfeit" value="${culpritJudgment.forfeit}"
								class="f1 easyui-textbox" />
					</td>
					<td width="10%">剥权期限：</td>
					<td><input type="text" name="disentitle" id="disentitle" value="${ culpritJudgment.disentitle}"
								class="f1 easyui-textbox" />
					</td>
					<td width="10%">没收财产：</td>
					<td><input type="text" name="expropriation" id="expropriation" value="${ culpritJudgment.expropriation}"
								class="f1 easyui-textbox" />
					</td>
                </tr>          
            </table>
    </div>
     <div class="easyui-panel" title="本次犯罪前的违法犯罪记录及结果" style="width:100%;padding:10px;">
     	<table width="100%">
     		<tr>
     			<td width="10%">侦察机关名称：</td>
				<td><input type="text" name="investigateOrg" id="investigateOrg" value="${ culpritLaw.investigateOrg}"
								class="f1 easyui-textbox" />
				</td>
				<td>拘留日期：</td>
					<td>
						<input type="text" name="detainDate" id="detainDate" value="${ culpritLaw.detainDate}"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
				</td>
				<td>立案日期：</td>
					<td>
						<input type="text" name="registerDate" id="registerDate" value="${ culpritLaw.registerDate}"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
				</td>
     		</tr>
     		<tr>
     			<td width="10%">决定/批准逮捕机关：</td>
				<td><input type="text" name="arrestOrg" id="arrestOrg" value="${ culpritLaw.arrestOrg}"
								class="f1 easyui-textbox" />
				</td>
				<td>逮捕日期：</td>
					<td>
						<input type="text" name="arrestDate" id="arrestDate" value="${ culpritLaw.arrestOrg}"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
				</td>
				<td>侦结日期：</td>
					<td>
						<input type="text" name="investOverDate" id="investOverDate" value="${ culpritLaw.investOverDate}"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
				</td>
     		</tr>
     		<tr>
     			<td width="10%">检查机关（自诉人）：</td>
				<td><input type="text" name="checkOrg" id="checkOrg" value="${ culpritLaw.checkOrg}"
								class="f1 easyui-textbox" />
				</td>
				<td>起诉书编号：</td>
					<td>
						<input type="text" name="indictmentNum" id="indictmentNum" value="${ culpritLaw.indictmentNum}"
								class="f1 easyui-textbox" />
				</td>
				<td>提起诉讼日期：</td>
					<td>
						<input type="text" name="indictmentDate" id="indictmentDate" value="${ culpritLaw.indictmentDate}"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
				</td>
     		</tr>
     		<tr rowspan="5">
                    <td><span class="c-red">*</span>行政处罚：</td>
							<td colspan="5"><input type="text" name="oldAdministrationRecord" multiline=true 
								class="f1 easyui-textbox" value="${ culpritLaw.oldAdministrationRecord}" style="width:800px;height:80px;"/></td>
            </tr>
            <tr rowspan="5">
                    <td><span class="c-red">*</span>刑事处罚：</td>
							<td colspan="5"><input type="text" name="oldPenalRecord"multiline=true 
								class="f1 easyui-textbox" value="${ culpritLaw.oldPenalRecord}" style="width:800px;height:80px;"/></td>
            </tr>
            <tr>
	            <td align="center" colspan="6">
	            	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
	            </td>
            </tr>  
     	</table>
     </div>
    </form>
    <script>
    var toolbarResume = [ {
		text : '新增',
		iconCls : 'icon-add',
		handler : function() {
			flag = 'add';
			$('#resume').dialog({
				title : '新增个人简历'
			});
			//$('#myform').find('input[name!=sex]').val("");
			$('#resumeForm').get(0).reset();
			$('#resumeForm').form('clear');
			$('#resume').dialog('open');
			$('#resumeForm').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
				culpritId : '${culprit.id}'
			});

		}

	}]
    function resumeSave(){
		var str=$('#resumeForm').serialize();
			if($('#resumeForm').form('validate')){	
				$.ajax({
					type: 'post' ,
					url: '${ctx}/culpritinfo/culpritResume/save',
					cache:false ,
					data:str ,
					dataType:'json' ,
					success:function(result){
						//1 关闭窗口
						$('#resume').dialog('close');
						$('#resume_content').datagrid('reload');
						//parent.location.reload();
		      			//var index = parent.layer.getFrameIndex(window.name);
						//parent.layer.close(index);
					} ,
					error:function(result){
						$.meesager.show({
							title:result.status==200?"ok":"fail" ,  
							msg:result.msg
						});
					}
				});
			} else {
				$.messager.show({
					title:'提示信息!' ,
					msg:'数据验证不通过'
				});
			}
	}
    function formatResume(val,row,index){  
    	var operation=$.formatString('<a href="javascript:resume(\'{0}\');"  title="修改"><span style="color:blue;"><strong><u>修改</u><strong></span></a>', row);
    	return operation;
    }
    function resume(row){   	
    	var arr = $('#resume_content').datagrid('getSelections');
    	console.info(arr[0].org);
    	$('#resume').dialog({
			title : '修改个人简历'
		});
    	$('#resume').dialog('open');
    	$('#resumeForm').get(0).reset();
    	$('#resumeForm').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
			id : arr[0].id,
			culpritId : arr[0].culpritId,
			startTime : arr[0].startTime,
			endTime : arr[0].endTime,
			org : arr[0].org,
			role : arr[0].role
		});
    	$('#resume_content').datagrid('unselectAll'); 
    }
    //家庭成员新增
    var toolbarFamily = [ {
		text : '新增',
		iconCls : 'icon-add',
		handler : function() {
			flag = 'add';
			$('#family').dialog({
				title : '家庭成员新增'
			});
			//$('#myform').find('input[name!=sex]').val("");
			$('#familyForm').get(0).reset();
			$('#familyForm').form('clear');
			$('#family').dialog('open');
			$('#familyForm').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
				culpritId : '${culprit.id}'
			});

		}

	}]
    function familySave(){
		var str=$('#familyForm').serialize();
			if($('#familyForm').form('validate')){	
				$.ajax({
					type: 'post' ,
					url: '${ctx}/culpritinfo/culpritFamily/save',
					cache:false ,
					data:str ,
					dataType:'json' ,
					success:function(result){
						//1 关闭窗口
						$('#family').dialog('close');
						$('#family_content').datagrid('reload');
						//parent.location.reload();
		      			//var index = parent.layer.getFrameIndex(window.name);
						//parent.layer.close(index);
					} ,
					error:function(result){
						$.meesager.show({
							title:result.status==200?"ok":"fail" ,  
							msg:result.msg
						});
					}
				});
			} else {
				$.messager.show({
					title:'提示信息!' ,
					msg:'数据验证不通过'
				});
			}
	}
    function formatFamily(val,row,index){  
    	var operation=$.formatString('<a href="javascript:family(\'{0}\');"  title="修改"><span style="color:blue;"><strong><u>修改</u><strong></span></a>', row);
    	return operation;
    }
    function family(row){   	
    	var arr = $('#family_content').datagrid('getSelections');
    	$('#family').dialog({
			title : '家庭成员修改'
		});
    	$('#family').dialog('open');
    	$('#familyForm').get(0).reset();
    	$('#familyForm').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
			id : arr[0].id,
			culpritId : arr[0].culpritId,
			name : arr[0].name,
			dicSexKey : arr[0].dicSexKey,
			birthday : arr[0].birthday,
			dicZzmmKey : arr[0].dicZzmmKey,
			org : arr[0].org,
			role : arr[0].role,
			phone : arr[0].phone,
			address : arr[0].address,
			dicRelationKey : arr[0].dicRelationKey
		});
    	$('#family_content').datagrid('unselectAll'); 
    }


    
        function submitForm(){
        	 $('#culpritInfo').form('submit');
        }
        $(function() {
        	var tree='${culpritJudgment.dicTreeKey}';
        	var treeList=tree.split(",");
        	for(var i=0;i<treeList.length;i++){
        		for(var j=1;j<5;j++){
        		if($('#dicTreeKey'+[j]).val()==treeList[i]){
        			$('#dicTreeKey'+[j]).attr("checked","checked");
        		}
        		}
        	}
        	var four='${culpritJudgment.dicFourKey}';
        	var fourList=four.split(",");
        	for(var i=0;i<fourList.length;i++){
        		for(var j=1;j<6;j++){
        		if($('#dicFourKey'+[j]).val()==fourList[i]){
        			$('#dicFourKey'+[j]).attr("checked","checked");
        		}
        		}
        	}
        	var accessory='${culpritJudgment.accessoryPunishment}';
        	var accessoryList=accessory.split(",");
        	for(var i=0;i<accessoryList.length;i++){
        		for(var j=1;j<6;j++){
        		if($('#accessoryPunishment'+[j]).val()==accessoryList[i]){
        			$('#accessoryPunishment'+[j]).attr("checked","checked");
        		}
        		}
        	}
        	//户口地下拉选
        	$('#regResidenceProId').combobox({
        		url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',
			    valueField:'id',
			    textField:'areaName', 
			    panelHeight:'auto',
			    onLoadSuccess:function(){
			    	$('#regResidenceProId').combobox('setValue', '${culprit.regResidenceProId}');
			    }
			});
        	$('#regResidenceCityId').combobox({
        		url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent=${culprit.regResidenceProId}',
			    valueField:'id',
			    textField:'areaName', 
			    panelHeight:'auto',
			    onLoadSuccess:function(){
			    	$('#regResidenceCityId').combobox('setValue', '${culprit.regResidenceCityId}');
			    }
			});
        	$('#regResidenceCountryId').combobox({
        		url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent=${culprit.regResidenceCityId}',
			    valueField:'id',
			    textField:'areaName',
			    panelHeight:'auto',
			    onLoadSuccess:function(){
			    	$('#regResidenceCountryId').combobox('setValue', '${culprit.regResidenceCountryId}');
			    }
			});
        	//现在居住地下拉选
        	$('#addressProId').combobox({
        		url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',
			    valueField:'id',
			    textField:'areaName',
			    value:'${culprit.addressProId}'
			    //onLoadSuccess:function(){
			    //	alert(333)
			    //	$('#addressProId').combobox('setValue', '${culprit.addressProId}');
			    //}
			});
        	//console.info("${culprit.addressCityId}");
        	$('#addressCityId').combobox({
        		url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent=${culprit.addressProId}',
			    valueField:'id',
			    textField:'areaName',
			    panelHeight:'auto',
			    value:'${culprit.addressCityId}'
			  //  onLoadSuccess:function(){
			  //  	alert(222)
			   // 	$('#addressCityId').combobox('setValue', '${culprit.addressCityId}');
			   // }
			});
        	//console.info("${culprit.addressCountryId}");
        	$('#addressCountryId').combobox({
        		url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent=${culprit.addressCityId}',
			    valueField:'id',
			    textField:'areaName',
			    panelHeight:'auto',
			    value:'${culprit.addressCountryId}'
			 //   onLoadSuccess:function(){
			 //   	
			 //   	$('#addressCountryId').combobox('setValue', '${culprit.addressCountryId}');
			 //   }
			});
        	//婚姻状况下拉选
        	$('#dicHyzkKey').combobox({
        		url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=11000',
			    valueField:'id',
			    textField:'value',
			    panelHeight:'auto',
			    onLoadSuccess:function(){
			    	$('#dicHyzkKey').combobox('setValue', '${culprit.dicHyzkKey}');
			    }
			}); 
        	//表单提交
        	$('#culpritInfo').form({
        		url:'${ctx}/culpritinfo/culprit/save',
        		onSubmit:function(){
        			return $(this).form('validate');
        		},
        		success:function(data){
        			data = JSON.parse(data);
        			if(data.status==200){
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        				//2刷新datagrid 
    					//$('#judg_list_content').datagrid('reload');
        				//location.reload();
        				
            			//var index = parent.layer.getFrameIndex(window.name);
    					//parent.layer.close(index);
    					
        			}else{
        				alert(data.msg);
        			}
        			
        		}
        	});	
        	//进入页面判断是否启用传染病控件
        	
        	if('${culprit.dicSfycrbsKey ne 0 }'=='true'){
        		$('#contagionId').combobox('disable');
        	}
        	//判断心里状况启用组件
			if('${culprit.dicXlsfjkKey ne 1 }'=='true'){
        		$('#mentalInfo').textbox('disable');
        		$('#identifyOrg').textbox('disable');
        	}
         
        });
        //判断有传染病启用组件
        $('#dicSfycrbsKey0').click(function(){
 			$('#contagionId').combobox('enable');
    	});
        $('#dicSfycrbsKey1').click(function(){
        	$('#contagionId').combobox('clear');
 			$('#contagionId').combobox('disable');
    	});
      //判断心里状况启用组件
       $('#dicXlsfjkKey0').click(function(){
    	   $('#mentalInfo').textbox('clear');
    	   $('#identifyOrg').textbox('clear');
    	   $('#mentalInfo').textbox('disable');
   			$('#identifyOrg').textbox('disable');
    	});
        $('#dicXlsfjkKey1').click(function(){
     	   $('#mentalInfo').textbox('enable');
  			$('#identifyOrg').textbox('enable');
    	});
        //居住地变更时
        $('#addressProId').combobox({    
        	onChange: function(newValue,oldValue){
				$('#addressPro').val($('#addressProId').combobox('getText'));
        		$('#addressCityId').combobox({    
        			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
        		    valueField:'id',    
        		    textField:'areaName'
        		    
        		});
        		$('#addressCityId').combobox('clear');	
			}   
   		}); 
        $('#addressCityId').combobox({    
        	onChange: function(newValue,oldValue){
				$('#addressCity').val($('#addressCityId').combobox('getText'));
        		$('#addressCountryId').combobox({    
        			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
        		    valueField:'id',    
        		    textField:'areaName'   
        		});
        		$('#addressCountryId').combobox('clear');
			}   
   		});
        //县区选择完存一份名字
        $('#addressCountryId').combobox({  
	        onChange: function(newValue,oldValue){
				$('#addressCountry').val($('#addressCountryId').combobox('getText'));
	        }
        });
        $.formatString = function(str) {
    		for ( var i = 0; i < arguments.length - 1; i++) {
    			str = str.replace("{" + i + "}", arguments[i + 1]);
    		}
    	return str;
    }
    </script>
</body>
</html>
