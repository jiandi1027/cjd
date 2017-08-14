<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>


 <div id="documentLay" class="easyui-layout" style="width:100%;height:100%;">
<div data-options="region:'center',title:'center title',border:false,noheader:true" style="background:#eee;">
	<div id="documentTabs2" class="easyui-tabs" style="width:100%;height:100%;">   
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
	</div>
</div>
</div>
<script type="text/javascript">

$(function(){
	var documentId2='${culprit.id}'
		var tabs2=$('#documentTabs2');
	tabs2.tabs({
		'onSelect':function(title,index){
			 var tab = tabs2.tabs('getSelected');
			 if(title=='请假管理'){
				 href2='${ctx}/dailymgr/askLeave/Doclist?culpritId='+documentId2;
			 }else if(title=='同案犯信息'){
				 href2='${ctx}/culpritinfo/culpritComplicity/docList?culpritId='+documentId2;
			 }else if(title=='基本信息'){
				 href2='${ctx}/culpritinfo/culprit/information?id='+documentId2;
			 }else if(title=='个人资料'){
				 href2='${ctx}/culpritinfo/culprit/person?id='+documentId2;
			 }else if(title=='法律文书'){
				 href2='${ctx}/culpritinfo/culprit/culpritLaw?id='+documentId2;
			 }else if(title=='刑罚执行信息'){
				 href2='${ctx}/culpritinfo/culprit/culpritJudgment?id='+documentId2;
			 }else if(title=='文档管理'){
				 href2='${ctx}/culpritinfo/culpritDoc/docManager?culpritId='+documentId2;
			 }
			 tabs2.tabs('update',{  
			        tab:tab,  
			        options:{  
			            title:title,  
			           // content:'<iframe name="indextab" scrolling="auto" src="'+href+'" frameborder="0" style="width:100%;height:100%;"></iframe>',
			           	href:href2,
			            closable:false,  
			            selected:true  
			        }  
			    });
			 href2='';
		}
	});
});
</script> 

