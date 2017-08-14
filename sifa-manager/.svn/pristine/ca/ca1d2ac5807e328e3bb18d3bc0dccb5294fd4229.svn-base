<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>首次报到</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="" method="post" id="culpritInfo">
 	 <div class="easyui-panel" title="报到情况相关" style="width:100%;padding:10px;">
 	 	<table>
 	 		<tr>
 	 			<td>报道情况：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
 	 			
 	 			<td colspan="2">
 	 				<!-- style为了radio与文字平行 1为正常 2为漏管-->
 	 				<input type="radio" name="dicReportInfoKey" value="1" checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>正常 &nbsp;&nbsp;&nbsp;
 	 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	 			</td>
 	 			<td colspan="2">
					<input type="radio" name="dicReportInfoKey" value="2" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>漏管 &nbsp;&nbsp;&nbsp;
 	 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	 			</td>
 	 			<td>
	 	 			<input id="ReportType"  class="easyui-combobox" name="dicReportTypeKey" required=true style="width:200px;"  
    				data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=sf_culprit&columnName=dic_reportType_Key&parentKey=74000',panelHeight:'auto'">
				</td> 
 	 			
 	 		</tr>
 	 	</table>
 	 </div>
     <div class="easyui-panel" title="基本信息相关" style="width:100%;padding:10px;">
     		
            <table width="100%">
            	<tr>
            		<td><span class="c-red">*</span>司法所:</td>
            		<td><select id="sysGroupId" name="groupId"class="easyui-combotree"style="width: 150px;"
						data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true">
						</select>
					</td>
            		<td><span class="c-red">*</span>人员编号:</td>
            		<td><input name="" id="no" class="f1 easyui-textbox" required=true></input></td>
            		<td rowspan=5>照片:</td>
            		<td rowspan=5>无照片</td>
            	</tr>
                <tr>
                    <td><span class="c-red">*</span>姓名:</td>
                    <td><input name="name" class="f1 easyui-textbox" required=true
						 missingMessage="姓名不能为空!"/></td>
					<td>曾用名:</td>
            		<td><input name="alias" id="alias" class="f1 easyui-textbox" ></input></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td><input name="dicSexKey" id="dicSexKey" class="easyui-combobox" required=true value="10001"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=10000',panelHeight:'auto'"></input></td>
                     <td>民族:</td>
                    <td><input name="nation" id="nation" class="easyui-combobox" value="104001"
                    		data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=104000',panelHeight:'200'"></input></td>
                </tr>
                <tr>
                    
                     <td><span class="c-red">*</span>出生日期:</td>
                     <td><input type="text" name="birthday" id="birthday" required=true 
								class="f1 easyui-datetimebox" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></td>
                     <td><span class="c-red">*</span>联系方式:</td>
                    <td><input name="contactPhone" id="contactPhone" class="f1 easyui-textbox" required=true missingMessage="联系方式不能为空!"></input></td>
                </tr>
                
                 <tr>
                    <td><span class="c-red">*</span>证件类型:</td>
                    <td><input name="dicZjlxKey" id="dicZjlxKey" class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=86000',panelHeight:'auto'"></input></td>
                    <td><span class="c-red">*</span>证件号码:</td>
                    <td><input name="identification" id="identification" class="f1 easyui-textbox" required=true missingMessage="证件号码不能为空!"></input></td>
                    
                </tr>
                 <tr>
                    <td>籍贯:</td>
                    <td><input name="origin" id="origin" class="f1 easyui-textbox" required=true missingMessage="籍贯不能为空!"></input></td>
                    <td>现在工作单位:</td>
                    <td><input name="newJob" id="newJob" class="f1 easyui-textbox"></input></td>
                    <td>照片上传:</td>
                    <td><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">上传</a></td>
                </tr>
                 <tr>
                    <td>户籍性质:</td>
                    <td><input name="dicHklxKey" id="dicHklxKey" class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=12000',panelHeight:'auto'"></input></td>
                     <td>文化程度:</td>
                    <td><input name="dicWhcdKey" id="dicWhcdKey" class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=19000',panelHeight:'auto'"></input></td>
                    <td>是否成年:</td>
                    <td>
 	 				<!-- style为了radio与文字平行-->
 	 				<input type="radio" name="dicIsAdultKey" value="0"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
					<input type="radio" name="dicIsAdultKey" value="1" checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
 	 				</td>
                </tr>
                 <tr>
                    <td>单位联系方式:</td>
                    <td><input name="jobPhone" class="f1 easyui-textbox"></input></td>
                    <td>婚姻状况:</td>
                    <td><input name="dicHyzkKey" id="dicHyzkKey" class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=11000',panelHeight:'auto'"></input></td>
                    <td>出生地:</td>
                    <td><input name="email" class="f1 easyui-textbox"></input></td>
                </tr>
                <tr>
                    <td>户籍详细地址:</td>
                    <td colspan="8"><input name="regResidenceProId" id="regResidenceProId" class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelHeight:'200'"></input>省
                    	<input type="hidden" id="regResidencePro" name="regResidencePro" >
                    	<input id="regResidenceCityId" name="regResidenceCityId" class="easyui-combobox" required=true>市
                    	<input type="hidden" id="regResidenceCity" name="regResidenceCity" >
                    	<input id="regResidenceCountryId" name="regResidenceCountryId" class="easyui-combobox" required=true>县（区）
                    	<input type="hidden" id="regResidenceCountry" name="regResidenceCountry" >
                    	<input id="regResidenceStreet" name="regResidenceStreet" class="f1 easyui-textbox">乡镇（街道）
                    	<input name="regResidenceDetail" id="regResidenceDetail" class="f1 easyui-textbox">（详细门牌号）
                    </td>
                </tr>
                <tr>
                    <td>居住地详细地址:</td>
                    <td colspan="8"><input name="addressProId" id="addressProId" class="easyui-combobox" required=true value=46
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelHeight:'200'"></input>省
                    	<input type="hidden" id="addressPro" name="addressPro" value="浙江">
                    	<input name="addressCityId" id="addressCityId" class="easyui-combobox" required=true></input>市
                    	<input type="hidden" id="addressCity" name="addressCity" >
                    	<input name="addressCountryId" id="addressCountryId" class="easyui-combobox" required=true></input>县（区）
                    	<input type="hidden" id="addressCountry" name="addressCountry" >
                    	<input id="addressStreet" name="addressStreet" class="f1 easyui-textbox">乡镇（街道）
                    	<input name="addressDetail" id="addressDetail" class="f1 easyui-textbox">（详细门牌号）
                    </td>
                </tr>   
            </table>
           
    </div>
    
     <div class="easyui-panel" title="罪犯押送情况相关" style="width:100%;padding:10px;">
     	<table width="100%">
     		<tr>
                <td><span class="c-red">*</span>人员接收方式:&nbsp;&nbsp;&nbsp;
     				<input name="dicReceiveTypeKey" id="dicReceiveTypeKey" class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=70000',panelHeight:'auto'"></input></td>
			</tr>
     	</table>
     	<table class="easyui-datagrid" id="judg_list_content" style="height: 200px;"
			data-options="singleSelect:true,collapsible:true,striped:true,fitColumns:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/sys/culpritJudgment/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:true,width:80">编号</th>
					<th data-options="field:'name',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">执行押送民警姓名</th>
					<th data-options="field:'identification',width:250,align:'center'" editor="text">单位</th>
					<th data-options="field:'groupName',width:200,align:'center'" editor="text">职务</th>
					<th data-options="field:'escortDate',width:250,align:'center'" editor="text">押送时间</th>
					<th data-options="field:'action',width:160,align:'center'" >操作</th><!-- formatter="formatterJudg" -->
				</tr>
			</thead>
		</table>
    </div>
     <div class="easyui-panel" title="法律文书相关" style="width:100%;padding:10px;margin-bottom: 30px;">
            <table width="100%">
                <tr>
                    <td><span class="c-red">*</span>矫正类别:</td>
                    <td><input name="dicPenalTypeKey" class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=20000',panelHeight:'auto'"></input></td>
                    <td><span class="c-red">*</span>犯罪类型:</td>
                    <td><input name="dicCrimeTypeKey"  class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=26000',panelHeight:'auto'"></input></td>
                    <td><span class="c-red">*</span>具体罪名:</td>
                    <td><input name="crimeInfo" class="f1 easyui-textbox" required=true></input></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>审判机关名称:</td>
                    <td><input name="adjudgeOrg" class="f1 easyui-textbox" required=true></input></td>
                    <td><span class="c-red">*</span>判决书编号:</td>
                    <td><input name="adjudgeId" class="f1 easyui-textbox" required=true></input></td>
                    <td><span class="c-red">*</span>判决日期:</td>
                    <td><input name="adjudgeDate" class="f1 easyui-datetimebox" required=true
                    		onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"></input></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>原判刑罚:</td>
                    <td><input name="dicYpxfKey" class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=72000',panelHeight:'auto'"></input></td>
                    <td><span class="c-red">*</span>原判刑期:</td>
                    <td><input name="adjudgePeriod" class="f1 easyui-textbox" required=true></input></td>
                    <td><span class="c-red">*</span>刑期开始日期:</td>
                    <td><input name="adjudgeStartTime" class="f1 easyui-datetimebox" required=true
                    		onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"></input></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>刑期结束日期:</td>
                    <td><input name="adjudgeEndTime" class="f1 easyui-datetimebox" required=true
                    		onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"></input></td>
                    <td><span class="c-red">*</span>执行通知书文号:</td>
                    <td><input name="executeNotificationNum" class="f1 easyui-textbox" required=true></input></td>
                    <td><span class="c-red">*</span>执行通知书日期:</td>
                    <td><input name="executeNotificationDate" class="f1 easyui-datetimebox" required=true
                    		onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"></input></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>社区矫正决定机关:</td>
                    <td><input name="adjudgeRedressOrg" class="f1 easyui-textbox" required=true></input></td>
                    <td><span class="c-red">*</span>裁决日期:</td>
                    <td><input name="adjudgeRedressT"class="f1 easyui-datetimebox" required=true
                    		onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"></input></td>
                    <td><span class="c-red">*</span>法律文书收到日期:</td>
                    <td><input name="legalDocsReceiveT" class="f1 easyui-datetimebox" required=true
                    		onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"></input></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>矫正开始时间:</td>
                    <td><input name="redressStartDate"class="f1 easyui-datetimebox" required=true
                    		onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"></input></td>
                    <td><span class="c-red">*</span>矫正结束时间:</td>
                    <td><input name="redressEndDate" class="f1 easyui-datetimebox" required=true
                    		onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"></input></td>
                    <td><span class="c-red">*</span>矫正期限:</td>
                    <td><input name="redressPeriod" class="f1 easyui-textbox" required=true></input></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>文书类型:</td>
                    <td><input name="dicWslxKey" class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=125000',panelHeight:'auto'"></input></td>
                    <td><span class="c-red">*</span>文书编号:</td>
                    <td><input name="indictmentNum" class="f1 easyui-textbox" required=true></input></td>
                    <td><span class="c-red">*</span>文书生效日期:</td>
                    <td><input name="legalDocsStartDate" class="f1 easyui-datetimebox" required=true
                    		onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"></input></td>
                </tr>
                <tr>
                	<td>是否共同犯罪:</td>
                    <td>
 	 				<!-- style为了radio与文字平行-->
 	 				<input type="radio" name="dicSfgtfzKey" value="0" checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
					<input type="radio" name="dicSfgtfzKey" value="1" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
 	 				</td>
 	 				<td>有无同矫正对象:</td>
                    <td>
 	 				<!-- style为了radio与文字平行-->
 	 				<input type="radio" name="dicHaveTogetherKey" value="0" checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
					<input type="radio" name="dicHaveTogetherKey" value="1" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
 	 				</td>
 	 				<td><span class="c-red">*</span>首次报道截止时间:</td>
                    <td><input name="limitDate" class="f1 easyui-datetimebox" required=true  class="f1 easyui-datetimebox" required=true
                    		onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"></input></td>
                </tr>
               	<tr rowspan="3">
					<td>主要犯罪事实:</td>
					<td colspan="6"><input class="easyui-textbox" name="crimeFact" 
    					data-options="multiline:true,width:940" />
    				</td>
 				</tr>
            </table>
    </div>
    <div class="easyui-panel" title="已上传法律文书列表" style="width:100%;padding:10px">
     	<table class="easyui-datagrid" id="judg_list_content" style="height: 200px;"
			data-options="singleSelect:true,collapsible:true,striped:true,fitColumns:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/sys/culpritLaw/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:true,width:80">编号</th>
					<th data-options="field:'legalDocsName',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">法律文书名称</th>
					<th data-options="field:'indictmentNum',width:250,align:'center'" editor="text">法律文书编号</th>
					<th data-options="field:'dicWslxKey',width:200,align:'center'" editor="text">法律文书类型</th>
					<th data-options="field:'legalDocsUploadDate',width:250,align:'center'" editor="text">上传时间</th>
					<th data-options="field:'action',width:160,align:'center'" >操作</th><!-- formatter="formatterJudg" -->
				</tr>
			</thead>
		</table>
		<table width="100%">
			<tr>
            </tr>
            <tr>
               	<td align="center" colspan="6">
                	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
	    			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">返回</a>
            	</td>
            </tr>
		</table>  
    </div>
    </form>
    <script>
        function submitForm(){
        	 $('#culpritInfo').form('submit');
        }
        function clearForm(){
            $('#culpritInfo').form('clear');
        }
        $(function() {
        	$('#addressPro').val('浙江');
        	$('#culpritInfo').form({
        		url:'${ctx}/culpritinfo/culprit/save',
        		onSubmit:function(o){
        			o.no=$('#no').textbox('getText');
        			//console.info(o.no+'011');
        			//return $(this).form('validate');
        		},
        		success:function(data){
        			data = JSON.parse(data);
        			if(data.status==200){
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        				
        				parent.location.reload();
        				
            			var index = parent.layer.getFrameIndex(window.name);
    					parent.layer.close(index);
    					
        			}else{
        				alert(data.msg);
        			}
        			
        		}
        	});	
        
        $('#culpritId').combogrid({    
        	delay: 500,
        	 panelWidth: 300, 
        	 striped:true,
        	 panelHeight: 300,
    		mode: 'remote',  
			idField: 'id',
			textField: 'name',
			url: '${ctx}/culpritinfo/culprit/list',
			columns: [[
				{field:'name',title:'姓名',width:120,align:'center'},
				{field:'dicSexKey',title:'性别',width:80,align:'center'}
			]],
			fitColumns: true,
			pagination: true,           //是否分页  
        rownumbers: true,           //序号  
        collapsible: false,         //是否可折叠的  
        method: 'post',
        onSelect:function(record){
        	 var arr = $('#culpritId').combogrid('grid').datagrid('getSelections');
        	 $('#culpritInfo').form('load',arr[0]);
       	}
        }); 
        
        
      //取得分页组件对象  
        var pager = $('#culpritId').combogrid('grid').datagrid('getPager');  
        if (pager) {  
            $(pager).pagination({  
                pageSize: 10,               //每页显示的记录条数，默认为10  
                beforePageText: '第',       //页数文本框前显示的汉字  
                afterPageText: '',
                displayMsg: ''
            });  
        }
       

        });
        /*选择证件时确定证件号码类型,更改name属性*/
        $('#dicZjlxKey').combobox({
        	onSelect: function(record){
        		console.info(record)
        		if(record.key=="86001"){
        			$("#Identification").attr("name","cedentialsNumber");
        			//console.info($("#Identification").attr("name"));
        		}else if(record.key=="86002"){
        			$("#Identification").attr("name","passportNum");
        		}else if(record.key=="86003"){
        			$("#Identification").attr("name","returnCardNum");
        		}else{
        			$("#Identification").attr("name","compatriotsCardNum");
        		}
        	}
        });
        /*选择户口省触发省下面的市*/
        $('#regResidenceProId').combobox({
        	onSelect: function(record){
        		$('#regResidencePro').val(record.areaName);
        		$('#regResidenceCityId').combobox({    
        			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
        		    valueField:'id',    
        		    textField:'areaName'   
        		}); 
			}
		});
        /*选择户口市触发市下面的县*/
        $('#regResidenceCityId').combobox({
        	onSelect: function(record){
        		$('#regResidenceCity').val(record.areaName);
        		$('#regResidenceCountryId').combobox({    
        			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
        		    valueField:'id',    
        		    textField:'areaName'   
        		}); 
			}
		});
        //获取区的名字
        $('#regResidenceCountryId').combobox({ 
        	onSelect: function(record){
        		$('#regResidenceCountry').val(record.areaName);
        	}
        });
        /*选择固定居住省触发省下面的市*/
   		$('#addressProId').combobox({    
   			onSelect: function(record){
   				$('#addressPro').val(record.areaName);
        		$('#addressCityId').combobox({    
        			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
        		    valueField:'id',    
        		    textField:'areaName'   
        		}); 
			}   
   		}); 
        /*选择固定居住省触发省下面的市*/
   		$('#addressCityId').combobox({    
   			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent=46',    
   		    valueField:'id',    
   		    textField:'areaName'   
   		}); 
       /*选择固定市触发市下面的县*/
       $('#addressCityId').combobox({
       		onSelect: function(record){
       			$('#addressCity').val(record.areaName);
       			$('#addressCountryId').combobox({    
       			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
       		    valueField:'id',    
       		    textField:'areaName'   
       			}); 
			}
		});
       $('#addressCountryId').combobox({    
	    	   onSelect: function(record){
	    		   $('#addressCountry').val(record.areaName);
	    	   }
  			});
       /*选择司法所后动态生成人员编号*/
       $('#sysGroupId').combotree({
   			onSelect:function(node) {
	   			$.ajax({
	   				type : 'get',
	   				url : '${ctx}/culpritinfo/culprit/findNumByGroupId?groupId=' + node.id,
	   				cache : false,
	   				async : false, //同步请求
	   				dataType : 'json',
	   				success : function(result) {
	   					console.info(result);
	   					$('#no').textbox('setText',result);
	   				}
	   			});
   			}
   		})
    </script>
</body>
</html>