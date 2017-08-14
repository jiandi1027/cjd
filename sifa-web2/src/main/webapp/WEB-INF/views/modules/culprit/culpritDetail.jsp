<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div>
	<div class="easyui-panel" title="报到情况相关" style="width: 100%; padding: 5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">报道情况：</th>
				<td>
					<c:if test='${culprit.dicReportInfoKey eq 1}'>正常</c:if>
					<c:if test='${culprit.dicReportInfoKey eq 2}'>漏管，${fns:getSysDicValueByKey('sf_culprit','dic_reportType_Key',culprit.dicReportTypeKey,'')}</c:if>
				</td>
			</tr>
		</table>
	</div>
	 <div class="easyui-panel"  title="基本信息" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
            	<tr>
            		<th width="10%">司法所：</th><td width="20%">${culprit.groupName }</td>
            		<th width="10%">人员编号：</th><td width="20%">${culprit.no }</td>
            		<th width="10%">是否成年：</th>
                    <td width="20%">
 	 					<c:if test="${culprit.dicIsAdultKey eq 1}">成年</c:if>
						<c:if test="${culprit.dicIsAdultKey eq 0}">未成年</c:if>
 	 				</td>
            		<td width="10%" rowspan=6 align="center">
            		<img id="headimg" src="${filePath}/${image.path}/${image.name}" style="cursor:pointer;" height="200px" width="100%;">
					</td>
            	</tr>
                <tr>
                    <th>姓名：</th><td>${culprit.name }</td>
                    <th>证件类型：</th>
                    <td>${fns:getSysDicValueByKey('SF_CULPRIT','dicZjlxKey',culprit.dicZjlxKey,'')}</td>
                    <th>证件号码：</th>
                    <td>${culprit.identification }</td> 
                </tr>
                <tr>
                    <th>性别：</th>
                    <td>${fns:getSysDicValueByKey('common_table','sex',culprit.dicSexKey,'')}</td>
                     <th>民族：</th>
                    <td>${fns:getSysDicValueByKey('common_table','nation',culprit.nation,'')}</td>
               		<th>籍贯：</th><td>${culprit.origin }</td>
                </tr>
                <tr>
                    
                     <th>出生日期：</th>
                     <td><fmt:formatDate value="${culprit.birthday}" pattern="yyyy-MM-dd" /></td>
                     <th>联系方式：</th>
                    <td>${culprit.contactPhone }</td>
                    <th>户籍性质：</th>
                    <td>${fns:getSysDicValueByKey('common_table','hklx',culprit.dicHklxKey,'')}</td>
                </tr>
                
                 <tr>
                 	<th>曾用名：</th><td>${culprit.alias }</td>
                    <th>婚姻状况：</th><td>${fns:getSysDicValueByKey('common_table','hyzk',culprit.dicHyzkKey,'')}</td> 
                    <th>文化程度：</th>
                    <td>${fns:getSysDicValueByKey('common_table','whcd',culprit.dicWhcdKey,'')}</td>                    
                </tr>
                 <tr>
                   	<th>出生地：</th><td>${culprit.homePlace}</td>
                    <th>现在工作单位：</th><td>${culprit.newJob }</td>
                  	<th>单位联系方式：</th><td>${culprit.jobPhone}</td>
                </tr>
                <tr>
                    <th>户籍详细地址：</th>
                    <td colspan="8">${fns:getAreaValueById(culprit.regResidenceProId, '') }${fns:getAreaValueById(culprit.regResidenceCityId, '') }${fns:getAreaValueById(culprit.regResidenceCountryId, '') }${culprit.regResidenceStreet}${culprit.regResidenceDetail}</td>
                </tr>
                <tr>
                    <th>居住地详细地址：</th>
                    <td colspan="8">${fns:getAreaValueById(culprit.addressProId, '') }${fns:getAreaValueById(culprit.addressCityId, '') }${fns:getAreaValueById(culprit.addressCountryId, '') }${culprit.addressStreet}${culprit.addressDetail}</td>
                </tr>   
            </table>
            </div>
        <div class="easyui-panel" title="罪犯押送情况相关" style="width:100%;padding:5px;">
     	<table width="100%" class="grid">
     		<tr>
                <th width="10%">人员接收方式：</th>
                <td width="90%">${fns:getSysDicValueByKey('culprit_judgment','dicReceiveTypeKey',culprit.culpritJudgment.dicReceiveTypeKey,'')}</td>
			</tr>
     	</table>
     	<!-- <table class="easyui-datagrid" id="judg_list_content" style="height: 200px;width:100%"
			data-options="singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:true,width:80">编号</th>
					<th data-options="field:'name',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">执行押送民警姓名</th>
					<th data-options="field:'identification',width:250,align:'center'" editor="text">单位</th>
					<th data-options="field:'groupName',width:200,align:'center'" editor="text">职务</th>
					<th data-options="field:'escortDate',width:250,align:'center'" editor="text">押送时间</th>
					<th data-options="field:'action',width:160,align:'center'" >操作</th>formatter="formatterJudg"
				</tr>
			</thead>
		</table> -->
    </div>
    <div class="easyui-panel" title="法律文书相关" style="width:100%;padding:5px;margin-bottom: 30px;">
            <table width="100%" class="grid">
                <tr>
                    <th width="10%">矫正类别：</th><td width="20%">${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',culprit.culpritJudgment.dicPenalTypeKey,'')}</td>
                    <th width="10%">犯罪类型：</th><td width="20%">${fns:getSysDicValueByKey('sf_culpritJudgment','dicCrimeTypeKey',culprit.culpritJudgment.dicCrimeTypeKey,'')}</td>
                    <th width="10%">具体罪名：</th><td width="30%">${culprit.culpritJudgment.crimeInfo}</td>
                </tr>
                <tr>
                    <th>审判机关名称：</th><td>${culprit.culpritJudgment.adjudgeOrg}</td>
                    <th>判决书编号：</th><td>${culprit.culpritJudgment.adjudgeId}</td>
                    <th>判决日期：</th><td><fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <th>原判刑罚：</th>
                    <td>${fns:getSysDicValueByKey('culpritJudgment','dicYpxfKey',culprit.culpritJudgment.dicYpxfKey,'')}</td>
                    <th>原判刑期：</th>
                    <td>${culprit.culpritJudgment.adjudgePeriod}</td>
                    <th>刑期开始日期：</th>
                    <td><fmt:formatDate value="${culprit.culpritJudgment.adjudgeStartTime}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <th>刑期结束日期：</th>
                    <td><fmt:formatDate value="${culprit.culpritJudgment.adjudgeEndTime}"
									pattern="yyyy-MM-dd" /></td>
                    <th>执行通知书文号：</th>
                    <td>${culpritLaw.executeNotificationNum}</td>
                    <th>执行通知书日期：</th>
                    <td><fmt:formatDate value="${culpritLaw.executeNotificationDate}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <th>社区矫正决定机关：</th>
                    <td>${culprit.culpritJudgment.adjudgeRedressOrg}</td>
                    <th>裁决日期：</th>
                    <td><fmt:formatDate value="${culprit.culpritJudgment.adjudgeRedressT}"
									pattern="yyyy-MM-dd" /></td>
                    <th>法律文书收到日期：</th>
                    <td><fmt:formatDate value="${culpritLaw.legalDocsReceiveT}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <th>矫正开始时间：</th>
                    <td><fmt:formatDate value="${culprit.culpritJudgment.redressStartDate}"
									pattern="yyyy-MM-dd" /></td>
                    <th>矫正结束时间：</th>
                    <td><fmt:formatDate value="${culprit.culpritJudgment.redressEndDate}"
									pattern="yyyy-MM-dd" /></td>
                    <th>矫正期限：</th>
                    <td>${culprit.culpritJudgment.redressPeriod}</td>
                </tr>
                <tr>
                    <th>文书类型：</th>
                    <td>${fns:getSysDicValueByKey('sf_culpritLaw','dicWslxKey',culpritLaw.dicWslxKey,'')}</td>
                    <th>文书编号：</th>
                    <td>${culpritLaw.indictmentNum}</td>
                    <th>文书生效日期：</th>
                    <td><fmt:formatDate value="${culpritLaw.legalDocsStartDate}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                	<th>是否共同犯罪：</th>
                    <td>
                    <c:if test="${culprit.culpritJudgment.dicSfgtfzKey eq 0}">是</c:if>
                    	<c:if test="${culprit.culpritJudgment.dicSfgtfzKey eq 1}">否</c:if>
                   </td>
 	 				<th>有无同矫正对象：</th>
                    <td>
                    	<c:if test="${culprit.culpritJudgment.dicHaveTogetherKey eq 0}">有</c:if>
                    	<c:if test="${culprit.culpritJudgment.dicHaveTogetherKey eq 1}">无</c:if>
                    </td>
 	 				<th>首次报道截止时间：</th>
                    <td><fmt:formatDate value="${culprit.culpritJudgment.limitDate}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
               	<tr rowspan="3">
					<th>主要犯罪事实：</th>
					<td colspan="6"><textarea readOnly=true style="width:80%;height:80px;border: 0 none;">${culprit.culpritJudgment.crimeFact}</textarea>
    				</td>
 				</tr>
 				<tr>
					<th>文书下载：</th>
					<td colspan="6">
						<div id="wtdchUploadIng">
							<c:forEach var="sysFile" items="${fileList2}">
							<div id="file_${sysFile.id}">${sysFile.originName}
							<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div></div>
						</c:forEach>
						</div>
					</td>
				</tr>
            </table>
    </div>
    <%-- <div class="easyui-panel" title="已上传法律文书列表" style="width:100%;padding:5px">
     	<table class="easyui-datagrid" id="judg_list_content" style="height: 200px;"
			data-options="singleSelect:true,collapsible:true,striped:true,fitColumns:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'',url:'${ctx}/culprit/culpritLaw/list?culpritId=${culprit.id}',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:true,width:80">编号</th>
					<th data-options="field:'legalDocsName',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">法律文书名称</th>
					<th data-options="field:'indictmentNum',width:250,align:'center'" editor="text">法律文书编号</th>
					<th data-options="field:'dicWslxKey',width:200,align:'center',formatter:function(value,rowData,rowIndex){    
						    	 return sy.getDicValue('sf_culpritLaw','dicWslxKey',rowData.dicWslxKey,''); }" editor="text">法律文书类型</th>
					<th data-options="field:'created',width:250,align:'center'" editor="text">上传时间</th>
				</tr>
			</thead>
		</table>       
   </div> --%>
