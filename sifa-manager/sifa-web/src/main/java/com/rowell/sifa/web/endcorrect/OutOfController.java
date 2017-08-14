package com.rowell.sifa.web.endcorrect;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.flowable.engine.RuntimeService;
import org.flowable.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
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
import com.rowell.sifa.pojo.endcorrect.OutOf;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.OutOfService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: verbalWarningController  
    * @Description: 迁出管理Controller
    * @author ybx 
    * @date 2017年3月6日  
    *
 */
@Controller
@RequestMapping(value="/endcorrect/outof")
public class OutOfController extends BaseController{
	@Autowired
	private OutOfService outOfService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private ProcessDetailService processDetailService;
	
	@ModelAttribute("outof")
	public OutOf get(@RequestParam(required = false) String id){
		if (StringUtils.isNotBlank(id)) {
			return 	outOfService.findById(id);
		}else{		
			return new OutOf();
		}	
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(OutOf outof, Model model, HttpServletRequest request) {
		return "/modules/endcorrect/outof/outofList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(OutOf outof,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(outof.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(outof.getOrderStr());
		}
		List<OutOf> list = outOfService.findAll(outof);
		for(OutOf ot:list){
			if(!StringUtils.isBlank(ot.getProcessInstanceId())){
			ProcessUtils.fillProcessInfo(ot);
			}
		}
		PageInfo<OutOf> pageInfo = new PageInfo<OutOf>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(OutOf outof, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			outOfService.insert(outof);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("保存数据成功");
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "保存数据失败！");
				commonJsonResult.setIsError(true);
			return commonJsonResult;
		}
	}

	/**
	 * 审批跳转页面
	 * **/
	@RequestMapping("/askLeaveAudit")
	public String askLeaveAudit(@ModelAttribute("outof")OutOf outof,Model model){
		model.addAttribute("outof", outof);
		return "/modules/endcorrect/outof/outofAudit";
	}
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(OutOf outof,Model model){
		try {
			ProcessUtils.endProcess("endevent1", outof.getTaskId());			
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}
	//跳转审批页面
	@RequestMapping("/submitAskLeaveAudit")
	public String warningAudit(@ModelAttribute("outof")OutOf outof,Model model){
		model.addAttribute("outof", outof);
		model.addAttribute("culprit", culpritService.findById(outof.getCulpritId()));
		return "modules/endcorrect/outof/outofAudit";
	}
	
	/**
	 * 流程开始走
	 * **/
	@RequestMapping("/warningAudit")
	@ResponseBody
	public CommonJsonResult askLeaveAudit(@ModelAttribute("outof")OutOf outof,String decideType,String opinion, Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult = null;
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
			outOfService.saveAskLeaveAuditStatus(sysAccount.getRoleId(), outof, processDetail);
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
	public String detail(@ModelAttribute("outof")OutOf outof, Model model) {
		model.addAttribute("warning", outof);
		if(!StringUtils.isBlank(outof.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(outof.getProcessInstanceId()));
		}
		model.addAttribute("outof",outOfService.findById(outof.getId()) );
		model.addAttribute("culprit", culpritService.findById(outof.getCulpritId()));
		
		ProcessInstance processInstance = runtimeService
				.createProcessInstanceQuery()
				.processInstanceId(outof.getProcessInstanceId()).singleResult();
		if(processInstance!=null){
			String processDefinitionId = processInstance.getProcessDefinitionId();

			// 将流程定义 id传到页面，用于图形显示
			model.addAttribute("processDefinitionId", processDefinitionId);
		}
		
		return "modules/endcorrect/outof/outofDetail";
	}
	//跳转到增加页面
	@RequestMapping(value = "add")
	public String forAdd(@ModelAttribute("outof")OutOf outof, Model model, HttpServletRequest request) {
		model.addAttribute("outof", outof);
		model.addAttribute("culprit", culpritService.findById(outof.getCulpritId()));
		return "modules/endcorrect/outof/outofForm";
	}
}
