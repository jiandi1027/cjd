<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<div class="easyui-layout"data-options="fit:true" >
	<div region="north" border="false" noheader="true" collapsed="false" title="搜索条件"
		style="height: 35px; overflow: hidden;background:#FFFFFF;"align="left" >
		<form id="searchForm">
			<table>				
				<tr>
					<td>社区矫正人员：</td>
					<td>${culprit.name }</td>
					<td>&nbsp;&nbsp;请假开始时间：
					</td>
					<td>
						<input name="searchStartDate"  class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
						value=""/>&nbsp;
					</td>
					<td>至</td>
					<td>
						<input name="searchEndDate" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
						editable="false"  />
					</td>
					<td colspan="2"><a
						href="javascript:void(0);" class="easyui-linkbutton"
						id="searchbtn">搜索</a><a href="javascript:void(0);"
						class="easyui-linkbutton" onclick="cleanSearch();">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div region="center" border=false  style="height:800px;">
		<table class="easyui-datagrid" id="firstTalk_list_content" title="谈话教育列表"
			style="height:600px;"
			data-options="singleSelect:true,toolbar:'#toolbarFirstTalk',collapsible:true,fit:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/talk/list',method:'post',queryParams: {
		culpritId: '${culprit.id }'}">
			<thead>
				<tr>
					<th data-options="field:'culpritName',align:'center',width:'17%'"
						editor="text">姓名</th>
					<th data-options="field:'groupName',align:'center',width:'17%'"
						editor="text" formatter="formatPhone" >手机号码</th>
					<th data-options="field:'talkor',align:'center',width:'17%'"
						editor="text">谈话人</th>
					<th data-options="field:'place',align:'center',width:'16.5%'"
						editor="text">谈话地点</th>
					<th data-options="field:'talkTime',align:'center',width:'16.8%'">谈话时间</th>
				 <th data-options="field:'_opt',width:'18.5%',align:'center',formatter:formatOper">操作</th>  

				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="toolbarFirstTalk" style="display: none;">
	<a onclick="addFirstTalk();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>        
</div>
<div id="firstTalkDialog1" title="新增个别谈话记录" modal=true draggable=false
		class="easyui-dialog" closed="true" style="width:580px;height:450px;padding: 10px">
		<form id="firstTalkForm" action="" method="post">
			<input type="hidden" name="id" id="paroleId" value=""/>
           	<input type="hidden" name="culpritId" id="culpritId" value="${culprit.id }"/>
            <table width="100%">
                <tr>
                    <td width = "20%">谈话人:</td>
                    <td ><input value="" required=true missingMessage="谈话人不能为空！" name="talkor" id="talkor" class="easyui-textbox"/></td>
                     <td width = "20%">谈话地点:</td>
                    <td><input value="" required=true missingMessage="谈话地点不能为空！" name="place" id="place"  class="easyui-textbox"/></td>
                </tr>
                 <tr>
                    <td width = "20%">谈话日期:</td>
                    <td ><input value="" name="talkTime" id="talkTime" 
                    editable="false" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" /></td>
                     <td width = "20%">记录人:</td>
                    <td><input value="" name="recorder" id="recorder" class="easyui-textbox" /></td>
                </tr>
                  <tr>
                    <td width = "20%">谈话开始时间:</td>
                    <td ><input value="" required=true missingMessage="谈话开始时间不能为空！" name="talkStartTime"
                    editable="false" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" /></td>
                     <td width = "20%">谈话结束时间:</td>
                    <td><input value="" required=true  missingMessage="谈话结束时间不能为空！" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"name="talkEndTime" 
					editable="false" /></td>
                </tr>
                <tr rowspan="5">
                    <td width = "20%">相关材料:</td>
                    <td><input type="file" name="evidencePath" id="evidencePath" value="上传"></input></td>
                </tr>
                <tr rowspan="5">
                    <td width = "20%">已上传附件:</td>
                    <td></td>
                <tr rowspan="5">
                    <td>谈话记录：</td>
							<td colspan="5"><input type="text" name="record"   multiline=true 
								class="f1 easyui-textbox" value=""  style="width:400px;height:80px;"/></td>
                </tr> 
                <tr rowspan="5">
                    <td>备注：</td>
							<td colspan="5"><input type="text" name="note"  multiline=true 
								class="f1 easyui-textbox" value="" style="width:400px;height:80px;"/></td>
                </tr> 
				<tr align="center">
					<td colspan="5"><a href="javascript:void(0)" id="btn1" class="easyui-linkbutton" onclick="firstTalkAdd();">保存</a>
						<a  class="easyui-linkbutton" onclick="$('#firstTalkDialog1').dialog('close');">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
