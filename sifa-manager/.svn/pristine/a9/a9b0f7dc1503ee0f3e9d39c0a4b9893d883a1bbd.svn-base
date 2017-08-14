<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/style/css/map.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic }/style/js/jquery-ui.min.css" />
<script type="text/javascript" src="${ctxStatic }/style/js/jquery-ui.min.js" charset="utf-8"></script>
<script src="//webapi.amap.com/ui/1.0/main.js?v=1.0.8"></script>

<style>
  #slider .ui-slider-range { background: -webkit-gradient(linear, 100% 100%, 0% 0%,from(#ff0303), to(#0aa3fd)); }
  #slider .ui-slider-handle { border-color: #ef2829; }
</style>
<script type="text/javascript">
//收起右栏
$(".miBtn").toggle(function() {
	$(".mapInfo").css("right", "-213px");
}, function() {
	$(".mapInfo").css("right", "5px");
});
$(".miBtn").click(function() {
	$(".mapInfo").toggleClass("miOn");
});

var hismap;
var navg = null;
var pathSimplifierIns = null;
var gjtime;//定时器
var stopflag = false;//是否已经停止
var lineArr = [];
var ti;//定时器
var hisMarkerArr = new Array();
hismap = new AMap.Map("hiscontainer");
hismap.setZoomAndCenter(9, [ 109.414186, 24.315553 ]);
var pointArr = new Array();
var pArr = new Array();
var hisMarkerArr = new Array();
var polylineArr = new Array();
var timeout = 0;
var gjflag = true;
AMap.plugin([ 'AMap.ToolBar', 'AMap.Scale', 'AMap.OverView', 'AMap.MapType' ], function() {
	hismap.addControl(new AMap.Scale());
	hismap.addControl(new AMap.ToolBar());
	hismap.addControl(new AMap.OverView());
});

$(document).ready(function() {
	$( "#slider" ).slider({
		orientation: "horizontal",
	    range: "min",
	    max: 330,
	    value: 165,
	    slide: refreshSlider,
	    change: refreshSlider
	});

	if (ti != null) {
		window.clearInterval(ti);
	}
	if (gjtime != null) {
		window.clearInterval(gjtime);
	}

	$("#hisendTime").val(GetDateStr(0));//设置默认结束时间
	$("#hisstartTime").val(GetDateStr2(0));//设置默认开始时间 
	//$("#hisendTime").val('2017-06-30 00:00:00');
	//$("#hisstartTime").val('2017-06-29 00:00:00');
});
$("#pause").hide();
//播放历史轨迹
$("#start").click(function(){
	if (navg != null && navg.path != null) {
		if (stopflag) {		//已经播放完毕
			stopflag = false;
			//清空之前的轨迹
			if (pathSimplifierIns !=null) {
				pathSimplifierIns.setData(null);
				pathSimplifierIns.render();
			}

			searchdata(true);
		}
		else if (navg.getNaviStatus() == 'pause' || navg.getNaviStatus() == 'stop') {
			//navg.resume();
			if(navg.getNaviStatus() == 'stop'){
				navg.start();
			}
			else navg.resume();
			
			window.clearInterval(gjtime);
			gjtime = window.setInterval(timeforgj,500);   
			$("#start").hide();
			$("#pause").show();    
		}
	}
	else {//当前没有轨迹
		//清空之前的轨迹
		if (pathSimplifierIns !=null) {
			pathSimplifierIns.setData(null);
			pathSimplifierIns.render();
		}
		searchdata(true);
	}
});
//暂停历史轨迹
$("#pause").click(function(){
	if (navg != null && navg.path != null) {
		navg.pause();
		window.clearInterval(gjtime);
		$("#start").show();
		$("#pause").hide();
	}
});
//停止历史轨迹并销毁
$("#stopMap").click(function(){
	if (navg != null && navg.path != null) {
		navg.destroy();
		navg = null;
		stopflag = true;
		window.clearInterval(gjtime);
		$("#start").show();
		$("#pause").hide();
	}
});
//显示历史轨迹
$("#show").click(function() {
	//清空之前的轨迹
	if (pathSimplifierIns !=null) {
		pathSimplifierIns.setData(null);
		pathSimplifierIns.render();
	}
	searchdata(false);
});

