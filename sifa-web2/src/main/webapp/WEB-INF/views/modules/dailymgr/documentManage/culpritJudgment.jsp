<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
 <form  action="${ctx}/culpritinfo/culpritComplicity/save" method="post" id="culpritJudgmentDoc">
	<input type="hidden" value="${culprit.id }" name="id"/>
     <div class="easyui-panel" title="刑罚执行信息" style="width:100%;padding:5px;">
            <table width="100%" class="grid">
            	<tr>
            		<th width="10%">姓名：</th>
            		<td width="23%">${culprit.name }</td>
            		<th width="10%">原羁押场所：</th>
					<td width="23%"><input type="text" name="detainPlace" id="detainPlace" value="${ culpritJudgment.detainPlace}"
								class="easyui-textbox" />
					</td>
					<th width="10%">交付执行日期：</th>
					<td width="23%">
						<input type="text" name="turnOver" id="turnOver" value="<fmt:formatDate value='${ culpritJudgment.turnOver}' pattern='yyyy-MM-dd'/>"
								class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" />
					</td>
            	</tr>
            	<tr>
            		<th width="10%">剥夺政治权利期限（月）：</th>
					<td><input  name="deprivePolitical" id="deprivePolitical" value="${ culpritJudgment.deprivePolitical}"
								class="easyui-numberbox"  data-options="min:1,max:1000"/>
					</td>
					<th>剥权开始日期：</th>
					<td>
						<input type="text" name="deprivePoliticalStartDate" id="deprivePoliticalStartDate1" value="<fmt:formatDate value='${ culpritJudgment.deprivePoliticalStartDate}' pattern='yyyy-MM-dd'/>"
								class="Wdate easyui-validatebox" onfocus="var deprivePoliticalEndDate1=$dp.$('deprivePoliticalEndDate1');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'deprivePoliticalEndDate1\')}'})" />
					</td>
					<th>剥权结束日期：</th>
					<td>
						<input type="text" name="deprivePoliticalEndDate" id="deprivePoliticalEndDate1" value="<fmt:formatDate value='${ culpritJudgment.deprivePoliticalEndDate}' pattern='yyyy-MM-dd'/>"
								class="Wdate easyui-validatebox" onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'deprivePoliticalStartDate1\')}'})" />
					</td>
            	</tr>
            	<tr>
            		<th width="10%">接受公安机关：</th>
					<td><input type="text" name="reciveSecurityOrg" id="reciveSecurityOrg" value="${ culpritJudgment.reciveSecurityOrg}"
								class="easyui-textbox" />
					</td>
					<th width="10%">接受人：</th>
					<td><input type="text" name="reciveSecurityPerson" id="reciveSecurityPerson" value="${ culpritJudgment.reciveSecurityPerson}"
								class="easyui-textbox" />
					</td>
					<th>移交日期：</th>
					<td>
						<input type="text" name="transferDate" id="transferDate" value="<fmt:formatDate value='${ culpritJudgment.transferDate}' pattern='yyyy-MM-dd'/>"
								class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" />
					</td>
            	</tr>
            	<tr>
            		<th width="10%">矫正期限（月）：</th>
					<td><input type="text" name="redressPeriod" id="redressPeriod" value="${ culpritJudgment.redressPeriod}"
								class="easyui-numberbox"  data-options="min:1,max:1000"/>
					</td>
					<th>是否累惯犯：</th>
	 				<td>
			 			<c:if test="${culpritJudgment.dicOldLagKey ne 0 }">
			 				<input id="dicOldLagKey0" type="radio" name="dicOldLagKey" value="0"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicOldLagKey1" type="radio" name="dicOldLagKey" value="1"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
			 			<c:if test="${culpritJudgment.dicOldLagKey eq 0 }">
			 				<input id="dicOldLagKey0"  type="radio" name="dicOldLagKey" value="0"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicOldLagKey1"  type="radio" name="dicOldLagKey" value="1" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
	 				</td>
	 				<th>是否实行信息化管理：</th>
	 				<td>
			 			<c:if test="${culpritJudgment.dicIsInfManageKey ne 0 }">
			 				<input id="dicIsInfManageKey0" type="radio" name="dicIsInfManageKey" value="0"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicIsInfManageKey1" type="radio" name="dicIsInfManageKey" value="1"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
			 			<c:if test="${culpritJudgment.dicIsInfManageKey eq 0 }">
			 				<input id="dicIsInfManageKey0"  type="radio" name="dicIsInfManageKey" value="0"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicIsInfManageKey1"  type="radio" name="dicIsInfManageKey" value="1" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
	 				</td>
            	</tr>
            	<tr>
            		<th>是否被宣告禁止令：</th>
	 				<td>
			 			<c:if test="${culpritJudgment. dicIsBanKey ne 0 }">
			 				<input id="dicIsBanKey0" type="radio" name="dicIsBanKey" value="0"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicIsBanKey1" type="radio" name="dicIsBanKey" value="1"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
			 			<c:if test="${culpritJudgment. dicIsBanKey eq 0 }">
			 				<input id="dicIsBanKey0"  type="radio" name="dicIsBanKey" value="0"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicIsBanKey1"  type="radio" name="dicIsBanKey" value="1" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
	 				</td>
	 				<th>禁止开始日期：</th>
					<td>
						<input type="text" name="startBan" id="startBan" value="<fmt:formatDate value='${ culpritJudgment.startBan}' pattern='yyyy-MM-dd'/>"
								class="Wdate easyui-validatebox" onfocus="var endBan=$dp.$('endBan');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endBan\')}'})" />
					</td>
					<th>禁止结束日期：</th>
					<td>
						<input type="text" name="endBan" id="endBan" value="<fmt:formatDate value='${ culpritJudgment.endBan}' pattern='yyyy-MM-dd'/>"
								class="Wdate easyui-validatebox" onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startBan\')}'})" />
					</td>
            	</tr>
            	<tr>
            		<th width="10%">禁止期限（月）：</th>
					<td><input type="text" name="timeBan" id="timeBan" value="${ culpritJudgment.timeBan}"
								class="easyui-numberbox"  data-options="min:1,max:1000"/>
					</td>
					<th width="10%">刑期变动：</th>
					<td colspan="3"><input type="text" name="adjudgeChange" id="adjudgeChange" value="${ culpritJudgment.adjudgeChange}"
								class="easyui-textbox" />
					</td>
            	</tr>
            	<tr rowspan="5">
                    <th>禁止内容：</th>
                    <td colspan="5">
    					<textarea  name="contentBan" id="contentBan" class="easyui-validatebox"  multiline=true 
							onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)' 
							style="width:800px;height:80px;overflow:hidden;" maxlength=200>${culpritJudgment.contentBan}</textarea>
							<br/>
							<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
							</p>
    				</td>
                </tr>
                <tr>
                	<th>是否发放定位手机：</th>
	 				<td>
			 			<c:if test="${culpritJudgment.dicHaveMobileKey ne 0 }">
			 				<input id="dicHaveMobileKey0" type="radio" name="dicHaveMobileKey" value="0"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicHaveMobileKey1" type="radio" name="dicHaveMobileKey" value="1"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
			 			<c:if test="${culpritJudgment.dicHaveMobileKey eq 0 }">
			 				<input id="dicHaveMobileKey0"  type="radio" name="dicHaveMobileKey" value="0"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicHaveMobileKey1"  type="radio" name="dicHaveMobileKey" value="1" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
	 				</td>
	 				<th>是否建立矫正小组：</th>
	 				<td  colspan="3">
			 			<c:if test="${culpritJudgment.dicMemeberKey ne 0 }">
			 				<input id="dicMemeberKey0" type="radio" name="dicMemeberKey" value="0"  style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicMemeberKey1" type="radio" name="dicMemeberKey" value="1"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
			 			<c:if test="${culpritJudgment.dicMemeberKey eq 0 }">
			 				<input id="dicMemeberKey0"  type="radio" name="dicMemeberKey" value="0"  checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
			 				<input id="dicMemeberKey1"  type="radio" name="dicMemeberKey" value="1" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
			 			</c:if>
	 				</td>
                </tr>
                <tr>
                	<th>是否三涉：</th>
                	<td colspan="5">
                		<input type="checkbox" name="dicTreeKey" value="71001" id="dicTreeKey1" 
                		onclick="$('#dicTreeKey2').removeAttr('checked');$('#dicTreeKey3').removeAttr('checked');$('#dicTreeKey4').removeAttr('checked'); "/>否&nbsp;&nbsp;
                		<input type="checkbox" name="dicTreeKey" value="71002" id="dicTreeKey2"
                		onclick="$('#dicTreeKey1').removeAttr('checked');"/>涉毒&nbsp;&nbsp;
                		<input type="checkbox" name="dicTreeKey" value="71003" id="dicTreeKey3"
                		onclick="$('#dicTreeKey1').removeAttr('checked');"/>涉黑&nbsp;&nbsp;
                		<input type="checkbox" name="dicTreeKey" value="71004" id="dicTreeKey4"
                		onclick="$('#dicTreeKey1').removeAttr('checked');"/>涉枪&nbsp;&nbsp;
                	</td>
                </tr>
                <tr>
                	<th>是否四史：</th>
                	<td colspan="5">
                		<input type="checkbox" name="dicFourKey" value="69001" id="dicFourKey1"
                		onclick="$('#dicFourKey2').removeAttr('checked');$('#dicFourKey3').removeAttr('checked');$('#dicFourKey4').removeAttr('checked');$('#dicFourKey5').removeAttr('checked'); "/>否&nbsp;&nbsp;
                		<input type="checkbox" name="dicFourKey" value="69002" id="dicFourKey2"
                		onclick="$('#dicFourKey1').removeAttr('checked');"/>吸毒史&nbsp;&nbsp;
                		<input type="checkbox" name="dicFourKey" value="69003" id="dicFourKey3"
                		onclick="$('#dicFourKey1').removeAttr('checked');"/>逃脱史&nbsp;&nbsp;
                		<input type="checkbox" name="dicFourKey" value="69004" id="dicFourKey4"
                		onclick="$('#dicFourKey1').removeAttr('checked');"/>自杀史&nbsp;&nbsp;
                		<input type="checkbox" name="dicFourKey" value="69005" id="dicFourKey5"
                		onclick="$('#dicFourKey1').removeAttr('checked');"/>袭警史&nbsp;&nbsp;
                		
                	</td>
                </tr>
                 <tr>
                	<th>附加刑：</th>
                	<td colspan="5">
                		<input type="checkbox" name="accessoryPunishment" value="68001" id="accessoryPunishment1"
                		onclick="$('#accessoryPunishment2').removeAttr('checked');$('#accessoryPunishment3').removeAttr('checked');$('#accessoryPunishment4').removeAttr('checked');$('#accessoryPunishment5').removeAttr('checked'); "/>无&nbsp;&nbsp;
                		<input type="checkbox" name="accessoryPunishment" value="68002" id="accessoryPunishment2"
                		onclick="$('#accessoryPunishment1').removeAttr('checked');"/>罚金&nbsp;&nbsp;
                		<input type="checkbox" name="accessoryPunishment" value="68003" id="accessoryPunishment3"
                		onclick="$('#accessoryPunishment1').removeAttr('checked');"/>剥夺政治权利&nbsp;&nbsp;
                		<input type="checkbox" name="accessoryPunishment" value="68004" id="accessoryPunishment4"
                		onclick="$('#accessoryPunishment1').removeAttr('checked');"/>没收财产&nbsp;&nbsp;
                		<input type="checkbox" name="accessoryPunishment" value="68005" id="accessoryPunishment5"
                		onclick="$('#accessoryPunishment1').removeAttr('checked');"/>驱逐出境&nbsp;&nbsp;
                	</td>
                </tr>
                <tr>
                	<th width="10%">具体罚金金额：</th>
					<td><input type="text" name="forfeit" id="forfeit" value="${culpritJudgment.forfeit}"
								class="easyui-numberbox" data-options="min:0,precision:2,prefix:'￥'" />
					</td>
					<th width="10%">剥权期限（月）：</th>
					<td><input type="text" name="disentitle" id="disentitle" value="${ culpritJudgment.disentitle}"
								class="easyui-numberbox" data-options="min:1,max:1000"/>
					</td>
					<th width="10%">没收财产：</th>
					<td><input type="text" name="expropriation" id="expropriation" value="${ culpritJudgment.expropriation}"
								class="easyui-textbox" />
					</td>
                </tr>          
            </table>
    </div>
     <div class="easyui-panel" title="本次犯罪前的违法犯罪记录及结果" style="width:100%;padding:5px;">
     	<table width="100%" class="grid">
     		<tr>
     			<th width="10%">侦察机关名称：</th>
				<td width="23%"><input type="text" name="investigateOrg" id="investigateOrg" value="${ culpritLaw.investigateOrg}"
								class="easyui-textbox" />
				</td>
				<th width="10%">拘留日期：</th>
					<td width="23%">
						<input type="text" name="detainDate" id="detainDate" value="<fmt:formatDate value='${ culpritLaw.detainDate}' pattern='yyyy-MM-dd'/>"
								class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" />
				</td>
				<th width="10%">立案日期：</th>
					<td width="23%">
						<input type="text" name="registerDate" id="registerDate" value="<fmt:formatDate value='${ culpritLaw.registerDate}' pattern='yyyy-MM-dd'/>"
								class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" />
				</td>
     		</tr>
     		<tr>
     			<th width="10%">决定/批准逮捕机关：</th>
				<td><input type="text" name="arrestOrg" id="arrestOrg" value="${ culpritLaw.arrestOrg}"
								class="easyui-textbox" />
				</td>
				<th>逮捕日期：</th>
					<td>
						<input type="text" name="arrestDate" id="arrestDate" value="<fmt:formatDate value='${ culpritLaw.arrestDate}' pattern='yyyy-MM-dd'/>"
								class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" />
				</td>
				<th>侦结日期：</th>
					<td>
						<input type="text" name="investOverDate" id="investOverDate" value="<fmt:formatDate value='${ culpritLaw.investOverDate}' pattern='yyyy-MM-dd'/>"
								class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" />
				</td>
     		</tr>
     		<tr>
     			<th width="10%">检查机关（自诉人）：</th>
				<td><input type="text" name="checkOrg" id="checkOrg" value="${ culpritLaw.checkOrg}"
								class="easyui-textbox" />
				</td>
				<th>起诉书编号：</th>
					<td>
						<input type="text" name="indictmentNum" id="indictmentNum" value="${ culpritLaw.indictmentNum}"
								class="easyui-textbox" />
				</td>
				<th>提起诉讼日期：</th>
					<td>
						<input type="text" name="indictmentDate" id="indictmentDate" value="<fmt:formatDate value='${ culpritLaw.indictmentDate}' pattern='yyyy-MM-dd'/>"
								class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" />
				</td>
     		</tr>
     		<tr rowspan="5">
                  <th>行政处罚：</th>
                  <td colspan="5">
   					<textarea  name="oldAdministrationRecord" id="oldAdministrationRecord" class="easyui-validatebox"  multiline="true" 
						onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)' 
						style="width:800px;height:80px;overflow:hidden;" maxlength=200>${culpritLaw.oldAdministrationRecord}</textarea>
						<br/>
						<p class="textarea-numberbar">
							备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
						</p>
   				</td>
            </tr>
            <tr rowspan="5">
                    <th>刑事处罚：</th>
							<td colspan="5">
								<textarea  name="oldPenalRecord" id="oldPenalRecord" class="easyui-validatebox"  multiline="true" 
									onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)' 
									style="width:800px;height:80px;overflow:hidden;" maxlength=200>${culpritLaw.oldPenalRecord}</textarea>
									<br/>
									<p class="textarea-numberbar">
										备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
									</p>
						</td>
            </tr>
            <tr>
	            <td align="center" colspan="6">
	            	<a  href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" data-options="iconCls:'icon-save'" >保存</a>
	            </td>
            </tr>  
     	</table>
     </div>
    </form>
    <script>
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
        	 $('#culpritJudgmentDoc').form('submit');
        }
        $(function() {
        	var tree='${culpritJudgment.dicTreeKey}';
        	var treeList=tree.split(",");
        	for(var i=0;i<treeList.length;i++){
        		for(var j=1;j<5;j++){
        		if($('#dicTreeKey'+[j]).val()==treeList[i]){
        			$('#dicTreeKey'+[j]).attr("checked","checked");
        		}
        		}
        	}
        	var four='${culpritJudgment.dicFourKey}';
        	var fourList=four.split(",");
        	for(var i=0;i<fourList.length;i++){
        		for(var j=1;j<6;j++){
        		if($('#dicFourKey'+[j]).val()==fourList[i]){
        			$('#dicFourKey'+[j]).attr("checked","checked");
        		}
        		}
        	}
        	var accessory='${culpritJudgment.accessoryPunishment}';
        	var accessoryList=accessory.split(",");
        	for(var i=0;i<accessoryList.length;i++){
        		for(var j=1;j<6;j++){
        		if($('#accessoryPunishment'+[j]).val()==accessoryList[i]){
        			$('#accessoryPunishment'+[j]).attr("checked","checked");
        		}
        		}
        	}

        	
         
        });
        
        
      //表单提交
    	$('#culpritJudgmentDoc').form({
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
    			}else{
    				alert(data.msg);
    			}
    			
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
