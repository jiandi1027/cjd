
/**    
* @Title: AskLeaveService.java  
* @Package com.rowell.sifa.service.dailymgr  
* @Description: TODO(用一句话描述该文件做什么)  
* @author xiaoguang  
* @date 2017年2月28日  
* @version V1.0    
*/

package com.rowell.sifa.service.dailymgr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.dailymgr.SpecialAreaMapper;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.pojo.dailymgr.SpecialArea;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;
import com.rowell.sifa.service.sys.AreaService;
import com.rowell.sifa.service.sys.SysFileService;

/**
 * @ClassName: SpecialAreaService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author xiaoguang
 * @date 2017年2月28日
 * 
 */
@Service
@Transactional(readOnly = true)
public class SpecialAreaService extends CrudService<SpecialAreaMapper, SpecialArea> {
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private SysFileService sysFileService;
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	private static String PROCESS_DEFINITION_KEY = "specialArea";
	@Autowired
	private AreaService areaService;
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;//待审批事项
	/**
	 * 
	    * @Title: submitSpecialArea  
	    * @Description:启动流程 
	    * @param @param id
	    * @param @param record
	    * @param @param processDetail    参数  
	    * @return void    返回类型  
	    * @throws
	 */
	@Transactional(readOnly = false)
	public void submitSpecialArea(String id, SpecialArea record, ProcessDetail processDetail) {
		SysAccount sysAccount=SysAccountUtils.getSysAccount();//获取当前用户信息
		processDetail.preInsert();
		processDetailMapper.insert(processDetail);
		/***
		 * 启动流程实例，指定下一步工作流
		 */
		Map<String, Object> variables = new HashMap<String, Object>();
		//记录当前上报的部门id
		variables.put("groupId",SysAccountUtils.getSysAccount().getGroupId());
		variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, record.getId(),
				variables);
		record.setProcessInstanceId(processInstance.getProcessInstanceId());
		//流程启动后在待审批事项内插入数据
		examinationAndApprovalService.insertProcess(record.getId(),record.getCulpritId(),record.getProcessInstanceId(),Constants.PROCESS_TYPE_JRTDQY);
		int result = updateById(record);	
	}
	
	
	@Transactional(readOnly = false)
	public void submitSpecialAreaAuditStatus(String roleId, SpecialArea record, ProcessDetail processDetail,List<SysFile> fileList) {
		Task task = taskService.createTaskQuery().taskId(record.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();
		if (task != null) {
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(record.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);

			// 说明assignee是该任务的办理人，有权限完成3002（司法所负责人）
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核
			if (record.getAuditType().equals("sfsCheck")) {
				//司法所审核
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (record.getAuditType().equals("jzkCheck")) {
				// 县矫正负责人审核
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}  else if (record.getAuditType().equals("xfgCheck")) {
				// 县分管
				Map<String,Object> variablesTemp = taskService.getVariables(task.getId());
				String groupId=(String) variablesTemp.get("groupId");
				variables.put("role_id", Constants.ROLE_SFSGZRY+"_"+groupId);//司法所工作人员打印
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (record.getAuditType().equals("sfsPrint")) {
				//司法所打印
				//保存告知材料
				sysFileService.saveFiles(fileList, Constants.FILE_TABLE_SPECIAL_AREA,record.getId(), Constants.FILE_SPECIALAREA_GZCLPATH);
				this.updateByIdSelective(record);	
			}
			// 提交审核时，设置流程变量，变量值就是审核 信息
			taskService.complete(record.getTaskId(), variables);
		}
		
	}
	
	//对申请区域的数据处理
	@Transactional(readOnly = false)
	public SpecialArea Areaformate(SpecialArea specialArea){
		String areaProName=null;
		String areaCityName=null;
		String areaCountryName=null;
		String areaStreet=null;
		String area=specialArea.getArea();
		String[] falg=area.split(",");
		if(StringUtils.isNumber(falg[0])){//判断省份是否为数字
			areaProName=areaService.findById(falg[0]).getAreaName();
		}else{
			areaProName=falg[0];
		}
		if(StringUtils.isNumber(falg[1])){//判断市是否为数字
			areaCityName=areaService.findById(falg[1]).getAreaName();
		}else{
			areaCityName=falg[1];
		}
		if(StringUtils.isNumber(falg[2])){//判断县是否为数字
			areaCountryName=areaService.findById(falg[2]).getAreaName();
		}else{
			areaCountryName=falg[2];
		}	
		areaStreet=falg[falg.length-1];
		area=areaProName+areaCityName+areaCountryName+areaStreet;
		specialArea.setArea(area);
		return specialArea;
	}
	
	

}
