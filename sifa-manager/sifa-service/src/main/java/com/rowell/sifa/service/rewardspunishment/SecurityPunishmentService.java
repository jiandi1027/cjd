
/**    
* @Title: SecurityPunishmentService.java  
* @Package com.rowell.sifa.service.rewardspunishment  
* @Description: TODO(用一句话描述该文件做什么)  
* @author pkx  
* @date 2017年4月1日  
* @version V1.0    
*/

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

import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;

import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.mapper.rewardspunishment.SecurityPunishmentMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.SecurityPunishment;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.ImprisonService;
import com.rowell.sifa.service.sys.SysFileService;

/**
 * @ClassName: SecurityPunishmentService
 * @Description: 提请治安管理处罚service
 * @author pkx
 * @date 2017年4月1日
 * 
 */
@Service
@Transactional(readOnly = true)
public class SecurityPunishmentService extends CrudService<SecurityPunishmentMapper, SecurityPunishment>
{
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private SysFileService sysFileService;
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	@Autowired
	private ImprisonService imprisonService;
	
	private static String PROCESS_DEFINITION_KEY = "securityPunishment";

	@Transactional(readOnly = false)
	public int insertMore(SecurityPunishment record, List<SysFile> endCasefile, List<SysFile> notefile)
	{
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		record.setCurrentSysUser(sysAccount);
		if (!StringUtils.isBlank(record.getCulpritId()))
		{
			Culprit culprit = culpritService.findById(record.getCulpritId());
			record.setGroupId(culprit.getGroupId());
		}
		record.preInsert();
		/***
		 * 启动流程实例，指定下一步工作流
		 */

		Map<String, Object> variables = new HashMap<String, Object>();
		if (sysAccount.getRoleId().equals(Constants.ROLE_SFSGZRY)
				|| sysAccount.getRoleId().equals(Constants.ROLE_SFSFZR))
		{
			variables.put("groupId", SysAccountUtils.getSysAccount().getGroupId());
			variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
		}
		if (sysAccount.getRoleId().equals(Constants.ROLE_XJZKGZRY)
				|| sysAccount.getRoleId().equals(Constants.ROLE_XJZKFZR))
		{
			variables.put("countyId", SysAccountUtils.getSysAccount().getGroupId());
			variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));
		}
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY,
				record.getId(), variables);
		record.setProcessInstanceId(processInstance.getProcessInstanceId());

		sysFileService.saveFiles(endCasefile, Constants.FILE_TABLE_SECURITY_PUNISHMENT, record.getId(),
				Constants.FILE_SECURITY_PUNISHMENT_ENDCASE);
		sysFileService.saveFiles(notefile, Constants.FILE_TABLE_SECURITY_PUNISHMENT, record.getId(),
				Constants.FILE_SECURITY_PUNISHMENT_NOTE);
		return dao.insertSelective(record);
	}

	@Transactional(readOnly = false)
	public int updateMore(SecurityPunishment record, List<SysFile> endCasefile, List<SysFile> notefile)
	{

		sysFileService.saveFiles(endCasefile, Constants.FILE_TABLE_SECURITY_PUNISHMENT, record.getId(),
				Constants.FILE_SECURITY_PUNISHMENT_ENDCASE);
		sysFileService.saveFiles(notefile, Constants.FILE_TABLE_SECURITY_PUNISHMENT, record.getId(),
				Constants.FILE_SECURITY_PUNISHMENT_NOTE);
		return super.updateByIdSelective(record);
	}

	@Transactional(readOnly = false)
	public void saveSecurityPunishmentAuditStatus(String roleId, SecurityPunishment securityPunishment,
			ProcessDetail processDetail, List<SysFile> fileList)
	{
		Task task = taskService.createTaskQuery().taskId(securityPunishment.getTaskId())
				.taskAssignee(ProcessUtils.getRoleIdWithGroupId(roleId)).singleResult();

		super.updateByIdSelective(securityPunishment);

		if (task != null)
		{
			processDetail.setProcessDefKey(PROCESS_DEFINITION_KEY);
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(securityPunishment.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);

			// 说明assignee是该任务的办理人，有权限完成3002
			Map<String, Object> variables = new HashMap<String, Object>();
			// 根据 auditType判断是几级审核workerReport

			if (securityPunishment.getAuditType().equals("firstReport"))
			{
				if (roleId.equals(Constants.ROLE_SFSGZRY))
				{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSFZR));
				}
				if (roleId.equals(Constants.ROLE_XJZKGZRY))
				{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}

				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (securityPunishment.getAuditType().equals("sfsCheck"))
			{
				if ("2".equals(processDetail.getDicDecideType()))
				{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_SFSGZRY));
				} else
				{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				}

				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (securityPunishment.getAuditType().equals("jzkCheck"))
			{
				if ("2".equals(processDetail.getDicDecideType()))
				{
					Map<String, Object> variablesTemp = taskService.getVariables(task.getId());
					String groupId = (String) variablesTemp.get("groupId");
					if (StringUtils.isBlank(groupId))
					{
						variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));
						variables.put("decideType", 3);
					} else
					{
						variables.put("role_id",ProcessUtils.getRoleIdWithGroupIdByBack(Constants.ROLE_SFSFZR, task.getId()));
						variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
					}
				} else
				{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFZKFZR));
					variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
				}

			} else if (securityPunishment.getAuditType().equals("fzkCheck"))
			{
				// 县法制科审核
				if ("2".equals(processDetail.getDicDecideType()))
				{// 退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKFZR));
				} else
				{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFGLD));
				}

				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (securityPunishment.getAuditType().equals("xfgCheck"))
			{
				// 县分管领导 审核
				if ("2".equals(processDetail.getDicDecideType()))
				{// 退回操作
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XFZKFZR));
				} else
				{
					variables.put("role_id", ProcessUtils.getRoleIdWithGroupId(Constants.ROLE_XJZKGZRY));
				}
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			} else if (securityPunishment.getAuditType().equals("workerPrint"))
			{
				// 县、市工作人员打印
				// 保存告知材料
				sysFileService.saveFiles(fileList, Constants.FILE_TABLE_REVOKE_PROBATION, securityPunishment.getId(),
						Constants.FILE_REVOKE_PROBATION_GZCLPATH);
				this.updateByIdSelective(securityPunishment);
				
			}
			
			// 提交审核时，设置流程变量，变量值就是审核 信息
			taskService.complete(securityPunishment.getTaskId(), variables);

		}

	}

}
