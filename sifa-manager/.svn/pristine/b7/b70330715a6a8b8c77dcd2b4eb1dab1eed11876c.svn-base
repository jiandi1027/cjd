package com.rowell.sifa.web.rewardspunishment;

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
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.Commend;
import com.rowell.sifa.pojo.rewardspunishment.WarningOral;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.WarningOralService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: verbalWarningController  
    * @Description: 口头警告Controller
    * @author DELL  
    * @date 2017年3月6日  
    *
 */
@Controller
@RequestMapping(value="/rewardspunishment/verbalWarning")
public class WarningOralController extends BaseController{
	@Autowired
	private WarningOralService warningOralService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private ProcessDetailService processDetailService;
	
	@ModelAttribute("verbalWarning")
	public WarningOral get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return warningOralService.findById(id);
		}else{
			return new WarningOral();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(WarningOral verbalWarning, Model model, HttpServletRequest request) {
		return "modules/rewardspunishment/verbalWarning/verbalWarningList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(WarningOral verbalWarning,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if(StringUtils.isBlank(verbalWarning.getGroupId())){
			verbalWarning.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		if (StringUtils.isBlank(verbalWarning.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(verbalWarning.getOrderStr());
		}
		List<WarningOral> list = warningOralService.findAll(verbalWarning);
		for(WarningOral warningOral:list){
			if(!StringUtils.isBlank(warningOral.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(warningOral);
			}
		}
		PageInfo<WarningOral> pageInfo = new PageInfo<WarningOral>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
		//跳转到增加页面a
		@RequestMapping(value = "add")
		public String forAdd(@ModelAttribute("verbalWarning")WarningOral verbalWarning, 
				@RequestParam(value = "isAddFlag", required = false, defaultValue = "1") String isAddFlag, Model model, HttpServletRequest request) {
			model.addAttribute("verbalWarning",verbalWarning);
			model.addAttribute("isAddFlag", isAddFlag);
			return "modules/rewardspunishment/verbalWarning/verbalWarningAdd";
		}
		
		@RequestMapping(value = "get")
		public String get(String id, Model model, HttpServletRequest request) {
			WarningOral warningOral=warningOralService.findById(id);
			model.addAttribute("warningOral",warningOral);
			if(!StringUtils.isBlank(warningOral.getProcessInstanceId())){
				model.addAttribute("processDetails", processDetailService.findByProcessInsId(warningOral.getProcessInstanceId()));
			}
			return "modules/rewardspunishment/verbalWarning/verbalWarningDetail";
		}
		
		
		@RequestMapping(value = "save")
		@ResponseBody
		public CommonJsonResult save(WarningOral warningOral, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;

			try {
				if (!beanValidator(model, warningOral)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}

				
				warningOralService.saveOrUpdate(warningOral);
				warningOralService.submitWarningOral(warningOral);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");

				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				return commonJsonResult;
			}
		}

		
		@RequestMapping(value = "forCheck", method = RequestMethod.GET)
		public String forCheck(String id, Model model, HttpServletRequest request) {
			WarningOral warningOral=warningOralService.findById(id);
			model.addAttribute("warningOral",warningOral);
			return "modules/rewardspunishment/verbalWarning/verbalWarningCheck";
		}
		
		@RequestMapping(value = "check", method = RequestMethod.POST)
		@ResponseBody
		public CommonJsonResult check(WarningOral warningOral, String opinion,HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;

			try {
				if (!beanValidator(model, warningOral)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}

				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				if(!StringUtils.isBlank(warningOral.getProcessInstanceId())){
					ProcessUtils.fillProcessInfo(warningOral);
				}
				ProcessDetail processDetail = new ProcessDetail();
				processDetail.setOpinion(opinion);
				warningOralService.updateByIdSelective(warningOral);
				warningOralService.saveOrderAuditStatus(sysAccount.getRoleId(),warningOral,processDetail);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");

				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				return commonJsonResult;
			}
		}
		
		@RequestMapping("/stopProcess")
		@ResponseBody
		public CommonJsonResult stopProcess(WarningOral warningOral,Model model){
			try {
				ProcessUtils.endProcess("endevent1", warningOral.getTaskId());
				return CommonJsonResult.build(200, "终止成功");
			} catch (Exception e) {
				e.printStackTrace();
				return CommonJsonResult.build(500, "终止失败");
			}
		}

		@RequestMapping(value = "forProcessDetail")
		public String forProcessDetail(@ModelAttribute("warningOral") WarningOral warningOral, Model model){
			warningOral = warningOralService.findById(warningOral.getId());
			model.addAttribute("warningOral", warningOral);
			return "modules/rewardspunishment/verbalWarning/verbalWarningProcessDetail";
		}
		
		//档案返回口头警告页面
		@RequestMapping(value = "warningOralDoclist")
		public String warningOralDoclist( WarningOral warningOral, Model model, HttpServletRequest request) {
			model.addAttribute("warningOral", warningOral);	
			model.addAttribute("culprit", culpritService.findById(warningOral.getCulpritId()));
			return "modules/dailymgr/documentManage/rewardspunishment/warningOralDoc";
		}
		
		
	
}
