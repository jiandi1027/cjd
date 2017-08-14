package com.rowell.sifa.web.inculprit;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
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
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.inculprit.ExitEntryReport;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.inculprit.ExitEntryReportService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  出入境报备Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/inculprit/exitEntryReport")
public class ExitEntryReportController extends BaseController {

	@Autowired
	private ExitEntryReportService exitEntryReportService;
	
	@Autowired
	private CulpritService culpritService;
	
	@Autowired
	private RuntimeService runtimeService;
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private ProcessDetailService processDetailService;

	@ModelAttribute("exitEntryReport")
	public ExitEntryReport get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return exitEntryReportService.findById(id);
		} else {
			return new ExitEntryReport();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 出入境报备跳转页 
	    * @param @param exitEntryReport
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:exitEntryReportt:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(ExitEntryReport exitEntryReport, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/culprit/exitEntryReportList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找出入境报备
	    * @param @param exitEntryReport
	    * @param @param page
	    * @param @param request
	    * @param @param response
	    * @param @param model
	    * @param @return    参数  
	    * @return EUDataGridResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(ExitEntryReport exitEntryReport,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(exitEntryReport.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(exitEntryReport.getOrderStr());
		}
		
		if (StringUtils.isBlank(exitEntryReport.getGroupId())) {
			exitEntryReport.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		List<ExitEntryReport> list = exitEntryReportService.findAll(exitEntryReport);
		for(ExitEntryReport exitEntryReportEntity:list){
			if(!StringUtils.isBlank(exitEntryReportEntity.getProcessInstanceId())){
			ProcessUtils.fillProcessInfo(exitEntryReportEntity);
			}
		}
		PageInfo<ExitEntryReport> pageInfo = new PageInfo<ExitEntryReport>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	/***
	    * @Title: list  
	    * @Description: 查找出入境报备
	    * @param @param exitEntryReport
	    * @param @param page
	    * @param @param request
	    * @param @param response
	    * @param @param model
	    * @param @return    参数  
	    * @return EUDataGridResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = { "nameList", "" })
	@ResponseBody
	public List<ExitEntryReport> nameList(ExitEntryReport exitEntryReport) {
		if (StringUtils.isBlank(exitEntryReport.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(exitEntryReport.getOrderStr());
		}
		
		if (StringUtils.isBlank(exitEntryReport.getGroupId())) {
			exitEntryReport.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		List<ExitEntryReport> list = exitEntryReportService.findAll(exitEntryReport);
		
		return list;
	}
	
	

	// @RequiresPermissions("sys:exitEntryReport:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("exitEntryReport") ExitEntryReport exitEntryReport, String workRemindFlag,Model model,HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		if(exitEntryReport.getFilingDate()==null){
			exitEntryReport.setFilingDate(new Date());
		}
		if(exitEntryReport.getHandlingPerson()==null){
			exitEntryReport.setHandlingPerson(sysAccount.getAccountname());
		}
		model.addAttribute("workRemindFlag", workRemindFlag);//待处理
		model.addAttribute("culprit", culpritService.findById(exitEntryReport.getCulpritId()));
		model.addAttribute("exitEntryReport", exitEntryReport);
		return "modules/culprit/exitEntryReportForm";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑出入境报备  ,证件收缴
	    * @param @param exitEntryReport
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:exitEntryReport:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(ExitEntryReport exitEntryReport, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, exitEntryReport)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑失败！");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			return exitEntryReportService.saveExitEntryReport(exitEntryReport);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "保存失败！");
			commonJsonResult.setIsError(true);
			return commonJsonResult;
		}
	}
	
	//详细
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("exitEntryReport") ExitEntryReport exitEntryReport, Model model) {
		model.addAttribute("exitEntryReport", exitEntryReport);
		if(!StringUtils.isBlank(exitEntryReport.getProcessInstanceId())){
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(exitEntryReport.getProcessInstanceId());
			model.addAttribute("processDetails",processDetails);
			ProcessInstance processInstance = runtimeService
					.createProcessInstanceQuery()
					.processInstanceId(exitEntryReport.getProcessInstanceId()).singleResult();
			if(processInstance!=null){
				String processDefinitionId = processInstance.getProcessDefinitionId();
				// 将流程定义 id传到页面，用于图形显示
				model.addAttribute("processDefinitionId", processDefinitionId);
			}
		}
		model.addAttribute("culprit", culpritService.findById(exitEntryReport.getCulpritId()));
//		}
		return "modules/culprit/exitEntryReportDetail";
	}
	
	
	
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除出入境报备  
	    * @param @param exitEntryReport
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:exitEntryReport:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(ExitEntryReport exitEntryReport, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			exitEntryReportService.deleteById(exitEntryReport.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！");
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！");
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除出入境报备  
	    * @param @param exitEntryReport
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:exitEntryReport:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(ExitEntryReport exitEntryReport, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			exitEntryReportService.batchDelete(exitEntryReport.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！");
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！");
		}
		return commonJsonResult;
	}
	
	/**
	 * 
	    * @Title: arrowUp 
	    * @Description: 流程上报 
	    * @param @param detached
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "arrowUp")
	@ResponseBody
	public CommonJsonResult arrowUp(ExitEntryReport exitEntryReport, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		try {
			exitEntryReportService.arrowUp(sysAccount.getId(), exitEntryReport);
			return CommonJsonResult.build(200, "上报成功！");
		} catch (Exception e) {
			e.printStackTrace();
			return CommonJsonResult.build(505, "上报失败！");
		}
	}
	
	/**
	 * 
	    * @Title:跳转至流程审批页面
	    * @Description: TODO(这里用一句话描述这个方法的作用)  
	    * @param @param detached
	    * @param @param model
	    * @param @param taskId
	    * @param @param orderId
	    * @param @param auditType
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping("/auditForm")
	public String auditForm(@ModelAttribute("exitEntryReport")ExitEntryReport exitEntryReport,Model model,String taskId,String orderId,String auditType){
		model.addAttribute("exitEntryReport", exitEntryReport);
		model.addAttribute("culprit", culpritService.findById(exitEntryReport.getCulpritId()));
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		if(Constants.ROLE_XJZKGZRY.equals(sysAccount.getRoleId())){
			if(!StringUtils.isBlank(exitEntryReport.getProcessInstanceId())){
				List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(exitEntryReport.getProcessInstanceId());
				model.addAttribute("processDetails",processDetails);
			}
		}
		return "modules/culprit/exitEntryReportAudit";
	}
	
	/**
	 * 	
	    * @Title: 处理审批结果并保存
	    * @Description: TODO(这里用一句话描述这个方法的作用)  
	    * @param @param askLeave
	    * @param @param decideType
	    * @param @param opinion
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping("/audit")
	@ResponseBody
	public CommonJsonResult audit(@ModelAttribute("exitEntryReport") ExitEntryReport exitEntryReport,String decideType,String opinion, Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult=null;
		exitEntryReportService.updateByIdSelective(exitEntryReport);
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);	
			exitEntryReportService.saveAuditStatus(sysAccount.getRoleId(), exitEntryReport, processDetail);
			commonJsonResult = CommonJsonResult.build(200, "审批成功！");
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "审批失败！");
		}
		System.out.println("流程处理完毕");
		return commonJsonResult;
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
	public String forProcessDetail(@ModelAttribute("exitEntryReport")ExitEntryReport exitEntryReport, Model model){
		model.addAttribute("exitEntryReport", exitEntryReport);
		return "modules/culprit/exitEntryReportProcessDetail";
	}

	//打印报备通知书
	@RequestMapping(value = "printBATZS")
	public String printBATZS(@ModelAttribute("exitEntryReport") ExitEntryReport exitEntryReport, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("now", new Date());
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("exitEntryReport", exitEntryReport);
		model.addAttribute("culprit", culpritService.findById(exitEntryReport.getCulpritId()));
		return "modules/culprit/exitEntryReportPrint/exitEntryBATZS";
	}	
	
}
