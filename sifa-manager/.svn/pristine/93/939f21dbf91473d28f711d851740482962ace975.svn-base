<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="http://webapi.amap.com/demos/js/liteToolbar.js"></script>

<style type="text/css">
#zdy {
    background-color: #fff;
    padding:0 10px;
    border: 1px solid silver;
    box-shadow: 3px 4px 3px 0px silver;
    position: absolute;
    font-size: 12px;
    right: 10px;
    top: 5px;
    border-radius: 3px;
    line-height: 20px;
}
</style>

<div id="cc" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'east',split:true" title="地区查询" style="width:18%;" class="easyui-layout">
		<div data-options="region:'center'" class="search-form">
			<form action="">
				<div align="center" style="margin-top: 20px;">
					添加新地区：<input style="width:45%;" type='text' id='areaName' name='areaName'>
					<a href="#" class="easyui-linkbutton" id="findArea" iconCls="icon-search">查询</a>
				</div>
				<div align="center" style="margin-top: 10px;">
					已添加地区：<input style="width:45%;" type='text' id='hareaName' name='hareaName'>
					<a href="#" class="easyui-linkbutton" id="findoldArea" iconCls="icon-search">查询</a>
				</div>
			</form>
		</div>
		<div data-options="region:'south'" title="已添加地区" style="height:80%;"> 
			<table class="easyui-datagrid" id="terminalArea_list" 
				style="height: 100%;" data-options="checkOnSelect:true,singleSelect:false,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' , 
				fitColumns:true,url:'${ctx}/monitoring/terminalArea/list',method:'post'">
				<thead>
					<tr>
						<th data-options="field:'id',checkbox:true"></th>
						<th data-options="field:'name',align:'center',fit:true" style="width: 95%;">地名</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<div data-options="region:'center'" style="height:100%;">
		<div style="height:100%;" id="mapContainer"></div>
		<button id="zdy" >自定义地区 </button>
	</div>
</div>
	
<div id="areamm" class="easyui-menu" style="width:120px;">   
    <div id="deleteArea" data-options="iconCls:'icon-remove'">删除该地区</div> 
</div>

<script type="text/javascript">
var areamap, district, polygons = [], citycode;
var polylineEditors = [];//多边形编辑器列表
var lnglatarr = new Array();
var lnglatarr2 = new Array();
var updateArr = new Array();
var updateArr2 = new Array();
var custompo; //自定义地区
areamap = new AMap.Map('mapContainer', {
	resizeEnable: true,
	center: [109.414186,24.315553],
	zoom: 9
});

var colors = [
    "#3366cc", "#dc3912", "#ff9900", "#109618", "#990099", "#0099c6", "#dd4477", "#66aa00",
    "#b82e2e", "#316395", "#994499", "#22aa99", "#aaaa11", "#6633cc", "#e67300", "#8b0707",
    "#651067", "#329262", "#5574a6", "#3b3eac"
];

//查询行政区域
$("#findArea").click(function(){
	if ($("#areaName").val() != null && $("#areaName").val() != '') {
		areamap.plugin(["AMap.DistrictSearch" ],function(){
			for (var i = 0, l = polylineEditors.length; i < l; i++) {
				polylineEditors[i].close();
	        }
	 		polylineEditors=[];
		    for (var i = 0, l = polygons.length; i < l; i++) {
		    	polygons[i].setMap(null);
		    }
	    	polygons = [];
	   	 	//行政区划查询
	        var opts = {
	            subdistrict: 0,   //返回下一级行政区
	            level: 'district',
	            extensions:'all',
	            showbiz:false 
	        };
	        district = new AMap.DistrictSearch(opts);//注意：需要使用插件同步下发功能才能这样直接使用
	        district.search($("#areaName").val(), function(status, result) {
	       		re = result;
	        	if(status=='complete'){
	        	//清除地图上所有覆盖物
	            	for (var i = 0, l = polygons.length; i < l; i++) {
	                	polygons[i].setMap(null);
	            	}
	           		for (var i = 0, l = result.districtList[0].boundaries.length; i < l; i++){
		            	var polygon = new AMap.Polygon({
		                    map: areamap,
		                    strokeWeight: 1,
		                    strokeColor: '#CC66CC',
		                    fillColor: '#CCF3FF',
		                    fillOpacity: 0.5,
		                    path: result.districtList[0].boundaries[i],
		                });
		           		polygons.push(polygon);
		            	polygon.on('click', function(e) {
		                	var infoWindow = new AMap.InfoWindow({    
		   	 					width : 250,     // 信息窗口宽度    
		   	 					height: 150,     // 信息窗口高度    
		   	 					title : "详细信息" ,// 信息窗口标题   
		   	 					autoMove:true,
		   	 					closeWhenClickMap:true,
		   	 					position:e.lnglat,
		   	 					content:"<tr> <td><button id = 'addArea' onClick=addArea('"+result.districtList[0].boundaries.length+"')>保存</button></td></tr>"
		   	 				});    
	   	 					infoWindow.open(areamap, e.lnglat);
	                	});
	            		areamap.setFitView();//地图自适应
	           		}
	          	}
			});
		});
	}
	else {
		$.messager.show({
			title : '提示信息!',
			msg : '请填写地区信息!'
		});
	}
});
    
