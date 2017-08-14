package com.rowell.sifa.service.rewardspunishment;

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

import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.mapper.rewardspunishment.ReducePenaltyMapper;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.ReducePenalty;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;
import com.rowell.sifa.service.sys.SysFileService;

/**  
    * @ClassName: ReducePenaltyService  
    * @Description: 减刑service  
    * @author yxb
    * @date 2017年3月16日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class ReducePenaltyService extends CrudService<ReducePenaltyMapper, ReducePenalty> {
	
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;//待审批事项
	@Autowired
	private SysFileService sysFileService;
	
	@Transactional(readOnly = false)
	public CommonJsonResult inserts(ReducePenalty reducePenalty,List<SysFile> fileList) {
		if (StringUtils.isBlank(reducePenalty.getId())) {
			reducePenalty.setCurrentSysUser(SysAccountUtils.getSysAccount());
			reducePenalty.preInsert();
			/***
			 * 启动流程实例，指定下一步工作流
			 */
			Map<String, Object> variables = new HashMap<String, Object>();
			variables.put("groupId",SysAccountUtils.getSysAccount().getGroupId());
			variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
			//variables.put("ReducePenalty", reducePenalty.getActions());
			ProcessInstance processInstance = runtimeService.startProcessInstanceByKey("ReducePenalty", reducePenalty.getId(),
					variables);
			
			reducePenalty.setProcessInstanceId(processInstance.getProcessInstanceId());
			super.insert(reducePenalty);
			sysFileService.saveFiles(fileList, Constants.FILE_TABLE_REDUCE_PENALTY, reducePenalty.getId(), Constants.FILE_REDUCE_PENALTY_CL_PATH);
			examinationAndApprovalService.insertProcess(reducePenalty.getId(),reducePenalty.getCulpritId(),reducePenalty.getProcessInstanceId(),Constants.PROCESS_TYPE_JX);
			return CommonJsonResult.build(200, "保存成功");
		} else {
			this.updateByIdSelective(reducePenalty);
			sysFileService.saveFiles(fileList, Constants.FILE_TABLE_REDUCE_PENALTY, reducePenalty.getId(), Constants.FILE_REDUCE_PENALTY_CL_PATH);
			return CommonJsonResult.build(200, "修改成功");
		}
	}

	    
	public void saveCommenAuditStatus(String roleId, ReducePenalty reducePenalty, ProcessDetail processDetail,List<SysFile> fileList) {
	
		Task task = taskService.createTaskQuery().taskId(reducePenalty.getTaskId()).taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();

		if (task != null) {
			processDetail.setProcessDefKey("ReducePenalty");
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(reducePenalty.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			
			
			
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核workerReport
			if(reducePenalty.getAuditType().equals("sfsReport")){
				//司法所上报
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (reducePenalty.getAuditType().equals("sfsCheck")) {
				//司法所审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (reducePenalty.getAuditType().equals("jzkCheck")) {
				//县矫正科
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_SFSFZR, reducePenalty.getTaskId()));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFZKFZR));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (reducePenalty.getAuditType().equals("fzkCheck")) {
				// 县法制科审核			
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (reducePenalty.getAuditType().equals("gS")) {
				// 公示	
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
			}else if (reducePenalty.getAuditType().equals("JcyCheck")) {
				// 报检测院
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (reducePenalty.getAuditType().equals("xfgCheck")) {
				// 县分局审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFZKFZR));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SJZCFZR));
				}
				//记录当前县级部门id
				variables.put("countryId",SysAccountUtils.getSysAccount().getGroupId());
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (reducePenalty.getAuditType().equals("sjzCheck")) {
				// 市矫正处审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_XFGLD, reducePenalty.getTaskId()));
					//variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFZCFZR));
				}
			
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (reducePenalty.getAuditType().equals("sfzCheck")) {
				
				// 市法制处审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SJZCFZR));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SJFGLD));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (reducePenalty.getAuditType().equals("sfgCheck")) {
				
				// 市分管领导
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFZCFZR));
				}else{
				variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SJZCGZRY));			
				
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if(reducePenalty.getAuditType().equals("sgzryPrint")){
				sysFileService.saveFiles(fileList, Constants.FILE_TABLE_REDUCE_PENALTY, reducePenalty.getId(), Constants.FILE_REDUCE_PENALTY_GZCL_PATH);
				this.updateByIdSelective(reducePenalty);
			}
			// 提交审核时，设置流程变量，变量值就是审核 信息
			taskService.complete(reducePenalty.getTaskId(), variables);

		}

	}
		
}
