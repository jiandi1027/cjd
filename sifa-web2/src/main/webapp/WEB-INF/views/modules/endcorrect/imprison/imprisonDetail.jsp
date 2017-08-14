<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<div>
	 <c:choose>
 		<c:when test="${empty imprison.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${imprison.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" id="imprison_p1" title="收监执行相关信息" style="width:100%;padding:5px;margin: 0 auto;">
            <table width="100%" class="grid">
            	<tr>
                   <th width="10%">裁定结果：</th>
                   <td width="23%">${fns:getSysDicValueByKey('SF_IMPRISON','DIC_JUDGE_RESULT_KEY',imprison.dicJudgeResultKey,'') }</td>
					<th width="10%">裁定时间：</th>
					<td width="23%"><fmt:formatDate value="${imprison.judgeTime }" pattern="yyyy-MM-dd" /></td>
					<th width="10%">裁定机关：</th>
					<td width="23%">${imprison.judgeOrg }</td>
                </tr>
                <tr>
                   <th>收监类型：</th>
                   <td>${fns:getSysDicValueByKey('comme_table','DIC_IMPRISON_TYPE_KEY',imprison.dicImprisonTypeKey,'') }</td>
					<th>收监时间：</th>
					<td><fmt:formatDate value="${imprison.imprisonDate }" pattern="yyyy-MM-dd" /></td>
					<th>收监结果：</th>
					<td>${fns:getSysDicValueByKey('SF_IMPRISON','IMPRISON_DEAL_RESULT',imprison.imprisonDealResult,'') }</td>
                </tr>
                <tr>
                   <th>通报公安机关：</th><td>${imprison.organizationName }</td>
					<th>通报时间：</th><td ><fmt:formatDate value="${imprison.reportDate }" pattern="yyyy-MM-dd" /></td>
					<th>通报人：</th><td>${imprison.reportPersonName }</td>
                </tr>
                <tr>
                   <th>关押监狱：</th><td>${imprison.prisonName }</td>
					<th>裁定材料：</th>
					<td>
						<c:forEach var="sysFile" items="${fileList1}">
						<div id="file_${sysFile.id}">${sysFile.originName}
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
						</c:forEach>
					</td>
					<th>驳回（拒收）材料：</th>
					<td>
						<c:forEach var="sysFile" items="${fileList2}">
						<div id="file_${sysFile.id}">${sysFile.originName}
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
						</c:forEach>
					</td>
                </tr>
                <tr>
                   <th>不予收监理由：</th><td colspan="5"><textarea style="width:80%;height:80px;overflow:hidden;border: 0 none;" readonly="readonly" >${imprison.opposeReason }</textarea></td>
                </tr>
            </table>
    </div>
     <div class="easyui-panel" title="质量评定" style="width:100%;padding:5px;margin: 0 auto;">
		 <table width="100%" class="grid">
					<tr>
						
						<Th width="10%" >矫正科输入评分：</Th><td width="23%">${jzksr}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(1)">查看详细</a>
						</TD>
						<Th width="10%" >矫正科执法评分：</Th><td width="23%">${jzkzf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(2)">查看详细</a>
						</TD>
						<Th width="10%" >法制科执法评分：</Th><td width="23%">${fzkzf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(3)">查看详细</a>
						</TD>
					</tr>
					
		             <TR>	
						<Th width="10%" >矫正处输入评分：</Th><td width="23%">${jzcsr}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(4)">查看详细</a>
						</TD>
						<Th width="10%" >矫正处执法评分：</Th><td width="23%">${jzczf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(5)">查看详细</a>
						</TD>
						<Th width="10%" >法制处执法评分：</Th><td width="23%">${fzczf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(6)">查看详细</a>
						</TD>
					</tr>
		 </table>
 	</div>
    
     <div class="easyui-panel" id="revokeParole_p3" title="流程信息" style="width:100%;padding:5px;margin: 0 auto;">
            <table width="100%" class="grid">
                <tr>
                   <th width="15%" style="text-align:center;">操作人</th>
                   <th width="15%" style="text-align:center;">操作时间</th>
                   <th width="15%" style="text-align:center;">操作环节</th>
                   <th width="20%" style="text-align:center;">审批意见</th>
                   <th width="15%" style="text-align:center;">审批结果</th>
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr>
                  	<td style="text-align:center;">${processDetail.createrCnName }</td>
                   <td style="text-align:center;"><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                   <td style="text-align:center;">${processDetail.auditName }</td>
                   <td style="text-align:center;">${processDetail.opinion }</td>
                   <td style="text-align:center;"><c:choose>
                   		<c:when test="${processDetail.dicDecideType eq 1 }">同意</c:when>
                   		<c:when test="${processDetail.dicDecideType eq 2 }">退回</c:when>
                   		<c:when test="${processDetail.dicDecideType eq 3 }">不同意</c:when>
                   		<c:when test="${processDetail.dicDecideType eq 6 }">同意</c:when>
                   		</c:choose>
                   	</td>
                </tr>
                 </c:forEach>
            </table>
    </div>
    <div id="printImprisonJianyi"></div>
    <div id="mxCheckDetailForm"></div>
    <div style="text-align: center;display: none;">
	    <a id="imprisonPrint1" class="easyui-linkbutton" >打印《收监执行建议书》</a>
	    <a id="imprisonPrint2" class="easyui-linkbutton" >打印《提请收监执行审核表》</a>
    </div>
 </div>
 <script type="text/javascript">
function mxcheckdetail(infotype){
	var url = '${ctx}/sys/mxCheck/list?infoType='+infotype+'&processInstanceId=${imprison.processInstanceId}';
	$('#mxCheckDetailForm').dialog({    
	    title: '评分详细',    
	    width: 800,
	    height: 650,
	    href: url,    
	    modal: true,
	    resizable:true,
        maximizable:true,
	    buttons :[{
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#mxCheckDetailForm').dialog('close');
			}
		}]
	});
	$('#mxCheckDetailForm').window('center');
}

$('#imprisonPrint1').click(function (){
	var url ='${ctx}/endcorrect/imprison/printJianyi?id=${imprison.id}';
	$('#printImprisonJianyi').dialog({
	    title: '打印《收监执行建议书》',
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
				$('#printImprisonBookBtn1').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#printImprisonJianyi').dialog('close');
			}
		}]
	});
	$('#printImprisonJianyi').window('center');
});
$('#imprisonPrint2').click(function (){
	var url ='${ctx}/endcorrect/imprison/printShenhe?id=${imprison.id}';
	$('#printImprisonJianyi').dialog({
	    title: '打印《提请收监执行审核表》',
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
				$('#printImprisonBookBtn2').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#printImprisonJianyi').dialog('close');
			}
		}]
	});
	$('#printImprisonJianyi').window('center');
});


</script>
