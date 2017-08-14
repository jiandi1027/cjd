<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>漏罪</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>

<body>
 <form  action="${ctx}/endcorrect/omittedCrime/save" method="post" id="culpritInfo">
     <c:choose>
 		<c:when test="${empty omittedCrime.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${omittedCrime.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="涉嫌重新犯罪" style="width:100%;padding:10px;">
            <table width="100%">
                <tr>
                   <td><span class="c-red">*</span>强制措施类型:</td>
							<td><select　id="coerciveMeasureKey" name="coerciveMeasureKey" class="easyui-combobox" required=true missingMessage="强制措施类型不能为空!" style="width:150px;">
							 <option value=""></option>
                    	<c:forEach items="${fns:getSysDicList('SF_RECIDIVISM_PERHAPS','COERCIVE_MEASURE_KEY','96100') }" var="sysDic">
                    		<option value="${sysDic.key }">${sysDic.value}</option>
                    	</c:forEach>
                    </select></td>
					<td><span class="c-red">*</span>强制措施时间:</td>
							<td><input type="text" name="coerciveMeasureDate" required=true missingMessage="强制措施时间不能为空!"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
							<td>法律文书:</td>
							<td></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>涉嫌罪名:</td>
							<td><input type="text" name="newCrime" required=true missingMessage="涉嫌罪名不能为空!"
								class="f1 easyui-textbox" /></td>
							<td><span class="c-red">*</span>立案单位:</td>
							<td><input type="text" name="registerUnit" required=true missingMessage="立案单位不能为空!"
								class="f1 easyui-textbox" /></td>
					<td><span class="c-red">*</span>立案时间:</td>
							<td><input type="text" name="registerTime" required=true missingMessage="立案时间不能为空!"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>掌握信息方式:</td>
							<td><select　id="dicGraspTypeKey" name="dicGraspTypeKey" class="easyui-combobox" required=true missingMessage="掌握信息方式不能为空!" style="width:150px;">
							 <option value=""></option>
                    	<c:forEach items="${fns:getSysDicList('SF_RECIDIVISM_PERHAPS','DIC_GRASP_TYPE_KEY','96200') }" var="sysDic">
                    		<option value="${sysDic.key }">${sysDic.value}</option>
                    	</c:forEach>
                    </select></td>
							<td><span class="c-red">*</span>掌握信息时间:</td>
							<td><input type="text" name="graspTime" required=true missingMessage="掌握信息时间不能为空!"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
					<td></td><td></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>漏罪情况:</td>
                    <td colspan="5" align="left"><textarea rows="3" cols="124" id="crimeDetails" name="crimeDetails" style="height:50px;"required=true missingMessage="漏罪情况不能为空!"
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
