<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>假释</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="${ctx}/dailymgr/gradeChange/save" method="post" id="culpritInfo">
 	<c:choose>
 		<c:when test="${empty gradeChange.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${gradeChange.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 	<div class="easyui-panel" id="p3" title="审批历史" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%" style="text-align: center;">
                <tr>
                   <td width="20%">操作人</td>
                   <td width="20%">操作时间</td>
                   <td width="20%">审批环节</td>
                   <td width="20%">意见</td>
                   <td width="20%">备注</td>
                </tr>
                <c:forEach items="${processDetails}" var="processDetail">
                <tr>
                   <td>${processDetail.createrCnName }</td>
                   <td><fmt:formatDate value="${processDetail.created }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
                   <td>${processDetail.auditName }</td>
                   <td>${processDetail.dicDecideType == '1'?'同意':'退回'}</td>
                   <td>${processDetail.opinion}</td>
                </tr>
                </c:forEach>
            </table>
    </div>
 	
     <div class="easyui-panel" title="相关信息" style="width:100%;padding:10px;margin-bottom: 30px;">
           <input type="hidden" name="id" id="gradeChangeId" value="${gradeChange.id }"></input>
            <table width="100%">
                <tr>
                    <td>原监管等级:</td>
                    <td><input name="dicOldMonitorGradeKey" id="dicOldMonitorGradeKey" style="width:200px;" class="easyui-combobox" 
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=27000',panelHeight:'auto'"readonly="readonly" value="${gradeChange.dicOldMonitorGradeKey }"></input></td>
                    <td>新监管等级:</td>
                    <td><input name="dicMonitorGradeKey" id="dicMonitorGradeKey" class="easyui-combobox" required=true style="width:200px;"
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=27000',panelHeight:'auto'"value="${gradeChange.dicMonitorGradeKey }"readonly="readonly" ></input></td>
                </tr>
                <tr>
                    <td>确定监管等级缘由:</td>
                    <td><input id="dicChangeReasonKey" name="dicChangeReasonKey" class="easyui-combobox" required=true style="width:500px;" value="${gradeChange.dicChangeReasonKey}" readonly="readonly" ></td>
                </tr>
                 
                <tr rowspan="5">
                    <td><span class="c-red">*</span>修改原因及依据：</td>
							<td colspan="5"><input type="text" name="accountOpinion"  multiline=true 
								class="f1 easyui-textbox" value="${gradeChange.accountOpinion}"  style="width:800px;height:80px;" readonly="readonly" /></td>
                </tr> 
                <tr rowspan="5">
                    <td><span class="c-red">*</span>司法所意见：</td>
							<td colspan="5"><input type="text" name="SFSOpinion"multiline=true 
								class="f1 easyui-textbox" value="${gradeChange.SFSOpinion}" style="width:800px;height:80px;" readonly="readonly" /></td>
                </tr>
                 <tr>
                    <td>相关材料:</td>
                    <td><input type="file" name="evidencePath" id="evidencePath" value="上传"></input></td>
                </tr>
                <tr>
                    <td>已上传附件:</td>
                    <td></td>
                </tr> 
            </table>           
    </div>
     <!-- <div align="center">
         <p colspan="4"> 
         <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
          <c:if test="${gradeChange.auditType eq 'firstReport'}">
         	&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="report()">上报</a>
		  </c:if>
		  <c:if test="${gradeChange.auditType ne 'firstReport'}">
         	&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="check()">审核</a>
		  </c:if>
		  			&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
		  </p>
    </div> -->
    </form>
    <div id="check" title="修改监管等级处理" modal=true draggable=false
		class="easyui-dialog" closed=true style="padding:10px; top:250px; left:650px;background:#c4d8ed">
		<form id="checkForm" action="" method="post">
			<input type="hidden" name="id" value="" />
			<table>
				<tr>
					<td>是否批准:</td>
					<td>
						<input type="radio" name="decideType" checked="checked" value="1"/>批准&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="decideType" value="2" />退回					
					</td>
					
				</tr>
						
				<tr>
					<td>审批意见:</td>
					<td><input type="text" name="opinion" multiline="true"
						class="easyui-textbox" required=true 
						data-options="width:220,height:80"
						 value="" /></td>
				</tr>
				<tr>
					<td>短信发送:</td>
					<td></td>
				</tr>
				<tr align="center">
					<td colspan="2"><a href="javascript:void(0)" id="btn1" class="easyui-linkbutton" onclick="apply()">确定</a>
						<a  id="btn2" class="easyui-linkbutton">取消</a></td>
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
            $('#culpritInfo').form('clear');
        }
        $(function() {
        	$('#btn2').click(function(){
        		$('#check').dialog('close');
        	});
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
        				
        				parent.location.reload();
        				
            			var index = parent.layer.getFrameIndex(window.name);
    					parent.layer.close(index);
    					
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
    		$('#check').dialog('open') .css({"width":"auto","height":"auto"});
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
					$('#check').dialog('close');
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
    						$('#check').dialog('close');
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
</html>
