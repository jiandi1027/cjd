<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@include file="/WEB-INF/views/include/head.jsp"%>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>全国城市下拉列表</title>
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main.css?v=1.0"/>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=4559c2f8cef72cd28ac5743cc57a39e3&plugin=AMap.DistrictSearch"></script>

    <style type="text/css">
        #tip {
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
</head>
<body class="easyui-layout">
<div id="cc" class="easyui-layout" style="width:100%;height:100%;">
		<div data-options="region:'west',split:true" title="地区查询" style="width:18%;" class="easyui-layout">
	<div data-options="region:'center'">
	<form action="">
	添加新地区<input style="width:45%;" type = 'text' id = 'areaName'>
	<input type = 'button' id = 'findArea' value="查询"><br/>
	已添加地区<input style="width:45%;" type = 'text' id = 'hareaName'>
	<input type = 'button' id = 'findhArea' value="查询">
	</form>
	</div>
	<div data-options="region:'south',title:'已添加地区'" style="height:80%;"> 
	<table class="easyui-datagrid" id="t_list_content" 
			style="height: 100%;" data-options="checkOnSelect:false,singleSelect:false,collapsible:true,striped:true,loadMsg: '数据正在加载,请耐心的等待...' , 
			pagination:true,pageSize: 10 ,pageList:[5,10,15,20,50],
			fitColumns:true,url:'${ctx}/monitoring/terminalArea/list',method:'post'">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true"></th>
					<th data-options="field:'name',align:'center',fit:true"
						editor="text" style="width: 100%;">地名</th>
						<th data-options="field:'remark'" ></th>
				</tr>
			</thead>
		</table>
	</div>
		</div>
		<div   data-options="region:'center',title:'Center'" style="height:100%;">
		<div id = "mapContainer"></div>
		<button id = "tip" >自定义地区 </button>
		</div>
	</div>
	
	<div id="mm" class="easyui-menu"  style="width:120px;">   
    <div id = "deleteArea" data-options="iconCls:'icon-remove'">删除该地区</div> 
