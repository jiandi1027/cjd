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
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.CulpritDoc;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.GradeChange;
import com.rowell.sifa.pojo.rewardspunishment.Parole;
import com.rowell.sifa.pojo.rewardspunishment.RevokeParole;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysDic;
import com.rowell.sifa.service.culpritinfo.CulpritDocService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.GradeChangeService;
import com.rowell.sifa.web.base.BaseController;
import com.rowell.sifa.web.sys.SysDicController;

/**
 *  文档Controller
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
	public EUDataGridResult list(GradeChange gradeChange,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(gradeChange.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(gradeChange.getOrderStr());
		}

		List<GradeChange> list = gradeChangeService.findAll(gradeChange);
		//填充实体类
		for(GradeChange gradeChangeEntity:list){
			if(gradeChangeEntity.getDicOldMonitorGradeKey()!=null){
				SysDic s=sysDicController.getDicKey(gradeChangeEntity.getDicOldMonitorGradeKey());
				gradeChangeEntity.setDicOldMonitorGradeKey(s.getValue());
			}
			if(gradeChangeEntity.getDicMonitorGradeKey()!=null){
				SysDic s=sysDicController.getDicKey(gradeChangeEntity.getDicMonitorGradeKey());
				gradeChangeEntity.setDicMonitorGradeKey(s.getValue());
			}
			if(!StringUtils.isBlank(gradeChangeEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(gradeChangeEntity);
				}
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

			if (StringUtils.isBlank(gradeChange.getId())) {
				gradeChangeService.insert(gradeChange);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改保存成功");
			} else {
				gradeChangeService.updateByIdSelective(gradeChange);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改成功");
			}

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

	@RequestMapping("/gradeChangeAudit")
	public String gradeChangeAudit(@ModelAttribute("gradeChange")GradeChange gradeChange,Model model){
		//RevokeParole RevokeParole1=paroleService.forSysDic(parole);//数据字典格式转换
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
	@RequestMapping("/gradeChangeDetail")
	public String gradeChangeDetail(@ModelAttribute("gradeChange")GradeChange gradeChange,Model model){
		//RevokeParole RevokeParole1=paroleService.forSysDic(parole);//数据字典格式转换
		if(!StringUtils.isBlank(gradeChange.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(gradeChange.getProcessInstanceId()));
			ProcessUtils.fillProcessInfo(gradeChange);
		}
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("gradeChange", gradeChange);
		model.addAttribute("culprit", culpritService.findById(gradeChange.getCulpritId()));
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
//		if("0".equals(decideType)){//不同意 则结束
//			askLeaveService.jumpAuditStatus(sysAccount.getRoleId(),askLeave,processDetail,0);
//		}else if("1".equals(decideType)){//同意则进入下一步
//			askLeaveService.saveAskLeaveAuditStatus(sysAccount.getRoleId(), askLeave, processDetail);
//		}else{//退回  返回到上一步
//			askLeaveService.jumpAuditStatus(sysAccount.getRoleId(),askLeave,processDetail,1);
//		}
			gradeChangeService.saveGradeChangeAuditStatus(sysAccount.getRoleId(), gradeChange, processDetail);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("处理成功！");
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
			ProcessUtils.fillProcessInfo(gradeChange);
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
}
