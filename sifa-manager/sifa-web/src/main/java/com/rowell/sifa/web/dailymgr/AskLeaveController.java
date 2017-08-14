  
    /**    
    * @Title: AskLeaveController.java  
    * @Package com.rowell.sifa.web.dailymgr  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年3月1日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.web.dailymgr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.DateUtils;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.flow.ProcessDetailMapper;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.AskLeaveService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.vo.dailymgr.AskLeaveCustom;
import com.rowell.sifa.web.base.BaseController;

/**  
    * @ClassName: AskLeaveController  
    * @Description: TODO(这里用一句话描述这个类的作用)  
    * @author xiaoguang  
    * @date 2017年3月1日  
    *    
    */
@Controller
@RequestMapping(value = "/dailymgr/askLeave")
public class AskLeaveController extends BaseController {
	@Autowired
	private AskLeaveService askLeaveService;
	
	@Autowired
	private CulpritService culpritService;
	
	@Autowired
	private ProcessDetailService processDetailService;
	
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;

	@ModelAttribute("askLeave")
	public AskLeave get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return askLeaveService.findById(id);
		} else {
			return new AskLeave();
		}
	}

	// @RequiresPermissions("dailymgr:dailymgrDict:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(AskLeave askLeave, Model model, HttpServletRequest request) {
		return "modules/dailymgr/askLeave/askLeaveList";
	}
	
