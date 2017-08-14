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
<div class="easyui-panel" title="矫正对象基本信息" style="width:100%;padding:5px;margin:0 auto;">
     		
            <table width="100%" class="grid">
                <tr>
                	
                    <th width="10%" align="right"><c:if test="${required}"><span class="c-red">*</span></c:if>矫正对象：</th>
                    <td width="23%">
                    <input type="hidden" name="${hiddenName}" id="${hiddenId}" value="${hiddenValue}"/>
                    <c:choose>
                    	<c:when test="${isSelect}">
                    		<input name="${id}" id="${name}" value=""     <c:choose><c:when test="${isSelect }"></c:when><c:otherwise>class='easyui-textbox'</c:otherwise></c:choose>
 <c:if test="${required}">required=true missingMessage="矫正对象不能为空!"</c:if> />
                    	</c:when>
                    	<c:otherwise>
                    		<span id="culprit_info_${name}"></span>
                    	</c:otherwise>
                    </c:choose>
                    </td>
                     <th width="10%">性别：</th>
                    <td id="dicSexKey" width="23%"></td>
                     <th width="10%">民族：</th>
                    <td id="nation" width="23%"></td>
                </tr>
                <tr>
                   
                     <th width="10%">身份证号：</th>
                    <td id="identification" ></td>
                     <th width="10%">曾用名：</th>
                    <td id="alias"></td>
                     <th width="10%">出生日期：</th>
                    <td id="birthday"></td>
                </tr>
                <tr>
                     <th width="10%">文化程度：</th>
                    <td id="dicWhcdKey"></td>
                     <th>婚姻状况：</th>
                    <td id="dicHyzkKey"></td>
                     <th>职业：</th>
                    <td id="culpritJob"></td>
                </tr>
                
                 <tr>
                    <th>籍贯：</th>
                    <td id="origin"></td>
                     <th>原政治面貌：</th>
                    <td id="dicYzzmmKey"></td>
                     <th>户籍所在地：</th>
                    <td id="regResidence"></td>
                </tr>
                 <tr>
                     <th>现居住地：</th>
                    <td id="address" colspan="5"></td>
                </tr>
                 <tr>
                    <th>原判罪名：</th>
                    <td id="crimeInfo"></td>
                     <th>刑期：</th>
                    <td id="adjudgePeriod"></td>
                     <th>附加刑：</th>
                    <td id="accessoryPunishment"></td>
                </tr>
                 <tr>
                    <th>刑期变动：</th>
                    <td id="adjudgeChange"></td>
                     <th>刑期开始时间：</th>
                    <td id="adjudgeStartTime"></td>
                     <th>刑期结束时间：</th>
                    <td id="adjudgeEndTime"></td>
                </tr>
                <tr>
                    <th>刑法执行类别：</th>
                    <td id="dicPenalTypeKey"></td>
                     <th>矫正开始时间：</th>
                    <td id="redressStartDate"></td>
                     <th>矫正结束时间：</th>
                    <td id="redressEndDate"></td>
                </tr>
               
            </table>
           
           
    </div>
