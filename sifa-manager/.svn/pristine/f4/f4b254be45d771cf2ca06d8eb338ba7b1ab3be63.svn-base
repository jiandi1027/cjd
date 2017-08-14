<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript" src="${ctxStatic}/extJs.js" charset="utf-8"></script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<div region="center" border="false">
		<div class="easyui-panel" title="定位请求" style="width:100%;padding:5px">
			<div id='locReqItem'>
				<table width="100%" class="grid">
					<tr>
						<th width="30%"><label>终端号码：</label>
						</th>
						<td width="70%"><input type='text' name='lr_terminal' id='lr_terminal'/>
						</td>
					</tr>
					<tr>
						<th><label>终端类型：</label>
						</th>
						<td><select name="lr_tuType" id="lr_tuType">
								<option value='1'>1：手机</option>
								<option value='2'>2：车机</option>
								<option value='3'>3：哑终端</option>
						</select>
						</td>
					</tr>
					<tr>
						<th><label>定位方式：</label>
						</th>
						<td><select name="lr_locType" id="lr_locType">
								<option value='1'>1：精定位</option>
								<option value='2'>2：客户端定位</option>
								<option value='3'>3：粗定位</option>
								<option value='4'>4：GOTA定位</option>
						</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><a href="#" id="btnLocReq" class="easyui-linkbutton" iconCls="fi-check">提交</a></td>
					</tr>
					<tr>
						<th>结果：</th>
						<td><div id='lr_result'></div></td>
					</tr>
				</table>
				<br>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$('#btnLocReq').click(function() {
	$('#lr_result').html("");
	var terminal = $('#lr_terminal').val();
	var tuType = $('#lr_tuType').val();
	var locType = $('#lr_locType').val();
	
	var url = '${ctx}/sys/locationtest/locReq';

	progressLoad();
	$.ajax({
		type : 'post',
		url : url,
		data : {
			terminal : terminal,
			tuType : tuType,
			locType : locType
		},
		dataType : 'json',
		async : false,
		success : function(result) {
        	progressClose();
        	if (result.status == "200") {
	        	var data = result.data;
	        	$.messager.show({
        			title : '提示信息!',
        			msg : '定位成功'
        		});
	        	$('#lr_result').html(data);
			}
        	else {
        		$.messager.show({
        			title : '提示信息!',
        			msg : '定位失败'
        		});
        	}
		},
		error : function(result) {
        	progressClose();
			console.log(result);
		}
	});
});
</script>