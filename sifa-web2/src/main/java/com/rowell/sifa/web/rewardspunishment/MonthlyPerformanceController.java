package com.rowell.sifa.web.rewardspunishment;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.flowable.engine.TaskService;
import org.flowable.engine.task.Task;
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
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.endcorrect.Death;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.pojo.rewardspunishment.Commend;
import com.rowell.sifa.pojo.rewardspunishment.MonthlyPerformance;
import com.rowell.sifa.pojo.rewardspunishment.RevokeParole;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.rewardspunishment.MonthlyPerformanceService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 详情
    * @ClassName: MonthlyPerformanceController  
    * @Description: 月度考核评议
    * @author FWY
    * @date 2017年4月13日  
    *
 */
@Controller
@RequestMapping(value="/rewardspunishment/monthlyPerformance")
public class MonthlyPerformanceController  extends BaseController{
	
	@Autowired
	MonthlyPerformanceService monthlyPerformanceService;
	@Autowired
	CulpritService culpritService;
	@Autowired
	TaskService taskService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Commend commend, Model model, HttpServletRequest request) {
		return "modules/rewardspunishment/monthlyPerformance/monthlyPerformanceList";
	}
	//@RequestParam(value = "culpritId", required = false,defaultValue = "") String culpritId,
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(MonthlyPerformance monthlyPerformance,
			@RequestParam(value = "startTime", required = false,defaultValue = "") Date startTime,
			@RequestParam(value = "endTime", required = false,defaultValue = "") Date endTime,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(monthlyPerformance.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(monthlyPerformance.getOrderStr());
		}
		
		SysAccount sysAccount =SysAccountUtils.getSysAccount();
		if (StringUtils.isBlank(monthlyPerformance.getGroupId())) {
			monthlyPerformance.setGroupId(sysAccount.getGroupId());
		} 
		
		List<MonthlyPerformance> list = monthlyPerformanceService.findAll(monthlyPerformance);
		for(MonthlyPerformance monthlyPerformanceEntity:list){
			if(!StringUtils.isBlank(monthlyPerformanceEntity.getProcessInstanceId())){
				ProcessUtils.fillProcessInfo(monthlyPerformanceEntity);
			} 
		}
//		if(groupId!=null&&!groupId.equals("")){
//			list = new ArrayList<MonthlyPerformance>();
//				List<Culprit> clist = culpritService.findCulpritBySysAccount(groupId);
//				for(Culprit c :clist){
//					MonthlyPerformance dea = new MonthlyPerformance();
//					dea.setCulpritId(c.getId());
//					List<MonthlyPerformance> list1 = monthlyPerformanceService.findAll(dea);
//					if(list1!=null&&list1.size()>0){
//						list.add(list1.get(0));
//				}
//			}
//		}
//		for (MonthlyPerformance monthlyPerformanceEntity : list) {
//			if (monthlyPerformanceEntity != null) {
//				monthlyPerformanceService.addCulpritToMonthlyPerformance(monthlyPerformanceEntity);
//			}
//			if (!StringUtils.isBlank(monthlyPerformanceEntity.getProcessInstanceId())) {
//						ProcessUtils.fillProcessInfo(monthlyPerformanceEntity);
//						if(monthlyPerformanceEntity.getIsEnd()==1){
//							MonthlyPerformance m = new MonthlyPerformance();
//							m.setId(monthlyPerformanceEntity.getId());
//							m.setIsAgree(0);
//							monthlyPerformanceService.updateByIdSelective(m);
//						}
//			}
//		}
//		
		PageInfo<MonthlyPerformance> pageInfo = new PageInfo<MonthlyPerformance>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	  @RequestMapping(value ={ "submitMonthly", ""})
	  @ResponseBody
	  public CommonJsonResult submit1(MonthlyPerformance monthlyPerformance, Model
		 model, HttpServletRequest request) { 
		  SysAccount sysAccount =SysAccountUtils.getSysAccount();
		  monthlyPerformanceService.submitMonthlyPerformance(sysAccount.getId(), monthlyPerformance); 
		
		  return CommonJsonResult.ok(); 
		 }
	  
	  @RequestMapping(value = "submit", method = RequestMethod.GET)
	  public String submit(MonthlyPerformance monthlyPerformance, Model
		 model, HttpServletRequest request) { 
		  MonthlyPerformance mo = monthlyPerformanceService.findById(monthlyPerformance.getId());
		  model.addAttribute("monthlyPerformance",mo);
		   return "modules/rewardspunishment/monthlyPerformance/submit"; 
		 }
	  
	  @RequestMapping(value = "detail", method = RequestMethod.GET)
	  public String detail(MonthlyPerformance monthlyPerformance, Model
		 model, HttpServletRequest request) { 
		  MonthlyPerformance mo = monthlyPerformanceService.findById(monthlyPerformance.getId());
		  model.addAttribute("monthlyPerformance",mo);
		   return "modules/rewardspunishment/monthlyPerformance/detail"; 
		 }
	  
	  @RequestMapping(value = "submitAudit", method = RequestMethod.GET)
	  public String submitAudit(MonthlyPerformance monthlyPerformance, Model
		 model, HttpServletRequest request) { 
		  MonthlyPerformance mo = monthlyPerformanceService.findById(monthlyPerformance.getId());
		  mo.setTaskId(monthlyPerformance.getTaskId());
		  mo.setAuditType(monthlyPerformance.getAuditType());
		  mo.setProcessInstanceId(monthlyPerformance.getProcessInstanceId());
		  model.addAttribute("monthlyPerformance",mo);
		   return "modules/rewardspunishment/monthlyPerformance/submitAudit"; 
		 }
	  
		@RequestMapping("submitAduitMonthly")
		public String submitAduitMonthly( MonthlyPerformance monthlyPerformance, String decideType, String opinion, Model model,
				HttpServletRequest request) {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			ProcessDetail processDetail = new ProcessDetail();
			processDetail.setDicDecideType("1");
			processDetail.setOpinion(opinion);
			monthlyPerformanceService.saveMonthlyformanceAuditStatus(sysAccount.getRoleId(), monthlyPerformance, processDetail);
			return "modules/rewardspunishment/monthlyPerformance/monthlyPerformanceList";
		}
}