$("#findoldArea").click(function(){
	//$("#terminalArea_list").datagrid('load');
	$("#terminalArea_list").datagrid('load',{name:$("#hareaName").val()});
}); 

//为数据列表添加事件
$('#terminalArea_list').datagrid({
	//勾选框选中事件				
	onSelect: function(index,row){
		for (var i = 0, l = polylineEditors.length; i < l; i++) {
			polylineEditors[i].close();
		}
    	polylineEditors=[];
		var str=eval(row.remark);
		/* for (var i = 0, l = polygons.length; i < l; i++) {
        	polygons[i].setMap(null);
        }
		polygons = []; */
		lnglatarr2 = [];
        for (var i = 0, l = str.length; i < l; i++){
        	var le = str[i].length;
        	for(var j = 0,b = le; j < b; j++ ){
        		var arr = str[i][j].split(",");
        		lnglatarr.push(new AMap.LngLat(arr[0],arr[1])); 
        	}   
	        var polygon = new AMap.Polygon({
	        	map: areamap,
	            strokeWeight: 1,
	            strokeColor: colors[colors.length - 1 - polygons.length % colors.length],//'#CC66CC',
	            fillColor: colors[polygons.length % colors.length],//'#CCF3FF',//
	            fillOpacity: 0.5,
	            path: lnglatarr,
	            extData: row.id,
	        });
	       	lnglatarr2.push(lnglatarr);
	       	lnglatarr = [];
	   	  	polygons.push(polygon);
	        polygon.on('click', function(e) {
		        var infoWindow = new AMap.InfoWindow({    
					width : 250,     // 信息窗口宽度    
					height: 150,     // 信息窗口高度    
					title : "详细信息" ,// 信息窗口标题   
					autoMove:true,
					closeWhenClickMap:true,
					position:e.lnglat,
					content:"<tr><td><button id='editArea' onClick=editArea()>编辑</button></td><td><button id='updateArea' onClick=updateArea('"+row.id+"')>保存修改</button></td></tr>"
				});    
				infoWindow.open(areamap, e.lnglat);
			});
		    areamap.setFitView();//地图自适应
		}
	},
	//勾选框取消选中事件
	onUnselect: function(index,row){
		for (var i = 0, l = polylineEditors.length; i < l; i++) {
			polylineEditors[i].close();
		}
		polylineEditors=[];
	    for (var i = 0, l = polygons.length; i < l; i++) {
	    	if (polygons[i].G.extData == row.id) {
	    		polygons[i].setMap(null);
			};
	    }
	},
	onSelectAll: function(row){
	},
	onUnselectAll: function(row){
		for (var i = 0, l = polygons.length; i < l; i++) {
	    	polygons[i].setMap(null);
	    }
		polygons = [];
	},
	onRowContextMenu:function(e, index, row){
		$('#areamm').menu('show', {
			left: e.pageX,
			top: e.pageY
		});
		$('#deleteArea').click(function(){
			deleteArea(row.id);
		}); 
		e.preventDefault();
	}
});
//删除地区
function deleteArea(id){
	progressLoad();
	$.ajax({
		type: "post",
        url: "${ctx}/monitoring/terminalArea/deleteArea",
        data: {id:id},
        dataType: "json",
        async: false,
        success: function(data){
    		progressClose();
        	if(data=="0"){
				$.messager.show({
  					title : '提示信息!',
  					msg : '删除成功！'
  				});
        		$("#terminalArea_list").datagrid('load');
        	 	}else{
        	 		 $.messager.show({
   					title : '提示信息!',
   					msg : '删除失败！'
   				});
        	 }
         },
         error : function(data) {
         	progressClose();
		 }
	});
}

//添加地区
function addArea(result){
	progressLoad();
	var str = getString(re.districtList[0].boundaries);
	$.ajax({
    	type: "post",
    	url: "${ctx}/monitoring/terminalArea/addArea",
    	data: {custompoName:re.districtList[0].name,remark:str},
        dataType: "json",
        async: false,
        success: function(data){
    		progressClose();
       		if(data=="0"){
	        	$.messager.show({
	  				title : '提示信息!',
	  				msg : '已保存该地区！'
	  			});
        	}else{
	        	$.messager.show({
	   				title : '提示信息!',
	   				msg : '保存成功！'
	   			});
        		$("#terminalArea_list").datagrid('load');
        	}
    	},
         error : function(data) {
         	progressClose();
		}
	});
}

