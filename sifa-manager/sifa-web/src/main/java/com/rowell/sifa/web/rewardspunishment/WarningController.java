package com.rowell.sifa.web.rewardspunishment;

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
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.Commend;
import com.rowell.sifa.pojo.rewardspunishment.Warning;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.WarningService;
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
@RequestMapping(value="/jiangcheng/warning")
public class WarningController extends BaseController{
	@Autowired
	private WarningService warningService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private ProcessDetailService processDetailService;
	
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
		return "modules/assess/warning/warningList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(Warning warning,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(warning.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(warning.getOrderStr());
		}
		List<Warning> list = warningService.findAll(warning);
		for(Warning warnin:list){
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
	public String forAdd(Warning warning, Model model, HttpServletRequest request) {
		return "modules/assess/warning/warningForm";
	}
	//保存警告信息
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Warning warning, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			warningService.insert(warning);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("保存成功");
			return commonJsonResult;
		} catch (Exception e) {
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
		model.addAttribute("warning", warning);
		model.addAttribute("culprit", culpritService.findById(warning.getCulpritId()));
		return "modules/assess/warning/warningAudit";
	}
	//流程审批阶段
	@RequestMapping("/submitCommendAudit")
	@ResponseBody
	public CommonJsonResult submitCommendAudit(@ModelAttribute("warning")Warning warning,String decideType,
			String opinion, Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult = null;
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
			warningService.saveCommenAuditStatus(sysAccount.getRoleId(), warning, processDetail);
			model.addAttribute("warning",warningService.findById(warning.getId()));
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("处理成功！");
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
		
		model.addAttribute("culprit", culpritService.findById(warning.getCulpritId()));
		
		ProcessInstance processInstance = runtimeService
				.createProcessInstanceQuery()
				.processInstanceId(warning.getProcessInstanceId()).singleResult();
		if(processInstance!=null){
			String processDefinitionId = processInstance.getProcessDefinitionId();

			// 将流程定义 id传到页面，用于图形显示
			model.addAttribute("processDefinitionId", processDefinitionId);
		}
		
		return "modules/assess/warning/warningDetail";
	}
}
