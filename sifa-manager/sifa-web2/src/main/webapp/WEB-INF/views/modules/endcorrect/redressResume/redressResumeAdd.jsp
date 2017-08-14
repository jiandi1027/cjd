<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

 <form  name="redressResumeForm" id="redressResumeForm"  method="post">
     <c:choose>
 		<c:when test="${empty redressResume.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${redressResume.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    
   
     <div class="easyui-panel" title="特殊原因恢复矫正" style="width:100%;padding: 5px;">
            <table width="100%" class="grid">
            	 <tr>
                    <th width="10%"><span class="c-red">*</span>矫正恢复时间：</th>
							<td width="23%"><input type="text" name="redressStartTime" required=true missingMessage="矫正恢复时间不能为空!"
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" style="width: 145px;"/></td>
							<th width="10%"><span class="c-red">*</span>矫正结束时间：</th>
							<td width="23%"><input type="text" name="redressEndTime" required=true missingMessage="矫正结束时间不能为空!"
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"  style="width: 145px;"/></td>
					<th width="10%">处理部门：</th>
							<td width="23%"><select id="examineUnit" name="examineUnit" class="easyui-combotree"  style="width:173px;"
    data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true"></select></td>
                </tr>
            
                <tr>
                    <th width="10%"><span class="c-red">*</span>恢复矫正原因：</th>
                    <td colspan="5" align="left"><textarea id="reason" name="reason" class="easyui-validatebox" style="width: 80%;height:50px;overflow:hidden;"required=true missingMessage="恢复矫正原因不能为空!"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200"></textarea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。			
								</td>
                </tr>
                <tr>
                    <th width="10%"><span class="c-red">*</span>主要事实：</th>
                    <td colspan="5" align="left">
                    <textArea id="fact" name="fact" class="easyui-validatebox" style="width: 80%;height:50px;overflow:hidden;"required=true missingMessage="主要事实不能为空!"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200"></textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</td>
                </tr>
            </table>
    </div>
    </form>
    <script>
    var sysGroupTree;

    $(function() {
    	sysGroupTree = $('#sysGroupTree').tree({
             url : '${ctx}/sys/sysGroup/loadGroupTree',
             parentField : 'parentId',
             lines : true,
             onClick : function(node) {
            	 $('#redress_resume_list').datagrid('load', {
            		 examineUnit: node.id
                 });
             }
         });


    });
    
        function submitForm(){
        	 $('#redressResumeForm').form('submit');
        }
        function clearForm(){
            $('#redressResumeForm').form('clear');
        }
        $(function() {
        	$('#redressResumeForm').form({
        		url:'${ctx}/endcorrect/redressResume/save',
        		onSubmit:function(){
        			 progressLoad();
        			 var isValid = $(this).form('validate');
                     if (!isValid) {
                    	 progressClose();
                     }
                     return isValid;
        		},
        		success:function(data){
        			data = JSON.parse(data);
        			if(data.status==200){
        				  progressClose();
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
        
        });
        
	
    </script>

