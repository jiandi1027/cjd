<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<form action="${ctx}/dailymgr/interview/save" method="post" id="interviewfrom">
	<input type="hidden" name="id" id="paroleId" value="${interview.id }"/>
 	<c:choose>
 		<c:when test="${empty interview.culpritId }">
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="interviewfrom" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${interview.culpritId}" formId="interviewfrom" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 	
	<div class="easyui-panel" title="走访登记信息" style="width: 100%; padding: 5px;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%"><span class="c-red">*</span>走访人：</th>
				<td width="23%">
					<input value="${interview.interviewPerson }" required="true" missingMessage="走访人不能为空！" name="interviewPerson" id="interviewPerson" 
					class = "easyui-combobox" data-options='panelHeight : "auto",panelMaxHeight : "200"' /></td>
				<th width="10%"><span class="c-red">*</span>走访日期：</th>
				<td width="23%" style="border:0px solid;">
					<input name="interviewDate" id="interviewDate" class="Wdate easyui-validatebox" value="<fmt:formatDate value="${interview.interviewDate}" pattern="yyyy-MM-dd" />"
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd'})"  required=true />
				</td>
				<td style="border:0px solid;" width="10%"></td>
				<td style="border:0px solid;" width="23%"></td>
			</tr>
			<tr>
				<th >走访对象：</th>
				<td>
				<input id="zfdx" name="zfdx" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_INTERVIEW&columnName=ZFDX&parentKey=144000',panelHeight:'auto'"
		    				style="width:173px;" value="${interview.zfdx}" >
				</td>
				<th>走访原因：</th>
				<td>
				<input id="interviewReason" name="interviewReason" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_INTERVIEW&columnName=INTERVIEW_REASON&parentKey=158000',panelHeight:'auto'"
		    				style="width:173px;" value="${interview.interviewReason}" >
				</td>
				<th>行动能力：</th>
				<td>
				<input id="xdnl" name="xdnl" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_INTERVIEW&columnName=XDNL&parentKey=159000',panelHeight:'auto'"
		    				style="width:173px;" value="${interview.xdnl}" >
				</td>
			</tr>
			<tr>
				<th>健康状况：</th>
				<td>
				<input id="jkzk" name="jkzk" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_INTERVIEW&columnName=JKZK&parentKey=160000',panelHeight:'auto'"
		    				style="width:173px;" value="${interview.jkzk}" >
				</td>
				<th>不良嗜好：</th>
				<td>
				<input id="blsh" name="blsh" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_INTERVIEW&columnName=BLSH&parentKey=161000',panelHeight:'auto'"
		    				style="width:173px;" value="${interview.blsh}" >
				</td>
				<th>生活来源：</th>
				<td>
				<input id="shly" name="shly" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_INTERVIEW&columnName=SHLY&parentKey=162000',panelHeight:'auto'"
		    				style="width:173px;" value="${interview.shly}" >
				</td>
			</tr>
			<tr>
				<th>经济情况：</th>
				<td>
				<input id="jjqk" name="jjqk" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_INTERVIEW&columnName=JJQK&parentKey=163000',panelHeight:'auto'"
		    				style="width:173px;" value="${interview.jjqk}" >
				</td>
				<th>婚姻情况：</th>
				<td>
				<input id="hyqk" name="hyqk" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_INTERVIEW&columnName=HYQK&parentKey=164000',panelHeight:'auto'"
		    				style="width:173px;" value="${interview.hyqk}" >
				</td>
				<th>居住情况：</th>
				<td>
				<input id="jzqk" name="jzqk" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_INTERVIEW&columnName=JZQK&parentKey=165000',panelHeight:'auto'"
		    				style="width:173px;" value="${interview.jzqk}" >
				</td>
			</tr>
			<tr>
				<th>活动情况：</th>
				<td>
				<input id="hdqk" name="hdqk" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_INTERVIEW&columnName=HDQK&parentKey=166000',panelHeight:'auto'"
		    				style="width:173px;" value="${interview.hdqk}" >
				</td>
				<th>重大变故：</th>
				<td>
				<input id="zdbg" name="zdbg" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_INTERVIEW&columnName=ZDBG&parentKey=167000',panelHeight:'auto'"
		    				style="width:173px;" value="${interview.zdbg}" >
				</td>
				<th>近期表现：</th>
				<td>
				<input id="jqbx" name="jqbx" class="easyui-combobox" data-options="valueField:'id',textField:'value',limitToList:'true',
		    				url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_INTERVIEW&columnName=JQBX&parentKey=168000',panelHeight:'auto'"
		    				style="width:173px;" value="${interview.jqbx}" >
				</td>
			</tr>
		    <tr>
	            <th><span class="c-red">*</span>走访地点：</th>
                <td colspan="5">
                	<input name="addressPro" id="addressPro" class="easyui-combobox" required=true value='${interview.addressPro }'
                		data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"/>省
					<input name="addressCity" id="addressCity" class="easyui-combobox" required=true value='${interview.addressCity}'
						data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"/>市
					<input name="addressCountry" id="addressCountry" class="easyui-combobox" required=true value='${interview.addressCountry }' 
						data-options="panelMaxHeight:'200',panelHeight:'auto',limitToList:'true'"/>县（区）
					<input name="addressStreet" id="addressStreet" class="easyui-textbox" value='${interview.addressStreet }' />乡镇（街道）
					<input name="addressDetail" id="addressDetail" class="easyui-textbox" value='${interview.addressDetail }' />（详细门牌号）
				</td>
			</tr>
		    <tr>
                    <th width="10%">附件：</th>
                    <td colspan="5" align="left" width="89%">
                    	<div id="uploader"></div>
						<div id="wtdchUploadIng">
						<c:forEach var="sysFile" items="${fileList}">
						<div id="file_${sysFile.id}">
						${sysFile.originName}
						<div class="webuploadDelbtn" onclick="sysFileDel('${sysFile.id}')">删除</div>
						<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
						</div>
						</c:forEach>
						</div>
                    </td>
                </tr>
			<tr>
                <th>具体走访情况：</th>
				<td colspan="5">
					<textArea id="interviewCondition" name="interviewCondition" class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" maxlength="200">${interview.interviewCondition }</textArea>
					<br>备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red"> 
					<c:if test="${interview.interviewCondition==null}">0</c:if>
					<c:if test="${interview.interviewCondition!=null}">${fn:length(interview.interviewCondition)}</c:if></em>个字。
				</td>
		    </tr>
		</table>           
    </div>
