<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>实时定位</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=4559c2f8cef72cd28ac5743cc57a39e3&plugin=AMap.DistrictSearch"></script>
<script type="text/javascript" src="http://webapi.amap.com/demos/js/liteToolbar.js"></script>
	
<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0px;
	padding: 0px
}

#container {
	height: 100%
}
#tip {
            background-color: #fff;
            padding:0 10px;
            border: 1px solid silver;
            box-shadow: 3px 4px 3px 0px silver;
            position: absolute;
            font-size: 12px;
            right: 100px;
            top: 5px;
            border-radius: 3px;
            line-height: 36px;
        }
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'center'" class="easyui-layout"
		data-options="fit:true" id = "zztc">
		<div title="人员查询" data-options="region:'west',collapsed:false,collapsible:false"
			collapsedContent="人员查询" style="width: 18%">
			<div data-options="region:'south'" style="height: 20%">
				<form id = 'searchForm'>
					<table>
					<tr>
					<td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input id="culpritName" name="culpritName" type="text"
								editable="false" style="width: 50%;" /></td>
								</tr>
						<tr>
							<td>定&nbsp;位&nbsp;号：<input id="mobileNumber"
								name="mobileNumber" type="text" editable="false"
								style="width: 50%;" /></td>
						</tr>
						<tr>
							<td>所属司法部门：<select id="sysGroupId" name="groupId" class="easyui-combotree" style="width: 80%;"
    				data-options="url:'${ctx}/sys/sysGroup/loadGroupTree',editable:true">
				</select>
						</tr>
							<tr>
						<td><input type="button" editable="false" class="easyui-linkbutton"
								value="搜索" id="getCulprit" />
							</td>
								</tr>
					</table>
				</form>
			</div>
			<div data-options="fit:true,region:'center'" border="false" style="height: 80%;">
				<table class="easyui-datagrid" id="t_list_content" title="人员信息列表"
					style="height: 100%;"
					data-options=" checkOnSelect:false,singleSelect:false,striped:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],
			fitColumns:true,url:'${ctx}/monitoring/terminalActivity/list',method:'post'">
					<thead>
						<tr>
							<th data-options="field:'id',checkbox:true,width:80"></th>
							<th data-options="field:'name',width:80,align:'center'"
								editor="text" style="width: 40%;">姓名</th>
							<th data-options="field:'mobileNumber',width:100,align:'center'"
								editor="text" style="width: 60%;">定位号</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<div id = "lsgj" class="easyui-layout" data-options="region:'center' ">
			<div id="container" data-options="region:'center'" style="height:100%"></div>
			<div id="tip">
    省：<select id='province' style="width:100px" onchange='search(this)'></select>
    市：<select id='city' style="width:100px" onchange='search(this)'></select>
    区：<select id='district' style="width:100px" onchange='search(this)'></select>
</div>
		<div  title="历史轨迹" data-options="region:'south',collapsed:true,split:true" collapsedContent="历史轨迹" style="height: 40%">
		<table class="easyui-datagrid" id="t_list_content2" 
			style="height: 100%;" data-options="checkOnSelect:false,singleSelect:false,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' , 
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],
			fitColumns:true,url:'${ctx}/monitoring/terminalHistory/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true"></th>
					<th data-options="field:'culpritName',align:'center'"
						editor="text" style="width: 20%;">姓名</th>
					<th data-options="field:'mobileNumber',align:'center'"
						editor="text" style="width: 20%;">定位号</th>
					<th data-options="field:'gpsTime',align:'center'"
						editor="text" style="width: 25%;">定位时间</th>
					<th data-options="field:'location',align:'center'"
						editor="text" style="width: 35%;">定位地址</th>
				</tr>
			</thead>
		</table>
	</div>
		</div>
	
	</div>
	<div id="mm" class="easyui-menu"  style="width:120px;">   
    <div id = "hisitem" data-options="iconCls:'icon-search'">查询历史轨迹</div> 
