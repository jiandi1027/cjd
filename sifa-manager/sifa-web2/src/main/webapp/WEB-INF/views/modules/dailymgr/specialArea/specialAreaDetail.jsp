<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<div>
	 <c:choose>
 		<c:when test="${empty specialArea.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${specialArea.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" id="specialArea_p1" title="申请相关信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%"  class="grid">
               <tr>
                    <th width="10%">申请提交时间：</th>
                    <td width="23%"><fmt:formatDate value="${specialArea.applyDate }"
									pattern="yyyy-MM-dd" /></td>
                    <th width="10%">申请进入时间：</th>
                    <td width="23%"><fmt:formatDate value="${specialArea.startDate }"
									pattern="yyyy-MM-dd" /></td>
                     <th width="10%">申请离开时间：</th>
                     <td width="23%"><fmt:formatDate value="${specialArea.endDate }"
									pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th width="10%">申请进入区域：</th>
                     <td colspan="5">${specialArea.area }</td>
               </tr>
				<tr>
                     <th width="10%">申请原因：</th>
					<td colspan="5">
						<textarea style="width:80%;height:80px;overflow:hidden;border: 0 none;" readonly="readonly" >${specialArea.reason }</textarea>
					</td>
                </tr>
                <tr>
					<th>送达方式：</th>
					<td>
						${fns:getSysDicValueByKey('common_table','sdfs',specialArea.dicSdfsKey,'')}
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
					<th width="10%">备注：</th>
					<td colspan="5">
						<textarea style="width:80%;height:80px;overflow:hidden;border: 0 none;">${specialArea.note }</textarea>
					</td>
                </tr>
            </table>
    </div>
    <div class="easyui-panel" id="specialArea_p4" title="流程信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%"  class="grid">
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
                   		<c:when test="${processDetail.dicDecideType eq 0 }">不同意</c:when>
                   		</c:choose></td>
                 
                </tr>
                 </c:forEach>
            </table>
    </div>
  </div>
    <div id="printSpecialArea"></div>
     <div style="text-align: center;display: none;">
	    <a id="specialAreaPrint1" class="easyui-linkbutton" >打印《社区服刑人员进入特定区域（场所）审批表 》</a>
    </div>
<script type="text/javascript">
$('#specialAreaPrint1').click(function (){
	var url ='${ctx}/dailymgr/specialArea/printShenhe?id=${specialArea.id}';
	$('#printSpecialArea').dialog({
	    title: '打印《社区服刑人员进入特定区域（场所）审批表 》',
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
				$('#specialAreaTablePrintBtn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#printSpecialArea').dialog('close');
			}
		}]
	});
	$('#printSpecialArea').window('center');
});
</script>
