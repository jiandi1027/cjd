<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
 <form  action="${ctx}/dailymgr/specialArea/save" method="post" id="specialAreaInfo">
 	<input type="hidden" name="id" id="id" value="${specialArea.id}"/>
 	<c:choose>
 		<c:when test="${empty specialArea.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${specialArea.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 	<input type="hidden"  id="roleId" value="${sysAccount.roleId}"/>
    <div class="easyui-panel" title="申请相关信息" style="width:100%;padding:5px;magin:0 auto;">
            <table width="100%" class="grid">
                <tr>
                   <th width="10%"><span class="c-red">*</span>申请提交时间：</th>
				   <td width="23%"><input type="text" name="applyDate" id="applyDate" value="<fmt:formatDate value="${specialArea.applyDate}"
									pattern="yyyy-MM-dd" />" required=true missingMessage="提交时间不能为空!" editable=false
								class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"/></td>
					<th width="10%"><span class="c-red">*</span>申请进入时间：</th>
				   <td  width="23%"><input type="text" name="startDate" id="startDate" value="<fmt:formatDate value="${specialArea.startDate}"
									pattern="yyyy-MM-dd" />" required=true missingMessage="进入时间不能为空!" editable=false
								class="Wdate easyui-validatebox" onfocus="var endDate=$dp.$('endDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){endDate.focus();},maxDate:'#F{$dp.$D(\'endDate\')}'})"/></td>
				<th width="10%"><span class="c-red">*</span>申请离开时间：</th>
				   <td width="23%"><input type="text" name="endDate" id="endDate" value="<fmt:formatDate value="${specialArea.endDate}"
									pattern="yyyy-MM-dd" />" required=true missingMessage="离开时间不能为空!" editable=false
								class="Wdate easyui-validatebox" onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startDate\')}'})"/></td>
              
                </tr>
                <tr>
                    <th><span class="c-red">*</span>申请进入区域：</th>
					<td colspan="5">
					<input name="areaProId" id="areaProId" value="${areaProId }" class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'areaName',limitToList:true,url:'${ctx}/dailymgr/specialArea/findAreaByLevel?areaLevel=1',panelHeight:'200',editable:false" style="width:100px;"></input>省
                    	<input id="areaCityId" name="areaCityId" value="${areaCityId }" class="easyui-combobox" required=true style="width:100px;" >市
                    	<input id="areaCountryId" name="areaCountryId" value="${areaCountryId }" class="easyui-combobox" required=true style="width:100px;">县（区）
                    	<input id="areaStreet" name="areaStreet" value="${areaStreet }" class="f1 easyui-textbox" required=true >乡镇（街道）
					</td>
                </tr>
                <tr>
                    <th><span class="c-red">*</span>申请原因：</th>
					<td colspan="5">
						<textarea  name="reason" id="specialArea_reason" class="easyui-validatebox"  multiline="true" required=true missingMessage="申请原因不能为空!" 
						onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)' onMouseOut="textarealength(this,200)"
							style="width:80%;height:80px;overflow:hidden;" maxlength=200>${specialArea.reason }</textarea>
						<br/>
						<p class="textarea-numberbar">
							备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">${fn:length(specialArea.reason )}</em>个字。
						</p>
					</td>
                </tr>
                 <tr rowspan="5">
                    <th>备注：</th>
					<td colspan="5">
						<textarea  name="note"  class="f1 easyui-validatebox"  multiline="true" 
							onkeydown='textarealength(this,100)' onkeyup='textarealength(this,100)'  onMouseOut="textarealength(this,100)"
							style="width:80%;height:80px;overflow:hidden;" maxlength=100>${specialArea.note }</textarea>
						<br/>
						<p class="textarea-numberbar">
							备注：此处最多可以输入<em class="c-red">100</em>个字，你已输入<em class="textarea-length c-red">${fn:length(specialArea.note  )}</em>个字。
						</p>
					</td>
                </tr>
                
            </table>
    </div>
</form>
<script>
   
$(function() {
	$('#specialAreaInfo').form({
		url:'${ctx}/dailymgr/specialArea/save',
		onSubmit:function(){
			 progressLoad();
			 var isValid = $(this).form('validate');
             if (!isValid) {
                 progressClose();
             }
             return isValid;
		},
		success:function(data){
			progressClose();
			data = JSON.parse(data);
			if(data.status==200){
				$.messager.show({
					title:'提示信息!' ,
					msg:data.msg
				});
				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                 parent.$.modalDialog.handler.dialog('close');
				
			}else{
				 parent.$.messager.alert('错误', result.msg, 'error');
			}
			
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
	 
	     /*选择市*/
	        $('#areaProId').combobox({
	        	onSelect: function(record){
	        		$('#areaCityId').combobox({    
	        			url:'${ctx}/dailymgr/specialArea/findAreaByLevel?areaParent='+record.id,    
	        		    valueField:'id',    
	        		    textField:'areaName',
	        		    editable:'false',
	        		    limitToList:true
	        		}); 
				}
			});   
	     
	        /*选择县*/
	        $('#areaCityId').combobox({
	        	onSelect: function(record){
	        		$('#areaCountryId').combobox({    
	        			url:'${ctx}/dailymgr/specialArea/findAreaByLevel?areaParent='+record.id,    
	        		    valueField:'id',    
	        		    textField:'areaName',
	        		    editable:'false',
	        		    limitToList:true
	        		}); 
				}
			});
	      
});

	
</script>
