<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<style type="text/css">
#container {
	height: 100%
}
.amap-info{
	width:360px;
}
.info-table:hover{
	box-shadow: 0px 0px 14px #0CF;
}
.info-table{
	font: 12px;background-color: white;box-shadow: 0 3px 14px rgba(0,0,0,.75);padding: 5px;border-radius: 4px;
}
.info-title {
    color: white;
    font-size: 14px;
    background-color:blue;
    line-height: 26px;
    padding: 0px 0 0 6px;
    font-weight: lighter;
    letter-spacing: 1px
}
.info-content {
    font: 12px Helvetica, 'Hiragino Sans GB', 'Microsoft Yahei', '微软雅黑', Arial;
    padding: 4px;
    color: #666666;
    line-height: 23px;
}
.amap-info-content{
	paddin:0px 18px 10px 10px !important;
	/* amap-info-content */
}
#maptop2 {
	background: linear-gradient(#dedede, #f6f6f6);
	padding: 0 10px;
	border: 1px solid silver;
	position: absolute;
	font-size: 12px;
	border-radius: 3px;
	line-height: 20px;
}

.bigrounded {
    -webkit-border-radius: 2em;  
    -moz-border-radius: 2em;  
    border-radius: 2em;  
}  
.medium {  
    font-size: 12px;
    padding: .4em 1.5em .42em;  
}  
.small {  
    font-size: 11px;
    padding: .2em 1em .275em;  
} 
.button {  
    display: inline-block;  
    zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */  
    *display: inline;  
    vertical-align: baseline;  
    margin: 0 2px;  
    outline: none;  
    cursor: pointer;  
    text-align: center;  
    text-decoration: none;  
    padding: 5px 10px;  
    -webkit-border-radius: .5em;   
    -moz-border-radius: .5em;  
    border-radius: .5em;  
    -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);  
    -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);  
    box-shadow: 0 1px 2px rgba(0,0,0,.2);  
}  
.button:hover {  
    text-decoration: none;  
}  
.button:active {  
    position: relative;  
    top: 1px;  
} 
.white {  
    color: #000000;  
    border: solid 1px #b7b7b7;  
    background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ededed));  
    background: -moz-linear-gradient(top,  #fff,  #ededed);  
    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#ededed');  
}  
.white:hover {  
    background: #ededed;  
    background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));  
    background: -moz-linear-gradient(top,  #fff,  #dcdcdc);  
    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#dcdcdc');  
}  
.white:active {  
    color: #999;  
    background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#fff));  
    background: -moz-linear-gradient(top,  #ededed,  #fff);  
    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#ffffff');  
} 
</style>
<script type="text/javascript">
//var mapdata = new Array();
var t1 ;//定时变量
var refreshtime = 300;//刷新时间间隔
var datagridData = null;//人员信息数据
var reloadFlag = true;//是否统计标志
var oldArr=null;//已选择数据
var rowValue = null;
var oldRowValue = null;
var isEyeOpen = false;
var markergif;
var doc = document.getElementById("zztc");
doc.contextMenu = function() {
	return false;
}
var mouseTool, fdmouseTool, sxmouseTool;//测面工具,拉框放大工具,拉框缩小工具
var map, district, polygons = [], citycode;
var citySelect = document.getElementById('city');
var districtSelect = document.getElementById('district');
var markerArr = new Array();
var eyemarkerArr = new Array();
var hisMarkerArr = new Array();
map = new AMap.Map("container");
map.setZoomAndCenter(9, [ 109.414186, 24.315553 ]);

//地图缩放
/* var pathMarkerArr = new Array();
var pathContentArr = new Array();
map.on("zoomchange",function(){
	drawMapForData();
}) */
//
var pointArr = new Array();
AMap.plugin([ 'AMap.ToolBar', 'AMap.Scale', 'AMap.OverView', 'AMap.MapType' ],function() {
	map.addControl(new AMap.MapType());
	map.addControl(new AMap.Scale());
	map.addControl(new AMap.ToolBar());
});

$("document").ready(function() {
	$('#hisitem').click(function() {
		if (oldRowValue != null) {
			var currentTab = index_tabs.tabs('getTab', oldRowValue.culpritName + '历史轨迹');
			var currentTabIndex = index_tabs.tabs('getTabIndex', currentTab);
			index_tabs.tabs('close', currentTabIndex);
		}
		findHisrory(rowValue.mobileNumber,rowValue.culpritName);
	});
});

//关闭信息窗体
 function closeInfoWindow(){
	 map.clearInfoWindow();
 }

$('#cul_list_content').datagrid({
	onLoadSuccess: function(data) {
		selectPreData();
	},
	loadFilter : function(data) {
		var datarows = data.rows;
		if (!reloadFlag) {
			reloadFlag = true;
			return data;
		}
		initForLive();
		for (var i = 0; i < datarows.length; i++) {
			$('#allpeople').text('总数:' + datarows.length);
			if (datarows[i].isLive == '关机') {
				var text = $('#shutdown').text();
				var num = text.replace('关机:', '');
				num = num - 0 + 1;
				$('#shutdown').text('关机:' + num);
			}
			if (datarows[i].isLive == '停机') {
				var text = $('#stop').text();
				var num = text.replace('停机:', '');
				num = num - 0 + 1;
				$('#stop').text('停机:' + num);
			}
			if (datarows[i].isLive == '在线') {
				var text = $('#online').text();
				var num = text.replace('在线:', '');
				num = num - 0 + 1;
				$('#online').text('在线:' + num);
			}
			if (datarows[i].isLive == '掉线') {
				var text = $('#dropped').text();
				var num = text.replace('掉线:', '');
				num = num - 0 + 1;
				$('#dropped').text('掉线:' + num);
			}
			if (datarows[i].isLive == '呼叫转移') {
				var text = $('#hjzy').text();
				var num = text.replace('呼叫转移:', '');
				num = num - 0 + 1;
				$('#hjzy').text('呼叫转移:' + num);
			}
			if (datarows[i].isLive == '网络异常') {
				var text = $('#wlyc').text();
				var num = text.replace('网络异常:', '');
				num = num - 0 + 1;
				$('#wlyc').text('网络异常:' + num);
			}
			if (datarows[i].isLive == '未开通') {
				var text = $('#wkt').text();
				var num = text.replace('未开通:', '');
				num = num - 0 + 1;
				$('#wkt').text('未开通:' + num);
			}
		}
		datagridData = data;
		return data;
	},
	onSelect : function(index, row) {
		closeInfoWindow();
		if (row.mobileNumber != null) {
			$.ajax({
				type : "post",
				url : "${ctx}/monitoring/terminalActivity/findTerminalActivity",
				data : {
					mobileNumber : row.mobileNumber
				},
				async : false,
				dataType : "json",
				success : function(data) {
					if (data != null && data != "") {
						// 在第1行的位置插入一个新行
						$('#act_list_content').datagrid('insertRow',{
							index : 0, // 索引从0开始
							row : {
								lonReal : data.lonReal,
								latReal : data.latReal,
								power : data.power,
								id : data.id,
								culpritName : data.culpritName,
								mobileNumber : data.mobileNumber,
								type : data.type,
								locationType : data.locationType,
								isLive : data.isLive,
								gpstime : Common.formatDate(data.gpstime),
								location : data.location
							}
						});
						var p = $("#ssgj").layout("panel", "south")[0].clientWidth;
						if (p <= 0) {
							$("#ssgj").layout("expand","south");
						}
					}

					if (data.id != null) {
						if (data.lonReal == '0' && data.latReal == '0') {
							$.messager.show({
								title : '提示信息!',
			   					msg : '该矫正对象无当前定位信息'
							});
						}
						else {
							var point1 = new AMap.LngLat(data.lonReal,data.latReal);
							marker = new AMap.Marker({
								position : point1,
								icon : new AMap.Icon({
									image : '${ctxStatic}/style/images/0202.png'
								}),
								offset : new AMap.Pixel(-12, -20)
							});
							if (markergif != null) {
								markergif.hide();
							}
							markergif = new AMap.Marker({
								position : point1,
								icon : new AMap.Icon({
									image : '${ctxStatic}/style/images/5555.gif'
								}),
								offset : new AMap.Pixel(-17, -20),
								map : map
							});
							marker.setLabel({//label默认蓝框白底左上角显示，样式className为：amap-marker-label
								offset : new AMap.Pixel(-10, 25),//修改label相对于maker的位置
								content : row.culpritName
							});
							marker.on("click",function() {
								if (markergif != null) {
									markergif.hide();
								}
								markergif = new AMap.Marker({
									position : point1,
									icon : new AMap.Icon({
										image : '${ctxStatic}/style/images/5555.gif'
									}),
									zIndex : 20,
									offset : new AMap.Pixel(-17, -20),
									map : map
								});
								var infoWindow = new AMap.InfoWindow({ 
									isCustom:true,  //使用自定义窗体
									content : resultInfo(data),
									offset:new AMap.Pixel(20, -44)
								});
								infoWindow.open(map, point1);
								
							});
							map.panTo(point1);
							marker.setMap(map);
							marker.setAnimation('AMAP_ANIMATION_DROP');
							markerArr[data.mobileNumber] = marker;
							map.setFitView();
						}
					}
				},
				error : function(XMLHttpRequest,textStatus, errorThrown) {
					$.messager.show({
						title : '提示信息!',
						msg : row.culpritName + '对象定位数据不存在！'
					});
				}
			});
		}
	},
	onUnselect : function(index, row) {
		closeInfoWindow();
		if (markerArr[row.mobileNumber] != null) {
			markerArr[row.mobileNumber].setMap(null);
		}
		if (markergif != null) {
			markergif.hide();
		}
		if (row.mobileNumber != null && markerArr[row.mobileNumber] != null) {//暂用markerArr[row.mobileNumber]来判断是否存在该点，即该对象绑定终端后是否有第一次定位数据传过来
			var arr = $('#cul_list_content').datagrid('getSelections');
			var marr = "";
			for (var i = 0; i < arr.length; i++) {
				var mob = arr[i].mobileNumber;
				marr = marr + mob + ",";
			}
			if (marr != "" && marr != null) {
				marr = marr.substring(0, marr.length - 1);
			}
			
			$("#act_list_content").datagrid('reload', {
				mobileNumbers : marr
			});
		}
	},
	onCheckAll : function(rows) {
		closeInfoWindow();
		
		for (var i = 0; i < rows.length; i++) {
			if (rows[i].mobileNumber != null) {
				$.ajax({
					type : "post",
					url : "${ctx}/monitoring/terminalActivity/findTerminalActivity",
					data : {
						mobileNumber : rows[i].mobileNumber
					},
					async : true,
					dataType : "json",
					success : function(data) {
						if (data != null && data != "") {
							// 在第1行的位置插入一个新行
							$('#act_list_content').datagrid('insertRow',{
								index : 0, // 索引从0开始
								row : {
									lonReal : data.lonReal,
									latReal : data.latReal,
									power : data.power,
									id : data.id,
									culpritName : data.culpritName,
									mobileNumber : data.mobileNumber,
									type : data.type,
									locationType : data.locationType,
									isLive : data.isLive,
									gpstime : data.gpstime,
									location : data.location
								}
							});
							var p = $("#ssgj").layout("panel","south")[0].clientWidth;
							if (p <= 0) {
								$("#ssgj").layout("expand","south");
							}
						}
						
						/* var tempmapdata = new Array();
						data.maxlon = data.lonReal;
						data.minlon = data.lonReal;
						data.maxlat = data.latReal;
						data.minlat = data.latReal;
						data.count = 1; 
						mapdata.push(data); */
						
						if (data.id != null) {
							 var point1 = new AMap.LngLat(data.lonReal,data.latReal);
							marker = new AMap.Marker({
								position : point1,
								icon : new AMap.Icon({
									image : '${ctxStatic}/style/images/0202.png'
								}),
								offset : new AMap.Pixel(-12,-20)
							});
							if (markergif != null) {
								markergif.hide();
							}
							markergif = new AMap.Marker({
								position : point1,
								icon : new AMap.Icon(
								{
									image : '${ctxStatic}/style/images/5555.gif'
								}),
								offset : new AMap.Pixel(-17, -20),
								map : map
							});
							marker.setLabel({//label默认蓝框白底左上角显示，样式className为：amap-marker-label
								offset : new AMap.Pixel(-10, 25),//修改label相对于maker的位置
								content : data.culpritName
							});
							marker.on("click",function() {
								if (markergif != null) {
									markergif.hide();
								}
								markergif = new AMap.Marker({
									position : point1,
									icon : new AMap.Icon({
										image : '${ctxStatic}/style/images/5555.gif'
									}),
									zIndex : 20,
									offset : new AMap.Pixel(-17, -20),
									map : map
								});
								var infoWindow = new AMap.InfoWindow({ 
									isCustom:true,  //使用自定义窗体
									content : resultInfo(data),
									offset:new AMap.Pixel(20, -44)
								});
								infoWindow.open(map, point1);
								
							});
							map.panTo(point1);
							marker.setMap(map);
							marker.setAnimation('AMAP_ANIMATION_DROP');
							markerArr[data.mobileNumber] = marker;
							map.setFitView(); 
						}

					},
					error : function(
							XMLHttpRequest,
							textStatus, errorThrown) {
						return;
					}
				});
			}
		}

		//drawMapForData();
	},
	onUncheckAll : function() {
		//mapdata = new Array();//清除已选数据
		clearWithMap();
	},
	onRowContextMenu : function(e, index, row) {
		$('#mm').menu('show', {left : e.pageX,top : e.pageY});

		if (rowValue != null) {
			oldRowValue = rowValue;
		}
		rowValue = row;

		e.preventDefault();
	}
});
function clearWithMap(){
	closeInfoWindow();
	$('#act_list_content').datagrid('loadData', {
		total : 0,
		rows : []
	});
	map.clearMap();
}
//历史轨迹查询框
function findHisrory(mobileNumber, culpritName) {
	var ver = Math.random();
	var url = '${ctx}/monitoring/terminalHistory/list?mobileNumber='+ mobileNumber + '&v=' + ver;
	var iconCls = "fi-pencil icon-blue";
	addCustomerTab(culpritName + "历史轨迹", url, iconCls);
}
//加载树  
$('#comboTree').combotree({
	url : '${ctx}/sys/sysGroup/loadGroupTree',
	onClick : function(node) {
		//单用户单击一个节点的时候，触发  
		$("input[name='groupId']").val(node.id);
	},
	checkbox : false,
	multiple : false
});
//js方法：序列化表单 			
function serializeForm(form) {
	var obj = {};
	$.each(form.serializeArray(), function(index) {
		if (obj[this['name']]) {
			obj[this['name']] = obj[this['name']] + ',' + this['value'];
		} else {
			obj[this['name']] = this['value'];
		}
	});
	return obj;
}

$('#culpritName').combobox({
	panelHeight : 'auto',
	panelMaxHeight : '200',
	mode : 'remote',
	valueField : 'culpritName',
	textField : 'culpritName',
	url : '${ctx}/monitoring/terminalActivity/list1',
	method : 'post',
	delay : 500
});
$('#mobileNumber').combobox({
	panelHeight : 'auto',
	panelMaxHeight : '200',
	mode : 'remote',
	valueField : 'mobileNumber',
	textField : 'mobileNumber',
	url : '${ctx}/monitoring/terminalActivity/listm',
	method : 'post',
	delay : 500
});
$('#name1').combobox({
	panelHeight : 'auto',
	panelMaxHeight : '200',
	mode : 'remote',
	valueField : 'culpritName',
	textField : 'culpritName',
	url : '${ctx}/monitoring/terminalActivity/list1',
	method : 'post',
	delay : 96
});
$('#mobileNumber1').combobox({
	panelHeight : 'auto',
	panelMaxHeight : '200',
	mode : 'remote',
	valueField : 'mobileNumber',
	textField : 'mobileNumber',
	url : '${ctx}/monitoring/terminalActivity/listm',
	method : 'post',
	delay : 96
});

function searchCulprit() {
	clearWithMap();
	
	var tab = $('#tt').tabs('getSelected');
	var index = $('#tt').tabs('getTabIndex', tab);
	if (index == 0) {
		javascript: $('#cul_list_content').datagrid('load',$.serializeObject($('#terSearchForm')));
	} else {
		javascript: $('#cul_list_content').datagrid('load',$.serializeObject($('#terSearchForm1')));
	}

}
$("#rTool").click(function() {
	if (mouseTool != null) {
		mouseTool.close(true);
	}
	map.clearMap();
	map.plugin([ "AMap.RangingTool" ], function() {
		var ruler = new AMap.RangingTool(map);
		ruler.turnOn();
		AMap.event.addListener(ruler, "end", function(e) {
			ruler.turnOff();
		});

	});

});
$("#pTool").click(function() {
	if (mouseTool != null) {
		mouseTool.close(true);
	}
	map.clearMap();
	//在地图中添加MouseTool插件
	map.plugin([ "AMap.MouseTool" ], function() {
		mouseTool = new AMap.MouseTool(map);
		//鼠标工具插件添加draw事件监听
		AMap.event.addListener(mouseTool, "draw", function callback(e) {
			var eObject = e.obj;//obj属性就是鼠标事件完成所绘制的覆盖物对象。
		});
		mouseTool.measureArea(); //调用鼠标工具的面积量测功能
	});
});
$("#fdTool").click(function() {
	if (mouseTool != null) {
		mouseTool.close(true);
	}
	map.clearMap();
	var rectOptions = {
		strokeStyle : "dashed",
		strokeColor : "#FF33FF",
		fillColor : "#FF99FF",
		fillOpacity : 0.5,
		strokeOpacity : 1,
		strokeWeight : 2
	};
	map.plugin([ "AMap.MouseTool" ], function() {
		mouseTool = new AMap.MouseTool(map);
		//通过rectOptions更改拉框放大时鼠标绘制的矩形框样式
		mouseTool.rectZoomIn(rectOptions);
	});
});
$("#sxTool").click(function() {
	if (mouseTool != null) {
		mouseTool.close(true);
	}
	map.clearMap();
	//在地图中添加MouseTool插件
	var rectOptions = {
		strokeStyle : "dashed",
		strokeColor : "#FF33FF",
		fillColor : "#FF99FF",
		fillOpacity : 0.5,
		strokeOpacity : 1,
		strokeWeight : 2
	};
	map.plugin([ "AMap.MouseTool" ], function() {
		mouseTool = new AMap.MouseTool(map);
		//通过rectOptions更改拉框放大时鼠标绘制的矩形框样式
		mouseTool.rectZoomOut(rectOptions);
	});
});
$("#tdTool").click(function() {
	if (mouseTool != null) {
		mouseTool.close(true);
	}
	map.clearMap();
});
var panorama = new BMap.Panorama('panorama');
panorama.setPosition(new BMap.Point(109.751383, 24.486472));
panorama.setPov({
	heading : -40,
	pitch : 6
});

$("#openqj").click(function() {
	var qjtext = $.trim($("#openqj").text());
	if (qjtext == "打开全景") {
		$("#ssgj").layout("expand", "east");
		$('#openqj').linkbutton({
			text : '关闭全景'
		});
	} else {
		$("#ssgj").layout("collapse", "east");
		$('#openqj').linkbutton({
			text : '打开全景'
		});
	}
});

Date.prototype.Format = function(fmt) { //author: meizz 
	var o = {
		"M+" : this.getMonth() + 1, //月份 
		"d+" : this.getDate(), //日 
		"h+" : this.getHours(), //小时 
		"m+" : this.getMinutes(), //分 
		"s+" : this.getSeconds(), //秒 
		"q+" : Math.floor((this.getMonth() - 0 + 3) / 3),
		"S" : this.getMilliseconds()
	//毫秒 
	};
	if (/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	for (var k in o)
		if (new RegExp("(" + k + ")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}
function startTime(){
	if (t1 != null && t1 != 'undefined') {
		window.clearInterval(t1); 
	}
	$('#sxsj').text(refreshtime);
	t1 = window.setInterval(function(){ 
		reloadTime();
	}, 1000);
}
function initForLive() {
	$('#allpeople').text('总数:0');
	$('#hjzy').text('呼叫转移:0');
	$('#wlyc').text('网络异常:0');
	$('#wkt').text('未开通:0');
	$('#shutdown').text('关机:0');
	$('#stop').text('停机:0');
	$('#online').text('在线:0');
	$('#dropped').text('掉线:0');
	startTime();
}
//刷新时间
function selectPreData(){
	if(oldArr!=null){
		var newArr = $('#cul_list_content').datagrid('getRows');
		for (var i = 0; i < newArr.length; i++) {
			for (var j = 0; j < oldArr.length; j++) {
				if (newArr[i].mobileNumber == oldArr[j].mobileNumber) {
					$('#cul_list_content').datagrid('selectRow',i);//选中数据
					break;
				}
			}
		}
		oldArr = null;
	}
}
function reloadTime(){
	var time = $('#sxsj').text().replace('', '');
	if (time == 0) {
		oldArr = $('#cul_list_content').datagrid('getSelections');//获取选中的数据
		if (oldArr.length == 0) {
			oldArr = null;
		}
		$('#cul_list_content').datagrid('load');	//刷新
		clearWithMap();	//清除地图上的标记
		
		startTime();
	}
	else {
		$('#sxsj').text(time-1);
	}
}
//打开人员详情
function fileManagementDetail(id) {
	parent.$.modalDialog({
		title : '档案详情',
		iconCls : 'fi-info icon-blue',
		width : sy.getBrowerWidth() - 250,
		height : sy.getBrowerHeight() - 150,
		resizable : true,
		maximizable : true,
		href : '${ctx}/dailymgr/fileManagement/detail?id=' + id
	});
}
//定位漂移反馈
function piaoyi(id) {
	parent.$.modalDialog({
		title : '定位漂移反馈',
		iconCls : 'fi-arrow-up icon-blue',
		width : 500,
		height : 730,
		href : '${ctx}/monitoring/terminalActivity/piaoyi?id=' + id,
		resizable : true,
		maximizable : true,
		buttons : [ {
			text : '上报',
			iconCls : 'fi-arrow-up icon-blue',
			handler : function() {
				var f = parent.$.modalDialog.handler.find('#piaoyiformAdd');
				f.submit();
			}
		}, {
			text : '关闭',
			iconCls : 'fi-x icon-blue',
			handler : function() {
				parent.$.modalDialog.handler.dialog('close');
			}
		} ]
	});
}
function actlocation(val, row, index) {
	var operation = '<a id = "actlocation' + row.id + '" onclick="showactlocation(\'' + row.id + '\',\'' + row.latReal + '\',\'' + row.lonReal + '\')"  >点击显示地址</a> ';
	return operation;
}
function showactlocation(rowid, latReal, lonReal) {
	if (latReal == '0' && lonReal == '0') {
		$("#actlocation" + rowid).text("无当前定位信息");
	}
	else {
		$.ajax({
			type : "post",
			url : "${ctx}/monitoring/terminalActivity/showactlocation",
			data : {
				latReal : latReal,
				lonReal : lonReal
			},
			dataType : "text",
			async : false,
			success : function(data) {
				$("#actlocation" + rowid).text(data);
			},
			error : function(result) {

			}
		});
	}
}
$('#act_list_content').datagrid({
	loadFilter : function(data) {
		var value = {  
	            total:data.total,  
	            rows:[]  
	    };  
		var datarows = data.rows;
		var x = 0;
		for (var i = 0; i < datarows.length; i++) {
			if (datarows[i].culpritName != '' && datarows[i].culpritName != null) {
				value.rows[x++] = datarows[i];
			}
		}
		return value;
	},
	onCheck : function(index, row) {
		closeInfoWindow();
		if (row.lonReal == '0' && row.latReal == '0') {
			$.messager.show({
				title : '提示信息!',
				msg : '该矫正对象无当前定位信息'
			});
		}
		else {
			var point1 = new AMap.LngLat(row.lonReal,row.latReal);
			marker = new AMap.Marker({
				position : point1,
				icon : new AMap.Icon({
					image : '${ctxStatic}/style/images/0202.png'
				}),
				offset : new AMap.Pixel(-12, -20)
			});
			if (markergif != null) {
				markergif.hide();
			}
			markergif = new AMap.Marker({
				position : point1,
				icon : new AMap.Icon({
					image : '${ctxStatic}/style/images/5555.gif'
				}),
				offset : new AMap.Pixel(-17, -20),
				map : map
			});
			marker.setLabel({//label默认蓝框白底左上角显示，样式className为：amap-marker-label
				offset : new AMap.Pixel(-10, 25),//修改label相对于maker的位置
				content : row.culpritName
			});
			
			marker.on("click",function() {
				if (markergif != null) {
					markergif.hide();
				}
				markergif = new AMap.Marker({
					position : point1,
					icon : new AMap.Icon({
						image : '${ctxStatic}/style/images/5555.gif'
					}),
					zIndex : 20,
					offset : new AMap.Pixel(-17, -20),
					map : map
				});
				var infoWindow = new AMap.InfoWindow({ 
					isCustom:true,  //使用自定义窗体
					content : resultInfo(row),
					offset:new AMap.Pixel(20, -44)
				});
				infoWindow.open(map, point1);
				
			});
			
			map.panTo(point1);
			if (markerArr[row.mobileNumber] != null) {
				markerArr[row.mobileNumber].setMap(null);
			}
			marker.setMap(map);
			marker.setAnimation('AMAP_ANIMATION_DROP');
			markerArr[row.mobileNumber] = marker;
			map.setFitView();
		}
	},
});


function filterForData(data,status){
	var value = {
        total: data.total,
        rows: []
    };
    var x = 0;
    for (var i = 0; i < data.rows.length; i++) {
        if (data.rows[i].isLive == status || status == '' || status == null) {
            value.rows[x++] = data.rows[i];
        }
    }
    return value;
}
function resultInfo(data){
	var date1 = new Date(Common.formatDate(data.gpstime).replace(new RegExp(/-/gm) ,"/")); //开始时间
	var date2 = new Date();
	var date3 = date2.getTime() - date1.getTime();//时间差的毫秒数
	var leave1 = date3 % (24 * 3600 * 1000); //计算天数后剩余的毫秒数
	var hours = Math.floor(date3 / (3600 * 1000));
	var leave2 = leave1 % (3600 * 1000); //计算小时数后剩余的毫秒数
	var minutes = Math.floor(leave2 / (60 * 1000));
	var stoptime = hours + "小时 " + minutes + "分钟";
	var typecontent = "";
	if (data.type == '定位手环') {
		var power = data.power;
		if (power != '充电中') {
			power = power.split('.')[0] + '%';
		}
		typecontent = "<span style='font-size:12px;margin-left:15px;' ><b>电量</b>：" + power + "</span>";
	}
	else if (data.type == '手机') {
		//var power = "";
		//typecontent = "<span style='font-size:12px'><b>呼转号码</b>:" + power + "</span>";
	}
	
	var info = "<table class='info-table' style=''>"
	+ "<tr style='height:30px;'><td colspan='4' style='border-bottom: 1px solid blue;'>"
	+ "<span style='margin-left:2px;font-size:15px;font-weight: bold;'>" + data.culpritName + "</span>"
	+ "<span style='float:right;margin:3px 5px 0px 0px;'><img src='${ctxStatic}/style/images/close2.gif' onclick='closeInfoWindow()' style='cursor:pointer;'></span>"
	+ "</td></tr>"
	+ "<tr><td colspan='3'>"
	+ "<table height='20px' style='border-top:2px' style='font:12px;'>"
	+ "<tr><td>"
	+ "<span style='font-size:12px'><b>定位号</b>：" + data.mobileNumber + "</span>"
	+ "</td></tr>"
	+ "<tr><td>"
	+ "<span style='font-size:12px'><b>定位方式</b>：" + sy.getDicValue('SF_TERMINAL_ACTIVITY', 'location_type', data.locationType, '') + "</span>"
	+ "</td></tr>"
	+ "<tr><td>"
	+ "<span style='font-size:12px'><b>状态</b>："+ data.isLive+ "</span>"+ typecontent
	+ "</td></tr>"
	+ "<tr><td>"
	+ "<span style='font-size:12px'><b>定位时间</b>："+ Common.formatDate(data.gpstime)+ "</span>"
	+ "</td></tr>"
	+ "<tr><td>"
	+ "<span style='font-size:12px'><b>当前位置停留</b>："+ stoptime+ "</span>"
	+ "</td></tr>"
	+ "</table></td>"
	+ "<td><table style='height:100px;width:80px' >"
	+ "<tr><td>"
	+ "<img style='border:1px' src='${filePath}/${data.image}' onerror='this.src=\"${ctxStatic}/style/images/defaultPeople1.png\"'/>"
	+ "</td></tr>"
	+ "</table></td></tr>"
	+ "<tr><td colspan='4'>"
	+ "<span style='font-size:12px;margin:auto 3px;'><b>定位地址</b>："+ data.location+ "</span>"
	+ "</td></tr>"
	+ "<tr><td colspan='1' style='padding:3px auto;'>"
	//+ "<input type='button' class='button white' onclick='fileManagementDetail(\""+ data.culpritId+ "\")' id='history' value='档案信息'/></td>&nbsp;"
	+ "<a id='history' href='#' class='button white small' onclick='fileManagementDetail(\""+ data.culpritId+ "\")' >档案信息</a></td>&nbsp;"
	+ "<td colspan='1' style='padding:3px auto;'>"
	//+ "<input type='button' id='history' onClick=findHisrory('"+ row.mobileNumber+ "','"+ row.culpritName+ "') value='轨迹回放' /></td>&nbsp;"
	+ "<a id='history' href='#' class='button white small' onclick='findHisrory(\""+ data.mobileNumber+ "\",\""+ data.culpritName+ "\")' >轨迹回放</a></td>&nbsp;"
	+ "<td colspan='2' style='padding:3px auto;'>"
	//+ "<input type='button' onclick='piaoyi(\""+ data.id+ "\")' value='定位漂移反馈'/>"
	+ "<a id='history' href='#' class='button white small' onclick='piaoyi(\""+ data.id+ "\")' >定位漂移反馈</a></td>&nbsp;"
	+ "</td></tr></table>"
	+ "<div style='text-align: center;height: 0px;width: 100%;clear: both;position: relative;'>"
	+ "<img src='${ctxStatic}/style/images/sharp.png'>"
	+ "</div></div>";
		
	return info;
}

$('#telLocation').click(function(){
	var arr = $('#cul_list_content').datagrid('getSelections');
	var marr = "";
	for (var i = 0; i < arr.length; i++) {
		var mob = arr[i].mobileNumber;
		marr = marr + mob + ",";
	}
	if (marr != "" && marr != null) {
		marr = marr.substring(0, marr.length - 1);
	}
	
	progressLoad();
	$.ajax({
		type : 'post',
		url : '${ctx}/monitoring/terminal/lzLocation',
		data : {tels:marr},
		dataType : 'json',
		async : false,
		success : function(result) {
        	progressClose();
        	if (result.status != 200) {
        		$.messager.show({
    				title : '提示信息',
    				msg : '系统错误，请联系管理员'
    			});
			}
        	$("#act_list_content").datagrid('reload', {
        		mobileNumbers : marr
        	});
		},
		error : function(result) {
        	progressClose();
        	$.messager.show({
				title : '提示信息',
				msg : '系统错误，请联系管理员'
			});
		}
	});
});

//timestamp转换date
var Common = {
  formatDate: function (value) {
      if (value == null || value == '') {
          return '';
      }
      var dt;
      if (value instanceof Date) {
          dt = value;
      } else {
          dt = new Date(value);
      }
      return dt.format("yyyy-MM-dd hh:mm:ss"); //扩展的Date的format方法(上述插件实现)
  }
}
</script>
<div id="godmap" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center'" class="easyui-layout" data-options="fit:true" id="zztc">
		<div data-options="region:'east',collapsed: false" collapsedContent="查询条件" style="width: 270px;">
			<div class="easyui-layout" data-options="fit:true,border:true">
				<!-- easyui-panel -->
				<div class="easyui-panel" data-options="region:'north',collapsed:false,collapsible:true" title="查询条件" 
					style="width: 100%;height: <c:if test="${fns:isLeafGroup(fns:getSysAccount().groupId) }">35</c:if><c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">55</c:if>%;">
					<div class="easyui-layout" data-options="fit:true,border:true">
						<div region="center" border="false">
							<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
							<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="cul_list_content" />
		       				</c:if>
							<div class="easyui-panel" data-options="border:false" id="p2" style="width:100%;">
								<div class="easyui-tabs" id='tt' data-options="region:'center'">
									<div title="传统模式" style="padding: 10px">
										<div style="height: 42%">
											<form id="terSearchForm">
												<table>
													<tr>
														<td class="search-title">矫正对象：</td>
														<td><input style="width: 165px;" id="culpritName" name="culpritName" class='easyui-textbox' prompt='矫正对象' data-options="valueField:'culpritName'" /></td>
													</tr>
													<tr>
														<td class="search-title">定位号码：</td>
														<td><input style="width: 165px;" id="mobileNumber" name="mobileNumber" class='easyui-textbox' prompt='定位号码' /></td>
													</tr>
													<tr>
														<td class="search-title">定位方式：</td>
														<td>
															<select style="width: 165px;" name="type" class='easyui-combobox' prompt='定位方式' data-options="panelHeight:'auto',panelMaxHeight:'200'">
																<option value="">全部</option>
																<option value='手机'>手机</option>
																<option value='定位手环'>定位手环</option>
															</select>
														</td>
													</tr>
													<tr>
														<td class="search-title">监管等级：</td>
														<td>
															<select style="width: 165px;" name="dicMonitorGradeKey" editable='false' class='easyui-combobox' data-options="panelHeight:'auto',panelMaxHeight:'200'">
																<option value="">全部</option>
																<option value='27004'>严管</option>
																<option value='27003'>普管</option>
																<option value='27005'>特管</option>
															</select>
														</td>
													</tr>
													<tr>
														<td class="search-title">是否请假：</td>
														<td>
															<select style="width: 165px;" name="askLeave" editable='false' class='easyui-combobox' data-options="panelHeight:'auto',panelMaxHeight:'200'">
																<option value="">全部</option>
																<option value='1'>是</option>
																<option value='0'>否</option>
															</select>
														</td>
													</tr>
													<tr>
														<td class="search-title">是否越界：</td>
														<td>
															<select style="width: 165px;" name="over" editable='false' class='easyui-combobox' data-options="panelHeight:'auto',panelMaxHeight:'200'">
																<option value="">全部</option>
																<option value='1'>是</option>
																<option value='0'>否</option>
															</select>
														</td>
													</tr>
												</table>
											</form>
										</div>
									</div>
									<div title="经典模式" style="padding: 10px" style="padding:10px">
										<form id="terSearchForm1">
											<table>
												<tr>
													<td class="search-title">矫正对象：</td>
													<td><input id="name1" name="culpritName" class='easyui-textbox' prompt='矫正对象' style="width: 165px;" data-options="valueField:'name'" /></td>
												</tr>
												<tr>
													<td class="search-title">定位号码：</td>
													<td>
														<select id="mobileNumber1" name="mobileNumber" class='easyui-textbox' prompt='定位号码' style="width: 165px;"></select>
													</td>
												</tr>
												<tr>
													<td class="search-title">定位方式：</td>
													<td>
														<input name="locationType" type="radio" value="1560004" />APP定位
														<input name="locationType" type="radio" value="手环" />手环 
														<input name="locationType" type="radio" value="1560001" />基站
													</td>
												</tr>
												<tr>
													<td class="search-title">监管等级：</td>
													<td>
														<input name="dicMonitorGradeKey" type="radio" value="27004" />严管 
														<input name="dicMonitorGradeKey" type="radio" value="27003" />普管 
														<input name="dicMonitorGradeKey" type="radio" value="27005" />特管
													</td>
												</tr>
												<tr>
													<td class="search-title">是否请假：</td>
													<td>
														<input name="askleave" value="1" type="radio" />是&nbsp;&nbsp;&nbsp;&nbsp;
														<input name="askleave" value="0" type="radio" />否
													</td>
												</tr>
												<tr>
													<td class="search-title">是否越界：</td>
													<td>
														<input name="over" value="1" type="radio" />是&nbsp;&nbsp;&nbsp;&nbsp;
														<input name="over" value="0" type="radio" />否
													</td>
												</tr>
												<tr>
													<td class="search-title">8小时内：</td>
													<td>
														<input name="isLive" value="在线" type="radio" />在线
														<input name="isLive" value="异常" type="radio" /><span title="异常情况：关机、停机、呼叫转移、离线、未开通、网络异常、其他" class="easyui-tooltip">异常</span>
													</td>
												</tr>
											</table>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div data-options="region:'south',border:false" style="height: 30px; line-height: 30px; overflow: hidden; text-align: center; background-color: #eee">
							<a href="#" class="easyui-linkbutton" id="getCulprit" iconCls="icon-search" onclick="searchCulprit()">查询</a> &nbsp;&nbsp; 
							<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" 
							onclick="$('#type').combobox('reset');$('#dicMonitorGradeKey').combobox('reset');$('#askLeave').combobox('reset');$('#over').combobox('reset');javascript:$('#terSearchForm').form('clear');">清空</a>
						</div>
					</div>
				</div>
				<!-- easyui-panel -->
					
				<!-- easyui-panel -->
				<div class="easyui-panel" id="aa" data-options="region:'center',collapsed:false,collapsible:true" title="人员信息列表"  style="width: 100%;">
					<table class="easyui-datagrid" id="cul_list_content" 
						data-options="checkOnSelect:true,singleSelect:false,toolbar:'#culToolbar',fit:true,onLoadSuccess:selectPreData(),striped:true,loadMsg: '数据正在加载,请耐心的等待...' , 
						fitColumns:true,url:'${ctx}/monitoring/terminalActivity/list',method:'post'">
						<thead>
							<tr>
								<th data-options="field:'id',checkbox:true"></th>
								<%-- <th data-options="field:'_opt2',align:'center',width:'10%',formatter:eyeclick">
									<img src='${ctxStatic}/style/images/eyeoff.jpg' /></th> --%>
								<th data-options="field:'culpritName',align:'center'"
									editor="text" style="width: 20%;">矫正对象</th>
								<th data-options="field:'mobileNumber',align:'center'"
									editor="text" style="width: 53%;">定位号码</th>
								<th data-options="field:'isLive',align:'center',width:'22%',formatter:function(value,rowData,rowIndex){
							    		return rowData.isLive;
									}">状态</th>
							</tr>
						</thead>
					</table>
				</div>
				<!-- easyui-panel -->
					
				<!-- easyui-panel -->
				<div class="easyui-panel" data-options="region:'south'" border="false" style="width: 100%;height: 12%;">
					<table style="border-collapse:collapse;text-align: left;" width="100%">
						<tr>
							<td width="33%">
								<a href="#" id="allpeople" name="allpeople" class="easyui-linkbutton" plain="true" text="总数:0" style="color: black;" 
								onclick="reloadFlag=false;javascript:$('#cul_list_content').datagrid('loadData',filterForData(datagridData,''));"></a>
							</td>
							<td width="33%">
								<a href="#" id="online" name="online" class="easyui-linkbutton" plain="true" text="在线:0" style="color: blue;" 
								onclick="reloadFlag=false;javascript:$('#cul_list_content').datagrid('loadData',filterForData(datagridData,'在线'));"></a>
							</td>
							<td width="33%">
								<a href="#" id="dropped" name="dropped" class="easyui-linkbutton" plain="true" text="掉线:0" style="color: red;" 
								onclick="reloadFlag=false;javascript:$('#cul_list_content').datagrid('loadData',filterForData(datagridData,'掉线'));"></a>
							</td>
						</tr>
						<tr>
							<td width="33%">
								<a href="#" id="stop" name="stop" class="easyui-linkbutton" plain="true" text="停机:0" style="color: red;" 
								onclick="reloadFlag=false;javascript:$('#cul_list_content').datagrid('loadData',filterForData(datagridData,'停机'));"></a>
							</td>
							<td width="33%">
								<a href="#" id="shutdown" name="shutdown" class="easyui-linkbutton" plain="true" text="关机:0" style="color: brown;" 
								onclick="reloadFlag=false;javascript:$('#cul_list_content').datagrid('loadData',filterForData(datagridData,'关机'));"></a>
							</td>
							<td width="33%">
								<a href="#" id="hjzy" name="hjzy" class="easyui-linkbutton" plain="true" text="呼叫转移:0" style="color: green;" 
								onclick="reloadFlag=false;javascript:$('#cul_list_content').datagrid('loadData',filterForData(datagridData,'呼叫转移'));"></a>
							</td>
						</tr>
						<tr>
							<td width="33%">
								<a href="#" id="wlyc" name="wlyc" class="easyui-linkbutton" plain="true" text="网络异常:0" style="color: purple;" 
								onclick="reloadFlag=false;javascript:$('#cul_list_content').datagrid('loadData',filterForData(datagridData,'网络异常'));"></a>
							</td>
							<td width="33%">
								<a href="#" id="wkt" name="wkt" class="easyui-linkbutton" plain="true" text="未开通:0" style="color: gray;" 
								onclick="reloadFlag=false;javascript:$('#cul_list_content').datagrid('loadData',filterForData(datagridData,'未开通'));"></a>
							</td>
							<td width="33%"></td>
						</tr>
						<tr height="10px;"></tr>
					</table>
					<div style="border-top: 1px solid #eee;background: #eee;margin: 0;height: 25px; line-height: 25px; overflow: hidden;">
						刷新时间：<span id="sxsj" name="sxsj" style="color: red;"></span>
					</div>
				</div>
				<!-- easyui-panel -->
						
			</div>
		</div>
			
		<div id="ssgj" class="easyui-layout" data-options="region:'center' ">
			<div id="container" data-options="region:'center'"
				style="height: 100%"></div>
			<div id="panorama"
				data-options="region:'east',onExpand:function(node){ $('#openqj').linkbutton({text:'关闭全景'});},collapsed:true,split:true"
				style="width: 750px;"></div>
			<div class="easyui-panel" data-options="region:'north'"
				style="height: 30px;">
				<a href="#" class="easyui-linkbutton" id="openqj"
					data-options="iconCls:'fi-eye icon-blue',plain:true">打开全景</a> <a
					href="#" class="easyui-linkbutton" id='tdTool'
					data-options="iconCls:'fi-record icon-blue',plain:true">拖动</a> <a
					href="#" class="easyui-linkbutton" id='rTool'
					data-options="iconCls:'fi-ticket icon-blue',plain:true">测距</a> <a
					href="#" class="easyui-linkbutton" id='pTool'
					data-options="iconCls:'fi-projection-screen icon-blue',plain:true">测面</a>
				<a href="#" class="easyui-linkbutton" id='fdTool'
					data-options="iconCls:'fi-zoom-in icon-blue',plain:true">拉框放大</a> <a
					href="#" class="easyui-linkbutton" id='sxTool'
					data-options="iconCls:'fi-zoom-out icon-blue',plain:true">拉框缩小</a>
				<!-- <a href="javascript:void(0)" class="easyui-splitbutton"
					style="margin-right: 10px;"
					data-options="menu:'#switchMap',iconCls:'fi-map icon-blue'"
					onclick="">切换地图</a> -->
			</div>
			<div id="switchMap" style="width: 100px;">
				<div data-options="iconCls:'fi-paw icon-blue'"
					onclick="alert('正在开发中...')">百度</div>
				<div data-options="iconCls:'fi-paw icon-blue'"
					onclick="alert('正在开发中...')">高德</div>
			</div>
			<div title="实时轨迹" data-options="region:'south',collapsed:true,split:true"
				collapsedContent="实时轨迹" style="height: 40%">
				<table class="easyui-datagrid" id="act_list_content"
					style="height: 100%;"
					data-options="checkOnSelect:true,rownumbers:true,singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' , 
			pagination:false,nowrap:false,
			fitColumns:true,url:'${ctx}/monitoring/terminalActivity/findActivity',method:'post'">
					<thead>
						<tr>
							<!-- <th data-options="field:'lonReal',hidden:true"></th>
							<th data-options="field:'latReal',hidden:true"></th>
							<th data-options="field:'id',hidden:true"></th> -->
							<th data-options="field:'culpritName',align:'center'"
								editor="text" style="width: 10%;">姓名</th>
							<th data-options="field:'mobileNumber',align:'center'"
								editor="text" style="width: 10%;">定位号码</th>
							<th data-options="field:'type',align:'center'" editor="text"
								style="width: 12%;">终端类型</th>
							<th data-options="field:'locationType',align:'center'
								,formatter:function(value,rowData,rowIndex){
								return sy.getDicValue('SF_TERMINAL_ACTIVITY','location_type',rowData.locationType,'');
								}"
								editor="text" style="width: 10%;">定位模式</th>
							<th data-options="field:'isLive',align:'center'" editor="text"
								style="width: 10%;">定位状态</th>
							<th data-options="field:'gpstime',align:'center'" 
								style="width: 15%;">定位时间</th>
							<th data-options="field:'location',align:'center',formatter:actlocation"
								style="width: 33%">位置</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	
	<div id="culToolbar" style="display: none;">
		<a href="#" class="easyui-linkbutton" id="telLocation" data-options="plain:true,iconCls:'fi-target-two'">定位</a>
	</div>
	<div id="mm" class="easyui-menu" style="width: 120px;">
		<div id="hisitem" data-options="iconCls:'icon-search'">查询历史轨迹</div>
	</div>
</div>