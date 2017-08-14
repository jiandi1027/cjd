<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div>
	<c:choose>
 		<c:when test="${empty reducePenalty.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${reducePenalty.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    	 <div class="easyui-panel" id="p2" title="减刑信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
            	<tr>
                   <th width="10%">减刑年限：</th>
					<td>
						${reducePenalty.reduceTime}
					</td>
				</tr>
				 <tr>
                    <th width="10%">表现情况：</th>
					<td width="90%"><textarea readOnly=true style="width:80%;height:100px;border: 0 none;">${reducePenalty.actions }</textarea> </td>
                </tr>
                 <tr>
                   <th>送达方式：</th>
					<td>
					${reducePenalty.dicSdfsKey}
					</td>
				</tr>
				<tr>
					<th>告知材料：</th>
					<td>
						<c:forEach var="sysFile" items="${fileList1}">
						<div id="file_${sysFile.id}">${sysFile.originName}
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
					</c:forEach>
					</td>
				</tr>
               
                <tr>
                   <th width="10%">附件下载：</th>
				   <td width="90%"><div id="wtdchUploadIng">
							<c:forEach var="sysFile" items="${fileList}">
							<div id="file_${sysFile.id}">${sysFile.originName}
							<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
							</div>
							</c:forEach>
						</div>
					</td>
                </tr>
            </table>
    </div>
    <div class="easyui-panel" id="p3" title="流程信息" style="width:100%;padding:5px;margin:0 auto;">
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
                   		<c:when test="${processDetail.dicDecideType eq 0 }">不同意</c:when>
                   		<c:when test="${processDetail.dicDecideType eq 10 }">优秀</c:when>
                   		<c:when test="${processDetail.dicDecideType eq 11 }">良好</c:when>
                   		<c:when test="${processDetail.dicDecideType eq 12 }">一般</c:when>
                   		<c:when test="${processDetail.dicDecideType eq 13 }">较差</c:when>
                   		</c:choose>
                   	</td>
                </tr>
                 </c:forEach>
            </table>
    </div>
    <div style="text-align: center;display: none;">
    	<a id="reducePenalty1" class="easyui-linkbutton" >打印社区服刑人员减刑建议书</a>
    </div>
    <div id="reducePenaltyPrint"></div>
</div>

<script >
$('#reducePenalty1').click(function (){
	var url = '${ctx}/rewardspunishment/reducePenalty/print?id=${reducePenalty.id}';
	$('#reducePenaltyPrint').dialog({
	    title: '打印社区服刑人员减刑建议书',
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
				$('#reducePenaltyPrintBtn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#reducePenaltyPrint').dialog('close');
			}
		}]
	});
	$('#reducePenaltyPrint').window('center');
});

</script>

