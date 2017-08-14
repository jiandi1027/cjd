<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div>
	 	<c:choose>
 		<c:when test="${empty commend.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${commend.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
        <div class="easyui-panel" title="表扬信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
                <tr>
                   <th width="10%"><span class="c-red"></span>处理时间：</th>
					<td width="23%"><fmt:formatDate value="${commend.doDate}"
									pattern="yyyy-MM-dd" /></td>
					<th width="10%"><span class="c-red"></span>申请人：</th>
					<td width="23%"> ${commend.sponsor}</td>		
					<th width="10%"><span class="c-red"></span>表扬原因：</th>
					<td width="23%">${commend.reason}</td>
				</tr>
				<tr>
					<th>其他缘故：</th>
					<td>${commend.note}</td>
					<th>考核开始时间：</th>
					<td><fmt:formatDate value="${commend.beginDate}"
									pattern="yyyy-MM-dd" />
					</td>
					 <th>考核结束时间：</th>
					<td><fmt:formatDate value="${commend.endDate}"
									pattern="yyyy-MM-dd" />
					</td>		
				</tr>
				<tr>
					<th><span class="c-red"></span>具体事实：</th>
					<td colspan="5">${commend.fact} </td>
				</tr>
				<tr>
					<th>上传附件：</th>
				   	<td style="border-right-style:none" colspan="5">
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
     <div class="easyui-panel" title="质量评定" style="width:100%;padding:5px;margin:0 auto;">
    	<TABLE width="100%" class="grid">
				<TR>	
					<TH width="10%" >矫正科输入评分：</TH>
					<td width="23%">${jzksr}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(1)">查看详细</a>
					</td>
					<TH  width="10%" >矫正科执法评分：</TH>
					<td width="23%">${jzkzf}&nbsp;&nbsp;
						<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(2)">查看详细</a>
					</td>
					<TH  width="10%" >法制科执法评分：</TH>
					<td width="23%">${fzkzf}&nbsp;&nbsp;
						<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'"  onclick="mxcheckdetail(3)">查看详细</a>
					</td>
				</TR>
		</TABLE>
 	</div> 
 	<div class="easyui-panel" id="p3" title="审批历史" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
                <tr>
                   <th width="20%" style="text-align:center;">操作人</th>
                   <th width="20%" style="text-align:center;">操作时间</th>
                   <th width="20%" style="text-align:center;">操作环节</th>
                   <th width="20%" style="text-align:center;">意见</th>
                   <th width="19%" style="text-align:center;">备注</th>
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr>
                   <td style="text-align:center;">${processDetail.createrCnName }</td>
                   <td style="text-align:center;"><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd" /></td>
                   <td style="text-align:center;">${processDetail.auditName }</td>
                   <td style="text-align:center;">
                		 ${processDetail.dicDecideType == '2'?'退回':'同意'}
                   </td>
                   <td style="text-align:center;">${processDetail.opinion}</td>
                </tr>
                </c:forEach>
            </table>
    </div>
   </div>
<div id="mxCheckDetailForm"></div> 
    
<script>
function mxcheckdetail(infotype){
	console.log('${commend.processInstanceId}');
	var url = '${ctx}/sys/mxCheck/list?infoType='+infotype+'&processInstanceId=${commend.processInstanceId}';
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

</script>
