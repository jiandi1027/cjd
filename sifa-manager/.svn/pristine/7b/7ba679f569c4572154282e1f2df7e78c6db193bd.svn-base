<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>期满解矫</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>

<body>
 <form  action="${ctx}/endcorrect/finishRedress/save" method="post" id="culpritInfo">
     <c:choose>
 		<c:when test="${empty finishRedress.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${finishRedress.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="期满解矫" style="width:100%;padding:10px;">
            <table width="100%">
                <tr>
                   <td><span class="c-red">*</span>矫正期间表现:</td>
							<td>
							<select　id="dicRedressShowKey" name="dicRedressShowKey" class="easyui-combobox" required=true missingMessage="矫正期间表现不能为空!" style="width:150px;">
							 <option value=""></option>
                    	<c:forEach items="${fns:getSysDicList('SF_FINISH_REDRESS','DIC_REDRESS_SHOW_KEY','126000') }" var="sysDic">
                    		<option value="${sysDic.key }">${sysDic.value}</option>
                    	</c:forEach>
                    </select></td>
					<td><span class="c-red">*</span>认罪态度:</td>
							<td><select　id="dicPleaAttitudeKey" name="dicPleaAttitudeKey" class="easyui-combobox" required=true missingMessage="认罪态度不能为空!" style="width:150px;">
							 <option value=""></option>
                    	<c:forEach items="${fns:getSysDicList('SF_FINISH_REDRESS','DIC_PLEA_ATTITUDE_KEY','127000') }" var="sysDic">
                    		<option value="${sysDic.key }">${sysDic.value}</option>
                    	</c:forEach>
                    </select></td>
							<td>是否三无人员:</td>
							<td> <input name="dicSThreeNonKey" type="radio" value="1"/>是　 <input name="dicSThreeNonKey" type="radio" value="0"/>否</td>
                </tr>
                <tr>
							<td>是否参加职业技能培训:</td>
							<td> <input name="dicIsTrainKey" type="radio" value="1"/>是　 <input name="dicIsTrainKey" type="radio" value="0"/>否</td>
					<td>是否获得技能证书:</td>
							<td> <input name="dicSkillsCertificateKey" type="radio" value="1"/>是　 <input name="dicSkillsCertificateKey" type="radio" value="0"/>否</td>
							<td>技术特长及等级:</td>
							<td><input type="text" name="skillInfo" id="skillInfo" class="f1 easyui-textbox" /></td>
                </tr>
                <tr>
                   <td><span class="c-red">*</span>危险性评估:</td>
							<td>
							<select　id="riskId" name="riskId" class="easyui-combobox" required=true missingMessage="危险性评估不能为空!" style="width:150px;">
							 <option value=""></option>
                    	<c:forEach items="${fns:getSysDicList('SF_FINISH_REDRESS','RISK_ID','128000') }" var="sysDic">
                    		<option value="${sysDic.key }">${sysDic.value}</option>
                    	</c:forEach>
                    </select></td>
					<td><span class="c-red">*</span>家庭联系情况:</td>
							<td><select　id="familyContactId" name="familyContactId" class="easyui-combobox" required=true missingMessage="家庭联系情况不能为空!" style="width:150px;">
							 <option value=""></option>
                    	<c:forEach items="${fns:getSysDicList('SF_FINISH_REDRESS','FAMILY_CONTACT_ID','129000') }" var="sysDic">
                    		<option value="${sysDic.key }">${sysDic.value}</option>
                    	</c:forEach>
                    </select></td>
							<td></td>
							<td> </td>
                </tr>

                <tr>
                    <td><span class="c-red">*</span>特殊情况备注:</td>
                    <td colspan="5" align="left"><textarea rows="3" cols="124" id="remark" name="remark" style="height:50px;"required=true missingMessage="特殊情况备注不能为空!"
								class="f1 easyui-textbox"></textarea></td>
                </tr>
                <tr>
                <td align="center" colspan="5">
                	<a id="btn1" href="javascript:void(0)" class="easyui-linkbutton" >提交</a>
	    			<a href="javascript:void(0)" class="easyui-linkbutton" >重置</a>
                </td>
                </tr>
            </table>
    </div>
    </form>
    <script>
        function clearForm(){
            $('#culpritInfo').form('clear');
        }
        $(function() {
        	$('#btn1').click(function(){
        		
        		if($('#culpritInfo').form('validate')==true){
        			$('#culpritInfo').submit();
        		}
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
