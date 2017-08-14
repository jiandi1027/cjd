function Rad(d){  
	//经纬度转换成三角函数中度分表形式。  
	return d * Math.PI / 180.0;		
}  
//计算距离，参数分别为第一点的纬度，经度；第二点的纬度，经度  
function GetDistance(lat1,lng1,lat2,lng2){  
	var radLat1 = Rad(lat1);  
	var radLat2 = Rad(lat2);  
	var a = radLat1 - radLat2;  
	var b = Rad(lng1) - Rad(lng2);  
	var s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a/2),2) +  
	Math.cos(radLat1)*Math.cos(radLat2)*Math.pow(Math.sin(b/2),2)));  
	s = s *6378.137 ;// EARTH_RADIUS;  
	s = Math.round(s * 10000) / 10000; //输出为公里  
	//s=s.toFixed(4);  
	return s;  
} 

function drawMarkerByDistance(zoom){
	progressLoad();
	
    var perDistance=0;   //当前累计公里数  
    var zoom=zoom||6;  
    switch (zoom){  
	    case 3:  
	        var targetDistance=800;  //km  
	        break;  
	    case 4:  
	        var targetDistance=400;  //km  
	        break;  
	    case 5:  
	        var targetDistance=200;  //km  
	        break;  
	    case 6:  
	        var targetDistance=120;  //km  
	        break;  
	    case 7:  
	        var targetDistance=60;  //km  
	        break;  
	    case 8:  
	        var targetDistance=30;  //km  
	        break;  
	    case 9:  
	        var targetDistance=15;  //km  
	        break;  
	    case 10:  
	        var targetDistance=7;  //km  
	        break;  
	    case 11:  
	        var targetDistance=4;  //km  
	        break;  
	    case 12:  
	        var targetDistance=1;  //km  
	        break;  
	    case 13:  
	        var targetDistance=0.5;  //km  
	        break;  
	    default:  
	        var targetDistance=0.25;  //km  
	}  
    var prepareToShowMarker=[];

    for (var i = 0; i < mapdata.length; i++) {  
		var marker={  
	        lat:parseFloat(mapdata[i].latReal),
	        lng:parseFloat(mapdata[i].lonReal),
	        maxlat:parseFloat(mapdata[i].latReal),
	        maxlng:parseFloat(mapdata[i].lonReal),
	        minlat:parseFloat(mapdata[i].latReal),
	        minlng:parseFloat(mapdata[i].lonReal),
	        count:mapdata[i].count,
            //course:mapdata[i].course,  
            //AddTime: mapdata[i].AddTime,
               
			lonReal : mapdata[i].lonReal,
			latReal : mapdata[i].latReal,
			power : mapdata[i].power,
			id : mapdata[i].id,
			culpritName : mapdata[i].culpritName,
			mobileNumber : mapdata[i].mobileNumber,
			type : mapdata[i].type,
			locationType : mapdata[i].locationType,
			isLive : mapdata[i].isLive,
			gpstime : mapdata[i].gpstime,
			location : mapdata[i].location,
			image : mapdata[i].image,
			culpritId : mapdata[i].culpritId,
		}  
        prepareToShowMarker.push(marker); 
          /*  //第一个点和最后一个点默认展示出来,累计长度大于目标长度的画出来  
           if (i==0||i==mapdata.length-1 || (mapdata[i].distance+perDistance)>targetDistance) {  
                
           }  
           if(i<mapdata.length-1 && i>1){  
               if ((mapdata[i].distance+perDistance)>targetDistance) {  
                   perDistance=0;  
               }else{  
                   perDistance+=mapdata[i].distance;  
               }  
           }   */
	}

       
	var changeArr=function(arr1,arr2){
       	if (arr1.maxlat > arr2.maxlat) {
       		arr2.maxlat = arr1.maxlat;
		}
       	if (arr1.minlat < arr2.minlat) {
       		arr2.minlat = arr1.minlat;
		}
       	if (arr1.maxlng > arr2.maxlng) {
       		arr2.maxlng = arr1.maxlng;
		}
       	if (arr1.minlng < arr2.minlng) {
       		arr2.minlng = arr1.minlng;
		}
       	arr2.count = arr2.count + arr1.count;
       }  
       
       var select=function(arr){  
           var flag=true;  
           for(var i=0;i<arr.length;i++){  
               for(var j=i+1;j<arr.length;j++){  
                   var curdistance=GetDistance(arr[i].lat,arr[i].lng,arr[j].lat,arr[j].lng);  
                   //如果还有靠得很近的点  
                   if (curdistance < targetDistance) {
                       flag=false;  
                      	changeArr(arr[i], arr[j]);
                      	arr.splice(i,1);
                       	
                       //随机剔除掉一个i和j之间的一个点 
                       /* if (Math.random()>0.5) {
                       	changeArr(arr[i], arr[j]);
                       	arr[j].count ++;
                       	arr.splice(i,1);
					}
                       else {
                       	changeArr(arr[j], arr[i]);
                       	arr[j].count ++;
                       	arr.splice(j,1);
                       } */
                       		
                       break;  
                   }
               }  
               if(flag==false){  
                   break;  
               }  
           }  
           //当数组中所有的点两两之间的距离都大于targetDistance的时候退出递归  
           if (flag==false) {  
               select(arr);  
           }  
       }
       if (map.getZoom() < 14) {
        select(prepareToShowMarker);
	}
	var countnum = 0;
	for (var i = prepareToShowMarker.length - 1; i >= 0; i--) {
       	countnum = countnum + prepareToShowMarker[i].count;
       	
		var count=prepareToShowMarker[i].count;  
		var point1=[prepareToShowMarker[i].lng,prepareToShowMarker[i].lat];
           
        /* var content = new AMap.Marker({
            //content: prepareToShowMarker[i].count,
            position: position,
            //title: prepareToShowMarker[i].AddTime,
            offset:new AMap.Pixel(-12, -20),
            map: map
        });
        pathContentArr.push(content); */
        var marker = new AMap.Marker({
           	extData :prepareToShowMarker[i],
            offset :new AMap.Pixel(-12, -20),  
   			icon : new AMap.Icon({
   				image : '${ctxStatic}/style/images/0202.png'
   			}), 
               //angle:((prepareToShowMarker[i].course-90)%360),  
        	position: point1,  
        	map: map  
        });
           
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
        if (count == 1) {
           	marker.setLabel({//label默认蓝框白底左上角显示，样式className为：amap-marker-label
       			offset : new AMap.Pixel(-10, 25),//修改label相对于maker的位置
       			content : prepareToShowMarker[i].culpritName
       		});
		}
        else {
           	marker.setLabel({//label默认蓝框白底左上角显示，样式className为：amap-marker-label
       			offset : new AMap.Pixel(-25, 25),//修改label相对于maker的位置
       			content : count + "个矫正对象"
       		});
        }
           
        marker.on("click",function() {
            var point1=[this.G.extData.lng,this.G.extData.lat];
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

   			if (this.G.extData.count == 1) {
   				var infoWindow = new AMap.InfoWindow({ 
       				isCustom:true,  //使用自定义窗体
       				content : resultInfo(this.G.extData),
       				offset:new AMap.Pixel(20, -44)
       			});
       			infoWindow.open(map, point1);
			}
   			else {
   				var infoWindow = new AMap.InfoWindow({ 
       				isCustom:true,  //使用自定义窗体
       				content : resultInfo2(this.G.extData),
       				offset:new AMap.Pixel(20, -44)
       			});
       			infoWindow.open(map, point1);
   			}
   		});

        pathMarkerArr.push(marker);  
	}
	progressClose();
}



