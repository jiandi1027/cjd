<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form  action="${ctx}/culpritinfo/culpritComplicity/save" method="post" id="personDocInfo">
 <div class="easyui-panel" title="个人资料" style="width:100%;padding:5px;margin:0 auto;">
     <input type="hidden" name="id" value="${culprit.id }" />
            <table width="100%" class="grid">
                <tr>
	                <th width="10%"><span class="c-red">*</span>健康状况：</th>
					<td width="23%"><input name="DicHealthyStatusKey" id="DicHealthyStatusKey" class="easyui-combobox" required=true value="<c:if test='${empty culprit.dicHealthyStatusKey }'>41001</c:if><c:if test='${!empty culprit.dicHealthyStatusKey }'>${culprit.dicHealthyStatusKey }</c:if>"
	                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=41000',panelHeight:'auto',editable:false"></input>
	                </td>
                	<th width="10%">是否有传染病史：</th>
	 				<td width="23%">
			 			<input id="dicSfycrbsKey0"  type="radio" name="dicSfycrbsKey" value="1"  <c:if test="${culprit.dicSfycrbsKey eq 1 }">checked="checked"</c:if> style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 			<input id="dicSfycrbsKey1"  type="radio" name="dicSfycrbsKey" value="0" <c:if test="${culprit.dicSfycrbsKey eq 0 }">checked="checked"</c:if> style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
	 				</td>
	 				<th width="10%">心里是否健康：</th>
		 			<td width="23%">
			 			<input type="radio" id="dicXlsfjkKey0" name="dicXlsfjkKey" value="1"  <c:if test="${culprit.dicXlsfjkKey eq 1 }">checked="checked"</c:if> style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 			<input type="radio" id="dicXlsfjkKey1" name="dicXlsfjkKey" value="0"  <c:if test="${culprit.dicXlsfjkKey eq 0 }">checked="checked"</c:if> style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
		 			</td>
                </tr>
                <tr>
                   <th width="10%">具体健康状况：</th>
					<td><input type="text" name="healthyStatusInfo" id="healthyStatusInfo" value="${ culprit.healthyStatusInfo}" class="f1 easyui-textbox" /></td>
					<th width="10%">具体传染病史：</th>
					<td>
						<c:if test="${culprit.dicSfycrbsKey ne 0 }">
			 			<input name="contagionId" id="contagionId" class="easyui-combobox"  value="${culprit.contagionId}"
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=64000',panelHeight:'auto',disabled: true,editable:false"></input>
			 			</c:if>
			 			<c:if test="${culprit.dicSfycrbsKey eq 0 }">
			 				<input name="contagionId" id="contagionId" class="easyui-combobox"  value="${culprit.contagionId}"
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=64000',panelHeight:'auto',editable:false"></input>
			 			</c:if>
			 		</td >
					<th width="10%">具体心里状况：</th>
					<td>
						<c:if test="${culprit.dicXlsfjkKey eq 1 }">
				 		<input type="text" name="mentalInfo" id="mentalInfo" value="${culprit.mentalInfo}"
									class="f1 easyui-textbox"/>
				 		</c:if>
				 		<c:if test="${culprit.dicXlsfjkKey ne 1 }">
				 				<input type="text" name="mentalInfo" id="mentalInfo" value="${culprit.mentalInfo}"
									class="f1 easyui-textbox" data-options="disabled: true"  />
				 		</c:if>
			 		</td>
                </tr>
                <tr>
                    <th width="10%"><span class="c-red">*</span>文化程度：</th>
					<td><input name="dicWhcdKey" id="dicWhcdKey" class="easyui-combobox" required=true value="${culprit.dicWhcdKey}"
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=19000',panelHeight:'auto',editable:false"></input></td>
					<th width="10%"><span class="c-red">*</span>就业就学情况：</th>
					<td><input name="dicWorkStatusKey" id="dicWorkStatusKey" class="easyui-combobox" required=true value="${culprit.dicWorkStatusKey}"
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=66000',panelHeight:'auto',editable:false"></input></td>
					<th width="10%">鉴定机构：</th>
					<td><c:if test="${culprit.dicXlsfjkKey eq 1 }">
			 				<input type="text" name="identifyOrg" id="identifyOrg" value="${culprit.identifyOrg}"
								class="f1 easyui-textbox" />
			 			</c:if>
			 			<c:if test="${culprit.dicXlsfjkKey ne 1 }">
			 				<input type="text" name="identifyOrg" id="identifyOrg" value="${culprit.identifyOrg}"
								class="f1 easyui-textbox" data-options="disabled: true"   />
			 			</c:if>
					</td>
                </tr>
                <tr>
                    <th><span class="c-red">*</span>婚姻状况：</th>
					<td ><input name="dicHyzkKey"  id="dicHyzkKey" class="easyui-combobox" required=true value="${culprit.dicHyzkKey}"
					data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=11000',panelHeight:'auto',editable:false"></input></td>
                    <th>原政治面貌：</th>
					<td ><input name="dicYzzmmKey" class="easyui-combobox"  value="${culprit.dicYzzmmKey}"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=65000',panelHeight:'auto',editable:false"></input></td>
					<th>现政治面貌：</th>
					<td ><input name="dicXzzmmKey" class="easyui-combobox" value="${culprit.dicXzzmmKey}"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=65000',panelHeight:'auto',editable:false"></input></td>
                </tr>
                <tr>
               	 	<th>职业：</th>
					<td><input type="text" name="job" id="job" value="${culprit.job}" class="f1 easyui-textbox"  /></td>
	                <th>工作单位：</th>
					<td><input type="text" name="newJob" id="newJob" value="${culprit.newJob}" class="f1 easyui-textbox"  /></td>
					<th>单位联系电话：</th>
					<td><input type="text" name="jobPhone" id="jobPhone" value="${culprit.jobPhone}" class="f1 easyui-textbox" data-options="validType:'telNum'" /></td>
				</tr>
				<tr>
					<th><span class="c-red">*</span>联系方式：</th>
					<td><input type="text" name="contactPhone" id="contactPhone" value="${culprit.contactPhone}" class="f1 easyui-textbox" required=true data-options="validType:'telno'"/></td>
	                <th>管理分区：</th>
					<td colspan="3"><input type="text" name="" id="" value="无" class="f1 easyui-textbox"  /></td>
				</tr>
				<tr>
                    <th width="10%">户籍详细地址：</th>
                    <td colspan="5">${culprit.regResidence }
                    </td>
                </tr>
                <tr>
                    <th width="10%"><span class="c-red">*</span>居住地详细地址：</th>
                    <td colspan="5"><input name="addressProId" id="addressProId" class="easyui-combobox" required=true value="${culprit.addressProId}"
                    data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelHeight:'200px',editable:false"></input>省
                    	<input type="hidden" id="addressPro" name="addressPro" value="${culprit.addressPro}">
                    	<input name="addressCityId" id="addressCityId" class="easyui-combobox" required=true value="${culprit.addressCityId}"
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent=${culprit.addressProId}',panelHeight:'200px',editable:false"></input>市
                    	<input type="hidden" id="addressCity" name="addressCity" value="${culprit.addressCity}">
                    	<input name="addressCountryId" id="addressCountryId" class="easyui-combobox" required=true value="${culprit.addressCountryId}"
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent=${culprit.addressCityId}',panelHeight:'200px',editable:false"></input>县（区）
                    	<input type="hidden" id="addressCountry" name="addressCountry"  value="${culprit.addressCountry}">
                    	<input id="addressStreet" name="addressStreet" class="f1 easyui-textbox" value="${culprit.addressStreet}">乡镇（街道）
                    	<input name="addressDetail" id="addressDetail" class="f1 easyui-textbox" value="${culprit.addressDetail}">（详细门牌号）
                    </td>
                </tr> 
                <tr>
                	<td style="text-align:center;" colspan="6">
                		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" data-options="iconCls:'icon-save'">保存</a>
                	</td>
                </tr> 
            </table>
    </div>
     <div class="easyui-panel" id="p2" title="其他资料" style="width:100%;height:80%;padding:5px;margin:0 auto">
	     <div id="tabs" class="easyui-tabs" style="width:100%;height:100%;" >   
		    <div title="工作情况" data-options="closable:false"  style="display:none;">
		    	<table class="easyui-datagrid" id="resume_content" style="height:100% ;width:100%;"
					data-options="singleSelect:true,collapsible:true,striped:true,rownumbers:true,toolbar:toolbarResume,loadMsg: '数据正在加载,请耐心的等待...',
					fitColumns:true,url:'${ctx}/culpritinfo/culpritResume/list?culpritId='+'${culprit.id }',method:'post',onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
					<thead>
						<tr>
							<th data-options="field:'id',checkbox:true">编号</th>
							<th data-options="field:'startTime',width:'20%',align:'center' ">入职时间</th>
							<th data-options="field:'endTime',width:'20%',align:'center'" >离职时间</th>
							<th data-options="field:'org',width:'20%',align:'center'" >工作单位</th>
							<th data-options="field:'role',width:'20%',align:'center'">职务</th>
							<th data-options="field:'prison',width:'18%',align:'center'" formatter="formatResume">操作</th>
						</tr>
					</thead>
				</table>      
		    </div>   
		    <div title="家庭成员" data-options="closable:false" style="overflow:auto;display:none;">
		    	<table class="easyui-datagrid" id="family_content" style="height: 100%;width:100%"
					data-options="singleSelect:true,collapsible:true,striped:true,rownumbers:true,toolbar:toolbarFamily,loadMsg: '数据正在加载,请耐心的等待...',
					fitColumns:true,url:'${ctx}/culpritinfo/culpritFamily/list?culpritId='+'${culprit.id }',method:'post',
					onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详细',plain:true,iconCls:'fi-info icon-blue'}); 
                        $('.organization-easyui-linkbutton-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
					<thead>
						<tr>
							<th data-options="field:'id',checkbox:true">编号</th>
							<th data-options="field:'dicRelationKey',width:'15%',align:'center',formatter:function(value,rowData,rowIndex){    
								    	 return sy.getDicValue('sf_investigate_family','dic_relation_key',rowData.dicRelationKey,''); 
								} ">关系</th>
							<th data-options="field:'name',width:'15%',align:'center'">姓名</th>
							<th data-options="field:'birthday',width:'15%',align:'center'">出生日期</th>
							<th data-options="field:'org',width:'15%',align:'center'">工作单位</th>
							<th data-options="field:'phone',width:'20%',align:'center'">联系方式</th>
							<th data-options="field:'prison',width:'18%',align:'center'" formatter="formatFamily">操作</th>
						</tr>
					</thead>
				</table>        
		    </div>   
		    <div title="志愿者帮教" data-options="closable:false" style="display:none;">
		    <table class="easyui-datagrid" id="volunteer_content" style="height: 100%;width:100%"
					data-options="singleSelect:true,collapsible:true,striped:true,rownumbers:true,toolbar:toolbarVolunteer,
					loadMsg: '数据正在加载,请耐心的等待...',fitColumns:true,url:'${ctx}/sys/volunteer/list?culpritId='+'${culprit.id }',method:'post',
					onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详细',plain:true,iconCls:'fi-info icon-blue'}); 
                        $('.organization-easyui-linkbutton-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
					<thead>
						<tr>
							<th data-options="field:'id',checkbox:true">编号</th>
							<th data-options="field:'name',width:'20%',align:'center' ">姓名</th>
							<th data-options="field:'limit',width:'20%',align:'center'" >聘用时限</th>
							<th data-options="field:'job',width:'20%',align:'center'" >工作单位</th>
							<th data-options="field:'linkMobile',width:'20%',align:'center'">联系方式</th>
							<th data-options="field:'prison',width:'18%',align:'center'" formatter="formatVolunteer">操作</th>
						</tr>
					</thead>
				</table>              
		    </div>
		  	<div title="矫正方案" data-options="closable:false" style="display:none;">
			    <table class="easyui-datagrid" id="scheme_content" style="height: 100%;;width:100%"
					data-options="singleSelect:true,collapsible:true,striped:true,rownumbers:true,toolbar:toolbarScheme,fitColumns:true,loadMsg: '数据正在加载,请耐心的等待...'  ,
					fitColumns:true,url:'${ctx}/sys/scheme/list?culpritId='+'${culprit.id }',method:'post',
					onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详细',plain:true,iconCls:'fi-info icon-blue'}); 
                        $('.organization-easyui-linkbutton-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
					<thead>
						<tr>
							<th data-options="field:'id',checkbox:true">编号</th>
							<th data-options="field:'schemeName',width:'50%',align:'center'" editor="text">矫正方案名称</th>
							<th data-options="field:'action',width:'48%',align:'center'" formatter="formatScheme">操作</th><!-- formatter="formatterJudg" -->
						</tr>
					</thead>
				</table>           
		    </div> 
		    <div title="矫正小组" data-options="closable:false" style="display:none;">
			    <table class="easyui-datagrid" id="monitor_content" style="height: 100%;width:100%"
						data-options="singleSelect:true,collapsible:true,striped:true,rownumbers:true,toolbar:toolbarMonitor,loadMsg: '数据正在加载,请耐心的等待...',
						fitColumns:true,url:'${ctx}/culpritinfo/Monitor/list?culpritId='+'${culprit.id }',method:'post',
						onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详细',plain:true,iconCls:'fi-info icon-blue'}); 
                        $('.organization-easyui-linkbutton-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
						<thead>
							<tr>
								<th data-options="field:'id',checkbox:true">编号</th>
								<th data-options="field:'name',width:'15%',align:'center'">姓名</th>
								<th data-options="field:'dicSexKey',width:'10%',align:'center',formatter:function(value,row,index){
							if (value==10001){return '男';}else{return '女';}}">性别</th>
								<th data-options="field:'groupTypeId',width:'15%',align:'center' ">成员类别</th>
								<th data-options="field:'xzcylx',width:'15%',align:'center',formatter:function(value,rowData,rowIndex){    
									    if(typeof(rowData.xzcylx) != 'undefined' && rowData.xzcylx!=''){
									    	 return sy.getDicValue('common_table','xzcylx',rowData.xzcylx,''); 
									    }   
									}" editor="text">成员类型</th>
								<th data-options="field:'org',width:'20%',align:'center'">单位</th>
								<th data-options="field:'prison',width:'23%',align:'center'" formatter="formatMonitor">操作</th>
							</tr>
						</thead>
					</table>          
		 		</div> 
	 </div>
	 </div>
	 </form> 
	<div id="resumDialog"></div>
	<div id="familyDialog"></div>
	<div id="volunteerDialog"></div>
	<div id="schemeDialog"></div>
	<div id="printScheme1"></div>
	<div id="monitorDialog"></div>
    <script>
    var culpritId='${culprit.id}';
    var toolbarVolunteer = [ {
		text : '新增',
		iconCls : 'fi-plus icon-green',
		handler : function() {
			$('#volunteerDialog').dialog({
				title : '新增志愿者',
				iconCls:'fi-plus icon-green',
				resizable:true,
				width : 700,
		        height : 280,
		        href : '${ctx}/sys/volunteer/form?culpritId=${culprit.id}',
		        buttons : [ {
		             text : '保存',
		             iconCls:'icon-save',
		             handler : function() {
		                $('#volunteer_saveform_btn').click();
		             }
		         },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#volunteerDialog').dialog('close');
		             }
		         }  ]
			});
		}

	}]
    function formatVolunteer(val,row,index){  
    	var space = '&nbsp;';
    	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="volunteerDetail(\''+row.id+'\')">详细</a>'+space; 
    	operation+='<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" onclick="volunteerUpdate(\''+row.id+'\')">修改</a>'+space;
    	operation+='<a href="javascript:void(0);" class="organization-easyui-linkbutton-del" onclick="volunteerDelete(\''+row.id+'\')">删除</a>';

    	return operation;
    }
    function volunteerUpdate(id){ 
    	$('#volunteerDialog').dialog({
			title : '修改志愿者信息',
			iconCls:'fi-pencil icon-blue',
			resizable:true,
			width : 700,
	        height : 280,
	        href : '${ctx}/sys/volunteer/form?id='+id,
	        buttons : [ {
	             text : '保存',
	             iconCls:'icon-save',
	             handler : function() {
	                $('#volunteer_saveform_btn').click();
	             }
	         },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 $('#volunteerDialog').dialog('close');
	             }
	         }  ]
		});
    }
    function volunteerDetail(id){ 
    	$('#volunteerDialog').dialog({
			title : '志愿者信息详情',
			iconCls:'fi-info icon-blue',
			resizable:true,
			width : 700,
	        height : 280,
	        href : '${ctx}/sys/volunteer/detail?id='+id,
	        buttons : [ {
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 $('#volunteerDialog').dialog('close');
	             }
	         }  ]
		});
    	$('#volunteerDialog').window('center');
    }
    function volunteerDelete(id){
    	   $.messager.confirm('提示信息', '确认删除?', function(r) {
    			if (r) {
    				$.post('${ctx}/sys/volunteer/batchDelete', {
    					ids : id
    				}, function(result) {
    					//1 刷新数据表格 
    					$('#volunteer_content').datagrid('reload');
    					$.messager.show({
    						title : '提示信息!',
    						msg : '删除成功'
    					});
    				});
    			} else {
    				return;
    			}
    		});
    	}
    
    
    //工作情况操作
    function formatResume(val,row,index){ 
    	var space = '&nbsp;';
    	/* var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="resumeDetail(\''+row.id+'\')">详细</a>'+space; */
    	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" onclick="resumeUpdate(\''+row.id+'\')">修改</a>'+space;
    	operation=operation+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-del" onclick="resumeDelete(\''+row.id+'\')">删除</a>';

    	return operation;
    }
    //个人简历新增
    var toolbarResume = [ {
		text : '新增',
		iconCls : 'fi-plus icon-green',
		handler : function() {
			$('#resumDialog').dialog({
				title : '新增工作情况',
				iconCls:'fi-plus icon-green',
				resizable:true,
				width : 600,
		        height : 170,
		        href : '${ctx}/culpritinfo/culpritResume/form?culpritId=${culprit.id}',
		        buttons : [ {
		             text : '保存',
		             iconCls:'icon-save',
		             handler : function() {
		                $('#resume_saveform_btn').click();
		             }
		         },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#resumDialog').dialog('close');
		             }
		         }  ]
			});
		}
	}]
   //修改个人简历
    function resumeUpdate(id){
		$('#resumDialog').dialog({
			title : '修改工作情况',
			iconCls:'fi-pencil icon-blue',
			resizable:true,
			width : 600,
	        height : 170,
	        href : '${ctx}/culpritinfo/culpritResume/form?id='+id,
	        buttons : [ {
	             text : '保存',
	             iconCls:'icon-save',
	             handler : function() {
	                $('#resume_saveform_btn').click();
	             }
	         },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 $('#resumDialog').dialog('close');
	             }
	         }  ]
		});
    }
  
   //个人简历删除
   function resumeDelete(id){
	   $.messager.confirm('提示信息', '确认删除?', function(r) {
			if (r) {
				$.post('${ctx}/culpritinfo/culpritResume/batchDelete', {
					ids : id
				}, function(result) {
					//1 刷新数据表格 
					$('#resume_content').datagrid('reload');
					$.messager.show({
						title : '提示信息!',
						msg : '删除成功'
					});
				});
			} else {
				return;
			}
		});
   }
    
    //家庭成员新增
    var toolbarFamily = [ {
		text : '新增',
		iconCls : 'fi-plus icon-green',
		handler : function() {
			$('#familyDialog').dialog({
				title : '新增家庭成员',
				iconCls:'fi-plus icon-green',
				resizable:true,
				width : 700,
		        height : 270,
		        href : '${ctx}/culpritinfo/culpritFamily/form?culpritId=${culprit.id}',
		        buttons : [ {
		             text : '保存',
		             iconCls:'icon-save',
		             handler : function() {
		                $('#family_saveform_btn').click();
		             }
		         },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#familyDialog').dialog('close');
		             }
		         }  ]
			});
		}
	}]
    function formatFamily(val,row,index){  
    	var space = '&nbsp;';
    	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="familyDetail(\''+row.id+'\')">详细</a>'+space; 
    	operation+='<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" onclick="familyUpdate(\''+row.id+'\')">修改</a>'+space;
    	operation+='<a href="javascript:void(0);" class="organization-easyui-linkbutton-del" onclick="familyDelete(\''+row.id+'\')">删除</a>';

    	return operation;
    }
   
    function familyUpdate(id){
    	$('#familyDialog').dialog({
			title : '修改家庭成员',
			iconCls:'fi-pencil icon-blue',
			resizable:true,
			width : 700,
	        height : 270,
	        href : '${ctx}/culpritinfo/culpritFamily/form?id='+id,
	        buttons : [ {
	             text : '保存',
	             iconCls:'icon-save',
	             handler : function() {
	                $('#family_saveform_btn').click();
	             }
	         },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 $('#familyDialog').dialog('close');
	             }
	         }  ]
		});
    }
    //家庭成员详细
    function familyDetail(id){  
    	$('#familyDialog').dialog({
			title : '家庭成员详情',
			iconCls:'fi-info icon-blue',
			resizable:true,
			width : 700,
	        height : 270,
	        href : '${ctx}/culpritinfo/culpritFamily/detail?id='+id,
	        buttons : [ {
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 $('#familyDialog').dialog('close');
	             }
	         }  ]
		});
    }
    //家庭情况删除
    function familyDelete(id){
       $.messager.confirm('提示信息', '确认删除?', function(r) {
    		if (r) {
    			$.post('${ctx}/culpritinfo/culpritFamily/batchDelete', {
    				ids : id
    			}, function(result) {
    				//1 刷新数据表格 
    				$('#family_content').datagrid('reload');
    				$.messager.show({
    					title : '提示信息!',
    					msg : '删除成功'
    				});
    			});
    		} else {
    			return;
    		}
    	});
    }