function timeforgj(){
	if (navg != null && navg.path != null) {
		if (navg.getNaviStatus() == 'pause') {
			window.clearInterval(gjtime);
			stopflag = true;
			$("#start").show();
			$("#pause").hide();
		}
	}
}

$("#start2").click(function() {
	timeout = 0;
	hismap.clearMap();
	$('#his_list_content').datagrid('loadData', {
		total : 0,
		rows : []
	});
	/*  $("#his_list_content").datagrid('load',{mobileNumber:($("input#hidNumber").val()),startTime:$('#hisstartTime').val(),endTime:$('#hisendTime').val()}); */
	if ($('#hisstartTime').val() == "") {
		$.messager.show({
			title : '提示信息!',
			msg : '请输入开始时间！'
		});
	} else if ($('#hisendTime').val() == "") {
		$.messager.show({
			title : '提示信息!',
			msg : '请输入结束时间！'
		});
	} else {
		starthistory();
	}
});
function starthistory() {
	if (ti != null) {
		window.clearInterval(ti);
	}
	pArr = new Array();
	$.ajax({
		type : "post",
		url : "${ctx}/monitoring/terminalHistory/list",
		data : {
			mobileNumber : ($("input#hidNumber").val()),
			startTime : $('#hisstartTime').val(),
			endTime : $('#hisendTime').val()
		},
		dataType : "json",
		async : false,
		success : function(data) {
			if (data != null && data != "" && data.rows.length >= 1) {
				var p = $("#lsgj").layout("panel", "south")[0].clientWidth;
				if (p <= 0) {
					$("#lsgj").layout("expand", "south");
					hismap.setZoom(17);
				}
				hismap.clearMap();
				
				starthistory1(data);
			} else {
				$.messager.show({
					title : '提示信息!',
					msg : '当前时间段无数据！'
				});
			}
		}
	});
}
function searchdata(start){
	closeInfoWindow();
	if (navg != null && navg.path != null) {//清空之前的轨迹
		navg.destroy();
		navg = null;
	}
	if (pathSimplifierIns != null) {
		pathSimplifierIns.setData(null);
		pathSimplifierIns.render();
		window.clearInterval(gjtime);
	}
	stopflag = false;
	$("#his_list_content").datagrid('load', {
		mobileNumber : ($("input#hidNumber").val()),
		startTime : $('#hisstartTime').val(),
		endTime : $('#hisendTime').val()
	});
	if ($('#hisstartTime').val() == "") {
		$.messager.show({
			title : '提示信息!',
			msg : '请输入开始时间！'
		});
	} else if ($('#hisendTime').val() == "") {
		$.messager.show({
			title : '提示信息!',
			msg : '请输入结束时间！'
		});
	} else {
		$.ajax({
			type : "post",
			url : "${ctx}/monitoring/terminalHistory/list",
			data : {
				mobileNumber : ($("input#hidNumber").val()),
				startTime : $('#hisstartTime').val(),
				endTime : $('#hisendTime').val()
			},
			dataType : "json",
			async : false,
			success : function(data) {
				//hismap.setZoomAndCenter(18, [120.670738, 28.005425 ]);
				if (data != null && data != "" && data.rows.length >= 1) {
					var p = $("#lsgj").layout( "panel", "south")[0].clientWidth;
					if (p <= 0) {
						$("#lsgj").layout("expand","south");
					}
					startmap(data, start);	//新轨迹-显示
					if (start) {
						$("#start").hide();
						$("#pause").show();
					}
					else {
						$("#start").show();
						$("#pause").hide();
					}
				} else {
					$.messager.show({
						title : '提示信息!',
						msg : '当前时间段无数据！'
					});
				}
			}
		});
	}
}