<script type="text/javascript">
	var isSelect = ${isSelect };
	if($('#${hiddenId}').val()!=null && $('#${hiddenId}').val()!=''&&$('#${hiddenId}').val()!='null'){
		loadCulpritInfo($('#${hiddenId}').val());
	}
	
	$(document).ready(function() {
			
			
			if(isSelect){
				
				  $('#${id}').combogrid({    
			        	delay: 500,
			        	 panelWidth: 170, 
			        	 striped:true,
			        	 panelHeight: 350,
			    		mode: 'remote',  
						idField: 'id',
						textField: 'name',
						url: '${ctx}/culpritinfo/culprit/selectList?dicStatusKey=13001',
						columns: [[
							{field:'name',title:'矫正对象',width:120,align:'center'}
							
						]],
						fitColumns: true,
						pagination: true,           //是否分页  
			        rownumbers: false,           //序号  
			        collapsible: false,         //是否可折叠的  
			        method: 'post',
			        query: function(q) { 
			        //动态搜索 
			        $('#${id}').combogrid("grid").datagrid("reload", { 'keyword': q }); 
			        $('#${id}').combogrid("setValue", q); 
			        } ,
			        onSelect:function(record){
			        	 var arr = $('#${id}').combogrid('grid').datagrid('getSelections');
			        	// var id= $('input[name="id"]').val();
			        	 
			        	 //$('#${formId}').form('load',arr[0]);
			        	 
			        	// $('input[name="id"]').val(id);
			        	 fillValue(arr[0]);
			        	
			       	}
			        }); 
			        
			        
			      //取得分页组件对象  
			      var pager = $('#${id}').combogrid('grid').datagrid('getPager');  
			      
			        if (pager) {  
			            $(pager).pagination({
			            	layout:['first','prev','next','last'],
			            	displayMsg:''
			            }); 
			        }  
			       
			}
			
	
	       
	});
	
	function loadCulpritInfo(id){
		$.ajax({
			type : 'get',
			url : '${ctx}/culpritinfo/culprit/findById?id=' + id,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			success : function(result) {
				fillValue(result);
				
			}
		});
	}
	
	function fillValue(result){
		
		 $('input[name="${hiddenName}"]').val(result.id); 
		 
	
		 if(isSelect){
			 $('input[name="${name}"]').val(result.name); 
		 }else{
			 
			 $('#culprit_info_${name}').html(result.name); 
		 }
    	 
    	 $('#culpritJob').html(result.job);
    	
    	 /* if(typeof(result.dicYzzmmKey) != 'undefined'&&result.dicYzzmmKey!=""){
    		 $("#dicYzzmmKey").textbox("setValue", sy.getDicValue('common_table','zzmm',result.dicYzzmmKey,''));
    	 } */
    	 $("#dicYzzmmKey").html(sy.getDicValue('common_table','zzmm',result.dicYzzmmKey,''));
    	 //$("#dicYzzmmKey").html(result.dicYzzmmKey);
    	 $("#nation").html(sy.getDicValue('common_table','nation',result.nation,''));
    	 $("#identification").html(result.identification);
    	 $("#alias").html(result.alias);
    	 $("#birthday").html(result.birthday);
    	 $("#culpritJob").html(result.culpritJob);
    	 $("#origin").html(result.origin);
    	 $("#regResidence").html(result.regResidence);
    	 $("#address").html(result.address);
    	 $("#dicPenalTypeKey").html(sy.getDicValue('sf_investigate','entrust_type_id',result.dicPenalTypeKey,''));
    	 
    	 $("#dicWhcdKey").html(sy.getDicValue('common_table','whcd',result.dicWhcdKey,''));
    	 $("#dicSexKey").html(sy.getDicValue('common_table','sex',result.dicSexKey,''));
    	 $("#dicHyzkKey").html(sy.getDicValue('common_table','hyzk',result.dicHyzkKey,''));

    	 if(result.culpritJudgment!=null){
    		 //$("#txtrName").textbox("setValue", "xxx");
    		 //sy.getDicValue
    		 
    		
    		 $("#crimeInfo").html(result.culpritJudgment.crimeInfo);
        	 $("#adjudgePeriod").html(result.culpritJudgment.adjudgePeriod);
        	 if( result.culpritJudgment.accessoryPunishment!=null &&  result.culpritJudgment.accessoryPunishment!='null'){
        		 var punishmentStr = result.culpritJudgment.accessoryPunishment.split(",");
            	 var accessoryPunishmentStr = "";
            	 for(var i=0; i<punishmentStr.length;i++){
            		 accessoryPunishmentStr = accessoryPunishmentStr + sy.getDicValue('sf_culprit','accessoryPunishment',punishmentStr[i],'');
            	 }
            	 $("#accessoryPunishment").html(accessoryPunishmentStr);
        	 }
        	
        	 
        	 $("#adjudgeChange").html(result.culpritJudgment.adjudgeChange);
        	 $("#adjudgeStartTime").html(result.culpritJudgment.adjudgeStartTime);
        	 $("#adjudgeEndTime").html(result.culpritJudgment.adjudgeEndTime);
        	 $("#redressStartDate").html(result.culpritJudgment.redressStartDate);
        	 $("#redressEndDate").html(result.culpritJudgment.redressEndDate);
        	 //$("#dicPenalTypeKey").textbox("setValue", sy.getDicValue('common_table','hyzk',result.culpritJudgment.dicPenalTypeKey,''));
        	 
    	 }
	}
</script>