</div>  
	<div id="win" class="easyui-window" title="历史轨迹查询窗口"
		style="width: 200px; height: 180px" closed="true"
		data-options="iconCls:'icon-edit'">
		<form>
		<table style="text-align:center;">
			<tr style="text-align:center;">
				<td>开始时间：</td></tr><tr style="text-align:center;"><td>
				<input id="startTime" name="startTime" 
					class="easyui-datetimebox" editable="false" style="width: 180px;" /></td>
			</tr>
			<tr style="text-align:center;">

				<td>结束时间：</td></tr>
				<tr style="text-align:center;"><td>
				<input id="endTime" name="endTime" 
					class="easyui-datetimebox" editable="false" style="width: 180px;" /></td>
			</tr>
			<tr>

				<td><input class="easyui-linkbutton" value="开始查询"
					id="findHistory" /></td>
			</tr>
			<input type="hidden" id="hidNumber" />
		</table>
		</form>
	</div>
	<script type="text/javascript">
	var doc = document.getElementById("zztc");
		doc.contextMenu = function(){
		return false;
	}
	 var map, district, polygons = [], citycode;
	    var citySelect = document.getElementById('city');
	    var districtSelect = document.getElementById('district');
		var map = new AMap.Map("container");
		var markerArr = new Array();
		var hisMarkerArr = new Array();
		var point = new AMap.LngLat(116.404, 39.915); // 创建点坐标 
		var pointArr = new Array();
		map.panTo(point);
		  //行政区划查询
	    var opts = {
	        subdistrict: 1,   //返回下一级行政区
	        level: 'city',
	        showbiz:false  //查询行政级别为 市
	    };
	    district = new AMap.DistrictSearch(opts);//注意：需要使用插件同步下发功能才能这样直接使用
	    district.search('中国', function(status, result) {
	    	 getData(result.districtList[0]);
	    });
		AMap.plugin(['AMap.ToolBar','AMap.Scale','AMap.OverView','AMap.MapType'],
			    function(){
					map.addControl(new AMap.MapType());
			        map.addControl(new AMap.ToolBar());
			        map.addControl(new AMap.Scale());
			});
		//获取行政区域
		 function getData(data) {
		        var bounds = data.boundaries;
		        if (bounds) {
		            for (var i = 0, l = bounds.length; i < l; i++) {
		                var polygon = new AMap.Polygon({
		                    map: map,
		                    strokeWeight: 1,
		                    strokeColor: '#CC66CC',
		                    fillColor: '#CCF3FF',
		                    fillOpacity: 0.5,
		                    path: bounds[i]
		                });
		                polygons.push(polygon);
		            }
		            map.setFitView();//地图自适应
		        }
		       
		        var subList = data.districtList;
		        var level = data.level;
		        
		        //清空下一级别的下拉列表
		        if (level === 'province') {
		            nextLevel = 'city';
		            citySelect.innerHTML = '';
		            districtSelect.innerHTML = '';
		        } else if (level === 'city') {
		            nextLevel = 'district';
		            districtSelect.innerHTML = '';
		        } 
		        if (subList) {
		            var contentSub =new Option('--请选择--');
		            for (var i = 0, l = subList.length; i < l; i++) {
		                var name = subList[i].name;
		                var levelSub = subList[i].level;
		                var cityCode = subList[i].citycode;
		                if(i==0){
		                    document.querySelector('#' + levelSub).add(contentSub);
		                }
		                contentSub=new Option(name);
		                contentSub.setAttribute("value", levelSub);
		                contentSub.center = subList[i].center;
		                contentSub.adcode = subList[i].adcode;
		                document.querySelector('#' + levelSub).add(contentSub);
		            }
		        }
		        
		    }
		    function search(obj) {
		        //清除地图上所有覆盖物
		        for (var i = 0, l = polygons.length; i < l; i++) {
		            polygons[i].setMap(null);
		        }
		        var option = obj[obj.options.selectedIndex];
		        var keyword = option.text; //关键字
		        var adcode = option.adcode;
		        district.setLevel(option.value); //行政区级别
		        district.setExtensions('all');
		        //行政区查询
		        //按照adcode进行查询可以保证数据返回的唯一性
		        district.search(adcode, function(status, result) {
		            if(status === 'complete'){
		                getData(result.districtList[0]);
		            }
		        });
		    }
				 
		$("document").ready(function(){
			//查询数据加载到人物列表
			$("#getCulprit").click(function(){
				$("#t_list_content").datagrid('load',serializeForm($('#searchForm')));
		      });
			$('#t_list_content').datagrid({
				//勾选框选中事件				
				onCheck: function(index,row){
					 $.ajax({
			             type: "post",
			             url: "${ctx}/monitoring/terminalActivity/findTerminalActivity",
			             data: {mobileNumber:row.mobileNumber},
			             async:false,
			             dataType: "json",
			             success: function(data){
				            	 	var point1 = new AMap.LngLat(data.lon, data.lat); 
				            	 	marker = new AMap.Marker({position:point1}); 
				            	 	marker.on("click", function(){  
				            	 		var infoWindow = new AMap.InfoWindow({    
				            	 				 width : 250,     // 信息窗口宽度    
				            	 				 height: 150,     // 信息窗口高度    
				            	 				 title : "详细信息" ,// 信息窗口标题   
				            	 				autoMove:true,
				            	 				closeWhenClickMap:true,
				            	 				position:point1,
				            	 				content:"<table height='20px' style='font:12px;'>"+
				            	 				"<tr><td><span style='font-size:12px'><b>姓名</b>："+row.name+"</span></td></tr>"+
				            	 				"<tr><td><span style='font-size:12px'><b>手机</b>："+data.mobileNumber+"</span></td></tr>"+
				            	 				"<tr><td><span style='font-size:12px'><b>定位时间</b>："+data.gpsTime+"</span></td></tr>"+
				            	 				"<tr><td><span style='font-size:12px'><b>定位地址</b>："+data.location+"</span></td></tr>"+
				            	 				"<tr><td><button id = 'history' onClick=findHisrory('"+data.mobileNumber+"','"+row.name+"')>历史轨迹</button></td></tr></table>"
				            	 				
				            	 					
				            	 		
				            	 		});    
				            	 			infoWindow.open(map, point1);    
				            	 		});
				            	 map.panTo(point1);
				            	 marker.setMap(map);
				            	 marker.setAnimation('AMAP_ANIMATION_DROP');
				            	 markerArr[index]  = marker;
				            	 map.setFitView();
			             }
			         });
					 
				},
				//勾选框取消选中事件
				onUncheck: function(index,row){
					markerArr[index].hide();
		            	 markerArr[index]="undefined";
				},
				onCheckAll:function(rows){
					  for(var index=0;index<rows.length;index++){
						  if(markerArr[index]!=null&&markerArr[index]!=""&&markerArr[index]!="undefined"){ 
								markerArr[index].hide();
								markerArr[index]="undefined";
							}
						 $.ajax({
				             type: "post",
				             url: "${ctx}/monitoring/terminalActivity/findTerminalActivity",
				             data: {mobileNumber:rows[index].mobileNumber},
				             dataType: "json",
				             async: false,
				             success: function(data){
				            	 if(data!=null){
				            		 	var point1 = new AMap.LngLat(data.lon, data.lat); 
					            	 	marker = new AMap.Marker({position:point1});
					            	 	var name = rows[index].name;
					            	 	marker.on("click", function(){
					            	 		var infoWindow = new AMap.InfoWindow({    
					            	 				 width : 250,     // 信息窗口宽度    
					            	 				 height: 150,     // 信息窗口高度    
					            	 				 title : "详细信息" ,// 信息窗口标题   
					            	 				autoMove:true,
					            	 				closeWhenClickMap:true,
					            	 				position:point1,
					            	 				content:"<table height='20px' style='font:12px;'>"+
					            	 				"<tr><td><span style='font-size:12px'><b>姓名</b>："+name+"</span></td></tr>"+
					            	 				"<tr><td><span style='font-size:12px'><b>手机</b>："+data.mobileNumber+"</span></td></tr>"+
					            	 				"<tr><td><span style='font-size:12px'><b>定位时间</b>："+data.gpsTime+"</span></td></tr>"+
					            	 				"<tr><td><span style='font-size:12px'><b>定位地址</b>："+data.location+"</span></td></tr>"+
					            	 				"<tr><td><button id = 'history' onClick=findHisrory('"+data.mobileNumber+"','"+name+"')>历史轨迹</button></td></tr></table>"
					            	 		});    
					            	 			infoWindow.open(map, point1);    
					            	 		});
					            	 map.panTo(point1);
					            	 marker.setMap(map);
					            	 marker.setAnimation('AMAP_ANIMATION_DROP');
					            	 markerArr[index]  = marker;
					            	 map.setFitView();
				             	}
				             }
				         });
					 }
				},
				onUncheckAll:function(rows){
					for(var index=0;index<rows.length;index++){
						if(markerArr[index]!=null&&markerArr[index]!=""){ 
							markerArr[index].hide();
							markerArr[index]="undefined";
						}
					}
				},onRowContextMenu:function(e, index, row){
							$('#mm').menu('show', {
								left: e.pageX,
								top: e.pageY
							});
							 $('#hisitem').click(function(){
								 findHisrory(row.mobileNumber,row.name)
							}); 
							
					e.preventDefault();
				}
			    });
			
			$('#t_list_content2').datagrid({
				//勾选框选中事件				
				onCheck: function(index,row){
					 $.ajax({
			             type: "post",
			             url: "${ctx}/monitoring/terminalHistory/findTerminalHistory",
			             data: {id:row.id},
			             dataType: "json",
			             success: function(data){
				            	 if(data!=null){
				            	 var point1 = new AMap.LngLat(data.lon, data.lat); 
				            	 	marker = new AMap.Marker({position:point1});
				            	 	marker.on("click", function(){
				            	 		var infoWindow = new AMap.InfoWindow({    
				            	 				 width : 250,     // 信息窗口宽度    
				            	 				 height: 150,     // 信息窗口高度    
				            	 				 title : "详细信息" ,// 信息窗口标题   
				            	 				autoMove:true,
				            	 				closeWhenClickMap:true,
				            	 				position:point1,
				            	 				content:"<table height='20px' style='font:12px;'>"+
				            	 				"<tr><td><span style='font-size:12px'><b>姓名</b>："+data.culpritName+"</span></td></tr>"+
				            	 				"<tr><td><span style='font-size:12px'><b>手机</b>："+data.mobileNumber+"</span></td></tr>"+
				            	 				"<tr><td><span style='font-size:12px'><b>定位时间</b>："+data.gpsTime+"</span></td></tr>"+
				            	 				"<tr><td><span style='font-size:12px'><b>定位地址</b>："+data.location+"</span></td></tr>"+
				            	 				"</table>"
				            	 		});    
				            	 			infoWindow.open(map, point1);    
				            	 		});
				            	 map.panTo(point1);
				            	 marker.setMap(map);
				            	 marker.setAnimation('AMAP_ANIMATION_DROP');
				            	 hisMarkerArr[index] = marker;
				            	 map.setFitView();
				             }
			             }
			         });
					 
				},
				//勾选框取消选中事件
				onUncheck: function(index,row){
					hisMarkerArr[index].hide();
					hisMarkerArr[index]="undefined";
		            	 
				},
				onCheckAll:function(rows){
					
					  for(var index=0;index<rows.length;index++){
						  if(hisMarkerArr[index]!=null&&hisMarkerArr[index]!=""){ 
								map.removeOverlay(hisMarkerArr[index]);
							}
						 $.ajax({
				             type: "post",
				             url: "${ctx}/monitoring/terminalHistory/findTerminalHistory",
				             data: {id:rows[index].id},
				             dataType: "json",
				             async: false,
				             success: function(data){
				            	 if(data!=null){
				            		 var point1 = new AMap.LngLat(data.lon, data.lat); 
					            	 	marker = new AMap.Marker({position:point1});
					            	 	var name = rows[index].name;
					            	 	marker.on("click", function(){
					            	 		var infoWindow = new AMap.InfoWindow({    
					            	 				 width : 250,     // 信息窗口宽度    
					            	 				 height: 150,     // 信息窗口高度    
					            	 				 title : "详细信息" ,// 信息窗口标题   
					            	 				autoMove:true,
					            	 				closeWhenClickMap:true,
					            	 				position:point1,
					            	 				content:"<table height='20px' style='font:12px;'>"+
					            	 				"<tr><td><span style='font-size:12px'><b>姓名</b>："+data.culpritName+"</span></td></tr>"+
					            	 				"<tr><td><span style='font-size:12px'><b>手机</b>："+data.mobileNumber+"</span></td></tr>"+
					            	 				"<tr><td><span style='font-size:12px'><b>定位时间</b>："+data.gpsTime+"</span></td></tr>"+
					            	 				"<tr><td><span style='font-size:12px'><b>定位地址</b>："+data.location+"</span></td></tr>"+
					            	 				"</table>"
					            	 		});    
					            	 			infoWindow.open(map, point1);    
					            	 		});
					            	 map.panTo(point1);
					            	 marker.setMap(map);
					            	 marker.setAnimation('AMAP_ANIMATION_DROP');
					            	 hisMarkerArr[index]  = marker;
					            	 map.setFitView();
				             	}
				             }
				         });
					 }
				},
				onUncheckAll:function(rows){
					for(var index=0;index<rows.length;index++){
						if(hisMarkerArr[index]!=null&&hisMarkerArr[index]!=""){ 
							hisMarkerArr[index].hide();
							hisMarkerArr[index]="undefined";
						}
					}
				}
			    });
			
			//加载历史轨迹
			$("#findHistory").click(function(){
				$("#t_list_content2").datagrid('load',{mobileNumber:($("input#hidNumber").val()),startTime:$('#startTime').datetimebox('getValue'),endTime:$('#endTime').datetimebox('getValue')});
				var p = $("#lsgj").layout("panel", "south")[0].clientWidth;  
	            if (p <= 0) {
	            	$("#lsgj").layout("expand", "south");
	            }
	            if($('#startTime').datetimebox('getValue')==""){
	            	 $.messager.show({
	     					title : '提示信息!',
	     					msg : '请输入开始时间！'
	     				});
	            }else if( $('#endTime').datetimebox('getValue')==""){
	            	 $.messager.show({
	     					title : '提示信息!',
	     					msg : '请输入结束时间！'
	     				});
	            } else{
				$.ajax({
		             type: "post",
		             url: "${ctx}/monitoring/terminalHistory/list",
		             data: {mobileNumber:($("input#hidNumber").val()),startTime:$('#startTime').datetimebox('getValue'),endTime:$('#endTime').datetimebox('getValue')},
		             dataType: "json",
		             async: false,
		             success: function(data){
		            	 if(data!=null&&data!=""&&data.rows.length>=1){
		            	 var pArr = new Array();
		            		for(var i=data.rows.length-1;i>=0;i--){
		            		 var point = new AMap.LngLat(data.rows[i].lon, data.rows[i].lat);
		            		 pArr.push(point);
		            	 	}
		            	 var polyline = new AMap.Polyline({strokeColor:"blue", 
		            		 								strokeWeight:2, 
		            		 								strokeOpacity:0.5,
		            		 								path:pArr,
		            		 								map:map}); 
		            	 map.setFitView();
		            	 }else{
		            		 $.messager.show({
		     					title : '提示信息!',
		     					msg : '无数据！'
		     				});
		            	 }
		            	 }
		         }); 
	            }
				
			});
		});
		//历史轨迹查询框
		function findHisrory(mobileNumber,culpritName){
			$("input#hidNumber").val(mobileNumber);
			$('#win').window({
				title:culpritName+"历史轨迹"
			});
			$('#win').window('open');
		}	
		  //加载树  
	    $('#comboTree').combotree({        
	        url:'${ctx}/sys/sysGroup/loadGroupTree',  
	        onClick:function(node){  
	            //单用户单击一个节点的时候，触发  
	            $("input[name='groupId']").val(node.id);  
	        },  
	        checkbox:false,  
	        multiple:false  
	    }); 
	  //js方法：序列化表单 			
		function serializeForm(form) {
			var obj = {};
			$.each(form.serializeArray(),
					function(index) {
						if (obj[this['name']]) {
							obj[this['name']] = obj[this['name']] + ','
									+ this['value'];
						} else {
							obj[this['name']] = this['value'];
						}
					});
			return obj;
		}

	</script>
</body>

</html>