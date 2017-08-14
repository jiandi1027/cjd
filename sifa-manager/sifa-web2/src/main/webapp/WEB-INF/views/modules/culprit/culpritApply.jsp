<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<table class="easyui-datagrid" id="first_report_list_content" 
			style="height:400px" data-options="singleSelect:true,fit:true,collapsible:false,striped:true,fitColumns:true,rownumbers:true">
			<thead>
				<tr>
					<th data-options="field:'studyDate',width:'50%',align:'center'">首次报到事项</th>
				 	<th data-options="field:'_opt',width:'29%',align:'center'">操作</th>
				 	<th data-options="field:'_opt1',width:'21%',align:'center'">完成标识</th>  
				</tr>
			</thead>
			<tbody>   
		        <tr>  
 					<td>社区矫正人员脸谱指纹信息采集</td>
	           		<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-torsos-all icon-blue',plain:true" onclick="iface('${culprit.id}')"><strong>IFACE登记</strong></a></td>
		        	<td><span style="color:red;" name="finish" id="finshInfo1"><c:if test="${culprit.finshInfo1==1 }">已完成</c:if></span></td>
		        </tr>   
		        <tr>   
		            <td>社区矫正人员首次谈话笔录</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-pencil icon-blue',plain:true" onclick="firstTalk('${culprit.id}')"><strong>录入</strong></a></td>   
		        	<td><span style="color:red;" name="finish" id="finshInfo2"><c:if test="${culprit.finshInfo2==1 }">已完成</c:if></span></td>
		        </tr>
		         <tr> 
		            <td>社区矫正人员资料</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-pencil icon-blue',plain:true" onclick="updateInformation('${culprit.id}')"><strong>录入</strong></a></td>   
		        	<td><span style="color:red;" name="finish" id="finshInfo3"><c:if test="${culprit.finshInfo3==1 }">已完成</c:if></span></td>
		        </tr> 
		        <tr>  
		            <td>建立矫正小组</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-torso icon-blue',plain:true" onclick="monitor('${culprit.id}')"><strong>录入</strong></a></td>   
		        	<td><span style="color:red;" name="finish" id="finshInfo4"><c:if test="${culprit.finshInfo4==1 }">已完成</c:if></span></td>
		        </tr>
		         <tr>  
		            <td>监管人员指定</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-torso icon-blue',plain:true" onclick="supervisor('${culprit.id}')"><strong>监管人员</strong></a></td>   
		        	<td><span style="color:red;" name="finish" id="finshInfo9"><c:if test="${culprit.finshInfo9==1 }">已完成</c:if></span></td>
		        </tr>
		        <tr>   
		            <td>建立矫正方案</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-pencil icon-blue',plain:true" onclick="scheme('${culprit.id}')"><strong>录入</strong></a></td>   
		        	<td><span style="color:red;" name="finish" id="finshInfo5"><c:if test="${culprit.finshInfo5==1 }">已完成</c:if></span></td>
		        </tr>
		        <tr>   
		            <td>社区服刑人员入矫宣告书</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="printXGS('${culprit.id}')"><strong>打印</strong></a></td>   
		        	<td><span style="color:red;" name="finish" id="finshInfo6"><c:if test="${culprit.finshInfo6==1 }">已完成</c:if></span></td>
		        </tr>
		        <tr>   
		            <td>社区矫正小组责任书</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue',plain:true" onclick="printZRS('${culprit.id}')"><strong>打印</strong></a></td>   
		        	<td><span style="color:red;" name="finish" id="finshInfo7"><c:if test="${culprit.finshInfo7==1 }">已完成</c:if></span></td>
		        </tr>
		        <tr>   
		            <td>社区矫正志愿者帮教协议书</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-arrow-up icon-blue',plain:true" onclick="bjxy('${culprit.id}')"><strong>上传</strong></a></td>   
		        	<td><span style="color:red;" name="finish" id="finshInfo8"><c:if test="${culprit.finshInfo8==1 }">已完成</c:if></span></td>
		        </tr> 
		         <tr>   
		            <td>监管等级确定</td>
		            <td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-pencil icon-blue',plain:true" onclick="gradeChange('${culprit.id}')"><strong>变更</strong></a></td>   
		        	<td>（<span id="gradeResult"><c:if test="${culprit.dicMonitorGradeKey ne 27005 }">严管</c:if><c:if test="${culprit.dicMonitorGradeKey eq 27005 }">特殊类监管</c:if></span>）<span style="color:red;">已完成</span></td>
		        </tr>    
		    </tbody>   
			
		</table> 
		<div id="schemeDialog"></div>
		<div id="firstGradeDialog"></div>
		<div id="firstTalkDialog"></div>
		<div id="monitorDialog"></div>
		<div id="bjxyDialog"></div>
		<div id="supervisorDialog"></div>
