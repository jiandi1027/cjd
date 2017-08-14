<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>
<script type="text/javascript">
var accountRold='${sysAccount.roleId}';//司法所处理收监
function imprisonFormatOper(val,row,index){  
	 var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="detail(\''+row.id+'\')">详情</a>';
	
	 if(row.dicJudgeResultKey=='91503'){
		 <shiro:hasPermission name="endcorrect/imprison/caiding">
		 	operation=operation+'&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-access"  data-options="plain:true,iconCls:\'fi-universal-access icon-blue\'"  onclick="caiding(\''+row.id+'\')">裁定收监</a>';
		 </shiro:hasPermission>
	}
	if(row.dicJudgeResultKey!='91503' && row.imprisonDealResult!='91401' && row.imprisonDealResult!='91403'
				&& row.imprisonDealResult!='91404' && row.imprisonDealResult!='91405'){
		<shiro:hasPermission name="endcorrect/imprison/shoujian">
			operation=operation+'&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-elevator" data-options="plain:true,iconCls:\'fi-skull icon-blue\'" onclick="shoujian(\''+row.id+'\')">收监处理</a>';
	    </shiro:hasPermission>
	}
    return operation; 
} 

//详细
function detail(id){
	 parent.$.modalDialog({
         title : '收监执行详情',
         iconCls:'fi-info icon-blue',
         width : sy.getBrowerWidth()-250,
         height : sy.getBrowerHeight()-150,
         resizable:true,
         maximizable:true,
         href : '${ctx}/endcorrect/imprison/detail?id=' + id,
          buttons : [ {
             text : '打印《收监执行建议书》',
             iconCls:'fi-print icon-blue',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#imprisonPrint1');
                 f.click();
             }
         },{
        	 text : '打印《提请收监执行审核表》',
        	 iconCls:'fi-print icon-blue',
             handler : function() {
            	 var f = parent.$.modalDialog.handler.find('#imprisonPrint2');
                 f.click();
             }
         },{
        	 text : '关闭',
             iconCls:'fi-x icon-blue',
             handler : function() {
            	 parent.$.modalDialog.handler.dialog('close');
             }
         }] 
     });

}

$(function() {
	
	//不同收监结果处理
	 var results =$('input[name="imprisonDealResult"]'); 
	 if($('input[name="imprisonDealResult"]:checked').val()=='91401'){
		$('#t3').css("display","none");
		$('#t4').css("display","none");
		$('#t5').css("display","none");
		$('#t6').css("display","none");
		$('#t7').css("display","none");
		$('#imprisonDate').validatebox({disabled:false});
		$('#prisonName').textbox({'disabled':false});
		$('#imprison_reportDate').validatebox({disabled:true});
		$('#imprison_organizationName').textbox({'disabled':true});
		$('#imprison_reportPersonName').textbox({'disabled':true});
		$('#opposeReason').validatebox({disabled:true});
	} 
	 for(var i=0;i<results.length;i++){
		results[i].onclick=function(){
			var result=$('input[name="imprisonDealResult"]:checked').val();
			if(result=='91401'){
				$('#t1').show();
				$('#t2').show();
				$('#t3').css("display","none");
				$('#t4').css("display","none");
				$('#t5').css("display","none");
				$('#t6').css("display","none");
				$('#t7').css("display","none");
				$('#imprisonDate').validatebox({disabled:false});
				$('#prisonName').textbox({disabled:false});
				$('#imprison_reportDate').validatebox({disabled:true});
				$('#imprison_organizationName').textbox({disabled:true});
				$('#imprison_reportPersonName').textbox({disabled:true});
				$('#opposeReason').validatebox({disabled:true});
			}else if(result=='91402'){
				$('#t1').css("display","none");
				$('#t2').css("display","none");
				$('#t3').show();
				$('#t4').show();
				$('#t5').show();
				$('#t6').css("display","none");
				$('#t7').css("display","none");
				$('#imprisonDate').validatebox({disabled:true});
				$('#prisonName').textbox({disabled:true});
				$('#imprison_reportDate').validatebox({disabled:false});
				$('#imprison_organizationName').textbox({disabled:false});
				$('#imprison_reportPersonName').textbox({disabled:false});
				$('#opposeReason').validatebox({disabled:true});
			}else{
				$("#endCaseUpload").empty();
				$("#endCaseUpload").powerWebUpload({ auto: true,fileNumLimit:3,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});	
				$('#t1').css("display","none");
				$('#t2').css("display","none");
				$('#t3').css("display","none");
				$('#t4').css("display","none");
				$('#t5').css("display","none");
				$('#t6').show();
				$('#t7').show();
				$('#imprisonDate').validatebox({disabled:true});
				$('#prisonName').textbox({disabled:true});
				$('#imprison_reportDate').validatebox({disabled:true});
				$('#imprison_organizationName').textbox({disabled:true});
				$('#imprison_reportPersonName').textbox({disabled:true});
				$('#opposeReason').validatebox({disabled:false});
			}
		}
	} 
});



