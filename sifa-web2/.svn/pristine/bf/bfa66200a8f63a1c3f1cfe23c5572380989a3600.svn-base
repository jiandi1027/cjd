<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	<div style="margin: 0 2px;padding: 0;font-family:FangSong_GB2312;">
		<div style="display:none">
         		<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-arrow-up icon-blue'" id="putProbation" onclick="submitProbationDetail('${revokeProbation.id}')">上报</a>
         		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" id="saveBookBtn" onclick="saveBook('${revokeProbation.id}')">保存</a>
		</div>
		<div style="text-align: center;font-family:FangSong_GB2312;font-size:19px;">
			<span style="color:red;">注：红色区域及下划线处可输入内容</span>
		</div>
		<form id="revokeProbationBook">
			<c:if test="${sysAccount.roleId eq 3003}"><!-- 此处控制是司法所上报还是矫正科上报 -->
	           <input type="hidden" name="decideType"  value="4"/>
	     	</c:if>
	     	<c:if test="${sysAccount.roleId ne 3003}">
	            <input type="hidden" name="decideType" value="5"/>
	     	</c:if>
		<div  style="font-family:FangSong_GB2312;font-size:19px;
		margin-top:40px;width:165mm;height: 200mm;border:0;margin-right:auto;margin-left: auto;">
			<div style="font-size:30px;margin-top:20px;text-align: center;font-weight: bold;">
				撤销缓刑建议书
			</div>
			<div><input type="text" style="display:none;" id="revokeProbationId1" value="${revokeProbation.id}" /></div>
			<div class="textp"
				style="font-size:19px;margin-top:20px; text-align:right;">
				${model.writNum}&nbsp;
			</div>
			<div style="margin-top:3px;text-indent:28px;line-height:30px;padding:0;margin: 0;">
				社区矫正人员：${culprit.name },${fns:getSysDicValueByKey('common_table','nation',culprit.nation,'')},<fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" />出生,
				 居住地：${culprit.address },
				户籍地：${culprit.regResidence }。
				 因${culprit.culpritJudgment.crimeInfo }经
				${culprit.culpritJudgment.adjudgeOrg }于
				<fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate }" pattern="yyyy年MM月dd日" /> 
				以(${culprit.culpritJudgment.adjudgeId })&nbsp;&nbsp;&nbsp;&nbsp;字第&nbsp;&nbsp;&nbsp;&nbsp;号
				刑事判决书判处
				${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',culprit.culpritJudgment.dicPenalTypeKey,'')}
				,缓刑${fns:getSysDicValueByKey('sf_culpritJudgment','dicCrimeTypeKey',culprit.culpritJudgment.dicCrimeTypeKey,'')}
				,附加${culprit.culpritJudgment.accessoryPunishment }。
				在缓刑考验期间依法实行社区矫正，社区矫正期限自
				<fmt:formatDate value="${culprit.culpritJudgment.redressStartDate}"
									pattern="yyyy年MM月dd日" />
				起至
				<fmt:formatDate value="${culprit.culpritJudgment.redressEndDate}"
									pattern="yyyy年MM月dd日"/>止。
			</div>
			<div style="text-indent:28px;line-height:30px;padding:0;margin: 0;">
				该社区服刑人员有违反法律（行政法规、社区矫正监督管理规定、人民法院禁止令）的行为，具体事实如下：
			</div>
			<div style="margin-top:3px;line-height:30px;padding:0;margin: 0;" >
				<textarea  name="concreteFacts" class="easyui-validatebox"  multiline="true" data-options="required:true" id="concreteFacts" 
				onkeydown='textarealength(this,350)' onkeyup='textarealength(this,350)' onMouseOut="textarealength(this,350)"  maxlength=350
				style="border:0 none;overflow:hidden;font-size:19px;text-align:left;width:620px;height:400px;font-family: FangSong_GB2312;">${revokeProbation.concreteFacts}</textarea>
				<p class="textarea-numberbar" style="font-size:16px;">
							备注：此处最多可以输入<em class="c-red">350</em>个字，你已输入<em class="textarea-length c-red">${fn:length(revokeProbation.concreteFacts)}</em>个字。
				</p>
			</div>
			<div style="margin-top:3px;text-indent:28px;line-height:30px;padding:0;">
				根据《中华人民共和国刑法》第七十七条、《社区矫正实施办法》第二十五条、《广西壮族自治区社区矫正实施细则（试行）》第八十七条之规定，建议对社区矫正人员${culprit.name}撤销缓刑。
			</div>
			<div style="text-indent:28px;line-height:30px;padding:0;margin: 0;">此致</div>
			<div style="text-indent:28px;line-height:30px;padding:0;margin: 0;">
				<input name="court" class="easyui-validatebox" data-options="required:true" value="${revokeProbation.court}" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;text-align:left;font-size:19px;font-family: FangSong_GB2312;" />
			中级人民法院
			</div>

			<div  id="oldTime" style="margin-top:30px;text-align:right;padding:0;">
				<input class="easyui-numberbox" data-options="min:2017,required:true"  value="${issueYear}" name="issueYear" id="probation_issueYear" style="text-align:center;width:60px;" />
				年
				<input class="easyui-numberbox" data-options="min:01,max:12,required:true,formatter:function(value){if(value<=9 && value>0){return '0'+value}else{return value}}" value="${issueMonth}" name="issueMonth" id="probation_issueMonth" style="text-align:center;width:60px;" />
				月
				<input class="easyui-numberbox" data-options="min:01,max:31,required:true,formatter:function(value){if(value<=9 && value>0){return '0'+value}else{return value}}" value="${issueDay}" name="issueDay" id="probation_issueDay" style="text-align:center;width:60px;" />
				日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div style="line-height:30px;padding:0;margin: 0;">
				抄送：
				<span><input name="procuratorate"  value="${revokeProbation.procuratorate}" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;text-align:center;font-size:19px;font-family: FangSong_GB2312;" /></span>
			人民检察院，
				<span><input name="police"  value="${revokeProbation.police}" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;text-align:center;font-size:19px;font-family: FangSong_GB2312;" /></span>
			公安（分）局。
			</div>
		</div>
		</form>
	</div>
<script type="text/javascript">
//上报
function submitProbationDetail(id){
	 if($('#revokeProbationBook').form('validate')){
		 $.ajax({
	 		type : 'post',
	 		 url : "${ctx}/rewardspunishment/revokeProbation/submitRevokeProbation?id="+id,
	 		cache : false,
	 		async : false, //同步请求
	 		dataType : 'json',
	 		data:$('#revokeProbationBook').serialize(),
	 		success : function(result) {
	 			if(result.status==200){
	 				$('#saveWithSubmitDialog').dialog('close');
	                parent.$.modalDialog.handler.dialog('close'); 
	                $('#t_probation_list_content').datagrid('reload');
	                $.messager.show({title:'提示信息!' ,msg:result.msg});
	 			}else{
	 				alert("上报失败！");
	 			}
	 			
	 		}
	 	});
	 }
}

//修改保存建议书
function saveBook(id){
	if($('#revokeProbationBook').form('validate')){
		 $.ajax({
	 		type : 'post',
	 		 url : "${ctx}/rewardspunishment/revokeProbation/saveBook?id="+id,
	 		cache : false,
	 		async : false, //同步请求
	 		dataType : 'json',
	 		data:$('#revokeProbationBook').serialize(),
	 		success : function(result) {
	 			if(result.status==200){
	 				 $.messager.show({
	 					title:'提示信息!' ,
	 					msg:result.msg
	 				});
	 				$('#printBianJi').dialog('close');
	 			}else{
	 				 $.messager.show({
	 					title:'提示信息!' ,
	 					msg:result.msg
	 				});
	 			}
	 			
	 		}
	 	});
	 }
}

  </script>