<div id="culpritApply"></div>
<script type="text/javascript">
$(function(){
	
});

function iface(id){
	$.ajax({
		type : 'post',
		url : '${ctx}/culpritinfo/culprit/updateFinshInfo?id='+id+'&finshInfo1=1',
		dataType : 'json',
		cache : false,
		async : false, //同步请求
		success : function(result) {
			$('#finshInfo1').html('已完成');
		},
		error : function(result) {
			
		}
	});
}

//编辑个人资料
function updateInformation(id) {
	/* 将自建的div先clone，在close时将克隆的div重新append到页面上。 */
	var dialogParent = $('#culpritApply').parent();  
    var dialogOwn = $('#culpritApply').clone();  
    dialogOwn.hide();  
	 $('#culpritApply').dialog({ 
			 onClose : function() {
				 dialogOwn.appendTo(dialogParent);  
	             $(this).dialog("destroy").remove();
	         }, 
		    title: '录入个人资料',    
		    width : sy.getBrowerWidth() - 250,
			height : sy.getBrowerHeight() - 150,
			iconCls : 'fi-pencil icon-blue',
			loadingMessage:'加载中...',
		    resizable:true,
	        maximizable:true,
		    href : '${ctx}/dailymgr/fileManagement/update?id='+id,
		    modal: true,
		    buttons :[ {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#culpritApply').dialog('close');
				}
			}]
		}); 
	 
	  $.ajax({
			type : 'post',
			url : '${ctx}/culpritinfo/culprit/updateFinshInfo?id='+id+'&finshInfo3=1',
			dataType : 'json',
			cache : false,
			async : false, //同步请求
			success : function(result) {
				$('#finshInfo3').html('已完成');
			},
			error : function(result) {
				
			}
		}); 
}

//监管人员
function supervisor(culpritId){
	$('#supervisorDialog').dialog({
		href:"${ctx}/culpritinfo/culprit/supervisorForm?culpritId=" + culpritId,
		title:'监管人员指定',
		width : 400,
	    height :180,
	    iconCls:'fi-pencil icon-blue',
	    resizable:true,
        maximizable:true,
		shadow:false,
	    modal:true,
        loadingMessage:'加载中...',
        buttons :[{
			text:'保存',
            iconCls:'fi-print icon-blue',
			handler:function(){
				$('#supervisor_saveform_btn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#supervisorDialog').dialog('close');
			}
		}]
	});
	
}


//录入矫正小组
function monitor(culpritId){
	$('#monitorDialog').dialog({
		href:"${ctx}/culpritinfo/Monitor/addMonitor?culpritId=" + culpritId,
		title:'矫正小组录入',
		width : sy.getBrowerWidth() - 400,
	    height :600,
	    iconCls:'fi-pencil icon-blue',
		shadow:false,
	    modal:true,
	    resizable:true,
        maximizable:true,
        loadingMessage:'加载中...',
        buttons:[{
        	 text : '关闭',
             iconCls:'fi-x icon-blue',
             handler : function() {
             	$('#monitorDialog').dialog('close');
             }
        }]
	});
	$('#monitorDialog').window('center');

};


//新增矫正方案
function scheme(culpritId){
	$('#schemeDialog').dialog({
		href:"${ctx}/sys/scheme/addScheme?culpritId=" + culpritId,
		title:'矫正方案录入',
		width : sy.getBrowerWidth() - 400,
	    height :600,
	    iconCls:'fi-pencil icon-blue',
		shadow:false,
	    modal:true,
	    resizable:true,
        maximizable:true,
        loadingMessage:'加载中...',
        buttons:[{
        	 text : '关闭',
             iconCls:'fi-x icon-blue',
             handler : function() {
             	$('#schemeDialog').dialog('close');
             }
        }]
	});
	$('#schemeDialog').window('center');
}
 
var grade='${culprit.dicMonitorGradeKey}';
//监管等级
function gradeChange(id){
	if(grade!=''){
		if(grade=='27005'){
			grade='27004';
			$('#gradeResult').html('严管');	
		}else{
			grade='27005';
			$('#gradeResult').html('特殊类监管');	
		}
	}else{
		grade='27005';
		$('#gradeResult').html('特殊类监管');	
	}	

	$.ajax({
		type : 'post',
		url : '${ctx}/culpritinfo/culprit/updateFinshInfo?id='+id+'&dicMonitorGradeKey='+grade,
		cache : false,
		async : false, //同步请求
		dataType : 'json',
		success : function(result) {
			if(result.status==200){
			$.messager.show({
				title : '提示信息!',
				msg : '修改完成!'
			});	
			}
		}
	});

	
} 



