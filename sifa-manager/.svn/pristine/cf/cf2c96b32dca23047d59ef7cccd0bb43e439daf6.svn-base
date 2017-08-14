<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>基本信息</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
td{border:solid #add9c0; border-width:0px 1px 1px 0px; padding:10px 0px;}
table{border:solid #add9c0; border-width:1px 0px 0px 1px;}
</style>
</head>

<body>

     <div class="easyui-panel" id="p2" title="基本情况" style="width:100%;padding:10px;">
            <table width="100%" style="text-align: center;">
                <tr>
                   	<td>
                   	司法所：
                   	</td>
                   	<td class=category>
                   	${culprit.groupName}
                   	</td>
                   	<td>
                   	人员编号：
                   	</td>
                   	<td class=category>
                   	${culprit.no }
                   	</td>
                   	<td rowspan=5 style="width:150px;">照片:</td>
            		<td rowspan=5>无照片</td>
                </tr>
                <tr>
                	<td>
                		姓名：
                	</td>
                	<td class=category>
                		${culprit.name }
                	</td>
                	<td>
                		曾用名：
                	</td>
                	<td class=category>
                		${culprit.alias }
                	</td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td class=category >
                    	${fns:getSysDicValueByKey('common_table', 'sex', culprit.dicSexKey, '') }
                    </td>
                     <td>民族:</td>
                    <td>
                    	${fns:getSysDicValueByKey('common_table', 'nation',culprit.nation, '') }
                    </td>
                </tr>
                <tr>
                	<td>出生日期：</td>
                	<td class=category>
                		<fmt:formatDate value="${culprit.birthday}"
									pattern="yyyy-MM-dd" />
					</td>
					<td>联系方式：</td>
					<td class=category>
					 ${culprit.contactPhone }
					</td>
                </tr>
                <tr>
                	<td>证件类型：</td>
                	<td class=category>
                		${fns:getSysDicValueByKey('SF_CULPRIT', 'dicZjlxKey',culprit.dicZjlxKey, '') }
                	</td>
                	<td>证件号码：</td>
                	<td id="identificationNum" class=category>	
                	</td>
                </tr>
                <tr>
                	<td>籍贯：</td>
                    <td class=category>${culprit.origin }</td>
                     <td>户籍性质:</td>
                    <td class=category>
                    	${fns:getSysDicValueByKey('common_table', 'hklx',culprit.dicHklxKey, '') }
                   	</td>
                   	<td>文化程度:</td>
                    <td class=category>
                    	${fns:getSysDicValueByKey('common_table', 'whcd',culprit.dicWhcdKey, '') }
                    </td>
               	</tr>
               	<tr>
                    <td>现在工作单位：</td>
                    <td class=category>
	                    <c:if test="${culprit.newJob ne null }">
	                    	${culprit.newJob }
	                    </c:if>
                    </td>
                     <td>单位联系方式:</td>
                    <td class=category>${culprit.jobPhone }</td>
                    <td>婚姻状况:</td>
                    <td>
                    	${fns:getSysDicValueByKey('common_table', 'hyzk',culprit.dicHyzkKey, '') }
                    </td>
               	</tr>
               	<tr>
                    <td>户籍详细地址:</td>
                    <td colspan="8" align="left">
						&nbsp;&nbsp;&nbsp;${culprit.regResidencePro }&nbsp;&nbsp;&nbsp;
						${culprit.regResidenceCity }&nbsp;&nbsp;&nbsp;
						${culprit.regResidenceCountry }&nbsp;&nbsp;&nbsp;
						${culprit.regResidenceStreet }&nbsp;乡镇（街道）&nbsp;&nbsp;
						${culprit.regResidenceDetail }&nbsp;（详细门牌号）
                    </td>
                </tr>
                <tr>
                    <td>居住地详细地址:</td>
                    <td colspan="8" align="left">
                    	&nbsp;&nbsp;&nbsp;${culprit.addressPro }&nbsp;&nbsp;&nbsp;
						${culprit.addressCity }&nbsp;&nbsp;&nbsp;
						${culprit.addressCountry }&nbsp;&nbsp;&nbsp;
						${culprit.addressStreet }&nbsp;乡镇（街道）&nbsp;&nbsp;
						${culprit.addressDetail }&nbsp;（详细门牌号）
                    </td>
                </tr>   
               	
            </table>
    </div>
     <div class="easyui-panel" id="p2" title="罪犯押送情况" style="width:100%;padding:10px;">
	    	<table width="100%">
	     		<tr>
	                <td>人员接收方式：
	                 ${fns:getSysDicValueByKey('culprit_judgment', 'dicReceiveTypeKey',culpritJudgment.dicReceiveTypeKey, '') } 
	                </td>
	                <td > 
	                </td>
				</tr>
	     	</table>
     	<table class="easyui-datagrid" id="judg_list_content" style="height: 200px;width:100%"
			data-options="singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/sys/culpritJudgment/list?culpritId='+'${culprit.id}',method:'post'">
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
	 <div class="easyui-panel" id="p2" title="同案犯信息" style="width:100%;padding:10px;">
	 <table class="easyui-datagrid" id="judg_list_content" style="height: 200px;width:100%"
			data-options="singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/culpritinfo/culpritComplicity/list?culpritId='+'${culprit.id}',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:true,width:80">编号</th>
					<th data-options="field:'name',width:80,align:'center'"
						editor="{type:'validatebox',options:{required:true}}">姓名</th>
					<th data-options="field:'dicSexKey',width:250,align:'center'" editor="text">性别</th>
					<th data-options="field:'birthday',width:200,align:'center'" editor="text">出生年月</th>
					<th data-options="field:'crime',width:250,align:'center'" editor="text">罪名</th>
					<th data-options="field:'dicYpxfKey',width:250,align:'center'" editor="text">被判处刑罚</th>
					<th data-options="field:'escortDate',width:250,align:'center'" editor="text">所在监狱</th>
					<th data-options="field:'prison',width:160,align:'center'" >操作</th><!-- formatter="formatterJudg" -->
				</tr>
			</thead>
		</table>
	 </div>
	 <div class="easyui-panel" id="p2" title="其他情况相关" style="width:100%;padding:10px;">
	 	<table width="100%" style="text-align: center;">
	 		<tr>
	 			<td>是否完成报备：</td>
	 			<td style="width:10%;">
					 ${exitEntryReport.dicBbztKey }
				</td>
				<td>报备时间：</td>
				<td style="width:10%;">
					 ${exitEntryReport.filingDate }
				</td>
				<td>未报备原因：</td>
				<td style="width:15%;">
					 ${exitEntryReport.filingDate }
				</td>
	 		</tr>
	 		<tr>
	 			<td>有无护照：</td>
	 			<td >
	 			<c:if test="${culprit.dicPassPortKey ne 1 }">
	 				<p>否</p>
	 			</c:if>
	 			<c:if test="${culprit.dicPassPortKey eq 1 }">
	 				<p>是</p>
	 			</c:if>
				</td>
				<td>护照号码：</td>
				<td >
					 ${culprit.passportNum }
				</td>
				<td>收缴人及时间：</td>
				<td >
					
				</td>
			</tr>
			<tr>
				<td>有无回乡证：</td>
				<td>
				<c:if test="${culprit.dicSfyhxzKey ne 1 }">
	 				<p>否</p>
	 			</c:if>
	 			<c:if test="${culprit.dicSfyhxzKey eq 1 }">
	 				<p>是</p>
	 			</c:if>
	 			</td>
				<td>回乡证号码：</td>
				<td >
					 ${culprit.returnCardNum }
				</td>
				<td>收缴人及时间：</td>
				<td >
					
				</td>
			</tr>
			<tr>
				<td>有无台胞证</td>
	 			<td >
	 			<c:if test="${culprit.dicSfytbzKey ne 1 }">
	 				<p>否</p>
	 			</c:if>
	 			<c:if test="${culprit.dicSfytbzKey eq 1 }">
	 				<p>是</p>
	 			</c:if>
				</td>
				<td>台胞证号码：</td>
				<td >
					 ${culprit.compatriotsCardNum }
				</td>
				<td>收缴人及时间：</td>
				<td >
					
				</td>
	 		</tr>
	 		<tr>
	 			<td>对象报到时间：</td>
	 			<td><fmt:formatDate value="${culprit.created}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>报到情况：</td>
				<td>
					<c:if test="${culprit.dicReportInfoKey ne 1 }">
		 				<p>正常</p>
		 			</c:if>
		 			<c:if test="${culprit.dicReportInfoKey eq 1 }">
		 				<p>漏罪</p>
		 			</c:if>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td>矫正小组：</td>
	 			<td>
		 			<c:if test="${culprit.dicReportInfoKey ne 0 }">
		 				<input type="radio" name="dicSfjljzxzKey" value="0" disabled style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
		 				<input type="radio" name="dicSfjljzxzKey" value="1" disabled checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
		 			</c:if>
		 			<c:if test="${culprit.dicReportInfoKey eq 0 }">
		 				<input type="radio" name="dicSfjljzxzKey" value="0" disabled checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
		 				<input type="radio" name="dicSfjljzxzKey" value="1" disabled style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
		 			</c:if>
	 			</td>
	 			<td>有无定位手机：</td>
	 			<td>
	 				<c:if test="${culpritJudgment.dicHaveMobileKey ne 1 }">
		 				<p>无</p>
		 			</c:if>
		 			<c:if test="${culpritJudgment.dicHaveMobileKey eq 1 }">
		 				<p>有</p>
		 			</c:if>
	 			</td>
	 			<td>定位手机</td>
	 			<td></td>
	 		</tr>
	 		<tr>
	 			<td>信息化管理：</td>
	 			<td>
		 			<c:if test="${culpritJudgment.dicIsInfManageKey ne 0 }">
		 				<input type="radio" name="dicIsInfManageKey" value="0" disabled style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
		 				<input type="radio" name="dicIsInfManageKey" value="1" disabled checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
		 			</c:if>
		 			<c:if test="${culpritJudgment.dicIsInfManageKey eq 0 }">
		 				<input type="radio" name="dicIsInfManageKey" value="0" disabled checked="checked" style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>是&nbsp;&nbsp;&nbsp;
		 				<input type="radio" name="dicIsInfManageKey" value="1" disabled style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;"/>否
		 			</c:if>
	 			</td>
	 			<td>监管等级：</td>
	 			<td>
		 			 ${fns:getSysDicValueByKey('sf_culprit', 'dic_gldxjb_key',culprit.dicGldxjbKey, '') } 
	 			</td>
	 			<td>监管人员：</td>
	 			<td>
		 			${culpritSupervisor.accountName},${culpritSupervisor.assistantName}
	 			</td>
	 		</tr>
	 	</table>
	 </div>
<script type="text/javascript">
$(function(){
	//console.info('${culpritSupervisor.accountName}')
	//根据证件类型设置证件号码的值
	var zjlx=${culprit.dicZjlxKey};
	if(zjlx==86001){
		$('#identificationNum').val('${culprit.cedentialsNumber}')
	}else if(zjlx==86002){
		$('#identificationNum').val('${culprit.passportNum}')
	}else if(zjlx==86003){
		$('#identificationNum').val('${culprit.returnCardNum}')
	}else if(zjlx==86004){
		$('#identificationNum').val('${culprit.compatriotsCardNum}')
	}
	//返回监管人员姓名
	
});

</script>
</body>
</html>
