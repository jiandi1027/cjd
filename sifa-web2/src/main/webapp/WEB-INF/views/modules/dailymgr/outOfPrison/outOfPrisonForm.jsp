<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
 <form  action="${ctx}/dailymgr/outOfPrison/save" method="post" id="d_outOfPrisonInfo">
 	<input type="hidden" name="id" id="id" value="${outOfPrison.id}"/>
 	<c:choose>
 		<c:when test="${empty outOfPrison.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${outOfPrison.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
    <div class="easyui-panel" title="申请相关信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
            	<tr>
                    <th width="10%">有无明确期限：</th>
                    <td width="23%" style="border:0;"><input type="radio" value="1" name="isDeadline" id="hasDeadline" <c:if test="${outOfPrison.isDeadline==1 || outOfPrison.isDeadline==null}">checked="checked"</c:if>/>有&nbsp;&nbsp;&nbsp;
                    	<input type="radio" value="0" name="isDeadline" id="noDeadline" <c:if test="${outOfPrison.isDeadline==0}">checked="checked"</c:if>/>无
                    </td>
                    <td width="10%" style="border:0;"></td>
                    <td width="23%" style="border:0;"></td>
                    <td width="10%" style="border:0;"></td>
                    <td width="23%" style="border:0;"></td>
                </tr>
                <tr>
                    <th width="10%"><span class="c-red">*</span>延长期限（月）：</th>
                    <td width="23%"><input class="easyui-numberbox" data-options="min:0" required=true name="extendTime"  id="extendTime" value="${outOfPrison.extendTime }"/></td>
                     <th width="10%"><span class="c-red">*</span>延长开始时间：</th>
                    <td width="23%"><input class="Wdate easyui-validatebox"  value="<fmt:formatDate value="${outOfPrison.startDate }"
									pattern="yyyy-MM-dd" />" id="startDate" name="startDate" required=true onfocus="var endDate=$dp.$('endDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}'})"/></td>
                    <th width="10%"><span class="c-red">*</span>延长结束时间：</th>
                    <td width="23%"><input class="Wdate easyui-validatebox" value="<fmt:formatDate value="${outOfPrison.endDate }"
									pattern="yyyy-MM-dd" />" id="endDate" name="endDate" required=true onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startDate\')}'})"/></td>
                </tr>
                <tr>
                    <th width="10%">鉴定结果是否符合条件：</th>
                    <td colspan="5"><input type="radio" value="1" name="isConform" checked="checked"/>是&nbsp;&nbsp;&nbsp;
                    	<input type="radio" value="0" name="isConform"/>否
                    </td>
                </tr>
                 <tr>
                    <th>法律文书：</th>
                    <td colspan="5"><div id="lawNoteUpload"></div>
						<input type="hidden" name="lawNoteUploadUrl" id="lawNoteUrl">
	     				<input type="hidden" name="lawNoteUploadPathName" id="lawNotePathName">
						<input type="hidden" name="lawNoteUploadPath" id="lawNotePath">
                    </td>
                </tr>
                <c:if test="${not empty outOfPrison.id}">
                <tr>
					<th>已上传法律文书：</th>
					<td colspan="5">
						<c:forEach var="sysFile" items="${fileList1}">
						<div id="file_${sysFile.id}">${sysFile.originName}
						<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
					</c:forEach>
					</td>
				</tr>
				</c:if>
                 <tr>
                    <th>证据材料：</th>
                    <td colspan="5"><div id="noteUpload"></div>
	     				<input type="hidden" name="noteUploadUrl" id="noteUrl">
	     				<input type="hidden" name="noteUploadPathName" id="notePathName">
						<input type="hidden" name="noteUploadPath" id="notePath">
                    </td>
                </tr>
                 <c:if test="${not empty outOfPrison.id}">
                 <tr>
					<th>已上传证据材料：</th>
					<td colspan="5">
						<c:forEach var="sysFile" items="${fileList2}">
						<div id="file_${sysFile.id}">${sysFile.originName}
						<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
					</c:forEach>
					</td>
				</tr>
				</c:if>
                <tr>
                    <th><span class="c-red">*</span>申请延长原因及依据：</th>
						<td colspan="5">
							<textarea  name="reason" id="outOfPrison_reason" class="easyui-validatebox"  multiline="true" required=true missingMessage="申请延长原因及依据不能为空!" 
							onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)' onMouseOut="textarealength(this,200)" 
							style="width:80%;height:80px;overflow:hidden;" maxlength=200>${outOfPrison.reason}</textarea>
							<br/>
							<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">${fn:length(outOfPrison.reason)}</em>个字。
							</p>
						</td>
                </tr> 
            </table>
    </div>
    <c:if test="${sysAccount.roleId eq 3003}">
           <input type="hidden" name="decideType" type="text" value="4"/>
     </c:if>
     <c:if test="${sysAccount.roleId ne 3003}">
            <input type="hidden" name="decideType" type="text" value="5"/>
     </c:if>