</form>
<script>
/* var reportType;
var zfdx = "${interview.zfdx }";
var interviewReason = "${interview.interviewReason }";
var xdnl = "${interview.xdnl }";
var jkzk = "${interview.jkzk }";
var blsh = "${interview.blsh }";
var shly = "${interview.shly }";
var jjqk = "${interview.jjqk }";
var hyqk = "${interview.hyqk }";
var jzqk = "${interview.jzqk }";
var hdqk = "${interview.hdqk }";
var zdbg = "${interview.zdbg }";
var jqbx = "${interview.jqbx }";
$('#zfdx').combo({    
    value:zfdx
});
$('#interviewReason').combo({    
    value:interviewReason
});
$('#xdnl').combo({    
    value:xdnl
});
$('#jkzk').combo({    
    value:jkzk
});
$('#blsh').combo({    
    value:blsh
});
$('#shly').combo({    
    value:shly
});
$('#jjqk').combo({    
    value:jjqk
});
$('#hyqk').combo({    
    value:hyqk
});
$('#jzqk').combo({    
    value:jzqk
});
$('#hdqk').combo({    
    value:hdqk
});
$('#zdbg').combo({    
    value:zdbg
});   */
function submitForm(){
	 $('#interviewfrom').form('submit');
}
function clearForm(){
    $('#interviewfrom').form('clear');
}
$('.easyui-combobox').combo({    
    edit:false
});
$(function() {
	$("#uploader").powerWebUpload({ auto: true,fileNumLimit:5,fileSingleSizeLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
	
	$('#interviewfrom').form({
		url:'${ctx}/dailymgr/interview/save',
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
				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
	            parent.$.modalDialog.handler.dialog('close');
			}else{
				$.messager.show({
					title:'提示信息!' ,
					msg:data.msg
				});
			}
		}
	});
});
/*选择固定居住省触发省下面的市*/
   		$('#addressPro').combobox({    
   			onSelect: function(record){
        		$('#addressCity').combobox({    
        			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
        		    valueField:'id',    
        		    textField:'areaName',
        		    onLoadSuccess:function(){
    	       			var data = $('#addressCity').combobox('getData');
    	       			//alert('${talk.addressPro}          '+$('#addressPro').combobox('getValue'));
                 		if (data.length > 0) {
                 			if($('#addressPro').combobox('getValue')=='${interview.addressPro}'){
                 				$('#addressCity').combobox('select', '${interview.addressCity}');
                 			}else{
                 				$('#addressCity').combobox('setValue', '');
                 				$('#addressCountry').combobox('setValue', '');
                 			}
                 		} 
                 		
    	       		},
        		    editable:'false'    
        		}); 
			}   
   		
   		}); 
       
/*选择固定市触发市下面的县*/
       $('#addressCity').combobox({
       		onSelect: function(record){
       			$('#addressCountry').combobox({    
       			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
       		    valueField:'id',    
       		    textField:'areaName',
       		 onLoadSuccess:function(){
    		 		$('#addressCountry').combobox('setValue', '');
     			var data = $('#addressCountry').combobox('getData');
 	      		if (data.length > 0) {
 	      			//alert('${talk.addressCity}          '+$('#addressCity').combobox('getValue'));
 	      			if($('#addressCity').combobox('getValue')=='${interview.addressCity}'){
         				$('#addressCountry').combobox('select', '${interview.addressCountry}');
         			}else{
         				$('#addressCountry').combobox('setValue', '');
         			}
 	      		} 
     			
     		},
    		    editable:'false' 
       	
       			}); 
			}
		});
      
$('#interviewPerson').combobox({    
	mode : 'remote',
    url:'${ctx}/sys/sysAccount/findSysAccount?groupId='+'${fns:getSysAccount().groupId }',    
    valueField:'id',    
    textField:'accountname'
});
</script>
