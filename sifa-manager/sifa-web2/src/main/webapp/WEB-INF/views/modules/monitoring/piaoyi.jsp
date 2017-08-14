<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<form action="${ctx}/monitoring/drift/save" method="post" id="piaoyiformAdd" name="piaoyiformAdd">
     <div class="easyui-panel" style="width: 100%; padding: 5px;margin: 0 auto;">
        <table width="100%" class= "grid">
            <tr>
                <th width="20%" >矫正对象：</th>
                <td width="80%">${terminalActivity.culpritName }
           			<input type="hidden" id="culpritId" name="culpritId" value="${terminalActivity.culpritId }">
           		</td>
            </tr>
            <tr>
             	<th>定位号：</th>
                <td>${terminalActivity.mobileNumber }
           			<input type="hidden" id="mobilenumber" name="mobilenumber" value="${terminalActivity.mobileNumber }">
           		</td>
            </tr>
            <tr>
             <th>定位方式：</th>
                <td>${fns:getSysDicValueByKey('SF_TERMINAL_ACTIVITY', 'location_type', terminalActivity.locationType, '') }
           			<input type="hidden" id="type" name="type" value="${terminalActivity.locationType }">
           		</td>
            </tr>
              <tr>
             <th>定位时间：</th>
                <td><fmt:formatDate value='${terminalActivity.gpstime}' pattern="yyyy-MM-dd HH:mm:ss" />
           			<input type="hidden" id="gpstime" name="gpstime" value="<fmt:formatDate value='${terminalActivity.gpstime}' pattern='yyyy-MM-dd HH:mm:ss' />">
           		</td>
            </tr>
           	<tr>
           		<th>定位位置：</th>
           		<td><span id='terminallocation'></span>
           			<input type="hidden" id="oldLocation" name="oldLocation" value="">
           		</td>
           	</tr>
           	<tr>
           		<th>经度：</th>
           		<td><span id="gpslon">${terminalActivity.lon }</span>
           			<input type="hidden" id="oldLon" name="oldLon" value="${terminalActivity.lon }">
           		</td>
           	</tr>
           	<tr>
           		<th>纬度：</th>
           		<td><span id="gpslat">${terminalActivity.lat }</span>
           			<input type="hidden" id="oldLat" name="oldLat" value="${terminalActivity.lat }">
           		</td>
           	</tr>
           	
           	<tr>
           		<th>实际位置：</th>
           		<td>
           			<span id="actuallocation" ></span>
           			<input type="hidden" id="newLocation" name="newLocation" value="">
           		</td>
           	</tr>
           	
           	<tr>
           		<th>经度：</th>
           		<td>
           			<span id="actuallon"></span>
           			<input type="hidden" id="newLon" name="newLon" value="">
           		</td>
           	</tr>
           	
           	<tr>
           		<th>纬度：</th>
           		<td>
           			<span id="actuallat"></span>
           			<input type="hidden" id="newLat" name="newLat" value="">
           		</td>
           	</tr>
         	<tr style="height:200px;">
           		<th>选取实际位置：</th>
           		<td id='piaoyimap'></td>
           	</tr>
            <tr>
                <th>情况说明：</th>
				<td>
					<textArea id="note" name="note" class="easyui-validatebox" style="width: 80%;height:50px;overflow:hidden;"
					onkeydown='textarealength(this,200)' onKeyUp="textarealength(this,200)" onMouseOut="textarealength(this,200)" maxlength="200">${talk.note }</textArea>
					<br>
					备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red"><c:if test="${talk.note==null}">0</c:if>
					<c:if test="${talk.note!=null}">${fn:length(talk.record)}</c:if></em>个字。
				</td>
            </tr>
        </table>           
    </div>
</form>
<script>
var piaoyimap;
var piaoyiMarker;
var reportType;

piaoyimap = new AMap.Map("piaoyimap");
piaoyimap.setZoomAndCenter(9, [ 120.670738, 28.005425 ]);
map.plugin([ "AMap.Geocoder", "AMap.convertFrom" ], function() {
var point1 = new AMap.LngLat($("#gpslon").text(),$("#gpslat").text());
var geocoder = new AMap.Geocoder({
	radius : 1000,
	extensions : "all",
	batch : false
});
var clickEventListener = piaoyimap.on('click', function(e) {
	$("#actuallon").text(e.lnglat.getLng());
	$("#actuallat").text(e.lnglat.getLat());
	$("#newLon").val(e.lnglat.getLng());
	$("#newLat").val(e.lnglat.getLat());
	geocoder.getAddress(e.lnglat, function(status,result){
		$("#actuallocation").text(result.regeocode.formattedAddress);
		$("#newLocation").val(result.regeocode.formattedAddress);
	});
});		
										
new AMap.convertFrom(point1,"gps",function(status, result) {
	geocoder.getAddress(result.locations[0], function(status,resulta) {
			$("#terminallocation").text(resulta.regeocode.formattedAddress);
			$("#oldLocation").val(resulta.regeocode.formattedAddress);
			piaoyimarker = new AMap.Marker({
				position : result.locations[0],
				icon : new AMap.Icon({
					image : '${ctxStatic}/style/images/0202.png'
				}),
				offset : new AMap.Pixel(-12,-20)
			});
			piaoyimarker.setLabel({//label默认蓝框白底左上角显示，样式className为：amap-marker-label
				offset : new AMap.Pixel(-40, 25),//修改label相对于maker的位置
				content : "当前定位所在位置<br>请点击地图选择实际位置"
			});
			
			piaoyimap.panTo(result.locations[0]);
			piaoyimarker.setMap(piaoyimap);
			piaoyimarker.setAnimation('AMAP_ANIMATION_DROP');
			piaoyimap.setFitView();
		});
	});
});
piaoyimap.setFitView();

function submitForm() {
	$('#piaoyiformAdd').form('submit');
}
function clearForm() {
	$('#piaoyiformAdd').form('clear');
}
$(function() {
	$('#piaoyiformAdd').form({
		url : '${ctx}/monitoring/drift/save',
		onSubmit : function() {
			return $(this).form('validate');
		},
		success : function(data) {
			data = JSON.parse(data);
			if (data.status == 200) {
				$.messager.show({
					title : '提示信息!',
					msg : data.msg
				});
				parent.$.modalDialog.handler.dialog('close');

			} else {
				$.messager.show({
					title : '提示信息!',
					msg : data.msg
				});
			}
		}
	});
});

</script>