//矫正方案
 var toolbarScheme = [ {
		text : '新增',
		iconCls : 'fi-plus icon-green',
		handler : function() {
			$('#schemeDialog').dialog({
				title : '新增矫正方案',
				iconCls:'fi-plus icon-green',
				resizable:true,
				width :900,
		        height :650,
		        href : '${ctx}/sys/scheme/form?culpritId=${culprit.id}',
		        buttons : [ {
		             text : '保存',
		             iconCls:'icon-save',
		             handler : function() {
		                $('#scheme_saveform_btn').click();
		             }
		         },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#schemeDialog').dialog('close');
		             }
		         }  ]
			});
		}

	}]

 function formatScheme(val,row,index){ 
	 var space = '&nbsp;';
 	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="schemeDetail(\''+row.id+'\')">详细</a>'+space; 
 	operation+='<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" onclick="schemeUpdate(\''+row.id+'\')">修改</a>'+space;
 	operation+='<a href="javascript:void(0);" class="organization-easyui-linkbutton-del" onclick="schemeDelete(\''+row.id+'\')">删除</a>';

 	return operation;
	
 }
 function schemeUpdate(id){ 
	 $('#schemeDialog').dialog({
			title : '修改矫正方案',
			iconCls:'fi-pencil icon-blue',
			resizable:true,
			width :900,
	        height :650,
	        href : '${ctx}/sys/scheme/form?id='+id,
	        buttons : [ {
	             text : '保存',
	             iconCls:'icon-save',
	             handler : function() {
	                $('#scheme_saveform_btn').click();
	             }
	         },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 $('#schemeDialog').dialog('close');
	             }
	         }  ]
		});
 }
 function schemeDetail(id){
	 $('#schemeDialog').dialog({
			title : '矫正方案详情',
			iconCls:'fi-pencil icon-blue',
			resizable:true,
			width :900,
	        height :650,
	        href : '${ctx}/sys/scheme/detail?id='+id,
	        buttons : [ {
	        	text:'打印《社区服刑人员矫正方案》',
				iconCls:'icon-save',
				handler:function(){
					$('#printScheme1').dialog({    
					    title: '打印《社区服刑人员矫正方案》',    
					    width: 900,    
					    height:800,    
					    closed: false,    
					    cache: false,    
					    href : '${ctx}/sys/scheme/printSchemePlan?id=' + id,
					    modal: true,
					   buttons :[{
							text:'打印',
				            iconCls:'fi-print icon-blue',
							handler:function(){
								$('#schemePrintBtn').click();
							}
						}, {
							text:'关闭',
							iconCls:'fi-x icon-blue',
							handler:function(){
								$('#printScheme1').dialog('close');
							}
						}]
					});    
				}
	         },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	            	 $('#schemeDialog').dialog('close');
	             }
	         }  ]
		});
 }
 function schemeDelete(id){
 	   $.messager.confirm('提示信息', '确认删除?', function(r) {
 			if (r) {
 				$.post('${ctx}/sys/scheme/batchDelete', {
 					ids : id
 				}, function(result) {
 					//1 刷新数据表格 
 					$('#scheme_content').datagrid('reload');
 					$.messager.show({
 						title : '提示信息!',
 						msg : '删除成功'
 					});
 				});
 			} else {
 				return;
 			}
 		});
 	}
 
	
 
 
        function submitForm(){
        	 $('#personDocInfo').form('submit');
        }
        
        $('#personDocInfo').form({
    		url:'${ctx}/culpritinfo/culprit/save',
    		onSubmit:function(){
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
					//$('#judg_list_content').datagrid('reload');
    				//parent.location.reload();
    				
        			//var index = parent.layer.getFrameIndex(window.name);
					//parent.layer.close(index);
					
    			}else{
    				alert(data.msg);
    			}
    			
    		}
    	});	
        var toolbarMonitor = [ {
    		text : '新增',
    		iconCls : 'fi-plus icon-green',
    		handler : function() {
    			$('#monitorDialog').dialog({
    				title : '新增矫正小组成员',
    				iconCls:'fi-plus icon-green',
    				resizable:true,
    				width :800,
    		        height :280,
    		        href : '${ctx}/culpritinfo/Monitor/form?culpritId=${culprit.id}',
    		        buttons : [ {
    		             text : '保存',
    		             iconCls:'icon-save',
    		             handler : function() {
    		                $('#monitor_saveform_btn').click();
    		             }
    		         },{
    		             text : '关闭',
    		             iconCls:'fi-x icon-blue',
    		             handler : function() {
    		            	 $('#monitorDialog').dialog('close');
    		             }
    		         }  ]
    			});
    			
    		}

    	}]
        
        function formatMonitor(val,row,index){  
        	 var space = '&nbsp;';
       	 	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="monitorDetail(\''+row.id+'\')">详细</a>'+space; 
       	 	operation+='<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" onclick="monitorUpdate(\''+row.id+'\')">修改</a>'+space;
       	 	operation+='<a href="javascript:void(0);" class="organization-easyui-linkbutton-del" onclick="monitorDelete(\''+row.id+'\')">删除</a>';

       	 	return operation;
        }
        function monitorUpdate(id){  
        	$('#monitorDialog').dialog({
				title : '修改矫正小组成员',
				iconCls:'fi-pencil icon-blue',
				resizable:true,
				width :800,
		        height :280,
		        href : '${ctx}/culpritinfo/Monitor/form?id='+id,
		        buttons : [ {
		             text : '保存',
		             iconCls:'icon-save',
		             handler : function() {
		                $('#monitor_saveform_btn').click();
		             }
		         },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#monitorDialog').dialog('close');
		             }
		         }  ]
			}); 
        }
        function monitorDetail(id){
        	$('#monitorDialog').dialog({
				title : '矫正小组详情',
				iconCls:'fi-info icon-blue',
				resizable:true,
				width :800,
		        height :280,
		        href : '${ctx}/culpritinfo/Monitor/detail?id='+id,
		        buttons : [ {
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#monitorDialog').dialog('close');
		             }
		         }  ]
			}); 
        }
        function monitorDelete(id){
        	   $.messager.confirm('提示信息', '确认删除?', function(r) {
        			if (r) {
        				$.post('${ctx}/culpritinfo/Monitor/batchDelete', {
        					ids : id
        				}, function(result) {
        					//1 刷新数据表格 
        					$('#monitor_content').datagrid('reload');
        					$.messager.show({
        						title : '提示信息!',
        						msg : '删除成功'
        					});
        				});
        			} else {
        				return;
        			}
        		});
        	}
        
        
        $(function() {

        });
        //判断有传染病启用组件
        $('#dicSfycrbsKey0').click(function(){
 			$('#contagionId').combobox('enable');
    	});
        $('#dicSfycrbsKey1').click(function(){
        	$('#contagionId').combobox('clear');
 			$('#contagionId').combobox('disable');
    	});
      //判断心里状况启用组件
       $('#dicXlsfjkKey0').click(function(){
    	   $('#mentalInfo').textbox('clear');
    	   $('#identifyOrg').textbox('clear');
    	   $('#mentalInfo').textbox('disable');
   			$('#identifyOrg').textbox('disable');
    	});
        $('#dicXlsfjkKey1').click(function(){
     	   $('#mentalInfo').textbox('enable');
  			$('#identifyOrg').textbox('enable');
    	});
        //居住地变更时
        $('#addressProId').combobox({    
        	onChange: function(newValue,oldValue){
				$('#addressPro').val($('#addressProId').combobox('getText'));
        		$('#addressCityId').combobox({    
        			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
        		    valueField:'id',    
        		    textField:'areaName'
        		    
        		});
        		$('#addressCityId').combobox('clear');	
			}   
   		}); 
        $('#addressCityId').combobox({    
        	onChange: function(newValue,oldValue){
				$('#addressCity').val($('#addressCityId').combobox('getText'));
        		$('#addressCountryId').combobox({    
        			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+newValue,    
        		    valueField:'id',    
        		    textField:'areaName'   
        		});
        		$('#addressCountryId').combobox('clear');
			}   
   		});
        //县区选择完存一份名字
        $('#addressCountryId').combobox({  
	        onChange: function(newValue,oldValue){
				$('#addressCountry').val($('#addressCountryId').combobox('getText'));
	        }
        });
        $.formatString = function(str) {
    		for ( var i = 0; i < arguments.length - 1; i++) {
    			str = str.replace("{" + i + "}", arguments[i + 1]);
    		}
    	return str;
    	}
    </script>
