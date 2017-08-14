<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

 <form  action="${ctx}/dailymgr/gradeChange/save" method="post" id="gradeChangeId">

 
 	<c:choose>
 		<c:when test="${empty gradeChange.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${gradeChange.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 	
     <div class="easyui-panel" title="相关信息" style="width:100%;padding:5px;">
		<table width="100%" class="grid">
			<tr rowspan="5">
				<th width="9%">原监管等级：</th>
				<td colspan="8"> ${fns:getSysDicValueByKey('sf_culprit','dic_gldxjb_key',culprit.dicMonitorGradeKey ,'')}</td>
            </tr>
			<tr>
				<th>新监管等级：</th>
			    <td colspan="2">${fns:getSysDicValueByKey('sf_culprit','dic_gldxjb_key',gradeChange.dicMonitorGradeKey ,'')}</td>
			    <th>确定监管等级缘由：</th>
                <td colspan="5">${fns:getSysDicValueByKey('common_table','dicChangeReasonValue',gradeChange.dicChangeReasonKey,'') } </td>
			</tr>
            <%--   
			<tr>
				<td>确定监管等级缘由:</td>
				<td><input id="dicChangeReasonKey" name="dicChangeReasonKey" class="easyui-combobox" required=true style="width:500px;" value="${gradeChange.dicChangeReasonKey}"readonly="readonly"></td>
			</tr>
			--%>
			<tr rowspan="5">
            	<th><span class="c-red"></span>修改原因及依据：</th>
				<td colspan="8">
					<input type="text" name="accountOpinion"  multiline=true 
						class="f1 easyui-textbox" value="${gradeChange.accountOpinion}"  style="width:800px;height:80px;" readonly="readonly"/>
				</td>
			</tr> 
			<tr rowspan="5">	
				<th><span class="c-red"></span>司法所意见：</th>
				<td colspan="8">
					<input type="text" name="SFSOpinion"multiline=true 
						class="f1 easyui-textbox" value="${gradeChange.SFSOpinion}" style="width:800px;height:80px;" readonly="readonly"/>
				</td>
			</tr>
			<tr rowspan="5">
				<th>已上传附件：</th>
				<td style="border-right-style:none" colspan="5">
					<div id="wtdchUploadIng">
						<c:forEach var="sysFile" items="${fileList}">
							<div id="file_${sysFile.id}">
								${sysFile.originName}
								<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
							</div>
						</c:forEach>
					</div>
				</td>
			</tr> 
		</table>           
    </div>
	<div class="easyui-panel" id="p3" title="审批历史" style="width:100%;padding:5px;">
		<table width="100%" class="grid"style="text-align: center;">
			<tr>
	            <th width="20%" style="text-align:center;">操作人</th>
	            <th width="20%" style="text-align:center;">操作时间</th>
	            <th width="20%" style="text-align:center;">操作环节</th>
	            <th width="20%" style="text-align:center;">意见</th>
	            <th width="20%" style="text-align:center;">备注</th>
			</tr>
			<c:forEach items="${processDetails}" var="processDetail">
				<tr>
				   <td>${processDetail.createrCnName }</td>
				   <td><fmt:formatDate value="${processDetail.created }" pattern="yyyy-MM-dd" /></td>
				   <td>${processDetail.auditName }</td>
				   <td>${processDetail.dicDecideType == '1'?'同意':'退回'}</td>
				   <td>${processDetail.opinion}</td>
				</tr>
			</c:forEach>
		</table>
    </div>
     <div style="text-align: center;display: none;">
         <p colspan="4"> 
			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
			<a href="javascript:void(0)" id="levelId" name="levelId" class="easyui-linkbutton" onclick="check()">审核</a>
		  	&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
			<a href="javascript:void(0)" id="returnId" class="easyui-linkbutton" onclick="clearForm()">返回</a>
		   <a href="javascript:void(0)" id="returnId1" class="easyui-linkbutton" onclick="report()">上报</a>
		</p>
    </div>
