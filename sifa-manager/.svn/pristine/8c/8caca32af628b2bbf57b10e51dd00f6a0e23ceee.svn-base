<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<form  action="${ctx}/sys/holiday/save" method="post" id="holidayInfo">
 	<input type="hidden"  name="id" value="${holiday.id}"/>
    <div class="easyui-panel" style="width:100%;padding:5px;magin:0 auto">
            <table width="100%" class="grid">
                <tr>
                    <th width="30%">年：</th><td>${holiday.year}</td>
                </tr>
                 <tr>
                    <th>月：</th><td>${holiday.month}</td>
                </tr>
                 <tr>
                    <th>日：</th><td>${holiday.day}</td>
                </tr>
                 <tr>
                    <th>星期：</th><td>${holiday.dayOfWeek}</td>
                </tr>
                <tr>
                    <th>是否为节假日或双休日：</th>
                    <td>
                    <input type="radio" name="isLeap" id="isLeap" value="1" <c:if test='${holiday.isLeap eq "1" }'>checked='checked'</c:if>
						style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;" />是&nbsp;&nbsp;&nbsp;
					<input type="radio" name="isLeap" value="0" <c:if test='${holiday.isLeap eq "0" || holiday.isLeap==null}'>checked='checked'</c:if>
						style="vertical-align: middle; margin-top: -2px; margin-bottom: 1px;" />否
                    </td>
                </tr>
            </table>
    </div>
</form>
    <script>
        $(function() {
        	$('#holidayInfo').form({
        		url:'${ctx}/sys/holiday/save',
        		onSubmit:function(){
        			 progressLoad();
        		},
        		success:function(data){
        			data = JSON.parse(data);
        			if(data.status==200){
        				  progressClose();
        				$.messager.show({
        					title:'提示信息!' ,
        					msg:data.msg
        				});
        				parent.$.modalDialog.handler.dialog('close');
                        parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
               		 	
        			}else{
        				 parent.$.messager.alert('错误', result.msg, 'error');
        			}
        			
        		}
        	});	
        
        });
        
	
    </script>
