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
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.Commend;
import com.rowell.sifa.pojo.rewardspunishment.ReducePenalty;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.ReducePenaltyService;
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
@RequestMapping(value="/jiangcheng/reducePenalty")
public class ReducePenaltyController extends BaseController{
	@Autowired
	private ReducePenaltyService reducePenaltyService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private ProcessDetailService processDetailService;
	
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
		return "modules/assess/reducePenalty/reducePenaltyList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(ReducePenalty reducePenalty,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(reducePenalty.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(reducePenalty.getOrderStr());
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
	public String forAdd(Commend Commend, Model model, HttpServletRequest request) {
		return "modules/assess/reducePenalty/reducePenaltyForm";
	}
	//保存表扬信息
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(ReducePenalty reducePenalty, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			reducePenalty.setEndTime(new Date());
			reducePenaltyService.insert(reducePenalty);
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
	@RequestMapping("/commendAudit")
	public String commendAudit(@ModelAttribute("reducePenalty")ReducePenalty reducePenalty,Model model){
		model.addAttribute("reducePenalty", reducePenalty);
		model.addAttribute("culprit", culpritService.findById(reducePenalty.getCulpritId()));
		return "modules/assess/reducePenalty/reducePenaltyAudit";
	}
	//流程审批阶段
	@RequestMapping("/submitCommendAudit")
	@ResponseBody
	public CommonJsonResult submitCommendAudit(@ModelAttribute("reducePenalty")ReducePenalty reducePenalty,String decideType,
			String opinion, Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult = null;
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
			reducePenaltyService.saveCommenAuditStatus(sysAccount.getRoleId(), reducePenalty, processDetail);
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
		
		return "modules/assess/reducePenalty/reducePenaltyDetail";
	}
}
