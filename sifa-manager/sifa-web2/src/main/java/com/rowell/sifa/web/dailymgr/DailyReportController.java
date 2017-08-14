package com.rowell.sifa.web.dailymgr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.dailymgr.DailyReport;
import com.rowell.sifa.pojo.dailymgr.DailyReportLast;
import com.rowell.sifa.pojo.dailymgr.Study;
import com.rowell.sifa.pojo.endcorrect.FinishRedress;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.DailyReportLastService;
import com.rowell.sifa.service.dailymgr.DailyReportService;
import com.rowell.sifa.service.dailymgr.StudyService;
import com.rowell.sifa.service.sys.IfaceRecordService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: verbalWarningController  
    * @Description: 口头警告Controller
    * @author DELL  
    * @date 2017年3月6日  
    *
 */
@Controller
@RequestMapping(value="/dailymgr/dailyReport")
public class DailyReportController extends BaseController{
	@Autowired
	private DailyReportLastService dailyReportLastService;
	@Autowired
	private DailyReportService dailyReportService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private IfaceRecordService ifaceRecordService;
	
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(DailyReportLast dailyReportLast, Model model, HttpServletRequest request) {
		return "modules/dailymgr/dailyReport/culpritList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(DailyReportLast dailyReportLast,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if(StringUtils.isBlank(dailyReportLast.getGroupId())){
			dailyReportLast.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		if (StringUtils.isBlank(dailyReportLast.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(dailyReportLast.getOrderStr());
		}
		List<DailyReportLast> list = dailyReportLastService.findAll(dailyReportLast);
		
		PageInfo<DailyReportLast> pageInfo = new PageInfo<DailyReportLast>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	@RequestMapping(value = "dailyReportList", method = RequestMethod.GET)
	public String forDailyReportList(String culpritId, Model model, HttpServletRequest request) {
		model.addAttribute("culpritId", culpritId);
		/*DailyReport dailyReport=new DailyReport();
		dailyReport.setCulpritId(culpritId);
		dailyReport.setOrder("report_date desc");
		List<DailyReport> list = dailyReportService.findAll(dailyReport);
		model.addAttribute("dailyReportList", list);*/
		return "modules/dailymgr/dailyReport/dailyReportDetail";
		//return "modules/dailymgr/dailyReport/dailyReportList";
	}
	
	@RequestMapping(value = "get")
	public String get(String id, Model model, HttpServletRequest request) {
		DailyReport dailyReport=dailyReportService.findById(id);
		model.addAttribute("dailyReport",dailyReport);
		return "modules/dailymgr/dailyReport/dailyReportDetail";
	}
	
	//post请求获取数据
	@RequestMapping(value = { "dailyReportList", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult dailyReportList(DailyReport dailyReport,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, String culpritId,HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		
		if(StringUtils.isBlank(dailyReport.getGroupId())){
			dailyReport.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		
		if (StringUtils.isBlank(dailyReport.getOrderStr())) {
			PageHelper.orderBy("report_date desc");
		} else {
			PageHelper.orderBy(dailyReport.getOrderStr());
		}
		dailyReport.setCulpritId(culpritId);
		List<DailyReport> list = dailyReportService.findAll(dailyReport);
		
		PageInfo<DailyReport> pageInfo = new PageInfo<DailyReport>(list);
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
		public String add(String id, Model model, HttpServletRequest request) {
			return "modules/dailymgr/dailyReport/dailyReportAdd";
		}
		

		@RequestMapping("/refresh")
		@ResponseBody
		public CommonJsonResult refresh(){
			try {
				ifaceRecordService.ifaceRecordJob();
				return CommonJsonResult.build(200, "刷新成功");
			} catch (Exception e) {
				e.printStackTrace();
				return CommonJsonResult.build(500, "刷新失败");
			}
		}
		
		@RequestMapping(value = "save", method = RequestMethod.POST)
		@ResponseBody
		public CommonJsonResult save(DailyReport dailyReport, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes,Integer reportType1) {
			CommonJsonResult commonJsonResult = null;

			try {
				if (!beanValidator(model, dailyReport)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}
				//dailyReportLastService.save(dailyReport);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				return commonJsonResult;
			}
		}
		
		//跳转到档案界面
		@RequestMapping(value = "dailyReportDoc")
		public String dailyReportDoc(DailyReport dailyReport, Model model, HttpServletRequest request) {
			model.addAttribute("dailyReport", dailyReport);
			Culprit culprit=culpritService.findById(dailyReport.getCulpritId());
			model.addAttribute("culprit", culprit);
			return "modules/dailymgr/documentManage/dailyReport";
		}
		//档案界面保存
		@RequestMapping(value = "saveDoc")
		@ResponseBody
		public CommonJsonResult saveDoc(DailyReport dailyReport, HttpServletRequest request, Model model,
				RedirectAttributes redirectAttributes) {
			CommonJsonResult commonJsonResult = null;
			try {
				if (!beanValidator(model, dailyReport)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}
				
				if (StringUtils.isBlank(dailyReport.getId())) {
					//dailyReportLastService.save(dailyReport);
					commonJsonResult = CommonJsonResult.ok();
					commonJsonResult.setMsg("保存成功");
				}

				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				if (StringUtils.isBlank(dailyReport.getId())) {
					commonJsonResult = CommonJsonResult.build(505, "保存请假失败！");
					commonJsonResult.setIsError(true);
				} 

				return commonJsonResult;
			}
		}
	
}
