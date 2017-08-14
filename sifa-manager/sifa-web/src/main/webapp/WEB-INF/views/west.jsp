<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<style>
body {
	font-family: helvetica, tahoma, verdana, sans-serif;
	padding: 10px;
	font-size: 13px;
	margin: 0;
}

* {
	margin: 0;
	padding: 0;
	border: 0;
}
.easyui-tree li{
	margin-top: 6px;
}

</style>
<script type="text/javascript" charset="utf-8">
	var tree;
	var menuPanel;
	$(function() {
		menuPanel = $('#menuPanel').panel({
			tools : [ {
				iconCls : 'icon-reload',
				handler : function() {
					tree.tree('reload');
				}
			}, {
				iconCls : 'icon-redo',
				handler : function() {
					var node = tree.tree('getSelected');
					if (node) {
						tree.tree('expandAll', node.target);
					} else {
						tree.tree('expandAll');
					}
				}
			}, {
				iconCls : 'icon-undo',
				handler : function() {
					var node = tree.tree('getSelected');
					if (node) {
						tree.tree('collapseAll', node.target);
					} else {
						tree.tree('collapseAll');
					}
				}
			} ]
		});

		tree = $('#menu').tree({
			url : 'menuAction!ctrlTree.action',
			lines : true,
			onClick : function(node) {
				//author:王正 date:20130118 for点击父菜单会出现Tab页，建议去掉。
				var nodeurl = node.attributes["url"].replace(' ','');
				if (nodeurl != '' && nodeurl !='#')
				addTab(node);
			},
			onDblClick : function(node) {
				if (node.state == 'closed') {
					$(this).tree('expand', node.target);
				} else {
					$(this).tree('collapse', node.target);
				}
			}
		});
	});
	
	function readNode(node){
		var attr = node.attributes;
		var nodeurl = node.attributes['url'].replace(' ','');
		if (nodeurl != '' && nodeurl !='#')
		addTab(node);
	}
	
