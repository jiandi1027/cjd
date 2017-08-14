<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>法律文书</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body >
 <form  action="${ctx}/culpritinfo/culpritComplicity/save" method="post" id="culpritInfo">
     <div class="easyui-panel" title="法律文书相关" style="width:100%;padding:10px;">
             <table width="100%">
                <tr>
                    <td><span class="c-red">*</span>矫正类别:</td>
                    <td>
                    	${fns:getSysDicValueByKey('sf_investigate', 'entrust_type_id', culpritJudgment.dicPenalTypeKey, '') }
                   </td>
                    <td><span class="c-red">*</span>犯罪类型:</td>
                    <td>
                    	${fns:getSysDicValueByKey('sf_culpritJudgment', 'dicCrimeTypeKey', culpritJudgment.dicCrimeTypeKey, '') }
                    </td>
                    <td><span class="c-red">*</span>具体罪名:</td>
                    <td>${culpritJudgment.crimeInfo}</td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>审判机关名称:</td>
                    <td>${culpritJudgment.adjudgeOrg}</td>
                    <td><span class="c-red">*</span>判决书编号:</td>
                    <td>${culpritJudgment.adjudgeId}</td>
                    <td><span class="c-red">*</span>判决日期:</td>
                    <td><fmt:formatDate value="${culpritJudgment.adjudgeDate}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>原判刑罚:</td>
                    <td>
                    	${fns:getSysDicValueByKey('culpritJudgment', 'dicYpxfKey', culpritJudgment.dicYpxfKey, '') }
                    </td>
                    <td><span class="c-red">*</span>原判刑期:</td>
                    <td>${culpritJudgment.adjudgePeriod}</td>
                    <td><span class="c-red">*</span>刑期开始日期:</td>
                    <td><fmt:formatDate value="${culpritJudgment.adjudgeStartTime}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>刑期结束日期:</td>
                    <td><fmt:formatDate value="${culpritJudgment.adjudgeEndTime}"
									pattern="yyyy-MM-dd" /></td>
                    <td><span class="c-red">*</span>执行通知书文号:</td>
                    <td>${culpritLaw.executeNotificationNum}</td>
                    <td><span class="c-red">*</span>执行通知书日期:</td>
                    <td><fmt:formatDate value="${culpritLaw.executeNotificationDate}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>社区矫正决定机关:</td>
                    <td>${culpritJudgment.adjudgeRedressOrg}</td>
                    <td><span class="c-red">*</span>裁决日期:</td>
                    <td><fmt:formatDate value="${culpritJudgment.adjudgeRedressT}"
									pattern="yyyy-MM-dd" /></td>
                    <td><span class="c-red">*</span>法律文书收到日期:</td>
                    <td><fmt:formatDate value="${culpritLaw.legalDocsReceiveT}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>矫正开始时间:</td>
                    <td><fmt:formatDate value="${culpritJudgment.redressStartDate}"
									pattern="yyyy-MM-dd" /></td>
                    <td><span class="c-red">*</span>矫正结束时间:</td>
                    <td><fmt:formatDate value="${culpritJudgment.redressEndDate}"
									pattern="yyyy-MM-dd" /></td>
                    <td><span class="c-red">*</span>矫正期限:</td>
                    <td>${culpritJudgment.redressPeriod}</td>
                </tr>
                <tr>
                    <td><span class="c-red">*</span>文书类型:</td>
                    <td>
                    	${fns:getSysDicValueByKey('sf_culpritLaw', 'dicWslxKey', culpritLaw.dicWslxKey, '') }
                    </td>
                    <td><span class="c-red">*</span>文书编号:</td>
                    <td>${culpritLaw.indictmentNum}</td>
                    <td><span class="c-red">*</span>文书生效日期:</td>
                    <td><fmt:formatDate value="${culpritLaw.legalDocsStartDate}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                	<td>是否共同犯罪:</td>
                    <td>
			 			<c:if test="${culpritJudgment.dicSfgtfzKey ne 0 }">
			 				<input id="dicSfgtfzKey0" type="radio" name="dicSfgtfzKey" value="0" disabled style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicSfgtfzKey1" type="radio" name="dicSfgtfzKey" value="1" disabled checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
			 			<c:if test="${culpritJudgment.dicSfgtfzKey eq 0 }">
			 				<input id="dicSfgtfzKey0"  type="radio" name="dicSfgtfzKey" value="0" disabled  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicSfgtfzKey1"  type="radio" name="dicSfgtfzKey" value="1" disabled  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
	 				</td>
 	 				<!-- style为了radio与文字平行
 	 				<input type="radio" name="dicSfgtfzKey" value="${culpritJudgment.dicSfgtfzKey}" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
					<input type="radio" name="dicSfgtfzKey" value="${culpritJudgment.dicSfgtfzKey}" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否-->
 	 				<td>有无同矫正对象:</td>

                    <td>
			 			<c:if test="${culpritJudgment.dicHaveTogetherKey ne 0 }">
			 				<input id="dicHaveTogetherKey0" type="radio" name="dicHaveTogetherKey" value="0" disabled  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicHaveTogetherKey1" type="radio" name="dicHaveTogetherKey" value="1" disabled   checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
			 			<c:if test="${culpritJudgment.dicHaveTogetherKey eq 0 }">
			 				<input id="dicHaveTogetherKey0"  type="radio" name="dicHaveTogetherKey" value="0" disabled checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicHaveTogetherKey1"  type="radio" name="dicHaveTogetherKey" value="1" disabled  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
	 				</td>
 	 				<!-- style为了radio与文字平行
 	 				<input type="radio" name="dicHaveTogetherKey" value="${culpritJudgment.dicHaveTogetherKey}" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
					<input type="radio" name="dicHaveTogetherKey" value="${culpritJudgment.dicHaveTogetherKey}" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否-->

 	 				<td><span class="c-red">*</span>首次报道截止时间:</td>
                    <td><fmt:formatDate value="${culpritJudgment.limitDate}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
               	<tr rowspan="3">
					<td>主要犯罪事实:</td>
					<td colspan="6">${culpritJudgment.crimeFact}
    				</td>
 				</tr>
            </table>
    </div>
    </form>
     <div class="easyui-panel" id="p2" title="相关材料" style="width:100%;height: 200px;">
		<table class="easyui-datagrid" id="judg_list_content"
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,fitColumns:true,loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/sys/culpritLaw/list?culpritId='+'${culprit.id }',method:'post'">
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
	 </div>
	 <div class="easyui-panel" id="p2" title="收监执行" style="width:100%;height: 200px;">
	 	<table class="easyui-datagrid" id="t_list_content" title="提请撤销暂予监外执行" 
			data-options="singleSelect:true,fit:true,rownumbers:true,noheader:true,collapsible:true,striped:true,toolbar:'#toolbar',loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/endcorrect/imprison/list?culpritId='+'${culprit.id }',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'applyDate',width:120,align:'center',sortable:true"
						editor="text">申请提交时间</th>
					<th data-options="field:'dicImprisonTypeKey',width:120,align:'center',
						formatter:formatStatusKey">收监类型</th>
					<th data-options="field:'dicJudgeResultKey',width:200,align:'center',
						formatter:formatStatusKey1">裁定结果</th>
					<th data-options="field:'imprisonDealResult',width:200,align:'center',
						formatter:formatStatusKey2">处理结果</th>
				 	<th data-options="field:'_opt',width:200,formatter:formatOper,align:'center'">操作</th>  

				</tr>
			</thead>
		</table> 	
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
        function formatStatusKey(value, row, index){
        	var str = '';
        	$.ajax({
        		type : 'post',
        		url : '${ctx}/sys/sysDic/getDicValue?tabName=comme_table&columnName=DIC_IMPRISON_TYPE_KEY&key='+value,
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

        function formatStatusKey1(value, row, index){
        	var str = '<span style="color:red">待处理<span>';
        	$.ajax({
        		type : 'post',
        		url : '${ctx}/sys/sysDic/getDicValue?tabName=SF_IMPRISON&columnName=DIC_JUDGE_RESULT_KEY&key='+value,
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

        function formatStatusKey2(value, row, index){
        	var str = '<span style="color:red">待处理<span>';
        	$.ajax({
        		type : 'post',
        		url : '${ctx}/sys/sysDic/getDicValue?tabName=SF_IMPRISON&columnName=IMPRISON_DEAL_RESULT&key='+value,
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
        function formatOper(val,row,index){  
        	var operation=$.formatString('<a href="javascript:detail(\'{0}\');"  title="详细"><span style="color:blue;"><strong><u>详细</u><strong></span></a>', row.id);
        	if(row.dicJudgeResultKey=='' || row.dicJudgeResultKey==null){
        		operation=operation+'&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:caiding(\'{0}\');"  title="裁定收监"><span style="color:blue;"><strong><u>裁定收监</u><strong></span></a>', row.id);
        	}
        	if(row.imprisonDealResult!='91401' && row.imprisonDealResult!='91404'){
        		operation=operation+'&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:shoujian(\'{0}\');"  title="收监处理"><span style="color:blue;"><strong><u>收监处理</u><strong></span></a>', row.id);
        	}
        	return operation;
        }
    </script>
</body>
</html>
