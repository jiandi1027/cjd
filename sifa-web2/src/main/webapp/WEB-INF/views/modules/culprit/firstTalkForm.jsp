<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<div>
 <form  action="${ctx}/dailymgr/talk/save" method="post" id="talkformAdd">
 	<c:choose>
 		<c:when test="${empty talk.culpritId }">
 		
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="true" hiddenValue="" formId="culpritInfo" isSelect="true"/>
 		</c:when>
 		<c:otherwise>
 	
 			<sys:culpritInfo hiddenId="culpritId" hiddenName="culpritId" id="culpritName" name="culpritName" required="false" hiddenValue="${talk.culpritId}" formId="culpritInfo" isSelect="false"/>
 		</c:otherwise>
 	</c:choose>
 
 	
     <div class="easyui-panel" title="谈话教育信息" style="width:100%;margin-bottom: 30px;padding:5px">
     	   <input type="hidden" name="isFirstTalk" value="0"/>
           <input type="hidden" name="id" value="${talk.id }"/>
           <input type="hidden" name="finshInfo2" value="1"/>
            <table width="100%" class= "grid">
                <tr>
                	<th width = "10%"><span style="color:red;">*</span>谈话日期：</th>
                    <td width = "23%"><input value="<fmt:formatDate value="${talk.talkTime}"
									pattern="yyyy-MM-dd"/>" name="talkTime" required=true missingMessage="谈话日期不能为空！" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"
                    editable="false" class= "Wdate easyui-validatebox" /></td>
                    <th width = "10%"><span style="color:red;">*</span>谈话人：</th>
                    <td width = "23%"><input value="${talk.talkor }" required=true missingMessage="谈话人不能为空！" name="talkor" id="talkor" class="f1 easyui-textbox"/></td>
                     <th width = "10%">记录人：</th>
                    <td width="23%"><input value="${talk.recorder }" name="recorder" id="recorder" class="f1 easyui-textbox" /></td>
                </tr>
                  <tr>
                    <th width = "10%"><span style="color:red;">*</span>谈话开始时间：</th>
                    <td width = "23%"><input value="<fmt:formatDate value="${talk.talkStartTime}"
									pattern="yyyy-MM-dd HH:mm:ss"/>" name="talkStartTime" id="talkStartTime" required=true missingMessage="谈话开始时间不能为空！" onfocus="var talkEndTime=$dp.$('talkEndTime');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'talkEndTime\')}'})""
                    editable="false" class= "Wdate easyui-validatebox" /></td>
                     <th width = "10%"><span style="color:red;">*</span>谈话结束时间：</th>
                    <td colspan="3"><input value="<fmt:formatDate value="${talk.talkEndTime}" 
									pattern="yyyy-MM-dd HH:mm:ss"/>" name="talkEndTime" id="talkEndTime" required=true missingMessage="谈话结束时间不能为空！" onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'talkStartTime\')}'})"
                    editable="false" class= "Wdate easyui-validatebox" /></td>
                </tr>
                <tr>
                 <th><span style="color:red;">*</span>谈话地点：</th>
                    <td colspan="5"><input name="addressPro" id="addressPro" class="easyui-combobox" required=true 
                    	data-options="valueField:'id',textField:'areaName',url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaLevel=1',panelHeight:'200',editable:false" value='${talk.addressPro }'></input>省
                    	<input name="addressCity" id="addressCity" class="easyui-combobox" required=true editable=false value= '${talk.addressCity}'></input>市
                    	<input name="addressCountry" id="addressCountry" class="easyui-combobox" required=true editable=false value = '${talk.addressCountry }'></input>县（区）
                    	<input id="addressStreet" name="addressStreet" class="f1 easyui-textbox" value = '${talk.addressStreet }' />乡镇（街道）
                    	<input name="addressDetail" id="addressDetail" class="f1 easyui-textbox" value = '${talk.addressDetail }' />（详细门牌号）
                    </td>
                    </tr>
                <tr rowspan="5">
                    <th width="10%">谈话记录：</th>
					<td colspan="5" >
						 <textarea  name="record" id="record" class="easyui-validatebox"  multiline="true"
						onkeydown='textarealength(this,2000)' onkeyup='textarealength(this,2000)' 
							style="width:80%;height:400px;" maxlength=2000>${talk.record }</textarea>
						<br/>
						<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">2000</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
						</p>
					</td>
                </tr> 
                <tr rowspan="5">
                    <th>备注：</th>
						<td colspan="5"  >
						<textarea  name="note" id="note" class="easyui-validatebox"  multiline="true"
						onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)' 
							style="width:80%;height:50px;" maxlength=200>${talk.note }</textarea>
						<br/>
						<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
						</p>
                </tr>
            </table>           
    </div>
   <div style="display:none">
         <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" id="firstTalkSaveBtn" onclick="submitForm()">保存</a>
    </div> 
    </form>
    <script>
    var reportType;
        function submitForm(){
        	 $('#talkformAdd').form('submit');
        }
        function clearForm(){
            $('#talkformAdd').form('clear');
        }
        $(function() {
        	$('#talkformAdd').form({
        		url:'${ctx}/dailymgr/talk/save',
        		onSubmit:function(){
        			if($(this).form('validate')){
            			return true;
        			}	
        			return false;
        		},
        		success:function(data){
        			data = JSON.parse(data);
        			if(data.status==200){
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        				$('#firstTalkDialog').dialog('close');
        				$('#finshInfo2').html('已完成');
        			}else{
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
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
        
        /*选择固定居住省触发省下面的市*/
   		$('#addressPro').combobox({    
   			onSelect: function(record){
        		$('#addressCity').combobox({    
        			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
        		    valueField:'id',    
        		    textField:'areaName',
        		    editable:'false'    
        		}); 
			}   
   		}); 
        /*选择固定居住省触发省下面的市*/
   		$('#addressCity').combobox({    
   			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent=46',    
   		    valueField:'id',    
   		    textField:'areaName',
		    editable:'false'    
   		}); 
       /*选择固定市触发市下面的县*/
       $('#addressCity').combobox({
       		onSelect: function(record){
       			$('#addressCountry').combobox({    
       			url:'${ctx}/culpritinfo/culprit/findAreaByLevel?areaParent='+record.id,    
       		    valueField:'id',    
       		    textField:'areaName',
    		    editable:'false' 
       	
       			}); 
			}
		});
        
        
        
        textarealength("#record",2000);
        textarealength("#note",200);
        
});
        

    </script>
</div>

