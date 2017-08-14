<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

	 	<c:choose>
 		<c:when test="${empty commend.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${commend.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
        <div class="easyui-panel" title="相关信息" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
                <tr>
                   <th width="10%"><span class="c-red"></span>处理时间：</th>
					<td width="23%"><fmt:formatDate value="${commend.doDate}"
									pattern="yyyy-MM-dd" /></td>
					<th width="10%"><span class="c-red"></span>申请人：</th>
					<td width="23%"> ${commend.sponsor}</td>
								
					<th width="10%"><span class="c-red"></span>表扬原因：</th>
					<td width="23%">${commend.reason}</td>
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
    
 	<div class="easyui-panel" id="p3" title="审批历史" style="width:100%;padding:5px;">
            <table width="100%" class="grid"style="text-align: center;">
                <tr>
                   <th width="20%" style="text-align:center;">操作人</th>
                   <th width="20%" style="text-align:center;">操作时间</th>
                   <th width="20%" style="text-align:center;">操作环节</th>
                   <th width="20%" style="text-align:center;">意见</th>
                   <th width="20%" style="text-align:center;">备注</th>
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr>
                   <td>${processDetail.createrCnName }</td>
                   <td><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd" /></td>
                   <td>${processDetail.auditName }</td>
                   <td>
                		 ${processDetail.dicDecideType == '2'?'退回':'同意'}
                   </td>
                   <td>${processDetail.opinion}</td>
                </tr>
                </c:forEach>
            </table>
    </div>
    