function startmap(data, start){
	progressLoad();
	var mapdata = new Array();
	var mapName = data.rows[0].culpritName;
	for(var i = 0; i < data.rows.length; i++){
		var datatemp = new Array();
		datatemp[0] = data.rows[i].lonReal;
		datatemp[1] = data.rows[i].latReal;
		mapdata.push(datatemp);
	}
	AMapUI.load(['ui/misc/PathSimplifier'], function(PathSimplifier) {
	    /* if (!PathSimplifier.supportCanvas) {
	        alert('当前环境不支持 Canvas！');
	        return;
	    } */
	    pathSimplifierIns = new PathSimplifier({
	        zIndex: 100,
	        map: hismap, //所属的地图实例
	        getPath: function(pathData, pathIndex) {
	            //返回轨迹数据中的节点信息，[AMap.LngLat, AMap.LngLat...] 或者 [[lng,lat],[lng,lat]...]
	            return pathData.path;
	        },
	        getHoverTitle: function(pathData, pathIndex, pointIndex) {
	            //返回鼠标悬停时显示的信息
	            if (pointIndex >= 0) {
	                //鼠标悬停在某个轨迹节点上
	                //return '点:' + pointIndex + '/' + pathData.path.length + ',' + Common.formatDate(data.rows[pointIndex].gpstime);
               		msginfo(pointIndex, data.rows[pointIndex]);
	            	return '';
	            }
	            //鼠标悬停在节点之间的连线上
	            return pathData.name + '，点数量' + pathData.path.length;
	        },
	        renderOptions: {
		        keyPointTolerance : 5,
		        renderAllPointsIfNumberBelow : 999,
	        	//轨迹线的样式
	        	pathLineStyle: {
	                strokeStyle: '#11a21a',
	                lineWidth: 6,
	                dirArrowStyle: true
	            },
	        	//轨迹节点的绘制样式
		        keyPointStyle: {
		        	radius:6,
		        	fillStyle:"#4169E1",
		        	strokeStyle:"white",
		        	lineWidth:1
		        },
	            //轨迹箭头样式
		        dirArrowStyle: {
		            stepSpace: 60,
		            strokeStyle: "white",
		            lineWidth: 2
		        },
	            //开始节点
	            startPointStyle: {
			        radius: 6,
			        fillStyle: "red",//"#4169E1",
			        lineWidth: 2,
			        strokeStyle: "white"
			    },
	            //结束节点
	            endPointStyle: {
			        radius: 6,
			        fillStyle: "red",//"#4169E1",
			        lineWidth: 2,
			        strokeStyle: "white"
			    },
	            //轨迹选中
			    pathLineSelectedStyle: {
			        lineWidth: 6,
			        strokeStyle: "#11a21a",
			        borderWidth: 1,
			        borderStyle: "#cccccc",
			    	dirArrowStyle: true
			    },
	            //鼠标移上去节点显示
			    keyPointHoverStyle: {
				    radius: 7,
				    fillStyle: "orange",//填充颜色
				    lineWidth: 3,
				    strokeStyle: "white"//边框颜色
				}
	        }
	    });

	    
	    //这里构建两条简单的轨迹，仅作示例
	    pathSimplifierIns.setData([{
	        name: mapName,
	        path: mapdata
	    }]);
	    //pathSimplifierIns.setSelectedPathIndex(0);	//选中轨迹线，部分样式会发生变化
	    
	    navg = pathSimplifierIns.createPathNavigator(0, {
	        loop: false,
	        speed: 100,
	    	pathNavigatorStyle: {
            width: 16,
            height: 16,
            autoRotate: true,//是否根据路径方向进行角度旋转（相对于正上方向），默认true
            lineJoin: "round",
            content: "defaultPathNavigator",//移动箭头
            lineWidth: 2,
            pathLinePassedStyle: {//巡航器经过的路径的样式
              lineWidth: 6,
              strokeStyle: "red",
              borderWidth: 1,
              borderStyle: "#eeeeee",
              dirArrowStyle: true
            }
          }
	    });
		
		progressClose();
		//防止有时候数据查询结果和实际的不符合，再重新查询一次
		if (data.rows.length != $('#his_list_content').datagrid('getRows').length) {
			startmap($('#his_list_content').datagrid('getData'), start);
			return;
		}
		
	    if (start) {
			navg.start();
		}
	}); 
}
function starthistory1(data) {
	var l = data.rows.length - timeout - 1;
	$('#his_list_content').datagrid('insertRow', {
		index : 0, // 索引从0开始
		row : {
			lonReal : data.rows[l].lonReal,
			latReal : data.rows[l].latReal,
			id : data.rows[l].id,
			culpritName : data.rows[l].culpritName,
			mobileNumber : data.rows[l].mobileNumber,
			type : data.rows[l].type,
			locationType : data.rows[l].locationType,
			isLive : data.rows[l].isLive,
			gpstime : Common.formatDate(data.rows[l].gpstime),
			location : data.rows[l].location
		}
	});
	if (data.rows[l].lon != 0) {
		var point = new AMap.LngLat(data.rows[l].lonReal, data.rows[l].latReal);
		hismarker = new AMap.Marker({
			position : point,
			icon : new AMap.Icon({
				image : '${ctxStatic}/style/images/0202.png'
			}),
			offset : new AMap.Pixel(-12, -20)
		});
		hismarker.on("click", function() {
			this.setIcon('${ctxStatic}/style/images/0201.png');
			var infoWindow = new AMap.InfoWindow({
				width : 100, // 信息窗口宽度    
				height : 50, // 信息窗口高度    
				title : "详细信息",// 信息窗口标题   
				autoMove : true,
				closeWhenClickMap : true,
				position : point,
				content : "<table height='20px' style='font:12px;'>"
						+ "<tr><td><span style='font-size:12px'>"
						+ Common.formatDate(data.rows[l].gpstime) + "</span></td></tr>"
						+ "</table>"
			});
			infoWindow.open(hismap, point);
		});
		hismarker.setMap(hismap);
		pArr.push(point);
		hisMarkerArr.push(hismarker);
		hismap.setFitView();
		var polyline = new AMap.Polyline({
			strokeColor : "blue",
			strokeWeight : 5,
			strokeStyle : 'solid',
			path : pArr,
			lineJoin : 'round',
			isOutline : true,
			showDir : true,
			map : hismap
		});
		polylineArr.push(polyline);
	}
	timeout++;
	if (timeout >= data.rows.length) {
		$.messager.show({
			title : '提示信息!',
			msg : '播放完毕！'
		});
		timeout = 0;
	} else {
		if (ti != null) {
			window.clearInterval(ti);
		}
		ti = setTimeout(function() {
			starthistory1(data)
		}, 1000);
	}
}