<script type="text/javascript">
	function addFirstTalk(){
		var id='${culprit.id }';
		$('#firstTalkForm').form('clear');
		$('#firstTalkForm').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
			culpritId : id
		});
		$('#talkTime').val(new Date().format("yyyy-MM-dd"));
		$('#firstTalkDialog1').dialog('open')
	}
	function firstTalkAdd(){
		$('#firstTalkForm').form('submit');
	}
	//新增表单
    $('#firstTalkForm').form({
		url:'${ctx}/dailymgr/talk/save',
		onSubmit:function(o){
			return $(this).form('validate');
		},
		success:function(data){
			data = JSON.parse(data);
			if(data.status==200){
				$.messager.show({
					title:'提示信息!' ,
					msg:data.msg
				});	
				$('#firstTalkDialog1').dialog('close');
				$('#firstTalk_list_content').datagrid('reload');
				
			}else{
				alert(data.msg);
			}
			
		}
	});
	$(function() {

		//$('#firstTalk_list_content').datagrid({
		//	fit : true
		//});
		/**
		 * 关闭窗口方法
		 */
		$('#btn2').click(function() {
			$('#mydialog').dialog('close');
		});

		$('#searchbtn').click(
				function() {
					$('#firstTalk_list_content').datagrid('load',
							serializeForm($('#searchForm')));
				});

		function cleanSearch() {
			$('#firstTalk_list_content').datagrid('load', {});
			$('#searchForm').form().find('input').val('');
		}

		//js方法：序列化表单 			
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
	});

	function formatRole(value, row, index) {
		var str = '';
		$.ajax({
			type : 'get',
			url : '${ctx}/sys/sysRole/findById?id=' + value,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			success : function(result) {
				str = result.name;
			}
		});
		return str;

	}

	function formatOper(val,row,index){  
		var operation=$.formatString('<a href="javascript:schemeUpdate(\'{0}\');"  title="详情"><span style="color:blue;"><strong><u>详情</u><strong></span></a>',row.id);
		
		operation+='&nbsp;&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:schemeUpdate(\'{0}\');"  title="修改"><span style="color:blue;"><strong><u>修改</u><strong></span></a>', row.id);
		
	    return operation;
	} 

	function askLeaveDetail(id){
		var url = '${ctx}/dailymgr/askLeave/detail?id=' + id;
		open_layer('请假流程详情',url);
		
	}
	
	
	
	function open_layer(title,url){
		
		var index = layer.open({
			type: 2,
			title: title,
			content: url
		});
		layer.full(index);
	}
   
	
	function formatStatusKey(value, row, index){
		var str = '';
		$.ajax({
			type : 'post',
			url : '${ctx}/sys/sysDic/getDicValue?tabName=sf_askleave&columnName=dic_status_key&key='+value,
			cache : false,
			async : false, //同步请求
			data : {
				id : value
			},
			dataType : 'json',
			success : function(result) {
				
				if(result!=null){
					str = result.value;
				}
				
			}
		});
		return str;
		
	}
	function fomatIsOverdue(value,row,index){
		if(value==1){
			return '是';
		}else{
			return '否';
		}
	}
	function formatPhone(value,row,index){
		var str='${culprit.contactPhone}'
			return str;

	}
</script>