//首次谈话教育
function firstTalk(culpritId){
	$('#firstTalkDialog').dialog({
		href:"${ctx}/culpritinfo/culprit/firstTalkForm?culpritId=" + culpritId,
		title:'首次谈话记录',
		width : sy.getBrowerWidth()-300,
	    height : sy.getBrowerHeight()-150,
	    iconCls:'fi-pencil icon-blue',
	    resizable:true,
        maximizable:true,
		shadow:false,
	    modal:true,
        loadingMessage:'加载中...',
        buttons :[{
			text:'保存',
            iconCls:'fi-print icon-blue',
			handler:function(){
				$('#firstTalkSaveBtn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#firstTalkDialog').dialog('close');
			}
		}]
	});
	
}

//打印社区矫正责任书
function printZRS(id){
	$.ajax({
		type : 'post',
		url : '${ctx}/culpritinfo/culprit/updateFinshInfo?id='+id+'&finshInfo7=1',
		dataType : 'json',
		cache : false,
		async : false, //同步请求
		success : function(result) {
			$('#finshInfo7').html('已完成');
		},
		error : function(result) {
			
		}
	});
	
	$('#schemeDialog').dialog({
		href:"${ctx}/culpritinfo/culprit/printZRS?id=" + id,
		title:'打印《社区矫正小组责任书》',
		iconCls:'fi-print icon-blue',
		width : 800,
	    height : 600,
		shadow:false,
	    modal:true,
	    resizable:true,
        maximizable:true,
        loadingMessage:'加载中...',
        buttons :[{
			text:'打印',
            iconCls:'fi-print icon-blue',
			handler:function(){
				$('#sqjzzrs_printBtn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#schemeDialog').dialog('close');
			}
		}]
	});
	
	$('#schemeDialog').window('center');
	
}

//打印社区矫正宣告书
function printXGS(id){
	/* //检查是否已建立矫正小组
	 $.ajax({
		type : 'post',
		url : '${ctx}/culpritinfo/culprit/checkSupervisor?id='+culpritSupervisorId,
		dataType : 'json',
		cache : false,
		async : false, //同步请求
		success : function(result) {
			if(result.status==505){
				alert(result.msg);
				return;
			}else{	 */
				$.ajax({
					type : 'post',
					url : '${ctx}/culpritinfo/culprit/updateFinshInfo?id='+id+'&finshInfo6=1',
					dataType : 'json',
					cache : false,
					async : false, //同步请求
					success : function(result) {
						$('#finshInfo6').html('已完成');
					},
					error : function(result) {
						
					}
				});
				
				$('#schemeDialog').dialog({
					href:"${ctx}/culpritinfo/culprit/printXGS?id=" + id,
					title:'打印《社区服刑人员入矫宣告书》',
					width : 800,
				    height : 600,
				    resizable:true,
			        maximizable:true,
			        iconCls:'fi-print icon-blue',
					shadow:false,
				    modal:true,
			        loadingMessage:'加载中...',
			        buttons :[{
						text:'打印',
			            iconCls:'fi-print icon-blue',
						handler:function(){
							$('#sqjzxgs_PrintBtn').click();
						}
					}, {
						text:'关闭',
						iconCls:'fi-x icon-blue',
						handler:function(){
							$('#schemeDialog').dialog('close');
						}
					}]
				});	
				
				$('#schemeDialog').window('center');
		/* 	}
		}
	}); 
	 */
	
	
	
}

//上传帮教协议
function bjxy(id){
	/* if(!hasOpen1){
		$("#legalDocsUpload").empty();
  		$("#legalDocsUpload").powerWebUpload({ auto: true,fileNumLimit:4,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});	
  	}
	$('#bjxydialog').dialog('open');
	hasOpen1=true; */
	$('#bjxyDialog').dialog({
		href:"${ctx}/culpritinfo/culpritDoc/bjxy?id=" + id,
		title:'上传志愿者帮教协议书',
		width : 600,
	    height : 300,
	    iconCls:'fi-pencil icon-blue',
	    resizable:true,
        maximizable:true,
		shadow:false,
	    modal:true,
        loadingMessage:'加载中...',
        buttons :[{
			text:'保存',
            iconCls:'icon-save',
			handler:function(){
				$('#bjxy_saveform_btn').click();
			}
		}, {
			text:'关闭',
			iconCls:'fi-x icon-blue',
			handler:function(){
				$('#bjxyDialog').dialog('close');
			}
		}]  
	});
	$('#bjxyDialog').window('center')
	
};


	
</script>

