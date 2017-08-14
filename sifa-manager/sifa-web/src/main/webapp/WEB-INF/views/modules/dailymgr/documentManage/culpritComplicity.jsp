<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>同案犯信息</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body >
 <form  action="${ctx}/culpritinfo/culpritComplicity/save" method="post" id="culpritInfo">
     <div class="easyui-panel" title="同案犯信息" style="width:100%;padding:10px;">
            <table width="100%">
           		<td>
           			<input type="hidden" name="culpritId" value="${culpritComplicity.culpritId}" />
           		</td>
                <tr>
                	
                   <td width="10%"><span class="c-red">*</span>姓名：</td>
							<td><input type="text" name="name" id="name" required=true missingMessage="姓名不能为空!"
								class="f1 easyui-textbox" /></td>
					<td width="10%"><span class="c-red">*</span>性别：</td>
							<td ><input name="dicSexKey" id="dicSexKey" class="easyui-combobox" required=true value=""
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=10000',panelHeight:'auto'"></input></td>
							<td width="10%">出生日期：</td>
							<td ><input type="text" name="birthday" value=""
								class="f1 easyui-datetimebox"   onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
                </tr>
                <tr>
                    <td>罪名：</td>
					<td><input type="text" name="crime" class="f1 easyui-textbox" /></td>
					<td>刑期：</td>
					<td><input type="text" name="adjudgePeriod" class="f1 easyui-textbox" /></td>
					<td>家庭住址：</td>
					<td><input type="text" name="address" value="" class="f1 easyui-textbox" /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>原判刑罚:</td>
					<td ><input name="dicYpxfKey" class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=72000',panelHeight:'auto'"></input></td>
                    <td>所在监狱：</td>
					<td><input type="text" name="prison" class="f1 easyui-textbox" /></td>
					<td>备注：</td>
					<td><input type="text" name="note" value="" class="f1 easyui-textbox" /></td>
                </tr>
                <tr>
                	<td align="center" colspan="6">
                		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">新增</a>
                	</td>
                </tr>
            </table>
    </div>
    </form>
     <div class="easyui-panel" id="p2" title="同案犯信息" style="width:100%;">
	 <table class="easyui-datagrid" id="judg_list_content" style="height: 250px;width:100%"
			data-options="singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/culpritinfo/culpritComplicity/list?culpritId='+'${culpritComplicity.culpritId}',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:true,width:80">编号</th>
					<th data-options="field:'name',width:'10%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">姓名</th>
					<th data-options="field:'dicSexKey',width:'15%',align:'center',formatter:formatSex" editor="text">性别</th>
					<th data-options="field:'birthday',width:'15%',align:'center'" editor="text">出生年月</th>
					<th data-options="field:'crime',width:'15%',align:'center'" editor="text">罪名</th>
					<th data-options="field:'dicYpxfKey',width:'15%',align:'center',formatter:formatYpxf" editor="text">被判处刑罚</th>
					<th data-options="field:'prison',width:'15%',align:'center'" editor="text">所在监狱</th>
					<th data-options="field:'prison',align:'center'" >操作</th><!-- formatter="formatterJudg" -->
				</tr>
			</thead>
		</table>
	 </div>
	 <div id="mydialog" title="修改" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 300px;">
		<form id="myform" action="" method="post">
			<input type="hidden" name="id" value="" />
			<table>
				<tr>
                   <td width="10%"><span class="c-red">*</span>姓名：</td>
							<td><input type="text" name="name" id="name" required=true missingMessage="姓名不能为空!"
								class="f1 easyui-textbox" /></td>
					<td width="10%"><span class="c-red">*</span>性别：</td>
							<td ><input name="dicSexKey" id="dicSexKey" class="easyui-combobox" required=true value=""
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=10000',panelHeight:'auto'"></input></td>
							<td width="10%">出生日期：</td>
							<td ><input type="text" name="birthday" value=""
								class="f1 easyui-datetimebox"   onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
                </tr>
                <tr>
                    <td>罪名：</td>
					<td><input type="text" name="crime" class="f1 easyui-textbox" /></td>
					<td>刑期：</td>
					<td><input type="text" name="adjudgePeriod" class="f1 easyui-textbox" /></td>
					<td>家庭住址：</td>
					<td><input type="text" name="address" value="" class="f1 easyui-textbox" /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>原判刑罚:</td>
					<td ><input name="dicYpxfKey" class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=72000',panelHeight:'auto'"></input></td>
                    <td>所在监狱：</td>
					<td><input type="text" name="prison" class="f1 easyui-textbox" /></td>
					<td>备注：</td>
					<td><input type="text" name="note" value="" class="f1 easyui-textbox" /></td>
                </tr>
				<tr align="center">
					<td colspan="2"><a id="btn1" class="easyui-linkbutton">确定</a>
						<a id="btn2" class="easyui-linkbutton">关闭</a></td>
				</tr>
			</table>
		</form>
	</div>
    <script>
        function submitForm(){
        	 $('#culpritInfo').form('submit');
        }
        $(function() {
        	$('#culpritInfo').form({
        		url:'${ctx}/culpritinfo/culpritComplicity/save',
        		onSubmit:function(o){
        			//o.culpritId='${culpritComplicity.culpritId}';
        			return $(this).form('validate');
        		},
        		success:function(data){
        			data = JSON.parse(data);
        			if(data.status==200){
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        				//2刷新datagrid 
    					$('#judg_list_content').datagrid('reload');
        				//parent.location.reload();
        				
            			//var index = parent.layer.getFrameIndex(window.name);
    					//parent.layer.close(index);
    					
        			}else{
        				alert(data.msg);
        			}
        			
        		}
        	});	
         
        });
        function formatSex(value,row,index){
    		if(value==10001){
    			return '男';
    		}else{
    			return '女';
    		}
    	}
        function formatYpxf(value,row,index){
    		if(value){
    			return sy.getDicValue('culpritJudgment', 'dicYpxfKey',value, '') 
    		}else{
    			return value;
    		}
    	}
	
    </script>
</body>
</html>
