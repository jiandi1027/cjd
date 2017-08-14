<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<style>
.tab_line {
    height: 21px;
    padding-left: 3px;
}
</style>

<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 290px;">
		<div class="easyui-layout" data-options="fit:true,border:false">
		    <div data-options="region:'north',border:false">
	        <form id="sysSpLocationSearchForm" style="padding-bottom: 10px;padding-top: 10px;">
				<table>
					<tr>
						<td width="35%" align="center">手机号码:</td>
						<td><input id="telnos" name="telnos" class="easyui-textbox" data-options="prompt:'(可以用英文格式下的,来分隔号码.最多可同时查询5个号码)',multiline:true" title="aaa"  style="width: 140px;height: 100px;" /></td>
					</tr>
				</table>
			</form>
			</div>
			<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="SpLocationSearchBtn" iconCls="icon-search" >查询</a> &nbsp;&nbsp;
				<a href="#" class="easyui-linkbutton" id="SpLocationBtn" iconCls="fi-target-two" >定位</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="SpLocationSearchBtn" iconCls="icon-undo" onclick="javascript:$('#sysSpLocationSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="sysSpLocation_list" title="粗定位状态查询列表" 
			data-options="singleSelect:false,collapsible:true,striped:true,loadMsg: '查询请求已发出，正在查询中,请耐心的等待...' ,
			fitColumns:true,rownumbers:true,url:'${ctx}/sys/spLocation/list',method:'post'">
		<thead>
			<tr> 
				<th data-options="field:'telno',width:100,align:'center'" >手机号码</th>
				<th data-options="field:'result',width:100,align:'center'" >查询结果</th>
				<th data-options="field:'address',width:350,align:'center'" >定位地点</th>
			</tr>
		</thead>
		</table>
		<div align="center" style="margin-top: 20px;">
		<font color="blue">
		<strong>粗定位错误代码表</strong>
		</font>
		</div>
		<table align="center" width="90%" cellspacing="0" cellpadding="0" border="1" style="margin-top: 10px;">
			<tbody>
				<tr>
					<td class="tab_line"> 0 </td><td class="tab_line"> 成功 </td>
					<td class="tab_line"> 1 </td><td class="tab_line"> 定位平台发生异常错误，如DB操作失败，出现空指针等 </td>
					<td class="tab_line"> 2 </td><td class="tab_line"> 位置服务器忙而无法处理请求。超过系统级别流量限制。 </td>
				</tr>
				<tr>
					<td class="tab_line"> 4 </td><td class="tab_line"> CP鉴权失败（受理错误） </td>
					<td class="tab_line"> 5 </td><td class="tab_line"> CP密码错误 </td>
					<td class="tab_line"> 6 </td><td class="tab_line"> 请求中确定了太多的位置项。（注释：群发号码过多） </td>
				</tr>
				<tr>
					<td class="tab_line"> 7 </td><td class="tab_line"> XML请求中参数的格式不对 </td>
					<td class="tab_line"> 8 </td><td class="tab_line"> 位置请求语法不对 </td>
					<td class="tab_line"> 9 </td><td class="tab_line"> 超过SP级别流量限制（再次定位即可） </td>
				</tr>
				<tr>
					<td class="tab_line"> 10 </td><td class="tab_line"> 取消周期定位消息时，reqid不存在。 </td>
					<td class="tab_line"> 102 </td><td class="tab_line"> 省域限制。若为省SP，SP与被定位用户不是同省时返回此错误码； </td>
					<td class="tab_line"> 104 </td><td class="tab_line"> 用户欠费或停机了。 </td>
				</tr>
				<tr>
					<td class="tab_line"> 105 </td><td class="tab_line"> 取历史位置时，获取位置失败；</td>
					<td class="tab_line"> 108 </td><td class="tab_line"> 粗定位未用此错误码。</td>
					<td class="tab_line"> 109 </td><td class="tab_line"> 终端不支持跟踪定位</td>
				</tr>
				<tr>
					<td class="tab_line"> 111 </td><td class="tab_line"> MPC内部处理失败</td>
					<td class="tab_line"> 119 </td><td class="tab_line"> APE在进行区号定位时，查不到区号记录</td>
					<td class="tab_line"> 123 </td><td class="tab_line"> 返回响应超时 </td>
				</tr>
				<tr>
					<td class="tab_line"> 128 </td><td class="tab_line"> 粗定位基站数据缺失 </td>
					<td class="tab_line"> 130 </td><td class="tab_line"> 用户关机，导致定位失败 </td>
					<td class="tab_line"> 131 </td><td class="tab_line"> 定位激活失败 </td>
				</tr>
				<tr>
					<td class="tab_line"> 132 </td><td class="tab_line"> 定位时，用户正在打电话。</td>
					<td class="tab_line"> 137 </td><td class="tab_line"> 需要调整周期定位请求中的粒度 </td>
					<td class="tab_line"> 146 </td><td class="tab_line"> 粗定位平台，收到精定位请求 </td>
				</tr>
				<tr>
					<td class="tab_line"> 147 </td><td class="tab_line"> 不允许被SP定位。(未开通) </td>
					<td class="tab_line"> 161 </td><td class="tab_line"> 不具有发送相应定位请求类型的权限 </td>
					<td class="tab_line"> 167 </td><td class="tab_line"> 手机本身的隐私设置不允许定位 </td>
				</tr>
				<tr>
					<td class="tab_line"> 168 </td><td class="tab_line"> 激活失败。 </td>
					<td class="tab_line"> 169 </td><td class="tab_line"> 用户拒绝。激活失败。</td>
					<td class="tab_line"> 170 </td><td class="tab_line"> 确认超时。激活失败。 </td>
				</tr>
				<tr>
					<td class="tab_line"> 171 </td><td class="tab_line"> MPC内部原因 </td>
					<td class="tab_line"> 175 </td><td class="tab_line"> MPC数据库返回超时。</td>
					<td class="tab_line"> 176 </td><td class="tab_line"> 没有找到正确的URL。 </td>
				</tr>
				<tr>
					<td class="tab_line"> 177 </td><td class="tab_line"> 不支持精定位 </td>
					<td class="tab_line"> 178 </td><td class="tab_line"> MPC根据MDN查询IMSI失败。</td>
					<td class="tab_line"> 179 </td><td class="tab_line"> 电信MPC内部资源失败</td>
				</tr>
				<tr>
					<td class="tab_line"> 180 </td><td class="tab_line"> 其他账号对该号码在进行定位</td>
					<td class="tab_line"> 181 </td><td class="tab_line"> 其他账号对该号码在进行定位</td>
					<td class="tab_line"> 190 </td><td class="tab_line"> 位置服务器忙而无法处理请求。</td>
				</tr>
				<tr>
					<td class="tab_line"> 200 </td><td class="tab_line"> LS的Session数已满，请求过多</td>
					<td class="tab_line"> 201 </td><td class="tab_line"> 未接收到终端发送的数据。</td>
					<td class="tab_line"> 202 </td><td class="tab_line"> 电信定位系统平台内部的错误。</td>
				</tr>
				<tr>
					<td class="tab_line"> 203 </td><td class="tab_line"> 电信定位系统平台内部的错误。</td>
					<td class="tab_line"> 204 </td><td class="tab_line"> 返回经纬度参数无效，不可用</td>
					<td class="tab_line"> 205 </td><td class="tab_line"> 内部错误(重复请求)</td>
				</tr>
				<tr>
					<td class="tab_line"> 206 </td><td class="tab_line"> 内部错误(重复请求)</td>
					<td class="tab_line"> 207 </td><td class="tab_line"> 网络忙</td>
					<td class="tab_line"> 208 </td><td class="tab_line"> 网络忙</td>
				</tr>
				<tr>
					<td class="tab_line"> 209 </td><td class="tab_line"> 定位过程中终端异常</td>
					<td class="tab_line"> 220 </td><td class="tab_line"> 网络忙，返回结果超时</td>
					<td class="tab_line"> 221 </td><td class="tab_line"> 系统故障</td>
				</tr>
				<tr>
					<td class="tab_line"> 223 </td><td class="tab_line"> 返回结果有问题，无法被定位系统识别处理</td>
					<td class="tab_line"> 224 </td><td class="tab_line"> 网络忙，返回结果超时</td>
					<td class="tab_line"> 225 </td><td class="tab_line"> 用户停机</td>
				</tr>
				<tr>
					<td class="tab_line"> 226 </td><td class="tab_line"> 用户关机，未取到位置信息</td>
					<td class="tab_line"> 227 </td><td class="tab_line"> 不在服务区，未取到位置信息</td>
					<td class="tab_line"> 228 </td><td class="tab_line"> 呼叫闭锁，通常叫“停机”，但是能查到最后位置</td>
				</tr>
				<tr>
					<td class="tab_line"> 229 </td><td class="tab_line"> 用户关机，但是能查到最后位置</td>
					<td class="tab_line"> 230 </td><td class="tab_line"> 用户不在服务区，但是能查到最后位置</td>
					<td class="tab_line"> 231 </td><td class="tab_line"> 发送消息失败</td>
				</tr>
				<tr>
					<td class="tab_line"> 232 </td><td class="tab_line"> 返回结果超时</td>
					<td class="tab_line"> 233 </td><td class="tab_line"> 返回结果失败</td>
					<td class="tab_line"> 234 </td><td class="tab_line"> 电信定位平台故障</td>
				</tr>
				<tr>
					<td class="tab_line"> 235 </td><td class="tab_line"> 内部错误，导致定位失败</td>
					<td class="tab_line"> 236 </td><td class="tab_line"> 重复的定位请求</td>
					<td class="tab_line"> 237 </td><td class="tab_line"> 超过APE的流量控制。(同时请求过多)</td>
				</tr>
				<tr>
					<td class="tab_line"> 238 </td><td class="tab_line"> 返回结果超时</td>
					<td class="tab_line"> 240 </td><td class="tab_line"> SP IP地址鉴权失败</td>
					<td class="tab_line"> 241 </td><td class="tab_line"> 业务ID鉴权失败（SPID鉴权失败）</td>
				</tr>	
				<tr>
					<td class="tab_line"> 245 </td><td class="tab_line"> 粗定位错开成精定位</td>
					<td class="tab_line"> 246 </td><td class="tab_line"> 号段信息不存在</td>
					<td class="tab_line"> 247 </td><td class="tab_line"> 隐私鉴权失败，不允许定位</td>
				</tr>
				<tr>
					<td class="tab_line"> 248 </td><td class="tab_line"> 定购关系鉴权失败</td>
					<td class="tab_line"> 249 </td><td class="tab_line"> 系统黑白名单鉴权失败</td>
					<td class="tab_line"> 250 </td><td class="tab_line"> SP注册用户鉴权失败</td>
				</tr>	
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">

