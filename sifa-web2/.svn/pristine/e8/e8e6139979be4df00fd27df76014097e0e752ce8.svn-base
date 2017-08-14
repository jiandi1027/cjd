<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>期满解矫</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>
<form method="post" id="finishRedressDetail" name="finishRedressDetail">
	<c:choose>
 		<c:when test="${empty finishRedress.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${finishRedress.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   <div id="finishRedressQmjdb"></div>
   <div id="finishRedressJcjzzms"></div>
   <div id="finishRedressJcsqjzxgs"></div>
   <div id="finishRedressJztzs"></div>
     <div class="easyui-panel" title="期满解矫信息" style="width:100%;padding:5px;">
     		<input type="hidden" name="id" id="id" value="${finishRedress.id}"/>
            <table width="100%" class="grid">
                <tr>
                   <th width="10%">矫正期间表现：</th>
							<td width="23%">${fns:getSysDicValueByKey('SF_FINISH_REDRESS','DIC_REDRESS_SHOW_KEY',finishRedress.dicRedressShowKey,'')}</td>
					<th width="10%">认罪态度：</th>
							<td width="23%">${fns:getSysDicValueByKey('SF_FINISH_REDRESS','DIC_PLEA_ATTITUDE_KEY',finishRedress.dicPleaAttitudeKey,'')}</td>
							<th width="10%">是否三无人员：</th>
							<td width="23%"><c:if test="${finishRedress.dicSThreeNonKey==1}">是</c:if>  　<c:if test="${finishRedress.dicSThreeNonKey==0}">否</c:if> </td>
                </tr>
                <tr>
							<th width="10%">是否参加职业技能培训：</th>
							<td width="23%"> <c:if test="${finishRedress.dicIsTrainKey==1}">是</c:if>  　<c:if test="${finishRedress.dicIsTrainKey==0}">否</c:if></td>
					<th width="10%">是否获得技能证书：</th>
							<td width="23%"><c:if test="${finishRedress.dicSkillsCertificateKey==1}">是</c:if>  　<c:if test="${finishRedress.dicSkillsCertificateKey==0}">否</c:if> </td>
							<th width="10%">技术特长及等级：</th>
							<td width="23%">${finishRedress.skillInfo}</td>
                </tr>
				<tr>
                   <th width="10%">危险性评估：</th>
							<td width="23%">${fns:getSysDicValueByKey('SF_FINISH_REDRESS','RISK_ID',finishRedress.riskId,'')}</td>
					<th width="10%">家庭联系情况：</th>
							<td width="23%" colspan="3">${fns:getSysDicValueByKey('SF_FINISH_REDRESS','FAMILY_CONTACT_ID',finishRedress.familyContactId,'')}</td>
                </tr>
                <tr>
                    <th width="10%">特殊情况备注：</th>
                    <td colspan="5" align="left">${finishRedress.remark}</td>
                </tr>
            </table>
            </div>
    

    <div class="easyui-panel" id="p3" title="流程信息"  style="width:100%;padding:5px;margin-bottom: 10px;">
            <table width="100%" class="grid" style="text-align: center;">
                <tr>
                   <th width="15%" style="text-align: center;" >操作人</th>
                   <th width="15%" style="text-align: center;" >操作时间</th>
                   <th width="15%" style="text-align: center;" >操作环节</th>
                   <th width="15%" style="text-align: center;" >意见</th>
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr>
                  	<td>${processDetail.createrCnName }</td>
                   <td><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                   <td>${processDetail.auditName }</td>
                   <td>${processDetail.opinion }</td>
                 
                </tr>
                 </c:forEach>

            </table>
    </div>
</form>
 <script>
 $('#qmjdb').click(function (){
	 var id=$("#id").val();
	 var url="${ctx}/endcorrect/finishRedress/qmjdb?finishRedressId="+id;
	 $('#finishRedressQmjdb').dialog({    
		    title: '社区服刑人员矫正期满鉴定表',    
		    width: 900,
		    height: 650,
		    href: url,
	        iconCls:'fi-print icon-blue',
	        resizable : true,
	        maximizable:true, 
		    modal: true,
	        resizable : true,
		    buttons :[{
	            text : '打印社区服刑人员矫正期满鉴定表',
	            iconCls:'fi-print icon-blue',
	            handler : function() {
	                $('#qmjdbPrint').click();
	            }
	        },{
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#finishRedressQmjdb').dialog('close');
				}
			}]
		});
		$('#finishRedressQmjdb').window('center');
 });
 
 $('#jcjzzms').click(function (){
	 var id=$("#id").val();
	 var url="${ctx}/endcorrect/finishRedress/jcjzzms?finishRedressId="+id;
	$('#finishRedressJcjzzms').dialog({    
	    title: '解除社区矫正证明书',    
	    top: 100,
	    width: 850,
	    height: 600,
	    href: url,
        iconCls:'fi-print icon-blue',
        resizable : true,
        maximizable:true, 
	    modal: true,
        resizable : true,
	    buttons :[{
            text : '打印解除社区矫正证明书',
            iconCls:'fi-print icon-blue',
            handler : function() {
                $('#jcjzzmsPrint').click();
            }
        },{
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#finishRedressJcjzzms').dialog('close');
			}
		}]
	});
	$('#finishRedressJcjzzms').window('center');
 });
 
 $('#jcsqjzxgs').click(function (){
	 var id=$("#id").val();
	 var url="${ctx}/endcorrect/finishRedress/jcsqjzxgs?finishRedressId="+id;
		$('#finishRedressJcsqjzxgs').dialog({    
		    title: '解除社区矫正宣告书',    
		    width: 800,
		    height: 650,
		    href: url,
	        iconCls:'fi-print icon-blue',
		    modal: true,
	        resizable : true,
		    buttons :[{
	            text : '打印解除社区矫正宣告书',
	            iconCls:'fi-print icon-blue',
	            handler : function() {
	                $('#jcsqjzxgsPrint').click();
	            }
	        },{
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#finishRedressJcsqjzxgs').dialog('close');
				}
			}]
		});
		$('#finishRedressJcsqjzxgs').window('center');
	 
 });
 
 $('#jztzs').click(function (){
	 var id=$("#id").val();
	 var url="${ctx}/endcorrect/finishRedress/jztzs?finishRedressId="+id;
	 var content = '<iframe src="' + url + '" width="100%" height="900" frameborder="0" scrolling="no"></iframe>';
		$('#finishRedressJztzs').dialog({    
		    title: '解除社区矫正通知书',    
		    width: 1150,
		    height: 600,
		    content: content,
	        iconCls:'fi-print icon-blue',
		    modal: true,
	        resizable : true,
		    buttons :[{
	            text : '打印解除社区矫正宣告书',
	            iconCls:'fi-print icon-blue',
	            handler : function() {
	                $('#jztzsPrint').click();
	            }
	        },{
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#finishRedressJztzs').dialog('close');
				}
			}]
		});
		$('#finishRedressJztzs').window('center');
	 
 });
</script>
</body>

</html>
