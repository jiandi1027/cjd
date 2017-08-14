package com.rowell.sifa.web.endcorrect;

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
import com.rowell.sifa.pojo.endcorrect.Detached;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.DetachedService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName:DetachedController
    * @Description: 脱管管理
    * @author zhl  
    * @date 2017年3月14日  
    *
 */
@Controller
@RequestMapping(value="/endcorrect/detached")
public class DetachedController extends BaseController{
	@Autowired
	private DetachedService detachedService;
	
	@Autowired
	private CulpritService culpritService;
	
	@Autowired
	private RuntimeService runtimeService;
	

	
	@Autowired
	private ProcessDetailService processDetailService;
	/*@Autowired
	private CulpritJudgmentService culpritJudgmentService;*/
	
	@ModelAttribute("detached")
	public Detached get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return detachedService.findById(id);
		}else{
			return new Detached();
		}
	}
	/**
	 * get请求跳转页
	 * @param detached
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Detached detached, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/endcorrect/detached/detachedList";
	}
	/**
	 * post请求获取数据
	 * @param detached
	 * @param page
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(Detached detached,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(detached.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(detached.getOrderStr());
		}
		List<Detached> list = detachedService.findAll(detached);
		for(Detached detachedEntity:list){
			if(!StringUtils.isBlank(detachedEntity.getProcessInstanceId())){
			ProcessUtils.fillProcessInfo(detachedEntity);
			}
		}
		PageInfo<Detached> pageInfo = new PageInfo<Detached>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
		}
	
	/**
	 * 跳转到增加页面
	 * @param detached
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "add")
	public String forAdd(@ModelAttribute("detached") Detached detached, Model model, HttpServletRequest request) {
		if(detached.getDetachedTime()==null){
			detached.setDetachedTime(new Date());
		}
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		if(detached.getReportPerson()==null){
			detached.setReportPerson(sysAccount.getAccountname());
		}
		model.addAttribute("detached", detached);
		return "modules/endcorrect/detached/detachedAdd";
	}
	
	
	@RequestMapping(value =  "save")
	@ResponseBody
	public CommonJsonResult save(Detached detached, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			if (!beanValidator(model, detached)){
				commonJsonResult = CommonJsonResult.build(505, "编辑失败！");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			//若id为空，则为新增脱管
			if(StringUtils.isBlank(detached.getId())){
				if(detached.getCreated()==null ){
					detached.setCreated(new Date());
				}
				detached.setUpdated(new Date());
				//detachedService.saveOrUpdate(detached);
				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				detachedService.submitDetached(sysAccount.getId(), detached);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功！");
			}else{
				detached.setUpdated(new Date());
				detachedService.updateByIdSelective(detached);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改成功！");
			}
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(detached.getId())) {
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
	    * @Description:删除脱管
	    * @param @param askLeave
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(Detached detached, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			detachedService.deleteById(detached.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
	
	
	/**
	 * 
	    * @Title: submitDetached  
	    * @Description: 流程上报 
	    * @param @param detached
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	/*@RequestMapping(value = "submitDetached", method = RequestMethod.GET)
	@ResponseBody
	public CommonJsonResult submitDetached(Detached detached, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		try {
			detachedService.submitDetached(sysAccount.getId(), detached);
			return CommonJsonResult.build(200, "上报成功！");
		} catch (Exception e) {
			e.printStackTrace();
			return CommonJsonResult.build(505, "上报失败！");
		}
	}*/
	
	/**
	 * 
	    * @Title:跳转至流程审批页面
	    * @Description: TODO(这里用一句话描述这个方法的作用)  
	    * @param @param detached
	    * @param @param model
	    * @param @param taskId
	    * @param @param orderId
	    * @param @param auditType
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping("/detachedAudit")
	public String detachedAudit(@ModelAttribute("detached")Detached detached,Model model,String taskId,String orderId,String auditType){
		model.addAttribute("detached", detached);
		return "modules/endcorrect/detached/detachedAudit";
	}
	/**
	 * 	
	    * @Title: 处理审批结果并保存
	    * @Description: TODO(这里用一句话描述这个方法的作用)  
	    * @param @param askLeave
	    * @param @param decideType
	    * @param @param opinion
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping("/submitDetachedAudit")
	@ResponseBody
	public CommonJsonResult submitDetachedAudit(@ModelAttribute("detached")Detached detached,String decideType,String opinion, Model model,HttpServletRequest request){
		detached.setUpdated(new Date());
		detachedService.updateById(detached);
		CommonJsonResult commonJsonResult=null;
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
			detachedService.saveDetachedAuditStatus(sysAccount.getRoleId(), detached, processDetail);
			if(Constants.ROLE_SFSGZRY.equals(sysAccount.getRoleId())){//司法所工作人员处理
				commonJsonResult = CommonJsonResult.build(200, "处理成功！", false);
			}else{
				commonJsonResult = CommonJsonResult.build(200, "审批成功！", false);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "审批失败！", true);
		}
		//System.out.println("流程处理完毕");
		return commonJsonResult;
	}
	

	/**
	 * 
	    * @Title: 流程终止
	    * @Description: TODO(这里用一句话描述这个方法的作用)  
	    * @param @param askLeave
	    * @param @param model
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(Detached detached,Model model){
		try {
			ProcessUtils.endProcess("endevent1", detached.getTaskId());
			return CommonJsonResult.build(200, "终止成功！");
		} catch (Exception e) {
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败！");
		}
	}
	
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("detached") Detached detached, Model model) {
		model.addAttribute("detached", detached);

		if(!StringUtils.isBlank(detached.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(detached.getProcessInstanceId()));
			ProcessInstance processInstance = runtimeService
					.createProcessInstanceQuery()
					.processInstanceId(detached.getProcessInstanceId()).singleResult();
			if(processInstance!=null){
				String processDefinitionId = processInstance.getProcessDefinitionId();
				// 将流程定义 id传到页面，用于图形显示
				model.addAttribute("processDefinitionId", processDefinitionId);
			}
		}
		model.addAttribute("culprit", culpritService.findById(detached.getCulpritId()));
		return "modules/endcorrect/detached/detachedDetail";
	}
	
	/**
	 * 
	    * @Title: form  
	    * @Description: 跳转至增加页面  
	    * @param @param Detached
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("revokeParole") Detached detached, Model model) {
		return "modules/endcorrect/detached/detachedAdd";
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
	public String forProcessDetail(@ModelAttribute("detached") Detached detached, Model model){
		model.addAttribute("detached", detached);
		return "modules/endcorrect/detached/detachedProcessDetail";
	}
	
	
}