function drawMapForData(){
	closeInfoWindow();
	
    for (var i = pathContentArr.length - 1; i >= 0; i--) {  
        pathContentArr[i].setMap(null);  
    }  
    for (var i = pathMarkerArr.length - 1; i >= 0; i--) {  
        pathMarkerArr[i].setMap(null);  
    }  
    pathMarkerArr=[];  
    pathContentArr=[];  
    drawMarkerByDistance(map.getZoom());
}



function resultInfo2(data){
	var info = "<table class='info-table'>"
	+ "<tr style='height:30px;'><td colspan='4' style='border-bottom: 1px solid blue;'>"
	+ "<span style='float:right;margin:3px 5px 0px 0px;'><img src='${ctxStatic}/style/images/close2.gif' onclick='closeInfoWindow()' style='cursor:pointer;'></span>"
	+ "</td></tr>"
	+ "<tr><td colspan='4'>"
	+ "<span style='font-size:12px;margin:auto 3px;'><b>多点合并，请缩放更高等级查看</b></span>"
	+ "</td></tr></table>"
	+ "<div style='text-align: center;height: 0px;width: 100%;clear: both;position: relative;'>"
	+ "<img src='${ctxStatic}/style/images/sharp.png'>"
	+ "</div></div>";
		
	return info;
}



