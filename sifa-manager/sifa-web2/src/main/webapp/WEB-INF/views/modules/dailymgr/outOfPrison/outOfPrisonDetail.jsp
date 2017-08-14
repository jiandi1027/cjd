<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="" id="aa" >
	<c:choose>
 		<c:when test="${empty outOfPrison.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${outOfPrison.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
     <div class="easyui-panel" id="outOfPrison_p1" title="申请相关信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
            	<tr><th width="10%">延长期限（月）：</th><td  width="89%">${outOfPrison.extendTime }</td></tr>
                <tr><th width="10%">延长期限开始时间：</th><td><fmt:formatDate value="${outOfPrison.startDate }" pattern="yyyy-MM-dd" /></td></tr>
                <tr><th width="10%">延长期限结束时间：</th><td><fmt:formatDate value="${outOfPrison.endDate }" pattern="yyyy-MM-dd" /></td></tr>
                <tr>
                    <th width="10%">鉴定结果及期限：</th>
                    <td ><c:if test="${outOfPrison.isConform  eq '1'}">符合条件</c:if>
				        <c:if test="${outOfPrison.isConform  eq '0' }">不符合条件</c:if>且
				        <c:if test="${outOfPrison.isDeadline  eq '1' }">有明确期限</c:if>
				        <c:if test="${outOfPrison.isDeadline  eq '0' }">无明确期限</c:if>
				    </td>
				</tr>
				<tr><th width="10%">法律文书附件：</th>
				    <td>
						<c:forEach var="sysFile" items="${fileList1}">
							<div id="file_${sysFile.id}">${sysFile.originName}
								<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
							</div>
						</c:forEach>
				    </td>
				 </tr>
				 <tr>
                    <th width="10%">证据材料附件：</th>
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
						${fns:getSysDicValueByKey('common_table','sdfs',outOfPrison.dicSdfsKey,'')}
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
					<th>申请延长原因及依据：</th>
					<td><textarea style="width:80%;height:80px;overflow:hidden;border: 0 none;" readonly="readonly" >${outOfPrison.reason }</textarea></td>
                </tr>
            </table>
    </div>
    <div class="easyui-panel" title="质量评定" style="width:100%;padding:5px;margin:0 auto;">
		 <table width="100%" class="grid">
					<tr>
						
						<Th width="10%" >矫正科输入评分：</Th><td width="23%">${jzksr}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckdetail(1)">查看详细</a>
						</TD>
						<Th width="10%" >矫正科执法评分：</Th><td width="23%">${jzkzf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckdetail(2)">查看详细</a>
						</TD>
						<Th width="10%" >法制科执法评分：</Th><td width="23%">${fzkzf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckdetail(3)">查看详细</a>
						</TD>
					</tr>
					
		                <TR>	
						<Th width="10%" >矫正处输入评分：</Th><td width="23%">${jzcsr}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckdetail(4)">查看详细</a>
						</TD>
						<Th width="10%" >矫正处执法评分：</Th><td width="23%">${jzczf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckdetail(5)">查看详细</a>
						</TD>
						<Th width="10%" >法制处执法评分：</Th><td width="23%">${fzczf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckdetail(6)">查看详细</a>
						</TD>
					</tr>
		 </table>
 	</div>
    
    <%-- <div class="easyui-panel" id="outOfPrison_p3" title="作废相关信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
            	<tr>
                    <th width="10%">作废时间：</th>
                    <td width="23%"><fmt:formatDate value="${outOfPrison.flagTime }"
									pattern="yyyy-MM-dd" /></td>
                    <th width="10%">作废人：</th>
                    <td width="23%">${outOfPrison.flagAccountName}</td>
                     <th width="10%">作废原因：</th>
                     <td width="23%">${fns:getSysDicValueByKey('common_table','flagReasonId',outOfPrison.flagReasonId,'') }</td>
                </tr>
                <tr>
                    <th>相关材料：</th>
                    <td colspan="5">${outOfPrison.flagPath }</td>
                </tr>  
            	<tr>
					<th>作废详情：</th>
					<td colspan="5">${outOfPrison.flagDetailReason }</td>
                </tr>
            </table>
    </div> --%>
   
    
   <div class="easyui-panel" id="outOfPrison_p4" title="流程信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
                <tr>
                   <th width="15%" style="text-align:center;">操作人</th>
                   <th width="15%" style="text-align:center;">操作时间</th>
                   <th width="15%" style="text-align:center;">操作环节</th>
                   <th width="30%" style="text-align:center;">审批意见</th>
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
                   		<c:when test="${processDetail.dicDecideType eq 1 || processDetail.dicDecideType eq 6}">同意</c:when>
                   		<c:when test="${processDetail.dicDecideType eq 2 }">退回</c:when>
                   		<c:when test="${processDetail.dicDecideType eq 3 }">不同意</c:when>
                   		</c:choose>
                   	</td>
                </tr>
                 </c:forEach>
            </table>
    </div>
    <div id="printOutofPrisonShenHe"></div>
    <div id="mxCheckDetailForm"></div>
    <div style="text-align: center;display: none;">
	    <a id="outOfPrisonPrint1" class="easyui-linkbutton" >打印《延长暂予监外执行建议书》</a>
	    <a id="outOfPrisonPrint2" class="easyui-linkbutton" >打印《延长暂予监外执行审核表》</a>
	    <a id="outOfPrisonPrint3" class="easyui-linkbutton" >打印《社区矫正人员医学司法鉴定委托书》</a>
    </div>
</form>

<script type="text/javascript">
function mxcheckdetail(infotype){
	var url = '${ctx}/sys/mxCheck/list?infoType='+infotype+'&processInstanceId=${outOfPrison.processInstanceId}';
	$('#mxCheckDetailForm').dialog({    
	    title: '评分详细',
	    iconCls:'fi-checkbox icon-blue',
	    width: 800,
	    height: 650,
	    href: url,    
	    modal: true,
        resizable : true,
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

$('#outOfPrisonPrint1').click(function (){
	var url ='${ctx}/dailymgr/outOfPrison/printJianYi?id=${outOfPrison.id}';
	$('#printOutofPrisonShenHe').dialog({
	    title: '打印《延长暂予监外执行建议书》',
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
				$('#outOfPrisonBookPrintBtn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#printOutofPrisonShenHe').dialog('close');
			}
		}]
	});
	$('#printOutofPrisonShenHe').window('center');
});

$('#outOfPrisonPrint2').click(function (){
	var url ='${ctx}/dailymgr/outOfPrison/printShenhe?id=${outOfPrison.id}';
	$('#printOutofPrisonShenHe').dialog({
	    title: '打印《延长暂予监外执行审核表》',
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
				$('#outOfPrisonTablePrintBtn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#printOutofPrisonShenHe').dialog('close');
			}
		}]
	});
	$('#printOutofPrisonShenHe').window('center');
});


$('#outOfPrisonPrint3').click(function (){
	var url ='${ctx}/dailymgr/outOfPrison/printYiXue?id=${outOfPrison.id}';
	$('#printOutofPrisonShenHe').dialog({
	    title: '打印《社区矫正人员医学司法鉴定委托书》',
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
				$('#outOfPrisonYiXuePrintBtn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#printOutofPrisonShenHe').dialog('close');
			}
		}]
	});
	$('#printOutofPrisonShenHe').window('center');
});
</script>