//显示历史轨迹
$("#show2").click(function() {
	window.clearInterval(ti);
	hismap.clearMap();
	$("#his_list_content").datagrid('load', {
		mobileNumber : ($("input#hidNumber").val()),
		startTime : $('#hisstartTime').val(),
		endTime : $('#hisendTime').val()
	});
	if ($('#hisstartTime').val() == "") {
		$.messager.show({
			title : '提示信息!',
			msg : '请输入开始时间！'
		});
	} else if ($('#hisendTime').val() == "") {
		$.messager.show({
			title : '提示信息!',
			msg : '请输入结束时间！'
		});
	} else {
		$.ajax({
			type : "post",
			url : "${ctx}/monitoring/terminalHistory/list",
			data : {
				mobileNumber : ($("input#hidNumber").val()),
				startTime : $('#hisstartTime').val(),
				endTime : $('#hisendTime').val()
			},
			dataType : "json",
			async : false,
			success : function(data) {
				hismap.setZoomAndCenter(18, [120.670738, 28.005425 ]);
				if (data != null && data != "" && data.rows.length >= 1) {
					var p = $("#lsgj").layout( "panel", "south")[0].clientWidth;
					if (p <= 0) {
						$("#lsgj").layout("expand","south");
					}
					pArr = new Array();
					for (var i = data.rows.length - 1; i >= 0; i--) {
						var point = new AMap.LngLat(data.rows[i].lonReal,data.rows[i].latReal);
						pArr.push(point);
						hismarker = new AMap.Marker({
							position : point,
							icon : new AMap.Icon({
								image : '${ctxStatic}/style/images/0202.png',
							}),
							offset : new AMap.Pixel(-12, -20)
						});
						hismarker.on("click", function() {
							this.setIcon('${ctxStatic}/style/images/0201.png');
							var infoWindow = new AMap.InfoWindow({
								width : 100, // 信息窗口宽度    
								height : 50, // 信息窗口高度    
								title : "详细信息",// 信息窗口标题   
								autoMove : true,
								closeWhenClickMap : true,
								position : point,
								content : "<table height='20px' style='font:12px;'>"
										+ "<tr><td><span style='font-size:12px'>："
										+ Common.formatDate(data.rows[i].gpstime)
										+ "</span></td></tr>"
										+ "</table>"
							});
							infoWindow.open(hismap, point);
						});
						hismap.panTo(point);
						hismarker.setMap(hismap);
						hismap.setFitView();
						hisMarkerArr.push(hismarker);
					}
					var polyline = new AMap.Polyline(
							{
								strokeColor : "blue",
								strokeWeight : 5,
								strokeStyle : 'solid',
								path : pArr,
								isOutline : true,
								showDir : true,
								map : hismap
							});
					polylineArr.push(polyline);
					hismap.setFitView();
				} else {
					$.messager.show({
						title : '提示信息!',
						msg : '当前时间段无数据！'
					});
				}
			}
		});
	}

});

