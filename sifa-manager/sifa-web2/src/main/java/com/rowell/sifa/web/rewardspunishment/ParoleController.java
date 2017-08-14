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
import com.rowell.sifa.pojo.rewardspunishment.Parole;
import com.rowell.sifa.pojo.rewardspunishment.ReducePenalty;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritJudgmentService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.ParoleService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  假释Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/rewardspunishment/parole")
public class ParoleController extends BaseController{
	@Autowired
	private ParoleService paroleService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private ProcessDetailService processDetailService;
	@Autowired
	private CulpritJudgmentService culpritJudgmentService;
	@Autowired
	private SysFileService sysFileService;
	@Autowired
	private RuntimeService runtimeService;
	@ModelAttribute("parole")
	public Parole get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return paroleService.findById(id);
		} else {
			return new Parole();
		}
	}
	/**
	 * 
	    * @Title: forList  
	    * @Description: 假释跳转页  
	    * @param @param parole
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:exitEntryReportt:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Parole parole, Model model, HttpServletRequest request) {
		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);
		return "modules/rewardspunishment/Parole/paroleList";
	}
	/**
	 * 
	    * @Title: list  
	    * @Description: 假释列表  
	    * @param @param parole
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
	public EUDataGridResult list(Parole parole,String name,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		if (StringUtils.isBlank(parole.getSysGroupId())) {
			parole.setSysGroupId(sysAccount.getGroupId());
		}
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(parole.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(parole.getOrderStr());
		}
		if(!StringUtils.isBlank(name)){
			parole.setCulpritName(name);
		}
		List<Parole> list = paroleService.findAll(parole);
		//填充实体类
		for(Parole paroleEntity:list){
			
			if(!StringUtils.isBlank(paroleEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(paroleEntity);
				}
	        }
		PageInfo<Parole> pageInfo = new PageInfo<Parole>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:exitEntryReport:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("parole") Parole parole, Model model) {
		model.addAttribute("parole", parole);
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(parole.getId());
		record.setFileType(Constants.FILE_PAROLE);
		List<SysFile> fileList = sysFileService.findAll(record);
		//System.out.println("添加：fileList："+fileList);
		model.addAttribute("fileList", fileList);
		/*if(parole.getId()!=null){//若id不为空，则为修改
			model.addAttribute("parole", parole);
			model.addAttribute("culprit", culpritService.findById(parole.getCulpritId()));
		}*/
		return "modules/rewardspunishment/Parole/paroleForm";
	}
	/**
	 * 
	    * @Title: save  
	    * @Description: 保存假释信息 
	    * @param @param parole
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:exitEntryReport:edit")//0保存1上报保存
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Parole parole, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes,String decideType) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, parole)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);
			List<SysFile> fileList = getSysFiles();
			if (StringUtils.isBlank(parole.getId())) {
				//无记录情况下
				paroleService.insert(parole,request,processDetail);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			} else {
				paroleService.updateByIdSelective(parole);
				//修改后判断是直接上报还是先保存修改
				
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改成功");
			}
			sysFileService.saveFiles(fileList, Constants.FILE_PAROLE, parole.getId(), Constants.FILE_PAROLE);
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(parole.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/**
	 * 
	    * @Title: delete  
	    * @Description: 删除假释 
	    * @param @param parole
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:exitEntryReport:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(Parole parole, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			paroleService.deleteById(parole.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
	/**
	 * 
	    * @Title: batchDelete  
	    * @Description: 批量删除  
	    * @param @param parole
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:exitEntryReport:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(Parole parole, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			paroleService.batchDelete(parole.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
	/**
	 * 
	    * @Title: submitMoveIn  
	    * @Description: 仅仅上报  
	    * @param @param parole
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "submitParole", method = RequestMethod.GET)
	@ResponseBody
	public CommonJsonResult submitParole(Parole parole, Model model, HttpServletRequest request) {
		SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
		paroleService.submitParole(sysAccount.getId(), parole);
		return CommonJsonResult.ok();
	}
	
	//跳转审批页面
	@RequestMapping("/paroleAudit")
	public String paroleAudit(@ModelAttribute("parole")Parole parole,Model model){
		//RevokeParole RevokeParole1=paroleService.forSysDic(parole);//数据字典格式转换
		if(!StringUtils.isBlank(parole.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(parole.getProcessInstanceId()));
			ProcessUtils.fillProcessInfo(parole);
		}
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("parole", parole);
		model.addAttribute("culprit", culpritService.findById(parole.getCulpritId()));
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(parole.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		return "modules/rewardspunishment/Parole/paroleAudit";
	}
	/**
	 * 
	    * @Title: submitParoleAudit  
	    * @Description: 流程处理 
	    * @param @param parole
	    * @param @param decideType
	    * @param @param opinion
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping("/submitParoleAudit")
	@ResponseBody
	public CommonJsonResult submitParoleAudit(@ModelAttribute("parole")Parole parole,String decideType,String opinion,
			Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult = null;
		try {
			ProcessUtils.fillProcessInfo(parole);
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
		/*	if("1".equals(parole.getProcuratorate())){
				decideType="1";
			}
			if("2".equals(parole.getProcuratorate())){
				decideType="0";
			}
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
			if(optScore != null && optScore != ""){
				processDetail.setOptScore(optScore);
			}
			if(zfScore != null && zfScore != ""){
				processDetail.setZfScore(zfScore);
			}
			if(dicSorceType != null && dicSorceType != ""){
				processDetail.setDicSorceType(sysAccount.getRoleId());
			}*/
