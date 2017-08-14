<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<div>
	 <c:choose>
 		<c:when test="${empty revokeProbation.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${revokeProbation.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" id="revokeProbation_p1" title="撤销缓刑相关信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
            	<tr rowspan="5">
                    <th width="10%">违纪原因：</th>
					<td>${fns:getSysDicValueByKey('sf_revoke_probation','REASON_TYPE_ID',revokeProbation.reasonTypeId,'')}</td>
                </tr> 
                <tr>
					<th>结案报告：</th>
					<td>
						<c:forEach var="sysFile" items="${fileList1}">
						<div id="file_${sysFile.id}">${sysFile.originName}
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
					</c:forEach>
					</td>
				</tr>
				<tr>
					<th>证据材料：</th>
					<td>
						<c:forEach var="sysFile" items="${fileList2}">
						<div id="file_${sysFile.id}">${sysFile.originName}
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
					</c:forEach>
					</td>
				</tr>
				<tr>
					<th>送达方式：</th>
					<td>
						${fns:getSysDicValueByKey('common_table','sdfs',revokeProbation.dicSdfsKey,'')}
					</td>
				</tr>
				<tr>
					<th>告知材料：</th>
					<td>
						<c:forEach var="sysFile" items="${fileList3}">
						<div id="file_${sysFile.id}">${sysFile.originName}
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
					</c:forEach>
					</td>
				</tr>
                <tr>
                    <th>简要违纪情况：</th><td><textarea readOnly=true style="width:80%;height:80px;border: 0 none;">${revokeProbation.detailInfo }</textarea></td>
                </tr>
                <tr>
                    <th>处理依据：</th><td><textarea readOnly=true style="width:80%;height:80px;border: 0 none;">${revokeProbation.fact }</textarea></td>
                </tr>
            </table>
    </div>
     <div class="easyui-panel" title="质量评定" style="width:100%;padding:5px;margin:0 auto;">
		 <table width="100%" class="grid">
					<tr>
						
						<Th width="10%" >矫正科输入评分：</Th><td width="23%">${jzksr}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(1)">查看详细</a>
						</TD>
						<Th width="10%" >矫正科执法评分：</Th><td width="23%">${jzkzf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton"  data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckdetail(2)">查看详细</a>
						</TD>
						<Th width="10%" >法制科执法评分：</Th><td>${fzkzf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton"  data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckdetail(3)">查看详细</a>
						</TD>
					</tr>
					
		                <TR>	
						<Th width="10%" >矫正处输入评分：</Th><td width="23%">${jzcsr}&nbsp;&nbsp;
							<a  class="easyui-linkbutton"  data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckdetail(4)">查看详细</a>
						</TD>
						<Th width="10%" >矫正处执法评分：</Th><td width="23%">${jzczf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton"  data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckdetail(5)">查看详细</a>
						</TD>
						<Th width="10%" >法制处执法评分：</Th><td>${fzczf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton"  data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckdetail(6)">查看详细</a>
						</TD>
					</tr>
		 </table>
 	</div>
    
    <div class="easyui-panel" id="revokeProbation_p3" title="流程信息" style="width:100%;padding:5px;margin:0 auto;">
             <table width="100%" class="grid">
                <tr>
                  <th width="15%"  style="text-align:center;">操作人</th>
                   <th width="15%"  style="text-align:center;">操作时间</th>
                   <th width="15%"  style="text-align:center;">操作环节</th>
                   <th width="30%"  style="text-align:center;">审批意见</th>
                   <th style="text-align:center;">审批结果</th>
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
    <div id="printJianYi"></div>
    <div id="mxCheckDetailForm"></div>
    <div style="text-align: center;display: none;">
	    <a id="revokeProbationPrint1" class="easyui-linkbutton" >打印《撤销缓刑建议书》</a>
	    <a id="revokeProbationPrint2" class="easyui-linkbutton" >打印《撤销缓刑审批表》</a>
    </div>
</div>
<script type="text/javascript">
function mxcheckdetail(infotype){
	var url = '${ctx}/sys/mxCheck/list?infoType='+infotype+'&processInstanceId=${revokeProbation.processInstanceId}';
	$('#mxCheckDetailForm').dialog({    
	    title: '评分详细', 
	    iconCls:'fi-checkbox icon-blue',
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

$('#revokeProbationPrint1').click(function (){
	var url ='${ctx}/rewardspunishment/revokeProbation/printJianYi?id=${revokeProbation.id}';
	$('#printJianYi').dialog({
	    title: '打印《撤销缓刑建议书》',
        iconCls:'fi-print icon-blue',
	    width: 900,    
	    height: 600,    
	    href: url,    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'打印',
            iconCls:'fi-print icon-blue',
			handler:function(){
				$('#printRevokeProbationBook').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#printJianYi').dialog('close');
			}
		}]
	});
	$('#printJianYi').window('center');
});
$('#revokeProbationPrint2').click(function (){
	var url ='${ctx}/rewardspunishment/revokeProbation/printShenghe?id=${revokeProbation.id}';
	$('#printJianYi').dialog({
	    title: '打印《撤销缓刑审批表》',
        iconCls:'fi-print icon-blue',
	    width: 900,    
	    height: 600,    
	    href: url,    
	    modal: true,
        resizable : true,
        maximizable:true, 
	    buttons :[{
			text:'打印',
            iconCls:'fi-print icon-blue',
			handler:function(){
				$('#printRevokeProbationTable').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#printJianYi').dialog('close');
			}
		}]
	});
	$('#printJianYi').window('center');
});

</script>
