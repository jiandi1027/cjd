<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>



 <form  action="${ctx}/rewardspunishment/commend/save" method="post" id="commendFrom" enctype="multipart/form-data" >
     	 <input type="hidden" name="id" id="id" value="${commend.id}"/>
     	 <c:if test="${sysAccount.roleId eq 3003}"><!-- 此处控制是司法所上报还是矫正科上报 -->
	           <input type="hidden" name="decideType"  value="4"/>
	     </c:if>
	     <c:if test="${sysAccount.roleId ne 3003}">
	           <input type="hidden" name="decideType" value="5"/>
	     </c:if>
	     	
     	<c:choose>
 		<c:when test="${empty commend.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${commend.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
   
    
   
     <div class="easyui-panel" title="相关信息" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
                <tr>
                   <th width="10%"><span class="c-red">*</span>处理时间：</th>
					<td width="23%"><input type="text" name="doDate" id="doDate" value="<fmt:formatDate value="${commend.doDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />" required=true missingMessage="申请日期不能为空!"
								class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"/>
					</td>
					<th width="10%"><span class="c-red">*</span>申请人：</th>
					<td width="23%"><input type="text" name="sponsor"  required=true missingMessage="申请人不能为空!" value="${commend.sponsor}"
								class="f1 easyui-textbox" data-options="validType:'chinaName'"/>
					</td>
					<th width="10%"><span class="c-red">*</span>表扬原因：</th>
					<td width="23%">
						<select  id="reason"  class="f1 easyui-combobox" name="reason" 
							required="true"	 data-options="editable:true,panelHeight:'auto'"	style="width:176px;">
									<option value="连续6个月考核合格" <c:if test='${commend.reason eq"连续6个月考核合格"}'> selected="selected"</c:if>>连续6个月考核合格</option>
									<option value="其他" <c:if test='${commend.reason eq"其他"}'>selected="selected"</c:if>>其他</option>
									
						</select>
					</td>
				</tr>
				<tr>
					<th>其他缘故：</th>
					<td><input type="text" name="note"  value="${commend.note}" missingMessage="申请人不能为空!"
								class=" easyui-textbox" /></td>
					 <th width="10%"><span class="c-red">*</span>考核开始时间：</th>
					<td width="23%">
								<input name="beginDate" id="beginDate" editable="false" value="<fmt:formatDate value="${commend.beginDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />"required=true class="Wdate easyui-validatebox" 
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}'})"/></td>
					 <th width="10%"><span class="c-red">*</span>考核结束时间：</th>
					 <td width="23%">
					 			<input name="endDate" id="endDate" editable="false" value="<fmt:formatDate value="${commend.endDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />" required=true class="Wdate easyui-validatebox" 
					onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'beginDate\')}',maxDate:'2120-10-01'})"/>
					 </td>
				</tr>
				<tr>
					<th><span class="c-red">*</span>具体事实：</th>
					<td colspan="5">
					<textArea class="f1 easyui-validatebox"  style="width:685px;height:130px;"
					data-options="multiline:true" name="fact" required=true id="fact" onMouseOut="textarealength(this,200)"
					onkeydown='textarealength(this,300)' onKeyUp="textarealength(this,300)" maxlength="300">${commend.fact }</textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em class="textarea-length c-red">${fn:length(commend.fact)}</em>个字。</td>
				</tr>
				<tr>
					<th>上传附件：</th>
					<td colspan="5">
						<div id="noteUpload">
						</div>
					</td>
				</tr>
				<c:if test="${not empty commend.id}">
                <tr>
					<th>已上传附件：</th>
					<td colspan="5">
						<c:forEach var="sysFile" items="${fileList}">
							<div id="file_${sysFile.id}" >${sysFile.originName}
							<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
							<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
							</div>
						</c:forEach>
					</td>
				</tr>
				</c:if>
			</table>
    </div>
 </form>
<script>
        function submitForm(){
        	 $('#commendFrom').form('submit');
        }
 	   $(function() {
 		$("#noteUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});	
       	$('#commendFrom').form({
       		url:'${ctx}/rewardspunishment/commend/save',
       		onSubmit:function(){
       			 setFilePathAndName('noteUpload');
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
        
	
    </script>