</script>
<div class="easyui-accordion" style="border:left" data-options="fit:true,border:false">
	<div title="调查评估">
		<ul class="easyui-tree tree" style="border:left" data-options="fit:true,border:false,onClick:readNode">
			<li iconCls="icon-bing" data-options="attributes:{'url':'${ctx}/investigate/list'}">调查评估</li>
		</ul>
	</div>
	<div title="入矫管理">
		<ul class="easyui-tree tree" style="border:left" data-options="fit:true,border:false,onClick:readNode">
			<li iconCls="icon-bing" data-options="attributes:{'url':'${ctx}/culpritinfo/culprit/list'}">首次报道</li>
			<li iconCls="icon-blue" data-options="attributes:{'url':'${ctx}/sys/sysUser/list'}">出入境报备</li>
			<li iconCls="icon-blue" data-options="attributes:{'url':'${ctx}/culprit/moveIn/forList'}">迁入管理</li>
		</ul>
	</div>
	<div title="日常管理" >
		<ul class="easyui-tree tree" style="border:left" data-options="fit:true,border:false,onClick:readNode">
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/dailymgr/fileManagement/list'}">档案管理</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/dailymgr/gradeChange/list'}">监管等级</li>
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/dailymgr/dailyReport/list'}">日常报到</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/dailymgr/thinkReport/list'}">思想汇报</li>
			<li iconCls="icon-talk" data-options="attributes:{'url':'${ctx}/dailymgr/talk/list'}">谈话教育</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/dailymgr/interview/list'}">走访登记</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/dailymgr/study/list'}">学习教育</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/dailymgr/workfree/list'}">社区服务</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/dailymgr/askLeave/list'}">请销假管理</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/dailymgr/specialArea/list'}">进入特定区域管理</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/dailymgr/outOfPrison/list'}">延长监外执行</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/dailymgr/inspection/list'}">集中点验</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/dailymgr/helpDifficulty/list'}">帮困解难</li>
			<li iconCls="icon-conf" state="closed">
				<span>信息交互</span>
				<ul >
					<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/information/groupMessaging/list'}">对象短信群发</li>
					<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/information/staffGroupMessaging/list'}">工作人员短信群发</li>
					<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/dailymgr/smsCulprit/list'}">纪录查询</li>
				</ul>
			</li>
		</ul>
	</div>
	<div title="考核奖惩" >
		 <ul class="easyui-tree tree" style="border:left" data-options="fit:true,border:false,onClick:readNode">
			<li iconCls="icon-cale">
				<span>违纪处理</span>
				<ul>
					<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/jiangcheng/verbalWarning/list'}">口头警告</li>
					<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/jiangcheng/noDeal/list'}">待处理作不处理</li>
					<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/jiangcheng/commend/list'}">表扬</li>
					<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/jiangcheng/warning/list'}">警告</li>
					<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/jiangcheng/securityPunishment/list'}">提请治安管理处罚</li>
					<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/jiangcheng/revokeProbation/list'}">提请撤销缓刑</li>
					<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/jiangcheng/revokeParole/list'}">提请撤销假释</li>
					<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/jiangcheng/revokeOutOfPrison/list'}">提请撤销暂予监外执行</li>
				</ul>
			</li>
			<li iconCls="icon-conf" state="closed">
				<span>其他行政处罚</span>
				<ul >
					<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/jiangcheng/administrativeWarning/list'}">行政警告</li>
					<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/jiangcheng/administrativePenalty/list'}">行政罚款</li>
					<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/jiangcheng/administrativeDetention/list'}">行政拘留</li>
				</ul>
			</li>
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/jiangcheng/reducePenalty/list'}">减刑</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/rewardspunishment/paroleController/list'}">假释</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/assess/MonthlyPerformance/list'}">月度考核评议</li>
		</ul> 
	</div>
	<div title="矫正终止" >
		<ul class="easyui-tree tree" style="border:left" data-options="fit:true,border:false,onClick:readNode">
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/endcorrect/outof/list'}">迁出管理</li>
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/endcorrect/detached/list'}">脱管管理</li>
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/endcorrect/imprison/list'}">收监执行</li>
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/endcorrect/death/list'}">死亡登记</li>
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/endcorrect/redressStop/list'}">特殊原因终止矫正</li>		
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}//endcorrect/recidivismPerhaps/list'}">涉嫌重新犯罪</li>
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}//endcorrect/recidivism/list'}">重新犯罪</li>
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}//endcorrect/omittedCrime/list'}">漏罪</li>
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}//endcorrect/redressResume/list'}">特殊原因恢复矫正</li>
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}//endcorrect/finishRedress/list'}">期满解矫</li>
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}//endcorrect/assess/list'}">矫正终止到期警示</li>
		</ul>
	</div>
	<div title="动态监管" >
		<ul class="easyui-tree tree" style="border:left" data-options="fit:true,border:false,onClick:readNode">
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/monitoring/terminalActivity/list'}">实时定位</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/ps/terminalManager/list'}">历史定位</li>
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/monitoring/overAlarm/list'}">越界警告</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/monitoring/terminalArea/list'}">电子围栏</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/sys/locationPerson/list'}">走访登记</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/sys/locationPerson/list'}">学习教育</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/sys/locationPerson/list'}">社区服务</li>
		</ul>
	</div>
		<div title="统计查询" >
		<ul class="easyui-tree tree" style="border:left" data-options="fit:true,border:false,onClick:readNode">
			<li iconCls="icon-stgo" data-options="attributes:{'url':'${ctx}/statistics/chart'}">矫正对象层级统计（图表）</li>
		</ul>
	</div>
	<div title="流程管理" >
		<ul class="easyui-tree tree" style="border:left" data-options="fit:true,border:false,onClick:readNode">
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/flow/deployProcess'}">流程定义部署</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/flow/queryProcessDefinition'}">流程定义查询</li>
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/dailymgr/askLeave/queryActivityAskLeave'}">当前运行流程</li>
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/dailymgr/askLeave/activityAskLeaveList'}">请假处理</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/dailymgr/askLeave/queryHistoryTask'}">结束流程</li>
		</ul>
	</div>
	<div title="资料中心" >
		<ul class="easyui-tree tree" style="border:left" data-options="fit:true,border:false,onClick:readNode">
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/datacenter/regulations'}">法侓法规</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/datacenter/systemFile'}">制度文件</li>
			<li iconCls="icon-cale" data-options="attributes:{'url':'${ctx}/datacenter/softwareDownload/list'}">软件下载</li>
		</ul>
	</div>
	<div title="系统管理" >
		<ul class="easyui-tree tree" style="border:left" data-options="fit:true,border:false,onClick:readNode">
						<li   iconCls="icon-limi" data-options="attributes:{'url':'${ctx}/sys/sysPerson/list',iconCls:'icon-limi'}"  >人员管理</li>
			<li   iconCls="icon-limi" data-options="attributes:{'url':'${ctx}/sys/sysAccount/list',iconCls:'icon-limi'}"  >账号管理</li>

			<li iconCls="icon-talk" data-options="attributes:{'url':'${ctx}/sys/sysRole/list',iconCls:'icon-limi'}" >角色管理</li>
			<li iconCls="icon-face" data-options="attributes:{'url':'${ctx}/sys/sysPermission/list',iconCls:'icon-limi'}" >资源管理</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/sys/sysGroup/list',iconCls:'icon-limi'}" >部门管理</li>
			<li data-options="attributes:{'url':'${ctx}/sys/sysDic/list',iconCls:'icon-annex'}" iconCls="icon-bars" >数据字典管理</li>
			<li data-options="attributes:{'url':'${ctx}/sys/sysDictItems/list',iconCls:'icon-annex'}" iconCls="icon-bars" >节假日管理</li>
			<li data-options="attributes:{'url':'${ctx}/sys/sysDictItems/list',iconCls:'icon-annex'}" iconCls="icon-bars" >设备管理</li>
			<li data-options="attributes:{'url':'${ctx}/sys/sysDictItems/list',iconCls:'icon-annex'}" iconCls="icon-bars" >考勤记录</li>
			<li iconCls="icon-conf" data-options="attributes:{'url':'${ctx}/sys/sysLog/list',iconCls:'icon-limi'}" >日志管理</li>
		</ul>
	</div>
	<%--
	<c:forEach var="item" items="${sessionInfo.auths}">
		<c:if test="${item.cpid=='0'}">
			<div title="${item.cname}" iconCls="${item.ciconCls}">
			<ul class="easyui-tree tree" data-options="url:'menuAction!treeRecursive.action?id=${item.cid}',onClick : function(node) {
				var nodeurl = node.attributes['url'].replace(' ','');
				if (nodeurl != '' && nodeurl !='#')
				addTab(node);
			}">  
    		</ul> 
			</div>
		</c:if>
	</c:forEach>
	 --%>
</div>
	
