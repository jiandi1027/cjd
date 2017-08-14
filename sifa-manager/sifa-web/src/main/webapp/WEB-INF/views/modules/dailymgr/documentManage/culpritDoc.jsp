<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>文档管理</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body >
     <div class="easyui-panel" id="p2" title="社区矫正对象正卷档案" style="width:100%;height: 840px">
	 <table class="easyui-datagrid" id="judg_list_content" style="height: 100%;width:100%"
			data-options="singleSelect:true,collapsible:true,striped:true,rownumbers:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=48000',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:true,width:80">编号</th>
					<th data-options="field:'value',width:200,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">类别名称</th>
					<th data-options="field:'prison',width:160,align:'center'" formatter="formatterDocPlus">操作</th><!-- formatter="formatterJudg" -->
				</tr>
			</thead>
		</table>
	 </div>
	 <div class="easyui-panel" id="p2" title="社区矫正对象副卷档案" style="width:100%;height: 500px">
	 <table class="easyui-datagrid" id="judg_list_content" style="height: 100%;width:100%"
			data-options="singleSelect:true,collapsible:true,rownumbers:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=49000',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'',hidden:true,width:80">编号</th>
					<th data-options="field:'value',width:200,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">类别名称</th>
					<th data-options="field:'prison',width:160,align:'center'" formatter="formatterDocMinus">操作</th><!-- formatter="formatterJudg" -->
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
        			o.culpritId='${culpritComplicity.culpritId}';
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
        function formatterDocPlus(val,row,index){  
        	var operation=$.formatString('<a href="javascript:detail(\'{0}\');"  title="查看"><span style="color:blue;"><strong><u>查看</u><strong></span></a>',row.key);
        	return operation;
        }
        function formatterDocMinus(val,row,index){  
        	var operation=$.formatString('<a href="javascript:detail(\'{0}\');"  title="查看"><span style="color:blue;"><strong><u>查看</u><strong></span></a>',row.key);
        	return operation;
        }
        $.formatString = function(str) {
    		for ( var i = 0; i < arguments.length - 1; i++) {
    			str = str.replace("{" + i + "}", arguments[i + 1]);
    		}
    	return str;
    }
    </script>
</body>
</html>
