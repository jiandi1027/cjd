<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
 <form id="searchForm"  style="padding-bottom: 10px;padding-top: 10px;">
<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
	<div class="easyui-layout" data-options="fit:true,border:false">
	      <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
		 <sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="grade_change_list_content"/>
		  </c:if>
	  		   <div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目</c:if>" style="width:100%;">
				<table>
					<tr>
						<td class="search-title">矫正对象：</td>
						<td> 
							<input name="name" id="name" class="easyui-textbox"   /> 
						</td>
					</tr>
						<tr>
						<td class="search-title">监管等级：</td>
						<td> 
							<input id="dicMonitorGrade" class="easyui-combobox" name="dicMonitorGrade"   editable="false"
    							data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?parentKey=27000&showAll=1&columnName=dic_gldxjb_key&tabName=sf_culprit',panelHeight:'auto'" /> 
    					</td>
					</tr>
					
					<tr>
						<td class="search-title">犯罪类型：</td>
						<td> <input id="dicCrimeTypeKey1" class="easyui-combobox" name="dicCrimeTypeKey1"   editable="false"
    							data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?parentKey=26000&showAll=1&columnName=dicCrimeTypeKey&tabName=sf_culpritJudgment',panelHeight:'auto'" /> </td>
					</tr>
					<tr>
						<td class="search-title">矫正类型：</td>
						<td> <input id="dicPenalTypeKey" class="easyui-combobox" name="dicPenalTypeKey"   editable="false"
    							data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?parentKey=20000&showAll=1&columnName=entrust_type_id&tabName=sf_investigate',panelHeight:'auto'" /> </td>
					</tr>
				</table>
			
			</div>
	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchGradeFormbtn" iconCls="icon-search" >查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" onclick="$('#dicMonitorGrade').combobox('reset');$('#dicCrimeTypeKey1').combobox('reset');$('#dicPenalTypeKey').combobox('reset');javascript:$('#searchForm').form('clear');"
						  iconCls="icon-undo" >清空</a>
	</div>