$("#pause2").click(function() {
	window.clearInterval(ti);
});
$("#hid").click(function() {
	if (gjflag == true) {
		//$("#hidbut").val("显示");
		$("#histop").css("right", "-250px");
		//$("#hid").css("right", "0px");
		gjflag = false;
	} else if (gjflag == false) {
		//$("#hidbut").val("隐藏");
		$("#histop").css("right", "0px");
		//$("#hid").css("right", "250px");
		gjflag = true;
	}
});

//滑动条change事件
function refreshSlider(){
	var sliderLength = $("#slider").slider("value");
	if(navg != null && navg.path != null){
		navg.setSpeed(sliderLength + 20);
	}
}

function hisformatOper(val, row, index) {
	operation = '';
	operation = operation + '<a id = "hislocation' + row.id + '" onclick="showlocation(\'' + row.id + '\',\'' + row.latReal + '\',\'' + row.lonReal + '\')"  >点击显示地址</a> ';
	return operation;
}

function showlocation(rowid, latReal, lonReal) {
	$.ajax({
		type : "post",
		url : "${ctx}/monitoring/terminalHistory/showlocation",
		data : {
			latReal : latReal,
			lonReal : lonReal
		},
		dataType : "text",
		async : false,
		success : function(data) {
			$("#hislocation" + rowid).text(data);
		},
		error : function(result) {

		}
	});
}

//关闭信息窗体
function closeInfoWindow(){
	 hismap.clearInfoWindow();
}

$('#his_list_content').datagrid({
	onSelect : function(index, row) {
		$.ajax({
			type : "post",
			url : "${ctx}/monitoring/terminalHistory/findTerminalHistory?id=" + row.id,
			dataType : "json",
			async : false,
			success : function(data) {
				if (data != null && data.lonReal != 0) {
					msginfo(index, data);
				}
			}
		});
	}
});

function msginfo(index, data){
	var location = "";
	$.ajax({
		type : "post",
		url : "${ctx}/monitoring/terminalHistory/showlocation",
		data : {
			latReal : data.latReal,
			lonReal : data.lonReal
		},
		dataType : "text",
		async : false,
		success : function(data) {
			location = data;
		},
		error : function(result) {
			location = "";
		}
	});
	
	var point = new AMap.LngLat(data.lonReal,data.latReal);
	var infoWindow = new AMap.InfoWindow({
		width : 100, // 信息窗口宽度    
		height : 50, // 信息窗口高度    
		title : "详细信息",// 信息窗口标题   
		autoMove : true,
		closeWhenClickMap : true,
		position : point,
		content : "<table height='20px' style='border-top:2px' style='font:12px;'>"
			+ "<tr><td>"
			+ "<span style='font-size:12px'><b>节点序号：</b>" + (index + 1) + "</span>"
			+ "</td></tr>"
			+ "<tr><td>"
			+ "<span style='font-size:12px'><b>定位时间：</b>" + Common.formatDate(data.gpstime) + "</span>"
			+ "</td></tr>"
			+ "<tr><td>"
			+ "<span style='font-size:12px'><b>定位地点：</b>"+ location + "</span>"
			+ "</td></tr>"
			+ "</table>"
	});
	infoWindow.open(hismap, point);
}

$(":radio").click(function() {
	if ($(this).val() == "今天") {
		$("#hisendTime").val(GetDateStr(0));
		$("#hisstartTime").val(GetDateStr2(0));
	} else if ($(this).val() == "24小时内") {
		$("#hisendTime").val(GetDateStr(0));
		$("#hisstartTime").val(GetDateStr(-1));
	} else if ($(this).val() == "8小时内") {
		$("#hisendTime").val(GetDateStr(0));
		$("#hisstartTime").val(GetDateStr3());
	} else if ($(this).val() == "昨天") {
		$("#hisendTime").val(GetDateStr2(0));
		$("#hisstartTime").val(GetDateStr2(-1));
	} else if ($(this).val() == "前天") {
		$("#hisendTime").val(GetDateStr2(-1));
		$("#hisstartTime").val(GetDateStr2(-2));
	}
});

