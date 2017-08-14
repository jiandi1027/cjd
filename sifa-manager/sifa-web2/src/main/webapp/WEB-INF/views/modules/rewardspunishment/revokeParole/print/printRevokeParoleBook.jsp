<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	<div>
		<div style="display:none">
         		<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-arrow-up icon-blue'" id="submitParoleDetail" onclick="submitParoleDetail('${revokeParole.id}')">上报</a>
         		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" id="saveParoleBook" onclick="saveBook('${revokeParole.id}')">保存</a>	
		</div>
		<div style="text-align: center;font-family:FangSong_GB2312;font-size:19px;">
			<span style="color:red;">注：红色区域及下划线处可输入内容</span>
		</div>
		<form id="revokeParoleBook">
			<c:if test="${sysAccount.roleId eq 3003}">
	           <input type="hidden" name="decideType" type="text" value="4"/>
	     	</c:if>
	     	<c:if test="${sysAccount.roleId ne 3003}">
	            <input type="hidden" name="decideType" type="text" value="5"/>
	     	</c:if>
		<div style="font-family:FangSong_GB2312;font-size:19px;
		margin-top:40px;width:165mm;height: 200mm;border:0;margin-right:auto;margin-left: auto;">
			<div class="title" style="font-size:30px;margin-top:20px;text-align: center;">
				撤销假释建议书
			</div>
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
			<div
				style="font-size:19px;;margin-top:3px;text-indent:28px;line-height:30px;">
				该社区矫正人员有违反法律（行政法规、社区矫正监督管理规定、人民法院禁止令）的行为，具体事实如下：
			</div>
			<div style="margin-top:3px;line-height:30px;padding:0;margin: 0;" >
				<textarea  name="concreteFacts" class="easyui-validatebox"  multiline="true" data-options="required:true" id="concreteFacts"
				onkeydown='textarealength(this,300)' onkeyup='textarealength(this,300)' onMouseOut="textarealength(this,300)"  maxlength=300
				style="border:0 none;overflow:hidden;font-size:19px;text-align:left;width:620px;height:300px;font-family: FangSong_GB2312;">${revokeParole.concreteFacts}</textarea>
				<p class="textarea-numberbar" style="font-size:16px;">
							备注：此处最多可以输入<em class="c-red">300</em>个字，你已输入<em class="textarea-length c-red">${fn:length(revokeParole.concreteFacts)}</em>个字。
				</p>
			</div>
			<div style="font-size:19px;;margin-top:3px;text-indent:28px;line-height:30px;">
				根据《中华人民共和国刑法》第七十七条、《社区矫正实施办法》第二十五条、《广西壮族自治区社区矫正实施细则（试行）》第八十七条之规定，建议对社区矫正人员
				<span>${culprit.name}</span>撤销假释。
			</div>
			<div style="text-indent:28px;line-height:30px;padding:0;margin: 0;">此致</div>
			<div style="text-indent:28px;line-height:30px;padding:0;margin: 0;">
				<input name="court" class="easyui-validatebox" data-options="required:true" value="${revokeParole.court}" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;text-align:left;font-size:19px;font-family: FangSong_GB2312;" />
			中级人民法院
			</div>

			<div style="font-size:19px;margin-top:30px;text-align:right;">
				<span ><input class="easyui-numberbox" type="text" data-options="required:true,min:2017"  value="${issueYear}" name="issueYear"  style="text-align:center;width:60px;font-size:19px;font-family: FangSong_GB2312;" /></span>
				年
				<span ><input class="easyui-numberbox" type="text" data-options="required:true,min:1,max:12,formatter:function(value){if(value.length==1){return '0'+value}else{return value}}" value="${issueMonth}" name="issueMonth"  style="text-align:center;width:60px;font-size:19px;font-family: FangSong_GB2312;" /></span>
				月
				<span ><input class="easyui-numberbox" type="text" data-options="required:true,min:1,max:31,formatter:function(value){if(value.length==1){return '0'+value}else{return value}}" value="${issueDay}" name="issueDay"  style="text-align:center;width:60px;font-size:19px;font-family: FangSong_GB2312;" /></span>
				日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div style="font-size:19px;margin-top:30px;line-height:30px;">
				抄送：
				<span class="bold"><input name="procuratorate"  value="${revokeParole.procuratorate}" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:19px;font-family: FangSong_GB2312;" /></span>
			人民检察院，
				<span class="bold"><input name="police"  value="${revokeParole.police}" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:19px;font-family: FangSong_GB2312;" /></span>
			公安（分）局。
			</div>
		</div>
	</form>
</div>	

<script type="text/javascript">

//上报
 function submitParoleDetail(id){
	 if($('#revokeParoleBook').form('validate')){
		 $.ajax({
	 		type : 'post',
	 		 url : "${ctx}/rewardspunishment/revokeParole/submitRevokeParole?id="+id,
	 		cache : false,
	 		async : false, //同步请求
	 		dataType : 'json',
	 		data:$('#revokeParoleBook').serialize(),
	 		success : function(result) {
	 			if(result.status==200){
	 				$('#saveWithSubmit_parole').dialog('close');
	                 parent.$.modalDialog.handler.dialog('close');
	                 $('#t_parole_list_content').datagrid('reload');
	 			}else{
	 				alert("上报失败！");
	 			}
	 			
	 		}
	 	});
	 }
 }
  
	//修改保存建议书
	function saveBook(id){
		if($('#revokeParoleBook').form('validate')){
			 $.ajax({
		 		type : 'post',
		 		 url : "${ctx}/rewardspunishment/revokeParole/saveBook?id="+id,
		 		cache : false,
		 		async : false, //同步请求
		 		dataType : 'json',
		 		data:$('#revokeParoleBook').serialize(),
		 		success : function(result) {
		 			if(result.status==200){
		 				 $.messager.show({
		 					title:'提示信息!' ,
		 					msg:result.msg
		 				});
		 				$('#printJiashi').dialog('close');
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

