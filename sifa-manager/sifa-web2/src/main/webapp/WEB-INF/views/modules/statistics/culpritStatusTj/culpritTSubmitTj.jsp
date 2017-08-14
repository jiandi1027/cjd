<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript">
	$(function(){
		$('#culpritStatusContent').form({
       		url:'${ctx}/statistics/culpritStatusTj/submit',
       		onSubmit:function(){
       			 progressLoad();
       			 /* var isValid = $(this).form('validate');
                    if (!isValid) {
                        progressClose();
                    }
                    return isValid;  */
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
       			}else{
       				 parent.$.messager.alert('错误', data.msg, 'error');
       			}
       			
       		}
       	});	
});
	
	var workTjId='';
	//退回操作
	function returnTj(id){
		workId=id;
		$('#returnTjForm').form('clear');
		$('#returnTjDialog').dialog('open');
	}
	
	
	function returnTjSave(){
		var isValid = $('#returnTjForm').form('validate');
        if (!isValid) {
        	return false; 
        }
        var returnReason=$('#returnTjReason').val();
		$.messager.confirm('提示信息', '确认退回?', function(r) {
			if (r) {
				$.ajax({
					type : 'post',
					url : '${ctx}/statistics/culpritStatusTj/returnTj?id='+workId,
					cache : false,
					async : false, //同步请求
					data:{'returnReason':returnReason},
					dataType : 'json',
					success : function(result) {
						if(result.status==200){
							$.messager.show({
								title : '提示信息!',
								msg : result.msg
							});
						}	
					}
				}); 
				$('#returnTjDialog').dialog('close');
				 $(deleteTjTd).parent().remove();  
			} else {
				return;
			}
		});
	}
	
	var deleteTjTd='';
	function getClear(k){//删除td
		deleteTjTd=k;
	}
	
	
	function  returnTjClose(){
		$('#returnTjDialog').dialog('close');
		workTjId='';
		deleteTjTd='';
		$('#returnTjForm').form('clear');
	}

