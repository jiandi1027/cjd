  
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
import org.flowable.engine.runtime.ProcessInstance;
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
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.SecurityPunishment;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.AskLeaveService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.sys.SysGroupService;
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
	private SysGroupService sysGroupService;
	
	@Autowired
	private ProcessDetailService processDetailService;
	
	@Autowired
	private RuntimeService runtimeService;

	@ModelAttribute("askLeave")
	public AskLeave get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return askLeaveService.findById(id);
		} else {
			return new AskLeave();
		}
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(AskLeave askLeave, Model model, HttpServletRequest request) {
		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);
		
		return "modules/dailymgr/askLeave/askLeaveList";
	}

	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(AskLeave askLeave,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if(StringUtils.isBlank(askLeave.getGroupId())){
			askLeave.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		
		PageHelper.startPage(page, getPageSize());		
		if (StringUtils.isBlank(askLeave.getOrderStr())) {
			PageHelper.orderBy("t.updated desc");
		} else {
			PageHelper.orderBy(askLeave.getOrderStr());
		}
		
		List<AskLeave> list = askLeaveService.findAll(askLeave);
		
		for(AskLeave askLeaveEntity:list){
			ProcessUtils.fillProcessInfo(askLeaveEntity);
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

	@RequestMapping("/askLeaveReport")
	public String askLeaveReport(@ModelAttribute("askLeave")AskLeave askLeave,Model model,String taskId,String orderId,String auditType){
		model.addAttribute("askLeave", askLeave);
		return "modules/dailymgr/askLeave/askLeaveReport";
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
			
			askLeaveService.saveAskLeaveAuditStatus(sysAccount.getRoleId(), askLeave, processDetail);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("审批成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			commonJsonResult = CommonJsonResult.build(500, "审批失败！");
			
		}
		
		return commonJsonResult;
	}

	@RequestMapping(value = "form")
	public String form(@ModelAttribute("askLeave") AskLeave askLeave, Model model) {
		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);

		return "modules/dailymgr/askLeave/askLeaveForm";
	}
	
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("askLeave") AskLeave askLeave, Model model) {
		model.addAttribute("askLeave", askLeave);
		if(!StringUtils.isBlank(askLeave.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(askLeave.getProcessInstanceId()));
		}
		
		model.addAttribute("culprit", culpritService.findById(askLeave.getCulpritId()));
		
		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(askLeave.getProcessInstanceId()).singleResult();
		if(processInstance!=null){
			String processDefinitionId = processInstance.getProcessDefinitionId();

			// 将流程定义 id传到页面，用于图形显示
			model.addAttribute("processDefinitionId", processDefinitionId);
		}
		
		return "modules/dailymgr/askLeave/askLeaveDetail";
	}
	/***
	 * 
	    * @Title: forProcessDetail  
	    * @Description: 调整流程详情页面
	    * @param @param askLeave
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "forProcessDetail")
	public String forProcessDetail(@ModelAttribute("askLeave") AskLeave askLeave, Model model){
		model.addAttribute("askLeave", askLeave);
		return "modules/dailymgr/askLeave/askLeaveProcessDetail";
	}
	/***
	 * 
	    * @Title: processDetail  
	    * @Description:流程详情数据
	    * @param @param askLeave
	    * @param @param model
	    * @param @return    参数  
	    * @return EUDataGridResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "processDetail",method=RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult processDetail(@ModelAttribute("askLeave") AskLeave askLeave, Model model) {
		
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		if(!StringUtils.isBlank(askLeave.getProcessInstanceId())){
			
			PageHelper.startPage(1, Integer.MAX_VALUE);	
			List<ProcessDetail> list = processDetailService.findByProcessInsId(askLeave.getProcessInstanceId());
			PageInfo<ProcessDetail> pageInfo = new PageInfo<ProcessDetail>(list);

			// 取记录总条数
			result.setTotal(pageInfo.getTotal());
			result.setRows(list);
		}
		return result;
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
				commonJsonResult.setMsg("保存成功");
			} else {
				askLeaveService.updateByIdSelective(askLeave);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(askLeave.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	/**
	 * 请销假打印界面
	 * @param askLeave
	 * @param model
	 * @return
	 */
	@RequestMapping("/workerPrint")
	public String investigateWorkerPrint(@ModelAttribute("askLeave")AskLeave askLeave, Model model){
		model.addAttribute("askLeave", askLeave);	
		model.addAttribute("culprit", culpritService.findById(askLeave.getCulpritId()));

		return "modules/dailymgr/askLeave/askLeaveWorkerPrint";
	}
	
	
	
	
	/**
	 * 打印外出证明
	 * @param askLeave
	 * @param model
	 * @return
	 */
	@RequestMapping("/printwczm")
	public String print(@ModelAttribute("askLeave")AskLeave askLeave, Model model){
		if (!StringUtils.isBlank(askLeave.getCulpritId())) {
			Culprit culprit = culpritService.findById(askLeave.getCulpritId());
			askLeave.setCulprit(culprit);
		}
		if (!StringUtils.isBlank(askLeave.getGroupId())) {
			SysGroup sysGroup = sysGroupService.findById(askLeave.getGroupId());
			askLeave.setSysGroup(sysGroup);
		}
		
		model.addAttribute("askLeave", askLeave);
		return "modules/dailymgr/askLeave/print/sqfxrywczm";		//社区服刑人员外出证明
	}
	
	
	/**
	 * 打印社区服刑人员请假外出审批表
	 * @param askLeave
	 * @param model
	 * @return
	 */
	@RequestMapping("/printAskLeaveTable")
	public String printAskLeaveTable(@ModelAttribute("askLeave")AskLeave askLeave, Model model){
		if (!StringUtils.isBlank(askLeave.getCulpritId())) {
			Culprit culprit = culpritService.findById(askLeave.getCulpritId());
			askLeave.setCulprit(culprit);
		}
		if (!StringUtils.isBlank(askLeave.getGroupId())) {
			SysGroup sysGroup = sysGroupService.findById(askLeave.getGroupId());
			askLeave.setSysGroup(sysGroup);
		}
		
		model.addAttribute("askLeave", askLeave);
		return "modules/dailymgr/askLeave/print/culpritAskLeaveTable";
	}

	

	/**
	 * 
	    * @Title: updateFinshInfo  
	    * @Description: 打印结束更新标识  
	    * @param  askLeave
	    * @param request
	    * @param  model
	    * @param  redirectAttributes
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
		@RequestMapping(value = "updateFinshInfo")
		@ResponseBody
		public CommonJsonResult updateFinshInfo(String id, String isPrintWCZM) {
			CommonJsonResult commonJsonResult = null;
			try {
				AskLeave askLeave=new AskLeave();
				if(!StringUtils.isBlank(id)){
					askLeave.setId(id);
				}
				if(!StringUtils.isBlank(isPrintWCZM)){
					askLeave.setIsPrintWCZM(Integer.valueOf(isPrintWCZM));
				}
			
				askLeaveService.updateByIdSelective(askLeave);
				commonJsonResult = CommonJsonResult.build(200, "更新成功！");
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				return commonJsonResult = CommonJsonResult.build(505, "更新失败！");
			}
		}
	
	

		/**
		 * 
		    * @Title: finish
		    * @Description: 提交（流程结束）
		    * @param @param securityPunishment
		    * @param @param model
		    * @param @param request
		    * @param @return    参数  
		    * @return String    返回类型  
		    * @throws
		 */
		@RequestMapping("/finish")
		@ResponseBody
		public CommonJsonResult finishInform(AskLeave askLeave,Model model,HttpServletRequest request){
			CommonJsonResult commonJsonResult=null;
			try {
			
				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				ProcessDetail processDetail = new ProcessDetail();
				askLeaveService.saveAskLeaveAuditStatus(sysAccount.getRoleId(), askLeave, processDetail);
				commonJsonResult = CommonJsonResult.build(200, "提交成功！", false);
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "提交失败！", true);
			}
			return commonJsonResult;
		}
	
	

	

}
