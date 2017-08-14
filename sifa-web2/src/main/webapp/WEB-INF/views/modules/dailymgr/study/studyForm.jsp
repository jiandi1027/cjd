<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>学习教育</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>

<body>
 <form  action="${ctx}/dailymgr/study/save" method="post" id="studyForm" name="studyForm">
	<input type="hidden" id="id" name="id" value="${study.id}"></input>
	<input type="hidden" id="studyType" name="studyType" value="1"></input>
	<input type="hidden" id="excellents" name="excellents" value="${study.excellents}"></input>
	<input type="hidden" id="goods" name="goods" value="${study.goods}"></input>
	<input type="hidden" id="commonlys" name="commonlys" value="${study.commonlys}"></input>
	<input type="hidden" id="differences" name="differences" value="${study.differences}"></input>
    
   
     <div class="easyui-panel" title="学习教育" style="width:100%;padding:5px;">
            <table width="100%" class="grid">

                <tr>
                    <th width="10%"><span class="c-red">*</span>学习内容：</th>
							<td><input type="text" name="studyContent" required=true missingMessage="学习内容不能为空!"
								class="f1 easyui-textbox" value="${study.studyContent}" /></td>
							<th width="10%"><span class="c-red">*</span>学习方式：</th>
							<td>
							<input id="dicStudyTypeKey" name="dicStudyTypeKey" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_STUDY&columnName=DIC_STUDY_TYPE_KEY&parentKey=15000',panelHeight:'auto'"
		    				required=true missingMessage="学习形式不能为空!" style="width:173px;" value="${study.dicStudyTypeKey}" >
							</td>
					<th width="10%"><span class="c-red">*</span>学习时间：</th>
							<td><input type="text" name="studyDate" required=true missingMessage="学习时间不能为空!" value="<fmt:formatDate value="${study.studyDate}" pattern="yyyy-MM-dd" />"
								class="Wdate easyui-validatebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
                </tr>
                
                <tr>
                    <th width="10%"><span class="c-red">*</span>学习时长：</th>
							<td><input type="text" name="studyTime" required=true missingMessage="学习时长必须是数字"
								class="f1 easyui-numberbox" min=1  value="${study.studyTime}"/></td>
							<th width="10%"><span class="c-red">*</span>考核人：</th>
							<td><input type="text" name="assessManager" required=true missingMessage="考核人不能为空!"
								class="f1 easyui-textbox" value="${study.assessManager}" /></td>
					<td></td><td></td>
                </tr>
                <tr>
                    <th width="10%">备注：</th>
                    <td colspan="5" align="left">
                    <textArea id="note" name="note" class="easyui-validatebox" style="width: 80%;height:50px;overflow:hidden;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200">${study.note}</textArea>
					<br>
						备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red"> 
						<c:if test="${study.note==null}">0</c:if>
						<c:if test="${study.note!=null}">${fn:length(study.note)}</c:if></em>个字。
                    </td>
                </tr>
                <tr>
            </table>
            </div>
            <div class="easyui-panel" title="矫正人员表现" style="width:100%;padding:10px;">
            <table width="100%">
             <tr>
             	<td style="width:50px"></td>
             	<td align="center">对应矫正人员</td>
					<td style="width:100px" align="center">操作
					</td>
				<td align="center">优秀</td>
				<td align="center">良好</td>
				<td align="center">一般</td>
				<td align="center">差</td>
                </tr>
            <tr>
                <td style="width:50px"></td>    
					<td><select style="width:150px;height:200px;" size=10 multiple="value" id="culprit" name="culprit">
						<c:forEach items="${study.culpritList}" var="culprit">
							<option value="${culprit.id}">${culprit.name}</option>
						</c:forEach>
					</select>
					
					</td>
					<td style="width:100px" align="center">
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="excellent()" >优秀</a><p>
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="good()" >良好</a><p>
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="commonly()" >一般</a><p>
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="difference()" >&nbsp;&nbsp;差&nbsp;&nbsp;</a><p>
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="remove()" >移除</a>
					</td>
					<td><select style="width:150px;height:200px;" size=10 multiple="value" id="excellent" name="excellent">
						<c:forEach items="${study.excellentList}" var="culprit">
							<option value="${culprit.culpritId}">${culprit.culpritName}</option>
						</c:forEach>
					</select>
					
					</td>
					<td><select style="width:150px;height:200px;" size=10 multiple="value" id="good" name="good">
						<c:forEach items="${study.goodList}" var="culprit">
							<option value="${culprit.culpritId}">${culprit.culpritName}</option>
						</c:forEach>
					</select>
					
					</td>
					<td><select style="width:150px;height:200px;" size=10 multiple="value" id="commonly" name="commonly">
					<c:forEach items="${study.commonlyList}" var="culprit">
							<option value="${culprit.culpritId}">${culprit.culpritName}</option>
						</c:forEach>
					</select>
					
					</td>
					<td><select style="width:150px;height:200px;" size=10 multiple="value" id="difference" name="difference">
					<c:forEach items="${study.differenceList}" var="culprit">
							<option value="${culprit.culpritId}">${culprit.culpritName}</option>
						</c:forEach>
					</select>
					
					</td>
                </tr>
            </table>
    </div>
    </form>
    <script>
    function submitForm(){
   	 $('#studyForm').form('submit');
   }
   function clearForm(){
       $('#studyForm').form('clear');
   }
   $(function() {
   	$('#studyForm').form({
   		url:'${ctx}/dailymgr/study/save',
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
        
        
        
        function excellent(){
        	$("#culprit option:selected").each(function(){
        		var excellent="<option value="+$(this).val()+">"+$(this).text()+"</option>";
        		$("#excellent").prepend(excellent);
        		$("#excellents").val($("#excellents").val()+","+$(this).val());
        		$("#culprit option[value='"+$(this).val()+"']").remove();
        	})
        }
        
        function good(){
        	$("#culprit option:selected").each(function(){
        		var good="<option value="+$(this).val()+">"+$(this).text()+"</option>";
        		$("#good").prepend(good);
        		$("#goods").val($("#goods").val()+","+$(this).val());
        		$("#culprit option[value='"+$(this).val()+"']").remove();
        	})
        }
        
        function commonly(){
        	$("#culprit option:selected").each(function(){
        		var commonly="<option value="+$(this).val()+">"+$(this).text()+"</option>";
        		$("#commonly").prepend(commonly);
        		$("#commonlys").val($("#commonlys").val()+","+$(this).val());
        		$("#culprit option[value='"+$(this).val()+"']").remove();
        	})
        }
        
        function difference(){
        	$("#culprit option:selected").each(function(){
        		var difference="<option value="+$(this).val()+">"+$(this).text()+"</option>";
        		$("#difference").prepend(difference);
        		$("#differences").val($("#differences").val()+","+$(this).val());
        		$("#culprit option[value='"+$(this).val()+"']").remove();
        	})
        }
        
        function remove(){
        	$("#excellent option:selected").each(function(){
        		var culprit="<option value="+$(this).val()+">"+$(this).text()+"</option>";
        		$("#culprit").prepend(culprit);
        		var repStr=","+$(this).val();
        		$("#excellents").val($("#excellents").val().replace(repStr,''));
        		$("#excellent option[value='"+$(this).val()+"']").remove();
        	})
        	
        	$("#good option:selected").each(function(){
        		var culprit="<option value="+$(this).val()+">"+$(this).text()+"</option>";
        		$("#culprit").prepend(culprit);
        		var repStr=","+$(this).val();
        		$("#goods").val($("#goods").val().replace(repStr,''));
        		$("#good option[value='"+$(this).val()+"']").remove();
        	})
        	
        	$("#commonly option:selected").each(function(){
        		var culprit="<option value="+$(this).val()+">"+$(this).text()+"</option>";
        		$("#culprit").prepend(culprit);
        		var repStr=","+$(this).val();
        		$("#commonlys").val($("#commonlys").val().replace(repStr,''));
        		$("#commonly option[value='"+$(this).val()+"']").remove();
        	})
        	
        	$("#difference option:selected").each(function(){
        		var culprit="<option value="+$(this).val()+">"+$(this).text()+"</option>";
        		$("#culprit").prepend(culprit);
        		var repStr=","+$(this).val();
        		$("#differences").val($("#differences").val().replace(repStr,''));
        		$("#difference option[value='"+$(this).val()+"']").remove();
        	})
        }
        
        
        $('#excellent').dblclick(function () {  
        	$("#excellent option:selected").each(function(){
        		var culprit="<option value="+$(this).val()+">"+$(this).text()+"</option>";
        		$("#culprit").prepend(culprit);
        		var repStr=","+$(this).val();
        		$("#excellents").val($("#excellents").val().replace(repStr,''));
        		$("#excellent option[value='"+$(this).val()+"']").remove();
        	})
        })  
        
        $('#good').dblclick(function () {  
        	$("#good option:selected").each(function(){
        		var culprit="<option value="+$(this).val()+">"+$(this).text()+"</option>";
        		$("#culprit").prepend(culprit);
        		var repStr=","+$(this).val();
        		$("#goods").val($("#goods").val().replace(repStr,''));
        		$("#good option[value='"+$(this).val()+"']").remove();
        	})
        }) 
        
        $('#commonly').dblclick(function () {  
        	$("#commonly option:selected").each(function(){
        		var culprit="<option value="+$(this).val()+">"+$(this).text()+"</option>";
        		$("#culprit").prepend(culprit);
        		var repStr=","+$(this).val();
        		$("#commonlys").val($("#commonlys").val().replace(repStr,''));
        		$("#commonly option[value='"+$(this).val()+"']").remove();
        	})
        }) 
        
         $('#difference').dblclick(function () {  
        	$("#difference option:selected").each(function(){
        		var culprit="<option value="+$(this).val()+">"+$(this).text()+"</option>";
        		$("#culprit").prepend(culprit);
        		var repStr=","+$(this).val();
        		$("#differences").val($("#differences").val().replace(repStr,''));
        		$("#difference option[value='"+$(this).val()+"']").remove();
        	})
        }) 
        
	
    </script>
</body>
</html>
