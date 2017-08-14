<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<style type=text/css>
	rewardspunishmentTabs .tabs-panels>.panel>.panel-body {  
	overflow: hidden;  
	}  
</style>
<div id="rewardspunishmentLay" class="easyui-layout" style="width:100%;height:100%;">
<div data-options="region:'center',title:'center title',border:false,noheader:true" style="background:#eee;">
	<div id="rewardspunishmentTabs" class="easyui-tabs" style="width:100%;height:100%;">   
	    <div title="表扬" data-options="closable:false"  style="display:none;">      
	    </div>   
	    <div title="口头警告" data-options="closable:false" style="overflow:auto;display:none;">       
	    </div>   
	    <div title="警告" data-options="closable:false" style="display:none;">      
	    </div>
	    <div title="治安管理处罚" data-options="closable:false" style="display:none;">      
	    </div>
	    <div title="撤销假释" data-options="closable:false" style="display:none;">      
	    </div>
	    <div title="撤销缓刑" data-options="closable:false" style="display:none;">      
	    </div>
	    <div title="撤销暂予监外执行" data-options="closable:false" style="display:none;">      
	    </div>
	</div>
</div>
</div>
<script type="text/javascript">
var rewardspunishmentId='${culprit.id}';
var tabs1=$('#rewardspunishmentTabs');
var href1='';
/* $(function(){
	//选项卡组件

	//初始化
	var firstHref='${ctx}/rewardspunishment/commend/commendDoclist?culpritId='+rewardspunishmentId;
	var title='表扬';
	$('#rewardspunishmentTabs').tabs('select',title);
	var tab=$('#rewardspunishmentTabs').tabs('getSelected');
	$('#rewardspunishmentTabs').tabs('update',{  
        tab:tab,  
        options:{  
            title:title,  
            content:'<iframe name="indextab" scrolling="auto" src="'+firstHref+'" frameborder="0" style="width:100%;height:100%;"></iframe>',  
            closable:false,  
            selected:true  
        }  
    });
}); */

tabs1.tabs({
	'onSelect':function(title,index){
		 var tab1 = tabs1.tabs('getSelected');
		 if(title=='表扬'){
			  href1='${ctx}/rewardspunishment/commend/commendDoclist?culpritId='+rewardspunishmentId; 
		 }else if(title=='口头警告'){
			 href1='${ctx}/rewardspunishment/verbalWarning/warningOralDoclist?culpritId='+rewardspunishmentId;
		 }else if(title=='警告'){
			 href1='${ctx}/rewardspunishment/warning/warningDoclist?culpritId='+rewardspunishmentId;
		 }else if(title=='治安管理处罚'){
			 href1='${ctx}/rewardspunishment/securityPunishment/securityPunishmentDoclist?culpritId='+rewardspunishmentId;
		 }else if(title=='撤销假释'){
			 href1='${ctx}/rewardspunishment/revokeParole/revokeParoleDoclist?culpritId='+rewardspunishmentId;
		 }else if(title=='撤销缓刑'){
			 href1='${ctx}/rewardspunishment/revokeProbation/revokeProbationDoclist?culpritId='+rewardspunishmentId;
		 }else if(title=='撤销暂予监外执行'){
			 href1='${ctx}/rewardspunishment/revokeOutOfPrison/revokeOutOfPrisonDoclist?culpritId='+rewardspunishmentId;
		 }
		 tabs1.tabs('update',{  
		        tab:tab1,  
		        options:{  
		            title:title,  
		            /* content:'<iframe name="indextab" scrolling="auto" src="'+href+'" frameborder="0" style="width:100%;height:100%;"></iframe>',  */
		            closable:false,  
		            selected:true,
		        	href:href1
		        }  
		    });
		 href1='';
	}
});
</script> 