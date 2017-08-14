<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/lib/upload/webuploader.css" />
<script type="text/javascript" src="${ctxStatic}/lib/upload/webuploader.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/lib/upload/MyWebUpload.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic }/extJs.js" charset="utf-8"></script>
<!-- 单条滚动条 -->


<div id="documentLay" class="easyui-layout" style="width:100%;height:100%;">
<div data-options="region:'center',title:'center title',border:false,noheader:true,fit:true" style="background:#eee;">
	<div id="documentTabs" class="easyui-tabs" style="width:100%;height:100%;">   
	    <div title="基本信息" data-options="closable:false,fit:true"  style="display:none;">      
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
	    <div title="监管等级记录" data-options="closable:false" style="display:none;">      
	    </div> 
	    <div title="思想汇报" data-options="closable:false" style="display:none;">      
	    </div> 
	    <div title="谈话教育" data-options="closable:false" style="display:none;">      
	    </div> 
	    <div title="走访登记" data-options="closable:false" style="display:none;">      
	    </div> 
	    <div title="学习教育" data-options="closable:false" style="display:none;">      
	    </div>
	    <div title="社区服务" data-options="closable:false" style="display:none;">      
	    </div>
	    <div title="奖惩信息" data-options="closable:false" style="display:none;">      
	    </div> 
	    <div title="修改记录" data-options="closable:false" style="display:none;">      
	    </div> 
	</div>
</div>
</div>
<script type="text/javascript">
var documentId='${culprit.id}'
var tabs=$('#documentTabs');
var href='';
$(function(){

});
tabs.tabs({
	'onSelect':function(title,index){
		 var tab = tabs.tabs('getSelected');
		 if(title=='请假管理'){
			 href='${ctx}/dailymgr/askLeave/Doclist?culpritId='+documentId;
		 }else if(title=='同案犯信息'){
			 href='${ctx}/culpritinfo/culpritComplicity/docList?culpritId='+documentId;
		 }else if(title=='基本信息'){
			 href='${ctx}/culpritinfo/culprit/information?id='+documentId;
		 }else if(title=='个人资料'){
			 href='${ctx}/culpritinfo/culprit/person?id='+documentId;
		 }else if(title=='法律文书'){
			 href='${ctx}/culpritinfo/culprit/culpritLaw?id='+documentId;
		 }else if(title=='刑罚执行信息'){
			 href='${ctx}/culpritinfo/culprit/culpritJudgment?id='+documentId;
		 }else if(title=='文档管理'){
			 href='${ctx}/culpritinfo/culpritDoc/docManager?culpritId='+documentId;
		 }else if(title=='日常报到'){
			 href='${ctx}/dailymgr/dailyReport/dailyReportDoc?culpritId='+documentId;
		 }else if(title=='监管等级记录'){
			 href='${ctx}/dailymgr/gradeChange/gradeDoclist?culpritId='+documentId;
		 }else if(title=='思想汇报'){
			 href='${ctx}/dailymgr/thinkReport/thinkReportDoclist?culpritId='+documentId;
		 }else if(title=='谈话教育'){
			 href='${ctx}/dailymgr/talk/talkDoclist?culpritId='+documentId;
		 }else if(title=='走访登记'){
			 href='${ctx}/dailymgr/interview/inerviewDoclist?culpritId='+documentId;
		 }else if(title=='学习教育'){
			 href='${ctx}/dailymgr/study/studyDoclist?culpritId='+documentId;
		 }else if(title=='社区服务'){
			 href='${ctx}/dailymgr/workfree/workfreeDoclist?culpritId='+documentId;
		 }else if(title=='奖惩信息'){
			 href='${ctx}/culpritinfo/culprit/rewardspunishment?id='+documentId;
		 }else if(title=='修改记录'){
			 href='${ctx}/culpritinfo/culpritUpdateInfo/updateInfoDoclist?culpritId='+documentId;
		 }
		 tabs.tabs('update',{  
		        tab:tab,  
		       
		        options:{  
		            title:title,  
		           // content:'<iframe name="indextab" scrolling="auto" src="'+href+'" frameborder="0" style="width:100%;height:100%;"></iframe>',
		           	href:href,
		            closable:false,  
		            selected:true  
		        }  
		    });
		 href='';
	}
});
</script> 

