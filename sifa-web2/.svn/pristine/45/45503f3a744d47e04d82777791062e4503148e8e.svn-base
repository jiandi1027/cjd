<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
		<form id="auditWorkRemindForm11" action="" method="post">
		<input type="hidden" name="id" value="${workRemind.id}"/>
			<table width="100%" class="grid">
				<tr>
					<th  width="30%"><span class="c-red"></span>处理结果：</th>
						<td >
							<input name="dicWorkResult" id="dicWorkResult11" required=true class="easyui-combobox" value="1710001"
	                  	data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=1710000',panelHeight:'auto',panelMaxHeight:200,editable:false"></input>
						</td>
				</tr>
			</table>
		</form>
</div>
<div style="text-align: center;display: none;">
	    <a id="auditWorkRemindBtn" class="easyui-linkbutton" >提交</a>
</div>
<div id="dealAdd11"></div>
<script>
$('#auditWorkRemindBtn').click(function(){
	if($('#auditWorkRemindForm11').form('validate')){
		var dialogParent = $('#dealAdd11').parent();  
	    var dialogOwn = $('#dealAdd11').clone();  
	    dialogOwn.hide();
		if($('#dicWorkResult11').combobox('getValue')=="1710001"){//法律文书录入
			$('#dealAdd11').dialog({
				title : '新增期满解矫',
		        iconCls:'fi-plus icon-green',
		        width : sy.getBrowerWidth()-250,
		        height : sy.getBrowerHeight()-200,
		        href : '${ctx}/endcorrect/finishRedress/add?culpritId=${workRemind.recordId}',
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
		            	 $('#finishRedressForm').form('submit');
	            		  $.ajax({
								type: 'post' ,
								url: '${ctx}/homepage/workRemind/update',
								cache:false ,
								data: $.serializeObject($('#auditWorkRemindForm11')),
								dataType:'json',
								success:function(result){
									$('#dealAdd11').dialog('close');
									$('#audit11').dialog('close');
							   		$('#view_list_workRemind11').datagrid('reload');
							} 
						});
		            }
		        },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#dealAdd11').dialog('close');
		             }
		        }  ]
			})
		}
		
	}else{
		parent.$.messager.alert('提示信息', '请选择处理结果！');
	}

});

</script>