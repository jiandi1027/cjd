package com.rowell.sifa.web.rewardspunishment;

import java.util.Calendar;
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
import com.rowell.common.utils.DateUtils;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SpringContextHolder;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.endcorrect.Detached;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.RevokeProbation;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.ImprisonService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.RevokeProbationService;
import com.rowell.sifa.service.sys.SysDicService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: RevokeProbationController  
    * @Description: 提请撤销缓刑
    * @author zhl 
    * @date 2017年3月23日  
    *
 */
@Controller
@RequestMapping(value = "/jiangcheng/revokeProbation")
public class RevokeProbationController extends BaseController {
	@Autowired
	private RevokeProbationService revokeProbationService;
	@Autowired
	private CulpritService culpritService;
	
	@Autowired
	private ProcessDetailService processDetailService;
	
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private SysDicService sysDicService;
	
	@Autowired
	private ImprisonService imprisonService;
	
	@ModelAttribute("revokeProbation")
	public RevokeProbation get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return revokeProbationService.findById(id);
		} else {
			return new RevokeProbation();
		}
	}
	
	/**
	 * 
	    * @Title: forList  
	    * @Description: get请求跳转页面
	    * @param @param RevokeProbation
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(RevokeProbation RevokeProbation, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/assess/revokeProbation/revokeProbationList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(RevokeProbation revokeProbation,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(revokeProbation.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(revokeProbation.getOrderStr());
		}

		List<RevokeProbation> list = revokeProbationService.findAll(revokeProbation);
		for(RevokeProbation revokeProbationEntity:list){
			if(!StringUtils.isBlank(revokeProbationEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(revokeProbationEntity);
			} 
		}
		PageInfo<RevokeProbation> pageInfo = new PageInfo<RevokeProbation>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	/**
	 * 
	    * @Title: form  
	    * @Description: 跳转至增加页面  
	    * @param @param RevokeProbation
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("revokeProbation") RevokeProbation revokeProbation, Model model) {
		if(revokeProbation.getId()!=null){//若id不为空，则为修改
			model.addAttribute("revokeProbation", revokeProbation);
			//model.addAttribute("culprit", culpritService.findById(revokeProbation.getCulpritId()));
		}
		return "modules/assess/revokeProbation/revokeProbationForm";
	}
	//保存草稿
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(RevokeProbation revokeProbation, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			if (!beanValidator(model, revokeProbation)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			if (StringUtils.isBlank(revokeProbation.getId())) {
				revokeProbationService.insert(revokeProbation);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setData(revokeProbation.getId());
				commonJsonResult.setMsg("保存撤销缓刑成功");
			} else {
				revokeProbationService.updateByIdSelective(revokeProbation);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setData(revokeProbation.getId());
				commonJsonResult.setMsg("修改撤销缓刑成功");
			}
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(revokeProbation.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存撤销缓刑失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改撤销缓刑失败！");
				commonJsonResult.setIsError(true);
			}
			return commonJsonResult;
		}
	}
	
		//保存撤销缓刑建议书
		@RequestMapping(value = "saveBook")
		@ResponseBody
		public CommonJsonResult saveBook(RevokeProbation revokeProbation, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;
			try {
					String issueYear=request.getParameter("issueYear");
					String issueMonth=request.getParameter("issueMonth");
					String issueDay=request.getParameter("issueDay");
					String issueTime=issueYear+","+issueMonth+","+issueDay;
					revokeProbation.setIssueTime(issueTime);
					revokeProbationService.updateByIdSelective(revokeProbation);
					commonJsonResult = CommonJsonResult.ok();
					commonJsonResult.setData(revokeProbation.getId());
					commonJsonResult.setMsg("保存建议书成功");
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
					commonJsonResult = CommonJsonResult.build(505, "保存建议书失败！");
					commonJsonResult.setIsError(true);
				return commonJsonResult;
			}
		}
	
	
	//详细
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("revokeProbation") RevokeProbation revokeProbation, Model model) {
		model.addAttribute("revokeProbation", revokeProbation);
		if(!StringUtils.isBlank(revokeProbation.getProcessInstanceId())){
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(revokeProbation.getProcessInstanceId());
			for(ProcessDetail processDetail:processDetails){
				if("1".equals(processDetail.getDicDecideType())||"6".equals(processDetail.getDicDecideType())){
					processDetail.setDicDecideType("同意");
				}else if("2".equals(processDetail.getDicDecideType())){
					processDetail.setDicDecideType("退回");
				}else{
					processDetail.setDicDecideType("不同意");
				}
			}
			model.addAttribute("processDetails",processDetails);
			ProcessInstance processInstance = runtimeService
					.createProcessInstanceQuery()
					.processInstanceId(revokeProbation.getProcessInstanceId()).singleResult();
			if(processInstance!=null){
				String processDefinitionId = processInstance.getProcessDefinitionId();
				// 将流程定义 id传到页面，用于图形显示
				model.addAttribute("processDefinitionId", processDefinitionId);
			}
		}
		model.addAttribute("culprit", culpritService.findById(revokeProbation.getCulpritId()));
		return "modules/assess/revokeProbation/revokeProbationDetail";
	}
	
	//删除
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult batchDelete(RevokeProbation revokeProbation, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			revokeProbationService.deleteById(revokeProbation.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除撤销缓刑成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除撤销缓刑失败！", true);
		}
		return commonJsonResult;
	}
	
	//保存草稿并上报
	@RequestMapping(value = "preSubmit")
	public String preSubmit(@ModelAttribute("revokeProbation") RevokeProbation revokeProbation, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		String issueTime=revokeProbation.getIssueTime();
		if(issueTime!=null){
			String issueYear=issueTime.substring(0, 4);
			String issueMonth=issueTime.substring(5, 7);
			String issueDay=issueTime.substring(8, 10);
			System.out.println(issueYear+","+issueMonth+","+issueDay);
			model.addAttribute("issueYear", issueYear);
			model.addAttribute("issueMonth", issueMonth);
			model.addAttribute("issueDay", issueDay);
		}
		if(request.getParameter("detail")!=null){//表示该请求来自详细页面，仅用户打印，不做上报或修改操作
			model.addAttribute("detail", "1");
		}
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("revokeProbation", revokeProbation);
		model.addAttribute("culprit", culpritService.findById(revokeProbation.getCulpritId()));
		return "modules/assess/revokeProbation/print/printRevokeProbationBook";
	}
	
	////打印《撤销缓刑审核书》
	@RequestMapping(value = "printJianYi")
	public String printJianYi(@ModelAttribute("revokeProbation") RevokeProbation revokeProbation, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("revokeProbation", revokeProbation);
		model.addAttribute("culprit", culpritService.findById(revokeProbation.getCulpritId()));
		return "modules/assess/revokeProbation/print/printRevokeProbationTable";
	}
	
	/**
	 * 
	    * @Title: submitRevokeProbation 
	    * @Description: 流程上报 
	    * @param @param detached
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "submitRevokeProbation", method = RequestMethod.GET)
	@ResponseBody
	public CommonJsonResult submitRevokeProbation(RevokeProbation revokeProbation, Model model, HttpServletRequest request) {
		//设置签发时间
		String issueYear = request.getParameter("issueYear");
		String issueMonth =request.getParameter("issueMonth");
		String issueDay =  request.getParameter("issueDay");
		Calendar cal = Calendar.getInstance();
		if (issueYear == null || issueYear.length() <= 0) {
			issueYear = "" + cal.get(Calendar.YEAR);
		}
		if (issueMonth == null || issueMonth.length() <= 0) {
			issueMonth = "" + (cal.get(Calendar.MONTH) + 1);
		}
		if (issueDay == null || issueDay.length() <= 0) {
			issueDay = "" + cal.get(Calendar.DAY_OF_MONTH);
		}
		String issueTime = issueYear + "," + issueMonth + "," + issueDay;
		revokeProbation.setIssueTime(issueTime);
		revokeProbationService.updateById(revokeProbation);
		SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);//获取当前用户
		String decideType=request.getParameter("decideType");
		ProcessDetail processDetail = new ProcessDetail();
		processDetail.setDicDecideType(decideType);//用户判断上传是谁发起的
		try {
			revokeProbationService.submitRevokeProbation(sysAccount.getId(), revokeProbation,processDetail);
			return CommonJsonResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return CommonJsonResult.build(505, "上报失败");
		}
	}
	/**
	 * 
	    * @Title: revokeProbationAudit  
	    * @Description:流程审批页面
	    * @param @param askLeave
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping("/revokeProbationAudit")
	public String revokeProbationAudit(@ModelAttribute("revokeProbation")RevokeProbation revokeProbation,Model model){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("revokeProbation", revokeProbation);
		model.addAttribute("culprit", culpritService.findById(revokeProbation.getCulpritId()));
		return "modules/assess/revokeProbation/revokeProbationAudit";
	}
	
	/**
	 * 
	    * @Title: submitDetachedAudit  
	    * @Description: 处理审核结果
	    * @param @param detached
	    * @param @param decideType
	    * @param @param opinion
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping("/submitRevokeProbationAudit")
	@ResponseBody
	public CommonJsonResult submitRevokeProbationAudit(@ModelAttribute("revokeProbation")RevokeProbation revokeProbation,String decideType,String opinion, Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult=null;
		try {
			revokeProbationService.updateById(revokeProbation);
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			if(revokeProbation.getAuditType().equals("xfgCheck") && "97003".equals(revokeProbation.getSubmittionOrgTypeId())&&"1".equals(decideType)){
				decideType="6";
			}
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
			revokeProbationService.saveRevokeProbationAuditStatus(sysAccount.getRoleId(), revokeProbation, processDetail);
			commonJsonResult = CommonJsonResult.build(200, "流程处理完毕！", false);
			//流程审批结束时，在imprison插入数据
			if("1007".equals(sysAccount.getRoleId())||"2007".equals(sysAccount.getRoleId())){
				ProcessInstance rpi = SpringContextHolder.getApplicationContext().getBean(RuntimeService.class)//
						.createProcessInstanceQuery()// 创建流程实例查询对象
						.processInstanceId(revokeProbation.getProcessInstanceId()).singleResult();
				if (rpi == null) {//流程结束
					imprisonService.insertRevokeProbation(revokeProbation);
				}		
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "流程处理失败！", true);
		}
		System.out.println("流程处理完毕！");
		return commonJsonResult;
		//return "redirect:/jiangcheng/revokeProbation/list";
		
	}
	
	/**
	 * 
	    * @Title: 流程终止
	    * @Description: TODO(这里用一句话描述这个方法的作用)  
	    * @param @param askLeave
	    * @param @param model
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(RevokeProbation revokeProbation,Model model){
		try {
			ProcessUtils.endProcess("endevent1", revokeProbation.getTaskId());
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}
	
	
	
}
