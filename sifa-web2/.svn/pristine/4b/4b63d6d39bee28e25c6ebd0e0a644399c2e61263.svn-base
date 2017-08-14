<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<form id="chartSearchForm"  style="padding-bottom: 10px;padding-top: 10px;">
	<div data-options="region:'east',border:true,split:false,title:'查询条件'" style="width: 240px;">
        <div class="easyui-layout" data-options="fit:true,border:true">
        <div region="center" border="false">
         <c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">
          <sys:sysGroup hiddenId="groupId" hiddenName="groupId" chartId="chartTabs" />
          </c:if>
           <div class="easyui-panel search-form" data-options="fit:true,border:false" title="<c:if test="${!fns:isLeafGroup(fns:getSysAccount().groupId) }">查询项目</c:if>" style="width:100%;">
        
			<table>
				<tr>
					<td class="search-title">矫正状态：</td>
					<td>
						<input name="dicStatusKey" id="chart_dicStatusKey" class="easyui-combobox" data-options="valueField:'key',textField:'value',url:'${ctx}/sys/sysDic/getDicValueByParent?tabName=common_table&columnName=dicStatusKey&parentKey=13000&showAll=1',panelHeight:'auto',panelMaxHeight:200,editable:false">
					</td>
				</tr>
				<tr>
				<td class="search-title">统计起始：</td>
					<td><input name="searchStartDate" id="chart_searchStartDate" class="Wdate easyui-validatebox" onfocus="var chart_searchEndDate=$dp.$('chart_searchEndDate');WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'chart_searchEndDate\')}'})"   editable="false"  /></td>
				</tr>
				<tr>
				<td class="search-title">统计截止：</td>
					<td><input name="searchEndDate" id="chart_searchEndDate" class="Wdate easyui-validatebox" onfocus="WdatePicker({skin:'blueFresh',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'chart_searchStartDate\')}'})"   editable="false"  /></td>
				</tr>
			</table>
		
		</div>
		</div>
		 <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" >
		 <a href="#" class="easyui-linkbutton" iconCls="icon-search" id="searchChartBtn">查询</a> &nbsp;&nbsp; 
			<a href="#" class="easyui-linkbutton" iconCls="icon-undo" id="clearChartBtn">清空</a></div>
		</div>
	</div>
	</form>
	<div region="center" border="false">
		<div class="easyui-layout" style="width:100%;height:100%;">
			<div data-options="region:'center',title:'center title',border:false,noheader:true,fit:true" style="background:#eee;">
				<div id="chartTabs" class="easyui-tabs" style="width:100%;height:100%;">   
				    <div title="性别统计"  data-options="closable:false"  style="overflow:auto;display:none;">   

				    </div>   
				    <div title="年齡统计" data-options="closable:false" style="overflow:auto;display:none;">       
				    	
				    </div>
				    <div title="刑罚类型统计" data-options="closable:false" style="overflow:auto;display:none;">       
				    	
				    </div> 
				    <div title="户籍类型统计" data-options="closable:false" style="overflow:auto;display:none;">       
				    	
				    </div> 
				    <div title="犯罪类型统计" data-options="closable:false" style="overflow:auto;display:none;">       
				    	
				    </div>    
			</div>
		</div>
		</div>
		
	</div>
</div>

<script type="text/javascript">
	var tabs=$('#chartTabs');
	var href='';
	var searchIndex='';//查询使用下标
	$(function(){
		//按照显示的页面进行查询
		$('#searchChartBtn').click(function() {
			var groupId=$('#groupId').val();//部门id
			if(typeof(groupId)=="undefined"){ //司法所groupId设置为空
				groupId='';
			} 
			var dicStatusKey=$('#chart_dicStatusKey').combobox('getValue');
			var searchStartDate=$('#chart_searchStartDate').val();//统计截止时间
			var searchEndDate=$('#chart_searchEndDate').val();//统计截止时间
			//var searchIndex=$('#groupchartTabs').val()-0;//得到tabs下标
    	 	var searchTab=tabs.tabs('getTab',searchIndex);//搜索的tab
    	 	var searchHref='';

    	 	if(searchIndex==0){
    	 		searchHref='${ctx}/statistics/chart/sex?groupId='+groupId+'&dicStatusKey='+dicStatusKey+'&searchStartDate='+searchStartDate+'&searchEndDate='+searchEndDate;
   			 }else if(searchIndex==1){
   				searchHref='${ctx}/statistics/chart/age?groupId='+groupId+'&dicStatusKey='+dicStatusKey+'&searchStartDate='+searchStartDate+'&searchEndDate='+searchEndDate;
   			 }else if(searchIndex==2){
   				searchHref='${ctx}/statistics/chart/penalType?groupId='+groupId+'&dicStatusKey='+dicStatusKey+'&searchStartDate='+searchStartDate+'&searchEndDate='+searchEndDate;
   			 }else if(searchIndex==3){
   				searchHref='${ctx}/statistics/chart/hjlx?groupId='+groupId+'&dicStatusKey='+dicStatusKey+'&searchStartDate='+searchStartDate+'&searchEndDate='+searchEndDate;
   			 }else if(searchIndex==4){
   				searchHref='${ctx}/statistics/chart/crimeInfo?groupId='+groupId+'&dicStatusKey='+dicStatusKey+'&searchStartDate='+searchStartDate+'&searchEndDate='+searchEndDate;
   			 }
    	 	searchTab.panel('refresh', searchHref);//局部更新面板
		});

		$('#clearChartBtn').click(function () {
			$('#groupId').val('');
			$('#chart_dicStatusKey').combobox('reset');
			$('#chartSearchForm').form('clear');
			$('#searchChartBtn').click();
		});
	});
	tabs.tabs({
		'onSelect':function(title,index){
			$('#groupchartTabs').val(index);
			searchIndex=index-0;
			 var tab = tabs.tabs('getSelected');
			 if(title=='性别统计'){
				 href='${ctx}/statistics/chart/sex';
			 }else if(title=='年齡统计'){
				 href='${ctx}/statistics/chart/age';
			 }else if(title=='刑罚类型统计'){
				 href='${ctx}/statistics/chart/penalType';
			 }else if(title=='户籍类型统计'){
				 href='${ctx}/statistics/chart/hjlx';
			 }else if(title=='犯罪类型统计'){
				 href='${ctx}/statistics/chart/crimeInfo';
			 }
			 tabs.tabs('update',{  
			        tab:tab,  
			        options:{  
			            title:title,  
			           	href:href,
			            closable:false,  
			            selected:true  
			        }  
			    });
			 href='';
		}
	});
	</script>
