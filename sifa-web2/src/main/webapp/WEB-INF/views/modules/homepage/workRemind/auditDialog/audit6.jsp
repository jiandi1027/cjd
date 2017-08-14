<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
		<form id="auditWorkRemindForm6" action="" method="post">
		<input type="hidden" name="id" value="${workRemind.id}"/>
			<table width="100%" class="grid">
				<tr>
					<th  width="30%"><span class="c-red"></span>处理结果：</th>
						<td >
							<input name="dicWorkResult" id="dicWorkResult6" required=true class="easyui-combobox" value="1700001"
	                  	data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=1700000',panelHeight:'auto',panelMaxHeight:200,editable:false"></input>
						</td>
				</tr>
			</table>
		</form>
</div>
<div style="text-align: center;display: none;">
	    <a id="auditWorkRemindBtn" class="easyui-linkbutton" >提交</a>
</div>
<div id="dealAdd6"></div>
<script>
$('#auditWorkRemindBtn').click(function(){
	if($('#auditWorkRemindForm6').form('validate')){
		var dialogParent = $('#dealAdd6').parent();  
	    var dialogOwn = $('#dealAdd6').clone();  
	    dialogOwn.hide();
		if($('#dicWorkResult6').combobox('getValue')=="1700001"){//法律文书录入
			$('#dealAdd6').dialog({
				title : '法律文书录入',
		        iconCls:'fi-pencil icon-blue',
		        width : sy.getBrowerWidth()-250,
		        height : sy.getBrowerHeight()-150,
		        href : '${ctx}/culpritinfo/culprit/update?id=${workRemind.recordId}',
		        resizable : true,
		        maximizable:true,
		        onClose : function() {
					 dialogOwn.appendTo(dialogParent);  
		            $(this).dialog("destroy").remove();
		        },
		        buttons : [ {
		            text : '保存',
		            iconCls:'icon-save',
		            handler : function() {
		            	setFilePathAndName('imageUpload');
		            	setFilePathAndName('legalDocsUpload');
		            	if ($('#culpritInfo').form('validate')) {
		            		$.ajax({
		            			type : 'post',
		            			url : '${ctx}/culpritinfo/culprit/save?flag=0',
		            			data : $('#culpritInfo').serialize(),
		            			dataType : 'json',
		            			async : false,
		            			success : function(result) {
		            				$.messager.show({title : '提示信息!',msg : result.msg});
		            				
	            				 $.ajax({
	     							type: 'post' ,
	     							url: '${ctx}/homepage/workRemind/update',
	     							cache:false ,
	     							data: $.serializeObject($('#auditWorkRemindForm6')),
	     							dataType:'json',
	     							success:function(result){
	     								$('#dealAdd6').dialog('close');
	     								$('#audit1_6').dialog('close');
	     						   		$('#view_list_workRemind1_6').datagrid('reload');
	     							} 
	     						});	
		            		},
		            		error : function(result) {
		            				$.messager.show({
		            					title : '提示信息!',
		            					msg : result.msg
		            				});
		            			}
		            		});
		            	}
 
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd6').dialog('close');
		             }
		        }  ]
			})
		}
		
	}else{
		parent.$.messager.alert('提示信息', '请选择处理结果！');
	}

});

</script>