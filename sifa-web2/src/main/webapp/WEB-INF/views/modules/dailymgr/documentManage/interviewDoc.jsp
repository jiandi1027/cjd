<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-panel"  style="height:50px;padding:5px; align:left" >
		<form id="searchForm_interview">
			<table>				
				<tr>
					<td>社区矫正人员：</td>
					<td><b>${culprit.name }</b></</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;走访时间：</td>
					<td>
						<input name="searchStartDate" id="searchStartDate"  class="Wdate easyui-validatebox" onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})"/>&nbsp;
					</td>
					<td>至</td>
					<td>
						<input name="searchEndDate" id="searchEndDate"  class="Wdate easyui-validatebox" onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate\')}'})"
						editable="false"  />
					</td>
					<td colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="searchbtn_interview">查询</a>
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-undo'"  id="cleanBtn_interview">重置</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div class="easyui-panel" style="height:90%;padding:5px;" title="走访登记列表">
		<table class="easyui-datagrid" id="interview_list_content" style="height:100%;"
			data-options="singleSelect:true,noheader:true,rownumbers:true,collapsible:true,toolbar:'',striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/interview/list?culpritId=${culprit.id }',method:'post',onLoadSuccess:function (data) {
                         $('.organization-easyui-linkbutton-info').linkbutton({text:'详细',plain:true,iconCls:'fi-info icon-blue'}); 
                        $('.organization-easyui-linkbutton-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-fi-x').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'interviewPerson',align:'center',width:'20%'">走访人</th>
					<th data-options="field:'interviewPlace',align:'center',width:'40%'">走访地点</th>
					<th data-options="field:'interviewDate',align:'center',width:'15%'">走访时间</th>
					<th data-options="field:'_opt',width:'23%',formatter:formatOper,align:'center'">操作</th>  
				</tr>
			</thead>
		</table>
	</div>
	<%-- <div id="addInterviewDialog" title="新增走访登记" modal=true resizable=true
	        maximizable=true class="easyui-dialog" closed=true style="width:1200px;padding:5px;">
		<form id="addInterviewForm" action="" method="post">
			<input name="id"   type="hidden"/>
            <table width="100%" class= "grid">
                <tr>
					<th width="10%"><span style="color:red;">*</span>走访人：</th>
					<td width="23%"><input required=true missingMessage="走访人不能为空！" name="interviewPerson" id="interviewPerson"/></td>
					<th width="10%"><span style="color:red;">*</span>走访日期：</th>
					<td colspan="3" width="57%"><input required=true name="interviewDate" editable="false" class="easyui-datebox" /></td>
					
				</tr>
				<tr>
					<th width="10%">走访对象：</th>
					<td width="23%"><select id="zfdx" class="easyui-combobox"  name="zfdx" id = "zfdx" style="width:170px;" panelHeight=auto>
							<option value="对象本人">对象本人</option>
							<option value="监护人">监护人</option>
							<option value="志愿者">志愿者</option>
							<option value="矫正小组成员">矫正小组成员</option>
							<option value="村居工作站成员">村居工作站成员</option>
							<option value="被害人">被害人</option>
							<option value="亲属">亲属</option>
							<option value="朋友">朋友</option>
							<option value="邻居">邻居</option>
							<option value="其他">其他</option>
					</select></td>
					<th width="10%">走访原因：</th>
					<td width="23%"><select id="interviewReason" class="easyui-combobox"  name="interviewReason" id = "interviewReason" style="width:170px;" panelHeight=auto>
							<option value="日常走访">日常走访</option>
							<option value="专项活动走访">专项活动走访</option>
							<option value="节假日等特殊时间走访">节假日等特殊时间走访</option>
							<option value="违规违纪走访">违规违纪走访</option>
							<option value="帮困扶助">帮困扶助</option>
							<option value="突发事件">突发事件</option>
							<option value="其他">其他</option>
					</select></td>
					<th width="10%">行动能力：</th>
					<td width="24%"><select id="xdnl" class="easyui-combobox" name="xdnl" id="xdnl" style="width:170px;" panelHeight=auto>
							<option value="正常">正常</option>
							<option value="行动不便">行动不便</option>
							<option value="无行动能力">无行动能力</option>
					</select></td>
				</tr>
				<tr>
					<th>健康状况：</th>
					<td><select id="jkzk" class="easyui-combobox" name="jkzk" id="jkzk" style="width:170px;" panelHeight=auto>
							<option value="健康">健康</option>
							<option value="一般">一般</option>
							<option value="疾病">疾病</option>
							<option value="身体残疾">身体残疾</option>
							<option value="中风">中风</option>
							<option value="高血压">高血压</option>
							<option value="糖尿病">糖尿病</option>
							<option value="心脏病">心脏病</option>
							<option value="其他">其他</option>
					</select></td>
					<th>不良嗜好：</th>
					<td><select id="blsh" class="easyui-combobox" name="blsh" id="blsh" style="width:170px;" panelHeight=auto>
							<option value="无">无</option>
							<option value="有吸毒史">有吸毒史</option>
							<option value="酗酒">酗酒</option>
							<option value="赌博">赌博</option>
							<option value="沉迷网络">沉迷网络</option>
							<option value="其他">其他</option>
					</select></td>
					<th>生活来源：</th>
					<td><select id="shly" class="easyui-combobox" name="shly" id="shly" style="width:170px;" panelHeight=auto>
							<option value="自谋职业">自谋职业</option>
							<option value="家庭资助">家庭资助</option>
							<option value="低保">低保</option>
							<option value="无生活来源">无生活来源</option>
							<option value="其他">其他</option>
					</select></td>
				</tr>
				<tr>
					<th>经济情况：</th>
					<td><select id="jjqk" class="easyui-combobox" name="jjqk" id="jjqk" style="width:170px;" panelHeight=auto>
							<option value="无收入">无收入</option>
							<option value="经济条件较差">经济条件较差</option>
							<option value="经济条件一般">经济条件一般</option>
							<option value="经济条件较好">经济条件较好</option>
					</select></td>
					<th>婚姻情况：</th>
					<td><select id="hyqk" class="easyui-combobox" name="hyqk" id = "hyqk" style="width:170px;" panelHeight=auto>
							<option value="未婚">未婚</option>
							<option value="已婚">已婚</option>
							<option value="离异">离异</option>
							<option value="丧偶">丧偶</option>
					</select></td>
					<th>居住情况：</th>
					<td><select id="jzqk" class="easyui-combobox" name="jzqk" id = "jzqk" style="width:170px;" panelHeight=auto>
							<option value="与家人同住">与家人同住</option>
							<option value="与父母同住">与父母同住</option>
							<option value="与子女同住">与子女同住</option>
							<option value="独居">独居</option>
							<option value="住养老院、社会福利院">住养老院、社会福利院</option>
							<option value="其他">其他</option>
					</select></td>
				</tr>
					<tr>
					<th>活动情况：</th>
					<td><select id="hdqk" class="easyui-combobox" name="hdqk" id="hdqk" style="width:170px;" panelHeight=auto>
							<option value="正常">正常</option>
							<option value="有私自外出可能">有私自外出可能</option>
							<option value="与社会不良人员交往">与社会不良人员交往</option>
					</select></td>
					<th>重大变故：</th>
					<td><select id="zdbg" class="easyui-combobox" name="zdbg" id = "zdbg" style="width:170px;" panelHeight=auto>
							<option value="无">无</option>
							<option value="亲人去世">亲人去世</option>
							<option value="本人或家人失业">本人或家人失业</option>
							<option value="重大家庭纠纷">重大家庭纠纷</option>
							<option value="家人患重病">家人患重病</option>
							<option value="与他人发生重大矛盾纠纷">与他人发生重大矛盾纠纷</option>
							<option value="离异">离异</option>
							<option value="发生重大财产变化">发生重大财产变化</option>
							<option value="发生大额家庭支出">发生大额家庭支出</option>
							<option value="其他">其他</option>
					</select></td>
					<th>近期表现：</th>
					<td><select id="jqbx" class="easyui-combobox" name="jqbx" id = "jqbx" panelHeight=auto>
							<option value="正常">正常</option>
							<option value="有重新再犯罪倾向">有重新再犯罪倾向</option>
							<option value="有参与赌博倾向">有参与赌博倾向</option>
							<option value="有参与群体性事件倾向">有参与群体性事件倾向</option>
							<option value="有暴力倾向">有暴力倾向</option>
							<option value="有自杀倾向">有自杀倾向</option>
							<option value="与他人或家人有矛盾纠纷">与他人或家人有矛盾纠纷</option>
							<option value="情绪较波动">情绪较波动</option>
							<option value="其他">其他</option>
					</select></td>
				</tr>
				    <tr>
                <th><span style="color:red;">*</span>走访地点：</th>
                    <td colspan="5"><input name="addressPro" id="addressPro" class="easyui-combobox" required=true value=46 style="width:100px"
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelHeight:'200',editable:false" ></input>省
                    	<input name="addressCity" id="addressCity1" class="easyui-combobox" required=true editable=false style="width:100px"></input>市
                    	<input name="addressCountry" id="addressCountry1" class="easyui-combobox" required=true editable=false style="width:100px"></input>县（区）
                    	<input id="addressStreet" name="addressStreet1" class="f1 easyui-textbox" required=true/>乡镇（街道）
                    	<input name="addressDetail" id="addressDetail1" class="f1 easyui-textbox" required=true/>（详细门牌号）
                    </td>
                 <tr>
				<tr rowspan="5">
                    <th>具体走访情况：</th>
                    <td colspan="5">
                    	<textarea  name="interviewCondition" id="interviewCondition" class="easyui-validatebox"  multiline="true"
						onkeydown='textarealength(this,1000)' onkeyup='textarealength(this,1000)' 
							style="width:1000px;height:400px;" maxlength=1000></textarea>
						<br/>
						<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">1000</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
						</p>
					</td>
                </tr>
            </table>                
		</form>
		<div align="center">
         <p colspan="4"> 
         <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="submitInterviewForm();">保存</a>
		  			&nbsp;&nbsp;&nbsp;&nbsp;
		  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-refresh'" onclick="$('#addInterviewForm').form().find('input').val('');">清空</a>
		  &nbsp;&nbsp;&nbsp;&nbsp;
		    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'fi-x icon-blue'"  onclick="$('#addInterviewForm').form('clear');$('#addInterviewDialog').dialog('close');">关闭</a>
		  </p>
    	</div> 	
	</div> --%>
		
	 <div id="interviewDetail" modal=true title="走访登记详情"  resizable=true data-options="iconCls:'fi-info icon-blue'"
	        maximizable=true class="easyui-dialog" closed=true style="width:800px;padding:5px;">
            <table width="100%" class='grid'>
				<tr>
					<th width="10%">走访人：</th>
					<td width="23%"><span id="interviewPerson"></span></td>
					<th width="10%">走访日期：</th>
					<td width="23%"><span id="interviewDate"></span></td>
					<th width="10%"></th>
					<td width="23%"></td>
				</tr>
				<tr>
					<th>走访对象：</th>
					<td><span id="zfdx"></span></td>
					<th>走访原因：</th>
					<td><span id="interviewReason"></span></td>
					<th>行动能力：</th>
					<td><span id="xdnl"></span></td>
				</tr>
				<tr>
					<th>健康状况：</th>
					<td><span id="jkzk"></span></td>
					<th>不良嗜好：</th>
					<td><span id="blsh"></span></td>
					<th>生活来源：</th>
					<td><span id="shly"></span></td>
				</tr>
				<tr>
					<th>经济情况：</th>
					<td><span id="jjqk"></span></td>
					<th>婚姻情况：</th>
					<td><span id="hyqk"></span></td>
					<th>居住情况：</th>
					<td><span id="jzqk"></span></td>
				</tr>
					<tr>
					<th>活动情况：</th>
					<td><span id="hdqk"></span></td>
					<th>重大变故：</th>
					<td><span id="zdbg"></span></td>
					<th>近期表现：</th>
					<td><span id="jqbx"></span></td>
				</tr>
				<tr><th>走访地点：</th><td colspan="5"><span id="address"></span></td><tr>
				<tr>
                    <th>具体走访情况：</th>
							<td colspan="5">
							<textArea id="interviewCondition"  class="easyui-validatebox" style="width: 80%;height:50px;overflow:auto;resize:none;" readonly="readonly"
					 maxlength="200"></textArea></td>
                </tr> 
                <tr align="center">
					<td colspan="6">
						<a href="javascript:void(0)"  class="easyui-linkbutton" onclick="$('#interviewDetail').dialog('close');" data-options="iconCls:'fi-x icon-blue'">关闭</a></td>
				</tr>
            </table>           
    </div>
	