$(function() {
});

$('#SpLocationSearchBtn').click(function() {
	var telnos = $('#telnos').val();
	var telnostr = telnos.split(',');
	if (telnos.trim() == '' || telnos ==null) {
		$.messager.show({
			title : "提示",
			msg : "请输入查询号码"
		});
		return;
	}
	if (telnostr.length > 5) {
		$.messager.show({
			title : "提示",
			msg : "最多只能查询5个号码"
		});
		return;
	}
	for(var i =0; i<telnostr.length;i++){
		if(!(/^1(3|4|5|7|8)\d{9}$/.test(telnostr[i]))){ 
			$.messager.show({
				title : "提示",
				msg : "号码输入有误,请重新填写"
			});
	        return; 
	    } 
	}
	
	$('#sysSpLocation_list').datagrid('load', $.serializeObject($('#sysSpLocationSearchForm')));
});

function cleanSearch() {
	$('#sysSpLocation_list').datagrid('load', {});
	$('#sysSpLocationSearchForm').form().find('input').val('');
}

function formatRole(value, row, index){
	var str = '';
	if(value!=''){
		$.ajax({
			type : 'get',
			url : '${ctx}/sys/sysRole/findById?id=' + value,
			cache : false,
			async : false, //同步请求
			dataType : 'json',
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				 /* alert(XMLHttpRequest.status);
				 alert(XMLHttpRequest.readyState);
				 alert(textStatus); */
			},
			success : function(result) {
				if(result!=null && result!=''){
					str = result.name;
				}
			}
		});
	}
	return str;
}

$('#SpLocationBtn').click(function(){
	progressLoad();
	$.ajax({
		type : 'post',
		url : '${ctx}/sys/spLocation/location?tel=' + $('#telnos').val(),
		cache : false,
		async : false, //同步请求
		dataType : 'json',
		error: function(XMLHttpRequest, textStatus, errorThrown) {
        	progressClose();
			 /* alert(XMLHttpRequest.status);
			 alert(XMLHttpRequest.readyState);
			 alert(textStatus); */
		},
		success : function(result) {
        	progressClose();
			if(result!=null && result!=''){
				var data = result.data;
				var msg = data.info;
				var locResult = data.locResult;
				if (locResult != null) {
					msg = locResult.info;
				}
				$.messager.alert('提示消息',msg);
			}
		}
	});
});
</script>
</html>
