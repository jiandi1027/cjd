package com.rowell.sifa.web.rewardspunishment;

import java.text.SimpleDateFormat;
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
import com.rowell.sifa.pojo.rewardspunishment.Commend;
import com.rowell.sifa.pojo.rewardspunishment.RevokeProbation;
import com.rowell.sifa.pojo.rewardspunishment.Warning;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritJudgmentService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.WarningService;
import com.rowell.sifa.service.sys.SysAccountService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: CommendController  
    * @Description: 警告
    * @author yxb  
    * @date 2017年3月23日  
    *
 */
@Controller
@RequestMapping(value="/rewardspunishment/warning")
public class WarningController extends BaseController{
	@Autowired
	private SysAccountService sysAccountService;
	@Autowired
	private WarningService warningService;
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
	
	@ModelAttribute("warning")
	public Warning get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return warningService.findById(id);
		}else{
			return new Warning();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Warning warning, Model model, HttpServletRequest request) {
		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);
		return "modules/rewardspunishment/warning/warningList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(Warning warning,String name,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		
		if (StringUtils.isBlank(warning.getGroupId())) {
			warning.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		if(!"".equals(name) && name != null){
			warning.setCulpritName(name);
		}
		if (StringUtils.isBlank(warning.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(warning.getOrderStr());
		}
		List<Warning> list = warningService.findAll(warning);
		for(Warning warnin:list){
			ShiroUser activeUser = SysAccountUtils.getPrincipal();
			SysAccount sysAccount = sysAccountService.findById(activeUser.getId());
			warnin.setRoleId(sysAccount.getRoleId());
			if(!StringUtils.isBlank(warnin.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(warnin);
			}
		}
		PageInfo<Warning> pageInfo = new PageInfo<Warning>(list);
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
	public String forAdd(@ModelAttribute("warning")Warning warning, 
			@RequestParam(value = "isAddFlag", required = false, defaultValue = "1") String isAddFlag, Model model, HttpServletRequest request) {
		model.addAttribute("warning",warning);
		
		model.addAttribute("isAddFlag", isAddFlag);
		return "modules/rewardspunishment/warning/warningForm";
	}
	
	//保存警告信息
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Warning warning, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if( StringUtils.isBlank( warning.getId()) ) {
				warningService.inserts(warning);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			}
			else {
				warningService.updateByIdSelective(warning) ;
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改成功");
			}
			
			List<SysFile> fileList = getSysFiles();
			sysFileService.saveFiles(fileList, Constants.FILE_TABLE_WARNING, warning.getId(), Constants.FILE_WARNING_JG_PATH);
			return commonJsonResult;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "保存失败！");
			commonJsonResult.setIsError(true);
			return commonJsonResult;
		}
	}
	
	//终止流程
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(@ModelAttribute("commend")Commend commend,Model model){
		try {
			ProcessUtils.endProcess("endevent1", commend.getTaskId());
			
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}

	//跳转审批页面
	@RequestMapping("/warningAudit")
	public String warningAudit(@ModelAttribute("warning")Warning warning,Model model){
		ShiroUser activeUser = SysAccountUtils.getPrincipal();
		SysAccount sysAccount = sysAccountService.findById(activeUser.getId());
		model.addAttribute("sysAccount",sysAccount.getRoleId());
		model.addAttribute("warning", warning);
		model.addAttribute("culprit", culpritService.findById(warning.getCulpritId()));
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(warning.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		return "modules/rewardspunishment/warning/warningAudit";
	}
	//流程审批阶段
	@RequestMapping("submitWarningAudit")
	@ResponseBody
	public CommonJsonResult submitCommendAudit(@ModelAttribute("warning")Warning warning,String decideType,
			String opinion, Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult = null;
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			warningService.updateByIdSelective(warning);
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
			warningService.saveCommenAuditStatus(sysAccount.getRoleId(), warning, processDetail,null);
			model.addAttribute("warning",warningService.findById(warning.getId()));
			commonJsonResult = CommonJsonResult.ok();
			if(warning.getAuditType().equals("usertask1")){
				commonJsonResult.setMsg("上报成功！");
			} 
			else if("usertask6".equals(warning.getAuditType())) {
				commonJsonResult.setMsg("流程结束！");
			}
			else {
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
	public String detail(@ModelAttribute("warning")Warning warning, Model model) {
		model.addAttribute("warning", warning);
		if(!StringUtils.isBlank(warning.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(warning.getProcessInstanceId()));
		}
		model.addAttribute("warning",warningService.findById(warning.getId()));
		model.addAttribute("culprit", culpritService.findById(warning.getCulpritId()));
		
		ProcessInstance processInstance = runtimeService
				.createProcessInstanceQuery()
				.processInstanceId(warning.getProcessInstanceId()).singleResult();
		if(processInstance!=null){
			String processDefinitionId = processInstance.getProcessDefinitionId();

			// 将流程定义 id传到页面，用于图形显示
			model.addAttribute("processDefinitionId", processDefinitionId);
		}
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(warning.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		return "modules/rewardspunishment/warning/warningDetail";
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
	public String forProcessDetail(@ModelAttribute("warning") Warning warning, Model model){
		model.addAttribute("warning", warning);
		return "modules/rewardspunishment/warning/warningProcessDetail";
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
	public EUDataGridResult processDetail(@ModelAttribute("warning") Warning warning, Model model) {
		
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		if(!StringUtils.isBlank(warning.getProcessInstanceId())){
			
			PageHelper.startPage(1, Integer.MAX_VALUE);	
			List<ProcessDetail> list = processDetailService.findByProcessInsId(warning.getProcessInstanceId());
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
	@RequestMapping("/print")
	public String print(@ModelAttribute("warning") Warning warning, Model model ,String type,String docPrint){
		Culprit culprit = culpritService.findById(warning.getCulpritId());
		warning.setCulprit(culprit);
		
		CulpritJudgment culpritJudgment = new CulpritJudgment();
		culpritJudgment.setCulpritId(warning.getCulpritId());
		List<CulpritJudgment> culpritJudgmentList = culpritJudgmentService.findAll(culpritJudgment);
		if (culpritJudgmentList.size() > 0) {
			warning.setCulpritJudgment(culpritJudgmentList.get(0));
		}
		else { 
			warning.setCulpritJudgment(new CulpritJudgment());
		}
		
		//拿出司法所意见，和县分管领导的意见
		List<ProcessDetail> processDetails = processDetailService.findByProcessInsId(warning.getProcessInstanceId()) ;
		for( ProcessDetail processDetail : processDetails ) {
			if( "1".equals(processDetail.getDicDecideType()) && "司法所审核".equals(processDetail.getAuditName()) ) {
				model.addAttribute( "sfsView", processDetail.getOpinion() ) ;
				model.addAttribute("sfsAuditTime", processDetail.getUpdated() ) ;
			}
			
			if( "1".equals(processDetail.getDicDecideType()) && "县分局审核".equals(processDetail.getAuditName()) ) {
				model.addAttribute( "xfgView", processDetail.getOpinion() ) ;
				model.addAttribute( "xfgAuditTime", processDetail.getUpdated() ) ;
			}
		}
		
		model.addAttribute("securityPunishment", warning);
		if("1".equals(docPrint)){
			model.addAttribute("docPrint", docPrint);
		}
		if (type.equals("1")) {								
			return "modules/rewardspunishment/warning/print/warningPrint";
		}
		if (type.equals("2")) {								
			return "modules/rewardspunishment/warning/print/warning";
		}
		return null;
	}
	
	
	//档案返回口头警告页面
	@RequestMapping(value = "warningDoclist")
	public String warningDoclist(Warning warning, Model model, HttpServletRequest request) {
		model.addAttribute("warning", warning);	
		model.addAttribute("culprit", culpritService.findById(warning.getCulpritId()));
		return "modules/dailymgr/documentManage/rewardspunishment/warningDoc";
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
	@RequestMapping(value = "warningFinishPrint")
	public String warningFinishPrint(@ModelAttribute("warning")Warning warning, Model model, HttpServletRequest request) {
		model.addAttribute("warning", warning);	
		model.addAttribute("culprit", culpritService.findById(warning.getCulpritId()));
		return "modules/rewardspunishment/warning/warningFinishPrint";
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
	public CommonJsonResult updateFinshInfo(Warning warning,Model model) {
		CommonJsonResult commonJsonResult = null;
		try {
			warningService.updateByIdSelective(warning);
			commonJsonResult = CommonJsonResult.build(200, "更新成功！");
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return commonJsonResult = CommonJsonResult.build(505, "更新失败！");
		}
	}
	/**
		* 
		   * @Title: inform  
		   * @Description: 告知
		   * @param @param revokeProbation
		   * @param @param model
		   * @param @param request
		   * @param @return    参数  
		   * @return String    返回类型  
		   * @throws
	 */
	@RequestMapping(value = "inform")
	public String inform(@ModelAttribute("warning")Warning warning, Model model, HttpServletRequest request) {
		model.addAttribute("warning", warning);	
		model.addAttribute("culprit", culpritService.findById(warning.getCulpritId()));
		return "modules/rewardspunishment/warning/warningInform";
	}
	/**
	 * 
	    * @Title: finishInform  
	    * @Description: 告知提交（流程结束）
	    * @param @param detached
	    * @param @param decideType
	    * @param @param opinion
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping("/finishInform")
	@ResponseBody
	public CommonJsonResult finishInform(Warning warning,Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult=null;
		try {
			List<SysFile> fileList=getSysFiles();
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			warningService.saveCommenAuditStatus(sysAccount.getRoleId(), warning, processDetail,fileList);
			commonJsonResult = CommonJsonResult.build(200, "提交成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "提交失败！", true);
		}
		return commonJsonResult;
	}
}
