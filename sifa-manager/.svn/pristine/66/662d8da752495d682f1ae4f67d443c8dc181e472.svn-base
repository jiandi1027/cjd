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
import com.rowell.sifa.common.utils.SpringContextHolder;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.mapper.rewardspunishment.RevokeParoleMapper;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.RevokeParole;
import com.rowell.sifa.pojo.sys.MxCheck;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.endcorrect.ImprisonService;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;
import com.rowell.sifa.service.sys.MxCheckService;
import com.rowell.sifa.service.sys.SysFileService;

/**  
    * @ClassName: RevokeParoleService  
    * @Description:  提请撤销假释serice
    * @author xiaoguang  
    * @date 2017年3月16日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class RevokeParoleService extends CrudService<RevokeParoleMapper, RevokeParole> {
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	private static String PROCESS_DEFINITION_KEY = "revokeParole";
	@Autowired
	private ExaminationAndApprovalService examinationAndApprovalService;//待审批事项
	@Autowired
	private MxCheckService mxCheckService;//评分
	@Autowired
	private SysFileService sysFileService;
	@Autowired
	private ImprisonService imprisonService;
	
	//保存或修改
	public CommonJsonResult saveRevokeParole(RevokeParole revokeParole,List<SysFile> fileList1,List<SysFile> fileList2){
		CommonJsonResult commonJsonResult = null;
		if (StringUtils.isBlank(revokeParole.getId())) {
			this.insert(revokeParole);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setData(revokeParole.getId());
			commonJsonResult.setMsg("保存成功！");
		} else {
			this.updateByIdSelective(revokeParole);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setData(revokeParole.getId());
			commonJsonResult.setMsg("修改成功！");
		}
		sysFileService.saveFiles(fileList1, Constants.FILE_TABLE_REVOKE_PAROLE,revokeParole.getId(), Constants.FILE_REVOKE_PAROLE_ENDCASEPATH);
		sysFileService.saveFiles(fileList2, Constants.FILE_TABLE_REVOKE_PAROLE,revokeParole.getId(), Constants.FILE_REVOKE_PAROLE_NOTEPATH);
		return commonJsonResult;
	}
	
	/**
	 * 
	    * @Title: submitRevokeParole  
	    * @Description:启动流程 
	    * @param @param id
	    * @param @param record
	    * @param @param processDetail    参数  
	    * @return void    返回类型  
	    * @throws
	 */
	@Transactional(readOnly = false)
	public void submitRevokeParole(String id, RevokeParole record, ProcessDetail processDetail) {
		SysAccount sysAccount=SysAccountUtils.getSysAccount();//获取当前用户信息
		processDetail.preInsert();
		processDetailMapper.insert(processDetail);
		/***
		 * 启动流程实例，指定下一步工作流
		 */
		Map<String, Object> variables = new HashMap<String, Object>();
		if("4".equals(processDetail.getDicDecideType())){//流程判断为司法所开始
			variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
		}else{
			variables.put("role_id",ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));
		}
		//司法所上报记录部门id
		variables.put("groupId",SysAccountUtils.getSysAccount().getGroupId());
		variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, record.getId(),
				variables);
		System.out.println(processInstance.getProcessInstanceId());
		record.setProcessInstanceId(processInstance.getProcessInstanceId());
		examinationAndApprovalService.insertProcess(record.getId(),record.getCulpritId(),record.getProcessInstanceId(),Constants.PROCESS_TYPE_TQCXJS);
		int result = updateById(record);	
	}
	/**
	 * 
	    * @Title: submitRevokeParoleAuditStatus  
	    * @Description: 对审批结果进行处理
	    * @param @param roleId
	    * @param @param revokeParole
	    * @param @param processDetail    参数  
	    * @return void    返回类型  
	    * @throws
	 */
	@Transactional(readOnly = false)
	public void submitRevokeParoleAuditStatus(String roleId, RevokeParole revokeParole, ProcessDetail processDetail,List<SysFile> fileList) {
		Task task = taskService.createTaskQuery().taskId(revokeParole.getTaskId()).taskAssignee( ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();
		if (task != null) {
			processDetail.setProcessDefKey(PROCESS_DEFINITION_KEY);
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(revokeParole.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			// 说明assignee是该任务的办理人，有权限完成3002（司法所负责人）
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核
			if(revokeParole.getAuditType().equals("sfsReport")){//如果是司法所工作人员发起，则司法所审核
				variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (revokeParole.getAuditType().equals("jzkReport")) {//如果是矫正科工作人员发起，则矫正科审核
				variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (revokeParole.getAuditType().equals("sfsCheck")) {
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
				}else{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				
			} else if (revokeParole.getAuditType().equals("jzkCheck")) {
				// 县矫正负责人审核
				if (!StringUtils.isBlank(processDetail.getOptScore())) {//评分明细
					MxCheck mxCheck = new MxCheck();
					mxCheck.setProcessInstanceId(revokeParole.getProcessInstanceId());
					mxCheck.setInfoType(Constants.ASSESS_MX_JZK_SRZL);
					mxCheck.setIsUse(1);
					mxCheckService.deleteFlagMore(mxCheck);
					mxCheckService.updateIsUse(mxCheck);
					mxCheck.setInfoType(Constants.ASSESS_MX_JZK_ZFZL);
					mxCheckService.deleteFlagMore(mxCheck);
					mxCheckService.updateIsUse(mxCheck);
				}
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					List<ProcessDetail> processDetails=processDetailMapper.findByProcessInsId(revokeParole.getProcessInstanceId());
					for(ProcessDetail p :processDetails){
						System.out.println(p.getAuditName());
						if("县矫正科上报".equals(p.getAuditName())){//退回矫正科共人员			
							variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));
							variables.put("decideType", 5);
							break;
						}else if("司法所上报".equals(p.getAuditName())){
							Map<String,Object> variablesTemp = taskService.getVariables(task.getId());
							String groupId=(String) variablesTemp.get("groupId");
							variables.put("role_id", Constants.ROLE_SFSFZR+"_"+groupId);//退回司法所负责人，手动设置id
							variables.put("decideType", 2);	
						}
					}
				}else{
					variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFZKFZR));//县法制科
					variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				}
			} else if (revokeParole.getAuditType().equals("fzkCheck")) {
				// 县法制科审核
				if (!StringUtils.isBlank(processDetail.getZfScore())) {//评分明细
					MxCheck mxCheck = new MxCheck();
					mxCheck.setProcessInstanceId(revokeParole.getProcessInstanceId());
					mxCheck.setInfoType(Constants.ASSESS_MX_FZK_ZFZL);
					mxCheck.setIsUse(1);
					mxCheckService.deleteFlagMore(mxCheck);
					mxCheckService.updateIsUse(mxCheck);
				}
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}else{
					variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));//县分管
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (revokeParole.getAuditType().equals("xfgCheck")) {
				// 县分管领导 审核
				if("2".equals(processDetail.getDicDecideType())){//退回操作
					variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFZKFZR));
				}else if("6".equals(processDetail.getDicDecideType())){
					variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SJZCFZR));
				}else {
					variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));			
				}
				//记录当前县级部门id
				variables.put("countryId",SysAccountUtils.getSysAccount().getGroupId());
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}else if (revokeParole.getAuditType().equals("sjzCheck")) {
				// 市矫正负责人审核
				if (!StringUtils.isBlank(processDetail.getOptScore())) {//评分明细
					MxCheck mxCheck = new MxCheck();
					mxCheck.setProcessInstanceId(revokeParole.getProcessInstanceId());
					mxCheck.setInfoType(Constants.ASSESS_MX_SJZC_SRZL);
					mxCheck.setIsUse(1);
					mxCheckService.updateIsUse(mxCheck);
					mxCheck.setInfoType(Constants.ASSESS_MX_SJZC_ZFZL);
					mxCheckService.updateIsUse(mxCheck);
				}
				if("2".equals(processDetail.getDicDecideType())){//退回县分管
					Map<String,Object> variablesTemp = taskService.getVariables(task.getId());
					String countryId=(String) variablesTemp.get("countryId");//县级id
					variables.put("role_id", Constants.ROLE_XFGLD+"_"+countryId);
				}else{
					variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFZCFZR));//市法制处
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (revokeParole.getAuditType().equals("sfzCheck")) {
				// 市法制科审核
				if (!StringUtils.isBlank(processDetail.getZfScore())) {//评分明细
					MxCheck mxCheck = new MxCheck();
					mxCheck.setProcessInstanceId(revokeParole.getProcessInstanceId());
					mxCheck.setInfoType(Constants.ASSESS_MX_SFZC_ZFZL);
					mxCheck.setIsUse(1);
					mxCheckService.updateIsUse(mxCheck);
				}
				if("2".equals(processDetail.getDicDecideType())){//退回市矫正负责人
					variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SJZCFZR));
				}else{
					variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SJFGLD));//市分管
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (revokeParole.getAuditType().equals("sfgCheck")) {
				// 市分管
				if("2".equals(processDetail.getDicDecideType())){//退回市法制科负责人
					variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFZCFZR));
				}else{
					variables.put("role_id",  ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SJZCGZRY));//市矫正处工作人员打印
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (revokeParole.getAuditType().equals("sfsPrint") || revokeParole.getAuditType().equals("jzkPrint")) {
				//县、市工作人员打印
				//保存告知材料
				sysFileService.saveFiles(fileList, Constants.FILE_TABLE_REVOKE_PAROLE,revokeParole.getId(), Constants.FILE_REVOKE_PAROLE_GZCLPATH);
				this.updateByIdSelective(revokeParole);
				//流程审批结束时，在imprison插入数据
				ProcessInstance rpi = SpringContextHolder.getApplicationContext().getBean(RuntimeService.class)//
						.createProcessInstanceQuery()// 创建流程实例查询对象
						.processInstanceId(revokeParole.getProcessInstanceId()).singleResult();
				if (rpi == null) {//流程结束
					imprisonService.insertRevokeParole(revokeParole);
				}		
			}
			// 提交审核时，设置流程变量，变量值就是审核 信息
			taskService.complete(revokeParole.getTaskId(), variables);
		}
		
	}
	
	
	

}
