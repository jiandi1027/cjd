package com.rowell.sifa.web.investigate;

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
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.investigate.Investigate;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.investigate.InvestigateService;
import com.rowell.sifa.service.sys.SysAccountService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  调查评估Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/investigate")
public class InvestigateController extends BaseController {
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private ProcessDetailService processDetailService;
	@Autowired
	private InvestigateService investigateService;
	@Autowired
	private SysAccountService sysAccountService;

	@ModelAttribute("investigate")
	public Investigate get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return investigateService.findById(id);
		} else {
			return new Investigate();
		}
	}
	
	
	/***
	 * 
	    * @Title: forList  
	    * @Description: 调查评估跳转页 
	    * @param @param investigate
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Investigate investigate, Model model, HttpServletRequest request) {
		SysAccount account = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
		model.addAttribute("account", account);
		
		return "modules/investigate/investigateList";
	}
	
	
	/***
	    * @Title: list  
	    * @Description: 查找调查评估
	    * @param @param investigate
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
	public EUDataGridResult list(Investigate investigate,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(investigate.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(investigate.getOrderStr());
		}

		List<Investigate> list = investigateService.findAll(investigate);

		for(Investigate investigateEntity:list){		//填充流程实例
			if(!StringUtils.isBlank(investigateEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(investigateEntity);
			}
		}
		
		PageInfo<Investigate> pageInfo = new PageInfo<Investigate>(list);

		model.addAttribute("pager", pageInfo);

		SysAccount account = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
		model.addAttribute("account", account);
		
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑调查评估  
	    * @param @param investigate
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Investigate investigate, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, investigate)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(investigate.getId())) {
				investigate.init();//初始化部分信息
				investigateService.insert(investigate);
				
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存调查评估成功");
			} else {
				investigateService.updateByIdSelective(investigate);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改调查评估成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(investigate.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存调查评估失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改调查评估失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	
	
//	/***
//	 * 
//	    * @Title: delete  
//	    * @Description: 删除调查评估  
//	    * @param @param investigate
//	    * @param @param redirectAttributes
//	    * @param @return    参数  
//	    * @return CommonJsonResult    返回类型  
//	    * @throws
//	 */
//	@RequestMapping(value = "delete")
//	@ResponseBody
//	public CommonJsonResult delete(Investigate investigate, RedirectAttributes redirectAttributes) {
//		CommonJsonResult commonJsonResult = null;
//		try {
//			investigateService.deleteById(investigate.getId());
//			commonJsonResult = CommonJsonResult.build(200, "删除调查评估成功！", false);
//		} catch (Exception e) {
//			logger.error(e.getMessage());
//			commonJsonResult = CommonJsonResult.build(505, "删除调查评估失败！", true);
//		}
//	
//		return commonJsonResult;
//	}
	
	
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除调查评估  
	    * @param @param investigate
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(Investigate investigate, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			investigateService.batchDelete(investigate.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除调查评估成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除调查评估失败！", true);
		}
		
		return commonJsonResult;
	}

	
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("investigate") Investigate investigate, Model model) {
		
		if(!StringUtils.isBlank(investigate.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(investigate.getProcessInstanceId()));
			ProcessUtils.fillProcessInfo(investigate);
		}
		model.addAttribute("investigate", investigate);
		model.addAttribute("sysAccount", SysAccountUtils.getSysAccount());
		
		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(investigate.getProcessInstanceId()).singleResult();
		if(processInstance!=null){
			String processDefinitionId = processInstance.getProcessDefinitionId();

			// 将流程定义 id传到页面，用于图形显示
			model.addAttribute("processDefinitionId", processDefinitionId);
		}
		
		return "modules/investigate/investigateDetail";
	}
	
	/**
	 * 终止流程
	 * @param investigate
	 * @param model
	 * @return
	 */
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(@ModelAttribute("investigate")Investigate investigate,Model model){
		try {
			ProcessUtils.endProcess("endevent1", investigate.getTaskId());
			
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}
	
	
	/**
	 * 工作人员上报界面
	 * @param investigate
	 * @param model
	 * @return
	 */
	@RequestMapping("/investigateWorkerReport")
	public String investigateWorkerReport(@ModelAttribute("investigate")Investigate investigate,Model model){
		model.addAttribute("investigate", investigate);
		
		return "modules/investigate/investigateWorkerReport";
	}
	
	
	/**
	 * 司法所开始调查推送界面
	 * @param investigate
	 * @param model
	 * @return
	 */
	@RequestMapping("/investigatePush")
	public String investigatePush(@ModelAttribute("investigate")Investigate investigate,Model model){
		model.addAttribute("investigate", investigate);
		
		return "modules/investigate/investigatePush";
	}
	
	
	/**
	 * 审核上报评定界面
	 * @param investigate
	 * @param model
	 * @return
	 */
	@RequestMapping("/investigateReport")
	public String investigateReport(@ModelAttribute("investigate")Investigate investigate,Model model){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		
		if(!StringUtils.isBlank(investigate.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(investigate.getProcessInstanceId()));
		}
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("investigate", investigate);
		model.addAttribute("modifyPersonName", sysAccountService.findById(investigate.getAccountId()).getAccountname());
		
		return "modules/investigate/investigateReport";
	}

	
	/**
	 * 审核上报评定界面
	 * @param investigate
	 * @param model
	 * @return
	 */
	@RequestMapping("/investigateAuditOpinion")
	public String investigateAuditOpinion(@ModelAttribute("investigate")Investigate investigate,Model model){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		
		if(!StringUtils.isBlank(investigate.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(investigate.getProcessInstanceId()));
		}
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("investigate", investigate);
		model.addAttribute("modifyPersonName", sysAccountService.findById(investigate.getAccountId()).getAccountname());
		
		return "modules/investigate/investigateAuditOpinion";
	}
	
	
	/**
	 * 审前调查流程
	 * 
	 * @param investigate
	 * @param type
	 * @param update
	 * @param request
	 * @return
	 */
	@RequestMapping("/investigateAudit")
	@ResponseBody
	public CommonJsonResult investigateAudit(@ModelAttribute("investigate")Investigate investigate, String type, String update, HttpServletRequest request){
		CommonJsonResult commonJsonResult = null;
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			
			if (update !="" && update !=null) {
				investigate.setAccountId(sysAccount.getId());	//测试用
				investigateService.updateByIdSelective(investigate);
			}
			
			if (type !="" && type !=null) {
				ProcessDetail processDetail = new ProcessDetail();
				if (investigate.getAuditType().equals("xfgCheck") ||
						investigate.getAuditType().equals("fzkCheck") ||
						investigate.getAuditType().equals("jzkCheck") ||
						investigate.getAuditType().equals("szCheck")) {
					processDetail.setOpinion(investigate.getEvalueViews());
				}
				
				processDetail.setDicDecideType(type);
				
				investigateService.saveInvestigateAuditStatus(sysAccount.getRoleId(), investigate, processDetail);
			}
			
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("操作成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			commonJsonResult = CommonJsonResult.build(500, "操作失败！");
		}
		
		return commonJsonResult;
	}

}
