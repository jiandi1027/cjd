<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>请假管理</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>

</head>

<body>
 <form  action="${ctx}/dailymgr/askLeave/save" method="post" id="culpritInfo">
     <div class="easyui-panel" title="矫正对象基本信息" style="width:100%;padding:10px;">
     		
            <table width="100%">
                <tr>
                    <td><span class="c-red">*</span>姓名:</td>
                    <td colspan="5"><input name="culpritId" id="culpritId" class="easyui-combogrid" required=true
						 missingMessage="姓名不能为空!"
						 /></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td><input name="dicSexKey" id="dicSexKey" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>民族:</td>
                    <td><input name="nation" id="nation" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>身份证号:</td>
                    <td><input name="identification" id="identification" class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
                <tr>
                    <td>曾用名:</td>
                    <td><input name="alias" id="alias" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>出生日期:</td>
                    <td><input name="birthday" id="birthday" class="f1 easyui-textbox"  readonly="readonly"></input></td>
                     <td>文化程度:</td>
                    <td><input name="dicWhcdKey" id="dicWhcdKey" class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
                
                 <tr>
                    <td>婚姻状况:</td>
                    <td><input name="dicHyzkKey" id="dicHyzkKey" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>职业:</td>
                    <td><input name="job" id="job" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>原政治面貌:</td>
                    <td><input name="dicYzzmmKey" id="dicYzzmmKey" class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
                 <tr>
                    <td>籍贯:</td>
                    <td><input name="origin" id="origin" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>户籍所在地:</td>
                    <td><input name="regResidenceStreet" id="regResidenceStreet" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>现居住地:</td>
                    <td><input name="addressDetail" id="addressDetail"  class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
                <tr>
                    <td>刑法执行类别:</td>
                    <td><input name="email" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>矫正开始时间:</td>
                    <td><input name="redressStartDate" id="redressStartDate" class="f1 easyui-textbox" readonly="readonly"></input></td>
                     <td>矫正结束时间:</td>
                    <td><input name="redressEndDate" id="redressEndDate" class="f1 easyui-textbox" readonly="readonly"></input></td>
                </tr>
               
            </table>
           
    </div>
    
   
     <div class="easyui-panel" title="相关信息" style="width:100%;padding:10px;">
            <table width="100%">
                <tr>
                   <td><span class="c-red">*</span>违纪原因:</td>
                 </tr> 
				<tr>
					<tr><td><select id="dicReasonTypeKey" class="f1 easyui-combobox" name="dicReasonTypeKey" missingMessage="违纪原因不能为空!"
							required="true"		style="width: 400px;">
									<option value="未按时报到">未按时报到</option>
									<option value="2次无理由不参加活动">2次无理由不参加活动</option>
									<option value="不及时销假">不及时销假</option>
									<option value="违反报告，外出，居住地变更规定">违反报告，外出，居住地变更规定</option>
									<option value="保外就医无正当理由不按时提交病情情况">保外就医无正当理由不按时提交病情情况</option>
									<option value="违反禁止令，情节轻微">违反禁止令，情节轻微</option>
									<option value="一年内违反信息核查3次（含）以上">一年内违反信息核查3次（含）以上</option>
									<option value="其他违反监督管理">其他违反监督管理</option>
									<option value="违法越界">违法越界</option>
									<option value="人机分离">人机分离</option>
									<option value="未参加集中点验">未参加集中点验</option>
					</select></td>
					</tr>
				<tr><td><span class="c-red">*</span>证据资料:</td></tr>
				
				<tr><td><input name="notePath" type="file" multiple="multiple"
						 style="width:300px;"><td></tr>	
				<tr>
					<td><span class="c-red">*</span>悔过书:</td>
				</tr>
				<tr><td><input name="repentancePath" type="file" multiple="multiple"
						 style="width:300px;"></td></tr>
				<tr>
					<td><span class="c-red">*</span>主要事实:</td>
				</tr>
				<tr><td><input class="f1 easyui-textbox"
						data-options="multiline:true" name="fact" required=true 
						style="width: 300px; height: 100px"></td></tr>
				<tr>
					<td><span class="c-red">*</span>处理依据:</td>
				</tr>
				<tr><td><input type="checkbox" name="notePathName" value="用户管理《社区矫正实施办法》第二十三条" />用户管理《社区矫正实施办法》第二十三条</td></tr>
				<tr><td><input type="checkbox" name="legalBasis" value="浙江省社区矫正实施细则（试行）》第三十六条" />《浙江省社区矫正实施细则（试行）》第三十六条</td></tr>
				<tr><td><input type="checkbox" name="legalBasisItems" value="《浙江省社区矫正人员考核奖惩办法（试行）》第四十条" />《浙江省社区矫正人员考核奖惩办法（试行）》第四十条</td></tr>
				<tr>
					<td align="center" colspan="6"><a href="javascript:void(0)"
						class="easyui-linkbutton" onclick="submitForm()">提交</a> <a
						href="javascript:void(0)" class="easyui-linkbutton"
						onclick="clearForm()">清楚</a></td>
				</tr>
			</table>
    </div>
 </form>
<script>
        function submitForm(){
        	 $('#culpritInfo').form('submit');
        }
        function clearForm(){
            $('#culpritInfo').form('clear');
        }
        $(function() {
        	$('#culpritInfo').form({
        		url:'${ctx}/jiangcheng/warning/save',
        		onSubmit:function(){
        			return $(this).form('validate');
        		},
        		success:function(data){
        			data = JSON.parse(data);
        			if(data.status==200){
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        				
        				parent.location.reload();
            			var index = parent.layer.getFrameIndex(window.name);
    					parent.layer.close(index);	
        			}else{
        				alert(data.msg);
        			}
        			
        		}
        	});	
        
        $('#culpritId').combogrid({    
        	delay: 500,
        	 panelWidth: 300, 
        	 striped:true,
        	 panelHeight: 300,
    		mode: 'remote',  
			idField: 'id',
			textField: 'name',
			url: '${ctx}/culpritinfo/culprit/list',
			columns: [[
				{field:'name',title:'姓名',width:120,align:'center'},
				{field:'dicSexKey',title:'性别',width:80,align:'center'}
			]],
			fitColumns: true,
			pagination: true,           //是否分页  
        rownumbers: true,           //序号  
        collapsible: false,         //是否可折叠的  
        method: 'post',
        onSelect:function(record){
        	 var arr = $('#culpritId').combogrid('grid').datagrid('getSelections');
        	 $('#culpritInfo').form('load',arr[0]);
       	}
        }); 
        
        
      //取得分页组件对象  
        var pager = $('#culpritId').combogrid('grid').datagrid('getPager');  
        if (pager) {  
            $(pager).pagination({  
                pageSize: 10,               //每页显示的记录条数，默认为10  
                beforePageText: '第',       //页数文本框前显示的汉字  
                afterPageText: '',
                displayMsg: ''
            });  
        }  
        });
        
	
    </script>
</body>
</html>