<div id="toolbarInterview" style="display: none;">
	        <a onclick="addInterview();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
</div>	
<div id="interviewDialog"></div>
<div id="interviewDialog1"></div>
<script type="text/javascript">
function addInterview(){
	$('#addInterviewForm').form('clear');
	$('#addInterviewDialog').dialog('open');		
}
//保存个别谈话教育
function submitInterviewForm(){
	if($('#addInterviewForm').form('validate')){	
		$.ajax({
			type: 'post' ,
			url: '${ctx}/dailymgr/interview/save?culpritId=${culprit.id }',
			data:$('#addInterviewForm').serialize(),
			dataType:'json' ,
			success:function(result){
				$.messager.show({
					title:'提示信息!' ,
					msg:result.msg
				});
				$('#addInterviewForm').form('clear');
				$('#addInterviewDialog').dialog('close');
				$('#interview_list_content').datagrid('reload');
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
	
	
	
	$(function() {
		$('#searchbtn_interview').click(function() {
			$('#interview_list_content').datagrid('load',serializeForm($('#searchForm_interview')));
		});
		$('#cleanBtn_interview').click(function() {
			$('#interview_list_content').datagrid('load', {});
			$('#searchForm_interview').form().find('input').val('');
		});
		
		/* 
		var interviewPerson='';
		$('#interviewPerson').combobox({    
		    url:'${ctx}/sys/sysAccount/findSysAccount?groupId='+'${culprit.groupId}',    
		    valueField:'id',    
		    textField:'accountname',
		    panelHeight:'auto',
		    multiple:true
		}); 
		  /*选择固定居住省触发省下面的市*/
   		/* $('#addressPro1').combobox({    
   			onSelect: function(record){
        		$('#addressCity1').combobox({    
        			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
        		    valueField:'id',    
        		    textField:'areaName',
        		    editable:'false'    
        		}); 
			}   
   		});  */
        /*选择固定居住省触发省下面的市*/
   		/* $('#addressCity1').combobox({    
   			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent=46',    
   		    valueField:'id',    
   		    textField:'areaName',
		    editable:'false'    
   		});  */
       /*选择固定市触发市下面的县*/
      /*  $('#addressCity1').combobox({
       		onSelect: function(record){
       			$('#addressCountry1').combobox({    
       			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
       		    valueField:'id',    
       		    textField:'areaName',
    		    editable:'false' 
       	
       			}); 
			}
		});	 */


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
		var space = '&nbsp;';
    	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="interviewDetail(\''+index+'\')">详细</a>'+space; 
    	/* operation+='<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" onclick="interviewUpdate(\''+row.id+'\')">修改</a>'+space;
    	operation+='<a href="javascript:void(0);" class="organization-easyui-linkbutton-fi-x" onclick="interviewDelete(\''+row.id+'\')">删除</a>'; */
    	return operation;
	} 
	
	
	//详细
	function interviewDetail(index){
		$('#interview_list_content').datagrid('selectRow',index); 
		var arr = $('#interview_list_content').datagrid('getSelections');
		$('#interviewPerson').html(arr[0].interviewPerson);
		$('#interviewDate').html(arr[0].interviewDate);
		$('#zfdx').html(arr[0].zfdx);
		$('#interviewReason').html(arr[0].interviewReason);
		$('#xdnl').html(arr[0].xdnl);
		$('#jkzk').html(arr[0].jkzk);
		$('#blsh').html(arr[0].blsh);
		$('#shly').html(arr[0].shly);
		$('#jjqk').html(arr[0].jjqk);
		$('#hyqk').html(arr[0].hyqk);
		$('#jzqk').html(arr[0].jzqk);
		$('#hdqk').html(arr[0].hdqk);
		$('#zdbg').html(arr[0].zdbg);
		$('#jqbx').html(arr[0].jqbx);
		//console.log(sy.getAreaValue(arr[0].addressPro));
		$('#address').html((sy.getAreaValue(arr[0].addressPro))+(sy.getAreaValue(arr[0].addressCity))+(sy.getAreaValue(arr[0].addressCountry))+arr[0].addressStreet+arr[0].addressDetail);
		$('#interviewCondition').val(arr[0].interviewCondition);
	 	$('#interviewDetail').dialog('open');
	 	$('#interview_list_content').datagrid('unselectAll'); 
	    
	    

	}
	/* //修改
	function interviewUpdate(id){ 
		
		$('#interviewDialog').dialog({
	        title : '修改走访登记',
	        iconCls:'fi-pencil icon-blue',
	        width : 1300,
	        height :800,
	        resizable:true,
	        maximizable:true,
	        href : '${ctx}/dailymgr/interview/add?id='+id,
	        buttons : [ {
	            text : '保存',
	            iconCls:'fi-page-multiple',
	            handler : function() {
	            	submitInterviewForm();
	            }
	        }]
	    });		
	 }
	
	 function interviewDelete(id){
	 	   $.messager.confirm('提示信息', '确认删除?', function(r) {
	 			if (r) {
	 				$.post('${ctx}/dailymgr/interview/delete', {
	 					id : id
	 				}, function(result) {
	 					//1 刷新数据表格 
	 					$('#interview_list_content').datagrid('reload');
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
	
	
</script>

</html>
