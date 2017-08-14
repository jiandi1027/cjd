package com.rowell.sifa.web.rewardspunishment;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
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
import com.rowell.common.utils.DateUtils;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.ProcessUtils;
import com.rowell.sifa.common.utils.SpringContextHolder;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.RevokeParole;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.ImprisonService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.RevokeParoleService;
import com.rowell.sifa.service.sys.SysDicService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName:提请撤销假释
    * @Description: TODO(这里用一句话描述这个类的作用)  
    * @author DELL  
    * @date 2017年3月30日  
    *
 */
@Controller
@RequestMapping(value = "/jiangcheng/revokeParole")
public class RevokeParoleController extends BaseController {
	@Autowired
	private RevokeParoleService revokeParoleService;
	@Autowired
	private CulpritService culpritService;
	
	@Autowired
	private ProcessDetailService processDetailService;
	
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private SysDicService sysDicService;
	
	@Autowired
	private ImprisonService imprisonService;
	
	@ModelAttribute("revokeParole")
	public RevokeParole get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return revokeParoleService.findById(id);
		} else {
			return new RevokeParole();
		}
	}
	
	/**
	 * 
	    * @Title: forList  
	    * @Description: get请求跳转页面
	    * @param @param RevokeParole
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(RevokeParole revokeParole, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/assess/revokeParole/revokeParoleList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(RevokeParole revokeParole,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(revokeParole.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(revokeParole.getOrderStr());
		}

		List<RevokeParole> list = revokeParoleService.findAll(revokeParole);
		for(RevokeParole RevokeParoleEntity:list){
			if(!StringUtils.isBlank(RevokeParoleEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(RevokeParoleEntity);
			} 
		}
		PageInfo<RevokeParole> pageInfo = new PageInfo<RevokeParole>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	/**
	 * 
	    * @Title: form  
	    * @Description: 跳转至增加页面  
	    * @param @param RevokeParole
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("revokeParole") RevokeParole revokeParole, Model model) {
		return "modules/assess/revokeParole/revokeParoleForm";
	}
	
	//保存草稿
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(RevokeParole revokeParole, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			if (!beanValidator(model, revokeParole)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			if (StringUtils.isBlank(revokeParole.getId())) {
				revokeParoleService.insert(revokeParole);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setData(revokeParole.getId());
				commonJsonResult.setMsg("保存撤销缓刑成功");
			} else {
				revokeParoleService.updateByIdSelective(revokeParole);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setData(revokeParole.getId());
				commonJsonResult.setMsg("修改撤销缓刑成功");
			}
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(revokeParole.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存撤销缓刑失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改撤销缓刑失败！");
				commonJsonResult.setIsError(true);
			}
			return commonJsonResult;
		}
	}
	//删除
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult batchDelete(RevokeParole RevokeParole, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			revokeParoleService.deleteById(RevokeParole.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除撤销假释成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除撤销假释失败！", true);
		}
		return commonJsonResult;
	}
	
	//详细
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("revokeParole") RevokeParole revokeParole, Model model) {
		model.addAttribute("revokeParole", revokeParole);
		if(!StringUtils.isBlank(revokeParole.getProcessInstanceId())){
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(revokeParole.getProcessInstanceId());
			for(ProcessDetail processDetail:processDetails){
				if("1".equals(processDetail.getDicDecideType())||"6".equals(processDetail.getDicDecideType())){
					processDetail.setDicDecideType("同意");
				}else if("2".equals(processDetail.getDicDecideType())){
					processDetail.setDicDecideType("退回");
				}else{
					processDetail.setDicDecideType("不同意");
				}
			}
			model.addAttribute("processDetails",processDetails);
			ProcessInstance processInstance = runtimeService
					.createProcessInstanceQuery()
					.processInstanceId(revokeParole.getProcessInstanceId()).singleResult();
			if(processInstance!=null){
				String processDefinitionId = processInstance.getProcessDefinitionId();
				// 将流程定义 id传到页面，用于图形显示
				model.addAttribute("processDefinitionId", processDefinitionId);
			}
		}
		model.addAttribute("culprit", culpritService.findById(revokeParole.getCulpritId()));
		return "modules/assess/revokeParole/revokeParoleDetail";
	}
	
	
	//保存草稿并上报
	@RequestMapping(value = "preSubmit")
	public String preSubmit(@ModelAttribute("revokeParole") RevokeParole revokeParole, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		String issueTime=revokeParole.getIssueTime();
		if(issueTime!=null){
			String issueYear=issueTime.substring(0, 4);
			String issueMonth=issueTime.substring(5, 7);
			String issueDay=issueTime.substring(8, 10);
			System.out.println(issueYear+","+issueMonth+","+issueDay);
			model.addAttribute("issueYear", issueYear);
			model.addAttribute("issueMonth", issueMonth);
			model.addAttribute("issueDay", issueDay);
		}
		if(request.getParameter("detail")!=null){//表示该请求来自详细页面，仅用户打印，不做上报或修改操作
			model.addAttribute("detail", "1");
		}
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("revokeParole", revokeParole);
		model.addAttribute("culprit", culpritService.findById(revokeParole.getCulpritId()));
		return "modules/assess/revokeParole/print/printRevokeParoleBook";
	}
		
	/**
	 * 
	    * @Title: submitRevokeParole  
	    * @Description: 流程上报
	    * @param @param revokeParole
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "submitRevokeParole", method = RequestMethod.GET)
	@ResponseBody
	public CommonJsonResult submitRevokeParole(RevokeParole revokeParole, Model model, HttpServletRequest request) {
		//设置签发时间
		String issueYear = request.getParameter("issueYear");
		String issueMonth =request.getParameter("issueMonth");
		String issueDay =  request.getParameter("issueDay");
		Calendar cal = Calendar.getInstance();
		if (issueYear == null || issueYear.length() <= 0) {
			issueYear = "" + cal.get(Calendar.YEAR);
		}
		if (issueMonth == null || issueMonth.length() <= 0) {
			issueMonth = "" + (cal.get(Calendar.MONTH) + 1);
		}
		if (issueDay == null || issueDay.length() <= 0) {
			issueDay = "" + cal.get(Calendar.DAY_OF_MONTH);
		}
		String issueTime = issueYear + "," + issueMonth + "," + issueDay;
		revokeParole.setIssueTime(issueTime);
		revokeParoleService.updateById(revokeParole);
		SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);//获取当前用户
		String decideType=request.getParameter("decideType");
		ProcessDetail processDetail = new ProcessDetail();
		processDetail.setDicDecideType(decideType);//用户判断上传是谁发起的
		try {
			revokeParoleService.submitRevokeParole(sysAccount.getId(), revokeParole,processDetail);
			return CommonJsonResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return CommonJsonResult.build(505, "上报失败");
		}
	}
	
	/**
	 * 
	    * @Title: revokeParoleAudit  
	    * @Description: 跳转至流程审批页面
	    * @param @param revokeParole
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping("/revokeParoleAudit")
	public String revokeParoleAudit(@ModelAttribute("revokeParole")RevokeParole revokeParole,Model model){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		if(!StringUtils.isBlank(revokeParole.getProcessInstanceId())){//各部门打分查询
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(revokeParole.getProcessInstanceId());
			model.addAttribute("processDetails",processDetails);
			for(ProcessDetail processDetail :processDetails){
				String dicSorceType=processDetail.getDicSorceType();
				if("91201".equals(dicSorceType)){//县矫正科打分
					model.addAttribute("jzksr",processDetail.getOptScore());
					model.addAttribute("jzkzf",processDetail.getZfScore());
				}else if("91202".equals(dicSorceType)){//县法制科打分
					model.addAttribute("fzkzf", processDetail.getZfScore());
				}else if("91203".equals(dicSorceType)){//市矫正处打分
					model.addAttribute("jzcsr", processDetail.getOptScore());
					model.addAttribute("jzczf",processDetail.getZfScore());
				}else if("91204".equals(dicSorceType)){//市法制处打分
					model.addAttribute("fzczf",processDetail.getZfScore());
				}
			}
		}
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("revokeParole", revokeParole);
		model.addAttribute("culprit", culpritService.findById(revokeParole.getCulpritId()));
		return "modules/assess/revokeParole/revokeParoleAudit";
	}
	
	/**
	 * 
	    * @Title: submitRevokeParoleAudit  
	    * @Description:处理流程数据 
	    * @param @param revokeParole
	    * @param @param decideType
	    * @param @param opinion
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping("/submitRevokeParoleAudit")
	@ResponseBody
	public CommonJsonResult submitRevokeParoleAudit(@ModelAttribute("revokeParole")RevokeParole revokeParole,
			String decideType,String opinion,String optScore,String zfScore,Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult=null;
		try {
			revokeParoleService.updateById(revokeParole);
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			if(revokeParole.getAuditType().equals("xfgCheck") && "97003".equals(revokeParole.getSubmittionOrgTypeId())&&"1".equals(decideType)){
				decideType="6";
			}
			ProcessDetail processDetail = new ProcessDetail();
			String roleId=sysAccount.getRoleId();
			String dicSorceType=null;
			if("2006".equals(roleId)){//县矫正科评分
				dicSorceType="91201";
			}else if("2003".equals(roleId)){//县法制科评分
				dicSorceType="91202";
			}else if("1006".equals(roleId)){//市矫正处评分
				dicSorceType="91203";	
			}else if("1003".equals(roleId)){//市法制处评分
				dicSorceType="91204";
			}
			processDetail.setDicSorceType(dicSorceType);
			processDetail.setDicDecideType(decideType);
			processDetail.setOpinion(opinion);
			processDetail.setOptScore(optScore);
			processDetail.setZfScore(zfScore);
			revokeParoleService.submitRevokeParoleAuditStatus(sysAccount.getRoleId(), revokeParole, processDetail);
			commonJsonResult = CommonJsonResult.build(200, "流程处理完毕！", false);
			//流程审批结束时，在imprison插入数据
			if("1007".equals(sysAccount.getRoleId())||"2007".equals(sysAccount.getRoleId())){
				ProcessInstance rpi = SpringContextHolder.getApplicationContext().getBean(RuntimeService.class)//
						.createProcessInstanceQuery()// 创建流程实例查询对象
						.processInstanceId(revokeParole.getProcessInstanceId()).singleResult();
				if (rpi == null) {//流程结束
					imprisonService.insertRevokeParole(revokeParole);
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "流程处理失败！", true);
		}
		System.out.println("流程处理完毕！");
		return commonJsonResult;
		
	}
	

	//保存撤销缓刑建议书
	@RequestMapping(value = "saveBook")
	@ResponseBody
	public CommonJsonResult saveBook(RevokeParole revokeParole, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {	
				String issueYear=request.getParameter("issueYear");
				String issueMonth=request.getParameter("issueMonth");
				String issueDay=request.getParameter("issueDay");
				String issueTime=issueYear+","+issueMonth+","+issueDay;
				revokeParole.setIssueTime(issueTime);
				revokeParoleService.updateByIdSelective(revokeParole);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setData(revokeParole.getId());
				commonJsonResult.setMsg("保存成功");
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			return commonJsonResult;
		}
	}
	
	
	
	
	////打印《撤销缓刑审批表》
	@RequestMapping(value = "printShenhe")
	public String printShenhe(@ModelAttribute("revokeParole") RevokeParole revokeParole, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("revokeParole", revokeParole);
		model.addAttribute("culprit", culpritService.findById(revokeParole.getCulpritId()));
		return "modules/assess/revokeParole/print/printRevokeParoleTable";
	}
	
	
	
	 /**
	  * 流程终止
	  * 
	  */
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(RevokeParole revokeParole,Model model){
		try {
			ProcessUtils.endProcess("endevent1", revokeParole.getTaskId());
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}
	

	
}
