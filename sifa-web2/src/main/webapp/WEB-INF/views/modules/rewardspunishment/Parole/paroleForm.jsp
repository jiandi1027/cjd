<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<form  action="${ctx}/rewardspunishment/parole/save" method="post" id="paroleAddInfo">
 	<input type="hidden" name="decideType" value="1"/>
 	<c:choose>
 		<c:when test="${empty parole.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="paroleAddInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${parole.culpritId}" formId="paroleAddInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 </div>
     <div class="easyui-panel" title="假释相关信息" style="width:100%;padding:5px;">
           <input type="hidden" name="id" id="paroleId" value="${parole.id }"></input>
            <table width="100%" class="grid">
                <tr>
                    <th width="10%">附件上传：</th>
                    <td colspan="8">
						<div id="uploader"></div>
					</td>
                </tr>  
                <c:if test="${not empty parole.id}">
                <tr>
					<th>已上传附件：</th>
					<td colspan="8">
					<c:forEach var="sysFile" items="${fileList}">
						<div id="file_${sysFile.id}">${sysFile.originName}
						<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
					</c:forEach>
					</td>
				</tr>
				</c:if>
				<tr>
                   <th width="10%"><span class="c-red">*</span>假释年限：</th>
					<td colspan="8">
						<input name="reduceTime" class="easyui-textbox" required=true value="${parole.reduceTime}"/>
					</td>
				</tr>   
                <tr >
                    <th width="10%"><span class="c-red">*</span>法律依据：</th>
							<td colspan="8">
							<textArea class="f1 easyui-validatebox"   style="width:685px;height:130px;"
					data-options="multiline:true" name="reason" required=true id="reason"
					style="width: 280px; height: 100px" onkeydown='textarealength(this,300)' onKeyUp="textarealength(this,300)" maxlength="300">${parole.reason }</textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em class="textarea-length c-red">${fn:length(parole.reason)}</em>个字。
					</td>
                </tr> 
                <tr >
                    <th width="10%"><span class="c-red">*</span>表现概况：</th>
							<td colspan="8">
							<textArea class="f1 easyui-validatebox"   style="width:685px;height:130px;"
					data-options="multiline:true" name="actions" required=true id="actions"
					style="width: 280px; height: 100px" onkeydown='textarealength(this,300)' onKeyUp="textarealength(this,300)" maxlength="300">${parole.actions }</textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em class="textarea-length c-red">${fn:length(parole.actions)}</em>个字。
					</td>
                </tr>
                <!-- <tr>
                    <th width="10%">短信发送至：</th>
					<td colspan="8"></td>
                </tr> -->  
            </table>           
    </div>
  <!--    <div align="center">
         <p colspan="4"> 
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm(0)">保存</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm(1)">上报</a>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
		  </p>
    </div> -->
    </form>
    <script>
  /*   var reportType;
    	//保存上报
        function submitForm(obj){
        	reportType=obj;
        	 $('#culpritInfo').form('submit');
        }
        function clearForm(){
            $('#culpritInfo').form('clear');
        } */
       
        $(function() {
		 $("#uploader").powerWebUpload({ auto: true,fileNumLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
		 $('#paroleAddInfo').form({
	       		url:'${ctx}/rewardspunishment/parole/save',
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
	       			progressClose();
	       			if(data.status==200){
	       				$.messager.show({
	       					title:'提示信息!' ,
	       					msg:data.msg
	       				});
	       				
	       				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
	                     parent.$.modalDialog.handler.dialog('close');
	   					
	       			}else{
	       				 parent.$.messager.alert('错误', data.msg, 'error');
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
        });
        /* $('#paroleAddInfo').form({
    		url:'${ctx}/rewardspunishment/parole/save',
    		onSubmit:function(o){
    			o.reportType1=reportType;
    			return $(this).form('validate');
    		},
    		success:function(data){
    			data = JSON.parse(data);
    			if(data.status==200){
    				$.messager.show({
    					title:'提示信息!' ,
    					msg:data.msg
    				});
    				
    				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
    	            parent.$.modalDialog.handler.dialog('close');
					
    			}else{
    				alert(data.msg);
    			}
    			
    		}
    	});	 */
	
    </script>
</body>
</html>