function zerofill(num){
	if (num < 10) {
		return "0"+num;
	}
	else return num;
}
function GetDateStr(AddDayCount) {
	var dd = new Date();
	dd.setDate(dd.getDate() + AddDayCount);//获取AddDayCount天后的日期
	var y = dd.getFullYear();
	var M = dd.getMonth() + 1;//获取当前月份的日期
	var d = dd.getDate();
	var h = dd.getHours(); //小时 
	var m = dd.getMinutes(); //分 
	var s = dd.getSeconds();
	return y + "-" + zerofill(M) + "-" + zerofill(d) + " " + zerofill(h) + ":" + zerofill(m) + ":" + zerofill(s);
}
function GetDateStr2(AddDayCount) {
	var dd = new Date();
	dd.setDate(dd.getDate() + AddDayCount);//获取AddDayCount天后的日期
	var y = dd.getFullYear();
	var M = dd.getMonth() + 1;//获取当前月份的日期
	var d = dd.getDate();
	var h = dd.getHours(); //小时 
	var m = dd.getMinutes(); //分 
	var s = dd.getSeconds();
	return y + "-" + zerofill(M) + "-" + zerofill(d) + " " + "00:00:00";
}
function GetDateStr3() {
	var dd = new Date();
	dd.setTime(dd.getTime() - 1000 * 60 * 60 * 8);
	var y = dd.getFullYear();
	var M = dd.getMonth() + 1;//获取当前月份的日期
	var d = dd.getDate();
	var h = dd.getHours(); //小时 
	var m = dd.getMinutes(); //分 
	var s = dd.getSeconds();
	return y + "-" + zerofill(M) + "-" + zerofill(d) + " " + zerofill(h) + ":" + zerofill(m) + ":" + zerofill(s);
}
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
<div id="lsgj" class="easyui-layout" style="width: 100%; height: 100%;">
	<div title="历史轨迹" data-options="region:'south',collapsed:true,split:true" collapsedContent="历史轨迹" style="height: 40%">
		<table class="easyui-datagrid" id="his_list_content" style="height: 100%;"
			data-options="checkOnSelect:false,fitColumns:true,rownumbers:true,singleSelect:true,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,nowrap:false, 
			pagination:false,fitColumns:true,url:'${ctx}/monitoring/terminalHistory/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'lonReal',hidden:true"></th>
					<th data-options="field:'latReal',hidden:true"></th>
					<th data-options="field:'id',hidden:true"></th>
					<th data-options="field:'culpritName',align:'center'" style="width: 10%;">矫正对象</th>
					<th data-options="field:'mobileNumber',align:'center'" style="width: 10%;">定位号码</th>
					<th data-options="field:'type',align:'center'" style="width: 12%;">终端类型</th>
					<th data-options="field:'locationType',align:'center',formatter:function(value,rowData,rowIndex){
						return sy.getDicValue('SF_TERMINAL_ACTIVITY','location_type',rowData.locationType,'');
						}" style="width: 10%;">定位模式</th>
					<th data-options="field:'isLive',align:'center'" style="width: 10%;">定位状态</th>
					<th data-options="field:'gpstime',align:'center',formatter:Common.formatDate" style="width: 15%;">定位时间</th>
					<th data-options="field:'_opt',align:'center',formatter:hisformatOper" style="width: 33%">定位地址</th>
				</tr>
			</thead>
		</table>
	</div>
	<div data-options="region:'center'">
		<div id="hiscontainer" style="height: 100%;"></div>
		<div id="histop" style="width: 250px;border-bottom: 1px solid #0C4269;">
			<div id="hid"></div>
			<div style="border-bottom: 1px solid #0C4269;border-top: 1px solid #0C4269;background: url(${ctxStatic}/style/images/mi.png) #FFF repeat-x 0 -273px;">
				<span style="display:block;height:24px;line-height:24px;padding-left:11px;font-size:13px;color:#10598D;">轨迹回放</span>
			</div>
			<div style="padding: 5px;">
				<div style="padding: 0px 2px;">
				<input type='radio' name="hisdate" value='前天' />前天 &nbsp;&nbsp; 
				<input type='radio' name="hisdate" value='昨天' />昨天 &nbsp;&nbsp; 
				<input type='radio' name="hisdate" value='今天' />今天
				</div>
				<div style="padding: 0px 2px;">
				<input type='radio' name="hisdate" value='8小时内' />8小时内&nbsp;&nbsp;&nbsp;&nbsp;
				<input type='radio' name="hisdate" value='24小时内' />24小时内 
				</div>
				<div style="text-align: center;padding: 0px 2px;margin-top: 5px;">
				开始时间：<input type="text" id="hisstartTime" name="hisstartTime" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" /><br />
				</div>
				<div style="text-align: center;padding: 0px 2px;">
				结束时间：<input type="text" id="hisendTime" name="hisendTime" class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				</div>
				<div style="text-align: center;padding: 0px 2px;margin-top: 10px;">
					<span style="float:left;">回放速度：慢</span>
					<div id="slider" style="margin-top: 3px;margin-left: 5px;width: 140px;float:left;"></div>
					<span style="margin-left: 5px;float:left;">快</span>
					<!-- <input class="easyui-slider" id='speed' value="50" style="width: 100%;"
						data-options=" showTip: false, rule: ['慢','|','播放速度','|','快'], onChange: function(value){
							if(navg != null && navg.path != null){
								navg.setSpeed(value * 3.3 + 20);
							}
						}" /> -->
				</div><br/> 
			</div>
			<div style="clear: both;margin-top: 10px;">
				<div style="height: 26px;padding-top: 2px;background: url(${ctxStatic}/style/images/mi.png) repeat-x 0 -333px;">
					<span style="display:block;width:60px;height:26px;padding-right:2px;float:left;background:url(${ctxStatic}/style/images/mi.png) repeat-x 100% -222px;">
						<a href="#" id="start" style="cursor: pointer;background-position: 0 0;display:block;width:43px;height:16px;margin:5px auto 0;text-indent:-9999px;overflow:hidden;background:url(${ctxStatic}/style/images/mi.png);">播放</a>
						<a href="#" id="pause" style="cursor: pointer;background-position: 0 0;display:block;width:43px;height:16px;margin:5px auto 0;text-indent:-9999px;overflow:hidden;background:url(${ctxStatic}/style/images/mi.png) repeat-x 0 -376px;;">暂停</a>
					<!-- <input id="start" readonly="readonly" class="easyui-linkbutton" style="width: 40px;" value='播放' />&nbsp;&nbsp; -->
					</span>
					<span style="display:block;width:60px;height:26px;padding-right:2px;float:left;background:url(${ctxStatic}/style/images/mi.png) repeat-x 100% -222px;">
						<a href="#" id="stopMap" style="cursor: pointer;background-position: 0 0;display:block;width:43px;height:16px;margin:5px auto 0;text-indent:-9999px;overflow:hidden;background:url(${ctxStatic}/style/images/mi.png) repeat-x 0 -37px;">停止</a>
