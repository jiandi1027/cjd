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
import com.rowell.sifa.pojo.rewardspunishment.RevokeOutOfPrison;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.endcorrect.ImprisonService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.RevokeOutOfPrisonService;
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
@RequestMapping(value = "/jiangcheng/revokeOutOfPrison")
public class RevokeOutOfPrisonController extends BaseController {
	@Autowired
	private RevokeOutOfPrisonService revokeOutOfPrisonService;
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
	
	@ModelAttribute("revokeOutOfPrison")
	public RevokeOutOfPrison get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return revokeOutOfPrisonService.findById(id);
		} else {
			return new RevokeOutOfPrison();
		}
	}
	
	/**
	 * 
	    * @Title: forList  
	    * @Description: get请求跳转页面
	    * @param @param revokeOutPrison
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(RevokeOutOfPrison revokeOutPrison, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/assess/revokeOutOfPrison/revokeOutOfPrisonList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(RevokeOutOfPrison revokeOutOfPrison,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(revokeOutOfPrison.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(revokeOutOfPrison.getOrderStr());
		}

		List<RevokeOutOfPrison> list = revokeOutOfPrisonService.findAll(revokeOutOfPrison);
		for(RevokeOutOfPrison RevokeOutOfPrisonEntity:list){
			if(!StringUtils.isBlank(RevokeOutOfPrisonEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(RevokeOutOfPrisonEntity);
			} 
		}
		PageInfo<RevokeOutOfPrison> pageInfo = new PageInfo<RevokeOutOfPrison>(list);
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
	    * @param @param RevokeOutOfPrison
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("revokeOutOfPrison") RevokeOutOfPrison revokeOutOfPrison, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("revokeOutOfPrison", revokeOutOfPrison);
		model.addAttribute("culprit", culpritService.findById(revokeOutOfPrison.getCulpritId()));
		return "modules/assess/revokeOutOfPrison/revokeOutOfPrisonForm";
	}
	
	//保存草稿
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(RevokeOutOfPrison revokeOutOfPrison, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			if (!beanValidator(model, revokeOutOfPrison)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}
			if (StringUtils.isBlank(revokeOutOfPrison.getId())) {
				revokeOutOfPrisonService.insert(revokeOutOfPrison);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setData(revokeOutOfPrison.getId());
				commonJsonResult.setMsg("保存撤销缓刑成功");
			} else {
				revokeOutOfPrisonService.updateByIdSelective(revokeOutOfPrison);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setData(revokeOutOfPrison.getId());
				commonJsonResult.setMsg("修改撤销缓刑成功");
			}
			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(revokeOutOfPrison.getId())) {
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
	public CommonJsonResult batchDelete(RevokeOutOfPrison revokeOutOfPrison, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			revokeOutOfPrisonService.deleteById(revokeOutOfPrison.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除撤销假释成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除撤销假释失败！", true);
		}
		return commonJsonResult;
	}
	
	/*//保存草稿并上报
	@RequestMapping(value = "preSubmit")
	public String preSubmit(@ModelAttribute("revokeOutOfPrison") RevokeOutOfPrison revokeOutOfPrison, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		String issueTime=RevokeOutOfPrison.getIssueTime();
		if(issueTime!=null){
			String issueYear=issueTime.substring(0, 4);
			String issueMonth=issueTime.substring(5, 7);
			String issueDay=issueTime.substring(8, 10);
			System.out.println(issueYear+","+issueMonth+","+issueDay);
			model.addAttribute("issueYear", issueYear);
			model.addAttribute("issueMonth", issueMonth);
			model.addAttribute("issueDay", issueDay);
		}
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("RevokeOutOfPrison", revokeOutOfPrison);
		model.addAttribute("culprit", culpritService.findById(revokeOutOfPrison.getCulpritId()));
		return "modules/assess/RevokeOutOfPrison/print/printRevokeOutOfPrisonBook";
	}
	*/
	/**
	 * 
	    * @Title: submitRevokeOutOfPrison  
	    * @Description: 上报 
	    * @param @param RevokeOutOfPrison
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "submitRevokeOutOfPrison")
	@ResponseBody
	public CommonJsonResult submitRevokeOutOfPrison(RevokeOutOfPrison revokeOutOfPrison, Model model, HttpServletRequest request) {
		SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);//获取当前用户
		String decideType=request.getParameter("decideType");
		ProcessDetail processDetail = new ProcessDetail();
		processDetail.setDicDecideType(decideType);//用户判断上传是谁发起的
		try {
			if (StringUtils.isBlank(revokeOutOfPrison.getId())) {
				revokeOutOfPrisonService.insert(revokeOutOfPrison);
			} else {
				revokeOutOfPrisonService.updateByIdSelective(revokeOutOfPrison);
			}
			revokeOutOfPrisonService.submitRevokeOutOfPrison(sysAccount.getId(), revokeOutOfPrison,processDetail);
			return CommonJsonResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return CommonJsonResult.build(505, "上报失败");
		}
	}
	/**
	 * 
	    * @Title: RevokeOutOfPrisonAudit  
	    * @Description: 跳转至流程审批页面
	    * @param @param RevokeOutOfPrison
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping("/revokeOutOfPrisonAudit")
	public String revokeOutOfPrisonAudit(@ModelAttribute("revokeOutOfPrison")RevokeOutOfPrison revokeOutOfPrison,Model model){
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		if(!StringUtils.isBlank(revokeOutOfPrison.getProcessInstanceId())){//各部门打分查询
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(revokeOutOfPrison.getProcessInstanceId());
			model.addAttribute("processDetails",processDetails);
			for(ProcessDetail processDetail :processDetails){
				String dicSorceType=processDetail.getDicSorceType();
				if("91201".equals(dicSorceType)){//县矫正科打分
					model.addAttribute("jzksr", processDetail.getZfScore());
					model.addAttribute("jzkzf", processDetail.getOptScore());
				}else if("91202".equals(dicSorceType)){//县法制科打分
					model.addAttribute("fzkzf", processDetail.getOptScore());
				}else if("91203".equals(dicSorceType)){//市矫正处打分
					model.addAttribute("jzcsr", processDetail.getZfScore());
					model.addAttribute("jzczf", processDetail.getOptScore());
				}else if("91204".equals(dicSorceType)){//市法制处打分
					model.addAttribute("fzczf", processDetail.getOptScore());
				}
			}
		}
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("revokeOutOfPrison", revokeOutOfPrison);
		model.addAttribute("culprit", culpritService.findById(revokeOutOfPrison.getCulpritId()));
		return "modules/assess/revokeOutOfPrison/revokeOutOfPrisonAudit";
	}
	
	
	
	//详细
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("revokeOutOfPrison") RevokeOutOfPrison revokeOutOfPrison, Model model) {
		model.addAttribute("revokeOutOfPrison", revokeOutOfPrison);
		if(!StringUtils.isBlank(revokeOutOfPrison.getProcessInstanceId())){
			List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(revokeOutOfPrison.getProcessInstanceId());
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
					.processInstanceId(revokeOutOfPrison.getProcessInstanceId()).singleResult();
			if(processInstance!=null){
				String processDefinitionId = processInstance.getProcessDefinitionId();
				// 将流程定义 id传到页面，用于图形显示
				model.addAttribute("processDefinitionId", processDefinitionId);
			}
		}
		model.addAttribute("culprit", culpritService.findById(revokeOutOfPrison.getCulpritId()));
		return "modules/assess/revokeOutOfPrison/revokeOutOfPrisonDetail";
	}
	
	//打印《撤销暂予监外执行审核表》
	@RequestMapping(value = "printShenhe")
	public String printShenhe(@ModelAttribute("revokeOutOfPrison") RevokeOutOfPrison revokeOutOfPrison, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("revokeOutOfPrison", revokeOutOfPrison);
		model.addAttribute("culprit", culpritService.findById(revokeOutOfPrison.getCulpritId()));
		return "modules/assess/revokeOutOfPrison/print/printRevokeOutOfPrisonTable";
	}
	
	/**
	 * 
	    * @Title: submitRevokeOutOfPrisonAudit  
	    * @Description: 处理审核结果  
	    * @param @param RevokeOutOfPrison
	    * @param @param decideType
	    * @param @param opinion
	    * @param @param optScore
	    * @param @param zfScore
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping("/submitRevokeOutOfPrisonAudit")
	@ResponseBody
	public CommonJsonResult submitRevokeOutOfPrisonAudit(@ModelAttribute("revokeOutOfPrison")RevokeOutOfPrison revokeOutOfPrison,
			String decideType,String opinion,String optScore,String zfScore,Model model,HttpServletRequest request){
		CommonJsonResult commonJsonResult=null;
		try {
			revokeOutOfPrisonService.updateById(revokeOutOfPrison);
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			if(revokeOutOfPrison.getAuditType().equals("xfgCheck") && "97003".equals(revokeOutOfPrison.getDicSubOrgTypeKey())&&"1".equals(decideType)){
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
			revokeOutOfPrisonService.submitRevokeOutOfPrisonAuditStatus(sysAccount.getRoleId(), revokeOutOfPrison, processDetail);
			commonJsonResult = CommonJsonResult.build(200, "流程处理完毕！", false);
			//流程审批结束时，在imprison插入数据
			if("1007".equals(sysAccount.getRoleId())||"2007".equals(sysAccount.getRoleId())){
				ProcessInstance rpi = SpringContextHolder.getApplicationContext().getBean(RuntimeService.class)//
						.createProcessInstanceQuery()// 创建流程实例查询对象
						.processInstanceId(revokeOutOfPrison.getProcessInstanceId()).singleResult();
				if (rpi == null) {//流程结束
					imprisonService.insertRevokeOutOfPrison(revokeOutOfPrison);
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "流程处理失败！", true);
		}
		System.out.println("流程处理完毕！");
		return commonJsonResult;
		
	}
	
	
	@RequestMapping("/stopProcess")
	@ResponseBody
	public CommonJsonResult stopProcess(RevokeOutOfPrison revokeOutOfPrison,Model model){
		try {
			ProcessUtils.endProcess("endevent1", revokeOutOfPrison.getTaskId());
			return CommonJsonResult.build(200, "终止成功");
		} catch (Exception e) {
			e.printStackTrace();
			return CommonJsonResult.build(500, "终止失败");
		}
	}
	
}
