<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>

	 	<c:choose>
 		<c:when test="${empty outof.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${outof.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>


	<div class="easyui-panel" id="p2" title="迁出信息"
		style="width: 100%; padding: 5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="9%">迁出时间：</th>
				<td width="23%"><fmt:formatDate value="${outof.moveTime}"
						pattern="yyyy-MM-dd" /></td>
				<th width="9%">迁出地点：</th>
				<td width="23%">${outof.place }</td>
				<th width="9%">是否私自：</th>
				<td width="23%">${fns:getSysDicValueByKey('SF_MOVE_OUT','isPrivate',outof.isPrivate ,'')}</td>
			</tr>
			<tr>
				<th>迁出事由：</th>
				<td>${outof.leaveReason }
				</td>
				<th>与矫正人员关系：</th>
				<td>${outof.relation }
						</td>
				<th>职业：</th>
				<td>${outof.job }</td>
			</tr>
			<tr>
				<th>亲属姓名：</th>
				<td >${outof.folkName }</td>
				<th>亲属家庭住址：</th>
				<td >${outof.folkAddress }</td>
				<th>就医情况：</th>
				<td>${outof.hospitalize }</td>
			</tr>
				<tr>
				<th>政治面貌：</th>
				<td >${outof.politicStatus }</td>
				<th>备注：</th>
				<td >${outof.note }</td>
				<th>司法所意见：</th>
				<td >${outof.sfsView }</td>
			</tr>
			<tr>
				<th>附加：</th>
				<td >无附件</td>
				
			
			</tr>
			
		</table>
	</div>

	<div class="easyui-panel" id="p3" title="审批历史" style="width:100%;padding:5px">
            <table width="100%"  class="grid">
                <tr>
                   <th style="text-align:center;" width="15%">操作人</th>
                   <th style="text-align:center;" width="15%">操作时间</th>
                   <th style="text-align:center;" width="15%">操作环节</th>
                   <th style="text-align:center;" width="15%">审批结果</th>
                   <th style="text-align:center;" width="40%">审批意见</th>
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr>
                  <td style="text-align:center;">${processDetail.createrCnName }</td>
                   <td style="text-align:center;"><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd" /></td>
                   <td style="text-align:center;">${processDetail.auditName }</td>
                   <td style="text-align:center;">
                  		<c:choose>
	              			<c:when test="${processDetail.dicDecideType eq 1 }">同意</c:when>
	              			<c:when test="${processDetail.dicDecideType eq 2 }">退回</c:when>
	              			<c:when test="${processDetail.dicDecideType eq 3 }">同意</c:when>
	              			<c:when test="${processDetail.dicDecideType eq 4 }">退回</c:when>
	              			<c:when test="${processDetail.dicDecideType eq 0 }">不同意</c:when>
              			</c:choose>                 
                   	</td>
                   <td style="text-align:center;">${processDetail.opinion }</td>
                </tr>
                 </c:forEach>
            </table>
             
    </div>
    <div id="outofPrint"></div>
    <div style="text-align: center;display: none;">
	    <a id="outofDetailPrint" class="easyui-linkbutton" >打印社区服刑人员居住地变更审批表</a>
	    <a id="outofDetailClose" class="easyui-linkbutton" >关闭</a>
    </div>
   
</body>
<script >

$('#outofDetailPrint').click(function (){
	alert(1) ;
	var url = '${ctx}/endcorrect/outof/print?&id=${outof.id}';
	$('#outofPrint').dialog({
	    title: '打印社区服刑人员居住地变更审批表',
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
				$('#outofPrintBtn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#outofPrint').click();
			}
		}]
	});
	$('#outofPrint').window('center');
});

</script>
</html>
