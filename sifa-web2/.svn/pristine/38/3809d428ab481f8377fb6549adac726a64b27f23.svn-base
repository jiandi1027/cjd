<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/dailymgr/inspection/save" method="post" id="inspectionInfo">
	<input type="hidden" name="id" id="id" value="${inspection.id}"/>
	<div class="easyui-panel" title="" style="width:100%;padding:5px;margin:0 auto;">
		<table width="100%" class="grid">
			<tr>
				<th width="20%"><span class="c-red">*</span>抽查开始时间：</th>
				<td width="80%">
					<input name="checkStartTime" id="checkStartTime" class="Wdate" style="width:143px;" 
          			onfocus="var checkEndTime=$dp.$('checkEndTime');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm',onpicked:function(){checkEndTime.focus();},maxDate:'#F{$dp.$D(\'checkEndTime\')}'})" />&nbsp;
				</td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>抽查结束时间：</th>
				<td>
					<input name="checkEndTime" id="checkEndTime" class="Wdate" style="width:143px;" 
					onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'checkStartTime\')}'})" />&nbsp;
				</td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>抽查人数：</th>
				<td>
					<input type="radio" name="amount" value="2" />全部
					<input type="radio" name="amount" value="1" checked="checked"/>部分抽查(多于100人的司法所随机抽查100人，其余的抽查全部)
				</td>
			</tr>
			<tr>
				<th><span class="c-red">*</span>被抽查部门：</th>
				<td>
					<select id="sysGroupId" name="groupidsStr" class="f1 easyui-combotree" multiple="multiple" style="width: 60%;" 
					required=true missingMessage="部门不能为空!" 
					data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',limitToList:'true'"></select>
					<input type="hidden" id="groupsStr" name="groupsStr" value="" />
				</td>
			</tr>
			
			<tr align="center" style="display: none;">
				<td colspan="2">
					<a id="inspectionAddBtn1" class="easyui-linkbutton" icon="icon-save icon-blue">提交</a>
					<a id="inspectionAddBtn2" class="easyui-linkbutton" icon="icon-undo icon-red">重置</a>
				</td>
			</tr>
		</table>
    </div>
</form>
<script>
	$('#inspectionAddBtn1').click(function (){
   		$('#inspectionInfo').form('submit');
	});
    
    $(function() {
    	$('#inspectionInfo').form({
    		url:'${ctx}/dailymgr/inspection/save',
    		onSubmit:function(){
    			progressLoad();
       			var isValid = $(this).form('validate');
                if (!isValid) {
                	$.messager.show({
        				title : '提醒',
        				msg : '请将数据填写完整！'
        			});
                	progressClose();
                	return isValid;
                }
                
                var checkStartTime = $('#checkStartTime').val();
        		var checkEndTime = $('#checkEndTime').val();
        		var result = compareDate(checkStartTime);
        		
        		if (checkStartTime == null || checkStartTime == '' || checkEndTime == null || checkEndTime == '' ) {
        			$.messager.show({
        				title : '提醒',
        				msg : '抽查时间不能为空！'
        			});

                	progressClose();
                	return false;
        		}
        		if (result / 1000 / 60 / 60 < 1) {
        			$.messager.show({
        				title : '提醒',
        				msg : '抽查开始时间必须大于当前时间<br/>1小时以上,请重新选择！'
        			});

                	progressClose();
                	return false;
        		}
        		if (compareDate2(checkEndTime, checkStartTime)) {
        			$.messager.show({
        				title : '提醒',
        				msg : '抽查结束时间必须大于开始时间,请重新选择！'
        			});

                	progressClose();
                	return false;
        		}
        		if (checkStartTime.substring(0,10) != checkEndTime.substring(0,10)){
        			$.messager.show({
        				title : '提醒',
        				msg : '抽查开始时间和抽查结束时间请选择同一天！'
        			});

                	progressClose();
                	return false;
        		}
                
                return isValid;
    		},
    		success:function(data){
            	progressClose();
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

    $('#inspectionAddBtn2').click(function (){
		$('#inspectionInfo').get(0).reset();
    });
    
    
  //选择司法所时赋值司法所名称
	$('#sysGroupId').combotree({
		onChange:function(){
			$('#groupsStr').val($('#sysGroupId').combotree('getText'));
		}
    });
    
    function compareDate(eDate)// 日期比较函数
    {
    	var d1 = new Date(eDate.replace(/\-/g, "\/"));
    	var d2 = new Date();
    	return (d1.getTime() + 60 * 1000 - d2.getTime());
    }
    
    function compareDate2(bDate, eDate) // 日期比较函数
    {
    	var d1 = new Date(bDate);
    	var d2 = new Date(eDate);
    	if (d1 > d2) {
    		return false;
    	} else {
    		return true;
    	}
    }
</script>
</body>
</html>
