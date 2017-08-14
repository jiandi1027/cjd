<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form  action="${ctx}/datacenter/systemFile/save" method="post" id="systemFileInfo">
     <div class="easyui-panel" style="width:100%;padding:5px;margin:0 auto;">
            <table width="100%" class="grid">
                <tr>
                    <th width="20%">制度文件：</th>
                    <td><div id="systemFileUpload"></div>
                    </td>
                </tr>
            </table>
    </div>
    </form>
    <script>
        $(function() {
        	$("#systemFileUpload").powerWebUpload({ auto: true,fileNumLimit:5,serverPath:'${ctx}/servlet/file/upload',fileType:'doc,xls,docx,xlsx,pdf,zip,jpg,png',fileSingleSizeLimit:50});	
        	
        	$('#systemFileInfo').form({
        		url:'${ctx}/datacenter/systemFile/save',
        		onSubmit:function(){
        			 progressLoad();
        		},
        		success:function(data){
        			progressClose();
        			data = JSON.parse(data);
        			if(data.status==200){
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        				
        				 parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                         parent.$.modalDialog.handler.dialog('close');
    					
        			}else{
        				 parent.$.messager.alert('错误', result.msg, 'error');
        			}
        			
        		}
        	});	
        
       
        });
        
       
    </script>
