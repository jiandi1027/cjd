<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

 <form  action="" method="post" id="firstgradeInfo">
 	<input type="hidden" name="culpritId" value="${culprit.id }" />
     <div class="easyui-panel"  style="width:100%;padding:10px;">
            <table width="100%" class="grid">
            	<tr>
                    <th width="10%">矫正对象：</th>
                    <td width="90%">${culprit.name }</td>
                </tr>
                <tr>
                    <th>监管等级：</th>
                    <td><input name="dicMonitorGradeKey" id="dicMonitorGradeKey2" class="easyui-combobox" required=true style="width:200px;" 
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=27000&key=27003',panelHeight:'auto',editable:false"></input></td>
                </tr>
                 <tr rowspan="5">
                     <th>确定监管等级缘由：</th>
                    <td><input id="dicChangeReasonKey" name="dicChangeReasonKey" class="easyui-combobox" required=true style="width:500px;" value=""></td>
                </tr> 
                <tr rowspan="5">
                    <th>确定原因及依据：</th>
					<td colspan="5"><input type="text" name="accountOpinion" id="accountOpinion" multiline=true 
						class="f1 easyui-textbox" value=""  style="width:800px;height:80px;"/></td>
                </tr>
                <tr>
                    <th><span class="c-red">*</span>相关材料：</th>
                    <td><input type="file" name="evidencePath" id="evidencePath" value="上传"></input></td>
                </tr>
                <tr>
                    <th>已上传附件：</th>
                    <td></td>
                </tr> 
                <tr>
                	<td align="center" colspan="6">
                		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveForm()">新增</a>
                	</td>
                </tr>
            </table>
           
    </div>
    
     <div class="easyui-panel" title="监管等级变更记录列表" style="width:100%;">
     	<table class="easyui-datagrid" id="firstgrade_list_content" style="height: 200px;"
			data-options="singleSelect:true,collapsible:true,striped:true,rownumbers:true,fitColumns:true,loadMsg: '数据正在加载,请耐心的等待...'  ,pagination:true,pageSize: 5 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/gradeChange/list',method:'post',queryParams:{culpritId:'${culprit.id}'}">
			<thead>
				<tr>
					<th data-options="field:'culpritName',width:'15%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">社区矫正人员</th>
					<th data-options="field:'sysGroupName',width:'15%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">司法所</th>
					<th data-options="field:'dicOldMonitorGradeKey',width:'17%',align:'center',formatter:formatOldGrade"
						editor="text">原监管等级</th>
					<th data-options="field:'dicMonitorGradeKey',width:'17%',align:'center',formatter:formatNewGrade"
						editor="{type:'validatebox',options:{required:true}}">新监管等级</th>
					<th data-options="field:'created',width:'17%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">创建时间</th>
					<th data-options="field:'action',width:'20%',align:'center'" formatter="formatterFirstGrade">操作</th><!-- formatter="formatterJudg" -->
				</tr>
			</thead>
		</table>
    </div>
    </form>
     <!-- <div id="schemeDetail" title="详细" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 500px;">
		<form id="schemeDetailForm" action="" method="post">
			<input type="hidden" name="id" value="" />
			<input type="hidden" name="culpritId" value="" />
			<table>
				<tr>
                    <td>矫正方案名称:</td>
                    <td><input name="schemeName" id="schemeName" class="f1 easyui-textbox" required="required" data-options="disabled: true"></input></td>
                </tr>
                 <tr rowspan="5">
                    <td>矫正意见：</td>
					<td colspan="5"><input type="text" name="schemeOpinion" id="schemeOpinion" multiline=true data-options="disabled: true"
						class="f1 easyui-textbox" value=""  style="width:350px;height:80px;"/></td>
                </tr> 
                <tr rowspan="5">
                    <td>矫正措施：</td>
					<td colspan="5"><input type="text" name="schemeStep" id="schemeStep"  multiline=true data-options="disabled: true"
						class="f1 easyui-textbox" value="" style="width:350px;height:80px;"/></td>
                </tr>
				<tr align="center">
					<td colspan="4"><a id="schemeBtn" class="easyui-linkbutton" onclick="resumeSave();">打印《社区服刑人员矫正方案》</a>
					<a href="javascript:void(0)"  class="easyui-linkbutton" onclick="$('#schemeDetail').dialog('close');">取消</a></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="schemeUpdate" title="修改" modal=true draggable=false
		class="easyui-dialog" closed=true style="width: 500px;">
		<form id="schemeUpdateForm" action="" method="post">
			<input type="hidden" name="id" value="" />
			<input type="hidden" name="culpritId" value="${culprit.id }" />
			<table>
				<tr>
                    <td>矫正方案名称:</td>
                    <td><input name="schemeName" id="schemeName" class="f1 easyui-textbox" required="required" ></input></td>
                </tr>
                 <tr rowspan="5">
                    <td>矫正意见：</td>
					<td colspan="5"><input type="text" name="schemeOpinion" id="schemeOpinion" multiline=true required="required"
						class="f1 easyui-textbox" value=""  style="width:350px;height:80px;"/></td>
                </tr> 
                <tr rowspan="5">
                    <td>矫正措施：</td>
					<td colspan="5"><input type="text" name="schemeStep" id="schemeStep"  multiline=true required="required"
						class="f1 easyui-textbox" value="" style="width:350px;height:80px;"/></td>
                </tr>
				<tr align="center">
					<td colspan="4"><a id="schemeUpdateBtn" class="easyui-linkbutton" onclick="schemeUpdateBtn();">保存</a>
					<a href="javascript:void(0)"  class="easyui-linkbutton" onclick="$('#schemeUpdate').dialog('close');">取消</a></td>
				</tr>
			</table>
		</form>
	</div> -->
    <script type="text/javascript">
       function saveForm(){
        	 $('#firstgradeInfo').form('submit');
        }
       function schemeUpdateBtn(){
    	   $('#schemeUpdateForm').form('submit');
       }
       /*  function clearForm(){
            $('#culpritInfo').form('clear');
        }*/
        /*选择证件时确定证件号码类型,更改name属性*/
        $(function(){
        	
        	//$('#identification').numberbox({ disabled: true });
        	//矫正信息储存	
			
        });
        //修改提交表单
        $('#firstgradeInfo').form({
    		url:'${ctx}/dailymgr/gradeChange/save',
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
    				$('#dicMonitorGradeKey2').combobox('clear');
    				$('#dicChangeReasonKey').combobox('clear');
    				$('#accountOpinion').textbox('clear');
    				//$('#schemeUpdate').dialog('close');
    				$('#firstgrade_list_content').datagrid('reload');
    			}else{
    				alert(data.msg);
    			}
    			
    		}
    	});
        function formatterScheme(val,row,index){ 
        	
        	var operation=$.formatString('<a href="javascript:schemeDetail(\'{0}\',\'{1}\',\'{2}\',\'{3}\');"  title="详情"><span style="color:blue;"><strong><u>详情</u><strong></span></a>', row.id,row.schemeName,row.schemeOpinion,row.schemeStep);
        	return operation;
        }
        //打开详细页面
        function schemeDetail(id,name,opinion,schemeStep){
        	$('#schemeDetailForm').form('clear');
        	$('#schemeDetailForm').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
    			id : id,
    			schemeName : name,
    			schemeOpinion : opinion,
    			schemeStep : schemeStep
    		});
        	$('#schemeDetail').dialog('open');
        }
        function schemeUpdate(id,name,opinion,schemeStep){
        	$('#schemeUpdateForm').form('clear');
        	$('#schemeUpdateForm').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
    			id : id,
    			culpritId : '${culprit.id}',
    			schemeName : name,
    			schemeOpinion : opinion,
    			schemeStep : schemeStep
    		});
        	$('#schemeUpdate').dialog('open');
        }
        $('#dicMonitorGradeKey2').combobox({
        	onSelect: function(record){
        		var value;
        		if(record.id=='27003'){
        			value=121000;
        		}
        		if(record.id=='27004'){
        			value=83000;
        		}
        		if(record.id=='27005'){
        			value=88000;
        		}
        		$('#dicChangeReasonKey').combobox({
        			url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey='+value,    
        			panelHeight:'250',
        			valueField:'id',    
        		    textField:'value'   
        		}); 
			}
		});
        function formatterFirstGrade(val,row,index){
        	var operation=$.formatString('<a href="javascript:schemeDetail(\'{0}\',\'{1}\',\'{2}\',\'{3}\');"  title="详情"><span style="color:blue;"><strong><u>详情</u><strong></span></a>', row.id,row.schemeName,row.schemeOpinion,row.schemeStep);
        	return operation
        }
        function formatOldGrade(val,row,index){
        	if(row.dicOldMonitorGradeKey){
        		return sy.getDicValue('sf_culprit', 'dic_gldxjb_key', row.dicOldMonitorGradeKey, '')
        	}else{
        		return ''
        	}
        	
        }
        function formatNewGrade(val,row,index){
        	if(row.dicMonitorGradeKey){
        		return sy.getDicValue('sf_culprit', 'dic_gldxjb_key', row.dicMonitorGradeKey, '')
        	}else{
        		return ''
        	}
        	
        }
    </script>
 