//	@RequestMapping(value = "submitAskLeave", method = RequestMethod.GET)
//	@ResponseBody
//	public CommonJsonResult submitAskLeave(AskLeave askLeave, Model model, HttpServletRequest request) {
//		SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
//		askLeaveService.submitAskLeave(sysAccount.getId(), askLeave);
//		return CommonJsonResult.ok();
//	}
	
	
	

	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(AskLeave askLeave,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(askLeave.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(askLeave.getOrderStr());
		}

		List<AskLeave> list = askLeaveService.findAll(askLeave);
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		for(AskLeave askLeaveEntity:list){
			
			if(!StringUtils.isBlank(askLeaveEntity.getProcessInstanceId())){
				
			//Task task = taskService.createTaskQuery().taskId(askLeave.getTaskId()).taskAssignee(sysAccount.getRoleId()).singleResult();

			List<Task> tasks = taskService.createTaskQuery().processInstanceId(askLeaveEntity.getProcessInstanceId()).active().list();  
	        if(tasks!=null&&tasks.size()>0){
	        	// 当前运行的结点
	        	 askLeaveEntity.setActivityName(tasks.get(0).getName());
	        	 if(tasks.get(0).getAssignee().equals(sysAccount.getRoleId())){
	        		 askLeaveEntity.setActivityId(tasks.get(0).getExecutionId());
					 askLeaveEntity.setActivityName(tasks.get(0).getName());
					 askLeaveEntity.setTaskId(tasks.get(0).getId());
					 askLeaveEntity.setAuditType(tasks.get(0).getTaskDefinitionKey());
	        	 }
				
	        }

			
			}
			 
		}

		PageInfo<AskLeave> pageInfo = new PageInfo<AskLeave>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	@RequestMapping("/queryActivityAskLeave")
	public String queryActivityOrder(Model model) throws Exception{
		model.addAttribute("list", askLeaveService.findActivityList());
		return "modules/dailymgr/askLeave/queryActivityList";
	}
	

	
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(@ModelAttribute("askLeave")AskLeave askLeave,Model model){
		try {
			askLeave.setDicStatusKey(Constants.ASKLEAVE_STATUS_YZZ);
			askLeaveService.updateByIdSelective(askLeave);
			ProcessUtils.endProcess("endevent1", askLeave.getTaskId());
			
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}
	

	@RequestMapping("/askLeaveAudit")
	public String askLeaveAudit(@ModelAttribute("askLeave")AskLeave askLeave,Model model,String taskId,String orderId,String auditType){
		model.addAttribute("askLeave", askLeave);
		return "modules/dailymgr/askLeave/askLeaveAudit";
	}
	
	@RequestMapping("/activityAskLeaveList")
	public String activityAskLeaveList(Model model,HttpServletRequest request) throws Exception{
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("list", askLeaveService.findAskLeaveTaskList(sysAccount.getRoleId()));
		return "modules/dailymgr/askLeave/activityAskLeaveList";
	}
	
	@RequestMapping("/submitAskLeaveAudit")
	@ResponseBody
	public CommonJsonResult submitAskLeaveAudit(@ModelAttribute("askLeave")AskLeave askLeave,String decideType,String opinion, Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult = null;
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
//		if("0".equals(decideType)){//不同意 则结束
//			askLeaveService.jumpAuditStatus(sysAccount.getRoleId(),askLeave,processDetail,0);
//		}else if("1".equals(decideType)){//同意则进入下一步
//			askLeaveService.saveAskLeaveAuditStatus(sysAccount.getRoleId(), askLeave, processDetail);
//		}else{//退回  返回到上一步
//			askLeaveService.jumpAuditStatus(sysAccount.getRoleId(),askLeave,processDetail,1);
//		}
			askLeaveService.saveAskLeaveAuditStatus(sysAccount.getRoleId(), askLeave, processDetail);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("处理成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			commonJsonResult = CommonJsonResult.build(500, "处理失败！");
			
		}
		
		return commonJsonResult;
		//return "redirect:/dailymgr/askLeave/list";
	}

	// @RequiresPermissions("dailymgr:askLeave:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("askLeave") AskLeave askLeave, Model model) {

		return "modules/dailymgr/askLeave/askLeaveForm";
	}
	
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("askLeave") AskLeave askLeave, Model model) {
		model.addAttribute("askLeave", askLeave);
		if(!StringUtils.isBlank(askLeave.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(askLeave.getProcessInstanceId()));
		}
		
		model.addAttribute("culprit", culpritService.findById(askLeave.getCulpritId()));
		
		ProcessInstance processInstance = runtimeService
				.createProcessInstanceQuery()
				.processInstanceId(askLeave.getProcessInstanceId()).singleResult();
		if(processInstance!=null){
			String processDefinitionId = processInstance.getProcessDefinitionId();

			// 将流程定义 id传到页面，用于图形显示
			model.addAttribute("processDefinitionId", processDefinitionId);
		}
		
		return "modules/dailymgr/askLeave/askLeaveDetail";
	}
	
	// @RequiresPermissions("dailymgr:askLeave:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(AskLeave askLeave, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, askLeave)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			
			//askLeave.setLeaveDays(DateUtils.getDistanceOfTwoDate(askLeave.getBeginDate(), askLeave.getEndDate()));
			askLeave.setLeaveDays(DateUtils.getDistanceOfDayTwoDate(askLeave.getBeginDate(), askLeave.getEndDate()));
			askLeave.setDicStatusKey(Constants.ASKLEAVE_STATUS_WQJ);
			if (StringUtils.isBlank(askLeave.getId())) {
				askLeaveService.insert(askLeave);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存请假成功");
			} else {
				askLeaveService.updateByIdSelective(askLeave);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改请假成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(askLeave.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存请假失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改请假失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}

	// @RequiresPermissions("dailymgr:askLeave:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(AskLeave askLeave, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			askLeaveService.deleteById(askLeave.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除请假成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除请假失败！", true);
		}
		return commonJsonResult;
	}
	@RequestMapping("/queryHistoryTask")
	public String queryHistoryOrder(Model model) throws Exception{

		model.addAttribute("list", askLeaveService.findFinishedList());
		return "/modules/dailymgr/askLeave/queryHistoryList";
	}
	
	// 根据 流程实例 id查询历史任务
	@RequestMapping("/queryOrderTaskByPid")
	public String queryOrderTaskByPid(Model model, String processInstanceId)
			throws Exception {

		List<AskLeaveCustom> list = askLeaveService
				.findTaskListByPid(processInstanceId);

		model.addAttribute("list", list);

		return "/modules/dailymgr/askLeave/queryTaskByPid";
	}
	// @RequiresPermissions("dailymgr:askLeave:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(AskLeave askLeave, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			
			askLeaveService.batchDelete(askLeave.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除请假成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除请假失败！", true);
		}
		return commonJsonResult;
	}
	@RequestMapping(value = "Doclist", method = RequestMethod.GET)
	public String DocList(AskLeave askLeave, Model model, HttpServletRequest request) {
		if(!StringUtils.isBlank(askLeave.getProcessInstanceId())){
			ProcessUtils.fillProcessInfo(askLeave);
		}
		model.addAttribute("askLeave", askLeave);	
		model.addAttribute("culprit", culpritService.findById(askLeave.getCulpritId()));
		return "modules/dailymgr/documentManage/askLeave";
	}
	

}
