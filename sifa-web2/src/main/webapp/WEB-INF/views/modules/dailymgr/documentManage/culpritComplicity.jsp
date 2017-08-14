<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form  action="${ctx}/culpritinfo/culpritComplicity/save" method="post" id="culpritComplicityInfo">
   	 <input type="hidden" value="${culpritComplicity.culpritId}" name="culpritId"/>
    <input type="hidden" name="id" value=""/>
     <div class="easyui-panel" title="同案犯信息" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
            	<tr>
                   <th width="10%"><span class="c-red">*</span>姓名：</th>
				   <td  width="40%"><input name="name" id="name" required=true missingMessage="姓名不能为空!" class="f1 easyui-textbox" data-options="validType:'chinaName'"/></td>
					<th width="10%"><span class="c-red">*</span>性别：</th>
					<td><input name="dicSexKey" id="dicSexKey" class="easyui-combobox" required=true value="" 
                    			data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=10000',panelHeight:'auto',editable:false"></input></td>
                </tr>
                <tr>
                	<th >出生日期：</th>
					<td><input  name="birthday" value="" editable=false
								 class="Wdate easyui-validatebox" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"/></td>
               		<th >所在监狱：</th>
					<td><input  name="prison" class="f1 easyui-textbox" /></td>
                
                
                </tr>
                <tr>
                	<th><span class="c-red">*</span>原判刑罚：</th>
					<td><input name="dicYpxfKey" class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'value',url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=72000',panelHeight:'auto',editable:false"></input></td>
					<th>刑期（月）：</th>
					<td><input name="adjudgePeriod" class="easyui-numberbox" data-options="min:1" /></td>
					
                </tr>
                <tr>
                	<th>罪名：</th>
					<td colspan="3"><input  name="crime" class="f1 easyui-textbox" /></td>
                </tr>
                <tr>
					<th>家庭住址：</th>
					<td colspan="3">
					<input  name="address" value="" class="f1 easyui-textbox" style="width:700px;"/></td>
                </tr>
                <tr>
					<th>备注：</th>
					<td colspan="3">
    					<textarea  name="note" id="note" class="easyui-validatebox"  multiline="true" 
							onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)' 
							style="width:700px;height:50px;overflow:hidden;" maxlength=200></textarea>
							<br/>
							<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
							</p>
    				</td>
                </tr>
            </table>

    </div>
     <div class="easyui-panel"  title="同案犯信息" style="width:100%;padding:5px;margin:0 auto;height:70%;">
	 <table class="easyui-datagrid" id="culpritComplicity_list_content" style="height:100%;width:100%"
			data-options="singleSelect:true,collapsible:true,striped:true,rownumbers:true,loadMsg: '数据正在加载,请耐心的等待...' ,
			fitColumns:true,url:'${ctx}/culpritinfo/culpritComplicity/list?culpritId=${culpritComplicity.culpritId}',method:'post',
					onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详细',plain:true,iconCls:'fi-info icon-blue'}); 
                        $('.organization-easyui-linkbutton-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                        $('.easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true">编号</th>
					<th data-options="field:'name',width:'10%',align:'center'">姓名</th>
					<th data-options="field:'dicSexKey',width:'10%',align:'center',formatter:formatSex" editor="text">性别</th>
					<th data-options="field:'birthday',width:'10%',align:'center'" editor="text">出生年月</th>
					<th data-options="field:'crime',width:'15%',align:'center'" editor="text">罪名</th>
					<th data-options="field:'dicYpxfKey',width:'15%',align:'center',formatter:formatYpxf" editor="text">被判处刑罚</th>
					<th data-options="field:'prison',width:'20%',align:'center'" editor="text">所在监狱</th>
					<th data-options="field:'_opt',width:'18%',align:'center'" formatter="formatterCom">操作</th>
				</tr>
			</thead>
		</table>
	 </div>
	 <div style="text-align:center;margin:30px" >
	 	<a  href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" data-options="iconCls:'icon-save'" >保存</a>
	 </div>
	 
	</form>
	<div id="comDialog" title="详情" modal=true resizable=true maximizable=true data-options="iconCls:'fi-info icon-blue'"
		class="easyui-dialog" closed=true style="width:1000px;height:380px;padding:5px">
		<form id="comDialogForm">
			<table width="100%" class="grid">
            	<tr>
                   <th width="10%">姓名：</th>
				   <td  width="40%"><input name="name"  class="f1 easyui-textbox" readonly="readonly"/></td>
					<th width="10%">性别：</th>
					<td><input name="dicSexKey" class="f1 easyui-textbox" readonly="readonly"/></td>
                </tr>
                <tr>
                	<th >出生日期：</th>
					<td><input  name="birthday"  class="f1 easyui-textbox" readonly="readonly"/></td>
               		<th >所在监狱：</th>
					<td><input  name="prison" class="f1 easyui-textbox" readonly="readonly"/></td>
                
                
                </tr>
                <tr>
                	<th>原判刑罚：</th>
					<td><input name="dicYpxfKey" class="f1 easyui-textbox" readonly="readonly"/></td>
					<th>刑期（月）：</th>
					<td><input name="adjudgePeriod" class="f1 easyui-textbox" readonly="readonly"/></td>
					
                </tr>
                <tr>
                	<th>罪名：</th>
					<td colspan="3"><input  name="crime" class="f1 easyui-textbox" readonly="readonly"/></td>
                </tr>
                <tr>
					<th>家庭住址：</th>
					<td colspan="3">
					<input  name="address" value="" class="f1 easyui-textbox" style="width:700px;" readonly="readonly"/></td>
                </tr>
                <tr>
					<th>备注：</th>
					<td colspan="3">
    					<textarea  name="note" id="note" class="easyui-validatebox"  style="width:700px;height:100px" readonly="readonly"></textarea>
							
    				</td>
                </tr>
                <tr>
                	<td style="text-align:center" colspan="4">
                		<a  href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#comDialogForm').form('clear');$('#comDialog').dialog('close');" data-options="iconCls:'fi-x icon-blue'" >关闭</a>
                	</td>
                </tr>
            </table>
            </form>
	</div> 
    <script>
        function submitForm(){
        	 $('#culpritComplicityInfo').form('submit');
        }
        $(function() {
        	$('#culpritComplicityInfo').form({
        		url:'${ctx}/culpritinfo/culpritComplicity/save',
        		onSubmit:function(o){
        			//o.culpritId='${culpritComplicity.culpritId}';
        			return $(this).form('validate');
        		},
        		success:function(data){
        			data = JSON.parse(data);
        			if(data.status==200){
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        				//2刷新datagrid 
    					$('#culpritComplicity_list_content').datagrid('reload');
        			}else{
        				alert(data.msg);
        			}
        			
        		}
        	});	
         
        });
        function formatSex(value,row,index){
    		if(value==10001){
    			return '男';
    		}else{
    			return '女';
    		}
    	}
        function formatYpxf(value,row,index){
    		if(value){
    			return sy.getDicValue('culpritJudgment', 'dicYpxfKey',value, '') 
    		}else{
    			return value;
    		}
    	}
        
        function formatterCom(val,row,index){  
        	var space = '&nbsp;';
        	var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="comDetail(\''+index+'\')">详细</a>'+space; 
        	operation+='<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" onclick="comUpdate(\''+index+'\')">修改</a>'+space;
        	operation+='<a href="javascript:void(0);" class="easyui-linkbutton-del" onclick="comDelete(\''+row.id+'\')">删除</a>';

        	return operation;
        }
        
        function comUpdate(index){  
        $('#culpritComplicityInfo').form('clear');
        $('#culpritComplicity_list_content').datagrid('selectRow',index); 
       	var arr = $('#culpritComplicity_list_content').datagrid('getSelections');
       	$('#culpritComplicityInfo').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
   			id : arr[0].id,
   			culpritId : arr[0].culpritId,
   			name : arr[0].name,
   			dicSexKey : arr[0].dicSexKey,
   			birthday : arr[0].birthday,
   			prison : arr[0].prison,
   			crime : arr[0].crime,
   			adjudgePeriod : arr[0].adjudgePeriod,
   			dicYpxfKey :arr[0].dicYpxfKey,
   			address:arr[0].address,
   			note:arr[0].note
   		});
       	$('#culpritComplicity_list_content').datagrid('unselectAll'); 
       }
        
        
        
        
       function comDetail(index){  
    	 $('#culpritComplicity_list_content').datagrid('selectRow',index); 
       	var arr = $('#culpritComplicity_list_content').datagrid('getSelections');
       	$('#comDialogForm').form('clear');
    	$('#comDialogForm').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
   			name : arr[0].name,
   			dicSexKey : sy.getDicValue('common_table','sex',arr[0].dicSexKey,''),
   			birthday : arr[0].birthday,
   			prison : arr[0].prison,
   			crime : arr[0].crime,
   			adjudgePeriod : arr[0].adjudgePeriod,
   			dicYpxfKey :sy.getDicValue('culpritJudgment','dicYpxfKey',arr[0].dicYpxfKey,''),
   			address:arr[0].address,
   			note:arr[0].note
   		});
    	$('#comDialog').dialog('open');
       	$('#culpritComplicity_list_content').datagrid('unselectAll'); 
       }
        
        
        
        function comDelete(id){
     	   $.messager.confirm('提示信息', '确认删除?', function(r) {
     			if (r) {
     				$.post('${ctx}/culpritinfo/culpritComplicity/delete', {
     					id: id
     				}, function(result) {
     					//1 刷新数据表格 
     					$('#culpritComplicity_list_content').datagrid('reload');
     					$.messager.show({
     						title : '提示信息!',
     						msg : '删除成功'
     					});
     				});
     			} else {
     				return;
     			}
     		});
     	}
        
        
        
        
	
    </script>