//保存修改地区
function updateArea(id){
	progressLoad();
	updateArr2=[];
	for (var i = 0, l = polygons.length; i < l; i++) {
		updateArr = polygons[i].getPath();
		updateArr2.push(updateArr);
	}
	var str = getString(updateArr2);
	$.ajax({
    	type: "post",
        url: "${ctx}/monitoring/terminalArea/updateArea",
        data: {id:id,remark:str},
        dataType: "json",
        async: false,
        success: function(data){
    		progressClose();
       		if(data=="0"){
       			$.messager.show({
    				title : '提示信息!',
    				msg : '修改成功！'
    			});
       	 	}else{
       	 		$.messager.show({
     				title : '提示信息!',
     				msg : '修改失败！'
     			});
       	 		$("#terminalArea_list").datagrid('load');
       	 	}
        },
		error : function(data) {
        	progressClose();
		}
    }); 
}
 
//编辑地区
function editArea(){
	AMap.plugin(["AMap.PolyEditor"],function(){
		for (var i = 0, l = polylineEditors.length; i < l; i++) {
			polylineEditors[i].close();
	    }
		for (var i = 0, l = polygons.length; i < l; i++) {
			polylineEditor = new AMap.PolyEditor(areamap,polygons[i]); 
 	        polylineEditor.open();
 	        polylineEditors.push(polylineEditor); 
		}
	});     
}

//二维数组转换成字符串
function getString( objarr ){
   	var typeNO = objarr.length;
	var tree = "[";
	for (var i = 0 ;i < typeNO ; i++){
		tree += "[";
		for(var j = 0;j<objarr[i].length;j++){
			if(j<objarr[i].length-1){
				tree +="'"+ objarr[i][j]+"',";
   		    }else{
   				tree +="'"+ objarr[i][j]+"'"; 
   		   	}
		}
		tree += "]";
		if(i<typeNO-1){
			tree +=",";
		}
	}
	tree +="]";
	return tree;
}

$("#zdy").click(function(){
	for (var i = 0, l = polygons.length; i < l; i++) {
		polygons[i].setMap(null);
	}
	polygons = [];
	areamap.plugin(["AMap.MouseTool"],function(){ 
		var mousetool = new AMap.MouseTool(areamap); 
	    var p = mousetool.polygon({//使用鼠标工具，在地图上画多边形    
            map: areamap,
            strokeWeight: 1,
            strokeColor: '#CC66CC',
            fillColor: '#CCF3FF',
            fillOpacity: 0.5
        });
	    AMap.event.addListener(mousetool,"draw",function(object){
	    	mousetool.close();
	    	custompo = object.obj;
	    	custompo.on('click', function(e) {
            	var infoWindow = new AMap.InfoWindow({    
 					width : 250,     // 信息窗口宽度    
 				 	height: 150,     // 信息窗口高度    
 					title : "详细信息" ,// 信息窗口标题   
 					autoMove:true,
 					closeWhenClickMap:true,
 					position:e.lnglat,
 					content:"<tr><td><button onClick=editCustompoArea()>编辑</button></td><td><button onClick=addCustompoArea()>保存</button></td></tr>"
 				});    
 				infoWindow.open(areamap, e.lnglat);
            });
	    	polygons.push(custompo);
	    });
	});
});

//自定义地区编辑
function editCustompoArea(){ 
	areamap.plugin(["AMap.PolyEditor"],function(){
		for (var i = 0, l = polylineEditors.length; i < l; i++) {
			polylineEditors[i].close();
	    }
		polylineEditor = new AMap.PolyEditor(areamap,custompo); 
		polylineEditor.open();
		polylineEditors.push(polylineEditor); 
    });     
}

//自定义地区保存
function addCustompoArea(){ 
	//$('#win').window('open');
	updateArr2=[];
 	for (var i = 0, l = polygons.length; i < l; i++) {
			updateArr = polygons[i].getPath();
			updateArr2.push(updateArr);
	 	}
 	var str = getString(updateArr2);
 	
 	parent.$.modalDialog({
        title : '保存电子围栏信息',
        iconCls:'fi-plus icon-green',
        width : 450,
        height : 180,
        resizable : true,
        maximizable:true, 
        href : "${ctx}/monitoring/terminalArea/addArea?remark="+str,
        buttons : [ {
            text : '保存',
            iconCls:'fi-save icon-blue',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = $('#terminalArea_list').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#bindingAddform');
                f.submit();
            }
        }, {
            text : '关闭',
            iconCls:'fi-x icon-blue',
            handler : function() {
            	parent.$.modalDialog.handler.dialog('close');
            }
        }]
    });
}
</script>