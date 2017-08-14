<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript"
	src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<div region="center" border="false">
		<table class="easyui-datagrid" id="change_record_list_content" style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,fit:true,rownumbers:true,striped:true,fitColumns:true,fit:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/todo/toBeProcessed/toView?id='+${toBeProcessed.id },method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-linkbutton-edit4').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
				  $('.organization-easyui-linkbutton-edit5').linkbutton({text:'处理',plain:true,iconCls:'fi-clipboard-pencil icon-blue'}); 
				  }">
			<thead>
				<tr>
					<th data-options="field:'culpritName',width:'9%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">矫正对象</th>
					<th data-options="field:'groupName',width:'9%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">司法所</th>
					<th data-options="field:'name',width:'19%',align:'center'"
						editor="text">提醒事项</th>
					<th data-options="field:'startTime',width:'13%',align:'center',sortable:true"
						editor="{type:'validatebox',options:{required:true}}">矫正起止</th>
					<th data-options="field:'endTime',width:'13%',align:'center',sortable:true"
						editor="{type:'validatebox',options:{required:true}}">矫正截至</th>
					<th data-options="field:'remindTime',width:'13%',align:'center',sortable:true"
						editor="{type:'validatebox',options:{required:true}}">提醒生成时间</th>
				 	<th data-options="field:'_opt',width:'24%',formatter:formatOperate,align:'center'">操作</th>  
				</tr>
			</thead>
		</table>
	</div>
	<div id="toView" title="处理" modal=true draggable=false  data-options="iconCls:'fi-clipboard-pencil icon-blue',maximizable:true,resizable:true"
		class="easyui-dialog" closed=true style="width:350px; padding:5px;">
		<form id="toViewForm" action="" method="post">
		
			<table width=550 class="grid">
						
						
				<tr>
					<th  width="5%"><span class="c-red"></span>处理：</th>
					<td width="20%">
						<input name="dicHyzkKey" required=true id="dicHyzkKey" class="easyui-combobox" style="width:230px"
                  	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=33eb2f2601244d31bc3ae311fb7b7c6b',panelHeight:'auto',editable:false"></input>
					</td>
					
				</tr>
				<tr  >
				<th></th>
				<td align="center">
					<a id="toViewMoveIn" iconCls='fi-clipboard-pencil icon-blue' class="easyui-linkbutton" >处理</a>
					<a id="toViewMoveIn1" iconCls='fi-x icon-blue'  class="easyui-linkbutton" >关闭</a>
				</td>
			</tr>
			</table>
		</form>
</div>

<script type="text/javascript">

function formatOperate(val,row,index){  
	
	var operation='<a href="javascript:void(0);"  class="organization-easyui-linkbutton-edit4" data-options="plain:true,iconCls:\'formatterAct\'" class="organization-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-info icon-blue\'" onclick="detail(\''+row.culpritId+'\')">详情</a>';
	
	operation=operation+'&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="organization-easyui-linkbutton-edit5" onclick="reportAuditGradeChange()">处理</a>';
	
    return operation;
} 



