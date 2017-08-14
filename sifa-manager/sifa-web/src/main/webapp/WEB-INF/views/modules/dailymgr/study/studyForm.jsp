<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>学习教育</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>

<body>
 <form  action="${ctx}/dailymgr/study/save" method="post" id="culpritInfo">
	<input type="hidden" id="id" name="id" value="${study.id}"></input>
	<input type="hidden" id="excellents" name="excellents" value="${study.excellents}"></input>
	<input type="hidden" id="goods" name="goods" value="${study.goods}"></input>
	<input type="hidden" id="commonlys" name="commonlys" value="${study.commonlys}"></input>
	<input type="hidden" id="differences" name="differences" value="${study.differences}"></input>
    
   
     <div class="easyui-panel" title="学习教育" style="width:100%;padding:10px;">
            <table width="100%">

                <tr>
                    <td><span class="c-red">*</span>学习内容:</td>
							<td><input type="text" name="studyContent" required=true missingMessage="学习内容不能为空!"
								class="f1 easyui-textbox" value="${study.studyContent}" /></td>
							<td><span class="c-red">*</span>学习形式:</td>
							<td><select　id="dicStudyTypeKey" name="dicStudyTypeKey" class="easyui-combobox" required=true missingMessage="学习形式不能为空!" style="width:150px;">
							 <option value=""></option>
                    	<c:forEach items="${fns:getSysDicList('SF_STUDY','DIC_STUDY_TYPE_KEY','15000') }" var="sysDic">
                    		<option value="${sysDic.key }" <c:if test='${sysDic.key==study.dicStudyTypeKey}'> selected="selected"</c:if>>${sysDic.value}</option>
                    	</c:forEach>
                    </select></td>
					<td><span class="c-red">*</span>学习时间:</td>
							<td><input type="text" name="studyDate" required=true missingMessage="学习时间不能为空!" value="<fmt:formatDate value="${study.studyDate}" pattern="yyyy-MM-dd HH:mm:ss" />"
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
                </tr>
                
                <tr>
                    <td><span class="c-red">*</span>学习时长:</td>
							<td><input type="text" name="studyTime" required=true missingMessage="学习时长必须是数字"
								class="f1 easyui-numberbox"  value="${study.studyTime}"/></td>
							<td><span class="c-red">*</span>考核人:</td>
							<td><input type="text" name="assessManager" required=true missingMessage="考核人不能为空!"
								class="f1 easyui-textbox" value="${study.assessManager}" /></td>
					<td></td><td></td>
                </tr>
                <tr>
                    <td>备注:</td>
                    <td colspan="5" align="left"><textarea rows="3" cols="124" id="note" name="note" style="height:50px;">${study.note}</textarea></td>
                </tr>
                <tr>
            </table>
            </div>
            <div class="easyui-panel" title="矫正人员表现" style="width:100%;padding:10px;">
            <table width="100%">
             <tr>
             	<td style="width:50px"></td>
             	<td>对应矫正人员</td>
					<td style="width:100px">操作
					</td>
				<td>优秀</td>
				<td>良好</td>
				<td>一般</td>
				<td>差</td>
                </tr>
            <tr>
                <td style="width:50px"></td>    
					<td><select style="width:150px;" size=10 multiple="value" id="culprit" name="culprit">
						<c:forEach items="${study.culpritList}" var="culprit">
							<option value="${culprit.id}">${culprit.name}</option>
						</c:forEach>
					</select>
					
					</td>
					<td style="width:100px">
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="excellent()" >优秀</a><p>
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="good()" >良好</a><p>
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="commonly()" >一般</a><p>
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="difference()" >&nbsp;&nbsp;差&nbsp;&nbsp;</a><p>
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="remove()" >移除</a>
					</td>
					<td><select style="width:150px;" size=10 multiple="value" id="excellent" name="excellent">
						<c:forEach items="${study.excellentList}" var="culprit">
							<option value="${culprit.culpritId}">${culprit.culpritName}</option>
						</c:forEach>
					</select>
					
					</td>
					<td><select style="width:150px;" size=10 multiple="value" id="good" name="good">
						<c:forEach items="${study.goodList}" var="culprit">
							<option value="${culprit.culpritId}">${culprit.culpritName}</option>
						</c:forEach>
					</select>
					
					</td>
					<td><select style="width:150px;" size=10 multiple="value" id="commonly" name="commonly">
					<c:forEach items="${study.commonlyList}" var="culprit">
							<option value="${culprit.culpritId}">${culprit.culpritName}</option>
						</c:forEach>
					</select>
					
					</td>
					<td><select style="width:150px;" size=10 multiple="value" id="difference" name="difference">
					<c:forEach items="${study.differenceList}" var="culprit">
							<option value="${culprit.culpritId}">${culprit.culpritName}</option>
						</c:forEach>
					</select>
					
					</td>
                </tr>
                <tr>
                <td align="center" colspan="6">
                	<a id="btn1" href="javascript:void(0)" class="easyui-linkbutton" >提交</a>
	    			<a href="javascript:void(0)" class="easyui-linkbutton" >重置</a>
                </td>
                </tr>
            </table>
    </div>
    </form>
    <script>
        function clearForm(){
            $('#culpritInfo').form('clear');
        }
        $(function() {
        	$('#btn1').click(function(){excellent
        		if($('#culpritInfo').form('validate')==true){
        			$('#culpritInfo').submit();
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
