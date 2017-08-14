<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<%-- <link rel="stylesheet" href="${ctxStatic }/style/font-awesome/css/font-awesome.min.css"> --%>
<!--[if IE 7]>
<link rel="stylesheet" href="${ctxStatic }/style/font-awesome/css/font-awesome-ie7.min.css">
<![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.my-position {
	position: static;
}
</style>
<title>${fns:getConfig('productName') }</title>
<script type="text/javascript">
	var index_tabs;
	var layout_west_tree;
	var indexTabsMenu;
	$(function() {

		$(".hr").bind("mouseover", function() {
			$(".hr ul").show();
		}).bind("mouseout", function() {
			$(".hr ul").hide();
		});

		$('#index_layout').layout({
			fit : true
		});
		/* alert(document.getElementsByClassName("header").parentNode);
		document.getElementsByClassName("header").parentNode.style.position="initial"; */
		$('.header').parent().addClass("my-position");

		index_tabs = $('#index_tabs').tabs(
				{
					fit : true,
					border : false,
					onContextMenu : function(e, title) {
						e.preventDefault();
						indexTabsMenu.menu('show', {
							left : e.pageX,
							top : e.pageY
						}).data('tabTitle', title);
					},
					tools : [
							{
								iconCls : 'fi-home',
								handler : function() {
									index_tabs.tabs('select', 0);
								}
							},
							{
								iconCls : 'fi-loop',
								handler : function() {
									refreshTab();
								}
							},
							{
								iconCls : 'fi-x',
								handler : function() {
									var index = index_tabs.tabs('getTabIndex',
											index_tabs.tabs('getSelected'));
									var tab = index_tabs.tabs('getTab', index);
									if (tab.panel('options').closable) {
										index_tabs.tabs('close', index);
									}
								}
							} ]
				});
		// 选项卡菜单
		indexTabsMenu = $('#tabsMenu').menu(
				{
					onClick : function(item) {
						var curTabTitle = $(this).data('tabTitle');
						var type = $(item.target).attr('type');
						if (type === 'refresh') {
							refreshTab();
							return;
						}
						if (type === 'close') {
							var t = index_tabs.tabs('getTab', curTabTitle);
							if (t.panel('options').closable) {
								index_tabs.tabs('close', curTabTitle);
							}
							return;
						}
						var allTabs = index_tabs.tabs('tabs');
						var closeTabsTitle = [];
						$.each(allTabs, function() {
							var opt = $(this).panel('options');
							if (opt.closable && opt.title != curTabTitle
									&& type === 'closeOther') {
								closeTabsTitle.push(opt.title);
							} else if (opt.closable && type === 'closeAll') {
								closeTabsTitle.push(opt.title);
							}
						});
						for (var i = 0; i < closeTabsTitle.length; i++) {
							index_tabs.tabs('close', closeTabsTitle[i]);
						}
					}
				});

		/*  layout_west_tree = $('#layout_west_tree').tree({
		     url : '${path }/resource/tree',
		     parentField : 'pid',
		     lines : true,
		     onClick : function(node) {
		         var opts = {
		             title : node.text,
		             border : false,
		             closable : true,
		             fit : true,
		             iconCls : node.iconCls
		         };
		         var url = node.attributes;
		         if (url && url.indexOf("http") == -1) {
		             url = '${path }' + url;
		         }
		         if (node.openMode == 'iframe') {
		             opts.content = '<iframe src="' + url + '" frameborder="0" style="border:0;width:100%;height:99.5%;"></iframe>';
		             addTab(opts);
		         } else if (url) {
		             opts.href = url;
		             addTab(opts);
		         }
		     }
		 }); */

		var tab = index_tabs.tabs('getTab', 0);
		$('#index_tabs')
				.tabs(
						'update',
						{
							tab : tab,
							options : {
								content : '<iframe name="indextab" scrolling="auto" src="${ctx}/home" frameborder="0" style="width:100%;height:100%;"></iframe>',
								closable : false,
								selected : true
							}
						});
	});

	function addTab(opts) {
		var t = $('#index_tabs');
		if (t.tabs('exists', opts.title)) {
			t.tabs('select', opts.title);
			refreshTab();
		} else {
			t.tabs('add', opts);
		}
	}

	function refreshTab() {
		var index = index_tabs.tabs('getTabIndex', index_tabs
				.tabs('getSelected'));
		var tab = index_tabs.tabs('getTab', index);
		var options = tab.panel('options');
		if (options.content) {
			index_tabs.tabs('update', {
				tab : tab,
				options : {
					content : options.content
				}
			});
		} else {
			tab.panel('refresh', options.href);
		}
	}

	function logout() {
		$.messager.confirm('提示', '确定要退出?', function(r) {
			if (r) {
				progressLoad();
				$.post('${ctx}/sys/logout', function(result) {
					if (result.success) {
						progressClose();
						window.location.href = '${ctx}';
					}
				}, 'json');
			}
		});
	}

	function editUserPwd() {
		parent.$.modalDialog({
			title : '修改密码',
			width : 300,
			height : 250,
			href : '${ctx}/user/editPwdPage',
			buttons : [ {
				text : '确定',
				handler : function() {
					var f = parent.$.modalDialog.handler
							.find('#editUserPwdForm');
					f.submit();
				}
			} ]
		});
	}

	function readNode(node) {
		/* var attr = node.attributes;
		var nodeurl = node.attributes['url'].replace(' ','');
		if (nodeurl != '' && nodeurl !='#')
		addTab(node); */
		var url = node.attributes['url'].replace(' ', '');

		var opts = {
			title : node.text,
			border : false,
			closable : true,
			fit : true,
			iconCls : node.iconCls
		};
		
		
		if (node.openMode == 'iframe') {
			opts.content = '<iframe src="'
					+ url
					+ '" frameborder="0" style="border:0;width:100%;height:99.5%;"></iframe>';
			addTab(opts);
		} else if (url) {
			opts.href = url;
			addTab(opts);
			
		}
	}

	function addCustomerTab(text, url, iconCls) {
		var opts = {
			title : text,
			border : false,
			closable : true,
			fit : true,
			iconCls : iconCls
		};

		opts.href = url;
		addTab(opts);
	}
</script>
</head>
<body>
	<div id="loading"
		style="position: fixed; top: -50%; left: -50%; width: 230%; height: 200%; background: #fff; z-index: 100; overflow: hidden;">
		<img src="${ctxStatic }/style/images/ajax-loader.gif"
			style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto;" />
	</div>
	<div id="index_layout">


		<div data-options="region:'north',border:false"
			style="overflow: hidden;background: ${ctxStatic }/style/images/hd_bg.png;"
			class="header">
			<div class="logo">
				<a href="#"><img src="${ctxStatic }/style/images/logo.png"
					alt="智慧司法"></a>
			</div>
			<!--<div class="hr"><a href="#"><i class="icon-lock"></i>修改密码</a><a href="#"><i class="icon-signout"></i>安全退出</a></div>-->
			<div class="hr">
				<span>${fns:getSysAccount().groupName }，${fns:getSysAccount().roleName }，${fns:getSysAccount().accountname }<i
					class="icon-sort-down"></i></span>
				<ul style="display: none">
					<li><a href="javascript:void(0)" onclick="editUserPwd()"><i
							class="icon-lock"></i>修改密码</a></li>
					<li><a href="javascript:void(0)" onclick="logout()"><i
							class="icon-signout"></i>安全退出</a></li>
				</ul>
			</div>

			<%-- <div class="logo">
				<a href="#"><img src="${ctxStatic }/style/images/logo.png"
					alt="智慧司法"></a>
			</div>


			<div class="hr">
				<a href="javascript:void(0)" onclick="editUserPwd()"
					class="easyui-linkbutton" plain="true" icon="fi-unlock icon-white">修改密码</a>
				<a href="javascript:void(0)" onclick="logout()"
					class="easyui-linkbutton" plain="true" icon="fi-x icon-">安全退出</a>
			</div> --%>

		</div>


		<div data-options="region:'west',split:true" title="菜单"
			style="width: 190px; overflow: hidden; overflow-y: auto; padding: 0px">
			<div class="easyui-accordion" style="border: left"
				data-options="fit:true,border:false">

				<%--  <c:forEach items="${fns:getSysPermissonList()}" var="sysPermission">				
				<div title="${sysPermission.name}" iconCls="${sysPermission.icon }">			
				  <c:if test="${not empty sysPermission.childSysPermisson }">
					<ul class="easyui-tree tree" style="border: left" data-options="fit:true,border:false,onClick:readNode">												
						<c:forEach items="${sysPermission.childSysPermisson }" var="childSysPermission">
						
						<li
						<c:if test="${empty childSysPermission.childSysPermisson  }">data-options="attributes:{'url':'${ctx}/${ childSysPermission.url}'}"</c:if>
							 iconCls="${childSysPermission.icon}"><span>${childSysPermission.name}</span>
							 <c:if test="${not empty childSysPermission.childSysPermisson  }">
							<ul>
								<c:forEach items="${childSysPermission.childSysPermisson }" var="thirdChildSysPermission">
								<li iconCls="${thirdChildSysPermission.icon}"
									data-options="attributes:{'url':'${ctx}/${ thirdChildSysPermission.url}'}">${thirdChildSysPermission.name}</li>
								</c:forEach>
							
							</ul>
							</c:if>
						</c:forEach>
					</ul>
					</c:if>
				</div>					
			</c:forEach>  --%>
			<c:if test="${(fns:getSysAccount()).roleId == 'kqxt'}">
				<div title="系统管理" iconCls="fi-layout">
					<ul class="easyui-tree tree" style="border: left"
						data-options="fit:true,border:false,onClick:readNode">
						<li iconCls="fi-book icon-blue"
							data-options="attributes:{'url':'${ctx}/sys/biaoge/list'}"><span>考勤统计表合成</span>
							<ul>
								<li iconCls="fi-magnifying-glass icon-blue"
									data-options="attributes:{'url':'${ctx}/sys/biaoge/list1'}">统计结果表查询</li>
								<li iconCls="fi-magnifying-glass icon-blue"
									data-options="attributes:{'url':'${ctx}/sys/biaoge/list2'}">请休假表查询</li>
								<li iconCls="fi-magnifying-glass icon-blue"
									data-options="attributes:{'url':'${ctx}/sys/biaoge/list3'}">考勤统计表查询</li>
							</ul>
						</li>
					</ul>
				</div>
			</c:if>
			<c:if test="${(fns:getSysAccount()).roleId != 'kqxt'}">
				<div title="首页" iconCls="fi-home">

					<ul class="easyui-tree tree" style="border: left"
						data-options="fit:true,border:false,onClick:readNode">
						<li iconCls="fi-shopping-bag icon-blue"><span>公文处理</span>
							<ul>
								<li iconCls="fi-mail icon-blue"
									data-options="attributes:{'url':'${ctx}/homepage/receipt/list'}">收件箱</li>
								<li iconCls="fi-social-amazon icon-blue"
									data-options="attributes:{'url':'${ctx}/homepage/sender/list'}">发件箱</li>
								<li iconCls="fi-trash icon-blue"
									data-options="attributes:{'url':'${ctx}/homepage/draft/list'}">草稿箱</li>
							</ul></li>
						<li iconCls="fi-megaphone icon-blue"
							data-options="attributes:{'url':'${ctx}/homepage/announcement/list'}">公告管理</li>

					</ul>

				</div>
				<div title="待办事项" iconCls="fi-lightbulb">

					<ul class="easyui-tree tree" style="border: left"
						data-options="fit:true,border:false,onClick:readNode">
						<li iconCls="fi-compass icon-blue"
							data-options="attributes:{'url':'${ctx}/homepage/examinationAndApproval/list'}">待审批事项</li>
						<%-- <li iconCls="fi-clock icon-blue"
							data-options="attributes:{'url':'${ctx}/todo/toBeProcessed/list'}">待处理事项</li> --%>
						<li iconCls="fi-clock icon-blue"
							data-options="attributes:{'url':'${ctx}/homepage/workRemind/list'}">待处理事项</li>
					</ul>
				</div>
				<div title="审前调查" iconCls="fi-page-csv">
					<ul class="easyui-tree tree" style="border: left"
						data-options="fit:true,border:false,onClick:readNode">
						<li iconCls="fi-magnifying-glass icon-blue"
							data-options="attributes:{'url':'${ctx}/investigate/list'}">审前调查</li>
					</ul>
				</div>
				<div title="入矫管理" iconCls="fi-page-csv">
					<ul class="easyui-tree tree" style="border: left"
						data-options="fit:true,border:false,onClick:readNode">
						<li iconCls="fi-social-google-plus icon-blue"
							data-options="attributes:{'url':'${ctx}/culpritinfo/culprit/list'}">首次报到</li>
						<li iconCls="fi-social-twitter icon-blue"
							data-options="attributes:{'url':'${ctx}/inculprit/exitEntryReport/list'}">出入境报备</li>
						<li iconCls="fi-archive icon-blue"
							data-options="attributes:{'url':'${ctx}/culprit/moveIn/forList'}">迁入管理</li>
					</ul>
				</div>
				<div title="日常管理" iconCls="fi-results-demographics">
					<ul class="easyui-tree tree" style="border: left"
						data-options="fit:true,border:false,onClick:readNode">
						<li iconCls="fi-results icon-blue"
							data-options="attributes:{'url':'${ctx}/dailymgr/fileManagement/list'}">档案管理</li>
						<li iconCls="fi-thumbnails icon-blue"><span>分类管理</span>
							<ul>
								<li iconCls="fi-shield icon-blue"
									data-options="attributes:{'url':'${ctx}/dailymgr/gradeChange/list'}">监管等级</li>
								<li iconCls="fi-at-sign icon-blue"
									data-options="attributes:{'url':'${ctx}/dailymgr/dailyReport/list'}">日常报到</li>
								<li iconCls="fi-telephone icon-blue"
									data-options="attributes:{'url':'${ctx}/dailymgr/mobileReport/list'}">电话报到</li>
								<li iconCls="fi-sheriff-badge icon-blue"
									data-options="attributes:{'url':'${ctx}/dailymgr/thinkReport/list'}">思想汇报</li>
								<li iconCls="fi-torsos-female-male icon-blue"
									data-options="attributes:{'url':'${ctx}/dailymgr/talk/list'}">谈话教育</li>
								<li iconCls="fi-foot icon-blue"
									data-options="attributes:{'url':'${ctx}/dailymgr/interview/list'}">走访登记</li>
								<li iconCls="fi-no-smoking icon-blue"
									data-options="attributes:{'url':'${ctx}/dailymgr/study/list'}">学习教育</li>
								<li iconCls="fi-target icon-blue"
									data-options="attributes:{'url':'${ctx}/dailymgr/workfree/list'}">社区服务</li>
							</ul></li>
						<li iconCls="fi-monitor icon-blue"><span>信息化管理</span>
							<ul>
								<li iconCls="fi-microphone icon-blue"
									data-options="attributes:{'url':'${ctx}/dailymgr/callRegister/list'}">声纹采集</li>
								<li iconCls="fi-sound icon-blue"
									data-options="attributes:{'url':'${ctx}/dailymgr/callCheck/list'}">声纹识别</li>
							</ul></li>
						<li iconCls="fi-price-tag icon-blue"
							data-options="attributes:{'url':'${ctx}/dailymgr/askLeave/list'}">请销假管理</li>
						<li iconCls="fi-elevator icon-blue"
							data-options="attributes:{'url':'${ctx}/dailymgr/helpDifficulty/list'}">帮困解难</li>
						<li iconCls="fi-annotate icon-blue"
							data-options="attributes:{'url':'${ctx}/dailymgr/specialArea/list'}">进入特定区域管理</li>
						<li iconCls="fi-social-zerply icon-blue"
							data-options="attributes:{'url':'${ctx}/dailymgr/outOfPrison/list'}">延长监外执行</li>
						<li iconCls="fi-torsos-all icon-blue"
							data-options="attributes:{'url':'${ctx}/dailymgr/inspection/list'}">集中点验</li>
					</ul>
				</div>
				<div title="考核奖惩" iconCls="fi-trophy">
					<ul class="easyui-tree tree" style="border: left"
						data-options="fit:true,border:false,onClick:readNode">
						<li iconCls="fi-pricetag-multiple icon-blue"><span>违纪处理</span>
							<ul>
								<li iconCls="fi-alert icon-blue"
									data-options="attributes:{'url':'${ctx}/rewardspunishment/verbalWarning/list'}">口头警告</li>
								<li iconCls="fi-crown icon-blue"
									data-options="attributes:{'url':'${ctx}/rewardspunishment/commend/list'}">表扬</li>
								<li iconCls="fi-alert icon-blue"
									data-options="attributes:{'url':'${ctx}/rewardspunishment/warning/list'}">警告</li>
								<li iconCls="fi-die-one icon-blue"
									data-options="attributes:{'url':'${ctx}/rewardspunishment/securityPunishment/list'}">提请治安管理处罚</li>
								<li iconCls="fi-die-two icon-blue"
									data-options="attributes:{'url':'${ctx}/rewardspunishment/revokeProbation/list'}">提请撤销缓刑</li>
								<li iconCls="fi-die-three icon-blue"
									data-options="attributes:{'url':'${ctx}/rewardspunishment/revokeParole/list'}">提请撤销假释</li>
								<li iconCls="fi-die-four icon-blue"
									data-options="attributes:{'url':'${ctx}/rewardspunishment/revokeOutOfPrison/list'}">提请撤销暂予监外执行</li>
								<li iconCls="fi-checkbox icon-blue"
									data-options="attributes:{'url':'${ctx}/rewardspunishment/noDeal/list'}">待处理不作处理</li>
							</ul></li>
						<%-- <li iconCls="fi-braille icon-blue" state="closed"><span>其他行政处罚</span>
							<ul>
								<li iconCls="fi-alert icon-blue"
									data-options="attributes:{'url':'${ctx}/rewardspunishment/administrativeWarning/list'}">行政警告</li>
								<li iconCls="fi-yen icon-blue"
									data-options="attributes:{'url':'${ctx}/rewardspunishment/administrativePenalty/list'}">行政罚款</li>
								<li iconCls="fi-lock icon-blue"
									data-options="attributes:{'url':'${ctx}/rewardspunishment/administrativeDetention/list'}">行政拘留</li>
							</ul></li> --%>
						<li iconCls="fi-minus-circle icon-blue"
							data-options="attributes:{'url':'${ctx}/rewardspunishment/reducePenalty/list'}">减刑</li>
						<li iconCls="fi-trees icon-blue"
							data-options="attributes:{'url':'${ctx}/rewardspunishment/parole/list'}">假释</li>
						<li iconCls="fi-social-skillshare icon-blue"
							data-options="attributes:{'url':'${ctx}/rewardspunishment/monthlyPerformance/list'}">月度考核评议</li>
					</ul>
				</div>
				<div title="矫正终止" iconCls="fi-key">
					<ul class="easyui-tree tree" style="border: left"
						data-options="fit:true,border:false,onClick:readNode">
						<li iconCls="fi-universal-access icon-blue"
							data-options="attributes:{'url':'${ctx}/endcorrect/outof/list'}">迁出管理</li>
						<li iconCls="fi-social-rdio icon-blue"
							data-options="attributes:{'url':'${ctx}/endcorrect/detached/list'}">脱管管理</li>
						<li iconCls="fi-annotate icon-blue"
							data-options="attributes:{'url':'${ctx}/endcorrect/imprison/list'}">收监执行</li>
						<li iconCls="fi-skull icon-blue"
							data-options="attributes:{'url':'${ctx}/endcorrect/death/list'}">死亡登记</li>
						<li iconCls="fi-stop icon-blue"
							data-options="attributes:{'url':'${ctx}/endcorrect/redressStop/list'}">特殊原因终止矫正</li>
						<li iconCls="fi-rewind-ten icon-blue"
							data-options="attributes:{'url':'${ctx}/endcorrect/recidivismPerhaps/list'}">涉嫌重新犯罪</li>
						<li iconCls="fi-loop icon-blue"
							data-options="attributes:{'url':'${ctx}/endcorrect/recidivism/list'}">重新犯罪</li>
						<li iconCls="fi-filter icon-blue"
							data-options="attributes:{'url':'${ctx}/endcorrect/omittedCrime/list'}">漏罪</li>
						<li iconCls="fi-strikethrough icon-blue"
							data-options="attributes:{'url':'${ctx}//endcorrect/redressResume/list'}">特殊原因恢复矫正</li>
						<li iconCls="fi-alert icon-blue"
							data-options="attributes:{'url':'${ctx}/endcorrect/rewardspunishment/list'}">矫正终止到期警示</li>
						<li iconCls="fi-clock icon-blue"
							data-options="attributes:{'url':'${ctx}/endcorrect/finishRedress/list'}">期满解矫</li>
					</ul>
				</div>
				<div title="监控管理" iconCls="fi-map">
					<ul class="easyui-tree tree" style="border: left"
						data-options="fit:true,border:false,onClick:readNode">
						<li iconCls="fi-target-two icon-blue"
							data-options="attributes:{'url':'${ctx}/monitoring/terminalActivity/list'}">位置监控</li>
						<li iconCls="fi-alert icon-blue"
							data-options="attributes:{'url':'${ctx}/monitoring/overAlarm/list'}">越界警告</li>
						<li iconCls="fi-social-orkut icon-blue"
							data-options="attributes:{'url':'${ctx}/monitoring/terminalArea/list'}">电子围栏</li>
						<li iconCls="fi-share icon-blue"
							data-options="attributes:{'url':'${ctx}/monitoring/locationhis/list'}">定位记录</li>
						<li iconCls="fi-share icon-blue"
							data-options="attributes:{'url':'${ctx}/monitoring/drift/list'}">定位漂移</li>
						<li iconCls="fi-marker icon-blue"
							data-options="attributes:{'url':'${ctx}/monitoring/terminal/list'}">定位绑定</li>

					</ul>
				</div>
				<div title="统计查询" iconCls="fi-graph-bar">
					<ul class="easyui-tree tree" style="border: left"
						data-options="fit:true,border:false,onClick:readNode">
						<li iconCls="fi-graph-pie icon-blue"
									data-options="attributes:{'url':'${ctx}/statistics/chart/manage'}">矫正对象层级统计（图表）</li>
						<li iconCls="fi-graph-bar icon-blue"
							data-options="attributes:{'url':'${ctx}/statistics/culpritStatusTj/list'}">社区矫正人员情况统计表（月表）</li>
						<li iconCls="fi-graph-horizontal icon-blue"
							data-options="attributes:{'url':'${ctx}/statistics/culpritWorkTj/list'}">社区矫正工作统计表（季表）</li>
						<li iconCls="fi-book-bookmark icon-blue"
							data-options="attributes:{'url':'${ctx}/culprit/culpritLaw/list'}">执法文书登记</li>
					</ul>
				</div>
				<div title="公安核查核对" iconCls="fi-database">
					<ul class="easyui-tree tree" style="border: left"
						data-options="fit:true,border:false,onClick:readNode">
						<li iconCls="fi-arrows-compress icon-blue"
							data-options="attributes:{'url':'${ctx}/policeCheck/exceptionInfo/traceList'}">轨迹异常</li>
						<li iconCls="fi-arrows-expand icon-blue"
							data-options="attributes:{'url':'${ctx}/policeCheck/exceptionInfo/actionList'}">行为异常</li>
					</ul>
				</div>
				<div title="流程管理" iconCls="fi-layout">
					<ul class="easyui-tree tree" style="border: left"
						data-options="fit:true,border:false,onClick:readNode">
						<li iconCls="icon-cale"
							data-options="attributes:{'url':'${ctx}/flow/deployProcess'}">流程定义部署</li>
						<li iconCls="icon-conf"
							data-options="attributes:{'url':'${ctx}/flow/queryProcessDefinition'}">流程定义查询</li>
						<li iconCls="icon-cale"
							data-options="attributes:{'url':'${ctx}/dailymgr/askLeave/queryActivityAskLeave'}">当前运行流程</li>
						<li iconCls="icon-cale"
							data-options="attributes:{'url':'${ctx}/dailymgr/askLeave/activityAskLeaveList'}">请假处理</li>
						<li iconCls="icon-conf"
							data-options="attributes:{'url':'${ctx}/dailymgr/askLeave/queryHistoryTask'}">结束流程</li>
					</ul>
				</div>
				<div title="资料中心" iconCls="fi-elevator">
					<ul class="easyui-tree tree" style="border: left"
						data-options="fit:true,border:false,onClick:readNode">
						<li iconCls="fi-pencil"
							data-options="attributes:{'url':'${ctx}/datacenter/regulations/list'}">法侓法规</li>
						<li iconCls="fi-pencil"
							data-options="attributes:{'url':'${ctx}/datacenter/systemFile/list'}">制度文件</li>
						<li iconCls="fi-at-sign"
							data-options="attributes:{'url':'${ctx}/datacenter/softwareDownload/list'}">软件下载</li>
					</ul>
				</div>
				<div title="系统管理" iconCls="fi-layout">
					<ul class="easyui-tree tree" style="border: left"
						data-options="fit:true,border:false,onClick:readNode">
						<li iconCls="fi-torsos-all icon-blue"
							data-options="attributes:{'url':'${ctx}/sys/sysPerson/list'}">人员管理</li>
						<li iconCls="fi-torsos-all icon-blue"
							data-options="attributes:{'url':'${ctx}/sys/sysAccount/list'}">账号管理</li>
						<li iconCls="fi-torso-business icon-blue"
							data-options="attributes:{'url':'${ctx}/sys/sysRole/list'}">角色管理</li>
						<li iconCls="fi-database icon-blue"
							data-options="attributes:{'url':'${ctx}/sys/sysPermisson/list'}">资源管理</li>
						<li iconCls="fi-results-demographics icon-blue"
							data-options="attributes:{'url':'${ctx}/sys/sysGroup/list'}">部门管理</li>
						<li iconCls="fi-thumbnails icon-blue"
							data-options="attributes:{'url':'${ctx}/sys/sysDic/list'}">数据字典管理</li>
						<li iconCls="fi-calendar icon-blue"
							data-options="attributes:{'url':'${ctx}/sys/holiday/list'}">节假日管理</li>
						<li iconCls="fi-tablet-portrait"
							data-options="attributes:{'url':'${ctx}/sys/ifaceMachine/list'}">设备管理</li>
						<li iconCls="fi-database icon-blue"
							data-options="attributes:{'url':'${ctx}/sys/ifaceRecord/list'}">考勤记录</li>
						<li iconCls="fi-photo icon-blue"
							data-options="attributes:{'url':'${ctx}/icons.html'}">系统图标</li>
						<li iconCls="fi-clipboard-notes icon-blue"
							data-options="attributes:{'url':'${ctx}/sys/sysLog/list'}">日志管理</li>
						<%-- <li iconCls="fi-target icon-blue"
							data-options="attributes:{'url':'${ctx}/sys/spLocation/list'}">粗定位查询</li>
						<li iconCls="fi-target-two icon-blue"
							data-options="attributes:{'url':'${ctx}/sys/bxLocation/list'}">北向定位查询</li> --%>
						<li iconCls="fi-target icon-blue"
							data-options="attributes:{'url':'${ctx}/sys/locationtest/list'}">定位测试</li>
						<li iconCls="fi-book icon-blue"
							data-options="attributes:{'url':'${ctx}/sys/biaoge/list'}"><span>考勤统计表合成</span>
							<ul>
								<li iconCls="fi-magnifying-glass icon-blue"
									data-options="attributes:{'url':'${ctx}/sys/biaoge/list1'}">统计结果表查询</li>
								<li iconCls="fi-magnifying-glass icon-blue"
									data-options="attributes:{'url':'${ctx}/sys/biaoge/list2'}">请休假表查询</li>
								<li iconCls="fi-magnifying-glass icon-blue"
									data-options="attributes:{'url':'${ctx}/sys/biaoge/list3'}">考勤统计表查询</li>
							</ul>
						</li>
							
					</ul>
				</div>
			</c:if>
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
		</div>
		<div data-options="region:'center'" style="overflow: hidden;">
			<div id="index_tabs" style="overflow: hidden;">
				<div title="首页" data-options="iconCls:'fi-home',border:false"
					style="overflow: hidden;"></div>
			</div>
		</div>
		<div data-options="region:'south',border:false"
			style="height: 30px; line-height: 30px; overflow: hidden; text-align: center; background-color: #eee">
			${fns:getConfig('companyName') }&nbsp;&nbsp;&nbsp;&nbsp;${fns:getConfig('techAssistPhone') }
		</div>
	</div>
	<div id="tabsMenu">
		<div data-options="iconCls:'fi-loop'" type="refresh"
			style="font-size: 12px;">刷新</div>
		<div class="menu-sep"></div>
		<div data-options="iconCls:'fi-x'" type="close"
			style="font-size: 12px;">关闭</div>
		<div data-options="iconCls:''" type="closeOther">关闭其他</div>
		<div data-options="iconCls:''" type="closeAll">关闭所有</div>
	</div>

	<!--[if lte IE 7]>
    <div id="ie6-warning"><p>您正在使用 低版本浏览器，在本页面可能会导致部分功能无法使用。建议您升级到 <a href="http://www.microsoft.com/china/windows/internet-explorer/" target="_blank">Internet Explorer 8</a> 或以下浏览器：
    <a href="http://www.mozillaonline.com/" target="_blank">Firefox</a> / <a href="http://www.google.com/chrome/?hl=zh-CN" target="_blank">Chrome</a> / <a href="http://www.apple.com.cn/safari/" target="_blank">Safari</a> / <a href="http://www.operachina.com/" target="_blank">Opera</a></p></div>
    <![endif]-->
	<style>
/*ie6提示*/
#ie6-warning {
	width: 100%;
	position: absolute;
	top: 0;
	left: 0;
	background: #fae692;
	padding: 5px 0;
	font-size: 12px
}

#ie6-warning p {
	width: 960px;
	margin: 0 auto;
}
</style>
</body>
</html>