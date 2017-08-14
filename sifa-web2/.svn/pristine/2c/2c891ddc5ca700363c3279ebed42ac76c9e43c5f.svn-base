package com.rowell.sifa.web.rewardspunishment;

import java.util.Date;
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
import com.rowell.sifa.commons.shiro.ShiroUser;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.ReducePenalty;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritJudgmentService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.ReducePenaltyService;
import com.rowell.sifa.service.sys.SysAccountService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: CommendController  
    * @Description: 减刑 
    * @author yxb  
    * @date 2017年3月23日  
    *
 */
@Controller
@RequestMapping(value="/rewardspunishment/reducePenalty")
public class ReducePenaltyController extends BaseController{
	@Autowired
	private SysAccountService sysAccountService;
	@Autowired
	private ReducePenaltyService reducePenaltyService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private ProcessDetailService processDetailService;
	@Autowired
	private CulpritJudgmentService culpritJudgmentService;
	@Autowired
	private SysFileService sysFileService;
	@ModelAttribute("reducePenalty")
	public ReducePenalty get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return reducePenaltyService.findById(id);
		}else{
			return new ReducePenalty();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(ReducePenalty reducePenalty, Model model, HttpServletRequest request) {
		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);
		return "modules/rewardspunishment/reducePenalty/reducePenaltyList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(ReducePenalty reducePenalty, String name,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(reducePenalty.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(reducePenalty.getOrderStr());
		}
		if(!StringUtils.isBlank(name)){
			reducePenalty.setGroupName(name);
		}
		List<ReducePenalty> list = reducePenaltyService.findAll(reducePenalty);
		for(ReducePenalty reduce:list){
			
			if(!StringUtils.isBlank(reduce.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(reduce);
			}
		}
		PageInfo<ReducePenalty> pageInfo = new PageInfo<ReducePenalty>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	//跳转到增加页面
	@RequestMapping(value = "add")
	public String forAdd(@ModelAttribute("reducePenalty")ReducePenalty reducePenalty, Model model, HttpServletRequest request) {
		model.addAttribute("reducePenalty", reducePenalty);
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(reducePenalty.getId());
		record.setFileType(Constants.FILE_REDUCE_PENALTY_CL_PATH);
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		return "modules/rewardspunishment/reducePenalty/reducePenaltyForm";
	}
	//保存表扬信息
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(ReducePenalty reducePenalty, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			reducePenalty.setEndTime(new Date());
			List<SysFile> fileList = getSysFiles();
			return reducePenaltyService.inserts(reducePenalty,fileList);
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(reducePenalty.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改失败！");
				commonJsonResult.setIsError(true);
			}
			return commonJsonResult;
		}
	}
	
	//终止流程
	@RequestMapping("stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(@ModelAttribute("reducePenalty")ReducePenalty reducePenalty,Model model){
		try {
			ProcessUtils.endProcess("endevent1", reducePenalty  .getTaskId());
			
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}

	//跳转审批页面
	@RequestMapping("reducePenaltyAudit")
	public String commendAudit(@ModelAttribute("reducePenalty")ReducePenalty reducePenalty,Model model){
		ShiroUser activeUser = SysAccountUtils.getPrincipal();
		SysAccount sysAccount = sysAccountService.findById(activeUser.getId());
		model.addAttribute("sysAccount",sysAccount.getRoleId());
		model.addAttribute("reducePenalty", reducePenalty);
		model.addAttribute("culprit", culpritService.findById(reducePenalty.getCulpritId()));
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(reducePenalty.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		return "modules/rewardspunishment/reducePenalty/reducePenaltyAudit";
	}
	//流程审批阶段
	@RequestMapping("submitCommendAudit")
	@ResponseBody
	public CommonJsonResult submitCommendAudit(@ModelAttribute("reducePenalty")ReducePenalty reducePenalty,String decideType,
			String opinion, Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult = null;
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
			List<SysFile> fileList =null;
			reducePenaltyService.saveCommenAuditStatus(sysAccount.getRoleId(), reducePenalty, processDetail,fileList);
			commonJsonResult = CommonJsonResult.ok();
			if(reducePenalty.getAuditType().equals("sfsReport")){
				commonJsonResult.setMsg("上报成功！");
			}else if(reducePenalty.getAuditType().equals("gS")){
				commonJsonResult.setMsg("提交成功！");
			}else{
				commonJsonResult.setMsg("审批成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			commonJsonResult = CommonJsonResult.build(500, "处理失败！");
			
		}
		return commonJsonResult;
	}
	//流程详情
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("reducePenalty")ReducePenalty reducePenalty, Model model) {
		model.addAttribute("reducePenalty", reducePenalty);
		if(!StringUtils.isBlank(reducePenalty.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(reducePenalty.getProcessInstanceId()));
		}
		
		model.addAttribute("culprit", culpritService.findById(reducePenalty.getCulpritId()));
		model.addAttribute("reducePenalty",reducePenaltyService.findById(reducePenalty.getId()));
		ProcessInstance processInstance = runtimeService
				.createProcessInstanceQuery()
				.processInstanceId(reducePenalty.getProcessInstanceId()).singleResult();
		if(processInstance!=null){
			String processDefinitionId = processInstance.getProcessDefinitionId();

			// 将流程定义 id传到页面，用于图形显示
			model.addAttribute("processDefinitionId", processDefinitionId);
		}
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(reducePenalty.getId());
		record.setFileType(Constants.FILE_REDUCE_PENALTY_CL_PATH);
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		
		SysFile record1 = new SysFile();
		record1.setOrderStr("created asc");
		record1.setTableId(reducePenalty.getId());
		record1.setFileType(Constants.FILE_REDUCE_PENALTY_GZCL_PATH);
		List<SysFile> fileList1 = sysFileService.findAll(record1);
		model.addAttribute("fileList1", fileList1);
		
		return "modules/rewardspunishment/reducePenalty/reducePenaltyDetail";
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
	public String forProcessDetail(@ModelAttribute("reducePenalty") ReducePenalty reducePenalty, Model model){
		model.addAttribute("reducePenalty", reducePenalty);
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(reducePenalty.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		return "modules/rewardspunishment/reducePenalty/reducePenaltyProcessDetail";
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
	public EUDataGridResult processDetail(@ModelAttribute("reducePenalty") ReducePenalty reducePenalty, Model model) {
		
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		if(!StringUtils.isBlank(reducePenalty.getProcessInstanceId())){
			
			PageHelper.startPage(1, Integer.MAX_VALUE);	
			List<ProcessDetail> list = processDetailService.findByProcessInsId(reducePenalty.getProcessInstanceId());
			PageInfo<ProcessDetail> pageInfo = new PageInfo<ProcessDetail>(list);

			// 取记录总条数
			result.setTotal(pageInfo.getTotal());
			result.setRows(list);
		}
		return result;
	}
	/**
	 * 打印界面
	 * @param securityPunishment
	 * @param model
	 * @return
	 */
	@RequestMapping("print")
	public String print(@ModelAttribute("reducePenalty") ReducePenalty reducePenalty, Model model ,String type,String docPrint){
		Culprit culprit = culpritService.findById(reducePenalty.getCulpritId());
		reducePenalty.setCulprit(culprit);
		
		CulpritJudgment culpritJudgment = new CulpritJudgment();
		culpritJudgment.setCulpritId(reducePenalty.getCulpritId());
		List<CulpritJudgment> culpritJudgmentList = culpritJudgmentService.findAll(culpritJudgment);
		if (culpritJudgmentList.size() > 0) {
			reducePenalty.setCulpritJudgment(culpritJudgmentList.get(0));
		}
		else reducePenalty.setCulpritJudgment(new CulpritJudgment());
		model.addAttribute("reducePenalty",reducePenalty);
		/*model.addAttribute("securityPunishment", reducePenalty);*/
		if("1".equals(docPrint)){
			model.addAttribute("docPrint", docPrint);
		}
										
		return "modules/rewardspunishment/reducePenalty/print/reducePenalty";

	}
	/**
	 * 
	    * @Title: warningFinishPrint  
	    * @Description: 县工作人员和市工作人员打印
	    * @param @param revokeProbation
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "reducePenaltyPrint")
	public String reducePenaltyPrint(@ModelAttribute("reducePenalty") ReducePenalty reducePenalty, Model model, HttpServletRequest request) {
		model.addAttribute("reducePenalty",reducePenalty);	
		model.addAttribute("culprit", culpritService.findById(reducePenalty.getCulpritId()));
		return "modules/rewardspunishment/reducePenalty/reducePenaltyPrint";
	}
	/**
	 * 
	    * @Title: updateFinshInfo  
	    * @Description: 打印结束更新标识  
	    * @param @param revokeProbation
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "updateFinshInfo")
	@ResponseBody
	public CommonJsonResult updateFinshInfo(ReducePenalty reducePenalty,Model model) {
		CommonJsonResult commonJsonResult = null;
		try {
			reducePenaltyService.updateById(reducePenalty);
			commonJsonResult = CommonJsonResult.build(200, "更新成功！");
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return commonJsonResult = CommonJsonResult.build(505, "更新失败！");
		}
	}
	@RequestMapping(value = "inform")
	public String inform(ReducePenalty reducePenalty, Model model, HttpServletRequest request) {
		model.addAttribute("reducePenalty", reducePenalty);	
		model.addAttribute("culprit", culpritService.findById(reducePenalty.getCulpritId()));
		return "modules/rewardspunishment/reducePenalty/reducePenaltyInform";
	}
	@RequestMapping("/finishInform")
	@ResponseBody
	public CommonJsonResult finishInform(ReducePenalty reducePenalty,Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult=null;
		try {
			List<SysFile> fileList=getSysFiles();
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			reducePenaltyService.saveCommenAuditStatus(sysAccount.getRoleId(), reducePenalty, processDetail,fileList);
			commonJsonResult = CommonJsonResult.build(200, "提交成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "提交失败！", true);
		}
		return commonJsonResult;
	}
	
	
	//删除
		@RequestMapping(value = "delete")
		@ResponseBody
		public CommonJsonResult batchDelete(ReducePenalty reducePenalty, RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;
			try {
				reducePenaltyService.deleteById(reducePenalty.getId());
				commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
			}
			return commonJsonResult;
		}
	
}
