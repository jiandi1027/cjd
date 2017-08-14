<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<body style="margin:0;padding:0">
 <form  action="${ctx}/dailymgr/gradeChange/save" method="post" id="culpritInfo">
 	<c:choose>
 		<c:when test="${empty gradeChange.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${gradeChange.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose> 	
	<div class="easyui-panel" title="相关信息" style="width:99%;padding:5px;margin-bottom: 30px;">
		<input type="hidden" name="id" id="gradeChangeId" value="${gradeChange.id }"></input>
		<table width="100%">
			<tr>
				<td>原监管等级:</td>
			    <td>${fns:getSysDicValueByKey('sf_culprit','dic_gldxjb_key',culprit.dicMonitorGradeKey ,'')}</td>
				<td>新监管等级:</td>
				<td><input name="dicMonitorGradeKey" id="dicMonitorGradeKey1" class="easyui-combobox" required=true style="width:200px;"
						data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=27000&key=${gradeChange.dicOldMonitorGradeKey }',panelHeight:'auto'"value="${gradeChange.dicMonitorGradeKey }"></input></td>
			</tr>
			<tr>
				<td>确定监管等级缘由:</td>
			    <td><input id="dicChangeReasonKey" name="dicChangeReasonKey" class="easyui-combobox" required=true style="width:500px;" value="${gradeChange.dicChangeReasonKey}"></td>
			</tr>
	                 
			<tr rowspan="5">
				<td><span class="c-red"></span>修改原因及依据：</td>
				<td colspan="5">
					<input type="text" name="accountOpinion"  multiline=true 
						class="f1 easyui-textbox" value="${gradeChange.accountOpinion}"  style="width:800px;height:80px;"/>
				</td>
			</tr> 
			<tr rowspan="5">
				<td><span class="c-red"></span>司法所意见：</td>
				<td colspan="5">
					<input type="text" name="SFSOpinion"multiline=true 
						class="f1 easyui-textbox" value="${gradeChange.SFSOpinion}" style="width:800px;height:80px;" /></td>
	        </tr>
			<tr>
			    <td>已上传附件：</td>
			    <td></td>
			</tr> 
		</table>           
    </div>
	<div align="center">
		<p colspan="4"> 
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
			<c:if test="${gradeChange.auditType eq 'firstReport'}">
    			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="report()">上报</a>
			</c:if>
			<!--
	  		<c:if test="${gradeChange.auditType ne 'firstReport'}">
	      		&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
	 		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="check()">审核</a>
	 		</c:if>
			-->
			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">返回</a>
		</p>
    </div>
</form>
    <script>
    	//保存上报
        function submitForm(){
        	 $('#culpritInfo').form('submit');
        }
        function clearForm(){
            $('#sumbit').dialog('close');
        }
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
        $('#dicMonitorGradeKey1').combobox({
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
    		$('#gradeChangeCheck').dialog('open') .css({"width":"auto","height":"auto"});
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
					$('#sumbit').dialog('close');
					//2刷新列表
					$('#change_record_list_content').datagrid('reload');
				} ,
				error:function(result){
					$.meesager.show({
						title:result.status==200?"ok":"fail" ,  
						msg:result.msg
					});
				}
			});
        }
        /**
    	 *  提交处理流程表单方法
    	 */
    	function apply(){
    		var str=$("#checkForm").serialize();
    			if($('#checkForm').form('validate')){
    				$.ajax({
    					type: 'post' ,
    					url: '${ctx}/dailymgr/gradeChange/submitGradeChangeAudit',
    					cache:false ,
    					data:str ,
    					dataType:'json' ,
    					success:function(result){
    						//1 关闭窗口
    						$('#gradeChangeCheck').dialog('close');
    						parent.location.reload();
    		      			var index = parent.layer.getFrameIndex(window.name);
    						parent.layer.close(index);
    					} ,
    					error:function(result){
    						$.meesager.show({
    							title:result.status==200?"ok":"fail" ,  
    							msg:result.msg
    						});
    					}
    				});
    			} else {
    				$.messager.show({
    					title:'提示信息!' ,
    					msg:'数据验证不通过'
    				});
    			}
    	}
        
    </script>
</body>
