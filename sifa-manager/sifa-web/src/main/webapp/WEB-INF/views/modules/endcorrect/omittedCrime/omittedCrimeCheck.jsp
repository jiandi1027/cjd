<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>漏罪</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>
 <form  action="${ctx}/endcorrect/omittedCrime/check" method="post" id="culpritInfo">
	<c:choose>
 		<c:when test="${empty omittedCrime.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${omittedCrime.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="漏罪信息" style="width:100%;padding:10px;">
     		<input type="hidden" name="id" value="${omittedCrime.id}"/>
            <table width="100%">
                <tr>
                   <td>强制措施类型:</td>
							<td>${fns:getSysDicValueByKey('SF_RECIDIVISM_PERHAPS','COERCIVE_MEASURE_KEY',omittedCrime.coerciveMeasureKey,'')}</td>
					<td>强制措施时间:</td>
							<td><fmt:formatDate value="${omittedCrime.coerciveMeasureDate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>法律文书:</td>
							<td></td>
                </tr>
                <tr>
                    <td>涉嫌罪名:</td>
							<td>${omittedCrime.newCrime}</td>
							<td><span class="c-red">*</span>立案单位:</td>
							<td>${omittedCrime.registerUnit}</td>
					<td>立案时间:</td>
							<td><fmt:formatDate value="${omittedCrime.registerTime}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
                <tr>
                    <td>掌握信息方式:</td>
							<td>${fns:getSysDicValueByKey('SF_RECIDIVISM_PERHAPS','DIC_GRASP_TYPE_KEY',omittedCrime.dicGraspTypeKey,'')}</td>
							<td><span class="c-red">*</span>掌握信息时间:</td>
							<td><fmt:formatDate value="${omittedCrime.graspTime}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td></td><td></td>
                </tr>
                <tr>
                    <td>漏罪情况:</td>
                    <td colspan="5" align="left">${omittedCrime.crimeDetails}</td>
                </tr>
            </table>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed>

   <TBODY>
   <c:if test="${omittedCrime.auditType ne 'workerPrint' and omittedCrime.auditType ne 'workerReport'}">
   <TR>
   			
				<TD height=30 width="15%" align=right >审核结果：</TD>
								<TD  width="35%">
								<input type="radio" name="dicDecideType" value="1" checked="checked"/>同意
								<input type="radio" name="dicDecideType" value="0"/>不同意
								<input type="radio" name="dicDecideType" value="2" />退回
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
