package com.rowell.sifa.web.endcorrect;

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
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.endcorrect.Death;
import com.rowell.sifa.pojo.endcorrect.RedressStop;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.RedressStopService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.sys.SysGroupService;
import com.rowell.sifa.web.base.BaseController;

@Controller
@RequestMapping(value = "/endcorrect/redressStop")
public class RedressStopController extends BaseController{
	
	@Autowired
	private RedressStopService redressStopService;
	@Autowired
	private ProcessDetailService processDetailService;
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private SysGroupService sysGroupService;
	
	
	@ModelAttribute("redressStop")
	public RedressStop get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return redressStopService.findById(id);
		} else {
			return new RedressStop();
		}
	}
	
	/**
	 * 跳转到主页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(RedressStop redressStop, 
			Model model, HttpServletRequest request) {
		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);
		return "modules/endcorrect/redressStop/redressStoplist";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(RedressStop redressStop,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if (StringUtils.isBlank(redressStop.getGroupId())) {
			redressStop.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(redressStop.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(redressStop.getOrderStr());
		}
		
		List<RedressStop> list = redressStopService.findAll(redressStop);

		for(RedressStop redressStopEntity:list){		//填充流程实例
			if(!StringUtils.isBlank(redressStopEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(redressStopEntity);
			}
		}
		PageInfo<RedressStop> pageInfo = new PageInfo<RedressStop>(list);

		model.addAttribute("pager", pageInfo);

		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	
	/**
	 * 跳转到增加页面
	 * @param RedressStop
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "add")
	public String add(RedressStop redressStop, Model model, HttpServletRequest request) {
		return "modules/endcorrect/redressStop/redressStopAdd";
	}
	/**
	 * 新增记录
	 * @param RedressStop
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(RedressStop redressStop, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, redressStop)) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(redressStop.getId())) {
				redressStopService.insert(redressStop);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功 ");
			}
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(redressStop.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	
//	/**
//	 * 根据id删除特殊情况矫正终止
//	 * 
//	 * @param redressStop
//	 * @param redirectAttributes
//	 * @return
//	 */
//	@RequestMapping(value = "batchDelete")
//	@ResponseBody
//	public CommonJsonResult batchDelete(RedressStop redressStop, RedirectAttributes redirectAttributes) {
//		CommonJsonResult commonJsonResult = null;
//		try {
//			redressStopService.deleteById(redressStop.getIds().get(0));
//			commonJsonResult = CommonJsonResult.build(200, "删除特殊情况矫正终止成功！", false);
//		} catch (Exception e) {
//			logger.error(e.getMessage());
//			commonJsonResult = CommonJsonResult.build(505, "删除特殊情况矫正终止失败！", true);
//		}
//		return commonJsonResult;
//	}
	
	/**
	 * 根据id批量删除特殊情况矫正终止
	 * 
	 * @param redressStop
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(RedressStop redressStop, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			redressStopService.batchDelete(redressStop.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
	
	/**
	 * 终止流程
	 * @param securityPunishment
	 * @param model
	 * @return
	 */
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(@ModelAttribute("redressStop")RedressStop redressStop,Model model){
		try {
			ProcessUtils.endProcess("endevent1", redressStop.getTaskId());
			
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}
	
	
	/**
	 * 跳转到特殊情况矫正终止详情页面
	 * @param redressStop
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("redressStop") RedressStop redressStop, Model model) {
		model.addAttribute("redressStop", redressStop);
		if (!StringUtils.isBlank(redressStop.getProcessInstanceId())) {
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(redressStop.getProcessInstanceId()));
		}

		model.addAttribute("culprit", culpritService.findById(redressStop.getCulpritId()));

		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
				.processInstanceId(redressStop.getProcessInstanceId()).singleResult();
		if (processInstance != null) {
			String processDefinitionId = processInstance.getProcessDefinitionId();

			// 将流程定义 id传到页面，用于图形显示
			model.addAttribute("processDefinitionId", processDefinitionId);
		}
		return "modules/endcorrect/redressStop/redressStopDetail";
	}
	@RequestMapping("/redressStopAudit")
	public String askLeaveAudit(@ModelAttribute("redressStop") RedressStop redressStop, Model model, String auditType) {
		return "modules/endcorrect/redressStop/redressStopAudit";
	}
	@RequestMapping("/submitRedressStopAudit")
	@ResponseBody
	public CommonJsonResult askLeaveAudit(@ModelAttribute("redressStop") RedressStop redressStop, String decideType, String opinion, Model model,
			HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
			redressStopService.saveredressStopAuditStatus(sysAccount.getRoleId(), redressStop, processDetail);
			
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("处理成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			commonJsonResult = CommonJsonResult.build(500, "处理失败！");
		}
		
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
	public String forProcessDetail(@ModelAttribute("redressStop") RedressStop redressStop, Model model){
		model.addAttribute("redressStop", redressStop);
		return "modules/endcorrect/redressStop/redressStopProcessDetail";
	}
	
	
	
	/**
	 * 特殊原因中止矫正
	 * @param askLeave
	 * @param model
	 * @return
	 */
	@RequestMapping("/workerPrint")
	public String investigateWorkerPrint(@ModelAttribute("redressStop")RedressStop redressStop, Model model){
		model.addAttribute("redressStop", redressStop);	
		model.addAttribute("culprit", culpritService.findById(redressStop.getCulpritId()));

		return "modules/endcorrect/redressStop/redressStopWorkerPrint";
	}
	
	
	
	
	
	
	
	/**
	 * 
	    * @Title: finish
	    * @Description: 提交（流程结束）
	    * @param @param redressStop
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping("/finish")
	@ResponseBody
	public CommonJsonResult finishInform(RedressStop redressStop,Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult=null;
		try {
		
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			redressStopService.saveredressStopAuditStatus(sysAccount.getRoleId(), redressStop, processDetail);
			commonJsonResult = CommonJsonResult.build(200, "提交成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "提交失败！", true);
		}
		return commonJsonResult;
	}
	
	
	
	
	/**
	 * 打印
	 * @param redressStop
	 * @param model
	 * @return
	 */
	@RequestMapping("/printone")
	public String printone(@ModelAttribute("redressStop")RedressStop redressStop, Model model){
		if (!StringUtils.isBlank(redressStop.getCulpritId())) {
			Culprit culprit = culpritService.findById(redressStop.getCulpritId());
			redressStop.setCulprit(culprit);
		}
		if (!StringUtils.isBlank(redressStop.getGroupId())) {
			SysGroup sysGroup = sysGroupService.findById(redressStop.getGroupId());
			redressStop.setSysGroup(sysGroup);
		}
		model.addAttribute("redressStop", redressStop);
		
		return "modules/endcorrect/redressStop/print/print1";		//社区服刑人员外出证明
	}
	
	
	/**
	 * 打印
	 * @param redressStop
	 * @param model
	 * @return
	 */
	@RequestMapping("/printtwo")
	public String printtwo(@ModelAttribute("redressStop")RedressStop redressStop, Model model){
		if (!StringUtils.isBlank(redressStop.getCulpritId())) {
			Culprit culprit = culpritService.findById(redressStop.getCulpritId());
			redressStop.setCulprit(culprit);
		}
		if (!StringUtils.isBlank(redressStop.getGroupId())) {
			SysGroup sysGroup = sysGroupService.findById(redressStop.getGroupId());
			redressStop.setSysGroup(sysGroup);
		}
		model.addAttribute("redressStop", redressStop);
		
		return "modules/endcorrect/redressStop/print/print2";		//社区服刑人员外出证明
	}
	
	
	

	/**
	 * 
	    * @Title: updateFinshInfo  
	    * @Description: 打印结束更新标识  
	    * @param @param redressStop
	    * @param @param request
	    * @param @param model
	    * @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
		@RequestMapping(value = "updateFinshInfo")
		@ResponseBody
		public CommonJsonResult updateFinshInfo(String id, String isPrintONE,String isPrintTWO) {
			CommonJsonResult commonJsonResult = null;
			try {
				
				RedressStop redressStop=new RedressStop();
				if(!StringUtils.isBlank(id)){
					redressStop.setId(id);
				}
				if(!StringUtils.isBlank(isPrintONE)){
					redressStop.setIsPrintONE(Integer.valueOf(isPrintONE));
				}
				if(!StringUtils.isBlank(isPrintTWO)){
					redressStop.setIsPrintTWO(Integer.valueOf(isPrintTWO));
				}
				
				redressStopService.updateByIdSelective(redressStop);
				commonJsonResult = CommonJsonResult.build(200, "更新成功！");
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				return commonJsonResult = CommonJsonResult.build(505, "更新失败！");
			}
		}
	
	
	
	
}
