<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>档案修改</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body id="lay" class="easyui-layout" style="width:100%;height:100%;">
<div data-options="region:'center',title:'center title',border:false,noheader:true" style="background:#eee;">
	<div id="tabs" class="easyui-tabs" style="width:100%;height:100%;">   
	    <div title="基本信息" data-options="closable:false"  style="display:none;">      
	    </div>   
	    <div title="法律文书" data-options="closable:false" style="overflow:auto;display:none;">       
	    </div>   
	    <div title="个人资料" data-options="closable:false" style="display:none;">      
	    </div>
	    <div title="刑罚执行信息" data-options="closable:false" style="display:none;">      
	    </div>
	    <div title="同案犯信息" data-options="closable:false" style="display:none;">      
	    </div>
	    <div title="文档管理" data-options="closable:false" style="display:none;">      
	    </div>
	    <div title="日常报到" data-options="closable:false" style="display:none;">      
	    </div>
	     <div title="请假管理" data-options="closable:false" style="display:none;">      
	    </div>    
	</div>
</div> 
</body>
<script type="text/javascript">
var id='${culprit.id}'
var tabs=$('#tabs');
var href='';
$(function(){
	//选项卡组件
	
	//初始化
	var firstHref='${ctx}/culpritinfo/culprit/information?id='+id;
	var title='基本信息';
	tabs.tabs('select',title);
	var tab=tabs.tabs('getSelected');
	tabs.tabs('update',{  
        tab:tab,  
        options:{  
            title:title,  
            content:'<iframe name="indextab" scrolling="auto" src="'+firstHref+'" frameborder="0" style="width:100%;height:100%;"></iframe>',  
            closable:false,  
            selected:true  
        }  
    });
});
tabs.tabs({
	'onSelect':function(title,index){
		 var tab = tabs.tabs('getSelected');
		 if(title=='请假管理'){
			 href='${ctx}/dailymgr/askLeave/Doclist?culpritId='+id;
		 }else if(title=='同案犯信息'){
			 href='${ctx}/culpritinfo/culpritComplicity/docList?culpritId='+id;
		 }else if(title=='基本信息'){
			 href='${ctx}/culpritinfo/culprit/information?id='+id;
		 }else if(title=='个人资料'){
			 href='${ctx}/culpritinfo/culprit/person?id='+id;
		 }else if(title=='法律文书'){
			 href='${ctx}/culpritinfo/culprit/culpritLaw?id='+id;
		 }else if(title=='刑罚执行信息'){
			 href='${ctx}/culpritinfo/culprit/culpritJudgment?id='+id;
		 }else if(title=='文档管理'){
			 href='${ctx}/culpritinfo/culpritDoc/docManager?culpritId='+id;
		 }else if(title=='日常报到'){
			 href='${ctx}/dailymgr/dailyReport/dailyReportDoc?culpritId='+id;
		 }
		 tabs.tabs('update',{  
		        tab:tab,  
		        options:{  
		            title:title,  
		            content:'<iframe name="indextab" scrolling="auto" src="'+href+'" frameborder="0" style="width:100%;height:100%;"></iframe>',  
		            closable:false,  
		            selected:true  
		        }  
		    });
		 href='';
	}
});
</script>
</html>