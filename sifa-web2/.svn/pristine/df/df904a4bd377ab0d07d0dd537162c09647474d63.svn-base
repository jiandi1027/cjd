<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
 <form  action="${ctx}/rewardspunishment/parole/submitParoleAudit" method="post" id="paroleAuditForm">
 	<input type="hidden" name="auditType" value="${parole.auditType}"/>
 	<c:choose>
 		<c:when test="${empty parole.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${parole.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
     <div class="easyui-panel" title="假释相关信息" style="width:100%;padding:5px;">
           <input type="hidden" name="id" id="paroleId" value="${parole.id }"></input>
            <table width="100%"  class="grid">
                <tr>
                    <th width="10%">附件下载：</th>
                    <td colspan="5">
                    <div id="wtdchUploadIng">
				<c:forEach var="sysFile" items="${fileList}">
					<div id="file_${sysFile.id}">
					${sysFile.originName}
					<div class="webuploadDelbtn" onclick="javascript:window.location.href='${ctx}/sys/file/download?id=${sysFile.id}'">下载</div>
					</div>
				</c:forEach>
				</div>
                    </td>
                </tr>
                <tr>
                   <th width="10%"><span class="c-red">*</span>假释年限：</th>
					<td>
						<input name="reduceTime" class="easyui-textbox" required=true value="${parole.reduceTime}"/>
					</td>
				</tr> 
                <tr rowspan="5">
                    <th><span class="c-red"></span>法律依据：</th>
							<td colspan="5"><input type="text" name="reason" required=true  multiline=true readonly="readonly"
								class="f1 easyui-textbox" value="${parole.reason }"  style="width:800px;height:80px;"/></td>
                </tr> 
                <tr rowspan="5">
                    <th><span class="c-red"></span>表现概况：</th>
							<td colspan="5"><input type="text" name="actions" required=true multiline=true readonly="readonly"
								class="f1 easyui-textbox" value="${parole.actions }" style="width:800px;height:80px;"/></td>
                </tr>
                <!-- <tr>
                    <th>短信发送至：</th>
					<td></td>
                </tr>   -->
            </table>           
    </div>
    <c:if test="${parole.auditType ne 'sfsReport' && parole.auditType ne 'jzkReport' 
	&& parole.auditType ne 'sfsCheck'}">
 <div class="easyui-panel" title="质量评定" style="width:100%;padding:5px;">
		 <table width="100%" class="grid">
					<tr>
						
						<Th width="10%" >矫正科输入评分：</Th><td width="23%">${jzksr}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckAudit(1)">查看详细</a>
						</TD>
						<Th width="10%" >矫正科执法评分：</Th><td width="23%">${jzkzf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckAudit(2)">查看详细</a>
						</TD>
						<Th width="10%" >法制科执法评分：</Th><td>${fzkzf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckAudit(3)">查看详细</a>
						</TD>
					</tr>
					
		            <tr>	
						<Th width="10%" >矫正处输入评分：</Th><td width="23%">${jzcsr}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckAudit(4)">查看详细</a>
						</TD>
						<Th width="10%" >矫正处执法评分：</Th><td width="23%">${jzczf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckAudit(5)">查看详细</a>
						</TD>
						<Th width="10%" >法制处执法评分：</Th><td>${fzczf}&nbsp;&nbsp;
							<a  class="easyui-linkbutton" data-options="iconCls:'fi-checkbox icon-blue'" onclick="mxcheckAudit(6)">查看详细</a>
						</TD>
					</tr>
		 </table>
 	</div>
</c:if>
   
 	 <!-- 审核意见结果 -->
    <c:if test="${parole.auditType ne 'sfsReport' && parole.auditType ne 'gs'}">
			<div class="easyui-panel"  title="审批信息" style="width: 100%; padding: 5px;">
			<table width="100%" class="grid">
				
				<tr>
					<th width="10%">审核结果：</th>
					<td ><input type="radio" name="decideType" value="1" checked="checked" />同意
						<c:if test="${parole.auditType ne 'jcyCheck'}">
					 	<input type="radio" name="decideType" value="2" />退回
					 	</c:if>
					 	<c:if test="${parole.auditType eq 'jcyCheck' || parole.auditType eq 'sfgCheck'}">
					 		<input type="radio" name="decideType" value="0" />不同意
					 	</c:if>
					</td>
				</tr>
				<tr>
					<th>审核意见：</th>
					<TD><textArea class="f1 easyui-validatebox" style="width: 80%; height: 80px;"
							data-options="multiline:true" name="opinion" id="opinion" style="width: 280px; height: 100px"
							onkeydown='textarealength(this,300)'
							onKeyUp="textarealength(this,300)" maxlength="300"></textArea> <br>
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em
						class="textarea-length c-red">0</em>个字。</TD>
				</tr>
				</table>
				<table width="100%" class="grid">
				<c:if test="${parole.auditType eq 'jzkCheck'}">
				<TR>	
					<Th width="10%" >输入质量：</Th>
					<TD width="23%">
						<a href="#" class="easyui-linkbutton" id="jzksr" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(1);">评定</a>
					</TD>
					
					<Th width="10%" >输入质量评分：</Th>
					<TD width="23%">
						<label id="optScoreLabel"></label>
						<input type="hidden" id="optScore" name="optScore" />
					</TD>
					
					<Th width="10%" rowspan="2">是否推荐为典型案例：</Th>
					<TD rowspan="2" width="24%">
						<input type="radio" name="recommendStatus" value="1"/>是
						<input type="radio" name="recommendStatus" value="2" checked="checked"/>否
					</TD>
				</TR>
				
				<TR>	
					<Th width="10%" >执法质量：</Th>
					<TD width="23%">
						<a href="#" class="easyui-linkbutton" id="jzkzf" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(2)">评定</a>
					</TD>
					<Th width="10%">执法质量评分：</Th>
					<TD width="23%">
						<label id="zfScoreLabel" ></label>
						<input type="hidden" id="zfScore" name="zfScore" />
					</TD>
				</TR>	
						    
				</c:if>
				<c:if test="${parole.auditType eq 'fzkCheck'}">		    
				<TR>	
					<Th width="10%" >执法质量：</Th>
					<TD width="23%">
						<a href="#" class="easyui-linkbutton" id="fzkzf" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(3);">评定</a>
					</TD>
					<Th width="10%" >执法质量评分：</Th>
					<TD colspan="3">
						<label id="zfScoreLabel" ></label>
						<input type="hidden" id="zfScore" name="zfScore" />
					</TD>
				</TR>	
				</c:if>
				<c:if test="${parole.auditType eq 'sjzCheck'}">		    
				<TR>	
					<Th width="10%" >输入质量：</Th>
					<TD width="23%">
						<a href="#" class="easyui-linkbutton" id="sjzsr" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(4);">评定</a>
					</TD>
					
					<Th width="10%" >输入质量评分：</Th>
					<TD width="23%">
						<label id="optScoreLabel"></label>
						<input type="hidden" id="optScore" name="optScore" />
					</TD>
					<Th width="10%" rowspan="2">是否推荐为典型案例：</Th>
					<TD rowspan="2">
						<input type="radio" name="recommendStatus" value="1"/>是
						<input type="radio" name="recommendStatus" value="2" checked="checked"/>否
					</TD>
				</TR>
				<TR>	
					<Th width="10%" >执法质量：</Th>
					<TD width="23%">
						<a href="#" class="easyui-linkbutton" id="sjzzf" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(5);">评定</a>
					</TD>
					<Th width="10%"  >执法质量评分：</Th>
					<TD width="23%">
						<label id="zfScoreLabel" ></label>
						<input type="hidden" id="zfScore" name="zfScore" />
					</TD>
				</TR>
				</c:if>
				<c:if test="${parole.auditType eq 'sfzCheck'}">		    
				<TR>	
					<Th width="10%"  >执法质量：</Th>
					<TD width="35%">
						<a href="#" class="easyui-linkbutton" id="sfzzf" data-options="iconCls:'fi-clipboard-pencil icon-blue'" onclick="rewardspunishment(6);">评定</a>
					</TD>
					<Th width="10%"  >执法质量评分：</Th>
					<TD width="35%" colspan="3">
						<label id="zfScoreLabel" ></label>
						<input type="hidden" id="zfScore" name="zfScore" />
					</TD>
				</TR>	
				</c:if>
			</table>
			</div>
		</c:if>
    <!-- 公示 -->
    <c:if test="${parole.auditType eq 'gs' }">
			<div class="easyui-panel"  title="公示信息" style="width: 100%; padding: 5px;">
			<table width="100%" class="grid">
				<tr>
					<th width="10%">公示结果：</th>
					<td><input type="radio" name="decideType" value="10" checked="checked" />优秀
					 <input type="radio" name="decideType" value="11" />良好
					 <input type="radio" name="decideType" value="12" />一般
					 <input type="radio" name="decideType" value="13" />较差
					</td>
				</tr>
				<tr>
					<th>公示意见：</th>
					<TD><textArea class="f1 easyui-validatebox" style="width: 80%; height: 80px;"
							data-options="multiline:true" name="opinion" 
							onkeydown='textarealength(this,300)'
							onKeyUp="textarealength(this,300)" maxlength="300"></textArea> <br>
						备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em
						class="textarea-length c-red">0</em>个字。</TD>
				</tr>
			</table>
			</div>
	</c:if>
    <c:if test="${parole.auditType eq 'sfsReport' }">
			<input type="hidden" name="decideType" value="1" />
	</c:if>
</form>
     <div id="parolePunishmentForm"></div>
    <script>
    var result='';
	 $(function() {
		 var results =$('input[name="decideType"]');
		 for(var i=0;i<results.length;i++){
			 results[i].onclick=function(){
				 result=$('input[name="decideType"]:checked').val();
				 if(result=='2' || result=='3'){//退回
					 $('#optScoreLabel').html('');
					 $('#zfScoreLabel').html('');
					 $('#optScore').val('');
					 $('#zfScore').val('');
					 $('#jzksr').linkbutton({disabled:true});
					 $('#jzkzf').linkbutton({disabled:true});
					 $('#fzkzf').linkbutton({disabled:true}); 
				 }else{
					 $('#jzksr').linkbutton({disabled:false});
					 $('#jzkzf').linkbutton({disabled:false});
					 $('#fzkzf').linkbutton({disabled:false});
				 }
			 }
		 }
		 
		$('#parolePunishmentForm').form({
			url:'${ctx}/rewardspunishment/parole/submitParoleAudit',
			onSubmit:function(){
				 progressLoad();
				 var adtypemsg = '';
				 if(result!="2" && result!="3"){
					 if(adtype == 'jzkCheck' || adtype == 'sjzCheck'){
							if ($('#optScore').val() == '') {
								adtypemsg = "请对输入质量进行评分!";
							}
							else if ($('#zfScore').val() == '') {
								adtypemsg = "请对执法质量进行评分!";
							}
						}
						if(adtype == 'fzkCheck' || adtype == 'sfzCheck'){
							if ($('#zfScore').val() == '') {
								adtypemsg = "请对执法质量进行评分!";
							}
						}
						
						if (adtypemsg.length > 0) {
							progressClose();
							$.messager.show({
								title : '提示信息!',
								msg : adtypemsg
							});
							return false;
						}
					 
				 }
	            return true;
			},
			success:function(data){
				progressClose();
				data = JSON.parse(data);
				if(data.status==200){
					$.messager.show({
						title:'提示信息!' ,
						msg:data.msg
					});
					 parent.$.modalDialog.openner_dataGrid.datagrid('reload');
	                 parent.$.modalDialog.handler.dialog('close');
	                 $('#parolePunishmentForm').dialog('destroy');
				}else{
					 parent.$.messager.alert('错误', result.msg, 'error');
				}
				
			}
		});	
	})	
  //评分
    function rewardspunishment(type){
    		var url = '${ctx}/sys/mxCheck/assess?infoType='+ type +'&processInstanceId=${parole.processInstanceId}&tablename=parolePunishmentForm';
    		var title = "评定明细";
    		
    		if (type == 1 || type == 4) {
    			title = "输入质量" + title;
    		}
    		if (type == 2 || type == 3 || type == 5 || type == 6) {
    			title = "执法质量" + title;
    		}
    		
    		$('#parolePunishmentForm').dialog({    
    		    title: title,    
    		    width: 600,
    		    height: 520,
    		    href: url,    
    		    modal: true,
    		    resizable:true,
    		    maximizable:true,
    		    iconCls:'fi-clipboard-pencil icon-blue',
    		    buttons :[{
    				text:'确定',
    				iconCls:'fi-check icon-blue',
    				handler:function(){
    					$('#assessBtn1').click();
    				}
    			}, {
    				text:'关闭',
    				iconCls:'fi-x icon-blue',
    				handler:function(){
    					$('#assessBtn2').click();
    				}
    			}]
    		});
    		$('#parolePunishmentForm').window('center');
    	}
    //打分详细信息
    function mxcheckAudit(infotype){
		var url = '${ctx}/sys/mxCheck/list?infoType='+infotype+'&processInstanceId=${parole.processInstanceId}';
		$('#parolePunishmentForm').dialog({    
		    title: '评分详细',    
		    width: 800,
		    height: 650,
		    href: url,    
		    modal: true,
		    resizable:true,
	 	   maximizable:true,
	 	   iconCls:'fi-checkbox icon-blue',
	 	   buttons :[{
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){
					$('#parolePunishmentForm').dialog('close');
				}
			}]
		});
		$('#parolePunishmentForm').window('center');
	}
    $(function() {
		$('#paroleAuditForm').form({
				url : '${ctx}/rewardspunishment/parole/submitParoleAudit',
				onSubmit : function() {
					progressLoad();
					var isValid = $(this).form('validate');
					if (!isValid) {
						progressClose();
					}
					return isValid;
				},
				success : function(data) {
					data = JSON.parse(data);
					progressClose();
					if (data.status == 200) {
						$.messager.show({
							title : '提示信息!',
							msg : data.msg
						});

						parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
						parent.$.modalDialog.handler.dialog('close');
					} else {
						parent.$.messager.alert('错误',
								data.msg, 'error');
					}

				}
			});
	});
     /* 
     //初始化
    $(function(){
    	$("#procuratoratePath").powerWebUpload({ auto: true,fileSingleSizeLimit:10,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf'});
    	
    	$('#btn2').click(function(){
    		$('#check').dialog('close');
    	});
    	$('#result1').click(function(){
    		if($("#p1").length>0){
	    		$("#publicityAdd tr").eq(1).remove();
	    		$("#publicityAdd tr").eq(1).remove();
    		}
    	});
    	//县矫正科公式意见点击事件
    	$('#result').click(function(){
    		//alert('1111')
    		 if($("#p").length>0){
    			 
    		 }else{
    			 $("#publicityAdd tr").eq(0).after("<tr>"
    						+"<th>公示意见:</th>"
    						+"<td><input type='text' name='showDetail' multiline='true'"
    						+"class='easyui-textbox' required=true "
    						+"style='width:220px;height:80px;'"
    						+" value='' /></td>"
    						+"</tr >"
    						); 
    		 }
    		
    	});
    		
    });
	function check(){
		//$('#check').get(0).reset();
		//$("#check input[name='id']").attr("value","");
		//$('#myform').form('clear');
		$('#check').dialog('open');
	}
	function updated(){
		//$('#check').get(0).reset();
		//$("#check input[name='id']").attr("value","");
		//$('#myform').form('clear');
		$('#updated').dialog('open');
	}
	function back(){
		parent.location.reload();
			var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	}
	/**
	 *  提交公示流程表单方法
	 */
	 /*
	function applyPublicity(processInstanceId){
		//id="\'"+id+"\'" ;
		var str=$('#publicityForm').serialize();
			if($('#publicityForm').form('validate')){
				
				$.ajax({
					type: 'post' ,
					url: '${ctx}/rewardspunishment/parole/submitParoleAudit?processInstanceId='+processInstanceId,
					cache:false ,
					data:str ,
					dataType:'json' ,
					success:function(result){
						//1 关闭窗口
						$('#publicity').dialog('close');
						parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                        parent.$.modalDialog.handler.dialog('close');
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
	/*提交审核流程表单*/
	/*
	function applyCheck(processInstanceId){
		//id="\'"+id+"\'" ;
		var str=$('#checkForm').serialize();
			if($('#checkForm').form('validate')){
				$.ajax({
					type: 'post' ,
					url: '${ctx}/rewardspunishment/parole/submitParoleAudit?processInstanceId='+processInstanceId,
					cache:false ,
					data:str ,
					dataType:'json' ,
					success:function(result){
						//1 关闭窗口
						$('#check').dialog('close');
						 parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                         parent.$.modalDialog.handler.dialog('close');
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
	
	//提交报检查院流程表单
	
	function applyProcuratorate(processInstanceId,id){
		alert(processInstanceId);
		alert(id);
			if($('#procuratorateForm').form('validate')){
				
				$.ajax({
					type: 'post' ,
					url: '${ctx}/rewardspunishment/parole/submitParoleAudit?decideType=1&processInstanceId='+processInstanceId+'&id='+id,
					cache:false ,
					dataType:'json' ,
					success:function(result){
						//1 关闭窗口
						$('#procuratorate').dialog('close');
						parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                        parent.$.modalDialog.handler.dialog('close');;
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
	}*/
 	//提交修改表单
 	/* 
	$('#btn3').click(function(){
		var str=$('#updatedForm').serialize();
		$.ajax({
			type: 'post' ,
			url: '${ctx}/rewardspunishment/paroleController/save',
			cache:false ,
			data:str,
			dataType:'json' ,
			success:function(result){
				//1 关闭窗口
				$('#updated').dialog('close');
				location.reload();
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
	}) 
	//质量评分

function checkZhiLiang(){
	var obj=document.getElementsByName('zhiliang');
	var a=0;    
	 for(var i=0; i<obj.length; i++){    
	    if(obj[i].checked){
	    	a+=obj[i].value*$('#num'+i).val();
	    };  
	  }
	 var sum=10-a;
	 if(sum<=0){
		 sum=0;
	 }
	 if(typeof($("#handleQualityGoal").val())!="undefined"){
		 $("#handleQualityGoal").val(sum);
	 }else if(typeof($("#cityHandleQualityGoal").val())!="undefined"){
		 $("#cityHandleQualityGoal").val(sum);
	 }
	 $('#dd').dialog('close');
}

//执法评分

function checkZhiFa(){
	var obj=document.getElementsByName('zhifa');
	var a=0;    
	 for(var i=0; i<obj.length; i++){    
	    if(obj[i].checked){
	    	a+=obj[i].value*$('#zhifa'+i).val();
	    };  
	  }
	 var sum=10-a;
	 if(sum<=0){
		 sum=0;
	 }
	 if(typeof($("#actionQualityGoal").val())!="undefined"){
		 $("#actionQualityGoal").val(sum);
	 }else if(typeof($("#actionQualityGoalF").val())!="undefined"){
		 $("#actionQualityGoalF").val(sum);
	 }else if(typeof($("#cityJactionQualityGoal").val())!="undefined"){
		 $("#cityJactionQualityGoal").val(sum);
	 }else{
		 $("#cityFactionQualityGoal").val(sum);
	 }; 
	 $('#tt').dialog('close');
}   */
</script>