</script>
<style>
.table td{
	border-right:1px solid;border-bottom:1px solid;
}
</style>
<div style="margin:0 2px;padding:0;font-size:16px;font-family:Arial, Helvetica, sans-serif;">
<form  action="${ctx}/statistics/culpritStatusTj/submit" method="post" id="culpritStatusContent">
 <input type="hidden" name="id" id="id" value="${culpritStatusTj.id}"/>
	<div style="text-align:center;margin-top:10px;">
		<div style="font-size:28px;font-weight:bold;text-align:center">
			社区矫正人员情况统计表（<fmt:formatDate value="${culpritStatusTj.reportDate}"
										pattern="yyyy年MM月" />）（试行）
		</div>
	<table style="width:80%;margin:5px auto;" border=0 cellspacing=0 cellpadding=0>
	<tr style="font-size:20px;font-weight:bold;">
		<td>填报单位：${culpritStatusTj.groupName}</td>
		<td>（盖章）负责人：</td>
		<td>制表人：${creater}</td>
		<c:choose>
		<c:when test="${culpritStatusTj.reporttime eq null}">
		<td>填报时间：<fmt:formatDate value="${reportTime}"
									pattern="yyyy年MM月dd日" /></td>
		</c:when>
		<c:otherwise>
		<td>填报时间：<fmt:formatDate value="${culpritStatusTj.reporttime}" pattern="yyyy年MM月dd日" /></td>
		</c:otherwise>
		</c:choose>
	</tr>
	</table>

	<table cellspacing=0 cellpadding=0 class="table" style="margin:2px auto;border:1px solid;"  style="width:2500px;" >
	<tr>
		<td rowspan=5 width="100" style="border-right:1px solid;border-bottom:1px solid;">
			<div style="padding-bottom:20px;">地</div>
			<div style="padding-top:180px;">区</div>
		</td>
		<td rowspan=3 width="30" style="border-right:1px solid;border-bottom:1px solid;">本<br/>月<br/>在<br/>册<br/>人<br/>数</td>
		<td rowspan=3 width="30" style="border-right:1px solid;border-bottom:1px solid;">上<br/>月<br/>在<br/>册<br/>人<br/>数</td>
		<td colspan=5 style="border-right:1px solid;border-bottom:1px solid;">变动情况</td>
		<td colspan=5 style="border-right:1px solid;border-bottom:1px solid;">类别</td>
		<td colspan=9 style="border-right:1px solid;border-bottom:1px solid;">犯罪类型</td>
		<td colspan=3 style="border-right:1px solid;border-bottom:1px solid;">户籍</td>
		<td colspan=2 style="border-right:1px solid;border-bottom:1px solid;">性别</td>
		<td colspan=2 style="border-right:1px solid;border-bottom:1px solid;">民族</td>
		<td colspan=4 style="border-right:1px solid;border-bottom:1px solid;">年龄情况</td>
		<td colspan=4 style="border-right:1px solid;border-bottom:1px solid;">文化结构</td>
		<td colspan=3 style="border-right:1px solid;border-bottom:1px solid;">就业、就学情况</td>
		<td colspan=4 style="border-right:1px solid;border-bottom:1px solid;">奖惩情况</td>
		<td rowspan=3 style="border-right:1px solid;border-bottom:1px solid;">截<br/>止<br/>本<br/>月<br/>脱<br/>管</td>
		<td rowspan=3 style="border-right:1px solid;border-bottom:1px solid;">本<br/>月<br/>重<br/>新<br/>犯<br/>罪</td>
		<td colspan=3 style="border-right:1px solid;border-bottom:1px solid;">累计项目</td>
		<td style="border-right: 0;border-top:0;border-bottom: 0;"></td>
	</tr>
	<tr>
		<td rowspan=2>本<br/>月<br/>增<br/>加</td>
		<td colspan=4>本月减少</td>
		<td rowspan=2 width="20">管<br/>制</td>
		<td rowspan=2 width="20">缓<br/>刑</td>
		<td rowspan=2 width="20">假<br/>释</td>
		<td rowspan=2 width="20">暂<br/>予<br/>监<br/>外<br/>执<br/>行</td>
		<td rowspan=2 width="20">剥<br/>夺<br/>政<br/>治<br/>权<br/>利</td>
		<td rowspan=2 width="20">危<br/>害<br/>国<br/>家<br/>安<br/>全<br/>罪</td>
		<td rowspan=2 width="20">危<br/>害<br/>公<br/>共<br/>安<br/>全<br/>罪</td>
		<td rowspan=2 width="20">破<br/>坏<br/>社<br/>会<br/>主<br/>义<br/>市<br/>场<br/>经<br/>济<br/>秩<br/>序<br/>罪</td>
		<td rowspan=2 width="20">侵<br/>犯<br/>公<br/>民<br/>人<br/>身<br/>权<br/>利<br/>、<br/>民<br/>主<br/>权<br/>利<br/>罪</td>
		<td rowspan=2 width="20">侵<br/>犯<br/>财<br/>产<br/>罪</td>
		<td rowspan=2 width="20">妨<br/>害<br/>社<br/>会<br/>管<br/>理<br/>秩<br/>序<br/>罪</td>
		<td rowspan=2 width="20">贪<br/>污<br/>受<br/>贿<br/>罪</td>
		<td rowspan=2 width="20">渎<br/>职<br/>罪</td>
		<td rowspan=2 width="20">其<br/>他</td>
		<td rowspan=2 width="20">城<br/>镇<br/>户<br/>口</td>
		<td rowspan=2 width="20">农<br/>村<br/>户<br/>口</td>
		<td rowspan=2 width="20">其<br/>他</td>
		<td rowspan=2 width="20">男<br/>性</td>
		<td rowspan=2 width="20">女<br/>性</td>
		<td rowspan=2 width="20">汉<br/>族</td>
		<td rowspan=2 width="20">少<br/>数<br/>民<br/>族</td>
		<td rowspan=2 width="20">未<br/>满<br/>18<br/>周<br/>岁</td>
		<td rowspan=2 width="20">18<br/>至<br/>45<br/>周<br/>岁</td>
		<td rowspan=2 width="20">46<br/>至<br/>60<br/>周<br/>岁</td>
		<td rowspan=2 width="20">61周<br/>岁<br/>以<br/>上</td>
		<td rowspan=2 width="20">大<br/>专<br/>及<br/>以<br/>上</td>
		<td rowspan=2 width="20">高<br/>中</td>
		<td rowspan=2 width="20">初<br/>中</td>
		<td rowspan=2 width="20">小<br/>学<br/>及<br/>以<br/>下</td>
		<td rowspan=2 width="20">在<br/>校<br/>就<br/>读</td>
		<td rowspan=2 width="20">就<br/>业</td>
		<td rowspan=2 width="20">无<br/>业</td>
		<td rowspan=2 width="20">社<br/>区<br/>矫<br/>正<br/>机<br/>构<br/>奖<br/>励</td>
		<td rowspan=2 width="20">社<br/>区<br/>矫<br/>正<br/>机<br/>构<br/>处<br/>罚</td>
		<td rowspan=2 width="20">裁<br/>定<br/>减<br/>刑</td>
		<td rowspan=2 width="20">受<br/>治<br/>安<br/>处<br/>罚</td>
		<td rowspan=2 width="20">累<br/>计<br/>接<br/>收</td>
		<td rowspan=2 width="20">累<br/>计<br/>解<br/>除<br/>矫<br/>正</td>
		<td rowspan=2 width="20">累<br/>计<br/>重<br/>新<br/>犯<br/>罪</td>
		<td rowspan=2 style="border-right: 0;border-top:0;border-bottom: 0;"></td>
	</tr>
	<tr>
		<td width="20">期<br/>满<br/>解<br/>除<br/>矫<br/>正</td>
		<td width="20">收<br/>监<br/>执<br/>行</td>
		<td width="20">死<br/>亡</td>
		<td width="20">其<br/>他</td>
	</tr>
	<tr>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td>人</td>
		<td style="border-right: 0;border-top:0;border-bottom: 0;"></td>
	</tr>
	<tr>
		<td>1&nbsp;</td>
		<td>2&nbsp;</td>
		<td>3&nbsp;</td>
		<td>4&nbsp;</td>
		<td>5&nbsp;</td>
		<td>6&nbsp;</td>
		<td>7&nbsp;</td>
		<td>8&nbsp;</td>
		<td>9&nbsp;</td>
		<td>10&nbsp;</td>
		<td>11&nbsp;</td>
		<td>12&nbsp;</td>
		<td>13&nbsp;</td>
		<td>14&nbsp;</td>
		<td>15&nbsp;</td>
		<td>16&nbsp;</td>
		<td>17&nbsp;</td>
		<td>18&nbsp;</td>
		<td>19&nbsp;</td>
		<td>20&nbsp;</td>
		<td>21&nbsp;</td>
		<td>22&nbsp;</td>
		<td>23&nbsp;</td>
		<td>24&nbsp;</td>
		<td>25&nbsp;</td>
		<td>26&nbsp;</td>
		<td>27&nbsp;</td>
		<td>28&nbsp;</td>
		<td>29&nbsp;</td>
		<td>30&nbsp;</td>
		<td>31&nbsp;</td>
		<td>32&nbsp;</td>
		<td>33&nbsp;</td>
		<td>34&nbsp;</td>
		<td>35&nbsp;</td>
		<td>36&nbsp;</td>
		<td>37&nbsp;</td>
		<td>38&nbsp;</td>
		<td>39&nbsp;</td>
		<td>40&nbsp;</td>
		<td>41&nbsp;</td>
		<td>42&nbsp;</td>
		<td>43&nbsp;</td>
		<td>44&nbsp;</td>
		<td>45&nbsp;</td>
		<td>46&nbsp;</td>
		<td>47&nbsp;</td>
		<td>48&nbsp;</td>
		<td style="border-right: 0;border-top:0;border-bottom: 0;"></td>
		</tr>
	<c:forEach items="${childTjList}" var="culpritStatusTj">
	<!-- 未上报且为司法所 -->
	 <c:choose  > 
	 <c:when test="${culpritStatusTj.dicState ne 91801 && groupleavel eq 2}">
	<tr>
		<td width='100' >
		${culpritStatusTj.groupName}
		</td>
		<td ><input style="width:15px" name="byzcrs" value="${culpritStatusTj.byzcrs}"/></td>
		<td ><input style="width:15px" name="syzcrs" value="${culpritStatusTj.syzcrs}"/></td>
		<td ><input style="width:15px" name="change_byzj" value="${culpritStatusTj.change_byzj}"/></td>
		<td ><input style="width:15px" name="change_qmjcjz" value="${culpritStatusTj.change_qmjcjz}"/></td>
		<td ><input style="width:15px" name="change_sjzx" value="${culpritStatusTj.change_sjzx}"/></td>
		<td ><input style="width:15px" name="change_sw" value="${culpritStatusTj.change_sw}"/></td>
		<td ><input style="width:15px" name="change_qtyy" value="${culpritStatusTj.change_qtyy}"/></td>
		<td ><input style="width:15px" name="class_gz" value="${culpritStatusTj.class_gz}"/></td>
		<td ><input style="width:15px" name="class_hx" value="${culpritStatusTj.class_hx}"/></td>
		<td ><input style="width:15px" name="class_js" value="${culpritStatusTj.class_js}"/></td>
		<td ><input style="width:15px" name="class_zyjwzx" value="${culpritStatusTj.class_zyjwzx}"/></td>
		<td ><input style="width:15px" name="class_bdzzql" value="${culpritStatusTj.class_bdzzql}"/></td>
		<td ><input style="width:15px" name="type_whgjaqz" value="${culpritStatusTj.type_whgjaqz}"/></td>
		<td ><input style="width:15px" name="type_whggaqz" value="${culpritStatusTj.type_whggaqz}"/></td>
		<td ><input style="width:15px" name="type_phshzyz" value="${culpritStatusTj.type_phshzyz}"/></td>
		<td ><input style="width:15px" name="type_qfgmrsqlz" value="${culpritStatusTj.type_qfgmrsqlz}"/></td>
		<td ><input style="width:15px" name="type_qfccz" value="${culpritStatusTj.type_qfccz}"/></td>
		<td ><input style="width:15px" name="type_fhshglzxz" value="${culpritStatusTj.type_fhshglzxz}"/></td>
		<td ><input style="width:15px" name="type_twhlz" value="${culpritStatusTj.type_twhlz}"/></td>
		<td ><input style="width:15px" name="type_dzz" value="${culpritStatusTj.type_dzz}"/></td>
		<td ><input style="width:15px" name="type_other" value="${culpritStatusTj.type_other}"/></td>
		<td ><input style="width:15px" name="reg_city" value="${culpritStatusTj.reg_city}"/></td>
		<td ><input style="width:15px" name="reg_village" value="${culpritStatusTj.reg_village}"/></td>
		<td ><input style="width:15px" name="reg_other" value="${culpritStatusTj.reg_other}"/></td>
		<td ><input style="width:15px" name="sex_male" value="${culpritStatusTj.sex_male}"/></td>
		<td ><input style="width:15px" name="sex_female" value="${culpritStatusTj.sex_female}"/></td>
		<td ><input style="width:15px" name="nation_han" value="${culpritStatusTj.nation_han}"/></td>
		<td ><input style="width:15px" name="nation_few" value="${culpritStatusTj.nation_few}"/></td>
		<td ><input style="width:15px" name="age_u18" value="${culpritStatusTj.age_u18}"/></td>
		<td ><input style="width:15px" name="age_19to45" value="${culpritStatusTj.age_19to45}"/></td>
		<td ><input style="width:15px" name="age_46to60" value="${culpritStatusTj.age_46to60}"/></td>
		<td ><input style="width:15px" name="age_61p" value="${culpritStatusTj.age_61p}"/></td>
		<td ><input style="width:15px" name="qualification_junior" value="${culpritStatusTj.qualification_junior}"/></td>
		<td ><input style="width:15px" name="qualification_senior" value="${culpritStatusTj.qualification_senior}"/></td>
		<td ><input style="width:15px" name="qualification_middle" value="${culpritStatusTj.qualification_middle}"/></td>
		<td ><input style="width:15px" name="qualification_primary" value="${culpritStatusTj.qualification_primary}"/></td>
		<td ><input style="width:15px" name="work_study" value="${culpritStatusTj.work_study}"/></td>
		<td ><input style="width:15px" name="work_on" value="${culpritStatusTj.work_on}"/></td>
		<td ><input style="width:15px" name="work_nojob" value="${culpritStatusTj.work_nojob}"/></td>
		<td ><input style="width:15px" name="praise_sqjl" value="${culpritStatusTj.praise_sqjl}"/></td>
		<td ><input style="width:15px" name="praise_sqcf" value="${culpritStatusTj.praise_sqcf}"/></td>
		<td ><input style="width:15px" name="praise_cdjx" value="${culpritStatusTj.praise_cdjx}"/></td>
		<td ><input style="width:15px" name="praise_szacf" value="${culpritStatusTj.praise_szacf}"/></td>
		<td ><input style="width:15px" name="jzbytg" value="${culpritStatusTj.jzbytg}"/></td>
		<td ><input style="width:15px" name="zfxz" value="${culpritStatusTj.zfxz}"/></td>
		<td ><input style="width:15px" name="total_accept" value="${culpritStatusTj.total_accept}"/></td>
		<td ><input style="width:15px" name="total_relieve" value="${culpritStatusTj.total_relieve}"/></td>
		<td ><input style="width:15px" name="total_crime_again" value="${culpritStatusTj.total_crime_again}"/></td>
		<td  style="border-right: 0;border-top:0;border-bottom: 0;"></td>
		</tr>
		</c:when>
	 	<c:when test="${culpritStatusTj.dicState eq 91801 && groupleavel ne 2}"> 
	 	<tr>
			<td width='100' >
			${culpritStatusTj.groupName}
			</td>
			<td >${culpritStatusTj.byzcrs}</td>
			<td >${culpritStatusTj.syzcrs}</td>
			<td >${culpritStatusTj.change_byzj}</td>
			<td >${culpritStatusTj.change_qmjcjz}</td>
			<td >${culpritStatusTj.change_sjzx}</td>
			<td >${culpritStatusTj.change_sw}</td>
			<td >${culpritStatusTj.change_qtyy}</td>
			<td >${culpritStatusTj.class_gz}</td>
			<td >${culpritStatusTj.class_hx}</td>
			<td >${culpritStatusTj.class_js}</td>
			<td >${culpritStatusTj.class_zyjwzx}</td>
			<td >${culpritStatusTj.class_bdzzql}</td>
			<td >${culpritStatusTj.type_whgjaqz}</td>
			<td >${culpritStatusTj.type_whggaqz}</td>
			<td >${culpritStatusTj.type_phshzyz}</td>
			<td >${culpritStatusTj.type_qfgmrsqlz}</td>
			<td >${culpritStatusTj.type_qfccz}</td>
			<td >${culpritStatusTj.type_fhshglzxz}</td>
			<td >${culpritStatusTj.type_twhlz}</td>
			<td >${culpritStatusTj.type_dzz}</td>
			<td >${culpritStatusTj.type_other}</td>
			<td >${culpritStatusTj.reg_city}</td>
			<td >${culpritStatusTj.reg_village}</td>
			<td >${culpritStatusTj.reg_other}</td>
			<td >${culpritStatusTj.sex_male}</td>
			<td >${culpritStatusTj.sex_female}</td>
			<td >${culpritStatusTj.nation_han}</td>
			<td >${culpritStatusTj.nation_few}</td>
			<td >${culpritStatusTj.age_u18}</td>
			<td >${culpritStatusTj.age_19to45}</td>
			<td >${culpritStatusTj.age_46to60}</td>
			<td >${culpritStatusTj.age_61p}</td>
			<td >${culpritStatusTj.qualification_junior}</td>
			<td >${culpritStatusTj.qualification_senior}</td>
			<td >${culpritStatusTj.qualification_middle}</td>
			<td >${culpritStatusTj.qualification_primary}</td>
			<td >${culpritStatusTj.work_study}</td>
			<td >${culpritStatusTj.work_on}</td>
			<td >${culpritStatusTj.work_nojob}</td>
			<td >${culpritStatusTj.praise_sqjl}</td>
			<td >${culpritStatusTj.praise_sqcf}</td>
			<td >${culpritStatusTj.praise_cdjx}</td>
			<td >${culpritStatusTj.praise_szacf}</td>
			<td >${culpritStatusTj.jzbytg}</td>
			<td >${culpritStatusTj.zfxz}</td>
			<td >${culpritStatusTj.total_accept}</td>
			<td >${culpritStatusTj.total_relieve}</td>
			<td >${culpritStatusTj.total_crime_again}</td>
			<td onClick='getClear(this);' style="border-right: 0;border-top:0;border-bottom: 0;"><a  href="#" class="easyui-linkbutton" onclick="returnTj('${culpritStatusTj.id}');" data-options="iconCls:'fi-record icon-blue'">退回</a></td>
		</tr>	
	 </c:when>
	</c:choose>
	</c:forEach>
	<%-- <c:forEach items="${childTjList}" var="culpritStatusTj">
		<div onClick='getClear(this);'><a  href="#" class="easyui-linkbutton" onclick="returnTj('${culpritStatusTj.id}');" data-options="iconCls:'fi-record icon-blue'">退回</a></div>
	</c:forEach> --%>	
	<!-- 未上报的部门且不为司法所 -->
	<c:forEach items="${childTjList}" var="culpritStatusTj">
	<c:if test="${culpritStatusTj.dicState ne 91801 && groupleavel ne 2}"> 
	<tr>
		<td width='100' >
		<span style="color:#FF0000" class="noArrowUp1">${culpritStatusTj.groupName}<br/>(未上报)</span>
		</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td style="border-right: 0;border-top:0;border-bottom: 0;"></td>
	</tr>
	</c:if> 
	</c:forEach>
	<c:if test="${culpritStatusTj.dicState ne 91801 && groupleavel eq 2}">
	<tr>
		<td >
		合计&nbsp;
		</td>
		<td style="border-bottom: 1px solid">${culpritStatusTj.byzcrs}</td>
		<td >${culpritStatusTj.syzcrs}</td>
		<td >${culpritStatusTj.change_byzj}</td>
		<td >${culpritStatusTj.change_qmjcjz}</td>
		<td >${culpritStatusTj.change_sjzx}</td>
		<td >${culpritStatusTj.change_sw}</td>
		<td >${culpritStatusTj.change_qtyy}</td>
		<td >${culpritStatusTj.class_gz}</td>
		<td >${culpritStatusTj.class_hx}</td>
		<td >${culpritStatusTj.class_js}</td>
		<td >${culpritStatusTj.class_zyjwzx}</td>
		<td >${culpritStatusTj.class_bdzzql}</td>
		<td >${culpritStatusTj.type_whgjaqz}</td>
		<td >${culpritStatusTj.type_whggaqz}</td>
		<td >${culpritStatusTj.type_phshzyz}</td>
		<td >${culpritStatusTj.type_qfgmrsqlz}</td>
		<td >${culpritStatusTj.type_qfccz}</td>
		<td >${culpritStatusTj.type_fhshglzxz}</td>
		<td >${culpritStatusTj.type_twhlz}</td>
		<td >${culpritStatusTj.type_dzz}</td>
		<td >${culpritStatusTj.type_other}</td>
		<td >${culpritStatusTj.reg_city}</td>
		<td >${culpritStatusTj.reg_village}</td>
		<td >${culpritStatusTj.reg_other}</td>
		<td >${culpritStatusTj.sex_male}</td>
		<td >${culpritStatusTj.sex_female}</td>
		<td >${culpritStatusTj.nation_han}</td>
		<td >${culpritStatusTj.nation_few}</td>
		<td >${culpritStatusTj.age_u18}</td>
		<td >${culpritStatusTj.age_19to45}</td>
		<td >${culpritStatusTj.age_46to60}</td>
		<td >${culpritStatusTj.age_61p}</td>
		<td >${culpritStatusTj.qualification_junior}</td>
		<td >${culpritStatusTj.qualification_senior}</td>
		<td >${culpritStatusTj.qualification_middle}</td>
		<td >${culpritStatusTj.qualification_primary}</td>
		<td >${culpritStatusTj.work_study}</td>
		<td >${culpritStatusTj.work_on}</td>
		<td >${culpritStatusTj.work_nojob}</td>
		<td >${culpritStatusTj.praise_sqjl}</td>
		<td >${culpritStatusTj.praise_sqcf}</td>
		<td >${culpritStatusTj.praise_cdjx}</td>
		<td >${culpritStatusTj.praise_szacf}</td>
		<td >${culpritStatusTj.jzbytg}</td>
		<td >${culpritStatusTj.zfxz}</td>
		<td >${culpritStatusTj.total_accept}</td>
		<td >${culpritStatusTj.total_relieve}</td>
		<td >${culpritStatusTj.total_crime_again}</td>
		<td  style="border-right: 0;border-top:0;border-bottom: 0;"></td>
	</tr>
	</c:if>
	<c:if test="${culpritStatusTj.dicState ne 91801 && groupleavel ne 2}">
		<tr  style="text-align: center;">
		 <td width='100' >
		合计
		</td>
		<td ><input style="width:20px" name="byzcrs" value="${culpritStatusTj.byzcrs}"/></td>
		<td ><input style="width:15px" name="syzcrs" value="${culpritStatusTj.syzcrs}"/></td>
		<td ><input style="width:15px" name="change_byzj" value="${culpritStatusTj.change_byzj}"/></td>
		<td ><input style="width:15px" name="change_qmjcjz" value="${culpritStatusTj.change_qmjcjz}"/></td>
		<td ><input style="width:15px" name="change_sjzx" value="${culpritStatusTj.change_sjzx}"/></td>
		<td ><input style="width:15px" name="change_sw" value="${culpritStatusTj.change_sw}"/></td>
		<td ><input style="width:15px" name="change_qtyy" value="${culpritStatusTj.change_qtyy}"/></td>
		<td ><input style="width:15px" name="class_gz" value="${culpritStatusTj.class_gz}"/></td>
		<td ><input style="width:15px" name="class_hx" value="${culpritStatusTj.class_hx}"/></td>
		<td ><input style="width:15px" name="class_js" value="${culpritStatusTj.class_js}"/></td>
		<td ><input style="width:15px" name="class_zyjwzx" value="${culpritStatusTj.class_zyjwzx}"/></td>
		<td ><input style="width:15px" name="class_bdzzql" value="${culpritStatusTj.class_bdzzql}"/></td>
		<td ><input style="width:15px" name="type_whgjaqz" value="${culpritStatusTj.type_whgjaqz}"/></td>
		<td ><input style="width:15px" name="type_whggaqz" value="${culpritStatusTj.type_whggaqz}"/></td>
		<td ><input style="width:15px" name="type_phshzyz" value="${culpritStatusTj.type_phshzyz}"/></td>
		<td ><input style="width:15px" name="type_qfgmrsqlz" value="${culpritStatusTj.type_qfgmrsqlz}"/></td>
		<td ><input style="width:15px" name="type_qfccz" value="${culpritStatusTj.type_qfccz}"/></td>
		<td ><input style="width:15px" name="type_fhshglzxz" value="${culpritStatusTj.type_fhshglzxz}"/></td>
		<td ><input style="width:15px" name="type_twhlz" value="${culpritStatusTj.type_twhlz}"/></td>
		<td ><input style="width:15px" name="type_dzz" value="${culpritStatusTj.type_dzz}"/></td>
		<td ><input style="width:15px" name="type_other" value="${culpritStatusTj.type_other}"/></td>
		<td ><input style="width:15px" name="reg_city" value="${culpritStatusTj.reg_city}"/></td>
		<td ><input style="width:15px" name="reg_village" value="${culpritStatusTj.reg_village}"/></td>
		<td ><input style="width:15px" name="reg_other" value="${culpritStatusTj.reg_other}"/></td>
		<td ><input style="width:15px" name="sex_male" value="${culpritStatusTj.sex_male}"/></td>
		<td ><input style="width:15px" name="sex_female" value="${culpritStatusTj.sex_female}"/></td>
		<td ><input style="width:15px" name="nation_han" value="${culpritStatusTj.nation_han}"/></td>
		<td ><input style="width:15px" name="nation_few" value="${culpritStatusTj.nation_few}"/></td>
		<td ><input style="width:15px" name="age_u18" value="${culpritStatusTj.age_u18}"/></td>
		<td ><input style="width:15px" name="age_19to45" value="${culpritStatusTj.age_19to45}"/></td>
		<td ><input style="width:15px" name="age_46to60" value="${culpritStatusTj.age_46to60}"/></td>
		<td ><input style="width:15px" name="age_61p" value="${culpritStatusTj.age_61p}"/></td>
		<td ><input style="width:15px" name="qualification_junior" value="${culpritStatusTj.qualification_junior}"/></td>
		<td ><input style="width:15px" name="qualification_senior" value="${culpritStatusTj.qualification_senior}"/></td>
		<td ><input style="width:15px" name="qualification_middle" value="${culpritStatusTj.qualification_middle}"/></td>
		<td ><input style="width:15px" name="qualification_primary" value="${culpritStatusTj.qualification_primary}"/></td>
		<td ><input style="width:15px" name="work_study" value="${culpritStatusTj.work_study}"/></td>
		<td ><input style="width:15px" name="work_on" value="${culpritStatusTj.work_on}"/></td>
		<td ><input style="width:15px" name="work_nojob" value="${culpritStatusTj.work_nojob}"/></td>
		<td ><input style="width:15px" name="praise_sqjl" value="${culpritStatusTj.praise_sqjl}"/></td>
		<td ><input style="width:15px" name="praise_sqcf" value="${culpritStatusTj.praise_sqcf}"/></td>
		<td ><input style="width:15px" name="praise_cdjx" value="${culpritStatusTj.praise_cdjx}"/></td>
		<td ><input style="width:15px" name="praise_szacf" value="${culpritStatusTj.praise_szacf}"/></td>
		<td ><input style="width:15px" name="jzbytg" value="${culpritStatusTj.jzbytg}"/></td>
		<td ><input style="width:15px" name="zfxz" value="${culpritStatusTj.zfxz}"/></td>
		<td ><input style="width:15px" name="total_accept" value="${culpritStatusTj.total_accept}"/></td>
		<td ><input style="width:15px" name="total_relieve" value="${culpritStatusTj.total_relieve}"/></td>
		<td ><input style="width:15px" name="total_crime_again" value="${culpritStatusTj.total_crime_again}"/></td>
		<td  style="border-right: 0;border-top:0;border-bottom: 0;"></td>
		</tr>
	</c:if>
	</table>
	</div>
	</form>
</div>

<div id="returnTjDialog" title="退回意见" modal=true  closable=true data-option="iconCls:'fi-record icon-blue'"
	        maximizable=true class="easyui-dialog" closed=true style="width: 600px;padding:5px;" 
	        data-options="buttons:[{
				text:'保存',
				iconCls:'icon-save',
				handler:function(){returnTjSave();}
			},{
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){returnTjClose();}
			}]">
		<form id="returnTjForm" action="" method="post" autocomplete="off">
			<table width="100%" class="grid">
				<tr>
                    <th width="20%"><span class="c-red">*</span>退回原因：</th>
					<td>
					<textarea  name="returnReason" id="returnTjReason" class="easyui-validatebox"  multiline="true" 
						onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)'  required=true
							style="width:80%;height:100px;overflow:hidden;" maxlength=200></textarea>
						<br/>
						<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
						</p>
					</td>
                </tr> 
			</table>
		</form>
	</div>