//详细链接
function detail(culpritId){
		parent.$.modalDialog({
			title : '详情',
			iconCls : 'fi-info icon-blue',
			width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
			resizable:true,
	        maximizable:true,
			href : '${ctx}/dailymgr/fileManagement/detail?id=' + culpritId
		});
	
}
function reportAuditGradeChange(){
	$('#toView').dialog('open');
	
}
$('#toViewMoveIn1').click(function(){
	$('#toView').dialog('close');
	
})
$('#toViewMoveIn').click(function(){
	
	if($('#dicHyzkKey').combobox('getValue')=='9a36d71210f54cb0b13de6d00e0476b1'){// 死亡
		parent.$.modalDialog({
	    	title : '新增死亡登记',
	    	iconCls:'fi-shuffle icon-blue',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        resizable : true,
	        maximizable:true, 
	        href : '${ctx}/endcorrect/death/add',
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#death_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#deathAddform');
	                f.submit();
	            }
	        },{
	            text : '重置',
	            iconCls:'icon-undo',
	            handler : function() {
	           		var f = parent.$.modalDialog.handler.find('#deathAddform');
	           		f.get(0).reset(); //清空表单数据 
	            }
	        },{
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	            	parent.$.modalDialog.handler.dialog('close');
	            }
	        }]
		});
	}else if($('#dicHyzkKey').combobox('getValue')=='9ccb15cd83bf47de9acc14aa8a310008'){//漏罪
		 parent.$.modalDialog({
		        title : '新增漏罪',
		        iconCls:'fi-plus icon-green',
		        width : 1000,
		        height : 600,
		        href : '${ctx}/endcorrect/omittedCrime/add',
		        resizable : true,
		        maximizable:true,
		        buttons : [ {
		            text : '保存',
		            iconCls:'icon-save',
		            handler : function() {
		                parent.$.modalDialog.openner_dataGrid = $('#omitted_crime_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
		                var f = parent.$.modalDialog.handler.find('#omittedCrimeForm');
		                f.submit();
		            }
		        },{
		            text : '重置',
		            iconCls:'icon-undo',
		            handler : function() {
		           	 var f = parent.$.modalDialog.handler.find('#omittedCrimeForm');
		           	 f.get(0).reset(); //清空表单数据 
		            }
		        },{
		            text : '关闭',
		            iconCls:'fi-x icon-blue',
		            handler : function() {
		           	 parent.$.modalDialog.handler.dialog('close');
		            } 
		        }  ]
		    });
	}else if($('#dicHyzkKey').combobox('getValue')=='05a339d2a9a74e438d3fa9e72dfa73f9'){ //重新犯罪
		  
	    parent.$.modalDialog({
	        title : '新增重新犯罪',
	        iconCls:'fi-plus icon-green',
	        width : 1000,
	        height : 550,
	        href : '${ctx}/endcorrect/recidivism/add',
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#recidivism_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#recidivismForm');
	                f.submit();
	            }
	        },{
	            text : '重置',
	            iconCls:'icon-undo',
	            handler : function() {
	           	 var f = parent.$.modalDialog.handler.find('#recidivismForm');
	           	 f.get(0).reset(); //清空表单数据 
	            }
	        },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 parent.$.modalDialog.handler.dialog('close');
	             }
	        }   ]
	    });
	}else if($('#dicHyzkKey').combobox('getValue')=='fd9b1576e05e4771bcfbebcbb1dcd46c'){//涉嫌重新犯罪
		  
	    parent.$.modalDialog({
	        title : '新增涉嫌重新犯罪',
	        iconCls:'fi-plus icon-green',
	        width : sy.getBrowerWidth()-250,
	        height : sy.getBrowerHeight()-150,
	        href : '${ctx}/endcorrect/recidivismPerhaps/add',
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	            handler : function() {
	                parent.$.modalDialog.openner_dataGrid = $('#recidivism_perhaps_list').datagrid();//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                var f = parent.$.modalDialog.handler.find('#recidivismPerhapsForm');
	                f.submit();
	            }
	        },{
	            text : '重置',
	            iconCls:'icon-undo',
	            handler : function() {
	           	 var f = parent.$.modalDialog.handler.find('#recidivismPerhapsForm');
	           	 f.get(0).reset(); //清空表单数据 
	            }
	        },{
	            text : '关闭',
	            iconCls:'fi-x icon-blue',
	            handler : function() {
	           	 parent.$.modalDialog.handler.dialog('close');
	            } 
	        }]
	    });
		
	}else if($('#dicHyzkKey').combobox('getValue')=='ef2ad5fe4e6e48eb9abf7d5e9c39e8b2'){//脱管
		 parent.$.modalDialog({
	         title : '新增脱管信息',
	         iconCls:'fi-plus icon-green',
	         width : sy.getBrowerWidth()-300,
	         height : sy.getBrowerHeight()-260,
	         resizable:true,
	         maximizable:true,
	         href : '${ctx}/endcorrect/detached/add',
	         buttons : [ {
	             text : '保存',
	             iconCls:'icon-save',
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#t_detached_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#detachedInfo');
	                 f.submit();
	             }
	         },{
	             text : '重置',
	             iconCls:'icon-undo',
	             handler : function() {
	            	 var f = parent.$.modalDialog.handler.find('#detachedInfo');
	            	 f.get(0).reset(); //清空表单数据 
	             }
	         },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 parent.$.modalDialog.handler.dialog('close');
	             }
	         }  ]
	     });
	}
	$('#toView').dialog('close');
	
})
</script>
</div>
