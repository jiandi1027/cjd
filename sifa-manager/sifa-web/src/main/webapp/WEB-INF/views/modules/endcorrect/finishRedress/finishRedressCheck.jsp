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
 <form  action="${ctx}/endcorrect/finishRedress/check" method="post" id="culpritInfo">
	<c:choose>
 		<c:when test="${empty finishRedress.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${finishRedress.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="期满解矫信息" style="width:100%;padding:10px;">
     		<input type="hidden" name="id" value="${finishRedress.id}"/>
            <table width="100%">
                <tr>
                   <td>矫正期间表现:</td>
							<td>${fns:getSysDicValueByKey('SF_FINISH_REDRESS','DIC_REDRESS_SHOW_KEY',finishRedress.dicRedressShowKey,'')}</td>
					<td>认罪态度:</td>
							<td>${fns:getSysDicValueByKey('SF_FINISH_REDRESS','DIC_PLEA_ATTITUDE_KEY',finishRedress.dicPleaAttitudeKey,'')}</td>
							<td>是否三无人员:</td>
							<td><c:if test="${finishRedress.dicSThreeNonKey==1}">是</c:if>  　<c:if test="${finishRedress.dicSThreeNonKey==0}">否</c:if> </td>
                </tr>
                <tr>
							<td>是否参加职业技能培训:</td>
							<td> <c:if test="${finishRedress.dicIsTrainKey==1}">是</c:if>  　<c:if test="${finishRedress.dicIsTrainKey==0}">否</c:if></td>
					<td>是否获得技能证书:</td>
							<td><c:if test="${finishRedress.dicSkillsCertificateKey==1}">是</c:if>  　<c:if test="${finishRedress.dicSkillsCertificateKey==0}">否</c:if> </td>
							<td>技术特长及等级:</td>
							<td>${finishRedress.skillInfo}</td>
                </tr>
				<tr>
                   <td>危险性评估:</td>
							<td>${fns:getSysDicValueByKey('SF_FINISH_REDRESS','RISK_ID',finishRedress.riskId,'')}</td>
					<td>家庭联系情况:</td>
							<td>${fns:getSysDicValueByKey('SF_FINISH_REDRESS','FAMILY_CONTACT_ID',finishRedress.familyContactId,'')}</td>
							<td></td>
							<td></td>
                </tr>
                <tr>
                    <td>特殊情况备注:</td>
                    <td colspan="5" align="left">${finishRedress.remark}</td>
                </tr>
            </table>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>

   <TBODY>
   <c:if test="${finishRedress.auditType ne 'workerPrint'}">
   <TR>
   			
				<TD height=30 width="15%" align=right >审核结果：</TD>
								<TD  width="35%">
								<input type="radio" name="dicDecideType" value="1" checked="checked"/>同意
								<c:if test="${finishRedress.auditType ne 'xfgCheck'}">
								<input type="radio" name="dicDecideType" value="2" />退回
								</c:if>
								</TD>
								<TD height=30 width="15%" align=right >审核意见</TD>
								<TD  width="35%">
								<textarea rows="3" cols="30" name="opinion" required=true missingMessage="审核意见不能为空!"></textarea>
								</TD>
				</TR>
				</c:if>
				<tr>
							  <td colspan=4 align=center class=category>
								<a id="btn1"  class="easyui-linkbutton"   iconCls="icon-save" href="javascript:void(0)" >提交</a>
							  </td>
							</tr>
   </TBODY>
</TABLE>
    </div>
    </form>
    <script>
        function clearForm(){
            $('#culpritInfo').form('clear');
        }
        $(function() {
        	$('#btn1').click(function(){
        		//alert($('dicDecideType'));
        		$('#culpritInfo').submit();
        	});	
        
        $('#culpritId').combogrid({    
        	delay: 500,
        	 panelWidth: 300, 
        	 striped:true,
        	 panelHeight: 300,
    		mode: 'remote',  
			idField: 'id',
			textField: 'name',
			url: '${ctx}/culpritinfo/culprit/list',
			columns: [[
				{field:'name',title:'姓名',width:120,align:'center'},
				{field:'dicSexKey',title:'性别',width:80,align:'center'}
			]],
			fitColumns: true,
			pagination: true,           //是否分页  
        rownumbers: true,           //序号  
        collapsible: false,         //是否可折叠的  
        method: 'post',
        onSelect:function(record){
        	 var arr = $('#culpritId').combogrid('grid').datagrid('getSelections');
        	 $('#culpritInfo').form('load',arr[0]);
       	}
        }); 
        
        
      //取得分页组件对象  
        var pager = $('#culpritId').combogrid('grid').datagrid('getPager');  
        if (pager) {  
            $(pager).pagination({  
                pageSize: 10,               //每页显示的记录条数，默认为10  
                beforePageText: '第',       //页数文本框前显示的汉字  
                afterPageText: '',
                displayMsg: ''
            });  
        }  
        });
        
	
    </script>
</body>
</html>
