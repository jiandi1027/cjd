<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

     <div class="easyui-panel" style="width:100%;">
     	<table class="easyui-datagrid" id="scheme_list_content" style="height: 500px;"
			data-options="singleSelect:true,collapsible:true,striped:true,rownumbers:true,toolbar:toolbarScheme, fitColumns:true,
			loadMsg: '数据正在加载,请耐心的等待...'  ,
			url:'${ctx}/sys/scheme/list',method:'post',queryParams:{culpritId:'${culprit.id }'},onLoadSuccess:function (data) {
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详细',plain:true,iconCls:'fi-info icon-blue'});
                        $('.organization-easyui-linkbutton-pencil').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-del').linkbutton({text:'删除',plain:true,iconCls:'fi-x icon-red'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'schemeName',width:'60%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">矫正方案名称</th>
					<th data-options="field:'created',width:'10%',align:'center'"
						editor="{type:'validatebox',options:{required:true}}">创建时间</th>
					<th data-options="field:'action',width:'28%',align:'center'" formatter="formatterScheme">操作</th>
				</tr>
			</thead>
		</table>
    </div>
    
    <div id="scheme"  modal=true  closable=true resizable=true
	        maximizable=true class="easyui-dialog" closed=true style="width:800px;padding:5px;">
		<form id="schemeInfo" action="" method="post"  autocomplete="off">
			<input type="hidden" name="id" value="" id="schemeId"/>
			<input type="hidden" name="culpritId" value="" />
			<input type="hidden" name="finshInfo5" value=""/>
			<table width="100%" class="grid">
				<tr>
                    <th width="15%"><span class="c-red">*</span>矫正方案名称：</th>
                    <td>
                    <textarea  name="schemeName" id="schemeName" class="easyui-validatebox"  multiline="true"  required=true missingMessage="方案名称不能为空!"
						onkeydown='textarealength(this,100)' onkeyup='textarealength(this,100)' 
							style="width:50%;height:18px;overflow:hidden;" maxlength=100></textarea>
						<br/>
						<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">100</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
						</p>
                    </td>
                </tr>
                 <tr>
                    <th><span class="c-red">*</span>矫正意见：</th>
					<td>
					<textarea  name="schemeOpinion" id="schemeOpinion" class="easyui-validatebox"  multiline="true" 
						onkeydown='textarealength(this,200)' onkeyup='textarealength(this,200)'  required=true
							style="width:80%;height:200px;overflow:hidden;" maxlength=200></textarea>
						<br/>
						<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">200</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
						</p>
					</td>
                </tr> 
                <tr>
                    <th><span class="c-red">*</span>矫正措施：</th>
					<td>
					<textarea  name="schemeStep" id="schemeStep" class="easyui-validatebox"  multiline="true"
						onkeydown='textarealength(this,500)' onkeyup='textarealength(this,500)'  required=true
							style="width:80%;height:200px;overflow:hidden;" maxlength=500></textarea>
						<br/>
						<p class="textarea-numberbar">
								备注：此处最多可以输入<em class="c-red">500</em>个字，你已输入<em class="textarea-length c-red">0</em>个字。
						</p>
					</td>
                </tr>
			</table>
		</form>
	</div>

<div id="printScheme"></div>
 <script type="text/javascript">
 	var culpritId='${culprit.id}';
    var toolbarScheme = [ {
		text : '新增',
		iconCls : 'fi-plus icon-green',
		handler : function() {
			$('#scheme').dialog({
				title : '新增矫正方案',
				iconCls : 'fi-plus icon-green',
				buttons:[{
					text:'保存',
					iconCls:'icon-save',
					handler:function(){saveForm();}
				},{
					text:'关闭',
					iconCls:'fi-x icon-blue',
					handler:function(){closeDialog();}
				}]
			});
			$('#schemeName').validatebox('enable');
		 	$('#schemeOpinion').validatebox('enable');
		 	$('#schemeStep').validatebox('enable');
			$('#schemeInfo').form('clear');
			
			$('#schemeInfo').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
				culpritId : culpritId,
				finshInfo5:1
			});
			$('#scheme').dialog('open');
		}

	}]
    
       function saveForm(){
	    	if($('#schemeInfo').form('validate')){	
				$.ajax({
					type: 'post' ,
					url: '${ctx}/sys/scheme/save',
					data:$('#schemeInfo').serialize() ,
					dataType:'json' ,
					success:function(result){
						$.messager.show({
	    					title:'提示信息!',
	    					msg:result.msg
	    				});	
	    				$('#schemeName').val('');
	    				$('#schemeOpinion').val('');
	    				$('#schemeStep').val('');
	    				$('#scheme_list_content').datagrid('reload');
	    				$('#scheme').dialog('close');
	    				$('#finshInfo5').html('已完成');
					} ,
					error:function(result){
						$.meesager.show({
							title:result.status==200?"ok":"fail" ,  
							msg:result.msg
						});
					}
				});
			} else {
				$.messager.show({
					title:'提示信息!' ,
					msg:'数据验证不通过'
				});
			}
        }
   		 function closeDialog(){
   			$('#schemeForm').form('clear');
   	    	$('#scheme').dialog('close');
   	    	$('#schemeName').textbox('enable');
   	    	$('#schemeOpinion').textbox('enable');
   	    	$('#schemeStep').textbox('enable');
    	}
    	
      
        function formatterScheme(val,row,index){ 
        	var space = '&nbsp;';
        	var operation='';
        	operation=operation+space+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-info" onclick="schemeDetail(\''+row.id+'\',\''+row.schemeName+'\',\''+row.schemeOpinion+'\',\''+row.schemeStep+'\')">详细</a>';
        	operation=operation+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-pencil" onclick="schemeUpdate(\''+row.id+'\',\''+row.schemeName+'\',\''+row.schemeOpinion+'\',\''+row.schemeStep+'\')">修改</a>';
        	operation=operation+'<a href="javascript:void(0);" class="organization-easyui-linkbutton-del" onclick="schemeDelte(\''+row.id+'\')">删除</a>';
        	return operation;
        }
        //打开详细页面
        function schemeDetail(id,name,opinion,schemeStep){
        	$('#schemeInfo').form('clear');
        	$('#schemeInfo').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
    			id : id,
    			culpritId : culpritId,
    			schemeName : name,
    			schemeOpinion : opinion,
    			schemeStep : schemeStep
    		});
        	$('#schemeName').attr("disabled","disabled"); 
        	$('#schemeOpinion').attr("disabled","disabled"); 
        	$('#schemeStep').attr("disabled","disabled"); 
        	$('#scheme').dialog({
				title : '详细',
				iconCls:'fi-info icon-blue',
				buttons:[{
					text:'打印《社区服刑人员矫正方案》',
					iconCls:'fi-print icon-blue',
					handler:function(){printScheme();}
				},{
					text:'关闭',
					iconCls:'fi-x icon-blue',
					handler:function(){closeDialog();}
				}]
			});
        	$('#scheme').dialog('open');
        }
        
        //修改
        function schemeUpdate(id,name,opinion,schemeStep){
        	$('#schemeName').removeAttr("disabled"); 
        	$('#schemeOpinion').removeAttr("disabled"); 
        	$('#schemeStep').removeAttr("disabled"); 
        	$('#schemeInfo').form('clear');
        	$('#schemeInfo').form('load', { //调用load方法把所选中的数据load到表单中,非常方便
    			id : id,
    			culpritId : culpritId,
    			schemeName : name,
    			schemeOpinion : opinion,
    			schemeStep : schemeStep,
    			finshInfo5:1
    		});
        	$('#scheme').dialog({
    			title : '修改',
    			iconCls:'fi-pencil icon-blue',
    			buttons:[{
					text:'保存',
					iconCls:'icon-save',
					handler:function(){saveForm();}
				},{
					text:'关闭',
					iconCls:'fi-x icon-blue',
					handler:function(){closeDialog();}
				}]
    		});
        	$('#scheme').dialog('open');
        }
        
        //删除方案
        function schemeDelte(id){
        	$.messager.confirm('提示', '请判断是否要执行该操作?', function(b){  
        	      if (b){  
        	    	  $.ajax({
        	  			type : 'get',
        	  			url : "${ctx}/sys/scheme/delete?id=" + id,
        	  			cache : false,
        	  			async : false, //同步请求
        	  			dataType : 'json',
        	  			success : function(result) {
        	  					$.messager.show({
        	  						title : '提示信息!',
        	  						msg : result.msg
        	  					});
        	  					$('#scheme_list_content').datagrid('reload');
        	  			}
        	  		});
        	  		
        	      }
        	});  
        	
        }
        //打印矫正方案
        function printScheme(){ 
        	var id= $('#schemeId').val();
        	 $('#printScheme').dialog({    
     		    title: '打印《社区服刑人员矫正方案》',    
     		    width: 900,    
     		    height:800,    
     		    closed: false,    
     		    cache: false,    
     		    href : '${ctx}/sys/scheme/printSchemePlan?id=' + id,
     		    modal: true,
     		   buttons :[{
     				text:'打印',
     	            iconCls:'fi-print icon-blue',
     				handler:function(){
     					$('#schemePrintBtn').click();
     				}
     			}, {
     				text:'关闭',
     				iconCls:'fi-x icon-blue',
     				handler:function(){
     					$('#printScheme').dialog('close');
     				}
     			}]
     		});    
		}  

        
    </script>
 
