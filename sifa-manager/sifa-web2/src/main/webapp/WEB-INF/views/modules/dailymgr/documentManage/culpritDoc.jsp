<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>


     <div class="easyui-panel" id="p2" title="社区矫正对象(${culprit.name })正卷档案" style="width:99%;height:680px;margin:0 auto;padding:5px;">
	 <table class="easyui-datagrid" id="judg_list_content_zj" style="width:100%"
			data-options="singleSelect:true,collapsible:true,striped:true,rownumbers:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=48000',method:'post',onLoadSuccess:function (data) {
                        $('.easyui-linkbutton-database').linkbutton({text:'查看',plain:true,iconCls:'fi-zoom-in icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:true">编号</th>
					<th data-options="field:'value',width:'40%',align:'center'">类别名称</th>
					<th data-options="field:'prison',width:'60%',align:'center'" formatter="formatterDocPlus">操作</th>
				</tr>
			</thead>
		</table>
	 </div>
	<div class="easyui-panel" id="p2" title="社区矫正对象(${culprit.name })副卷档案" style="width:99%;height:650px;margin:0 auto;padding:5px;">
	 <table class="easyui-datagrid" id="judg_list_content_fj" style="width:100%;"
			data-options="singleSelect:true,collapsible:true,striped:true,rownumbers:true,loadMsg: '数据正在加载,请耐心的等待...' ,fitColumns:true,url:'${ctx}/sys/sysDic/getDicOnlyByParent?parentKey=49000',method:'post',onLoadSuccess:function (data) {
                        $('.easyui-linkbutton-database').linkbutton({text:'查看',plain:true,iconCls:'fi-zoom-in icon-blue'});
                    }">
			<thead>
				<tr>
					<th data-options="field:'id',hidden:true">编号</th>
					<th data-options="field:'value',width:'40%',align:'center'">类别名称</th>
					<th data-options="field:'prison',width:'60%',align:'center'" formatter="formatterDocMinus">操作</th>
				</tr>
			</thead>
		</table>
	 </div>
	 
		 
	 <div id="docDetail_zj"></div>
	 <div id="docDetail_fj"></div>
<script>	

	var id='${culpritDoc.culpritId}';
		function formatterDocPlus(val,row,index){
			return '<a href="javascript:void(0);" class="easyui-linkbutton-database" onclick="viewDocDetail_zj(\''+row.id+'\',\''+row.value+'\')"></a>';
		}
		function formatterDocMinus(val,row,index){  
			return '<a href="javascript:void(0);" class="easyui-linkbutton-database" onclick="viewDocDetail_fj(\''+row.id+'\',\''+row.value+'\')"></a>';
		}
    
        //正卷

        function viewDocDetail_zj(rowId,val){
        	$('#judg_list_content_zj').datagrid('unselectAll');
        	var flag='0';//是否需要List标记
        	var href='';
        	var btnName='';
        	if(rowId=='48001'){//基本信息
        		href="${ctx}/culpritinfo/culpritDoc/printJBXX?culpritId="+id;
        		btnName='jbxxBtn';
        	}else if(rowId=='48002'){//调查评估意见书	
        		flag="1";
        	}else if(rowId=='48003'){//社区服刑人员报到情况通知单
        		href="${ctx}/culpritinfo/culprit/printTZD?id="+id;
        		btnName='printTZDbtn';
        	}else if(rowId=='48004'){//社区服刑人员社区矫正报到通知
        		href="${ctx}/culpritinfo/culpritDoc/printJZBDTZ?culpritId="+id;
        		btnName='bdtzBtn';
        	}else if(rowId=='48005'){//社区服刑人员报到通知书
        		href="${ctx}/culpritinfo/culpritDoc/printBDTZS?culpritId="+id;
        		btnName='bdtzsBtn';
        	}else if(rowId=='48006'){//社区服刑人员请假外出审批表
        		
        	}else if(rowId=='48007'){//居住地变更审批表
        		flag="1";
        	}else if(rowId=='48008'){//社区服刑人员居住地变更证明
        		flag="1";
        	}else if(rowId=='48009'){//特定场所
        		flag="1";	
        	}else if(rowId=='48010'){//社区矫正人员警告审批表
        		flag="1";
        	}else if(rowId=='48011'){//违反社区矫正规定警告决定书（存根）
        		flag="1";
        	}else if(rowId=='48012'){//治安管理处罚建议书
        		flag="1";
        	}else if(rowId=='48013'){//提请撤销缓刑
        		flag="1";
        	}else if(rowId=='48014'){//提请撤销假释
        		flag="1";
        	}else if(rowId=='48015'){//收监执行建议书
        		flag="1";
        	}else if(rowId=='48016'){//社区服刑人员减刑建议书
        		flag="1";
        	}else if(rowId=='48017'){//提请治安管理处罚
        		flag="1";
        	}else if(rowId=='48018'){//解除社区矫正证明书
        		flag="1";
        	}else if(rowId=='48019'){//解除社区矫正通知书
        		flag="1";
        	}else if(rowId=='48020'){//社区服刑人员死亡通知书
        		flag="1";
        	}else if(rowId=='48021'){//社区服刑人员档案查阅审批表
        		href="${ctx}/culpritinfo/culpritDoc/printDocSearchTable?culpritId="+id;
        		btnName='docSearchBtn';
        	}
        	
        	
        	if(flag=='0'){
        		$('#docDetail_zj').dialog({
            		iconCls:'fi-zoom-in icon-blue',
        			href:href,
        			title:val,
        			width : 1050,
        		    height : 700,
        			shadow:false,
        		    modal:true,
        		    resizable:true,
        	        maximizable:true,
        	        loadingMessage:'加载中...',
        	        buttons :[{
        				text:'打印',
        	            iconCls:'fi-print icon-blue',
        				handler:function(){
        					$('#'+ btnName).click();
        				}
        			}, {
        				text:'关闭',
        				iconCls:'fi-x icon-blue',
        				handler:function(){
        					$('#docDetail_zj').dialog('close');
        				}
        			}]
        		});
        	}
        	if(flag=='1'){
        		$('#docDetail_zj').dialog({
            		iconCls:'fi-zoom-in icon-blue',
        			href:'${ctx}/culpritinfo/culpritDoc/viewList?type='+rowId+'&culpritId='+id,
        			title:val,
        			width : 900,
        		    height : 700,
        			shadow:false,
        		    modal:true,
        		    resizable:true,
        	        maximizable:true,
        	        loadingMessage:'加载中...',
        	        buttons :[{
        				text:'关闭',
        				iconCls:'fi-x icon-blue',
        				handler:function(){
        					$('#docDetail_zj').dialog('close');
        				}
        			}]
        		});
        	}

        }
        
        
        //副卷
        function viewDocDetail_fj(rowId,val){
        	$('#judg_list_content_fj').datagrid('unselectAll');
        	var flag='0';//是否需要List标记
        	var href='';
        	var btnName='';
        	if(rowId=='49001'){//首次谈话笔录
        		href='${ctx}/dailymgr/talk/printfirstTalk?culpritId=' + id+'&isFirstTalk=0';
        		btnName='talkPrintBtn1';
        	}else if(rowId=='49002'){//社区矫正宣告书	
        		href="${ctx}/culpritinfo/culprit/printXGS?id=" + id;
        		btnName='sqjzxgs_PrintBtn';
        	}else if(rowId=='49003'){//社区服刑人员入矫集中教育登记表
        		//flag="1";
        	}else if(rowId=='49004'){//社区服刑人员电子定位监控管理告知书
        		href="${ctx}/culpritinfo/culpritDoc/dingwei?culpritId="+id;
        		btnName='dingwei_PrintBtn';
        	}else if(rowId=='49005'){//矫正责任书	
        		href="${ctx}/culpritinfo/culprit/printZRS?id="+id;
        		btnName='sqjzzrs_printBtn'; 
        	}else if(rowId=='49006'){//社区服刑人员分类管理评定表
        		
        	}else if(rowId=='49007'){//矫正方案
        		flag='1';
        	}else if(rowId=='49008'){//社区服刑人员个别教育记录表
        		//flag='1';
        	}else if(rowId=='49009'){//社区服刑人员集中教育学习记录表
        		
        	}else if(rowId=='49010'){//社区服刑人员社区服务记录表
        		
        	}else if(rowId=='49011'){//社区矫正工作走访记录表
        		
        	}else if(rowId=='49012'){//社区服刑人员心理辅导记录表
        		
        	}else if(rowId=='49013'){//社区服刑人员外出证明
        		flag='1';
        		/* href='${ctx}/dailymgr/askLeave/print?culpritId=' + id;
        		btnName='askLeavePrintBtn1'; */
        	}else if(rowId=='49014'){//社区服刑人员日常报到
        		
        	}else if(rowId=='49015'){//社区服刑人员月计分表
        		
        	}else if(rowId=='49016'){//社区服刑人员奖惩审批表
        		
        	}else if(rowId=='49017'){//社区服刑人员管理类别调整登记表
        		flag='1';
        	}else if(rowId=='49018'){//社区服刑人员矫正期满鉴定表
        		flag='1';
        	}else if(rowId=='49019'){//解除社区矫正宣告书
        		flag='1';
        	}
        	console.log(rowId)
        	if(flag=='0'){
        		$('#docDetail_fj').dialog({
            		iconCls:'fi-zoom-in icon-blue',
        			href:href,
        			title:val,
        			width : 1050,
        		    height : 700,
        			shadow:false,
        		    modal:true,
        		    resizable:true,
        	        maximizable:true,
        	        loadingMessage:'加载中...',
        	        buttons :[{
        				text:'打印',
        	            iconCls:'fi-print icon-blue',
        				handler:function(){
        					$('#'+ btnName).click();
        				}
        			}, {
        				text:'关闭',
        				iconCls:'fi-x icon-blue',
        				handler:function(){
        					$('#docDetail_fj').dialog('close');
        				}
        			}]
        		});
        	}
        	if(flag=='1'){
        		$('#docDetail_fj').dialog({
            		iconCls:'fi-zoom-in icon-blue',
        			href:'${ctx}/culpritinfo/culpritDoc/viewList?type='+rowId+'&culpritId='+id,
        			title:val,
        			width : 900,
        		    height : 700,
        			shadow:false,
        		    modal:true,
        		    resizable:true,
        	        maximizable:true,
        	        loadingMessage:'加载中...',
        	        buttons :[{
        				text:'关闭',
        				iconCls:'fi-x icon-blue',
        				handler:function(){
        					$('#docDetail_fj').dialog('close');
        				}
        			}]
        		});
        	}
        	
        }
        
        
        
        
        
      //timestamp转换date
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
        
        
        
       
    </script>