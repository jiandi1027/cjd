<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<%@ attribute name="hiddenId" type="java.lang.String" required="true"%>
<%@ attribute name="hiddenName" type="java.lang.String" required="true"%>
<%@ attribute name="dataGridId" type="java.lang.String" required="false"%>
<%@ attribute name="chartId" type="java.lang.String" required="false"%>
<%@ attribute name="isAll" type="java.lang.Integer" required="false"%>
<%@ attribute name="isTreeGrid" type="java.lang.Integer" required="false"%>

 <div class="easyui-panel" data-options="border:true,split:false" id="p2" style="width:100%;height: 150px;">
        	   <input type="hidden" name="${hiddenName}" id="${hiddenId}" />
        	   <!-- 根据部门更新图标 -->
        	   <input type="hidden" name="${chartId}" id="group${chartId}"/>
        	 <ul id="${dataGridId}_group" style="margin: 10px 10px 10px 10px"></ul>
        </div>
       
<script type="text/javascript">
var sysGroupTree;
$(function() {
	sysGroupTree = $('#${dataGridId}_group').tree({
         url : '${ctx}/sys/sysGroup/loadGroupTree?isAll=${isAll}',
         parentField : 'parentId',
         lines : true,
         onClick : function(node) {
        	 
         
        	 $('#${hiddenId}').val(node.id);
        	 <c:if test="${not empty dataGridId }">
        	 <c:choose>
        		<c:when test="${isTreeGrid eq 1 }">
        		 $('#${dataGridId}').treegrid('load', {
            		 ${hiddenName}: node.id
                 });
        		</c:when>
        		<c:otherwise>
        		 $('#${dataGridId}').datagrid('load', {
            		 ${hiddenName}: node.id
                 });
        		</c:otherwise>
        	</c:choose>
        	
        	 </c:if>
        	 
        	 <!-- 根据下标局部更新echarts -->
        	  <c:if test="${not empty chartId}">
        	 	var index=$('#group${chartId}').val()-0;
        	 	var tab=$('#${chartId}').tabs('getTab',index);
        	 	var href='';
        	 	if(index==0){
   				 	href='${ctx}/statistics/chart/sex?groupId='+node.id;
	   			 }else if(index==1){
	   				 href='${ctx}/statistics/chart/age?groupId='+node.id;
	   			 }else if(index==2){
	   				 href='${ctx}/statistics/chart/penalType?groupId='+node.id;
	   			 }else if(index==3){
	   				 href='${ctx}/statistics/chart/hklx?groupId='+node.id;
	   			 }else if(index==4){
	   				 href='${ctx}/statistics/chart/crimeInfo?groupId='+node.id;
	   			 }
        	 	tab.panel('refresh', href);
        	 </c:if> 
	 
         }
     });


});
	
</script>