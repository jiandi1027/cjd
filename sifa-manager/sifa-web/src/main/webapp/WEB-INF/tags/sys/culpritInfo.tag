<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true"%>
<%@ attribute name="name" type="java.lang.String" required="true"%>
<%@ attribute name="hiddenId" type="java.lang.String" required="true"%>
<%@ attribute name="hiddenName" type="java.lang.String" required="true"%>
<%@ attribute name="formId" type="java.lang.String" required="true"%>
<%@ attribute name="hiddenValue" type="java.lang.String" required="true"%>
<%@ attribute name="required" type="java.lang.Boolean" required="false"%>
<%@ attribute name="isSelect" type="java.lang.Boolean" required="true"%>
<div class="easyui-panel" title="矫正对象基本信息" style="width:100%;padding:10px;">
     		
            <table width="100%">
                <tr>
                	
                    <td width="10%"><c:if test="${required}"><span class="c-red">*</span></c:if>姓名:</td>
                    <td colspan="5">
                    <input type="hidden" name="${hiddenName}" id="${hiddenId}" value="${hiddenValue}"/>
                   
                    <input name="${id}" id="${name}" value=""     <c:if test="${!isSelect }">readonly="readonly"</c:if>     <c:choose><c:when test="${isSelect }">class='easyui-combogrid'</c:when><c:otherwise>class='easyui-textbox'</c:otherwise></c:choose>
 <c:if test="${required}">required=true missingMessage="姓名不能为空!"</c:if> /></td>
                </tr>
                <tr>
                    <td width="10%">性别:</td>
                    <td><input name="dicSexKey" id="dicSexKey" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td width="10%">民族:</td>
                    <td><input name="nation" id="nation" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td width="10%">身份证号:</td>
                    <td><input name="identification" id="identification" class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
                <tr>
                    <td width="10%">曾用名:</td>
                    <td><input name="alias" id="alias" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td width="10%">出生日期:</td>
                    <td><input name="birthday" id="birthday" class="f1 easyui-textbox"  readonly="readonly"></input></td>
                     <td width="10%">文化程度:</td>
                    <td><input name="dicWhcdKey" id="dicWhcdKey" class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
                
                 <tr>
                    <td>婚姻状况:</td>
                    <td><input name="dicHyzkKey" id="dicHyzkKey" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>职业:</td>
                    <td><input name="job" id="culpritJob" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>原政治面貌:</td>
                    <td><input name="dicYzzmmKey" id="dicYzzmmKey" class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
                 <tr>
                    <td>籍贯:</td>
                    <td><input name="origin" id="origin" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>户籍所在地:</td>
                    <td><input name="regResidenceStreet" id="regResidenceStreet" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>现居住地:</td>
                    <td><input name="addressDetail" id="addressDetail"  class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
                 <tr>
                    <td>原判罪名:</td>
                    <td><input name="crimeInfo" id="crimeInfo"  class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>刑期:</td>
                    <td><input name="adjudgePeriod" id="adjudgePeriod" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>附加刑:</td>
                    <td><input name="accessoryPunishment" id="accessoryPunishment" class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
                 <tr>
                    <td>刑期变动:</td>
                    <td><input name="adjudgeChange" id="adjudgeChange" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>刑期开始时间:</td>
                    <td><input name="adjudgeStartTime" id="adjudgeStartTime" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>刑期结束时间:</td>
                    <td><input name="adjudgeEndTime" id="adjudgeEndTime" class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
                <tr>
                    <td>刑法执行类别:</td>
                    <td><input name="dicPenalTypeKey" id="dicPenalTypeKey" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>矫正开始时间:</td>
                    <td><input name="redressStartDate" id="redressStartDate" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>矫正结束时间:</td>
                    <td><input name="redressEndDate" id="redressEndDate" class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
               
            </table>
           
           
    </div>
