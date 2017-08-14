package com.rowell.sifa.web.dailymgr;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.rowell.sifa.pojo.rewardspunishment.GradeChange;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysFile;
import com.rowell.sifa.service.culpritinfo.CulpritJudgmentService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.GradeChangeService;
import com.rowell.sifa.service.sys.SysFileService;
import com.rowell.sifa.web.base.BaseController;
import com.rowell.sifa.web.sys.SysDicController;

/**
 *  修改监管等级Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/dailymgr/gradeChange")
public class GradeChangeController extends BaseController {

	@Autowired
	private GradeChangeService gradeChangeService;
	@Autowired 
	private CulpritService culpritService;
	@Autowired
	private ProcessDetailService processDetailService;
	@Autowired
	private SysDicController sysDicController;
	@Autowired
	private CulpritJudgmentService culpritJudgmentService;
	@Autowired
	private SysFileService sysFileService;
	
	@ModelAttribute("gradeChange")
	public GradeChange get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return gradeChangeService.findById(id);
		} else {
			return new GradeChange();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 文档跳转页 
	    * @param @param culpritDoc
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritDoct:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(GradeChange gradeChange, Model model, HttpServletRequest request) {
	
		return "modules/dailymgr/gradeChange/gradeChangeList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找文档
	    * @param @param culpritDoc
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
	public EUDataGridResult list(GradeChange gradeChange,String name,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(gradeChange.getOrderStr())) {
			PageHelper.orderBy("t1.updated desc");
		} else {
			PageHelper.orderBy(gradeChange.getOrderStr());
		}
		if(!"".equals(name) && name != null){
			gradeChange.setCulpritName(name);
		}
		if(StringUtils.isBlank(gradeChange.getGroupId())){
			gradeChange.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		SysAccount account = SysAccountUtils.getSysAccount();
		List<GradeChange> list = gradeChangeService.findAll(gradeChange);
		//填充实体类
		for(GradeChange gradeChangeEntity:list){
			if(!StringUtils.isBlank(gradeChangeEntity.getProcessInstanceId()) ){
				ProcessUtils.fillProcessInfo(gradeChangeEntity);
				}
			gradeChangeEntity.setRoleId(account.getRoleId());
	     }
		PageInfo<GradeChange> pageInfo = new PageInfo<GradeChange>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:culpritDoc:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("gradeChange") GradeChange gradeChange, Model model) {
		model.addAttribute("gradeChange",gradeChange);
		model.addAttribute("culprit",culpritService.findById(gradeChange.getCulpritId()));
		
		return "modules/dailymgr/gradeChange/gradeChangeForm";
	}
	//打开监管记录
	@RequestMapping(value = "changeRecord")
	public String changeRecord(@ModelAttribute("gradeChange") GradeChange gradeChange, Model model) {
		model.addAttribute("gradeChange",gradeChange);

		model.addAttribute("culprit",culpritService.findById(gradeChange.getCulpritId()));
		return "modules/dailymgr/gradeChange/changeRecordList";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑文档  
	    * @param @param culpritDoc
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritDoc:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(GradeChange gradeChange, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, gradeChange)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			if(StringUtils.isBlank(gradeChange.getId())){
				gradeChange.setUpdated(new Date());
				gradeChange.setLogo("1");
				gradeChangeService.inserts(gradeChange);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("流程启动成功");
			}else{
				gradeChangeService.updateByIdSelective(gradeChange);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改成功");
			}
			List<SysFile> fileList=getSysFiles();
			sysFileService.saveFiles(fileList, Constants.FILE_TABLE_GRADECHANGE, gradeChange.getId(), Constants.FILE_WARNING_JGDJ_PATH);
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(gradeChange.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除文档  
	    * @param @param culpritDoc
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritDoc:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(GradeChange gadeChange, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			gradeChangeService.deleteById(gadeChange.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除文档成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除文档失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除文档  
	    * @param @param culpritDoc
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritDoc:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(GradeChange gradeChange, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			gradeChangeService.batchDelete(gradeChange.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除文档成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除文档失败！", true);
		}
		return commonJsonResult;
	}
	//流程处理转发
	@RequestMapping(value ="gradeChangeAudit")
	public String gradeChangeAudit(@ModelAttribute("gradeChange")GradeChange gradeChange,Model model){
		
		if(!StringUtils.isBlank(gradeChange.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(gradeChange.getProcessInstanceId()));
			ProcessUtils.fillProcessInfo(gradeChange);
		}
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("gradeChange", gradeChange);
		model.addAttribute("culprit", culpritService.findById(gradeChange.getCulpritId()));
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(gradeChange.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		return "modules/dailymgr/gradeChange/gradeChangeCheck";
	}
	//流程上报（上报前可修改，上报后无法修改）
	@RequestMapping("gradeChangeReport")
	public String gradeChangeReport(@ModelAttribute("gradeChange")GradeChange gradeChange,Model model){
		
		if(!StringUtils.isBlank(gradeChange.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(gradeChange.getProcessInstanceId()));
			ProcessUtils.fillProcessInfo(gradeChange);
		}
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("gradeChange", gradeChange);
		model.addAttribute("culprit", culpritService.findById(gradeChange.getCulpritId()));
		return "modules/dailymgr/gradeChange/gradeChangeAudit";
	}
	@RequestMapping("gradeChangeDetail")
	public String gradeChangeDetail(@ModelAttribute("gradeChange")GradeChange gradeChange,Model model){
	
		if(!StringUtils.isBlank(gradeChange.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(gradeChange.getProcessInstanceId()));
			ProcessUtils.fillProcessInfo(gradeChange);
		}
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("gradeChange", gradeChange);
		model.addAttribute("culprit", culpritService.findById(gradeChange.getCulpritId()));
		SysFile record = new SysFile();
		record.setOrderStr("created asc");
		record.setTableId(gradeChange.getId());
		List<SysFile> fileList = sysFileService.findAll(record);
		model.addAttribute("fileList", fileList);
		return "modules/dailymgr/gradeChange/gradeChangeDetail";
	}
	
	@RequestMapping("submitGradeChangeAudit")
	@ResponseBody
	public CommonJsonResult submitGradeChangeAudit(@ModelAttribute("gradeChange")GradeChange gradeChange,String decideType,String opinion, Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult = null;
			
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			ProcessUtils.fillProcessInfo(gradeChange);
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
			gradeChangeService.saveGradeChangeAuditStatus(sysAccount.getRoleId(), gradeChange, processDetail);
			commonJsonResult = CommonJsonResult.ok();
			if("sfsCheck".equals(gradeChange.getAuditType())){
				commonJsonResult.setMsg("上报成功！");
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
	/**
	  * 流程终止
	  * 
	  */
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(@ModelAttribute("gradeChange")GradeChange gradeChange,Model model){
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			gradeChange.setFlagAccountName(sysAccount.getAccountname());
			gradeChange.setFlagAccountId(sysAccount.getId());
			gradeChange.setFlagTime(new Date());
			gradeChange.setBlankFlag("2");
			gradeChangeService.updateByIdSelective(gradeChange);
			ProcessUtils.endProcess("endevent1", gradeChange.getTaskId());
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}
	//档案管理返回矫正对象的监管等级修改路径
	@RequestMapping(value = "gradeDoclist", method = RequestMethod.GET)
	public String DocList(GradeChange gradeChange, Model model, HttpServletRequest request) {
		if(!StringUtils.isBlank(gradeChange.getProcessInstanceId())){
			ProcessUtils.fillProcessInfo(gradeChange);
		}
		model.addAttribute("gradeChange", gradeChange);	
		if(!StringUtils.isBlank(gradeChange.getCulpritId())){
			model.addAttribute("culprit", culpritService.findById(gradeChange.getCulpritId()));
		}
		return "modules/dailymgr/documentManage/gradeChangeDoc";
	}
	//首次报道监管等级确定
	@RequestMapping(value = "firstGrade")
	public String firstGrade(GradeChange gradeChange, Model model) {	
		/*List<GradeChange> list=gradeChangeService.findAll(gradeChange);
		if(!list.isEmpty()){
			for(int i=0;i<list.size();i++){
				model.addAttribute("gradeChange",list.get(list.size()-1));
			}
		}*/
		model.addAttribute("culprit",culpritService.findById(gradeChange.getCulpritId()));//罪犯信息
		return "modules/culprit/firstGrade";
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
	public String forProcessDetail(@ModelAttribute("gradeChange") GradeChange gradeChange, Model model){
		model.addAttribute("gradeChange", gradeChange);
		return "modules/dailymgr/gradeChange/gradeChangeProcessDetail";
	}
	@RequestMapping("/print")
	public String print(@ModelAttribute("gradeChange") GradeChange gradeChange, Model model){
		Culprit culprit = culpritService.findById(gradeChange.getCulpritId());
		gradeChange.setCulprit(culprit);
		CulpritJudgment culpritJudgment = new CulpritJudgment();
		culpritJudgment.setCulpritId(gradeChange.getCulpritId());
		List<CulpritJudgment> culpritJudgmentList = culpritJudgmentService.findAll(culpritJudgment);
		if (culpritJudgmentList.size() > 0) {
			gradeChange.setCulpritJudgment(culpritJudgmentList.get(0));
		}
		else gradeChange.setCulpritJudgment(new CulpritJudgment());
		
		model.addAttribute("securityPunishment", gradeChange);
		return "modules/dailymgr/gradeChange/print/changeRecordPrint";
	}
	
}
