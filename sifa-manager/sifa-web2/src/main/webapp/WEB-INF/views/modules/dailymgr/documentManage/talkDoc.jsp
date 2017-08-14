<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel"  style="height:50px;padding:5px; align:left" >
		<form id="searchForm_talk">
			<table>				
				<tr>
					<td>社区矫正人员：</td>
					<td><b>${culprit.name }</b></</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;谈话时间：</td>
					<td>
						<input name="searchStartDate"   class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"value=""/>&nbsp;
					</td>
					<td>至</td>
					<td>
						<input name="searchEndDate"  class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
						editable="false"  />
					</td>
					<td colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="searchbtn_talk">查询</a>
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-undo'"  id="cleanBtn_talk">重置</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="easyui-panel" style="height:90%;padding:5px;" title="谈话教育列表">
		<table class="easyui-datagrid" id="talk_list_content" style="height:100%;"
			data-options="singleSelect:true,noheader:true,rownumbers:true,collapsible:true,toolbar:'',striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/talk/list?culpritId=${culprit.id }',method:'post',onLoadSuccess:function (data) {
                         $('.organization-easyui-linkbutton-info').linkbutton({text:'详细',plain:true,iconCls:'fi-info icon-blue'}); 
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'talkStartTime',align:'center',width:'15%'">谈话开始时间</th>
					<th data-options="field:'talkEndTime',align:'center',width:'15%'">谈话结束时间</th>
					<th data-options="field:'talkor',align:'center',width:'15%'">谈话人</th>
					<th data-options="field:'place',align:'center',width:'15%'">谈话地点</th>
				 	<th data-options="field:'isFirstTalk',align:'center',width:'15%',formatter:function(value,rowData,rowIndex){
				    if(rowData.isFirstTalk == 0){
				    	return '首次谈话记录';
				    }
				    else {
				    	return '个别谈话记录';
				    }
				}">谈话类型</th>
				 	<th data-options="field:'_opt',width:'23%',align:'center',formatter:formatOper">操作</th>  
				</tr>
			</thead>
		</table>
	</div>
	
	<div id="talkDialog" title="详情" modal=true resizable=true data-options="iconCls:'fi-info icon-blue'"
	        maximizable=true class="easyui-dialog" closed=true style="width:900px;padding:5px;">
		<form id="talkForm" action="" method="post">
			 <table width="100%" class="grid">
                <tr>
                	<th width = "15%">谈话日期：</th>
                    <td width = "35%"><span id="talkTime"></span></td>
                    <th width = "15%">谈话人：</th>
                    <td width = "35%"><span id="talkor"></span></td>
                </tr>
                  <tr>
                    <th>谈话开始时间：</th>
                    <td><span id="talkStartTime"></span></td>
                     <th>谈话结束时间：</th>
                    <td colspan="3"><span id="talkEndTime"></span></td>
                </tr>
                <tr>
                 	<th>谈话地点：</th>
                    <td><span id="place"></span></td>
                     <th>记录人：</th>
                    <td ><span id="recorder"></span></td>
                </tr>
                <tr>
                    <th width="10%">谈话记录：</th>
					<td colspan="5">
						<textArea id="record"  class="easyui-validatebox" style="width: 95%;height:400px;overflow:auto;resize:none;" readonly="readonly"></textArea>
						<br/>
					</td>
                </tr> 
                <tr>
                    <th>备注：</th>
						<td colspan="5">
						<textArea id="note"  class="easyui-validatebox" style="width: 95%;height:100px;overflow:auto;resize:none;" readonly="readonly"></textArea>
						</td>
                </tr>
            </table>
		</form>
		<div align="center">
         	<p colspan="4"> 
         		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-print icon-blue'"  id="talkPrintBtn"><span id="talkPrintTitle"></span></a>
		     	&nbsp;&nbsp;&nbsp;&nbsp;
		     	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#talkDialog').dialog('close');">关闭</a>
		  	</p>
    	</div> 
	</div>
	
	<div id="talkPrintDialog"></div>
	
	
	<%-- <div id="addTalkDialog" title="新增个别谈话教育" modal=true resizable=true
	        maximizable=true class="easyui-dialog" closed=true style="width:1200px;padding:5px;">
		<form id="addTalkForm" action="" method="post">
			<input name="id"   type="hidden"/>
            <table width="100%" class= "grid">
                <tr>
                	<th width = "10%"><span style="color:red;">*</span>谈话日期：</th>
                    <td width = "23%"><input  name="talkTime" required=true missingMessage="谈话日期不能为空！" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
                    editable="false" class= "Wdate easyui-validatebox" /></td>
                    <th width = "10%"><span style="color:red;">*</span>谈话人：</th>
                    <td width = "23%"><input required=true missingMessage="谈话人不能为空！" name="talkor" id="talkor" class="f1 easyui-textbox"/></td>
                     <th width = "10%">记录人：</th>
                    <td colspan="4"><input  name="recorder" id="recorder" class="f1 easyui-textbox" /></td>
                </tr>
                  <tr>
                    <th width = "10%"><span style="color:red;">*</span>谈话开始时间：</th>
                    <td width = "23%"><input name="talkStartTime" id="talkStartTime" required=true missingMessage="谈话开始时间不能为空！" onfocus="var talkEndTime=$dp.$('talkEndTime');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm:ss',onpicked:function(){talkEndTime.focus();},maxDate:'#F{$dp.$D(\'talkEndTime\')}'})""
                    editable="false" class= "Wdate easyui-validatebox" /></td>
                     <th width = "10%"><span style="color:red;">*</span>谈话结束时间：</th>
                    <td colspan="6"><input  name="talkEndTime" id="talkEndTime" required=true missingMessage="谈话结束时间不能为空！" onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'talkStartTime\')}'})"
                    editable="false" class= "Wdate easyui-validatebox" /></td>
                </tr>
                <tr>
                 <th><span style="color:red;">*</span>谈话地点：</th>
                    <td colspan="8"><input name="addressPro" id="addressPro" class="easyui-combobox" required=true value=46 style="width:100px"
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelHeight:'200',editable:false" ></input>省
                    	<input name="addressCity" id="addressCity" class="easyui-combobox" required=true editable=false style="width:100px"></input>市
                    	<input name="addressCountry" id="addressCountry" class="easyui-combobox" required=true editable=false style="width:100px"></input>县（区）
                    	<input id="addressStreet" name="addressStreet" class="f1 easyui-textbox" required=true/>乡镇（街道）
                    	<input name="addressDetail" id="addressDetail" class="f1 easyui-textbox" required=true/>（详细门牌号）
                    </td>
                    </tr>
                <tr rowspan="5">
                    <th width="10%">谈话记录：</th>
					<td colspan="8">
						 <textarea  name="record" id="record" class="easyui-validatebox"  multiline="true"
						onkeydown='textarealength(this,2000)' onkeyup='textarealength(this,2000)' 
							style="width:1000px;height:400px;" maxlength=2000></textarea>
						<br/>
						<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">2000</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
						</p>
					</td>
                </tr> 
                <tr rowspan="5">
                    <th>备注：</th>
						<td colspan="8">
						<textarea  name="note" id="note" class="easyui-validatebox"  multiline="true"
						onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)' 
							style="width:1000px;height:50px;" maxlength=200></textarea>
						<br/>
						<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
						</p>
                </tr>
            </table>                
		</form>
		 <div align="center">
         <p colspan="4"> 
         <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="submitTalkForm();">保存</a>
		  			&nbsp;&nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-refresh'" onclick="$('#addTalkForm').form().find('input').val('');">清空</a>
		  &nbsp;&nbsp;&nbsp;&nbsp;
		    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#addTalkForm').form('clear');$('#addTalkDialog').dialog('close');">关闭</a>
		  </p>
    	</div> 	
	</div> --%>

	<!-- <div id="toolbarTalk" style="display: none;">
	        <a onclick="addTalk();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
	</div>	 -->
	
