package com.rowell.sifa.web.investigate;

import java.util.Calendar;
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
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.investigate.Investigate;
import com.rowell.sifa.pojo.investigate.InvestigateFamily;
import com.rowell.sifa.pojo.sys.MxCheck;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.investigate.InvestigateFamilyService;
import com.rowell.sifa.service.investigate.InvestigateService;
import com.rowell.sifa.service.sys.MxCheckService;
import com.rowell.sifa.service.sys.SysAccountService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.service.sys.SysGroupService;
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
	private InvestigateFamilyService investigateFamilyService;
	@Autowired
	private SysAccountService sysAccountService;
	@Autowired
	private SysGroupService sysGroupService;
	@Autowired
	private MxCheckService mxCheckService;
	@Autowired
	private SysFileService sysFileService;

	
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
		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);
		model.addAttribute("investigate", investigate);
		
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
		SysGroup sysGroup = sysGroupService.findById(SysAccountUtils.getSysAccount().getGroupId());
		if (sysGroup.getLevelNo() != 2) {
			investigate.setGroupId(sysGroup.getId());
		}
		else if (StringUtils.isBlank(investigate.getSfsGroupId())) {
			investigate.setSfsGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		
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
				commonJsonResult = CommonJsonResult.build(505, "保存失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			
			if (StringUtils.isBlank(investigate.getId())) {
				investigate.init();//初始化部分信息
				investigate.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
				investigateService.insert(investigate);
				ProcessUtils.fillProcessInfo(investigate);
				
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
				commonJsonResult.setData(investigate);
			} else {
				investigateService.updateByIdSelective(investigate);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			}

			List<SysFile> fileList=getSysFiles();
			sysFileService.saveFiles(fileList, Constants.FILE_TABLE_INVESTIGATE, investigate.getId(), Constants.FILE_INVESTIGATE_WTDCH_PATH);

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(investigate.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("investigate") Investigate investigate, Model model) {

		return "modules/investigate/investigateForm";
	}

	@RequestMapping(value = "formAssign")
	public String formAssign(@ModelAttribute("investigate") Investigate investigate, Model model) {
		
		return "modules/investigate/investigateFormAssign";
	}

	@RequestMapping(value = "assign")
	public String assign(@ModelAttribute("investigate") Investigate investigate, Model model) {
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(investigate.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		return "modules/investigate/investigateAssign";
	}
	
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除调查评估  
	    * @param @param investigate
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(Investigate investigate, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			investigate.setDelFlag(1);
			investigateService.updateByIdSelective(investigate);
			//investigateService.deleteById(investigate.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除调查评估成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除调查评估失败！", true);
		}
	
		return commonJsonResult;
	}
	
	
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
//			investigateService.batchDel(investigate.getIds(), new Investigate());
			commonJsonResult = CommonJsonResult.build(200, "删除调查评估成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除调查评估失败！", true);
		}
		
		return commonJsonResult;
	}

	/***
	 * 
	    * @Title: delete  
	    * @Description: findbyid  
	    * @param @param investigate
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "findInvestigate")
	@ResponseBody
	public CommonJsonResult findInvestigate(@RequestParam(value = "id", required = false, defaultValue="") String id, HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;
		try {
			if (!StringUtils.isBlank(id)) {
				Investigate investigate = investigateService.findById(id);
				commonJsonResult = new CommonJsonResult(200, "操作成功", false, investigate);
			}
			else commonJsonResult = CommonJsonResult.build(505, "操作失败！", true);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "操作失败！", true);
		}
	
		return commonJsonResult;
	}
	
	
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("investigate") Investigate investigate, Model model) {
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(investigate.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		
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
			investigate.setFlag(1);
			investigate.setEndTime(new Date());
			investigateService.updateByIdSelective(investigate);
			
			ProcessUtils.endProcess("endevent2", investigate.getTaskId());
			
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
		
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(investigate.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		
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

		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(investigate.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		
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
		
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(investigate.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		
		if(!StringUtils.isBlank(investigate.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(investigate.getProcessInstanceId()));
		}
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("investigate", investigate);
		model.addAttribute("modifyPersonName", sysAccountService.findById(investigate.getAccountId()).getAccountname());
		
		return "modules/investigate/investigateReport";
	}
	
	
	/**
	 * 审核上报评估意见书界面
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
		
		//investigate = investigateService.findById(investigate.getId());
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("investigate", investigate);
		model.addAttribute("modifyPersonName", sysAccountService.findById(investigate.getAccountId()).getAccountname());
		
		return "modules/investigate/investigateAuditOpinion";
	}
	
	
	/**
	 * 审核上报界面
	 * @param investigate
	 * @param model
	 * @return
	 */
	@RequestMapping("/investigateAuditCheck")
	public String investigateAuditCheck(@ModelAttribute("investigate")Investigate investigate,Model model){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		
		if(!StringUtils.isBlank(investigate.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(investigate.getProcessInstanceId()));
		}
		
		MxCheck mxCheck = new MxCheck();
		mxCheck.setProcessInstanceId(investigate.getProcessInstanceId());
		mxCheck.setIsUse(0);
		mxCheck.setDelFlag(0);
		mxCheckService.deleteMore(mxCheck);
		
		//investigate = investigateService.findById(investigate.getId());
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("investigate", investigate);
		model.addAttribute("modifyPersonName", sysAccountService.findById(investigate.getAccountId()).getAccountname());
		
		return "modules/investigate/investigateAuditCheck";
	}
	
	
	/**
	 * 审核上报界面
	 * @param investigate
	 * @param model
	 * @return
	 */
	@RequestMapping("/investigateStopProcess")
	public String investigateStopProcess(@ModelAttribute("investigate")Investigate investigate,Model model){
		
		return "modules/investigate/investigateStopProcess";
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
	public CommonJsonResult investigateAudit(Investigate investigate, String type, String update, String optScore, String zfScore, HttpServletRequest request){
		CommonJsonResult commonJsonResult = null; 
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			
			if (update !="" && update !=null) {
				investigate.setAccountId(sysAccount.getId());	//测试用
				investigateService.updateByIdSelective(investigate);
			}
			
			if (type !="" && type !=null) {
				ProcessDetail processDetail = new ProcessDetail();
				if (investigate != null) {
					if (investigate.getAuditType() != null) {
						if (investigate.getAuditType().equals("sfsCheck") || 
								investigate.getAuditType().equals("xfgCheck") ||
								investigate.getAuditType().equals("fzkCheck") ||
								investigate.getAuditType().equals("jzkCheck") ||
								investigate.getAuditType().equals("szCheck")) {
							processDetail.setOpinion(investigate.getEvalueViews());
							processDetail.setOptScore(optScore);
							processDetail.setZfScore(zfScore);
						}
					}
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


	/**
	 * 打印界面
	 * @param investigate
	 * @param model
	 * @return
	 */
	@RequestMapping("/print")
	public String print(@ModelAttribute("investigate")Investigate investigate, String type, Model model){
		if (type.equals("1")) {								//调查评估意见书
			if(!StringUtils.isBlank(investigate.getProcessInstanceId())){
				List<ProcessDetail> recordList = processDetailService.findByProcessInsId(investigate.getProcessInstanceId());
				if (recordList.size() > 0) {
					ProcessDetail record = recordList.get(0);
					model.addAttribute("record", record);
				}
			}
			Calendar c = Calendar.getInstance();
			model.addAttribute("isYear", c.get(Calendar.YEAR));
			model.addAttribute("isMonth", c.get(Calendar.MONTH) + 1);
			model.addAttribute("isDay", c.get(Calendar.DAY_OF_MONTH));
			
			return "modules/investigate/print/dcpgyjs";
		}
		else if (type.equals("2")) {						//审前社会调查表
			InvestigateFamily investigateFamily = new InvestigateFamily();
			investigateFamily.setPreInvestId(investigate.getId());
			List<InvestigateFamily> list = investigateFamilyService.findAll(investigateFamily);

			model.addAttribute("listSize", list.size());
			model.addAttribute("list", list);
			return "modules/investigate/print/sqshdcb";
		}
		else if (type.equals("3")) {						//审前社会调查审批表
			return "modules/investigate/print/sqshdcspb";
		}
		
		return "";
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
	public String forProcessDetail(@ModelAttribute("investigate") Investigate investigate, Model model){
		model.addAttribute("investigate", investigate);
		return "modules/investigate/investigateProcessDetail";
	}
	
	/**
	 * 打印界面
	 * @param askLeave
	 * @param model
	 * @return
	 */
	@RequestMapping("/workerPrint")
	public String investigateWorkerPrint(@ModelAttribute("investigate")Investigate investigate, Model model){
		model.addAttribute("investigate", investigate);	

		return "modules/investigate/investigateWorkerPrint";
	}
	
	
	

	
	/**
	 * 
	    * @Title: updateFinshInfo  
	    * @Description: 打印结束更新标识  
	    * @param @param investigate
	    * @param @param request
	    * @param @param model
	    * @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
		@RequestMapping(value = "updateFinshInfo")
		@ResponseBody
		public CommonJsonResult updateFinshInfo(String id, String isPrintYJS,String isPrintDCB,String isPrintSPB) {
			CommonJsonResult commonJsonResult = null;
			try {
				
				Investigate investigate=new Investigate();
				if(!StringUtils.isBlank(id)){
					investigate.setId(id);
				}
				if(!StringUtils.isBlank(isPrintYJS)){
					investigate.setIsPrintYJS(Integer.valueOf(isPrintYJS));
				}
				if(!StringUtils.isBlank(isPrintDCB)){
					investigate.setIsPrintDCB(Integer.valueOf(isPrintDCB));
				}
				if(!StringUtils.isBlank(isPrintSPB)){
					investigate.setIsPrintSPB(Integer.valueOf(isPrintSPB));
				}
				
				investigateService.updateByIdSelective(investigate);
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
		    * @param @param investigate
		    * @param @param model
		    * @param @param request
		    * @param @return    参数  
		    * @return String    返回类型  
		    * @throws
		 */
		@RequestMapping("/finish")
		@ResponseBody
		public CommonJsonResult finishInform(Investigate investigate,Model model,HttpServletRequest request){
			CommonJsonResult commonJsonResult=null;
			try {
			
				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				ProcessDetail processDetail = new ProcessDetail();
				investigateService.saveInvestigateAuditStatus(sysAccount.getRoleId(), investigate, processDetail);
				commonJsonResult = CommonJsonResult.build(200, "提交成功！", false);
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "提交失败！", true);
			}
			return commonJsonResult;
		}
}