</div>
<div id="printDiv"></div>
<div style="text-align: center;display: none;">
	    <a id="printGZS1" class="easyui-linkbutton" >打印《告知书》</a>
	     <a id="printBDTZD" class="easyui-linkbutton" >打印《告知书》</a>
</div>
<script type="text/javascript">
$('#printGZS1').click(function (){
	var url ='${ctx}/culpritinfo/culprit/printGZS?id=${culprit.id}';
	$('#printDiv').dialog({
	    title: '打印《告知书》',
        iconCls:'fi-print icon-blue',
	    width: 800,    
	    height: 600,    
	    href: url,    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'打印',
            iconCls:'fi-print icon-blue',
			handler:function(){
				$('#printCulpritGZSBtn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#printDiv').dialog('close');
			}
		}]
	});
	$('#printDiv').window('center');
});
$('#printBDTZD').click(function (){
	var url ='${ctx}/culpritinfo/culprit/printTZD?id=${culprit.id}';
	$('#printDiv').dialog({
	    title: '打印《报到情况通知单》',
        iconCls:'fi-print icon-blue',
        width : sy.getBrowerWidth()-800,
        height : sy.getBrowerHeight()-150,    
	    href: url,    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'打印',
            iconCls:'fi-print icon-blue',
			handler:function(){
				$('#printTZDbtn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#printDiv').dialog('close');
			}
		}]
	});
	$('#printDiv').window('center');
});
</script>