function caiding(id){
	$('#dicJudgeResultKey1').attr('checked','checked'); 
	$('#imprisonId').val(id);
	$("#judgeUpload").empty();
	$("#judgeUpload").powerWebUpload({ auto: true,fileNumLimit:3,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});	
	$('#caiding').dialog('open');
	$('#caiding').window('center');
}
function shoujian(id){
	$('#imprisonDealResult1').attr('checked','checked'); 
	$('#t1').show();
	$('#t2').show();
	$('#t3').css("display","none");
	$('#t4').css("display","none");
	$('#t5').css("display","none");
	$('#t6').css("display","none");
	$('#t7').css("display","none");
	$('#imprisonDate').validatebox({disabled:true});
	$('#prisonName').textbox({disabled:false});
	$('#imprison_reportDate').validatebox({disabled:true});
	$('#imprison_organizationName').textbox({disabled:true});
	$('#imprison_reportPersonName').textbox({disabled:true});
	$('#opposeReason').validatebox({disabled:true});
	$('#imprisonId1').val(id);
	$('#shoujian').dialog('open');
	$('#shoujian').window('center');
}


//保存裁定处理
function saveCaiDing(){
	setFilePathAndName('judgeUpload');
	 if($("#saveCaiding").form('validate')){
			$.ajax({
				type: 'post' ,
				url: '${ctx}/endcorrect/imprison/save',
				cache:false ,
				async : false, //同步请求
				data:$('#saveCaiding').serialize() ,
				dataType:'json',
				success:function(data){
					$.messager.show({
	  					title:'提示信息!',
	  					msg:data.msg
	  				});
					$('#caiding').dialog('close');
					$('#saveCaiding').form('clear'); 
					$('#t_imprison_list_content').datagrid('load', {});
				} ,
				error:function(data){
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
}	

//保存收监处理
function saveShoujian(){
	setFilePathAndName('endCaseUpload');
	 if($("#saveShoujian").form('validate')){
			$.ajax({
				type: 'post' ,
				url: '${ctx}/endcorrect/imprison/save',
				cache:false ,
				data:$('#saveShoujian').serialize() ,
				dataType:'json',
				success:function(data){
					$.messager.show({
	  					title:'提示信息!',
	  					msg:data.msg
	  				});
					$('#shoujian').dialog('close');
					$('#saveShoujian').form('clear'); 
					$('#t_imprison_list_content').datagrid('load', {});
				} ,
				error:function(data){
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
}	

function formatResultKey(val, row, index){
	if(val=='91503'){
		return '<span style="color:red">待处理<span>';
	}else{
		return sy.getDicValue('SF_IMPRISON','DIC_JUDGE_RESULT_KEY',row.dicJudgeResultKey,'');
	}
}

function formatDealResult(val, row, index){
	if(val=='91406'){
		return '<span style="color:red">待处理<span>';
	}else{
		return sy.getDicValue('SF_IMPRISON','IMPRISON_DEAL_RESULT',row.imprisonDealResult,'');
	}
}

function countChar(textareaName,spanName,count){  
	var length=count -$('#'+textareaName).val().length;
	if(length<0){
		length==0;
	}
	$('#'+spanName).html(length); 
}    
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	  <form id="imprisonSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	 <div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
       <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
          <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="t_imprison_list_content"/>
          </c:if>
           <div class="easyui-panel search-form" data-options="fit:true,border:false" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目</c:if>" style="width:100%;">
			<table>
				<tr>
				<td class="search-title">矫正对象：</td>
					<td><input name="culprit.name" class="easyui-textbox"   /></td>
				</tr>
				<tr>
				<td class="search-title">申请起始：</td>
					<td><input name="searchStartDate" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"  editable="false"  /></td>
				</tr>
				<tr>
				<td class="search-title" style="text-align:right">申请截止：</td>
					<td><input name="searchEndDate" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"  editable="false"  /></td>
				</tr>
				<tr>
					<td class="search-title">收监类型：</td>
						<td>
						<input name="dicImprisonTypeKey" id="search_dicImprisonTypeKey" class="easyui-combobox" data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=comme_table&columnName=DIC_IMPRISON_TYPE_KEY&parentKey=913000&showAll=1',panelHeight:'auto',editable:false"/>
						</td>
				</tr>
				<tr>
					<td class="search-title">裁定结果：</td>
						<td>
							<input name="dicJudgeResultKey" id="search_dicJudgeResultKey" class="easyui-combobox" data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_IMPRISON&columnName=DIC_JUDGE_RESULT_KEY&parentKey=915000&showAll=1',panelHeight:'auto',editable:false"/>
						</td>
				</tr>
				<tr>
					<td class="search-title">处理结果：</td>
						<td>
							<input name="imprisonDealResult" id="search_imprisonDealResult" class="easyui-combobox" data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=SF_IMPRISON&columnName=IMPRISON_DEAL_RESULT&parentKey=914000&showAll=1',panelHeight:'auto',editable:false"/>
						</td>
				</tr>
			</table>
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
		 <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:$('#t_imprison_list_content').datagrid('load' ,$.serializeObject($('#imprisonSearchForm')));"
		 				id="searchDetachedBtn">查询</a> &nbsp;&nbsp; 
			<a href="#" class="easyui-linkbutton"  iconCls="icon-undo" onclick="javascript:$('#search_dicImprisonTypeKey').combobox('reset');$('#search_dicJudgeResultKey').combobox('reset');$('#search_imprisonDealResult').combobox('reset');$('#imprisonSearchForm').form('clear');$('#t_imprison_list_content').datagrid('load', {});">清空</a></div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="t_imprison_list_content" title="收监执行列表"
			data-options="singleSelect:true,fit:true,rownumbers:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize:15,
			pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/endcorrect/imprison/list',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-linkbutton-access').linkbutton({text:'裁定收监',plain:true,iconCls:'fi-universal-access icon-blue'});
                       $('.organization-easyui-linkbutton-elevator').linkbutton({text:'收监处理',plain:true,iconCls:'fi-skull icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'culpritName',width:'10%',align:'center'">矫正对象</th>
					<th data-options="field:'groupName',width:'10%',align:'center'">司法所</th>
					<th data-options="field:'applyDate',width:'10%',align:'center',sortable:true">申请提交时间</th>
					<th data-options="field:'dicImprisonTypeKey',width:'15%',align:'center',
						formatter:function(value,rowData,rowIndex){    
				return sy.getDicValue('comme_table','DIC_IMPRISON_TYPE_KEY',rowData.dicImprisonTypeKey,'');}">收监类型</th>
					<th data-options="field:'dicJudgeResultKey',width:'15%',align:'center',
						formatter:formatResultKey">裁定结果</th>
					<th data-options="field:'imprisonDealResult',width:'15%',align:'center',
						formatter:formatDealResult">处理结果</th>
				 	<th data-options="field:'_opt',width:'23%',formatter:imprisonFormatOper,align:'center'">操作</th>  

				</tr>
			</thead>
		</table>
	</div>
	<div id="caiding" class="easyui-dialog" title="裁定处理" style="width:450px;padding:5px;"   
        data-options="closed:true,iconCls:'fi-universal-access icon-blue',resizable:true,maximizable:true,modal: true,
        buttons : [ {
             text : '保存',
             iconCls:'icon-save',
             handler : function() {
            	 saveCaiDing();
             }
         },{
        	 text : '关闭',
             iconCls:'fi-x icon-blue',
             handler : function() {
            	 $('#saveCaiding').form('clear'); $('#caiding').dialog('close');
             }
         }] ">
        <form id="saveCaiding">
        <input type="hidden" name="id" id="imprisonId"/> 
        <table width="100%" class="grid">
        	<tr>
        		<th width="30%">裁定结果：</th>
        		<td width="70%"><input type="radio" name="dicJudgeResultKey" value="91501" id="dicJudgeResultKey1"/>同意
        		&nbsp;&nbsp;&nbsp; &nbsp;
        		<input type="radio" name="dicJudgeResultKey" value="91502"/>拒绝
        		</td>
        	</tr>
        	<tr>
        		<th><span style="color:red">*</span>裁定机关名称：</th>
        		<td><input class="easyui-textbox" required=true missingMessage="请输入裁定机关名称" name="judgeOrg"/></td>
        	</tr>
        	<tr>
        		<th ><span style="color:red">*</span>裁定时间：</th>
        		<td><input class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" required=true missingMessage="请填入裁定时间" name="judgeTime"/></td>
        	</tr>
        	<tr>
        		<th>裁定文书：</th>
        		<td><div id="judgeUpload"></div>
        			<input type="hidden" name="judgeUploadUrl" id="judgeUrl">
	     			<input type="hidden" name="judgeUploadPathName" id="judgePathName" >
					<input type="hidden" name="judgeUploadPath" id="judgePath" >
				</td>
        	</tr>
         </table>
         </form>
	</div> 
	<div id="shoujian" class="easyui-dialog" title="收监处理" style="width:550px;padding:5px;" 
	data-options="closed:true,iconCls:'fi-skull icon-blue',resizable:true,maximizable:true,modal: true,
	buttons : [ {
             text : '保存',
             iconCls:'icon-save',
             handler : function() {
            	saveShoujian();
             }
         },{
        	 text : '关闭',
             iconCls:'fi-x icon-blue',
             handler : function() {
            	 $('#saveShoujian').form('clear'); $('#shoujian').dialog('close');
             }
         }] ">
        <form id="saveShoujian">  
        <input type="hidden" name="id" id="imprisonId1"/> 
        <table width="100%" class="grid">
        	<tr>
        		<th width="30%">收监处理：</th>
        		<td width="70%">
        			<p><input type="radio" name="imprisonDealResult" value="91401" id="imprisonDealResult1"/>完成收监
        				&nbsp;&nbsp;&nbsp; &nbsp;
        				<input type="radio" name="imprisonDealResult" value="91402"/>在逃
        			<p>
        			<p><input type="radio" name="imprisonDealResult" value="91403"/>监狱拒收
        				&nbsp;&nbsp;&nbsp; &nbsp;
        				<input type="radio" name="imprisonDealResult" value="91404"/>死亡
        			<p>
        			<p><input type="radio" name="imprisonDealResult" value="91405" />监狱管理局驳回<p>
        		</td>
        	</tr>
        	<tr id="t1">
        		<th><span style="color:red">*</span>收监时间：</th>
        		<td><input class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" required=true  missingMessage="请填入收监时间" name="imprisonDate" id="imprisonDate"/></td>
        	</tr>
        	<tr id="t2">
        		<th><span style="color:red">*</span>关押监狱名称：</th>
        		<td><input class="easyui-textbox" required=true missingMessage="请输入监狱名称" name="prisonName" id="prisonName"/></td>
        	</tr>
        	<tr  id="t3" >
        		<th><span style="color:red">*</span>通报时间：</th>
        		<td><input class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"  editable="false"  required=true name="reportDate" id="imprison_reportDate"/></td>
        	</tr>
        	<tr  id="t4">
        		<th><span style="color:red">*</span>公安机关名称：</th>
        		<td><input class="easyui-textbox" required=true missingMessage="请输入公安机关名称" name="organizationName" id="imprison_organizationName" /></td>
        	</tr>
        	<tr  id="t5">
        		<th><span style="color:red">*</span>通报人：</th>
        		<td><input class="easyui-textbox" required=true missingMessage="请输入通报人" name="reportPersonName" id="imprison_reportPersonName"  /></td>
        	</tr> 
        	<tr  id="t7">
        		<th><span style="color:red">*</span>处理理由：</th>
        		<td>
        			<textarea  name="opposeReason" id="opposeReason" class="easyui-validatebox"  multiline="true" required=true missingMessage="请输入理由!" 
							onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)'
							style="width:80%;height:80px;overflow:hidden;" maxlength=200></textarea>
							<br/>
						<p class="textarea-numberbar">
							备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
						</p>
        			</td>	
        	</tr>
        	<tr id="t6">
        		<th>结案报告附件：</th>
        		<td><div id="endCaseUpload"></div>
	     			<input type="hidden" name="endCaseUploadUrl" id="endCaseUrl">
	     			<input type="hidden" name="endCaseUploadPathName" id="endCasePathName">
					<input type="hidden" name="endCaseUploadPath" id="endCasePath">
        	</tr>
        	
        </table>
        </form>
	</div>   
</div>