<script type="text/javascript">
	/* function addTalk(){
		$('#addTalkForm').form('clear');
		$('#addTalkDialog').dialog('open');		
	} */
	//保存个别谈话教育
	/* function submitTalkForm(){
		if($('#addTalkForm').form('validate')){	
			$.ajax({
				type: 'post' ,
				url: '${ctx}/dailymgr/talk/save?culpritId=${culprit.id }&isFirstTalk=1',
				data:$('#addTalkForm').serialize(),
				dataType:'json' ,
				success:function(result){
					$.messager.show({
    					title:'提示信息!' ,
    					msg:result.msg
    				});
					$('#addTalkForm').form('clear');
    				$('#addTalkDialog').dialog('close');
    				$('#talk_list_content').datagrid('reload');
				} ,
				error:function(result){
					$.messager.show({
    					title:'提示信息!' ,
    					msg:result.msg
    				});
				}
			});
		} else {
			$.messager.show({
				title:'提示信息!' ,
				msg:'数据验证不通过'
			});
		}	
   }
 */

	$(function() {
		$('#searchbtn_talk').click(function() {
			$('#talk_list_content').datagrid('load',serializeForm($('#searchForm_talk')));
		});
		$('#cleanBtn_talk').click(function() {
			$('#talk_list_content').datagrid('load', {});
			$('#searchForm_talk').form().find('input').val('');
		});
		
		
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

	

	function formatOper(val,row,index){  
    	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="talkDetail(\''+index+'\')">详细</a>'; 
    	return operation;
	} 

	var id='';
	//详细
	function talkDetail(index){
		$('#talk_list_content').datagrid('selectRow',index); 
		var arr = $('#talk_list_content').datagrid('getSelections');
		$('#talkTime').html(arr[0].talkTime);
		$('#talkor').html(arr[0].talkor);
		$('#recorder').html(arr[0].recorder);
		$('#talkStartTime').html(arr[0].talkStartTime);
		$('#talkEndTime').html(arr[0].talkEndTime);
		$('#place').html(arr[0].place);
		$('#record').val(arr[0].record);
		$('#note').val(arr[0].note);
		id=arr[0].id;
		if(arr[0].isFirstTalk == 0){
			$('#talkPrintTitle').html('打印《社区服刑人员首次谈话记录》');
		}else{
			$('#talkPrintTitle').html('打印《社区服刑人员个别教育记录表》');
		}
	 	$('#talkDialog').dialog('open');
	 	$('#talk_list_content').datagrid('unselectAll'); 
		
 
	}
	
	$('#talkPrintBtn').click(function (){
		 var url = '${ctx}/dailymgr/talk/printfirstTalk?id=' + id;
		$('#talkPrintDialog').dialog({
		    title: $('#talkPrintTitle').html(),
	        iconCls:'fi-print icon-blue',
		    width: 800,    
		    height: 600,    
		    href: url,    
		    modal: true,
	        resizable : true,
	        maximizable:true, 
		    buttons :[{
				text:'打印',
	            iconCls:'fi-print icon-blue',
				handler:function(){
					$('#talkPrintBtn1').click();
				}
			}, {
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#talkPrintDialog').dialog('close');
				}
			}]
		}); 
	});
	
		
		/* $('#talkDialog').dialog({
	        title : '谈话教育详情',
	        iconCls:'fi-info icon-blue',
	        width : 1300,
	        height :800,
	        resizable:true,
	        maximizable:true,
	        href : '${ctx}/dailymgr/talk/detail?id='+id,
	        buttons : [ {
	            text : '打印《社区矫正人员个别谈话教育登记表》',
	            iconCls:'fi-page-multiple',
	            handler : function() {
	               
	            }
	        }]
	    });		  */

	
	//修改
	/* function talkUpdate(index){ 
		$('#talk_list_content').datagrid('selectRow',index); 
	 	var arr = $('#talk_list_content').datagrid('getSelections');
	 	$('#addTalkDialog').dialog({
				title : '修改',
				iconCls:'fi-pencil icon-blue'
			});
	 	
	 	$('#addTalkForm').form('clear')
	 	$('#addTalkForm').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
				id : arr[0].id,
				talkTime : arr[0].talkTime,
				talkor : arr[0].talkor,
				recorder : arr[0].recorder,
				talkStartTime : arr[0].talkStartTime,
				talkEndTime : arr[0].talkEndTime,
				addressPro : arr[0].addressPro,
				addressCity : arr[0].addressCity,
				addressCountry : arr[0].addressCountry,
				addressStreet : arr[0].addressStreet,
				addressDetail : arr[0].addressDetail,
				record : arr[0].record,
				note : arr[0].note
			});
	 	$('#addTalkDialog').dialog('open');
	 	$('#talk_list_content').datagrid('unselectAll'); 
	 }
	 */
	 /* function talkDelete(id){
	 	   $.messager.confirm('提示信息', '确认删除?', function(r) {
	 			if (r) {
	 				$.post('${ctx}/dailymgr/talk/delete', {
	 					id : id
	 				}, function(result) {
	 					//1 刷新数据表格 
	 					$('#talk_list_content').datagrid('reload');
	 					$.messager.show({
	 						title : '提示信息!',
	 						msg : '删除成功'
	 					});
	 				});
	 			} else {
	 				return;
	 			}
	 		});
	 	} */
	
	

   
	
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

</html>