</form>
   
    <div id="gradeChangeCheck" title="修改监管等级处理" modal=true draggable=false
		class="easyui-dialog"  data-options="iconCls:'fi-clipboard-pencil icon-blue'"
		closed=true style=" width:430px; padding:5px; top:250px; left:650px;">
		<form id="gradeCheckForm" action="" method="post">
		 	<%-- <input type="" name="id" value="${gradeChange.id }" >
		 	<input type="" name="taskId" value="${gradeChange.taskId}" />
		 	<input type="" name="auditType" value="${gradeChange.auditType}" />
		 	<input type="" name="processInstanceId" value="${gradeChange.processInstanceId}" /> --%>
		 	
			<table class="grid">
				<tr>
					<th width="20%">是否批准：</th>
					<td>
						<input type="radio" name="decideType" checked="checked" value="1"/>批准&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="decideType" value="2" />退回					
					</td>
				</tr>
				<tr>
					<th >审批意见：</th>
					<td>
						<textArea id="opinion" name="opinion" class="easyui-validatebox" style="width:300px;height:80px;" required=true
						  	onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200"></textArea>
						<br>
							备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
					</td>
				</tr>
				<!-- 
				<tr>
					<th>短信发送：</th>
					<td></td>
				</tr>
				 -->
				<tr align="center">
					<td colspan="2"><a href="javascript:void(0)" id="btn1" class="easyui-linkbutton" data-options="iconCls:'fi-check icon-blue'" onclick="apply()">确定</a>
					<a id="grade_check_btn2" data-options="iconCls:'fi-x icon-blue'" class="easyui-linkbutton" >返回</a></td>
				</tr>
			</table>
		</form>
	</div>
    <script>
    	//保存上报
        function submitForm(){
        	 $('#culpritInfo').form('submit');
        }
        function clearForm(){
        	$('#changeRecord').dialog('close');
        }
        $('#grade_check_btn3').click(function(){
    		$('#gradeChangeCheck').dialog('close');
    	});
        $('#grade_check_btn2').click(function(){
    		$('#gradeChangeCheck').dialog('close');
    	});
        $(function() {
        	$('#culpritInfo').form({
        		url:'${ctx}/dailymgr/gradeChange/save',
        		onSubmit:function(){
        			return $(this).form('validate');
        		},
        		success:function(data){
        			data = JSON.parse(data);
        			if(data.status==200){
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});				
        			}else{
        				alert(data.msg);
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
        var grade='${gradeChange.dicMonitorGradeKey }';
        if(grade=='27003'){
			value=121000;
		}
		if(grade=='27004'){
			value=83000;
		}
		if(grade=='27005'){
			value=88000;
		}
		$('#dicChangeReasonKey').combobox({
			
			url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey='+value,    
			panelHeight:'250',
			valueField:'id',    
		    textField:'value'   
		});  
        //$('#dicMonitorGradeKey').combobox('setValues', ['27003','27004','27005']);
        });
        $('#dicMonitorGradeKey').combobox({
        	onSelect: function(record){
        		var value;
        		if(record.id=='27003'){
        			value=121000;
        		}
        		if(record.id=='27004'){
        			value=83000;
        		}
        		if(record.id=='27005'){
        			value=88000;
        		}
        		$('#dicChangeReasonKey').combobox({
        			
        			url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey='+value,    
        			panelHeight:'250',
        			valueField:'id',    
        		    textField:'value'   
        		}); 
			}
		});
        
        function check(){
    		//$('#check').get(0).reset();
    		//$("#check input[name='id']").attr("value","");
    		//$('#myform').form('clear');
    		
    		$('#gradeChangeCheck').window('center')
    		$('#gradeChangeCheck').dialog('open')
    		
    	}
        function report(){
        	$.ajax({
				type: 'post' ,
				url: '${ctx}/dailymgr/gradeChange/submitGradeChangeAudit',
				cache:false ,
				data:{ "id": "${gradeChange.id }","decideType":"1"} ,
				dataType:'json' ,
				success:function(result){
					//1 关闭窗口
					$('#changeRecord').dialog('close');
					//2刷新列表
					$('#change_record_list_content').datagrid('reload');
				} ,
				error:function(result){
					$.meesager.show({
						title:result.status==200 ? "ok" : "fail" ,  
						msg:result.msg
					});
				}
			});
        	$.messager.show({
				title:'提示信息!' ,
				msg:'上报成功'
			});
        }
        /**
    	 *  提交处理流程表单方法
    	 */
    	 var exaAndApp='${exaAndApp}';
    	function apply(){
    		if($('#gradeCheckForm').form('validate')){
				$.ajax({
					type: 'post' ,
					url: '${ctx}/dailymgr/gradeChange/submitGradeChangeAudit?id=${gradeChange.id }&taskId=${gradeChange.taskId }&auditType=${gradeChange.auditType }&processInstanceId=${gradeChange.processInstanceId }',
					cache: false ,
					data: $("#gradeCheckForm").serialize() ,
					dataType: 'json' ,
					success: function(result){
						$.messager.show({
		    				title:'提示信息!' ,
		    				msg:result.msg
		    			});
						if(exaAndApp=='0'){
							$('#gradeChangeCheck').dialog('close');
							$('#opinion').val("");
							/* $('#gradeCheckForm').form('clear'); */
							parent.$.modalDialog.handler.dialog('close');
							parent.$.modalDialog.openner_dataGrid.datagrid('reload');
						}else{
							//1 关闭窗口
							$('#gradeChangeCheck').dialog('close');
							$('#changeRecord').dialog('close');
							//2刷新列表
							$('#change_record_list_content').datagrid('reload');
						}
						
					} ,
					error: function(result){
						$('#change_record_list_content').datagrid('reload');
					}
				});
	    	}else {
	   				$.messager.show({
	   					title:'提示信息!' ,
	   					msg:'数据验证不通过'
	   				});
	   			}
        }
    </script>

