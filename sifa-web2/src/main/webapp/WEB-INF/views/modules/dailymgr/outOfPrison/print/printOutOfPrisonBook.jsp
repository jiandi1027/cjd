<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	<div style="margin: 0 2px;padding: 0;font-family:FangSong_GB2312;">
		<div style="text-align:center;margin-top:10px;display:none;">
         		<a href="#" class="easyui-linkbutton" data-options="iconCls:'fi-arrow-up icon-blue'" id="submitOutOfPrisonDetailBtn" onclick="submitOutOfPrisonDetail('${outOfPrison.id}')">上报</a>
        		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" id="saveOutOfPrisonBookBtn" onclick="saveBook('${outOfPrison.id}')">保存</a>
		</div>
		<div style="text-align: center;font-family:FangSong_GB2312;font-size:19px;">
			<span style="color:red;">注：红色区域及下划线处可输入内容</span>
		</div>
		<form id="outOfPrisonbook">
			 <c:if test="${sysAccount.roleId eq 3003}">
	           <input type="hidden" name="decideType" type="text" value="4"/>
	     	</c:if>
	     	<c:if test="${sysAccount.roleId ne 3003}">
	            <input type="hidden" name="decideType" type="text" value="5"/>
	     	</c:if>
			<div style="font-family:FangSong_GB2312;font-size:19px;
				margin-top:40px;width:165mm;height: 200mm;border:0;margin-right:auto;margin-left: auto;">
			<div style="font-size:24px;margin-top:20px;text-align: center;font-weight: bold;">
				延长暂予监外执行建议书
			</div>
			<div 
				style="margin-top:20px; text-align:right;">
				${model.writNum}&nbsp;
			</div>
			<div 
				style="margin-top:3px;text-indent:28px;line-height:38px;">
				社区矫正人员：<b>${culprit.name }</b>,<b>${fns:getSysDicValueByKey('common_table','nation',culprit.nation,'')}</b>,<b><fmt:formatDate value="${culprit.birthday}" pattern="yyyy年MM月dd日" /></b>出生,
				 居住地：<b>${culprit.address }</b>,户籍地：<b>${culprit.regResidence }</b>。
				 因<b>${culprit.culpritJudgment.crimeInfo }</b>经<b>${culprit.culpritJudgment.adjudgeOrg }</b>于
				<b><fmt:formatDate value="${culprit.culpritJudgment.adjudgeDate }" pattern="yyyy年MM月dd日" /></b>
				以(<b>${culprit.culpritJudgment.adjudgeId }</b>)&nbsp;&nbsp;&nbsp;&nbsp;字第&nbsp;&nbsp;&nbsp;&nbsp;号
				刑事判决书判处<b>${fns:getSysDicValueByKey('sf_investigate','entrust_type_id',culprit.culpritJudgment.dicPenalTypeKey,'')}</b>
				,缓刑<b>${fns:getSysDicValueByKey('sf_culpritJudgment','dicCrimeTypeKey',culprit.culpritJudgment.dicCrimeTypeKey,'')}</b>
				,附加<b>${culprit.culpritJudgment.accessoryPunishment }</b>
				，刑期自<b><fmt:formatDate value="${culprit.culpritJudgment.adjudgeStartTime}" pattern="yyyy年MM月dd日" /></b>起至
				<b><fmt:formatDate value="${culprit.culpritJudgment.adjudgeEndTime}" pattern="yyyy年MM月dd日" /></b>止。
				<b><fmt:formatDate value="${outOfPrison.startDate}" pattern="yyyy年MM月dd日" /></b>
				由广西省监狱管理局决定暂予监外执行。在暂予监外执行期间，依法实行社区矫正。暂予监外执行期限自 
				<b><fmt:formatDate value="${outOfPrison.startDate}" pattern="yyyy年MM月dd日" /></b>起至<b><fmt:formatDate value="${outOfPrison.endDate}"
									pattern="yyyy年MM月dd日" /></b>止。
				现暂予监外执行期满，经委托<span><input class="easyui-validatebox" data-options="required:true" name="hospital" id="hospital" 
				value="${outOfPrison.hospital}" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:180px;font-size:19px;" /></span>
				医院进行医学司法鉴定，鉴定结果如下：
			</div>
			<div style="margin-top:3px;line-height:30px;padding:0;margin: 0;" >
				<textarea  name="identificationResults" class="easyui-validatebox"  multiline="true" data-options="required:true" 
				onkeydown='textarealength(this,350)' onkeyup='textarealength(this,400)' onMouseOut="textarealength(this,400)"  maxlength=400
				style="border:0 none;overflow:hidden;font-size:19px;text-align:left;width:620px;height:400px;font-family: FangSong_GB2312;">${outOfPrison.identificationResults}</textarea>
				<p class="textarea-numberbar" style="font-size:16px;">
							备注：此处最多可以输入<em class="c-red">400</em>个字，你已输入<em class="textarea-length c-red">${fn:length(outOfPrison.identificationResults)}</em>个字。
				</p>
			</div>
			<div
				style="font-size:19px;;margin-top:3px;text-indent:28px;line-height:30px;">
				 根据《罪犯保外就医疾病伤残范围》与广司〔2007〕216号《关于罪犯保外就医病残鉴定的适用意见》，建议延长社区矫正人员
				<span style="font-weight: bold;">${culprit.name}</span>暂予监外执行期限自<b><fmt:formatDate value="${outOfPrison.startDate}"
									pattern="yyyy年MM月dd日" /></b>起至<b><fmt:formatDate value="${outOfPrison.endDate}" pattern="yyyy年MM月dd日" /></b>止。 
			</div>
			<div 
				style="font-size:19px;margin-top:3px;text-indent:28px;line-height:30px;">
				此致
				<br />
				<span><input class="easyui-validatebox" type="text" data-options="required:true" name="court" id="court" value="${outOfPrison.court}" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:19px;font-family: FangSong_GB2312;" /></span>
			人民法院（公安局、监狱管理局）
			</div>
			
			<div style="font-size:19px;margin-top:30px;text-align:right;">
				<span><input class="easyui-numberbox" type="text" data-options="min:2017,required:true" value="${issueYear}" name="issueYear" id="outOfPrison_issueYear" style="width:60px;font-size:19px;text-align:center;font-family: FangSong_GB2312;" /></span>
				年
				<span><input class="easyui-numberbox" type="text" data-options="min:01,max:12,required:true,formatter:function(value){if(value<=9 && value>0){return '0'+value}else{return value}}" value="${issueMonth}" name="issueMonth" id="outOfPrison_issueMonth" 
				style="width:60px;font-size:19px;text-align:center;font-family: FangSong_GB2312;" /></span>
				月
				<span><input class="easyui-numberbox" type="text" data-options="min:01,max:31,required:true,formatter:function(value){if(value<=9 && value>0){return '0'+value}else{return value}}" value="${issueDay}" name="issueDay" id="outOfPrison_issueDay" 
				style="width:60px;font-size:19px;text-align:center;font-family: FangSong_GB2312;" /></span>
				日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div 
				style="font-size:19px;margin-top:30px;line-height:30px;">
				抄送：
				<span><input name="procuratorate" id="outOfPrison_procuratorate" value="${outOfPrison.procuratorate}" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:19px;font-family: FangSong_GB2312;" /></span>
			人民检察院，
				<span><input name="police" id="outOfPrison_police" value="${outOfPrison.police}" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px solid #ff0000;width:60px;font-size:18px;" /></span>
			公安（分）局。
			</div>
		</div>
		</form>
	</div>
	
<script type="text/javascript">
$(function() {
	
});

	//上报
 function submitOutOfPrisonDetail(id){
	 if($('#outOfPrisonbook').form('validate')){
			$.ajax({
		 		type : 'post',
		 		 url : "${ctx}/dailymgr/outOfPrison/submitOutOfPrison?id="+id,
		 		cache : false,
		 		async : false, //同步请求
		 		dataType : 'json',
		 		data:$.serializeObject($('#outOfPrisonbook')) ,
		 		success : function(result) {
		 			if(result.status==200){
		 				$('#saveOutOfPrisonWithSubmit').dialog('close');
		                parent.$.modalDialog.handler.dialog('close');
		                $('#d_outOfParole_list_content').datagrid('reload');
		                $.messager.show({
		 					title:'提示信息!' ,
		 					msg:result.msg
		 				});
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
  
//修改保存建议书
	function saveBook(id){
		if($('#outOfPrisonbook').form('validate')){
			 $.ajax({
		 		type : 'post',
		 		 url : "${ctx}/dailymgr/outOfPrison/saveBook?id="+id,
		 		cache : false,
		 		async : false, //同步请求
		 		dataType : 'json',
		 		data:$('#outOfPrisonbook').serialize(),
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