//		if("0".equals(decideType)){//不同意 则结束
//			askLeaveService.jumpAuditStatus(sysAccount.getRoleId(),askLeave,processDetail,0);
//		}else if("1".equals(decideType)){//同意则进入下一步
//			askLeaveService.saveAskLeaveAuditStatus(sysAccount.getRoleId(), askLeave, processDetail);
//		}else{//退回  返回到上一步
//			askLeaveService.jumpAuditStatus(sysAccount.getRoleId(),askLeave,processDetail,1);
//		}
			List<SysFile> fileList =null;
			System.out.println(parole);
			paroleService.saveParoleAuditStatus(sysAccount.getRoleId(), parole, processDetail,fileList);
			commonJsonResult = CommonJsonResult.ok();
			if(parole.getAuditType().equals("sfsReport")){
				commonJsonResult.setMsg("上报成功！");
			}else if(parole.getAuditType().equals("gs")){
				commonJsonResult.setMsg("提交成功！");
			}else{
				commonJsonResult.setMsg("审批成功！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			commonJsonResult = CommonJsonResult.build(500, "处理失败！");
			
		}
		return commonJsonResult;
		//return "redirect:/dailymgr/askLeave/list";
	}
	@RequestMapping("/paroleDetail")
	public String paroleDetail(@ModelAttribute("parole")Parole parole,Model model){
		//RevokeParole RevokeParole1=paroleService.forSysDic(parole);//数据字典格式转换
		
		if(!StringUtils.isBlank(parole.getProcessInstanceId())){
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(parole.getProcessInstanceId());
			ProcessUtils.fillProcessInfo(parole);
			model.addAttribute("processDetails",processDetails);
			ProcessInstance processInstance = runtimeService
					.createProcessInstanceQuery()
					.processInstanceId(parole.getProcessInstanceId()).singleResult();
			if(processInstance!=null){
				String processDefinitionId = processInstance.getProcessDefinitionId();
				// 将流程定义 id传到页面，用于图形显示
				model.addAttribute("processDefinitionId", processDefinitionId);
			}
			for(int i=processDetails.size()-1;i>=0;i--){
				ProcessDetail processDetail=processDetails.get(i);
				//System.out.println("流程：实例"+processDetail);
				String dicSorceType=processDetail.getDicSorceType();
				if(Constants.SOCRE_TYPE_XJZK.equals(dicSorceType)){//县矫正科打分
					model.addAttribute("jzksr",processDetail.getOptScore());
					model.addAttribute("jzkzf",processDetail.getZfScore());
				}else if(Constants.SOCRE_TYPE_XFZK.equals(dicSorceType)){//县法制科打分
					model.addAttribute("fzkzf", processDetail.getZfScore());
				}else if(Constants.SOCRE_TYPE_SJZC.equals(dicSorceType)){//市矫正处打分
					model.addAttribute("jzcsr", processDetail.getOptScore());
					model.addAttribute("jzczf",processDetail.getZfScore());
				}else if(Constants.SOCRE_TYPE_SFZC.equals(dicSorceType)){//市法制处打分
					model.addAttribute("fzczf",processDetail.getZfScore());
				}
			}
			
		}
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("parole",paroleService.findById(parole.getId()));
		System.out.println(paroleService.findById(parole.getId()));
		//System.out.println(parole);
		model.addAttribute("culprit", culpritService.findById(parole.getCulpritId()));
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(parole.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		return "modules/rewardspunishment/Parole/paroleDetail";
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
	public String forProcessDetail(@ModelAttribute("parole")Parole parole, Model model){
		model.addAttribute("parole", parole);
		return "modules/rewardspunishment/Parole/parolePenaltyProcessDetail";
	}
	/***
	 * 打印
	 */
	@RequestMapping(value = "print")
	public String print(@ModelAttribute("parole") Parole parole, Model model ){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		String issueTime=parole.getIssueTime();
		Calendar cal = Calendar.getInstance();
		String issueYear=null;
		String issueMonth=null;
		String issueDay=null;
		if(issueTime!=null){
			issueYear=issueTime.substring(0, 4);
			issueMonth=issueTime.substring(5, 7);
			issueDay=issueTime.substring(8, 10);
		}else{
			issueYear="" + cal.get(Calendar.YEAR);
			issueMonth=((cal.get(Calendar.MONTH) + 1)<10)?"0"+(cal.get(Calendar.MONTH) + 1):""+(cal.get(Calendar.MONTH) + 1);
			issueDay=(cal.get(Calendar.DAY_OF_MONTH)<10)?"0"+cal.get(Calendar.DAY_OF_MONTH):""+cal.get(Calendar.DAY_OF_MONTH);
		}
		model.addAttribute("issueYear", issueYear);
		model.addAttribute("issueMonth", issueMonth);
		model.addAttribute("issueDay", issueDay);
		Culprit culprit = culpritService.findById(parole.getCulpritId());
		parole.setCulprit(culprit);
		CulpritJudgment culpritJudgment = new CulpritJudgment();
		culpritJudgment.setCulpritId(parole.getCulpritId());
		List<CulpritJudgment> culpritJudgmentList = culpritJudgmentService.findAll(culpritJudgment);
		if (culpritJudgmentList.size() > 0) {
			parole.setCulpritJudgment(culpritJudgmentList.get(0));
		}
		else parole.setCulpritJudgment(new CulpritJudgment());
		model.addAttribute("parole",parole);
		model.addAttribute("securityPunishment", parole);
		//model.addAttribute("culprit", culpritService.findById(parole.getCulpritId()));
		return "modules/rewardspunishment/Parole/print/parole";

	}
	/***
	 * 工作人员打印
	 */
	@RequestMapping(value = "parolePrint")
	public String reducePenaltyPrint(@ModelAttribute("parole") Parole parole, Model model, HttpServletRequest request) {
		model.addAttribute("parole",parole);	
		model.addAttribute("culprit", culpritService.findById(parole.getCulpritId()));
		return "modules/rewardspunishment/Parole/parolePrint";
	}
	/***
	 * 打印结束更新标识
	 */
	@RequestMapping(value = "updateFinshInfo")
	@ResponseBody
	public CommonJsonResult updateFinshInfo(Parole parole,Model model) {
		CommonJsonResult commonJsonResult = null;
		try {
			paroleService.updateById(parole);
			commonJsonResult = CommonJsonResult.build(200, "更新成功！");
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return commonJsonResult = CommonJsonResult.build(505, "更新失败！");
		}
	}
	/***
	 * 告知
	 */
	@RequestMapping(value = "inform")
	public String inform(Parole parole, Model model, HttpServletRequest request) {
		model.addAttribute("parole", parole);	
		model.addAttribute("culprit", culpritService.findById(parole.getCulpritId()));
		return "modules/rewardspunishment/Parole/paroleInform";
	}
	/***
	 * 告知材料
	 */
	@RequestMapping("/finishInform")
	@ResponseBody
	public CommonJsonResult finishInform(Parole parole,Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult=null;
		//System.out.println(parole.getDicSdfsKey());
		try {
			List<SysFile> fileList=getSysFiles();
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			paroleService.saveParoleAuditStatus(sysAccount.getRoleId(), parole, processDetail,fileList);
			commonJsonResult = CommonJsonResult.build(200, "提交成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "提交失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 终止流程
	 */
	@RequestMapping("stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(@ModelAttribute("paorle")Parole parole,Model model){
		try {
			ProcessUtils.endProcess("endevent1", parole.getTaskId());
			
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}
}
