<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form  action="${ctx}/endcorrect/detached/save" method="post" id="detachedInfo">
 <input type="hidden" name="id" id="id" value="${detached.id}"/>
 	<c:choose>
 		<c:when test="${empty detached.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${detached.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 
 	
   
     <div class="easyui-panel" title="脱管信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
            	 <tr>
                   <th width="10%"><span class="c-red">*</span>脱管日期：</th>
				   <td width="23%"><input type="text" name="detachedTime" id="detachedTime" value="<fmt:formatDate value="${detached.detachedTime}"  
									pattern="yyyy-MM-dd" />" required=true missingMessage="脱管日期不能为空!" editable="false"
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
					<th width="10%"><span class="c-red">*</span>通报民警姓名：</th>
					<td width="23%"><input type="text" name="policeName" value="${detached.policeName}" required=true missingMessage="民警姓名不能为空!" data-options="validType:'chinaName'"
								class="f1 easyui-textbox" /></td>
					<th width="10%"><span class="c-red">*</span>通报机关名称：</th>
					<td width="23%"><input type="text" name="reportUnit" value="${detached.reportUnit}" required=true missingMessage="通报机关名称不能为空!"
								class="f1 easyui-textbox" /></td>
                </tr>
                <tr>
                    <th width="10%"><span class="c-red">*</span>通报公安机关时间：</th>
					<td><input type="text" name="reportTime" required=true value="<fmt:formatDate value="${detached.reportTime}" 
									pattern="yyyy-MM-dd" />" missingMessage="通报公安时间不能为空!" editable="false"
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
					<th width="10%"><span class="c-red">*</span>掌握信息时间：</th>
					<td><input type="text" name="graspTime" required=true value="<fmt:formatDate value="${detached.graspTime}" 
									pattern="yyyy-MM-dd HH:mm:ss" />" missingMessage="掌握信息时间不能为空!" editable="false"
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"/></td>
					<th width="10%"><span class="c-red">*</span>掌握信息方式：</th>
					<td><select  name="dicGraspTypeKey" editable=false required=true missingMessage="请假理由不能为空!" editable="false" style="width:173px;"
								class="easyui-combobox">
									<option value="96201" <c:if test="${detached.dicGraspTypeKey==96201}">selected="selected"</c:if>>未按时报到</option>   
							    	<option value="96202" <c:if test="${detached.dicGraspTypeKey==96202}">selected="selected"</c:if>>未按时电话报到</option>   
							    	<option value="96203" <c:if test="${detached.dicGraspTypeKey==96203}">selected="selected"</c:if>>未按时学习劳动</option>   
							   	 	<option value="96204" <c:if test="${detached.dicGraspTypeKey==96204}">selected="selected"</c:if>>公安部门通报</option>   
							    	<option value="96205" <c:if test="${detached.dicGraspTypeKey==96205}">selected="selected"</c:if>>与派出所信息核查核对</option>
							    	<option value="96206" <c:if test="${detached.dicGraspTypeKey==96206}">selected="selected"</c:if>>群众举报</option>
							    	<option value="96207" <c:if test="${detached.dicGraspTypeKey==96207}">selected="selected"</c:if>>走访排查</option>
							    	<option value="96208" <c:if test="${detached.dicGraspTypeKey==96208}">selected="selected"</c:if>>其他</option> 
								</select ></td>
                </tr>
                <tr>
                    <th>通报人：</th>
					<td colspan="5"><input type="text" name="reportPerson" class="f1 easyui-textbox" value="${detached.reportPerson}" data-options="validType:'chinaName'"/></td>
                </tr>
                <tr>
                    <th><span class="c-red">*</span>简要描述情况：</th>
					<td colspan="5">
						<textarea  name="description" id="detached_detailInfo" class="easyui-validatebox"  multiline="true" required=true missingMessage="简要描述不能为空!"
							onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)' onMouseOut="textarealength(this,200)" 
							style="width:80%;height:80px;overflow:hidden;" maxlength=200>${detached.description}</textarea>
						<br/>
						<p class="textarea-numberbar">
							备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">${fn:length(detached.description)}</em>个字。
						</p>
					</td>
                </tr>  
            </table>
    </div>
    </form>
    <script>
        function submitForm(){
        	 $('#detachedInfo').form('submit');
        }
        function clearForm(){
            $('#detachedInfo').form('clear');
        }
        $(function() {
        	$('#detachedInfo').form({
        		url:'${ctx}/endcorrect/detached/save',
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
        	 $('#detachedInfo').form('load',arr[0]);
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
