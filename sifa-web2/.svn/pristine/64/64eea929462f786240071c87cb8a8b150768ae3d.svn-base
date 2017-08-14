<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/monitoring/locationhis/detail" method="post" id="locationhisDetailForm">
	
	<div class="easyui-panel" id="p2" title="" style="width: 100%; padding: 5px;margin: 0 auto;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">矫正对象：</th>
				<td width="40%">${terminalHistory.culpritName }</td>
				<th width="10%">定位号码：</th>
				<td width="40%">${terminalHistory.mobileNumber }</td>
			</tr>
			<tr>
				<th width="10%">定位方式：</th>
				<td width="40%">${fns:getSysDicValueByKey('SF_TERMINAL_ACTIVITY', 'location_type', terminalHistory.locationType, '') }</td>
				<th width="10%">定位时间：</th>
				<td width="40%"><fmt:formatDate value="${terminalHistory.gpstime}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
			</tr>
			<tr>
				<th width="10%">定位经度：</th>
				<td width="40%">${terminalHistory.lon }</td>
				<th width="10%">定位纬度：</th>
				<td width="40%">${terminalHistory.lat }</td>
			</tr>
			<tr>
				<th width="10%" rowspan="2">定位位置：</th>
				<td width="90%" colspan="3">${terminalHistory.location }
			</tr>
			<tr height="200px;">
           		<td id="locationmap" colspan="3"></td>
			</tr>
		</table>
	</div>
</form>
<script type="text/javascript">
var locationmap;

locationmap = new AMap.Map("locationmap");
locationmap.setZoomAndCenter(9, [ 120.670738, 28.005425 ]);
locationmap.plugin([ "AMap.Geocoder", "AMap.convertFrom" ], function() {
var point1 = new AMap.LngLat('${terminalHistory.lon }','${terminalHistory.lat }');
var geocoder = new AMap.Geocoder({
	radius : 1000,
	extensions : "all",
	batch : false
});
new AMap.convertFrom(point1,"gps",function(status, result) {
	geocoder.getAddress(result.locations[0], function(status,resulta) {
			locationhisoldmarker = new AMap.Marker({
				position : result.locations[0],
				icon : new AMap.Icon({
					image : '${ctxStatic}/style/images/0202.png'
				}),
				offset : new AMap.Pixel(-12,-20)
			});
			locationhisoldmarker.setLabel({//label默认蓝框白底左上角显示，样式className为：amap-marker-label
				offset : new AMap.Pixel(-18, 25),//修改label相对于maker的位置
				content : "定位位置"
			});
			
			locationmap.panTo(result.locations[0]);
			locationhisoldmarker.setMap(locationmap);
			locationhisoldmarker.setAnimation('AMAP_ANIMATION_DROP');
			locationmap.setFitView();
		});
	});
});
locationmap.setFitView();
</script>