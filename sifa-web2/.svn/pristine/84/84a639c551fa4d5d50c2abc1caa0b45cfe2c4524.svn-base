<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>



<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="talkSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        	<div region="center" border="false">
	        	<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
					<sys:sysGroup hiddenId="groupId" hiddenName="groupId" dataGridId="talkform"/>
		        </c:if>
         		<div class="easyui-panel search-form" data-options="fit:true,border:false" id="p2" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目 </c:if>" style="width:100%;">
				<table>
					<tr>
						<td class="search-title" >矫正对象：</td>
						
						<td><input name="culpritName" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title" >谈&nbsp;&nbsp;话&nbsp;&nbsp;人：</td>
						<td><input data-options=' panelHeight : "auto",panelMaxHeight : "200"' name="talkor" id="searchTalkor" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td class="search-title" >记&nbsp;&nbsp;录&nbsp;&nbsp;人：</td>
						<td><input name="recorder" class="easyui-textbox" /></td>
					</tr>
					<tr>
				<td class="search-title">谈话开始：</td>
					<td><input name="searchStartDate" id="searchStartDate" class="Wdate" 
                   			onfocus="var searchEndDate=$dp.$('searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',onpicked:function(){searchEndDate.focus();},maxDate:'#F{$dp.$D(\'searchEndDate\')}'})" /></td>
				</tr>
				<tr>
				<td class="search-title">谈话截止：</td>
					<td><input name="searchEndDate" id="searchEndDate" class="Wdate" 
							onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'searchStartDate\')}'})" /></td>
				</tr>
				</table>
				</div>
			</div>
		 	<div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
				<a href="#" class="easyui-linkbutton" id="searchGroupBtn" iconCls="icon-search" onclick="javascript:$('#talkform').datagrid('load' ,$.serializeObject($('#talkSearchForm')));">查询</a> &nbsp;&nbsp; 
				<a href="#" class="easyui-linkbutton" id="cleanGroupBtn" iconCls="icon-undo" onclick="javascript:$('#searchTalkor').form('clear');javascript:$('#talkSearchForm').form('clear');">清空</a>
			</div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<table class="easyui-datagrid" id="talkform" title="谈话教育列表"
			style="height: 400px;"
			data-options="singleSelect:true,fit:true,collapsible:true,striped:true,toolbar:talkToolbar,
			loadMsg: '数据正在加载,请耐心的等待...' ,pagination:true,pageSize: 10 ,
			pageList:[5,10,15,20,50],fitColumns:true,url:'${ctx}/dailymgr/talk/list',method:'post',onLoadSuccess:function (data) {
						$('.easyui-linkbutton-edit').linkbutton({text:'修改',plain:true,iconCls:'fi-pencil icon-blue'});
                        $('.organization-easyui-linkbutton-info').linkbutton({text:'详情',plain:true,iconCls:'fi-info icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',checkbox:true,width:80" ></th>
					<th style="width: 20%;" data-options="field:'culpritName',align:'center'"
						editor="text">矫正对象</th>
					<th style="width: 20%;" data-options="field:'talkor',align:'center'"
						editor="text">谈话人</th>
						<th style="width: 10%;" data-options="field:'recorder',align:'center'"
						editor="text">记录人</th>
						<th style="width: 30%;"
						data-options="field:'talkStartTime',align:'center',sortable:true,formatter:Common.formatDate"
						>谈话日期</th>
						<th data-options="field:'_opt',align:'center',formatter:talkformatOper" style = "width:18%">操作</th>  

				</tr>
			</thead>
		</table>
	</div>
</div>
<div id="talkToolbar" style="display: none;">
   
        <a onclick="addTalk('');" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">新增</a>
        
    
</div>

<script type="text/javascript">

	
function addTalk() {

	    
	    parent.$.modalDialog({
	        title : '新增谈话教育',
	        iconCls:'fi-plus icon-green',
	        width : 1000,
	        height : 600,
	        href : '${ctx}/dailymgr/talk/add',
	        resizable : true,
	        maximizable:true,
	        buttons : [ {
	            text : '保存',
	            iconCls:'icon-save',
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#talkform').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#talkformAdd');
	                 f.submit();
	             }
	        },{
	            text : '重置',
	            iconCls:'icon-undo',
	            handler : function() {
	           	 var f = parent.$.modalDialog.handler.find('#talkform');
	           	 f.get(0).reset(); //清空表单数据 
	            }
	        },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	             	parent.$.modalDialog.handler.dialog('close');
	             }
	        }]
	    });
	}
	
	//查询
	$('#searchbtn').click(function() {
		$("#talkform").datagrid('load',serializeForm($('#searchForm')));
		
	});
	  //加载树  
    $('#comboTree').combotree({        
        url:'${ctx}/sys/sysGroup/loadGroupTree',  
        onClick:function(node){  
            //单用户单击一个节点的时候，触发  
            $("input[name='groupId']").val(node.id);  
        },  
        checkbox:false,  
        multiple:false  
    }); 
	//js方法：序列化表单 			
	function serializeForm(form) {
		var obj = {};
		$.each(form.serializeArray(),
				function(index) {
					if (obj[this['name']]) {
						obj[this['name']] = obj[this['name']] + ','
								+ this['value'];
					} else {
						obj[this['name']] = this['value'];
					}
				});
		return obj;
	}
	
	function talkformatOper(val,row,index){  
		var operation='';
			var operation='<a href="javascript:void(0);" class="organization-easyui-linkbutton-info"  onclick="talkDetail(\''+row.id+'\')"></a>&nbsp;&nbsp;&nbsp;&nbsp;';
			var operation=operation+'<a href="javascript:void(0);" class="easyui-linkbutton-edit"   onclick="editTalk(\''+row.id+'\')"></a>&nbsp;&nbsp;&nbsp;&nbsp;';
	    return operation;
	} 
	

 	function talkDetail(id){
 		 parent.$.modalDialog({
	         title : '谈话教育详情',
	         iconCls:'fi-info icon-blue',
	         width : 1000,
	         height : 500,
	         href : '${ctx}/dailymgr/talk/detail?id='+id,
	         maximizable:true, 
	         buttons : [{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	             	parent.$.modalDialog.handler.dialog('close');
	             }
	         } 
	         ]
	     });
	} 
 	
 	 function editTalk(id){
 		 parent.$.modalDialog({
	         title : '修改谈话教育',
	         iconCls:'fi-pencil icon-blue',
	         width : 1000,
	         height : 600,
	         href : '${ctx}/dailymgr/talk/add?id='+id,
	         maximizable:true, 
	         buttons : [ {
	             text : '保存',
	             iconCls:'fi-save icon-blue',
	             handler : function() {
	                 parent.$.modalDialog.openner_dataGrid = $('#talkform').datagrid();//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
	                 var f = parent.$.modalDialog.handler.find('#talkformAdd');
	                 f.submit();
	             }
	         },{
		            text : '重置',
		            iconCls:'icon-undo',
		            handler : function() {
		           	 var f = parent.$.modalDialog.handler.find('#talkform');
		           	 f.get(0).reset(); //清空表单数据 
		            }
		        },{
	             text : '关闭',
	             iconCls:'fi-x icon-blue',
	             handler : function() {
	             	parent.$.modalDialog.handler.dialog('close');
	             }
	         }
	         ]
	     });
 	}
	
 	var Common = {
 		    formatDate: function (value) {
 		        if (value == null || value == '') {
 		            return '';
 		        }
 		        var dt;
 		        if (value instanceof Date) {
 		            dt = value;
 		        } else {
 		            dt = new Date(value);
 		        }
 		        return dt.format("yyyy-MM-dd"); //扩展的Date的format方法(上述插件实现)
 		    }
 		}
 	
	$('#searchTalkor').combobox({    
   		mode : 'remote',
	    url:'${ctx}/sys/sysAccount/findSysAccount?groupId='+'${fns:getSysAccount().groupId }',    
	    valueField:'id',    
	    textField:'accountname'
	   
	}); 
	</script>