</form>
<div id="saveOutOfPrisonWithSubmit"></div>
<div style="text-align: center;display: none;">
	    <a id="saveWithSubmitOutPrisonBtn" class="easyui-linkbutton" >保存并上报</a>
    </div>
<script>
var isDeadline='${outOfPrison.isDeadline}';
$(function() {
	$("#lawNoteUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});	
	$("#noteUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});	
	
	
	var results =$('input[name="isDeadline"]');

	if(isDeadline=='0'){
		$('#extendTime').numberbox({disabled:true});
		 $('#startDate').validatebox({disabled:true});
		 $('#endDate').validatebox({disabled:true});
	}
	/* if($('input[name="isDeadline"]:checked').val()=='0'){
		 $('#extendTime').numberbox({disabled:true});
		 $('#startDate').validatebox('disable');
		 $('#endDate').validatebox('disable');
		}  */
	 for(var i=0;i<results.length;i++){
		 results[i].onclick=function(){
			 var result=$('input[name="isDeadline"]:checked').val();
			 if(result=='0'){//无明确期限
				 $('#extendTime').numberbox({disabled:true});
				 $('#startDate').validatebox('disable');
				 $('#endDate').validatebox('disable');
			 }else{
				  $('#extendTime').numberbox({disabled:false});
				 $('#startDate').validatebox('enable');
				 $('#endDate').validatebox('enable');
			 }
		 }
	 }
	
	$("#extendTime").numberbox({//对延长期限添加onchang函数
         "onChange": function () {
        	 var extendTime=parseInt($('#extendTime').val());
        	 var startDate= $('#startDate').val();
    		 var endDate=null;
        	 if(extendTime!='' && startDate!=''){
        		 endDate=new Date(startDate);
            	 var month=parseInt(endDate.getMonth());
            	 var date=parseInt(endDate.getDate());
            	 var year=parseInt(endDate.getFullYear());
            	 endDate.setMonth(month+extendTime);
            	 endDate.setDate(date); 
        	 } 
        	 endDate = endDate.format("yyyy-MM-dd");
        	 $('#endDate').val(endDate);
           }
       });
	 
	$("#startDate").blur(function(){
			var extendTime=parseInt($('#extendTime').val());
			var date= $('#startDate').val();
			var endDate=null;
			 if(extendTime!='' && date!=''){
	       		 endDate=new Date(date);
	           	 var month=parseInt(endDate.getMonth());
	           	 var date=parseInt(endDate.getDate());
	           	 var year=parseInt(endDate.getFullYear());
	           	 endDate.setMonth(month+extendTime);
	           	 endDate.setDate(date); 
	       	 }
			 endDate = endDate.format("yyyy-MM-dd");
	       	 $('#endDate').val(endDate);
			 
		});
	
	
	$('#d_outOfPrisonInfo').form({
		url:'${ctx}/dailymgr/outOfPrison/save',
		onSubmit:function(){
			setFilePathAndName('lawNoteUpload');
			setFilePathAndName('noteUpload');
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
	 
}); 

$('#saveWithSubmitOutPrisonBtn').click(function (){
	setFilePathAndName('lawNoteUpload');
	setFilePathAndName('noteUpload');
	if($("#d_outOfPrisonInfo").form('validate')){
    	   $.ajax({
				type: 'post' ,
				url: '${ctx}/dailymgr/outOfPrison/save',
				cache:false ,
				data:$.serializeObject($('#d_outOfPrisonInfo')) ,
				dataType:'json',
				success:function(data){
					var id=data.data; 
					$('#saveOutOfPrisonWithSubmit').dialog({    
   					    title: '上报',    
   					    width: 800,    
   					    height: 700, 
   					   	iconCls:'fi-arrow-up icon-blue',
   					    closed: false,    
   					   	resizable:true,
   				        maximizable:true,  
   					    href: '${ctx}/dailymgr/outOfPrison/preSubmit?id='+id+'&submit=1',    
   					    modal: true,
   					   	buttons :[{
  							text:'上报',
  							iconCls:'fi-arrow-up icon-blue',
  							handler:function(){
  								$('#submitOutOfPrisonDetailBtn').click();
  							}
  						}, {
  							text:'关闭',
  							iconCls:'fi-x icon-blue',
  							handler:function(){
  								$('#saveOutOfPrisonWithSubmit').dialog('close');
  							}
  						}]
   					});    
				} ,
				error:function(result){
					$.messager.show({
	  					title:'提示信息!',
	  					msg:data.msg
	  				});
				}
			});
		}else{
			 $.messager.show({
				title:'提示信息!' ,
				msg:'验证失败！请检查数据是否已填写完整!'
			}); 
		}
});

	
</script>

