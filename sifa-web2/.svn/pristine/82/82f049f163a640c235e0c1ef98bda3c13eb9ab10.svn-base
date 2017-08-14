package com.rowell.sifa.web.rewardspunishment;

import java.util.Calendar;
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
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.pojo.flow.ProcessDetail;

import com.rowell.sifa.pojo.rewardspunishment.SecurityPunishment;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritJudgmentService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.SecurityPunishmentService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  提请治安管理处罚Controller
 * 
 * @author pkx
 * @version 2017-4-1
 */
@Controller
@RequestMapping(value = "/rewardspunishment/securityPunishment")
public class SecurityPunishmentController extends BaseController {
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private ProcessDetailService processDetailService;
	@Autowired
	private SecurityPunishmentService securityPunishmentService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private CulpritJudgmentService culpritJudgmentService;
	@Autowired
	private SysFileService sysFileService;
	
	@ModelAttribute("securityPunishment")
	public SecurityPunishment get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return securityPunishmentService.findById(id);
		} else {
			return new SecurityPunishment();
		}
	}
	
	
	/***
	 * 
	    * @Title: forList  
	    * @Description: 提请治安管理处罚跳转页 
	    * @param @param securityPunishment
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(SecurityPunishment securityPunishment, Model model, HttpServletRequest request) {
		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);
		
		return "modules/rewardspunishment/securityPunishment/securityPunishmentList";
	}
	
	
	/***
	    * @Title: list  
	    * @Description: 查找提请治安管理处罚
	    * @param @param securityPunishment
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
	public EUDataGridResult list(SecurityPunishment securityPunishment,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if (StringUtils.isBlank(securityPunishment.getGroupId())) {
			securityPunishment.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(securityPunishment.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(securityPunishment.getOrderStr());
		}

		List<SecurityPunishment> list = securityPunishmentService.findAll(securityPunishment);

		for(SecurityPunishment investigateEntity:list){		//填充流程实例
			if(!StringUtils.isBlank(investigateEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(investigateEntity);
			}
		}
		
		PageInfo<SecurityPunishment> pageInfo = new PageInfo<SecurityPunishment>(list);

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

	
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑提请治安管理处罚  
	    * @param @param securityPunishment
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(SecurityPunishment securityPunishment, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, securityPunishment)) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			if (StringUtils.isBlank(securityPunishment.getId())) {
//				securityPunishment.init();//初始化部分信息
				securityPunishmentService.insertMore(securityPunishment,getSysFiles("endCase"),getSysFiles("note"));
				
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			} else {
				securityPunishmentService.updateMore(securityPunishment,getSysFiles("endCase"),getSysFiles("note"));
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			}
			
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(securityPunishment.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	
	
	
	
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除提请治安管理处罚  
	    * @param @param securityPunishment
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(SecurityPunishment securityPunishment, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			securityPunishmentService.batchDelete(securityPunishment.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		
		return commonJsonResult;
	}

	
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("securityPunishment") SecurityPunishment securityPunishment, Model model) {
		
		if(!StringUtils.isBlank(securityPunishment.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(securityPunishment.getProcessInstanceId()));
			ProcessUtils.fillProcessInfo(securityPunishment);
		}
		model.addAttribute("securityPunishment", securityPunishment);
		model.addAttribute("sysAccount", SysAccountUtils.getSysAccount());
		
		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(securityPunishment.getProcessInstanceId()).singleResult();
		if(processInstance!=null){
			String processDefinitionId = processInstance.getProcessDefinitionId();

			// 将流程定义 id传到页面，用于图形显示
			model.addAttribute("processDefinitionId", processDefinitionId);
		}

		SysFile record1 = new SysFile();
		record1.setOrderStr("created asc");
		record1.setTableId(securityPunishment.getId());
		record1.setFileType(Constants.FILE_SECURITY_PUNISHMENT_ENDCASE);
		List<SysFile> fileList1 = sysFileService.findAll(record1);
		model.addAttribute("fileList1", fileList1);
		
		SysFile record2 = new SysFile();
		record2.setOrderStr("created asc");
		record2.setTableId(securityPunishment.getId());
		record2.setFileType(Constants.FILE_SECURITY_PUNISHMENT_NOTE);
		List<SysFile> fileList2 = sysFileService.findAll(record2);
		model.addAttribute("fileList2", fileList2);
		
		return "modules/rewardspunishment/securityPunishment/securityPunishmentDetail";
	}
	
	/**
	 * 终止流程
	 * @param securityPunishment
	 * @param model
	 * @return
	 */
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(@ModelAttribute("securityPunishment")SecurityPunishment securityPunishment,Model model){
		try {
			ProcessUtils.endProcess("endevent1", securityPunishment.getTaskId());
			
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}
	
	
	/**
	 * 提请治安管理处罚界面
	 * @param securityPunishment
	 * @param model
	 * @return
	 */
	@RequestMapping("/form")
	public String investigateWorkerReport(@ModelAttribute("securityPunishment")SecurityPunishment securityPunishment,
			@RequestParam(value = "isAddFlag", required = false, defaultValue = "1") String isAddFlag, Model model){
		
		SysFile record1 = new SysFile();
		record1.setOrderStr("created asc");
		record1.setTableId(securityPunishment.getId());
		record1.setFileType(Constants.FILE_SECURITY_PUNISHMENT_ENDCASE);
		List<SysFile> fileList1 = sysFileService.findAll(record1);
		model.addAttribute("fileList1", fileList1);
		
		SysFile record2 = new SysFile();
		record2.setOrderStr("created asc");
		record2.setTableId(securityPunishment.getId());
		record2.setFileType(Constants.FILE_SECURITY_PUNISHMENT_NOTE);
		List<SysFile> fileList2 = sysFileService.findAll(record2);
		model.addAttribute("fileList2", fileList2);
		
		model.addAttribute("isAddFlag", isAddFlag);
		
		return "modules/rewardspunishment/securityPunishment/securityPunishmentForm";
	}
	
	/**
	 * 提请治安管理处罚打印界面
	 * @param securityPunishment
	 * @param model
	 * @return
	 */
	@RequestMapping("/workerPrint")
	public String investigateWorkerPrint(@ModelAttribute("securityPunishment")SecurityPunishment securityPunishment, Model model){
		model.addAttribute("securityPunishment", securityPunishment);	
		model.addAttribute("culprit", culpritService.findById(securityPunishment.getCulpritId()));

		return "modules/rewardspunishment/securityPunishment/securityPunishmentWorkerPrint";
	}
	
	
	/**
	 * 司法所开始调查推送界面
	 * @param securityPunishment
	 * @param model
	 * @return
	 */
	@RequestMapping("/securityPunishmentPush")
	public String securityPunishmentPush(@ModelAttribute("securityPunishment")SecurityPunishment securityPunishment,Model model){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		Culprit culprit = culpritService.findById(securityPunishment.getCulpritId());
		securityPunishment.setCulprit(culprit);
		
		CulpritJudgment culpritJudgment = new CulpritJudgment();
		culpritJudgment.setCulpritId(securityPunishment.getCulpritId());
		List<CulpritJudgment> culpritJudgmentList = culpritJudgmentService.findAll(culpritJudgment);
		if (culpritJudgmentList.size() > 0) {
			securityPunishment.setCulpritJudgment(culpritJudgmentList.get(0));
		}
		else securityPunishment.setCulpritJudgment(new CulpritJudgment());
		
		Calendar c = Calendar.getInstance();
		model.addAttribute("issueYear", c.get(Calendar.YEAR));
		model.addAttribute("issueMonth", c.get(Calendar.MONTH) + 1);
		model.addAttribute("issueDay", c.get(Calendar.DAY_OF_MONTH));
		
		model.addAttribute("sysAccount", sysAccount);
		
		return "modules/rewardspunishment/securityPunishment/securityPunishmentPush";
	}
	
	
	/**
	 * 提请治安上报评定界面
	 * @param securityPunishment
	 * @param model
	 * @return
	 */
	@RequestMapping("/securityPunishmentReport")
	public String securityPunishmentReport(@ModelAttribute("securityPunishment")SecurityPunishment securityPunishment,Model model){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		Culprit culprit = culpritService.findById(securityPunishment.getCulpritId());
		securityPunishment.setCulprit(culprit);
		
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("securityPunishment", securityPunishment);
		
		SysFile record1 = new SysFile();
		record1.setOrderStr("created asc");
		record1.setTableId(securityPunishment.getId());
		record1.setFileType(Constants.FILE_SECURITY_PUNISHMENT_ENDCASE);
		List<SysFile> fileList1 = sysFileService.findAll(record1);
		model.addAttribute("fileList1", fileList1);
		
		SysFile record2 = new SysFile();
		record2.setOrderStr("created asc");
		record2.setTableId(securityPunishment.getId());
		record2.setFileType(Constants.FILE_SECURITY_PUNISHMENT_NOTE);
		List<SysFile> fileList2 = sysFileService.findAll(record2);
		model.addAttribute("fileList2", fileList2);
		
		return "modules/rewardspunishment/securityPunishment/securityPunishmentReport";
	}
	
	
	/**
	 * 提请治安上报评定界面
	 * @param securityPunishment
	 * @param model
	 * @return
	 */
	@RequestMapping("/securityPunishmentReportCheck")
	public String securityPunishmentReportCheck(@ModelAttribute("securityPunishment")SecurityPunishment securityPunishment,Model model){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		Culprit culprit = culpritService.findById(securityPunishment.getCulpritId());
		securityPunishment.setCulprit(culprit);
		
		CulpritJudgment culpritJudgment = new CulpritJudgment();
		culpritJudgment.setCulpritId(securityPunishment.getCulpritId());
		List<CulpritJudgment> culpritJudgmentList = culpritJudgmentService.findAll(culpritJudgment);
		if (culpritJudgmentList.size() > 0) {
			securityPunishment.setCulpritJudgment(culpritJudgmentList.get(0));
		}
		else securityPunishment.setCulpritJudgment(new CulpritJudgment());
		
		if(!StringUtils.isBlank(securityPunishment.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(securityPunishment.getProcessInstanceId()));
			ProcessUtils.fillProcessInfo(securityPunishment);
		}
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("securityPunishment", securityPunishment);
		
		return "modules/rewardspunishment/securityPunishment/securityPunishmentReportCheck";
	}
	
	
	/**
	 * 提请治安流程
	 * 
	 * @param securityPunishment
	 * @param type
	 * @param update
	 * @param request
	 * @return
	 */
	@RequestMapping("/securityPunishmentAudit")
	@ResponseBody
	public CommonJsonResult investigateAudit(@ModelAttribute("securityPunishment")SecurityPunishment securityPunishment,String decideType,String opinion, HttpServletRequest request){
		CommonJsonResult commonJsonResult = null;
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			securityPunishment.setAccountId(sysAccount.getId());
			
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setOpinion(opinion);
			processDetail.setDicDecideType(decideType);
			
			securityPunishmentService.saveSecurityPunishmentAuditStatus(sysAccount.getRoleId(), securityPunishment, processDetail,null);
			
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("审批成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			commonJsonResult = CommonJsonResult.build(500, "审批失败！");
		}
		
		return commonJsonResult;
	}

	/**
	 * 打印界面
	 * @param securityPunishment
	 * @param model
	 * @return
	 */


	//打印《打印治安管理处罚建议书》
	@RequestMapping(value = "printJianYi")
	public String printJianYi(@ModelAttribute("securityPunishment") SecurityPunishment securityPunishment, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		//签发时间
		String issueTime=securityPunishment.getIssueTime();
		Calendar cal = Calendar.getInstance();
		String issueYear=null;
		String issueMonth=null;
		String issueDay=null;
		if(issueTime!=null){
			issueYear = issueTime.split(",")[0];
			issueMonth = issueTime.split(",")[1];
			issueDay = issueTime.split(",")[2];
		}else{
			issueYear="" + cal.get(Calendar.YEAR);
			issueMonth=((cal.get(Calendar.MONTH) + 1)<10)?"0"+(cal.get(Calendar.MONTH) + 1):""+(cal.get(Calendar.MONTH) + 1);
			issueDay=(cal.get(Calendar.DAY_OF_MONTH)<10)?"0"+cal.get(Calendar.DAY_OF_MONTH):""+cal.get(Calendar.DAY_OF_MONTH);
		}
		CulpritJudgment	culpritJudgment =culpritJudgmentService.findByCulpritId(securityPunishment.getCulpritId());
	
		model.addAttribute("issueYear", issueYear);
		model.addAttribute("issueMonth", issueMonth);
		model.addAttribute("issueDay", issueDay);
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("SecurityPunishment", securityPunishment);
		model.addAttribute("culprit", culpritService.findById(securityPunishment.getCulpritId()));
		
		model.addAttribute("culpritJudgment", culpritJudgment);

		//治安管理处罚建议书
		return "modules/rewardspunishment/securityPunishment/print/zaglcfjys";
		
	}
	
	
	

	//打印《打印提请治安管理处罚审核表》
	@RequestMapping(value = "printShenHe")
	public String printShenghe(@ModelAttribute("securityPunishment") SecurityPunishment securityPunishment, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		if(!StringUtils.isBlank(securityPunishment.getProcessInstanceId())){
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(securityPunishment.getProcessInstanceId());
			model.addAttribute("processDetails",processDetails);
			for(int i=processDetails.size()-1;i>=0;i--){
				ProcessDetail processDetail=processDetails.get(i);
				String auditName=processDetail.getAuditName();
				if("司法所审核".equals(auditName)){
					model.addAttribute("sfsOption",processDetail.getOpinion());
				}
				if("县分管审批".equals(auditName)){//县级
					model.addAttribute("xfgOption",processDetail.getOpinion());
				}
				if("市分管领导".equals(auditName)){//地级
					model.addAttribute("sfgOption",processDetail.getOpinion());
				}
			}
			
		}
		model.addAttribute("securityPunishment", securityPunishment);
		CulpritJudgment	culpritJudgment =culpritJudgmentService.findByCulpritId(securityPunishment.getCulpritId());
		securityPunishment.setCulprit(culpritService.findById(securityPunishment.getCulpritId()));
		securityPunishment.setCulpritJudgment(culpritJudgment);
		return "modules/rewardspunishment/securityPunishment/print/tqzaglcfshb";
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
	public String inform(@ModelAttribute("securityPunishment")SecurityPunishment securityPunishment, Model model, HttpServletRequest request) {
		model.addAttribute("securityPunishment", securityPunishment);	
		model.addAttribute("culprit", culpritService.findById(securityPunishment.getCulpritId()));
		return "modules/rewardspunishment/securityPunishment/securityPunishmentInform";
	}
	
	/**
	 * 
	    * @Title: finishInform  
	    * @Description: 告知提交（流程结束）
	    * @param @param securityPunishment
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping("/finishInform")
	@ResponseBody
	public CommonJsonResult finishInform(SecurityPunishment securityPunishment,Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult=null;
		try {
			List<SysFile> fileList1=getSysFiles();
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			securityPunishmentService.saveSecurityPunishmentAuditStatus(sysAccount.getRoleId(), securityPunishment, processDetail,fileList1);
			commonJsonResult = CommonJsonResult.build(200, "告知成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "告知失败！", true);
		}
		return commonJsonResult;
	}
	
	
	/**
	 * 
	    * @Title: updateFinshInfo  
	    * @Description: 打印结束更新标识  
	    * @param @param securityPunishment
	    * @param @param request
	    * @param @param model
	    * @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
		@RequestMapping(value = "updateFinshInfo")
		@ResponseBody
		public CommonJsonResult updateFinshInfo(String id, String isPrintJYS,String isPrintSHB) {
			CommonJsonResult commonJsonResult = null;
			try {
				SecurityPunishment securityPunishment=new SecurityPunishment();
				if(!StringUtils.isBlank(id)){
					securityPunishment.setId(id);
				}
				if(!StringUtils.isBlank(isPrintJYS)){
					securityPunishment.setIsPrintJYS(Integer.valueOf(isPrintJYS));
				}
				if(!StringUtils.isBlank(isPrintSHB)){
					securityPunishment.setIsPrintSHB(Integer.valueOf(isPrintSHB));
				}
				
				securityPunishmentService.updateByIdSelective(securityPunishment);
				commonJsonResult = CommonJsonResult.build(200, "更新成功！");
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				return commonJsonResult = CommonJsonResult.build(505, "更新失败！");
			}
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
	public String forProcessDetail(@ModelAttribute("securityPunishment") SecurityPunishment securityPunishment, Model model){
		model.addAttribute("securityPunishment", securityPunishment);
		return "modules/rewardspunishment/securityPunishment/securityPunishmentProcessDetail";
	}
	
	
	//档案管理返回页面
	@RequestMapping(value = "securityPunishmentDoclist")
	public String securityPunishmentDoclist(SecurityPunishment securityPunishment, Model model, HttpServletRequest request) {
		model.addAttribute("securityPunishment", securityPunishment);	
		model.addAttribute("culprit", culpritService.findById(securityPunishment.getCulpritId()));
		return "modules/dailymgr/documentManage/rewardspunishment/securityPunishmentDoc";
	}
	
}
