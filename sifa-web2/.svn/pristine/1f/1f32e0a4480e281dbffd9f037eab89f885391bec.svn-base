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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.dailymgr.DailyMobileReport;
import com.rowell.sifa.service.dailymgr.DailyMobileReportService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: MobileReportController  
    * @Description: 电话报到Controller
    * @author DELL  
    * @date 2017年3月6日  
    *
 */
@Controller
@RequestMapping(value="/dailymgr/mobileReport")
public class DailyMobileReportController extends BaseController{
	@Autowired
	private DailyMobileReportService dailyMobileReportService;

	@ModelAttribute("dailyMobileReport")
	public DailyMobileReport get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return dailyMobileReportService.findById(id);
		}else{
			return new DailyMobileReport();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(DailyMobileReport dailyMobileReport, Model model, HttpServletRequest request) {
		return "modules/dailymgr/dailyMobileReport/dailyMobileReportList";
	}
	
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(DailyMobileReport dailyMobileReport, Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response){
		if(StringUtils.isBlank(dailyMobileReport.getGroupId())){
			dailyMobileReport.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(dailyMobileReport.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(dailyMobileReport.getOrderStr());
		}
		List<DailyMobileReport> list = dailyMobileReportService.findAll(dailyMobileReport);
		
		PageInfo<DailyMobileReport> pageInfo = new PageInfo<DailyMobileReport>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	//跳转到增加页面
	@RequestMapping(value = "form")
	public String form(String id, Model model, HttpServletRequest request) {
		return "modules/dailymgr/dailyMobileReport/dailyMobileReportForm";
	}
	
	
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(DailyMobileReport dailyMobileReport, Model model,HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, dailyMobileReport)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			dailyMobileReportService.insert(dailyMobileReport);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("保存成功");

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return commonJsonResult;
		}
	}
	
}