</div>
</div>
</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="grade_change_list_content" style="height: 400px;"
			data-options="singleSelect:true,collapsible:true,fit:true,striped:true,fitColumns:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 15 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/gradeChange/list?logo=0',method:'post',onLoadSuccess:function (data) {
				  $('.organization-easyui-linkbutton-editi').linkbutton({text:'变更记录',plain:true,iconCls:'fi-align-right icon-blue'}); 
				   $('.organization-easyui-linkbutton-edito').linkbutton({text:'修改监管等级',plain:true,iconCls:'fi-pencil icon-blue'}); 
				  }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:'5%'">编号</th>
					<th data-options="field:'culpritName',width:'15%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">矫正对象</th>
					<th data-options="field:'groupName',width:'14%',align:'center'" editor="text">司法所</th>
				<!--<th data-options="field:'dicPenalTypeKey',width:250,align:'center'" editor="text">刑罚执行类别</th>formatter="formatterAct" -->
					<th data-options="field:'dicCrimeTypeKey1',width:'15%',align:'center',formatter:crimeType" editor="text" >犯罪类型</th>
					<th data-options="field:'dicPenalTypeKey',width:'15%',align:'center',formatter:penalType" editor="text">社区矫正类型</th>
					<th data-options="field:'dicMonitorGrade',width:'14.5%',align:'center',formatter:grade" editor="text">监管等级</th>
					<th data-options="field:'action',width:'25%',align:'center'" formatter="formatterAct" >操作</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">

	$(function() {
		$('#searchGradeFormbtn').click(
				function() {
					$('#grade_change_list_content').datagrid('load',
							$.serializeObject($('#searchForm')));
				});

	});

	/**
	 *  提交表单方法
	 */
	$('#btn1').click(function() {
		if ($('#myform').form('validate')) {
			$.ajax({
				type : 'post',
				url : '${ctx}/dailymgr/askLeave/save',
				cache : false,
				data : $('#myform').serialize(),
				dataType : 'json',
				success : function(result) {
					//1 关闭窗口
					$('#mydialog').dialog('close');
					//2刷新datagrid 
					$('#grade_change_list_content').datagrid('reload');
					//3 提示信息
					$.messager.show({
						title : result.status == 200 ? "ok" : "fail",
						msg : result.msg
					});
				},
				error : function(result) {
					$.meesager.show({
						title : result.status == 200 ? "ok" : "fail",
						msg : result.msg
					});
				}
			});
		} else {
			$.messager.show({
				title : '提示信息!',
				msg : '数据验证不通过,不能保存!'
			});
		}
	});
	$(function() {

		/*$('#grade_change_list_content').datagrid({
			fit : true
		});*/
		/**
		 * 关闭窗口方法
		 */
		/*$('#btn2').click(function() {
			$('#mydialog').dialog('close');
		});

		$('#searchGradeFormbtn').click(
				function() {
					$('#t_list_content').datagrid('load',
							serializeForm($('#searchForm')));
				});
		$('#cleanGradeFormSearch').click(
		function() {
			$('#t_list_content').datagrid('load', {});
			$('#searchForm').form().find('input').val('');
		});
		*/
		//js方法：序列化表单 			
		
	});
	$('#cleanGradeFormSearch').click(
			function() {
				$('#grade_change_list_content').datagrid('load', {});
				$('#searchForm').form().find('input').val('');
			
				
			});
	//1犯罪类型转翻译
	function crimeType(value,row,index){
			
			
			if(row.dicCrimeTypeKey1 !=null){
				return sy.getDicValue('sf_culpritJudgment',' dicCrimeTypeKey', row.dicCrimeTypeKey1, '')
			}else{
				return "未录入";
			}
		
		}
	//1矫正类型
	function penalType(value,row,index){
		
		if(row.dicPenalTypeKey !=null){
			return sy.getDicValue('sf_investigate',' entrust_type_id', row.dicPenalTypeKey, '')
		}else{
			return "未录入";
		}
		
	}
	function grade(value,row,index){
		if(row.dicMonitorGrade){
			return sy.getDicValue('sf_culprit',' dic_gldxjb_key', row.dicMonitorGrade, '')
		}else{
			return "未录入";
		}
	}
	//操作的追加
	function formatterAct(val,row,index){
		var operation=$.formatString('<a href="javascript:changeRecord(\'{0}\');"  class="organization-easyui-linkbutton-editi" data-options="plain:true,iconCls:\'fi-list\'" title="变更记录">变更记录</a>',  row.culpritId);
		
		if(row.roleId=="3002"||row.roleId=="3003"){
			operation +='&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:amend(\'{0}\');"  class="organization-easyui-linkbutton-edito" data-options="plain:true,iconCls:\'fi-pencil\'" title="修改监管等级">修改监管等级</a>', row.culpritId)
		}
		
		return operation;
	}
	
	//新增修改监管等级
	function amend(id){
		//open_layer('新增修改监管等级','${ctx}/dailymgr/gradeChange/form?culpritId='+id);
		 parent.$.modalDialog({
	         title : '修改监管等级',
	         iconCls:'fi-pencil icon-blue',
	         width : sy.getBrowerWidth()*0.8,
	         height : sy.getBrowerHeight()*0.82,
	         maximizable:true,
	         resizable:true,
	         href : '${ctx}/dailymgr/gradeChange/form?culpritId='+id,
	         buttons : [ {
	             text : '保存',
	             iconCls:'icon-save',
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#grade_change_list_content').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#gradeChangeInfo');
	                 f.submit();
	             }
	         },{
	             text : '重置',
	             iconCls:'icon-undo',
	             handler : function() {
	            	 var f = parent.$.modalDialog.handler.find('#gradeChangeInfo');
	            	 f.get(0).reset(); //清空表单数据 
	             }
	         }  ]
	     });
	}
	//监管等级变更列表
	function changeRecord(id){
		//open_layer('监管等级变','${ctx}/dailymgr/gradeChange/changeRecord?culpritId='+id);

		 parent.$.modalDialog({
	         title : '变更记录',
	         iconCls:'fi-align-right icon-blue',
	         width : sy.getBrowerWidth()-250,
	         height : sy.getBrowerHeight()-150,
	         maximizable:true,
	         resizable:true,
	         href : '${ctx}/dailymgr/gradeChange/changeRecord?culpritId='+id
	     });
	}
	$.formatString = function(str) {
		for ( var i = 0; i < arguments.length - 1; i++) {
			str = str.replace("{" + i + "}", arguments[i + 1]);
		}
	return str;
	}
	function serializeForm(form) {
		var obj = {};
		$.each(form.serializeArray(),
				function(index) {
					if (obj[this['name']]) {
						obj[this['name']] = obj[this['name']] + ','
								+ this['value'];
					} else {
						obj[this['name']] = this['value'];
					}
				});
		return obj;
	}
</script>
</body>