<!-- 					<input id="pause" readonly="readonly" class="easyui-linkbutton" style="width: 40px;" value='停止' />&nbsp;&nbsp;  --><!-- 暂停-376 -->
					</span>
					<span style="display:block;width:60px;height:26px;padding-right:2px;float:left;background:url(${ctxStatic}/style/images/mi.png) repeat-x 100% -222px;">
						<a href="#" id="show" style="cursor: pointer;background-position: 0 0;display:block;width:43px;height:16px;margin:5px auto 0;text-indent:-9999px;overflow:hidden;background:url(${ctxStatic}/style/images/mi.png) repeat-x 0 -415px;">显示</a>
						<!-- <input id="show" readonly="readonly" class="easyui-linkbutton" style="width: 40px;" value='显示' />&nbsp;&nbsp;  -->
					</span>
					<span style="display:block;width:60px;height:26px;padding-right:2px;float:left;">
						<a href="#" id="paint" style="cursor: pointer;background-position: 0 0;display:block;width:43px;height:16px;margin:5px auto 0;text-indent:-9999px;overflow:hidden;background:url(${ctxStatic}/style/images/mi.png) repeat-x 0 -187px;">打印</a>
						<!-- <input id="paint" readonly="readonly" class="easyui-linkbutton" style="width: 40px;" value='打印' />&nbsp;&nbsp;<br> -->
					</span>
					<input id="hidNumber" value="${mobileNumber} " type="hidden" />
    			</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
 
</script>