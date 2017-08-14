<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>个人资料</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body >
 <form  action="${ctx}/culpritinfo/culpritComplicity/save" method="post" id="culpritInfo">
     <div class="easyui-panel" title="基本信息" style="width:100%;padding:10px;">
            <table width="100%">
            	<tr>
            		<td>
            			<input type="hidden" name="id" value="${culprit.id }" />
            		</td>
            	</tr>
           		<tr>
                    <td>户籍详细地址:</td>
                    <td colspan="8"><input name="regResidenceProId" id="regResidenceProId" class="easyui-combobox" readonly="readonly" ></input>省
                    	<input type="hidden" id="regResidencePro" name="regResidencePro" value="${culprit.regResidencePro }" >
                    	<input id="regResidenceCityId" name="regResidenceCityId" class="easyui-combobox" readonly="readonly">市
                    	<input type="hidden" id="regResidenceCity" name="regResidenceCity" value="${culprit.regResidenceCity }">
                    	<input id="regResidenceCountryId" name="regResidenceCountryId" class="easyui-combobox" readonly="readonly" >县（区）
                    	<input type="hidden" id="regResidenceCountry" name="regResidenceCountry" value="${culprit.regResidenceCountry}" >
                    	<input id="regResidenceStreet" name="regResidenceStreet" class="f1 easyui-textbox" readonly="readonly" value="${culprit.regResidenceStreet}">乡镇（街道）
                    	<input name="regResidenceDetail" id="regResidenceDetail" class="f1 easyui-textbox" readonly="readonly" value="${culprit.regResidenceDetail}">（详细门牌号）
                    </td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>居住地详细地址:</td>
                    <td colspan="8"><input name="addressProId" id="addressProId" class="easyui-combobox" required=true></input>省
                    	<input type="hidden" id="addressPro" name="addressPro" value="${culprit.addressPro}">
                    	<input name="addressCityId" id="addressCityId" class="easyui-combobox" required=true></input>市
                    	<input type="hidden" id="addressCity" name="addressCity" value="${culprit.addressCity}">
                    	<input name="addressCountryId" id="addressCountryId" class="easyui-combobox" required=true></input>县（区）
                    	<input type="hidden" id="addressCountry" name="addressCountry"  value="${culprit.addressCountry}">
                    	<input id="addressStreet" name="addressStreet" class="f1 easyui-textbox" value="${culprit.addressStreet}">乡镇（街道）
                    	<input name="addressDetail" id="addressDetail" class="f1 easyui-textbox" value="${culprit.addressDetail}">（详细门牌号）
                    </td>
                </tr> 
                <tr>
                	<c:if test="${empty culprit.dicHealthyStatusKey }">
	                	<td width="10%"><span class="c-red">*</span>健康状况：</td>
						<td ><input name="DicHealthyStatusKey" id="DicHealthyStatusKey" class="easyui-combobox" required=true value="41001"
	                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=41000',panelHeight:'auto'"></input></td>
                   	</c:if>
                   	<c:if test="${!empty culprit.dicHealthyStatusKey }">
                   		<td width="10%"><span class="c-red">*</span>健康状况：</td>
						<td ><input name="DicHealthyStatusKey" id="DicHealthyStatusKey" class="easyui-combobox" required=true value="${culprit.dicHealthyStatusKey }"
	                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=41000',panelHeight:'auto'"></input></td>
                   	</c:if>
                	<td>是否有传染病史：</td>
	 				<td>
			 			<c:if test="${culprit.dicSfycrbsKey ne 0 }">
			 				<input id="dicSfycrbsKey0" type="radio" name="dicSfycrbsKey" value="0"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicSfycrbsKey1" type="radio" name="dicSfycrbsKey" value="1"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
			 			<c:if test="${culprit.dicSfycrbsKey eq 0 }">
			 				<input id="dicSfycrbsKey0"  type="radio" name="dicSfycrbsKey" value="0"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicSfycrbsKey1"  type="radio" name="dicSfycrbsKey" value="1" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
	 				</td>
	 				<td>心里是否健康：</td>
		 			<td>
			 			<c:if test="${culprit.dicXlsfjkKey eq 1 }">
			 				<input type="radio" id="dicXlsfjkKey0" name="dicXlsfjkKey" value="0"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input type="radio" id="dicXlsfjkKey1" name="dicXlsfjkKey" value="1"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
			 			<c:if test="${culprit.dicXlsfjkKey ne 1 }">
			 				<input type="radio" id="dicXlsfjkKey0" name="dicXlsfjkKey" value="0"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input type="radio" id="dicXlsfjkKey1" name="dicXlsfjkKey" value="1"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
		 			</td>
                </tr>
                <tr>
                   <td width="10%">具体健康状况：</td>
							<td><input type="text" name="healthyStatusInfo" id="healthyStatusInfo" value="${ culprit.healthyStatusInfo}"
								class="f1 easyui-textbox" /></td>
					<td width="10%">具体传染病史：</td>
							<td ><input name="contagionId" id="contagionId" class="easyui-combobox"  value="${culprit.contagionId}"
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=64000',panelHeight:'auto'"></input></td>
							<td width="10%">具体心里状况：</td>
							<td ><input type="text" name="mentalInfo" id="mentalInfo" value="${culprit.mentalInfo}"
								class="f1 easyui-textbox"  /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>文化程度：</td>
					<td><input name="dicWhcdKey" id="dicWhcdKey" class="easyui-combobox" required=true value="${culprit.dicWhcdKey}"
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=19000',panelHeight:'auto'"></input></td>
					<td><span class="c-red">*</span>就业就学情况：</td>
					<td><input name="dicWorkStatusKey" id="dicWorkStatusKey" class="easyui-combobox" required=true value="${culprit.dicWorkStatusKey}"
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=66000',panelHeight:'auto'"></input></td>
					<td width="10%">鉴定机构：</td>
					<td ><input type="text" name="identifyOrg" id="identifyOrg" value="${culprit.identifyOrg}"
								class="f1 easyui-textbox"  /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>婚姻状况：</td>
					<td ><input name="dicHyzkKey"  id="dicHyzkKey" class="easyui-combobox" required=true ></input></td>
                    <td>原政治面貌：</td>
					<td ><input name="dicYzzmmKey" class="easyui-combobox"  value="${culprit.dicYzzmmKey}"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=65000',panelHeight:'auto'"></input></td>
					<td>现政治面貌：</td>
					<td ><input name="dicXzzmmKey" class="easyui-combobox" value="${culprit.dicXzzmmKey}"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=65000',panelHeight:'auto'"></input></td>
                </tr>
                <tr>
               	 	<td width="10%">原工作单位及职务：</td>
					<td ><input type="text" name="job" id="job" value="${culprit.job}" class="f1 easyui-textbox"  /></td>
	                <td width="10%">工作单位：</td>
					<td ><input type="text" name="newJob" id="newJob" value="${culprit.newJob}" class="f1 easyui-textbox"  /></td>
					<td width="10%">单位联系电话：</td>
					<td ><input type="text" name="jobPhone" id="jobPhone" value="${culprit.jobPhone}" class="f1 easyui-textbox"  /></td>
				</tr>
				<tr>
					<td><span class="c-red">*</span>联系方式：</td>
					<td ><input type="text" name="contactPhone" id="contactPhone" value="${culprit.contactPhone}" class="f1 easyui-textbox" required=true /></td>
	                <td width="10%">管理分区：</td>
					<td ><input type="text" name="" id="" value="无" class="f1 easyui-textbox"  /></td>
				</tr>
                <tr>
                	<td align="center" colspan="6">
                		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">修改</a>
                	</td>
                </tr>
                
            </table>
    </div>
    </form>
     <div class="easyui-panel" id="p2" title="相关资料" style="width:100%;height:310px;">
	     <div id="tabs" class="easyui-tabs" style="width:100%;height:100%;">   
		    <div title="个人简历" data-options="closable:false"  style="display:none;">
		    	<table class="easyui-datagrid" id="resume_content" style="height: 250px;width:100%"
					data-options="singleSelect:true,collapsible:true,striped:true,toolbar:toolbarResume,loadMsg: '数据正在加载,请耐心的等待...',pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50] ,fitColumns:true,url:'${ctx}/culpritinfo/culpritResume/list?culpritId='+'${culprit.id }',method:'post'">
					<thead>
						<tr>
							<th data-options="field:'id',hidden:true,width:80">编号</th>
							<th data-options="field:'startTime',width:250,align:'center' "editor="text">入职时间</th>
							<th data-options="field:'endTime',width:200,align:'center'" editor="text">离职时间</th>
							<th data-options="field:'org',width:250,align:'center'" editor="text">工作单位</th>
							<th data-options="field:'role',width:250,align:'center'" editor="text">职务</th>
							<th data-options="field:'prison',width:160,align:'center'" formatter="formatResume">操作</th><!-- formatter="formatResume" -->
						</tr>
					</thead>
				</table>      
		    </div>   
		    <div title="家庭成员" data-options="closable:false" style="overflow:auto;display:none;">
		    	<table class="easyui-datagrid" id="family_content" style="height: 250px;width:100%"
					data-options="singleSelect:true,collapsible:true,striped:true,toolbar:toolbarFamily,loadMsg: '数据正在加载,请耐心的等待...',pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50] ,fitColumns:true,url:'${ctx}/culpritinfo/culpritFamily/list?culpritId='+'${culprit.id }',method:'post'">
					<thead>
						<tr>
							<th data-options="field:'id',hidden:true,width:80">编号</th>
							<th data-options="field:'dicRelationKey',width:250,align:'center' "editor="text">关系</th>
							<th data-options="field:'name',width:200,align:'center'" editor="text">姓名</th>
							<th data-options="field:'birthday',width:250,align:'center'" editor="text">出生日期</th>
							<th data-options="field:'org',width:250,align:'center'" editor="text">工作单位</th>
							<th data-options="field:'phone',width:250,align:'center'" editor="text">联系方式</th>
							<th data-options="field:'prison',width:160,align:'center'" formatter="formatFamily">操作</th><!-- formatter="formatResume" -->
						</tr>
					</thead>
				</table>        
		    </div>   
		    <div title="志愿者帮教" data-options="closable:false" style="display:none;">
		    <table class="easyui-datagrid" id="volunteer_content" style="height: 250px;width:100%"
					data-options="singleSelect:true,collapsible:true,striped:true,toolbar:toolbarVolunteer,loadMsg: '数据正在加载,请耐心的等待...',pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50] ,fitColumns:true,url:'${ctx}/sys/volunteer/list?culpritId='+'${culprit.id }',method:'post'">
					<thead>
						<tr>
							<th data-options="field:'id',hidden:true,width:80">编号</th>
							<th data-options="field:'name',width:250,align:'center' "editor="text">姓名</th>
							<th data-options="field:'limit',width:200,align:'center'" editor="text">聘用时限</th>
							<th data-options="field:'job',width:250,align:'center'" editor="text">工作单位</th>
							<th data-options="field:'linkMobile',width:250,align:'center'" editor="text">联系方式</th>
							<th data-options="field:'prison',width:160,align:'center'" formatter="formatVolunteer">操作</th><!-- formatter="formatResume" -->
						</tr>
					</thead>
				</table>              
		    </div>
		    <div title="矫正方案" data-options="closable:false" style="display:none;">      
		    </div>
		    <div title="矫正小组" data-options="closable:false" style="display:none;">      
		 </div>
	 </div>
	 <div id="resume" title="个人简历新增" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 500px;padding:10px; top:250px; left:650px;background:#c4d8ed">
		<form id="resumeForm" action="" method="post">
			<input type="hidden" name="id" value="" />
			<input type="hidden" name="culpritId" value="" />
			<table>
				<tr>
					<td>入职时间:</td>
					<td><input type="text" name="startTime" id="startTime" required=true 
								class="easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></td>
					<td>离职时间:</td>
					<td><input type="text" name="endTime" id="endTime" required=true 
								class="easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></td>			
				</tr>
				<tr>
					<td>所在单位和职位:</td>
					<td><input name="org" class="easyui-textbox" /></td>
					<td>职务:</td>
					<td><input name="role" class="easyui-textbox" /></td>
				</tr>
				<tr align="center">
					<td colspan="4"><a id="resumeBtn" class="easyui-linkbutton" onclick="resumeSave();">确定</a>
						<a href="javascript:void(0)"  class="easyui-linkbutton" onclick="$('#resume').dialog('close');">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	 <div id="family" title="家庭成员新增" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 500px;padding:10px; top:250px; left:650px;background:#c4d8ed">
		<form id="familyForm" action="" method="post">
			<input type="hidden" name="id" value="" />
			<input type="hidden" name="culpritId" value="" />
			<table>
				<tr>
					<td>姓名:</td>
					<td><input name="name" class="easyui-textbox" required=true/></td>
					<td>性别:</td>
					<td><input name="dicSexKey" id="dicSexKey" class="easyui-combobox" required=true value=""
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=10000',panelHeight:'auto'"></input></td>
				</tr>
				<tr>
					<td>出生日期:</td>
					<td><input type="text" name="birthday" id="birthday"
								class="easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></td>
					<td>现政治面貌：</td>
					<td ><input name="" class="easyui-combobox" value=""
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=65000',panelHeight:'auto'"></input></td>
				</tr>
				<tr>
					<td>工作单位:</td>
					<td><input name="org" class="easyui-textbox" /></td>
					<td>职务:</td>
					<td><input name="role" class="easyui-textbox" /></td>
				</tr>
				<tr>
					<td>电话:</td>
					<td><input name="phone" class="easyui-textbox" /></td>
					<td>住址:</td>
					<td><input name="address" class="easyui-textbox" /></td>
				</tr>
				<tr>
					<td>关系:</td>
					<td><input name="dicRelationKey" class="easyui-textbox" required=true/></td>
				</tr>
				<tr align="center">
					<td colspan="4"><a id="resumeBtn" class="easyui-linkbutton" onclick="familySave();">确定</a>
						<a href="javascript:void(0)"  class="easyui-linkbutton" onclick="$('#family').dialog('close')">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="volunteer" title="志愿者帮教新增" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 500px;padding:10px; top:250px; left:650px;background:#c4d8ed">
		<form id="volunteerForm" action="" method="post">
			<input type="hidden" name="id" value="" />
			<input type="hidden" name="culpritId" value="" />
			<table>
				<tr>
					<td>姓名:</td>
					<td><input name="name" class="easyui-textbox" required=true/></td>
					<td>性别:</td>
					<td><input name="dicSexKey" id="dicSexKey" class="easyui-combobox" required=true value=""
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=10000',panelHeight:'auto'"></input></td>
				</tr>
				<tr>
					<td>聘用开始日期:</td>
					<td><input type="text" name="startDate" id="startDate" required=true 
								class="easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></td>
					<td>聘用结束日期:</td>
					<td><input type="text" name="endDate" id="endDate" required=true 
								class="easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></td>
				</tr>
				<tr>
					<td>工作单位:</td>
					<td><input name="job" class="easyui-textbox" /></td>
					<td>聘用时限:</td>
					<td><input name="limit" class="easyui-textbox" required=true /></td>
				</tr>
				<tr>
					<td>手机号:</td>
					<td><input name="linkMobile" class="easyui-textbox" /></td>
					<td>住址:</td>
					<td><input name="address" class="easyui-textbox" /></td>
				</tr>
				<tr align="center">
					<td colspan="4"><a id="volunteerBtn" class="easyui-linkbutton" onclick="volunteerSave();">确定</a>
						<a href="javascript:void(0)"  class="easyui-linkbutton" onclick="$('#volunteer').dialog('close')">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
    <script>
    var toolbarVolunteer = [ {
		text : '新增',
		iconCls : 'icon-add',
		handler : function() {
			flag = 'add';
			$('#volunteer').dialog({
				title : '新增'
			});
			//$('#myform').find('input[name!=sex]').val("");
			$('#volunteerForm').get(0).reset();
			$('#volunteerForm').form('clear');
			$('#volunteer').dialog('open');
			$('#volunteerForm').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
				culpritId : '${culprit.id}'
			});

		}

	}]
    function volunteerSave(){
		var str=$('#volunteerForm').serialize();
			if($('#volunteerForm').form('validate')){	
				$.ajax({
					type: 'post' ,
					url: '${ctx}/sys/volunteer/save',
					cache:false ,
					data:str ,
					dataType:'json' ,
					success:function(result){
						//1 关闭窗口
						$('#volunteer').dialog('close');
						$('#volunteer_content').datagrid('reload');
						//parent.location.reload();
		      			//var index = parent.layer.getFrameIndex(window.name);
						//parent.layer.close(index);
					} ,
					error:function(result){
						$.meesager.show({
							title:result.status==200?"ok":"fail" ,  
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
    function formatVolunteer(val,row,index){  
    	var operation=$.formatString('<a href="javascript:volunteer(\'{0}\');"  title="修改"><span style="color:blue;"><strong><u>修改</u><strong></span></a>', row);
    	return operation;
    }
    function volunteer(row){   	
    	var arr = $('#volunteer_content').datagrid('getSelections');
    	$('#volunteer').dialog({
			title : '修改'
		});
    	$('#volunteer').dialog('open');
    	$('#volunteerForm').get(0).reset();
    	$('#volunteerForm').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
			id : arr[0].id,
			name : arr[0].name,
			dicSexKey : arr[0].dicSexKey,
			startDate : arr[0].startDate,
			endDate : arr[0].endDate,
			job : arr[0].job,
			limit : arr[0].limit,
			linkMobile :arr[0].linkMobile,
			address:arr[0].address
		});
    	$('#volunteer_content').datagrid('unselectAll'); 
    }
    //家庭成员新增
    var toolbarResume = [ {
		text : '新增',
		iconCls : 'icon-add',
		handler : function() {
			flag = 'add';
			$('#resume').dialog({
				title : '新增个人简历'
			});
			//$('#myform').find('input[name!=sex]').val("");
			$('#resumeForm').get(0).reset();
			$('#resumeForm').form('clear');
			$('#resume').dialog('open');
			$('#resumeForm').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
				culpritId : '${culprit.id}'
			});

		}

	}]
    function resumeSave(){
		var str=$('#resumeForm').serialize();
			if($('#resumeForm').form('validate')){	
				$.ajax({
					type: 'post' ,
					url: '${ctx}/culpritinfo/culpritResume/save',
					cache:false ,
					data:str ,
					dataType:'json' ,
					success:function(result){
						//1 关闭窗口
						$('#resume').dialog('close');
						$('#resume_content').datagrid('reload');
						//parent.location.reload();
		      			//var index = parent.layer.getFrameIndex(window.name);
						//parent.layer.close(index);
					} ,
					error:function(result){
						$.meesager.show({
							title:result.status==200?"ok":"fail" ,  
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
    function formatResume(val,row,index){  
    	var operation=$.formatString('<a href="javascript:resume(\'{0}\');"  title="修改"><span style="color:blue;"><strong><u>修改</u><strong></span></a>', row);
    	return operation;
    }
    function resume(row){   	
    	var arr = $('#resume_content').datagrid('getSelections');
    	console.info(arr[0].org);
    	$('#resume').dialog({
			title : '修改个人简历'
		});
    	$('#resume').dialog('open');
    	$('#resumeForm').get(0).reset();
    	$('#resumeForm').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
			id : arr[0].id,
			culpritId : arr[0].culpritId,
			startTime : arr[0].startTime,
			endTime : arr[0].endTime,
			org : arr[0].org,
			role : arr[0].role
		});
    	$('#resume_content').datagrid('unselectAll'); 
    }
    //家庭成员新增
    var toolbarFamily = [ {
		text : '新增',
		iconCls : 'icon-add',
		handler : function() {
			flag = 'add';
			$('#family').dialog({
				title : '家庭成员新增'
			});
			//$('#myform').find('input[name!=sex]').val("");
			$('#familyForm').get(0).reset();
			$('#familyForm').form('clear');
			$('#family').dialog('open');
			$('#familyForm').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
				culpritId : '${culprit.id}'
			});

		}

	}]
    function familySave(){
		var str=$('#familyForm').serialize();
			if($('#familyForm').form('validate')){	
				$.ajax({
					type: 'post' ,
					url: '${ctx}/culpritinfo/culpritFamily/save',
					cache:false ,
					data:str ,
					dataType:'json' ,
					success:function(result){
						//1 关闭窗口
						$('#family').dialog('close');
						$('#family_content').datagrid('reload');
						//parent.location.reload();
		      			//var index = parent.layer.getFrameIndex(window.name);
						//parent.layer.close(index);
					} ,
					error:function(result){
						$.meesager.show({
							title:result.status==200?"ok":"fail" ,  
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
    function formatFamily(val,row,index){  
    	var operation=$.formatString('<a href="javascript:family(\'{0}\');"  title="修改"><span style="color:blue;"><strong><u>修改</u><strong></span></a>', row);
    	return operation;
    }
    function family(row){   	
    	var arr = $('#family_content').datagrid('getSelections');
    	$('#family').dialog({
			title : '家庭成员修改'
		});
    	$('#family').dialog('open');
    	$('#familyForm').get(0).reset();
    	$('#familyForm').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
			id : arr[0].id,
			culpritId : arr[0].culpritId,
			name : arr[0].name,
			dicSexKey : arr[0].dicSexKey,
			birthday : arr[0].birthday,
			dicZzmmKey : arr[0].dicZzmmKey,
			org : arr[0].org,
			role : arr[0].role,
			phone : arr[0].phone,
			address : arr[0].address,
			dicRelationKey : arr[0].dicRelationKey
		});
    	$('#family_content').datagrid('unselectAll'); 
    }


    
        function submitForm(){
        	 $('#culpritInfo').form('submit');
        }
        $(function() {
        	//户口地下拉选
        	$('#regResidenceProId').combobox({
        		url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',
			    valueField:'id',
			    textField:'areaName', 
			    panelHeight:'auto',
			    onLoadSuccess:function(){
			    	$('#regResidenceProId').combobox('setValue', '${culprit.regResidenceProId}');
			    }
			});
        	$('#regResidenceCityId').combobox({
        		url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent=${culprit.regResidenceProId}',
			    valueField:'id',
			    textField:'areaName', 
			    panelHeight:'auto',
			    onLoadSuccess:function(){
			    	$('#regResidenceCityId').combobox('setValue', '${culprit.regResidenceCityId}');
			    }
			});
        	$('#regResidenceCountryId').combobox({
        		url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent=${culprit.regResidenceCityId}',
			    valueField:'id',
			    textField:'areaName',
			    panelHeight:'auto',
			    onLoadSuccess:function(){
			    	$('#regResidenceCountryId').combobox('setValue', '${culprit.regResidenceCountryId}');
			    }
			});
        	//现在居住地下拉选
        	$('#addressProId').combobox({
        		url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',
			    valueField:'id',
			    textField:'areaName',
			    value:'${culprit.addressProId}'
			    //onLoadSuccess:function(){
			    //	alert(333)
			    //	$('#addressProId').combobox('setValue', '${culprit.addressProId}');
			    //}
			});
        	//console.info("${culprit.addressCityId}");
        	$('#addressCityId').combobox({
        		url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent=${culprit.addressProId}',
			    valueField:'id',
			    textField:'areaName',
			    panelHeight:'auto',
			    value:'${culprit.addressCityId}'
			  //  onLoadSuccess:function(){
			  //  	alert(222)
			   // 	$('#addressCityId').combobox('setValue', '${culprit.addressCityId}');
			   // }
			});
        	//console.info("${culprit.addressCountryId}");
        	$('#addressCountryId').combobox({
        		url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent=${culprit.addressCityId}',
			    valueField:'id',
			    textField:'areaName',
			    panelHeight:'auto',
			    value:'${culprit.addressCountryId}'
			 //   onLoadSuccess:function(){
			 //   	
			 //   	$('#addressCountryId').combobox('setValue', '${culprit.addressCountryId}');
			 //   }
			});
        	//婚姻状况下拉选
        	$('#dicHyzkKey').combobox({
        		url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=11000',
			    valueField:'id',
			    textField:'value',
			    panelHeight:'auto',
			    onLoadSuccess:function(){
			    	$('#dicHyzkKey').combobox('setValue', '${culprit.dicHyzkKey}');
			    }
			}); 
        	//表单提交
        	$('#culpritInfo').form({
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
        	//进入页面判断是否启用传染病控件
        	
        	if('${culprit.dicSfycrbsKey ne 0 }'=='true'){
        		$('#contagionId').combobox('disable');
        	}
        	//判断心里状况启用组件
			if('${culprit.dicXlsfjkKey ne 1 }'=='true'){
        		$('#mentalInfo').textbox('disable');
        		$('#identifyOrg').textbox('disable');
        	}
         
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
</body>
</html>