<script type="text/javascript">
	$(document).ready(function() {
			if($('#${hiddenId}').val()!=null && $('#${hiddenId}').val()!=''&&$('#${hiddenId}').val()!='null'){
				loadCulpritInfo($('#${hiddenId}').val());
			}
			
			
			<c:if test="${isSelect }">
		  $('#${id}').combogrid({    
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
					{field:'dicSexKey',title:'性别',width:80,align:'center',formatter:function(value,rowData,rowIndex){  
					    //可以试试这个对不对  
					    //return value.name;  
					    return sy.getDicValue('common_table','sex',rowData.dicSexKey,'');
					     
					}}
				]],
				fitColumns: true,
				pagination: true,           //是否分页  
	        rownumbers: true,           //序号  
	        collapsible: false,         //是否可折叠的  
	        method: 'post',
	        onSelect:function(record){
	        	 var arr = $('#${id}').combogrid('grid').datagrid('getSelections');
	        	 var id= $('input[name="id"]').val();
	        	 
	        	 $('#${formId}').form('load',arr[0]);
	        	 
	        	 $('input[name="id"]').val(id);
	        	 $('input[name="${hiddenName}"]').val(arr[0].id); 
	        	 $('input[name="${name}"]').val(arr[0].name); 
	        	 $('#culpritJob').textbox("setValue",arr[0].job);
	        	 $('#job').textbox("setValue",'');
	        	 if(arr[0].dicYzzmmKey!=""){
	        		 $("#dicYzzmmKey").textbox("setValue", sy.getDicValue('common_table','zzmm',arr[0].dicYzzmmKey,''));
	        	 }
	        	 
	        	
	        	 $("#dicWhcdKey").textbox("setValue", sy.getDicValue('common_table','whcd',arr[0].dicWhcdKey,''));
	        	 $("#dicSexKey").textbox("setValue", sy.getDicValue('common_table','sex',arr[0].dicSexKey,''));
	        	 $("#dicHyzkKey").textbox("setValue", sy.getDicValue('common_table','hyzk',arr[0].dicHyzkKey,''));
	        	 if(arr[0].culpritJudgment!=null){
	        		 //$("#txtrName").textbox("setValue", "xxx");
	        		 //sy.getDicValue
	        		 
	        		
	        		 $("#crimeInfo").textbox("setValue", arr[0].culpritJudgment.crimeInfo);
		        	 $("#adjudgePeriod").textbox("setValue", arr[0].culpritJudgment.adjudgePeriod);
		        	 $("#accessoryPunishment").textbox("setValue",arr[0].culpritJudgment.accessoryPunishment);
		        	 $("#adjudgeChange").textbox("setValue", arr[0].culpritJudgment.adjudgeChange);
		        	 $("#adjudgeStartTime").textbox("setValue", arr[0].culpritJudgment.adjudgeStartTime);
		        	 $("#adjudgeEndTime").textbox("setValue",arr[0].culpritJudgment.adjudgeEndTime);
		        	 //$("#dicPenalTypeKey").textbox("setValue", sy.getDicValue('common_table','hyzk',arr[0].culpritJudgment.dicPenalTypeKey,''));
		        	 
	        	 }
	        	
	       	}
	        }); 
	        
	        
	      //取得分页组件对象  
	        var pager = $('#${id}').combogrid('grid').datagrid('getPager');  
	        if (pager) {  
	            $(pager).pagination({  
	                pageSize: 10,               //每页显示的记录条数，默认为10  
	                beforePageText: '第',       //页数文本框前显示的汉字  
	                afterPageText: '',
	                displayMsg: ''
	            });  
	        }  
	        </c:if>
	       
	});
	
	function loadCulpritInfo(id){
		$.ajax({
			type : 'get',
			url : '${ctx}/culpritinfo/culprit/findById?id=' + id,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			success : function(result) {
				 var id= $('input[name="id"]').val();
				 
				// $('#${formId}').form('load',result);
				 
				 $('input[name="id"]').val(id);
				 
				 $("#${id}").textbox("setValue",result.name);
				 if(result.dicYzzmmKey!=""){
	        		 $("#dicYzzmmKey").textbox("setValue", sy.getDicValue('common_table','zzmm',result.dicYzzmmKey,''));
	        	 }
	        	 
	        	
	        	 $("#dicWhcdKey").textbox("setValue", sy.getDicValue('common_table','whcd',result.dicWhcdKey,''));
	        	 $("#dicSexKey").textbox("setValue", sy.getDicValue('common_table','sex',result.dicSexKey,''));
	        	 $("#dicHyzkKey").textbox("setValue", sy.getDicValue('common_table','hyzk',result.dicHyzkKey,''));
	        	 if(result.culpritJudgment!=null){
	        		 //$("#txtrName").textbox("setValue", "xxx");
	        		 //sy.getDicValue
	        		 
	        		
	        		 $("#crimeInfo").textbox("setValue", result.culpritJudgment.crimeInfo);
		        	 $("#adjudgePeriod").textbox("setValue", result.culpritJudgment.adjudgePeriod);
		        	 $("#accessoryPunishment").textbox("setValue",result.culpritJudgment.accessoryPunishment);
		        	 $("#adjudgeChange").textbox("setValue", result.culpritJudgment.adjudgeChange);
		        	 $("#adjudgeStartTime").textbox("setValue", result.culpritJudgment.adjudgeStartTime);
		        	 $("#adjudgeEndTime").textbox("setValue",result.culpritJudgment.adjudgeEndTime);
		        	 //$("#dicPenalTypeKey").textbox("setValue", sy.getDicValue('common_table','hyzk',arr[0].culpritJudgment.dicPenalTypeKey,''));
		        	 
	        	 }
				
				
			}
		});
	}
</script>