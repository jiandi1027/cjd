<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" style="width:100%;height:100%;">
<div data-options="region:'center',border:false,noheader:true">
	<div id="hjlxTabs" class="easyui-tabs" style="width:100%;height:100%;" data-option="">   
	    <div title="户籍类型分析图" data-options="closable:false,fit:'true'"  style="display:none;">   
			
	    </div>   
	    <div title="户籍类型分析表" data-options="closable:false,fit:'true'" style="display:none;">       
	    	
	    </div>
	</div>   
</div>
</div>
<script type="text/javascript">
    var hjlxTabs=$('#hjlxTabs');
	var href='';
	$(function(){

	});
	hjlxTabs.tabs({
		tabPosition:'bottom',
		tabWidth:150,
		tabHeight:50,
		pill:true,
		'onSelect':function(title,index){
			 var tab = hjlxTabs.tabs('getSelected');
			 if(title=='户籍类型分析图'){
				 href='${ctx}/statistics/chart/hjlxMap?groupId=${groupId}&dicStatusKey=${dicStatusKey}&searchStartDate=${searchStartDate}&searchEndDate=${searchEndDate}';
			 }else if(title=='户籍类型分析表'){
				 href='${ctx}/statistics/chart/hjlxBook?groupId=${groupId}&dicStatusKey=${dicStatusKey}&searchStartDate=${searchStartDate}&searchEndDate=${searchEndDate}';
			 }
			 hjlxTabs.tabs('update',{  
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