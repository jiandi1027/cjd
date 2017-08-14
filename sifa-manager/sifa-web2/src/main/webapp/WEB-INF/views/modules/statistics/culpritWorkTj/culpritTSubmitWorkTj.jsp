<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript">
	$(function(){
		$('#culpritWorkTjContent').form({
       		url:'${ctx}/statistics/culpritWorkTj/submit',
       		onSubmit:function(){
       			 progressLoad();
       			 /* var isValid = $(this).form('validate');
                    if (!isValid) {
                        progressClose();
                    }
                    return isValid;  */
       		},
       		success:function(data){
       		 	progressClose();
       			data = JSON.parse(data);
       			if(data.status==200){
       				$.messager.show({
       					title:'提示信息!' ,
       					msg:data.msg
       				});
       				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');
       				 parent.$.modalDialog.handler.dialog('close'); 
       			}else{
       				 parent.$.messager.alert('错误', data.msg, 'error');
       			}
       			
       		}
       	});	
});
	
	var workId='';
	//退回操作
	function returnTj(id){
		workId=id;
		$('#returnForm').form('clear');
		$('#returnDialog').dialog('open');
	}
	
	function returnSave(){
		var isValid = $('#returnForm').form('validate');
        if (!isValid) {
        	return false; 
        }
        var returnReason=$('#returnReason').val();
		$.messager.confirm('提示信息', '确认退回?', function(r) {
			if (r) {
				$.ajax({
					type : 'post',
					url : '${ctx}/statistics/culpritWorkTj/returnTj?id='+workId,
					cache : false,
					async : false, //同步请求
					data:{'returnReason':returnReason},
					dataType : 'json',
					success : function(result) {
						if(result.status==200){
							$.messager.show({
								title : '提示信息!',
								msg : result.msg
							});
						}	
					}
				}); 
				$('#returnDialog').dialog('close');
				$(deleteTd).parent().remove();  
			} else {
				return;
			}
		});
	}
	
	var deleteTd='';
	function getClear(k){//删除td
		deleteTd=k;
	}
	
	function  returnTjClose(){
		$('#returnDialog').dialog('close');
		workId='';
		deleteTd='';
		$('#returnForm').form('clear');
	}
	
	
