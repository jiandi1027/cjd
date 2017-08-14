<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>详细</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>
	 <div class="easyui-panel" id="p1" title="基本信息" style="width:100%;padding:10px;">
     		
            <table width="100%">
            	<tr>
            		<td><span class="c-red">*</span>司法所:</td>
            		<td><select id="sysGroupId" name="sysGroup.id"class="easyui-combotree" style="width: 150px;"
						data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:false">
						</select></td>
            		<td><span class="c-red">*</span>人员编号:</td>
            		<td>${culprit.no }</td>
            		<td rowspan=5>照片:</td>
            		<td rowspan=5>无照片</td>
            	</tr>
                <tr>
                    <td><span class="c-red">*</span>姓名:</td>
                    <td>${culprit.name }</td>
					<td>曾用名:</td>
            		<td>${culprit.alias }</td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td><input name="dicSexKey" id="dicSexKey" class="easyui-combobox" value="${culprit.dicSexKey}"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=10000',panelHeight:'auto',readonly:true"></input></td>
                     <td>民族:</td>
                    <td><input name="nation" id="nation" class="easyui-combobox" value="${culprit.nation}"
                    		data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=104000',panelHeight:'200',readonly:true"></input></td>
                </tr>
                <tr>
                    
                     <td><span class="c-red">*</span>出生日期:</td>
                     <td><fmt:formatDate value="${culprit.birthday}"
									pattern="yyyy-MM-dd" /></td>
                     <td><span class="c-red">*</span>联系方式:</td>
                    <td>${culprit.contactPhone }</td>
                </tr>
                
                 <tr>
                    <td><span class="c-red">*</span>证件类型:</td>
                    <td><input name="dicZjlxKey" id="dicZjlxKey" class="easyui-combobox"  value="${culprit.dicZjlxKey }"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=86000',panelHeight:'auto',readonly:true"></input></td>
                    <td><span class="c-red">*</span>证件号码:</td>
                    <td>${culprit.identification }</td>
                    
                </tr>
                 <tr>
                    <td>籍贯:</td>
                    <td>${culprit.origin }</td>
                    <td>现在工作单位:</td>
                    <td>${culprit.newJob }</td>
                    <td>照片上传:</td>
                    <td><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">上传</a></td>
                </tr>
                 <tr>
                    <td>户籍性质:</td>
                    <td><input name="dicHklxKey" id="dicHklxKey" class="easyui-combobox" value="${culprit.dicHklxKey }" 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=12000',panelHeight:'auto',readonly:true"></input></td>
                     <td>文化程度:</td>
                    <td><input name="dicWhcdKey" id="dicWhcdKey" class="easyui-combobox" value="${culprit.dicWhcdKey }"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=19000',panelHeight:'auto',readonly:true"></input></td>
                    <td>是否成年:</td>
                    <td>
 	 				<!-- style为了radio与文字平行-->
 	 				<input type="radio" name="dicIsAdultKey" value="${culprit.dicIsAdultKey }"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
					<input type="radio" name="dicIsAdultKey" value="${culprit.dicIsAdultKey }"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
 	 				</td>
                </tr>
                 <tr>
                    <td>单位联系方式:</td>
                    <td>${culprit.jobPhone }</td>
                    <td>婚姻状况:</td>
                    <td><input name="dicHyzkKey" id="dicHyzkKey" class="easyui-combobox" value="${culprit.dicHyzkKey }"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=11000',panelHeight:'auto',readonly:true"></input></td>
                    <td>出生地:</td>
                    <td><input name="email" class="f1 easyui-textbox"></input></td>
                </tr>
                <tr>
                    <td>户籍详细地址:</td>
                    <td colspan="8"><input name="regResidenceProId" id="regResidenceProId" class="easyui-combobox" value="${culprit.regResidenceProId }"
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelHeight:'200',readonly:true"></input>省
                    	<input id="regResidenceCityId" name="regResidenceCityId" class="easyui-combobox"  value="${culprit.regResidenceCityId }" 
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=2',panelHeight:'200',readonly:true">市
                    	<input id="regResidenceCountryId" name="regResidenceCountryId" class="easyui-combobox"value="${culprit.regResidenceCountryId }" 
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=3',panelHeight:'200',readonly:true">县（区）
                    	<input id="regResidenceStreet" name="regResidenceStreet" class="f1 easyui-textbox" value="${culprit.regResidenceStreet }"readonly=true>乡镇（街道）
                    	<input name="regResidenceDetail" id="regResidenceDetail" class="f1 easyui-textbox" value="${culprit.regResidenceDetail }"readonly=true>（详细门牌号）
                    </td>
                </tr>
                <tr>
                    <td>居住地详细地址:</td>
                    <td colspan="8"><input name="addressProId" id="addressProId" class="easyui-combobox" value="${culprit.addressProId }"
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelHeight:'200'"></input>省
                    	<input name="addressCityId" id="addressCityId" class="easyui-combobox" value="${culprit.addressCityId }" 
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=2',panelHeight:'200',readonly:true"></input>市
                    	<input name="addressCountryId" id="addressCountryId" class="easyui-combobox" value="${culprit.addressCountryId}" 
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=3',panelHeight:'200',readonly:true"></input>县（区）
                    	<input id="addressStreet" name="addressStreet" class="f1 easyui-textbox"value="${culprit.addressStreet }"readonly=true>乡镇（街道）
                    	<input id="addressDetail" name="addressDetail" class="f1 easyui-textbox"value="${culprit.addressDetail }"readonly=true>（详细门牌号）
                    </td>
                </tr>   
            </table>
            </div>
             <div class="easyui-panel" title="罪犯押送情况相关" style="width:100%;padding:10px;">
     	<table width="100%">
     		<tr>
                <td><span class="c-red">*</span>人员接收方式:&nbsp;&nbsp;&nbsp;
     				<input name="dicReceiveTypeKey" id="dicReceiveTypeKey" class="easyui-combobox" value="${culpritJudgment.dicReceiveTypeKey}"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=70000',panelHeight:'auto',readonly:true"></input></td>
			</tr>
     	</table>
     	<table class="easyui-datagrid" id="judg_list_content" style="height: 200px;width:100%"
			data-options="singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/sys/culpritJudgment/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:true,width:80">编号</th>
					<th data-options="field:'name',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">执行押送民警姓名</th>
					<th data-options="field:'identification',width:250,align:'center'" editor="text">单位</th>
					<th data-options="field:'groupName',width:200,align:'center'" editor="text">职务</th>
					<th data-options="field:'escortDate',width:250,align:'center'" editor="text">押送时间</th>
					<th data-options="field:'action',width:160,align:'center'" >操作</th><!-- formatter="formatterJudg" -->
				</tr>
			</thead>
		</table>
    </div>
    <div class="easyui-panel" title="法律文书相关" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%">
                <tr>
                    <td><span class="c-red">*</span>矫正类别:</td>
                    <td><input name="dicPenalTypeKey" class="easyui-combobox"  value="${culpritJudgment.dicPenalTypeKey}"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=20000',panelHeight:'auto',readonly:true"></input></td>
                    <td><span class="c-red">*</span>犯罪类型:</td>
                    <td><input name="dicCrimeTypeKey"  class="easyui-combobox"  value="${culpritJudgment.dicCrimeTypeKey}"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=26000',panelHeight:'auto',readonly:true"></input></td>
                    <td><span class="c-red">*</span>具体罪名:</td>
                    <td>${culpritJudgment.crimeInfo}</td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>审判机关名称:</td>
                    <td>${culpritJudgment.adjudgeOrg}</td>
                    <td><span class="c-red">*</span>判决书编号:</td>
                    <td>${culpritJudgment.adjudgeId}</td>
                    <td><span class="c-red">*</span>判决日期:</td>
                    <td><fmt:formatDate value="${culpritJudgment.adjudgeDate}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>原判刑罚:</td>
                    <td><input name="dicYpxfKey" class="easyui-combobox" value="${culpritJudgment.dicYpxfKey}"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=72000',panelHeight:'auto',readonly:true"></input></td>
                    <td><span class="c-red">*</span>原判刑期:</td>
                    <td>${culpritJudgment.adjudgePeriod}</td>
                    <td><span class="c-red">*</span>刑期开始日期:</td>
                    <td><fmt:formatDate value="${culpritJudgment.adjudgeStartTime}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>刑期结束日期:</td>
                    <td><fmt:formatDate value="${culpritJudgment.adjudgeEndTime}"
									pattern="yyyy-MM-dd" /></td>
                    <td><span class="c-red">*</span>执行通知书文号:</td>
                    <td>${culpritLaw.executeNotificationNum}</td>
                    <td><span class="c-red">*</span>执行通知书日期:</td>
                    <td><fmt:formatDate value="${culpritLaw.executeNotificationDate}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>社区矫正决定机关:</td>
                    <td>${culpritJudgment.adjudgeRedressOrg}</td>
                    <td><span class="c-red">*</span>裁决日期:</td>
                    <td><fmt:formatDate value="${culpritJudgment.adjudgeRedressT}"
									pattern="yyyy-MM-dd" /></td>
                    <td><span class="c-red">*</span>法律文书收到日期:</td>
                    <td><fmt:formatDate value="${culpritLaw.legalDocsReceiveT}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>矫正开始时间:</td>
                    <td><fmt:formatDate value="${culpritJudgment.redressStartDate}"
									pattern="yyyy-MM-dd" /></td>
                    <td><span class="c-red">*</span>矫正结束时间:</td>
                    <td><fmt:formatDate value="${culpritJudgment.redressEndDate}"
									pattern="yyyy-MM-dd" /></td>
                    <td><span class="c-red">*</span>矫正期限:</td>
                    <td>${culpritJudgment.redressPeriod}</td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>文书类型:</td>
                    <td><input name="dicWslxKey" class="easyui-combobox" value="${culpritLaw.dicWslxKey}" 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=125000',panelHeight:'auto'"></input></td>
                    <td><span class="c-red">*</span>文书编号:</td>
                    <td>${culpritLaw.indictmentNum}</td>
                    <td><span class="c-red">*</span>文书生效日期:</td>
                    <td><fmt:formatDate value="${culpritLaw.legalDocsStartDate}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                	<td>是否共同犯罪:</td>
                    <td>
 	 				<!-- style为了radio与文字平行-->
 	 				<input type="radio" name="dicSfgtfzKey" value="${culpritJudgment.dicSfgtfzKey}" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
					<input type="radio" name="dicSfgtfzKey" value="${culpritJudgment.dicSfgtfzKey}" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
 	 				</td>
 	 				<td>有无同矫正对象:</td>
                    <td>
 	 				<!-- style为了radio与文字平行-->
 	 				<input type="radio" name="dicHaveTogetherKey" value="${culpritJudgment.dicHaveTogetherKey}" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
					<input type="radio" name="dicHaveTogetherKey" value="${culpritJudgment.dicHaveTogetherKey}" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
 	 				</td>
 	 				<td><span class="c-red">*</span>首次报道截止时间:</td>
                    <td><fmt:formatDate value="${culpritJudgment.limitDate}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
               	<tr rowspan="3">
					<td>主要犯罪事实:</td>
					<td colspan="6">${culpritJudgment.crimeFact}
    				</td>
 				</tr>
            </table>
    </div>
    <div class="easyui-panel" title="已上传法律文书列表" style="width:100%;padding:10px">
     	<table class="easyui-datagrid" id="judg_list_content" style="height: 200px;"
			data-options="singleSelect:true,collapsible:true,striped:true,fitColumns:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/sys/culpritLaw/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:true,width:80">编号</th>
					<th data-options="field:'legalDocsName',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">法律文书名称</th>
					<th data-options="field:'indictmentNum',width:250,align:'center'" editor="text">法律文书编号</th>
					<th data-options="field:'dicWslxKey',width:200,align:'center'" editor="text">法律文书类型</th>
					<th data-options="field:'legalDocsUploadDate',width:250,align:'center'" editor="text">上传时间</th>
					<th data-options="field:'action',width:160,align:'center'" >操作</th><!-- formatter="formatterJudg" -->
				</tr>
			</thead>
		</table>       
   </div>
    
   
    <a href="#" class="easyui-linkbutton" onclick="javascript:$('#p').panel('open')">关闭</a>
</body>
<script type="text/javascript">
	$(function(){
		$('#sysGroupId').combotree('setValue', "${culprit.groupId }");
	});
	
</script>
</html>
