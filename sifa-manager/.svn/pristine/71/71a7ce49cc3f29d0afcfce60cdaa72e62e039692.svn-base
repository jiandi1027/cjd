<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/monitoring/drift/detail" method="post" id="driftDetailForm">
	
	<div class="easyui-panel" id="p2" title="" style="width: 100%; padding: 5px;margin: 0 auto;">
		<table width="100%" class="grid">
			<tr>
				<th width="10%">矫正对象：</th>
				<td width="40%">${drift.culpritName }</td>
				<th width="10%">反馈人：</th>
				<td width="40%">${drift.createrName }</td>
			</tr>
			<tr>
				<th width="10%">定位号码：</th>
				<td width="40%">${drift.mobilenumber }</td>
				<th width="10%">定位方式：</th>
				<td width="40%">${fns:getSysDicValueByKey('SF_TERMINAL_ACTIVITY', 'location_type', drift.type, '') }</td>
			</tr>
			<tr>
				<th width="10%">定位时间：</th>
				<td width="90%" colspan="3"><fmt:formatDate value="${drift.gpstime}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
			</tr>
			<tr>
				<th width="10%">漂移经度：</th>
				<td width="40%">${drift.oldLon }</td>
				<th width="10%">漂移纬度：</th>
				<td width="40%">${drift.oldLat }</td>
			</tr>
			<tr>
				<th width="10%">漂移位置：</th>
				<td width="90%" colspan="3">${drift.oldLocation }
			</tr>
			<tr>
				<th width="10%">实际经度：</th>
				<td width="40%">${drift.newLon }</td>
				<th width="10%">实际纬度：</th>
				<td width="40%">${drift.newLat }</td>
			</tr>
			<tr>
				<th width="10%">实际位置：</th>
				<td width="90%" colspan="3">${drift.newLocation }</td>
			</tr>
			<tr height="200px;">
				<th width="10%">位置信息：</th>
           		<td id="map" colspan="3" width="90%"></td>
			</tr>
			<tr>
				<th width="10%">情况说明：</th>
				<td width="90%" colspan="3">
					<textArea id="note" name="note" class="easyui-validatebox" readonly="readonly" style="width: 80%;height:50px;overflow:auto;resize:none;" >${drift.note }</textArea>
				</td>
			</tr>
		</table>
	</div>
</form>
<script type="text/javascript">
var map;
map = new AMap.Map("map");
map.setZoomAndCenter(9, [ 120.670738, 28.005425 ]);
map.plugin([ "AMap.Geocoder", "AMap.convertFrom" ], function() {
	var point1 = new AMap.LngLat('${drift.newLon }','${drift.newLat }');//实际坐标
	var point2 = new AMap.LngLat('${drift.oldLon }','${drift.oldLat }');//漂移坐标
	var geocoder = new AMap.Geocoder({
		radius : 1000,
		extensions : "all",
		batch : false
	});
	new AMap.convertFrom(point1,"gps",function(status, result) {
		geocoder.getAddress(result.locations[0], function(status,resulta) {
			var marker1 = new AMap.Marker({
				position : result.locations[0],
				icon : new AMap.Icon({
					image : '${ctxStatic}/style/images/0202.png'
				}),
				offset : new AMap.Pixel(-12,-20)
			});
			marker1.setLabel({//label默认蓝框白底左上角显示，样式className为：amap-marker-label
				offset : new AMap.Pixel(-18, 25),//修改label相对于maker的位置
				content : "实际位置"
			});
			
			map.panTo(result.locations[0]);
			marker1.setMap(map);
			marker1.setAnimation('AMAP_ANIMATION_DROP');
			map.setFitView();
		});
	});
	new AMap.convertFrom(point2,"gps",function(status, result) {
		geocoder.getAddress(result.locations[0], function(status,resulta) {
			var marker2 = new AMap.Marker({
				position : result.locations[0],
				icon : new AMap.Icon({
					image : '${ctxStatic}/style/images/0202.png'
				}),
				offset : new AMap.Pixel(-12,-20)
			});
			marker2.setLabel({//label默认蓝框白底左上角显示，样式className为：amap-marker-label
				offset : new AMap.Pixel(-18, 25),//修改label相对于maker的位置
				content : "漂移位置"
			});
			
			map.panTo(result.locations[0]);
			marker2.setMap(map);
			marker2.setAnimation('AMAP_ANIMATION_DROP');
			map.setFitView();
		});
	});
})
map.setFitView();
</script>