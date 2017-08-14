package com.rowell.sifa.web.rewardspunishment;

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
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.NoDeal;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.NoDealService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: NoDealController  
    * @Description: 待处理作不处理
    * @author zhl 
    * @date 2017年3月14日  
    *
 */
@Controller
@RequestMapping(value="/rewardspunishment/noDeal")
public class NoDealController extends BaseController{
	@Autowired
	private NoDealService noDealService;
	@Autowired
	private ProcessDetailService processDetailService;
	
	@ModelAttribute("NoDeal")
	public NoDeal get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return noDealService.findById(id);
		}else{
			return new NoDeal();
		}
	}

	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(NoDeal noDeal, Model model, HttpServletRequest request) {
		return "modules/rewardspunishment/noDeal/noDealList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(NoDeal noDeal,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if(StringUtils.isBlank(noDeal.getGroupId())){
			noDeal.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		if (StringUtils.isBlank(noDeal.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(noDeal.getOrderStr());
		}
		List<NoDeal> list = noDealService.findAll(noDeal);
		for(NoDeal noDealTemp:list){
			if(!StringUtils.isBlank(noDealTemp.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(noDealTemp);
			}
		}
		PageInfo<NoDeal> pageInfo = new PageInfo<NoDeal>(list);
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
		public String forAdd(NoDeal noDeal, Model model, HttpServletRequest request) {
			model.addAttribute("noDeal",noDeal);
			return "modules/rewardspunishment/noDeal/noDealAdd";
		}
		
		@RequestMapping(value = "rectification")
		public String forRectification(String id, Model model, HttpServletRequest request) {
			NoDeal noDeal=noDealService.findById(id);
			model.addAttribute("noDeal",noDeal);
			return "modules/rewardspunishment/noDeal/rectification";
		}
		
		@RequestMapping(value = "get")
		public String get(String id, Model model, HttpServletRequest request) {
			NoDeal noDeal=noDealService.findById(id);
			model.addAttribute("noDeal",noDeal);
			if(!StringUtils.isBlank(noDeal.getProcessInstanceId())){
				model.addAttribute("processDetails", processDetailService.findByProcessInsId(noDeal.getProcessInstanceId()));
			}
			return "modules/rewardspunishment/noDeal/noDealDetail";
		}
		

		
		@RequestMapping(value = "save")
		@ResponseBody
		public CommonJsonResult save(NoDeal noDeal, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;

			try {
				if (!beanValidator(model, noDeal)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}

				
				noDealService.saveOrUpdate(noDeal);
				noDealService.submitNoDeal(noDeal);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");

				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				return commonJsonResult;
			}
		}
		
		@RequestMapping(value = "saveRectification")
		@ResponseBody
		public CommonJsonResult saveRectification(NoDeal noDeal, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;

			try {
				if (!beanValidator(model, noDeal)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}

				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				noDeal.setRectificationMan(sysAccount.getId());
				noDeal.setRectificationDate(new Date());
				noDealService.updateByIdSelective(noDeal);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");

				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				return commonJsonResult;
			}
		}
		
		
		
		@RequestMapping(value = "check", method = RequestMethod.GET)
		public String forCheck(String id, Model model, HttpServletRequest request) {
			NoDeal noDeal=noDealService.findById(id);
			model.addAttribute("noDeal",noDeal);
			return "modules/rewardspunishment/noDeal/noDealCheck";
		}
		
		@RequestMapping(value = "check")
		@ResponseBody
		public CommonJsonResult check(NoDeal noDeal, String opinion,HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;

			try {
				if (!beanValidator(model, noDeal)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}

				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				if(!StringUtils.isBlank(noDeal.getProcessInstanceId())){
					ProcessUtils.fillProcessInfo(noDeal);
				}
				ProcessDetail processDetail = new ProcessDetail();
				processDetail.setOpinion(opinion);
				noDealService.updateByIdSelective(noDeal);
				noDealService.saveOrderAuditStatus(sysAccount.getRoleId(),noDeal,processDetail);
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
		public CommonJsonResult stopProcess(NoDeal noDeal,Model model){
			try {
				ProcessUtils.endProcess("endevent1", noDeal.getTaskId());
				return CommonJsonResult.build(200, "终止成功");
			} catch (Exception e) {
				e.printStackTrace();
				return CommonJsonResult.build(500, "终止失败");
			}
		}
		
		@RequestMapping(value = "forProcessDetail")
		public String forProcessDetail(@ModelAttribute("noDeal") NoDeal noDeal, Model model){
			noDeal = noDealService.findById(noDeal.getId());
			model.addAttribute("noDeal", noDeal);
			return "modules/rewardspunishment/noDeal/noDealProcessDetail";
		}
}
