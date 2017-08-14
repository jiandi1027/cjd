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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
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
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.CommendService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: CommendController  
    * @Description: 表扬 
    * @author yxb  
    * @date 2017年3月23日  
    *
 */
@Controller
@RequestMapping(value="/jiangcheng/commend")
public class CommendController extends BaseController{
	@Autowired
	private CommendService commendService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private ProcessDetailService processDetailService;
	
	@ModelAttribute("commend")
	public Commend get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return commendService.findById(id);
		}else{
			return new Commend();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Commend commend, Model model, HttpServletRequest request) {
		return "modules/assess/commend/commendList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(Commend commend,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(commend.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(commend.getOrderStr());
		}
		List<Commend> list = commendService.findAll(commend);
		for(Commend commen:list){
			
			if(!StringUtils.isBlank(commen.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(commen);
			}
		}
		PageInfo<Commend> pageInfo = new PageInfo<Commend>(list);
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
		return "modules/assess/commend/commendForm";
	}
	//保存表扬信息
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Commend commend, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes,@RequestParam("file") CommonsMultipartFile filePingyiPath) {
		CommonJsonResult commonJsonResult = null;

		try {
			
			commendService.insert(commend,request);
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
	@RequestMapping("/commendAudit")
	public String commendAudit(@ModelAttribute("commend")Commend commend,Model model){
		model.addAttribute("commend", commend);
		model.addAttribute("culprit", culpritService.findById(commend.getCulpritId()));
		return "modules/assess/commend/commendAudit";
	}
	//流程审批阶段
	@RequestMapping("/submitCommendAudit")
	@ResponseBody
	public CommonJsonResult submitCommendAudit(@ModelAttribute("commend")Commend commend,String decideType,
			String opinion, Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult = null;
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
			commendService.saveCommenAuditStatus(sysAccount.getRoleId(), commend, processDetail);
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
	public String detail(@ModelAttribute("commend")Commend commend, Model model) {
		model.addAttribute("commend", commend);
		if(!StringUtils.isBlank(commend.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(commend.getProcessInstanceId()));
		}
		
		model.addAttribute("culprit", culpritService.findById(commend.getCulpritId()));
		model.addAttribute("commend",commendService.findById(commend.getId()));
		ProcessInstance processInstance = runtimeService
				.createProcessInstanceQuery()
				.processInstanceId(commend.getProcessInstanceId()).singleResult();
		if(processInstance!=null){
			String processDefinitionId = processInstance.getProcessDefinitionId();

			// 将流程定义 id传到页面，用于图形显示
			model.addAttribute("processDefinitionId", processDefinitionId);
		}
		
		return "modules/assess/commend/commendDetail";
	}
}
