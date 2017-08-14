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
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.SecurityPunishment;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.SecurityPunishmentService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  提请治安管理处罚Controller
 * 
 * @author pkx
 * @version 2017-4-1
 */
@Controller
@RequestMapping(value = "/jiangcheng/securityPunishment")
public class SecurityPunishmentController extends BaseController {
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private ProcessDetailService processDetailService;
	@Autowired
	private SecurityPunishmentService securityPunishmentService;
	@Autowired
	private CulpritService culpritService;

	@ModelAttribute("securityPunishment")
	public SecurityPunishment get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return securityPunishmentService.findById(id);
		} else {
			return new SecurityPunishment();
		}
	}
	
	
	/***
	 * 
	    * @Title: forList  
	    * @Description: 提请治安管理处罚跳转页 
	    * @param @param securityPunishment
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(SecurityPunishment securityPunishment, Model model, HttpServletRequest request) {
		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);
		
		return "modules/assess/securityPunishment/securityPunishmentList";
	}
	
	
	/***
	    * @Title: list  
	    * @Description: 查找提请治安管理处罚
	    * @param @param securityPunishment
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
	public EUDataGridResult list(SecurityPunishment securityPunishment,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(securityPunishment.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(securityPunishment.getOrderStr());
		}

		List<SecurityPunishment> list = securityPunishmentService.findAll(securityPunishment);

		for(SecurityPunishment investigateEntity:list){		//填充流程实例
			if(!StringUtils.isBlank(investigateEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(investigateEntity);
			}
		}
		
		PageInfo<SecurityPunishment> pageInfo = new PageInfo<SecurityPunishment>(list);

		model.addAttribute("pager", pageInfo);
		
		SysAccount account = SysAccountUtils.getSysAccount();
		model.addAttribute("account", account);
		
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑提请治安管理处罚  
	    * @param @param securityPunishment
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(SecurityPunishment securityPunishment, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, securityPunishment)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(securityPunishment.getId())) {
//				securityPunishment.init();//初始化部分信息
				securityPunishmentService.insert(securityPunishment);
				
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("新增成功");
			} else {
				securityPunishmentService.updateByIdSelective(securityPunishment);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(securityPunishment.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "新增失败！");
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
	    * @Description: 批量删除提请治安管理处罚  
	    * @param @param securityPunishment
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(SecurityPunishment securityPunishment, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			securityPunishmentService.batchDelete(securityPunishment.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		
		return commonJsonResult;
	}

	
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("securityPunishment") SecurityPunishment securityPunishment, Model model) {
		
		if(!StringUtils.isBlank(securityPunishment.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(securityPunishment.getProcessInstanceId()));
			ProcessUtils.fillProcessInfo(securityPunishment);
		}
		model.addAttribute("securityPunishment", securityPunishment);
		model.addAttribute("sysAccount", SysAccountUtils.getSysAccount());
		
		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(securityPunishment.getProcessInstanceId()).singleResult();
		if(processInstance!=null){
			String processDefinitionId = processInstance.getProcessDefinitionId();

			// 将流程定义 id传到页面，用于图形显示
			model.addAttribute("processDefinitionId", processDefinitionId);
		}
		
		return "modules/assess/securityPunishment/securityPunishmentDetail";
	}
	
	/**
	 * 终止流程
	 * @param securityPunishment
	 * @param model
	 * @return
	 */
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(@ModelAttribute("securityPunishment")SecurityPunishment securityPunishment,Model model){
		try {
			ProcessUtils.endProcess("endevent1", securityPunishment.getTaskId());
			
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}
	
	
	/**
	 * 提请治安管理处罚界面
	 * @param securityPunishment
	 * @param model
	 * @return
	 */
	@RequestMapping("/form")
	public String investigateWorkerReport(@ModelAttribute("securityPunishment")SecurityPunishment securityPunishment,Model model){
		
		return "modules/assess/securityPunishment/securityPunishmentForm";
	}
	
	
	/**
	 * 司法所开始调查推送界面
	 * @param securityPunishment
	 * @param model
	 * @return
	 */
	@RequestMapping("/securityPunishmentPush")
	public String securityPunishmentPush(@ModelAttribute("securityPunishment")SecurityPunishment securityPunishment,Model model){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		Culprit culprit = culpritService.findById(securityPunishment.getCulpritId());
		securityPunishment.setCulprit(culprit);
		
		if (!StringUtils.isBlank(securityPunishment.getIssueTime())) {
			String []issueTimeStr = securityPunishment.getIssueTime().split(",");
			if (issueTimeStr.length >=2) {
				model.addAttribute("issueYear", issueTimeStr[0]);
				model.addAttribute("issueMonth", issueTimeStr[1]);
				model.addAttribute("issueDay", issueTimeStr[2]);
			}
		}
		model.addAttribute("sysAccount", sysAccount);
		
		return "modules/assess/securityPunishment/securityPunishmentPush";
	}
	
	
	/**
	 * 提请治安上报评定界面
	 * @param securityPunishment
	 * @param model
	 * @return
	 */
	@RequestMapping("/securityPunishmentReport")
	public String securityPunishmentReport(@ModelAttribute("securityPunishment")SecurityPunishment securityPunishment,Model model){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		Culprit culprit = culpritService.findById(securityPunishment.getCulpritId());
		securityPunishment.setCulprit(culprit);
		
		if(!StringUtils.isBlank(securityPunishment.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(securityPunishment.getProcessInstanceId()));
		}
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("securityPunishment", securityPunishment);
		
		return "modules/assess/securityPunishment/securityPunishmentReport";
	}
	
	
	/**
	 * 审前调查流程
	 * 
	 * @param securityPunishment
	 * @param type
	 * @param update
	 * @param request
	 * @return
	 */
	@RequestMapping("/securityPunishmentAudit")
	@ResponseBody
	public CommonJsonResult investigateAudit(@ModelAttribute("securityPunishment")SecurityPunishment securityPunishment,String decideType,String opinion, HttpServletRequest request){
		CommonJsonResult commonJsonResult = null;
		try {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();

			securityPunishment.setAccountId(sysAccount.getId());
			securityPunishmentService.updateByIdSelective(securityPunishment);
			
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setOpinion(opinion);
			processDetail.setDicDecideType(decideType);
			
			securityPunishmentService.saveSecurityPunishmentAuditStatus(sysAccount.getRoleId(), securityPunishment, processDetail);
			
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("操作成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			commonJsonResult = CommonJsonResult.build(500, "操作失败！");
		}
		
		return commonJsonResult;
	}

}
