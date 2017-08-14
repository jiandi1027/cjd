<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

 <form action="${ctx}/monitoring/overAlarm/save" method="post" id="overAlarmformAdd" name="overAlarmformAdd">
     <div class="easyui-panel" style="width: 100%; padding: 5px;margin:0 auto;">
     	<input type="hidden" name="id" id="id" value="${overAlarm.id }"/>
        <table width="100%" class= "grid">
            <tr>
                <th width="30%" >姓名：</th>
                <td width="70%">${overAlarm.culpritName }</td>
            </tr>
            <tr>
				<th>越界时间：</th>
				<td><fmt:formatDate value='${overAlarm.gpsTime }' pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
           	<tr>
           		<th>越界位置：</th>
           		<td>${overAlarm.location }</td>
           	</tr>
			<tr>
				<th>扣分：</th>
				<td>
					<select name="delmark" class="easyui-combobox" data-options="editable:false,panelMaxHeight:'200',panelHeight:'auto',width:'173'">
						<option value="0">不扣分</option>
						<option value="-2">按未请假扣分</option>
						<option value="-1">按未销假扣分</option>
					</select>
				</td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>处理方案：</th>
				<td>
					<input id="note" name="note" class="easyui-combobox" data-options="valueField:'key',textField:'value',editable:false, 
					url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=note&parentKey=94000',panelMaxHeight:'200',panelHeight:'auto'" required=true>
				</td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>处理方式：</th>
				<td>
					<input id="dealtype" name="dealtype" class="easyui-combobox" data-options="valueField:'key',textField:'value',editable:false, 
					data: [
						{key: '${ctx}/rewardspunishment/verbalWarning/add?culpritId=${overAlarm.culpritId }&isAddFlag=0',value: '口头警告'},
						{key: '${ctx}/rewardspunishment/warning/add?culpritId=${overAlarm.culpritId }&isAddFlag=0',value: '警告'},
						{key: '${ctx}/rewardspunishment/securityPunishment/form?culpritId=${overAlarm.culpritId }&isAddFlag=0',value: '治安管理处罚'},
						{key: '${ctx}/rewardspunishment/revokeProbation/form?culpritId=${overAlarm.culpritId }&isAddFlag=0',value: '撤销缓刑'},
						{key: '${ctx}/rewardspunishment/revokeParole/form?culpritId=${overAlarm.culpritId }&isAddFlag=0',value: '撤销假释'},
						{key: '${ctx}/rewardspunishment/revokeOutOfPrison/form?culpritId=${overAlarm.culpritId }&isAddFlag=0',value: '撤销监外执行'}
					],
					panelMaxHeight:'200',panelHeight:'auto'" required=true>
				</td>
			</tr>
        </table>           
    </div>
</form>
<script>
$(function() {
	$('#overAlarmformAdd').form({
		url:'${ctx}/monitoring/overAlarm/save',
		async : true,
   		onSubmit:function(){
   			progressLoad();
   			var isValid = $(this).form('validate');
            if (!isValid) {
            	if ($('#note').combobox('getValue') == '') {
                	$.messager.show({
       					title:'提示信息!' ,
       					msg:'处理方案不能为空!'
       				});
				}
            	else if ($('#dealtype').combobox('getValue') == '') {
                	$.messager.show({
       					title:'提示信息!' ,
       					msg:'处理方式不能为空!'
       				});
				}
            	
            	progressClose();
            	return isValid;
            }
            
            return isValid;
   		},
   		success:function(data){
        	progressClose();
   			data = JSON.parse(data);
   			if(data.status==200){
				var msg = data.msg;
				
   				if ($('#note').combobox('getValue') == '94004') {
   					msg = '上报成功，请继续新增相应的处理流程!';
	                var ver = Math.random();
	            	var url = $('#dealtype').combobox('getValue');
	            	var text = '新增' + $('#dealtype').combobox('getText');
	   	            var formName = getformName($('#dealtype').combobox('getText'));
	            	
	   	            $('<div id="overAlarmDialog"></div>').dialog({
	   	    	        title : text,
	   	    	        iconCls:'fi-plus icon-green',
	   	    	        width : sy.getBrowerWidth()-250,
	   	    	        height : sy.getBrowerHeight()-150,
	   	    	        href : url,
	   	    	        resizable : true,
	   	    	        maximizable:true,
	   	    	        loadingMessage:'加载中...',
	   	    	        onClose:function(){
	   	    	        	$(this).dialog("destroy");
	   	    	        },
	   	    	        buttons : [ {
	   	    	            text : '保存',
	   	    	            iconCls:'icon-save',
	   	    	            handler : function() {
	   	    	                var f = $('#'+formName);
	   	    	                f.submit();
	   	   	            	 	//$('<div></div>').dialog('close');
	   	    	            }
	   	    	        },{
	   	    	            text : '重置',
	   	    	            iconCls:'icon-undo',
	   	    	            handler : function() {
	   	    	           	 var f = $('#'+formName);
	   	    	           	 f.get(0).reset(); //清空表单数据 
	   	    	            }
	   	    	        },{
	   	    	             text : '关闭',
	   	    	             iconCls:'fi-x icon-blue',
	   	    	             handler : function() {
	   	    	            	 $("#overAlarmDialog").dialog('close');
	   	    	             }
	   	    	        }]
	   	    	    });
				}
   				
   				$.messager.show({
   					title:'提示信息!' ,
   					msg:msg
   				});

   				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                parent.$.modalDialog.handler.dialog('close');
   			}else{
   				$.messager.alert('错误', result.msg, 'error');
   			}
   		}
   	});	
     
});

$('#dealtype').combobox({disabled:true});

$('#note').combobox({
	onChange: function (newValue, oldValue){
		//选择处理
		if (newValue == '94004') {
			$('#dealtype').combobox({disabled:false});
		}
		else {
			$('#dealtype').combobox({disabled:true});
		}
	}
});

function getformName(name){
	var formName = '';
	if (name == '口头警告') {
		formName = 'verbalWarningForm';
	}
	else if (name == '警告') {
		formName = 'warningInfo';
	}
	else if (name == '治安管理处罚') {
		formName = 'securityPunishmentInfo';
	}
	else if (name == '撤销缓刑') {
		formName = 'probationInfo';
	}
	else if (name == '撤销假释') {
		formName = 'praoleInfo';
	}
	else if (name == '撤销监外执行') {
		formName = 'outOfPrisonInfo';
	}
	
	return formName;
}
</script>