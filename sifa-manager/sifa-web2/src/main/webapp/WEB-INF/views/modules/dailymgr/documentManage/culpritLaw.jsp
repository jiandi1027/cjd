<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
 <form  action="${ctx}/culpritinfo/culpritComplicity/save" method="post" >
     <div class="easyui-panel" title="法律文书相关" style="width:100%;padding:5px;margin: 0 auto;">
             <table width="100%"class="grid">
                <tr>
                    <th width=10%>矫正类别：</th>
                    <td width=23%>
                    	${fns:getSysDicValueByKey('sf_investigate', 'entrust_type_id', culpritJudgment.dicPenalTypeKey, '') }
                   </td>
                    <th width=10%>犯罪类型：</th>
                    <td width=23%>
                    	${fns:getSysDicValueByKey('sf_culpritJudgment', 'dicCrimeTypeKey', culpritJudgment.dicCrimeTypeKey, '') }
                    </td>
                    <th width=10%>具体罪名：</th>
                    <td width=23%>${culpritJudgment.crimeInfo}</td>
                </tr>
                <tr>
                    <th>审判机关名称：</th>
                    <td>${culpritJudgment.adjudgeOrg}</td>
                    <th>判决书编号：</th>
                    <td>${culpritJudgment.adjudgeId}</td>
                    <th>判决日期：</th>
                    <td><fmt:formatDate value="${culpritJudgment.adjudgeDate}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <th>原判刑罚：</th>
                    <td>
                    	${fns:getSysDicValueByKey('culpritJudgment', 'dicYpxfKey', culpritJudgment.dicYpxfKey, '') }
                    </td>
                    <th>原判刑期：</th>
                    <td>${culpritJudgment.adjudgePeriod}</td>
                    <th>刑期开始日期：</th>
                    <td><fmt:formatDate value="${culpritJudgment.adjudgeStartTime}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <th>刑期结束日期：</th>
                    <td><fmt:formatDate value="${culpritJudgment.adjudgeEndTime}"
									pattern="yyyy-MM-dd" /></td>
                    <th>执行通知书文号：</th>
                    <td>${culpritLaw.executeNotificationNum}</td>
                    <th>执行通知书日期：</th>
                    <td><fmt:formatDate value="${culpritLaw.executeNotificationDate}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <th>社区矫正决定机关：</th>
                    <td>${culpritJudgment.adjudgeRedressOrg}</td>
                    <th>裁决日期：</th>
                    <td><fmt:formatDate value="${culpritJudgment.adjudgeRedressT}"
									pattern="yyyy-MM-dd" /></td>
                    <th>法律文书收到日期：</th>
                    <td><fmt:formatDate value="${culpritLaw.legalDocsReceiveT}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                    <th>矫正开始时间：</th>
                    <td><fmt:formatDate value="${culpritJudgment.redressStartDate}"
									pattern="yyyy-MM-dd" /></td>
                    <th>矫正结束时间：</th>
                    <td><fmt:formatDate value="${culpritJudgment.redressEndDate}"
									pattern="yyyy-MM-dd" /></td>
                    <th>矫正期限：</th>
                    <td>${culpritJudgment.redressPeriod}</td>
                </tr>
                <tr>
                    <th>文书类型：</th>
                    <td>${fns:getSysDicValueByKey('sf_culpritLaw','dicWslxKey',culpritLaw.dicWslxKey,'')}
                    	
                    </td>
                    <th>文书编号：</th>
                    <td>${culpritLaw.indictmentNum}</td>
                    <th>文书生效日期：</th>
                    <td><fmt:formatDate value="${culpritLaw.legalDocsStartDate}"
									pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                	<th>是否共同犯罪：</th>
                    <td>
			 			<c:if test="${culpritJudgment.dicSfgtfzKey ne '0' }">
			 				是
			 			</c:if>
			 			<c:if test="${culpritJudgment.dicSfgtfzKey eq '0' }">
			 				否
			 			</c:if>
	 				</td>
 	 				<!-- style为了radio与文字平行
 	 				<input type="radio" name="dicSfgtfzKey" value="${culpritJudgment.dicSfgtfzKey}" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
					<input type="radio" name="dicSfgtfzKey" value="${culpritJudgment.dicSfgtfzKey}" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否-->
 	 				<th>有无同矫正对象：</th>

                    <td>
			 			<c:if test="${culpritJudgment.dicHaveTogetherKey ne '0' }">
			 				是
			 			</c:if>
			 			<c:if test="${culpritJudgment.dicHaveTogetherKey eq '0' }">
			 				否
			 			</c:if>
	 				</td>
 	 				<!-- style为了radio与文字平行
 	 				<input type="radio" name="dicHaveTogetherKey" value="${culpritJudgment.dicHaveTogetherKey}" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
					<input type="radio" name="dicHaveTogetherKey" value="${culpritJudgment.dicHaveTogetherKey}" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否-->

 	 				<th>首次报道截止时间：</th>
                    <td><fmt:formatDate value="${culpritJudgment.limitDate}" pattern="yyyy-MM-dd" /></td>
                </tr>
               	<tr rowspan="3">
					<th>主要犯罪事实：</th>
					<td colspan="5">${culpritJudgment.crimeFact}
    				</td>
 				</tr>
            </table>
    </div>
    <div id="imprisonDetail"></div>
    <div id="toolbarLaw" style="display: none;">
	        <a onclick="addlaw();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">上传法律文书</a>
			
		</div>
     <div class="easyui-panel"  title="已上传法律文书列表" style="width:100%;padding:5px;height:200px;margin: 0 auto;">
		<table class="easyui-datagrid" id="judg_list_content" width="100%" 
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:'#toolbarLaw',fitColumns:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/culprit/culpritLaw/list?culpritId='+'${culprit.id }',method:'post',onLoadSuccess:function (data) {
                        $('.easyui-linkbutton-del1').linkbutton({text:'下载',plain:true,iconCls:'fi-arrow-down icon-blue'});
                        $('.easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:true">编号</th>
					<th data-options="field:'originName',width:'50%',align:'center'">法律文书名称</th>
					<!-- <th data-options="field:'indictmentNum',width:'20%',align:'center'" editor="text">法律文书编号</th>
					<th data-options="field:'dicWslxKey',width:'10%',align:'center',formatter:function(value,rowData,rowIndex){    
						    	 return sy.getDicValue('sf_culpritLaw','dicWslxKey',rowData.dicWslxKey,'');}" editor="text">法律文书类型</th> -->
					<th data-options="field:'created',width:'20%',align:'center'" editor="text">上传时间</th>
					<th data-options="field:'action',width:'28%',align:'center'" formatter="formatterLawAct" >操作</th><!-- formatter="formatterJudg" -->
				</tr>
			</thead>
		</table>     
	 </div>
	 <div class="easyui-panel" title="收监执行" style="width:100%;padding:5px;height:150px;margin: 0 auto;">
	 	<table class="easyui-datagrid" id="t_list_content"  width="100%"
			data-options="singleSelect:true,fit:true,fitColumns:true,rownumbers:true,collapsible:true,striped:true,
			loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/endcorrect/imprison/list?culpritId='+'${culprit.id }',method:'post',onLoadSuccess:function (data) {
                       $('.organization-easyui-linkbutton-edit').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'}); 
                    }">
			<thead>
				<tr>	
					<th data-options="field:'id',hidden:true">编号</th>
					<th data-options="field:'applyDate',width:'20%',align:'center',sortable:true"
						editor="text">申请提交时间</th>
					<th data-options="field:'dicImprisonTypeKey',width:'20%',align:'center',formatter:formatStatusKey">收监类型</th>
					<th data-options="field:'dicJudgeResultKey',width:'20%',align:'center',formatter:formatStatusKey1">裁定结果</th>
					<th data-options="field:'imprisonDealResult',width:'20%',align:'center',
						formatter:formatStatusKey2">处理结果</th>
				 	<th data-options="field:'_opt',width:'20%',formatter:formatOper,align:'center'">操作</th>  

				</tr>
			</thead>
		</table> 	
	 </div> 
	 </form>
	 <div id="addCulpritlaw" class="easyui-dialog" title="法律文书信息" style="width:550px;height:200px;" modal=true  maximizable=true resizable=true   
        data-options="closed:true,iconCls:'fi-plus icon-green',buttons:[{
				text:'保存',
				iconCls:'icon-save',
				handler:function(){savelaw();}
			},{
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){$('#addCulpritlaw').dialog('close');$('#saveCulpritlaw').form('clear');}
			}]">
       <form id="saveCulpritlaw">
        <table width="100%" class="grid">
        	<%-- <tr>
        		<th width="30%">文书编号：</th>
        		<td width="70%"><input class="easyui-textbox" id="indictmentNum2" name="indictmentNum" /></td>
        	</tr>
        	<tr>
        		<th>文书类型：</th>
        		<td><input name="dicWslxKey" class="easyui-combobox"   value="<c:if test='${culpritLaw.dicWslxKey!=null}'>${culpritLaw.dicWslxKey}</c:if><c:if test='${culpritLaw.dicWslxKey==null}'>125001</c:if>"
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=125000',panelHeight:'auto',editable:false"></input></td>
        	</tr> --%>
        	<tr>
        		<th width="30%">文书上传：</th>
        		<td><div id="docsUpload"></div>
        			<input type="hidden"  name="docsUploadPathName" id="docsPathName">
					<input type="hidden"  name="docsUploadPath" id="docsPath" >
					<input type="hidden" name="docsUploadUrl" id="docsUrl" >
				</td>
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
        function formatSex(value,row,index){
    		if(value==10001){
    			return '男';
    		}else{
    			return '女';
    		}
    	}
        function formatYpxf(value,row,index){
    		if(value){
    			return sy.getDicValue('culpritJudgment', 'dicYpxfKey',value, ''); 
    		}else{
    			return value;
    		}
    	}
        function formatStatusKey(value, row, index){
        	if(value){
    			return sy.getDicValue('comme_table', 'DIC_IMPRISON_TYPE_KEY',value, ''); 
    		}else{
    			return value;
    		} 	
        }

        function formatStatusKey1(value, row, index){
        	 if(value){
     			return sy.getDicValue('SF_IMPRISON', 'DIC_JUDGE_RESULT_KEY',value, ''); 
     		}else{
     			return '待处理';
     		} 	
        }

        function formatStatusKey2(value, row, index){
        	 if(value){
      			return sy.getDicValue('SF_IMPRISON', 'IMPRISON_DEAL_RESULT',value, ''); 
      		}else{
      			return '待处理';
      		} 	
        }
        function formatOper(val,row,index){  
        	 /* var operation='<a href="javascript:void(0);" onclick="imprisonDetail(\''+row.id+'\')">详情</a>';
        		if(row.dicJudgeResultKey=='91503'){
        			operation=operation+'&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:caiding(\''+row.id+'\')">裁定收监</a>';
        		}
        		if(row.imprisonDealResult!='91401' && row.imprisonDealResult!='91404'){
        			operation=operation+'&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:void(0);" onclick="shoujian(\''+row.id+'\')">收监处理</a>';
        		}
        	    return operation;  */
        	    
        	    
        	var operation='<a href="javascript:void(0);"  class="organization-easyui-linkbutton-edit" onclick="imprisonDetail(\''+row.id+'\')">详情</a>';
            return operation;
        }
        
      //收监执行详细
        function imprisonDetail(id){
    	  $('#imprisonDetail').dialog({    
			    title: '收监执行详情',    
			    width : sy.getBrowerWidth()-400,
		        height : sy.getBrowerHeight()-200,
		        iconCls:'fi-info icon-blue',
		        maximizable:true,
		        resizable:true,
			    closed: false,    
			    cache: false,    
			    href : '${ctx}/endcorrect/imprison/detail?id=' + id, 
			    buttons : [ {
		             text : '打印《收监执行建议书》',
		             iconCls:'fi-print icon-blue',
		             handler : function() {
		            	 $('#printImprisonJianyi').dialog({    
							    title: '打印《收监执行建议书》',    
							    width: sy.getBrowerWidth()-900,    
							    height: sy.getBrowerHeight()-100,
							    iconCls:'fi-print icon-blue',
							    closed: false,    
							    cache: false,  
							    maximizable:true,
						        resizable:true,
							    href: '${ctx}/endcorrect/imprison/printJianyi?id=' + id, 
							    modal: true   
							});    
		             }
		         },{
		        	 text : '打印《提请收监执行审核表》',
		        	 iconCls:'fi-print icon-blue',
		             handler : function() {
		            	 $('#printImprisonJianyi').dialog({    
							    title: '打印《提请收监执行审核表》',    
							    width: sy.getBrowerWidth()-900,    
							    height: sy.getBrowerHeight()-100, 
							    iconCls:'fi-print icon-blue',
							    closed: false,    
							    cache: false,
							    maximizable:true,
						        resizable:true,
							    href: '${ctx}/endcorrect/imprison/printShenhe?id=' + id,    
							    modal: true   
							});    
		             }
		         },{
		             text : '关闭',
		             iconCls:'fi-x icon-blue',
		             handler : function() {
		            	 $('#imprisonDetail').dialog('close');
		             }
		         }] 		
			});    

        }
        //上传法律文书
        function addlaw(){
        	$("#docsUpload").empty();
    	  	$("#docsUpload").powerWebUpload({ auto: true,fileNumLimit:4,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});	
    	  	$('#addCulpritlaw').dialog('open');
    	 }
      //保存上传文书
        function savelaw(){
        	 setFilePathAndName('docsUpload');
        	 if($("#saveCulpritlaw").form('validate')){
        			$.ajax({
        				type: 'post' ,
        				url: '${ctx}/culprit/culpritLaw/save?culpritId=${culprit.id}',
        				cache:false ,
        				async : false, //同步请求
        				data:$('#saveCulpritlaw').serialize() ,
        				dataType:'json',
        				success:function(data){
        					$.messager.show({
        	  					title:'提示信息!',
        	  					msg:'保存成功'
        	  				});
        					$('#addCulpritlaw').dialog('close');
        					$('#saveCulpritlaw').form('clear'); 
        					$('#judg_list_content').datagrid('load', {});
        				} ,
        				error:function(data){
        					$.messager.show({
        	  					title:'提示信息!',
        	  					msg:data.msg
        	  				});
        				}
        			});
        		}else{
        			 $.messager.show({
        				title:'提示信息!' ,
        				msg:'验证失败！请检查数据是否已填写完整!'
        			}); 
        		} 
        }	
      
        //操作
        function formatterLawAct(value,row,index){
        	var space = '&nbsp;';
        	var operation='';
        	operation=operation+'<a href="javascript:void(0);" class="easyui-linkbutton-del1" onclick="loadLaw(\''+row.id+'\')">下载</a>';
        	operation=operation+'<a href="javascript:void(0);" class="easyui-linkbutton-del" onclick="deleteLaw(\''+row.id+'\')">删除</a>';
            return operation; 
        }
        
        //下载
        function loadLaw(id){
        	window.location.href='${ctx}/sys/file/download?id='+id;
        }
        
      //删除
        function deleteLaw(id,fileId){
        	sysFileDel(id);
        	$('#judg_list_content').datagrid('reload');
        }
    </script>