</div> 
<div id="win" class="easyui-window" title="保存自定义地区"
		style="width: 200px; height: 150px" closed="true"
		data-options="iconCls:'icon-edit'">
		<form>
		<table style="text-align:center;">
			<tr style="text-align:center;">
				<td>请输入自定义地区名称：</td></tr><tr style="text-align:center;"><td>
				<input id="custompoName" name="custompoName" type = "text"
				  style="width: 180px;" /></td>
			</tr>
				<td><input class="easyui-linkbutton" value="添加"
					id="addCustompo" /></td>
			</tr>
		</table>
		</form>
	</div> 

 <script type="text/javascript">
    var map, district, polygons = [], citycode;
    var polylineEditors = [];//多边形编辑器列表
	var lnglatarr = new Array();
	var lnglatarr2 = new Array();
	var updateArr = new Array();
	var updateArr2 = new Array();
	var custompo; //自定义地区
    map = new AMap.Map('mapContainer', {
        resizeEnable: true,
        center: [116.30946, 39.937629],
        zoom: 3
    });
    //查询行政区域
    $("#findArea").click(function(){
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
                    map: map,
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
   	 				infoWindow.open(map, e.lnglat);
                });
            	map.setFitView();//地图自适应
            }
           }
        });
    });
     $("#findhArea").click(function(){
    	 $("#t_list_content").datagrid('load',{name:$("#hareaName").val()});
    }); 
    //为数据列表添加事件
    $('#t_list_content').datagrid({
		//勾选框选中事件				
		onCheck: function(index,row){
			 for (var i = 0, l = polylineEditors.length; i < l; i++) {
    			 polylineEditors[i].close();
    	        }
    		 polylineEditors=[];
			var str=eval(row.remark);
		     for (var i = 0, l = polygons.length; i < l; i++) {
                 polygons[i].setMap(null);
             }
		     polygons = [];
		     lnglatarr2 =[];
         	    for (var i = 0, l = str.length; i < l; i++){
         		   var le = str[i].length;
         		    for(var j = 0,b = le; j < b; j++ ){
         			   var arr = str[i][j].split(",");
         			   lnglatarr.push(new AMap.LngLat(arr[0],arr[1])); 
         		   }   
         	var polygon = new AMap.Polygon({
                 map: map,
                 strokeWeight: 1,
                 strokeColor: '#CC66CC',
                 fillColor: '#CCF3FF',
                 fillOpacity: 0.5,
                 path: lnglatarr,
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
	 				content:"<tr> <td><button id = 'editArea' onClick=editArea()>编辑</button></td><td><button id = 'updateArea' onClick=updateArea('"+row.id+"') >保存修改</button></td></tr>"
	 				});    
	 				infoWindow.open(map, e.lnglat);
             });
         	map.setFitView();//地图自适应
         }
		},
		//勾选框取消选中事件
		onUncheck: function(index,row){
			 for (var i = 0, l = polylineEditors.length; i < l; i++) {
				 polylineEditors[i].close();
		        }
			 polylineEditors=[];
		     for (var i = 0, l = polygons.length; i < l; i++) {
		         polygons[i].setMap(null);
		     }
		     polygons = [];
			
		},
		onRowContextMenu:function(e, index, row){
 					$('#mm').menu('show', {
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
    	 $.ajax({
             type: "post",
             url: "${ctx}/monitoring/terminalArea/deleteArea",
             data: {id:id},
             dataType: "json",
             async: false,
             success: function(data){
            	 if(data=="0"){
            		 $.messager.show({
	     					title : '提示信息!',
	     					msg : '删除成功！'
	     				});
            		 $("#t_list_content").datagrid('load');
            	 	}else{
            	 		 $.messager.show({
 	     					title : '提示信息!',
 	     					msg : '删除失败！'
 	     				});
            	 		
            	 	}
             }
         });
    }

    //添加地区
    function addArea(result){
    	var str = getString(re.districtList[0].boundaries);
    	 $.ajax({
             type: "post",
             url: "${ctx}/monitoring/terminalArea/addArea",
             data: {name:re.districtList[0].name,remark:str},
             dataType: "json",
             async: false,
             success: function(data){
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
            	 		$("#t_list_content").datagrid('load');
            	 	}
             }
         });
    }
  //保存修改地区
 function updateArea(id){
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
        	 		$("#t_list_content").datagrid('load');
        	 	}
         }
     }); 
	 
    }
    //编辑地区
    function editArea(){
    	map.plugin(["AMap.PolyEditor"],function(){
    		 for (var i = 0, l = polylineEditors.length; i < l; i++) {
    			 polylineEditors[i].close();
    	        }
    		 for (var i = 0, l = polygons.length; i < l; i++) {
    			 polylineEditor = new AMap.PolyEditor(map,polygons[i]); 
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
    
    $("#tip").click(function(){
    	map.plugin(["AMap.MouseTool"],function(){ 
    	    var mousetool = new AMap.MouseTool(map); 
    	    var p = mousetool.polygon({//使用鼠标工具，在地图上画多边形    
                map: map,
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
   	 				content:"<tr> <td><button  onClick=editCustompoArea()>编辑</button></td><td><button  onClick=addCustompoArea() >保存</button></td></tr>"
   	 				});    
   	 				infoWindow.open(map, e.lnglat);
                });
    	    	polygons.push(custompo);
    	    });
    	});
    });
    function editCustompoArea(){ //自定义地区编辑
     	map.plugin(["AMap.PolyEditor"],function(){
   		 for (var i = 0, l = polylineEditors.length; i < l; i++) {
   			 polylineEditors[i].close();
   	        }
   			 polylineEditor = new AMap.PolyEditor(map,custompo); 
    	        polylineEditor.open();
    	        polylineEditors.push(polylineEditor); 
   	    });     
    }
    function addCustompoArea(){ //自定义地区保存
		$('#win').window('open');
		$("#addCustompo").click(function(){
			 updateArr2=[];
			 for (var i = 0, l = polygons.length; i < l; i++) {
		 		updateArr = polygons[i].getPath();
		 		updateArr2.push(updateArr);
		 	 }
			 var str = getString(updateArr2); 
		   	 $.ajax({
	             type: "post",
	             url: "${ctx}/monitoring/terminalArea/addArea",
	             data: {name:$("#custompoName").val(),remark:str},
	             dataType: "json",
	             async: false,
	             success: function(data){
	            	 if(data=="0"){
	            		 $.messager.show({
		     					title : '提示信息!',
		     					msg : '已存在改地名！'
		     				});
	            	 	}else{
	            	 		for (var i = 0, l = polylineEditors.length; i < l; i++) {
	            	   			 polylineEditors[i].close();
	            	   	        }
	            	 		 $.messager.show({
	 	     					title : '提示信息!',
	 	     					msg : '保存成功！'
	 	     				});
	            	 		$("#t_list_content").datagrid('load');
	            	 	}
	             }
	         });
		});
    }
</script> 
<script type="text/javascript" src="http://webapi.amap.com/demos/js/liteToolbar.js"></script>

</body>
</html>