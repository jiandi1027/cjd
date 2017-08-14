<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

 <form  action="" method="post" id="escortedInfo">
 	<input type="hidden" name="id" id="escortedId"/>
 	<input type="hidden" name="culpritId" value="${culprit.id }" />
     <div class="easyui-panel"  style="width:100%;padding:5px;">
            <table width="100%" class="grid">
            	<tr>
                    <th width="10%">矫正对象：</th>
                    <td width="90%">${culprit.name }</td>
                </tr>
                <tr>
                    <th>方案名称：</th>
                    <td>
                    <textarea  name="schemeName" id="schemeName" class="easyui-validatebox"  multiline="true"  required=true missingMessage="方案名称不能为空!"
						onkeydown='countChar("schemeName","schemeName_counter",100);' onkeyup='countChar("schemeName","schemeName_counter",100);' 
							style="width:400px;height:18px;overflow:hidden;" maxlength=100></textarea>
						<br/>
						<span>备注：此处还可以输入<span style="font-size:12px;color:red" id="schemeName_counter">100</span>个字</span>
                    </td>
                </tr>
                 <tr rowspan="5">
                    <th>矫正意见：</th>
					<td colspan="5">
					<textarea  name="schemeOpinion" id="schemeOpinion" class="easyui-validatebox"  multiline="true" 
						onkeydown='countChar("schemeOpinion","schemeOpinion_counter",200);' onkeyup='countChar("schemeOpinion","schemeOpinion_counter",200);' 
							style="width:800px;height:80px;overflow:hidden;" maxlength=200></textarea>
						<br/>
						<span>备注：此处还可以输入<span style="font-size:12px;color:red" id="schemeOpinion_counter">200</span>个字</span>
					</td>
                </tr> 
                <tr rowspan="5">
                    <th>矫正措施：</th>
					<td colspan="5">
					<textarea  name="schemeStep" id="schemeStep" class="easyui-validatebox"  multiline="true"
						onkeydown='countChar("schemeStep","schemeStep_counter",500);' onkeyup='countChar("schemeStep","schemeStep_counter",500);' 
							style="width:800px;height:100px;overflow:hidden;" maxlength=500></textarea>
						<br/>
						<span>备注：此处还可以输入<span style="font-size:12px;color:red" id="schemeStep_counter">500</span>个字</span>
					</td>
                </tr>
                <tr>
                	<th colspan="2" style="text-align:center;"><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="saveForm()" id="saveBtn">保存</a>
                		&nbsp;&nbsp;&nbsp;&nbsp;<a id="printBtn" class="easyui-linkbutton"  data-options="iconCls:'fi-clipboard-pencil'"  disabled=true onclick="printScheme()" >打印《社区服刑人员矫正方案》</a>
                	</th>
                </tr> 
            </table>
           
    </div>
    </form>
     <div class="easyui-panel" title="矫正方案列表" style="width:100%;">
     	<table class="easyui-datagrid" id="scheme_list_content" style="height: 200px;"
			data-options="singleSelect:true,collapsible:true,striped:true,rownumbers:true,fitColumns:true,loadMsg: '数据正在加载,请耐心的等待...'  ,pagination:true,pageSize: 5 ,pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/sys/scheme/list',method:'post',queryParams:{culpritId:'${culprit.id }'}">
			<thead>
				<tr>
					<th data-options="field:'schemeName',width:'40%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">矫正方案名称</th>
					<th data-options="field:'created',width:'30%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">创建时间</th>
					<th data-options="field:'action',width:'30%',align:'center'" formatter="formatterScheme">操作</th>
				</tr>
			</thead>
		</table>
    </div>
    <div id="printScheme"></div>
    <script type="text/javascript">
       function saveForm(){
        	 $('#schemeInfo').form('submit');
        }
       function schemeUpdateBtn(){
    	   $('#schemeUpdateForm').form('submit');
       }
       /*  function clearForm(){
            $('#culpritInfo').form('clear');
        }*/
        /*选择证件时确定证件号码类型,更改name属性*/
        $(function(){
        	
        	
			
        });
        //新增表单
        $('#schemeInfo').form({
    		url:'${ctx}/sys/scheme/save',
    		onSubmit:function(o){
    			return $(this).form('validate');
    		},
    		success:function(data){
    			data = JSON.parse(data);
    			if(data.status==200){
    				$.messager.show({
    					title:'提示信息!' ,
    					msg:data.msg
    				});	
    				$('#schemeName').val('');
    				$('#schemeOpinion').val('');
    				$('#schemeStep').val('');
    				$('#scheme_list_content').datagrid('reload');
    				$('#finshInfo5').html('已完成');
    			
    			}else{
    				alert(data.msg);
    			}
    			
    		}
    	});
        
        
        function formatterScheme(val,row,index){ 
        	
        	var operation=$.formatString('<a href="javascript:schemeDetail(\'{0}\',\'{1}\',\'{2}\',\'{3}\');"  title="详情"><span style="color:blue;"><strong><u>详情</u><strong></span></a>', row.id,row.schemeName,row.schemeOpinion,row.schemeStep);
        	operation+='&nbsp;&nbsp;&nbsp;&nbsp;'+$.formatString('<a href="javascript:schemeUpdate(\'{0}\',\'{1}\',\'{2}\',\'{3}\');"  title="修改"><span style="color:blue;"><strong><u>修改</u><strong></span></a>', row.id,row.schemeName,row.schemeOpinion,row.schemeStep);
        	operation+='&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="schemeDelte(\''+row.id+'\')">删除</a>'
        	return operation;
        }
        //打开详细页面
        function schemeDetail(id,name,opinion,schemeStep){
        	$('#schemeInfo').form('clear');
        	$('#schemeInfo').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
    			id : id,
    			culpritId : '${culprit.id}',
    			schemeName : name,
    			schemeOpinion : opinion,
    			schemeStep : schemeStep
    		});
        	
        	
        	$('#schemeName').attr("readOnly",true);
        	$('#schemeOpinion').attr("readOnly",true);
        	$('#schemeStep').attr("readOnly",true);
        	$('#saveBtn').linkbutton('disable');
        	$('#printBtn').linkbutton('enable');
        	
        }
        
        //修改
        function schemeUpdate(id,name,opinion,schemeStep){
        	$('#schemeName').attr("readOnly",false);
        	$('#schemeOpinion').attr("readOnly",false);
        	$('#schemeStep').attr("readOnly",false);
        	$('#saveBtn').linkbutton('enable');
        	$('#printBtn').linkbutton('disable');
        	
        	$('#schemeInfo').form('clear');
        	$('#schemeInfo').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
    			id : id,
    			culpritId : '${culprit.id}',
    			schemeName : name,
    			schemeOpinion : opinion,
    			schemeStep : schemeStep
    		});
        }
        
       
      	

        
    </script>
 