</script>
<style>
.table td{
	border-right:1px solid;border-bottom:1px solid;
}
</style>
<div style="margin:0 2px;padding:0;font-size:16px;font-family:Arial, Helvetica, sans-serif;">
<form  action="${ctx}/statistics/culpritWorkTj/submit" method="post" id="culpritWorkTjContent">
	<input type="hidden" name="id" id="id" value="${culpritWorkTj.id}"/>
	<div class="easyui-panel" style="width:100%;border:0;" align="center">
			<div  style="font-size:24px;font-weight:bold;text-align:center;width:700px;">社区矫正工作季度统计表(${culpritWorkTj.year}年第${culpritWorkTj.jd}季度)</div><br/>
			<table width="100%" style="margin-top:10px;border-collapse:collapse;text-align: left;width:1000px;">
				<tr style="font-size:16px;font-weight:bold;">
					<td>填报部门：${culpritWorkTj.groupName}</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;建表人：${creater}</td>
					<td style="text-align: right">填报时间：<fmt:formatDate value="${reportTime}"
									pattern="yyyy年MM月dd日" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			</table>
			<table class="table"  style="border-collapse:collapse;border-bottom:0px solid;border-left:1px solid;text-align: left;width:1000px;;margin-top:8px;" >
				<tr style="text-align: center;">
					<td rowspan="3" width="3%" style="border-top:1px solid">序号</td>
					<td rowspan="3" width="10%;" style="border-top:1px solid">乡镇（街道）</td>
					<td colspan="6" align="center" style="border-top:1px solid">司法所工作人员情况</td>
					<td rowspan="3" width="8%" style="border-top:1px solid">社区矫正人员总数</td>
				    <td rowspan="3" width="8%" style="border-top:1px solid">外出社区矫正人员数</td>
					<td rowspan="3" width="23%" style="border-top:1px solid">备注</td>
					<td rowspan="3" style="border-right: 0;border-top:0;border-bottom: 0;style="border-top:1px solid""></td>
				</tr>
				<tr style="text-align: center;">
				    <td rowspan="2" width="8%">工作人员总数</td>
				    <td colspan="4" align="center">编制情况</td>
					<td rowspan="2" width="8%">司法所性质</td>
				</tr>
				<tr style="text-align: center;">
					<td width="8%">司法行政编制人数</td>
					<td width="8%">地方行政编制人数</td>
					<td width="8%">事业编制人数</td>
					<td width="8%">聘用人员人数</td>
				</tr>
				<!-- 未上报或退回且为司法所 -->
				<c:forEach items="${childTjList}" var="culpritTj" varStatus="count">
				<c:choose > 
		 			<c:when test="${culpritTj.dicState ne 91801 && groupleavel eq 2}">
						<tr  style="text-align: center;">
							  <td>${count.count}</td>
							  <td>${culpritTj.groupName}</td>
							  <td><input style="width:50px;text-align: center" name="sfsgzryzs" class="easyui-textbox" value="${culpritTj.sfsgzryzs}"/></td>
							  <td><input style="width:50px;text-align: center" name="sfxzbz" class="easyui-textbox" value="${culpritTj.sfxzbz}"/></td>
							  <td><input style="width:50px;text-align: center" name="dfxzbz" class="easyui-textbox" value="${culpritTj.dfxzbz}"/></td>
							  <td><input style="width:50px;text-align: center" name="sybz" class="easyui-textbox" value="${culpritTj.sybz}"/></td>
							  <td><input style="width:50px;text-align: center" name="pyry" class="easyui-textbox" value="${culpritTj.pyry}"/></td>
							  <td><input style="width:50px;text-align: center" name="sfskind" class="easyui-textbox" value="${culpritTj.sfskind}"/></td>
							  <td><input style="width:50px;text-align: center" name="allPersons" class="easyui-textbox" value="${culpritTj.allPersons}"/></td>
							  <td><input style="width:50px;text-align: center" name="outPersons" class="easyui-textbox" value="${culpritTj.outPersons}"/></td>
							  <td><input style="width:200px;text-align: center" name="note" class="easyui-textbox" value="${culpritTj.note}"/></td>
							  
						</tr>
					</c:when>
					<c:when test="${culpritTj.dicState eq 91801 && groupleavel ne 2}"> 
					<tr  style="text-align: center;">
						  <td >${count.count}</td>
						  <td >${culpritTj.groupName}</td>
						  <td >${culpritTj.sfsgzryzs}</td>
						  <td >${culpritTj.sfxzbz}</td>
						  <td >${culpritTj.dfxzbz}</td>
						  <td >${culpritTj.sybz}</td>
						  <td >${culpritTj.pyry}</td>
						  <td >${culpritTj.sfskind}</td>
						  <td >${culpritTj.allPersons}</td>
						  <td >${culpritTj.outPersons}</td>
						  <td >${culpritTj.note}</td>
						  <td onClick='getClear(this);' style="border-right: 0;border-top:0;border-bottom: 0;"><a  href="#" class="easyui-linkbutton" onclick="returnTj('${culpritTj.id}');" data-options="iconCls:'fi-record icon-blue'">退回</a></td>
						</tr>
					</c:when>
	 				<c:when test="${culpritTj.dicState ne 91801 && groupleavel ne 2}"> 
					<tr  style="text-align: center;">
							  <td>${count.count}</td>
							  <td><span style="color:#FF0000" class="noArrowUp">${culpritTj.groupName}(未上报)</span></td>
							  <td></td>
							  <td></td>
							  <td></td>
							  <td></td>
							  <td></td>
							  <td></td>
							  <td></td>
							  <td></td>
							  <td></td>
							  <td style="border-right: 0;border-top:0;border-bottom: 0;"></td>
						</tr>
					</c:when>
					</c:choose>
					</c:forEach>
					<c:if test="${culpritWorkTj.dicState ne 91801 && groupleavel eq 2}">
						<tr  style="text-align: center;">
						  <td></td>
						  <td>合计</td>
						  <td>${culpritWorkTj.sfsgzryzs}</td>
						  <td>${culpritWorkTj.sfxzbz}</td>
						  <td>${culpritWorkTj.dfxzbz}</td>
						  <td>${culpritWorkTj.sybz}</td>
						  <td>${culpritWorkTj.pyry}</td>
						  <td>${culpritWorkTj.sfskind}</td>
						  <td>${culpritWorkTj.allPersons}</td>
						  <td>${culpritWorkTj.outPersons}</td>
						  <td>${culpritWorkTj.note}</td>
						  <td style="border-right: 0;border-top:0;border-bottom: 0;"></td>
						</tr>
					</c:if>
					<c:if test="${culpritWorkTj.dicState ne 91801 && groupleavel ne 2}">
						<tr  style="text-align: center;">
						  <td></td>
						  <td>合计</td>
						  <td><input style="width:50px;text-align: center" name="sfsgzryzs" class="easyui-textbox" value="${culpritWorkTj.sfsgzryzs}"/></td>
							  <td><input style="width:50px;text-align: center" name="sfxzbz" class="easyui-textbox" value="${culpritWorkTj.sfxzbz}"/></td>
							  <td><input style="width:50px;text-align: center" name="dfxzbz" class="easyui-textbox" value="${culpritWorkTj.dfxzbz}"/></td>
							  <td><input style="width:50px;text-align: center" name="sybz" class="easyui-textbox" value="${culpritWorkTj.sybz}"/></td>
							  <td><input style="width:50px;text-align: center" name="pyry" class="easyui-textbox" value="${culpritWorkTj.pyry}"/></td>
							  <td><input style="width:50px;text-align: center" name="sfskind" class="easyui-textbox" value="${culpritWorkTj.sfskind}"/></td>
							  <td><input style="width:50px;text-align: center" name="allPersons" class="easyui-textbox" value="${culpritWorkTj.allPersons}"/></td>
							  <td><input style="width:50px;text-align: center" name="outPersons" class="easyui-textbox" value="${culpritWorkTj.outPersons}"/></td>
							  <td><input style="width:200px;text-align: center" name="note" class="easyui-textbox" value="${culpritWorkTj.note}"/></td>
							  <td style="border-right: 0;border-top:0;border-bottom: 0;"></td>
						</tr>
					</c:if>
					
			</table>
			<div style="text-align: left;width:1000px;">注： 1. 没有社区矫正人员的乡镇（街道）也要填入表格。</div>
			<div style="text-align: left;width:1000px;">2. 每季度第一个月5日前上报。</div>
</div>
</form>
</div>

<div id="returnDialog" title="退回意见" modal=true  closable=true data-option="iconCls:'fi-record icon-blue'"
	        maximizable=true class="easyui-dialog" closed=true style="width: 600px;padding:5px;" 
	        data-options="buttons:[{
				text:'保存',
				iconCls:'icon-save',
				handler:function(){returnSave();}
			},{
				text:'关闭',
				iconCls:'fi-x icon-blue',
				handler:function(){returnClose();}
			}]">
		<form id="returnForm" action="" method="post" autocomplete="off">
			<table width="100%" class="grid">
				<tr>
                    <th width="20%"><span class="c-red">*</span>退回原因：</th>
					<td>
					<textarea  name="returnReason" id="returnReason" class="easyui-validatebox"  multiline="true" 
						onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)'  required=true
							style="width:80%;height:100px;overflow:hidden;" maxlength=200></textarea>
						<br/>
						<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
						</p>
					</td>
                </tr> 
			</table>
		</form>
	</div>
