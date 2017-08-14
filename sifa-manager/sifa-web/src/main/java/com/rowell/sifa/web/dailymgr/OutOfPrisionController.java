package com.rowell.sifa.web.dailymgr;

import java.util.Calendar;
import java.util.Date;
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
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.pojo.dailymgr.OutOfPrison;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.OutOfPrisonService;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.rewardspunishment.RevokeOutOfPrisonService;
import com.rowell.sifa.service.sys.SysDicService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName:OutOfPrisionController
    * @Description: 延长监外执行
    * @author DELL  
    * @date 2017年3月30日  
    *
 */
@Controller
@RequestMapping(value = "/dailymgr/outOfPrison")
public class OutOfPrisionController extends BaseController {
	@Autowired
	private OutOfPrisonService outOfPrisonService;
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
	
	
	@ModelAttribute("outOfPrison")
	public OutOfPrison get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return outOfPrisonService.findById(id);
		} else {
			return new OutOfPrison();
		}
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(OutOfPrison outPrison, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/dailymgr/outOfPrison/outOfPrisonList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(OutOfPrison outOfPrison,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(outOfPrison.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(outOfPrison.getOrderStr());
		}

		List<OutOfPrison> list = outOfPrisonService.findAll(outOfPrison);
		for(OutOfPrison outOfPrisonEntity:list){
			if(!StringUtils.isBlank(outOfPrisonEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(outOfPrisonEntity);
			} 
		}
		PageInfo<OutOfPrison> pageInfo = new PageInfo<OutOfPrison>(list);
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
	    * @Description: 增加页面
	    * @param @param outOfPrison
	    * @param @param model
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("outOfPrison") OutOfPrison outOfPrison, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		model.addAttribute("outOfPrison", outOfPrison);
		model.addAttribute("culprit", culpritService.findById(outOfPrison.getCulpritId()));
		return "modules/dailymgr/outOfPrison/outOfPrisonForm";
	}
	
	//保存草稿
		@RequestMapping(value = "save")
		@ResponseBody
		public CommonJsonResult save(OutOfPrison outOfPrison, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;
			try {
				if (!beanValidator(model, outOfPrison)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}
				if (StringUtils.isBlank(outOfPrison.getId())) {
					outOfPrisonService.insert(outOfPrison);
					commonJsonResult = CommonJsonResult.ok();
					commonJsonResult.setData(outOfPrison.getId());
					commonJsonResult.setMsg("保存撤销缓刑成功");
				} else {
					outOfPrisonService.updateByIdSelective(outOfPrison);
					commonJsonResult = CommonJsonResult.ok();
					commonJsonResult.setData(outOfPrison.getId());
					commonJsonResult.setMsg("修改撤销缓刑成功");
				}
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				if (StringUtils.isBlank(outOfPrison.getId())) {
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
		public CommonJsonResult batchDelete(OutOfPrison outOfPrison, RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;
			try {
				outOfPrisonService.deleteById(outOfPrison.getId());
				commonJsonResult = CommonJsonResult.build(200, "删除撤销假释成功！", false);
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "删除撤销假释失败！", true);
			}
			return commonJsonResult;
		}
	
		//详细
		@RequestMapping(value = "detail")
		public String detail(@ModelAttribute("outOfPrison") OutOfPrison outOfPrison, Model model) {
			model.addAttribute("outOfPrison", outOfPrison);
			if(!StringUtils.isBlank(outOfPrison.getProcessInstanceId())){
				List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(outOfPrison.getProcessInstanceId());
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
						.processInstanceId(outOfPrison.getProcessInstanceId()).singleResult();
				if(processInstance!=null){
					String processDefinitionId = processInstance.getProcessDefinitionId();
					// 将流程定义 id传到页面，用于图形显示
					model.addAttribute("processDefinitionId", processDefinitionId);
				}
			}
			model.addAttribute("culprit", culpritService.findById(outOfPrison.getCulpritId()));
			return "modules/dailymgr/outOfPrison/outOfPrisonDetail";
		}
	
		//保存草稿并上报
		@RequestMapping(value = "preSubmit")
		public String preSubmit(@ModelAttribute("outOfPrison")  OutOfPrison outOfPrison, Model model, HttpServletRequest request) {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			String issueTime=outOfPrison.getIssueTime();
			if(issueTime!=null){
				String issueYear=issueTime.substring(0, 4);
				String issueMonth=issueTime.substring(5, 7);
				String issueDay=issueTime.substring(8, 10);
				model.addAttribute("issueYear", issueYear);
				model.addAttribute("issueMonth", issueMonth);
				model.addAttribute("issueDay", issueDay);
			}
			if(request.getParameter("detail")!=null){//表示该请求来自详细页面，仅用户打印，不做上报或修改操作
				model.addAttribute("detail", "1");
			}
			model.addAttribute("sysAccount", sysAccount);
			model.addAttribute("outOfPrison", outOfPrison);
			Culprit culprit=culpritService.findById(outOfPrison.getCulpritId());
			CulpritJudgment culpritJudgment=culprit.getCulpritJudgment();
			model.addAttribute("culprit", culprit);
			model.addAttribute("culpritJudgment", culpritJudgment);
			return "modules/dailymgr/outOfPrison/print/printOutOfPrisonBook";
		}	
		
		/**
		 * 
		    * @Title: submitOutOfPrison  
		    * @Description: 流程上报 
		    * @param @param outOfPrison
		    * @param @param model
		    * @param @param request
		    * @param @return    参数  
		    * @return CommonJsonResult    返回类型  
		    * @throws
		 */
		@RequestMapping(value = "submitOutOfPrison", method = RequestMethod.GET)
		@ResponseBody
		public CommonJsonResult submitOutOfPrison(OutOfPrison outOfPrison, Model model, HttpServletRequest request) {
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
			outOfPrison.setIssueTime(issueTime);
			outOfPrisonService.updateById(outOfPrison);
			SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);//获取当前用户
			String decideType=request.getParameter("decideType");
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType(decideType);//用户判断上传是谁发起的
			try {
				outOfPrisonService.submitOutOfPrison(sysAccount.getId(), outOfPrison,processDetail);
				return CommonJsonResult.ok();
			} catch (Exception e) {
				e.printStackTrace();
				return CommonJsonResult.build(505, "上报失败");
			}
		}
		
		/**
		 * 跳转至流程审批页面
		    * @Title: outOfPrisonAudit  
		    * @Description: TODO(这里用一句话描述这个方法的作用)  
		    * @param @param outOfPrison
		    * @param @param model
		    * @param @return    参数  
		    * @return String    返回类型  
		    * @throws
		 */
		@RequestMapping("/outOfPrisonAudit")
		public String outOfPrisonAudit(@ModelAttribute("outOfPrison")OutOfPrison outOfPrison,Model model){
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			if(!StringUtils.isBlank(outOfPrison.getProcessInstanceId())){//各部门打分查询
				List<ProcessDetail> processDetails=processDetailService.findByProcessInsId(outOfPrison.getProcessInstanceId());
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
			model.addAttribute("outOfPrison", outOfPrison);
			model.addAttribute("culprit", culpritService.findById(outOfPrison.getCulpritId()));
			return "modules/dailymgr/outOfPrison/outOfPrisonAudit";
		}
		
		/**
		 * 
		    * @Title: submitOutOfPrisonAudit  
		    * @Description: 流程处理  
		    * @param @param outOfPrison
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
		@RequestMapping("/submitOutOfPrisonAudit")
		@ResponseBody
		public CommonJsonResult submitOutOfPrisonAudit(@ModelAttribute("outOfPrison") OutOfPrison outOfPrison,
				String decideType,String opinion,String optScore,String zfScore,Model model,HttpServletRequest request){
			CommonJsonResult commonJsonResult=null;
			try {
				outOfPrisonService.updateById(outOfPrison);
				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				/*if(outOfPrison.getAuditType().equals("xfgCheck") && "97003".equals(outOfPrison.getSubmittionOrgTypeId())&&"1".equals(decideType)){
					decideType="6";
				}*/
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
				outOfPrisonService.submitOutOfPrisonAuditStatus(sysAccount.getRoleId(), outOfPrison, processDetail);
				commonJsonResult = CommonJsonResult.build(200, "流程处理完毕！", false);
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "流程处理失败！", true);
			}
			System.out.println("流程处理完毕！");
			return commonJsonResult;
			
		}
		
		//保存建议书
		@RequestMapping(value = "saveBook")
		@ResponseBody
		public CommonJsonResult saveBook(OutOfPrison outOfPrison, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;
			try {	
					String issueYear=request.getParameter("issueYear");
					String issueMonth=request.getParameter("issueMonth");
					String issueDay=request.getParameter("issueDay");
					String issueTime=issueYear+","+issueMonth+","+issueDay;
					outOfPrison.setIssueTime(issueTime);
					outOfPrisonService.updateByIdSelective(outOfPrison);
					commonJsonResult = CommonJsonResult.ok();
					commonJsonResult.setData(outOfPrison.getId());
					commonJsonResult.setMsg("保存成功");
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
					commonJsonResult = CommonJsonResult.build(505, "保存失败！");
					commonJsonResult.setIsError(true);
				return commonJsonResult;
			}
		}
		
		
		////打印审批表
		@RequestMapping(value = "printShenhe")
		public String printShenhe(@ModelAttribute("outOfPrison") OutOfPrison outOfPrison, Model model) {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			model.addAttribute("sysAccount", sysAccount);
			model.addAttribute("outOfPrison", outOfPrison);
			model.addAttribute("culprit", culpritService.findById(outOfPrison.getCulpritId()));
			return "modules/dailymgr/outOfPrison/print/printOutOfPrisonTable";
		}
		
		////打印医学委托书
		@RequestMapping(value = "printYiXue")
		public String printYiXue(@ModelAttribute("outOfPrison") OutOfPrison outOfPrison, Model model) {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			model.addAttribute("sysAccount", sysAccount);
			model.addAttribute("outOfPrison", outOfPrison);
			model.addAttribute("culprit", culpritService.findById(outOfPrison.getCulpritId()));
			return "modules/dailymgr/outOfPrison/print/printOutOfPrisonYiXue";
		}
		
		//作废
		@RequestMapping(value = "saveFlag")
		@ResponseBody
		public CommonJsonResult saveFlag(OutOfPrison outOfPrison, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;
			try {	
					outOfPrison.setDicBlankFlagKey("91601");//作废标记（已作废）
					outOfPrison.setFlagTime(new Date());
					SysAccount sysAccount = SysAccountUtils.getSysAccount();
					outOfPrison.setFlagAccountId(sysAccount.getRoleId());
					outOfPrison.setFlagAccountName(sysAccount.getAccountname());
					outOfPrisonService.updateByIdSelective(outOfPrison);
					ProcessUtils.endProcess("endevent1", outOfPrison.getTaskId());
					commonJsonResult = CommonJsonResult.ok();
					commonJsonResult.setMsg("作废成功");
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
					commonJsonResult = CommonJsonResult.build(505, "作废失败！");
					commonJsonResult.setIsError(true);
				return commonJsonResult;
			}
		}
		
		 /**
		  * 流程终止
		  * 
		  */
		@RequestMapping("/stopProcess")
		@ResponseBody
		public CommonJsonResult stopProcess(OutOfPrison outOfPrison,Model model){
			try {
				outOfPrison.setDicBlankFlagKey("91601");//作废标记（已作废）
				outOfPrisonService.updateByIdSelective(outOfPrison);
				ProcessUtils.endProcess("endevent1", outOfPrison.getTaskId());
				return CommonJsonResult.build(200, "终止成功");
			} catch (Exception e) {
				e.printStackTrace();
				return CommonJsonResult.build(500, "终止失败");
			}
		}
		
	
}
