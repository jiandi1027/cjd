package com.rowell.sifa.service.rewardspunishment;

import java.util.HashMap;
import java.util.Map;

import org.flowable.engine.HistoryService;
import org.flowable.engine.IdentityService;
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
import com.rowell.sifa.mapper.rewardspunishment.MonthlyPerformanceMapper;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.endcorrect.Death;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.MonthlyPerformance;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.base.CrudService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.sys.SysGroupService;

/**
 * 
    * @ClassName: MonthlyPerformanceService  
    * @Description: 月度考核评议
    * @author FWY
    * @date 2017年4月13日  
    *
 */
@Service
@Transactional(readOnly = true)
public class MonthlyPerformanceService extends CrudService<MonthlyPerformanceMapper,MonthlyPerformance>{
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private HistoryService historyService;

	@Autowired
	private IdentityService identityService;
	
	@Autowired
	private ProcessDetailMapper processDetailMapper;
	private static String PROCESS_DEFINITION_KEY = "monthlyPerformance";
	
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private SysGroupService sysGroupService;
	
	public MonthlyPerformance addCulpritToMonthlyPerformance(MonthlyPerformance monthlyPerformance){
		if(!StringUtils.isBlank(monthlyPerformance.getCulpritId())){
			Culprit clist=culpritService.findById(monthlyPerformance.getCulpritId());
			String s =clist.getGroupId();
			SysGroup s1=sysGroupService.findById(s);
			monthlyPerformance.setGroupName(s1.getName());
			monthlyPerformance.setCulpritName(clist.getName());
		}
		return monthlyPerformance;
	}
	
	public void submitMonthlyPerformance(String userId, MonthlyPerformance monthlyPerformance) {
		
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("role_id", "3003");
		
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_DEFINITION_KEY, monthlyPerformance.getId(),
				variables);
		monthlyPerformance.setProcessInstanceId(processInstance.getProcessInstanceId());
		 updateById(monthlyPerformance);
	}
	/**
	 * 判断审批操作添加下一个审批人
	 * @param roleId
	 * @param death
	 * @param processDetail
	 */
	@Transactional(readOnly = false)
	public void saveMonthlyformanceAuditStatus(String roleId, MonthlyPerformance monthlyPerformance,ProcessDetail processDetail) {
		
		Task task = taskService.createTaskQuery().taskId(monthlyPerformance.getTaskId()).taskAssignee(roleId).singleResult();
		
		if (task != null) {
			
			processDetail.setAuditName(task.getName());
			processDetail.setProcessId(monthlyPerformance.getProcessInstanceId());
			processDetail.setCurrentSysUser(SysAccountUtils.getSysAccount());
			processDetail.preInsert();
			processDetailMapper.insert(processDetail);
			Map<String, Object> variables = new HashMap<String, Object>();
			
			if(monthlyPerformance.getAuditType().equals("sfsCheck")){
				//司法所上报
				variables.put("role_id",Constants.ROLE_SFSFZR);
				variables.put("decideType", Integer.parseInt(processDetail.getDicDecideType()));
			}
				taskService.complete(monthlyPerformance.getTaskId(), variables);
			
		}

	}
	
	
}
