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
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.dailymgr.DailyMobileReportHistory;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.DailyMobileReportHistoryService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: MobileReportHistoryController  
    * @Description: 电话报到Controller
    * @author DELL  
    * @date 2017年3月6日  
    *
 */
@Controller
@RequestMapping(value="/dailymgr/mobileReportHistory")
public class DailyMobileReportHistoryController extends BaseController{
	@Autowired
	private DailyMobileReportHistoryService dailyMobileReportHistoryService;
	@Autowired
	private CulpritService culpritService;

	@ModelAttribute("dailyMobileReportHistory")
	public DailyMobileReportHistory get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return dailyMobileReportHistoryService.findById(id);
		}else{
			return new DailyMobileReportHistory();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(DailyMobileReportHistory dailyMobileReportHistory, Model model, HttpServletRequest request) {
		if (dailyMobileReportHistory != null) {
			if (!StringUtils.isBlank(dailyMobileReportHistory.getCulpritId())) {
				Culprit culprit = culpritService.findById(dailyMobileReportHistory.getCulpritId());
				dailyMobileReportHistory.setCulpritName(culprit.getName());
				model.addAttribute("culpritId", dailyMobileReportHistory.getCulpritId());
			}
		}

		return "modules/dailymgr/dailyMobileReportHistory/dailyMobileReportHistoryList";
	}
	
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(DailyMobileReportHistory dailyMobileReportHistory, Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, 
			@RequestParam(value = "culpritId", required = false, defaultValue = "0") String culpritId,
			HttpServletRequest request, HttpServletResponse response){
		if(StringUtils.isBlank(dailyMobileReportHistory.getGroupId())){
			dailyMobileReportHistory.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		if (dailyMobileReportHistory.getCulpritName() != null) {
			dailyMobileReportHistory.setCulpritId("");
		}
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(dailyMobileReportHistory.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(dailyMobileReportHistory.getOrderStr());
		}
		List<DailyMobileReportHistory> list = dailyMobileReportHistoryService.findAll(dailyMobileReportHistory);
		
		PageInfo<DailyMobileReportHistory> pageInfo = new PageInfo<DailyMobileReportHistory>(list);
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
		return "modules/dailymgr/dailyMobileReportHistory/dailyMobileReportHistoryForm";
	}
	
	
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(DailyMobileReportHistory dailyMobileReportHistory, Model model,HttpServletRequest request) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, dailyMobileReportHistory)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			dailyMobileReportHistoryService.insert(dailyMobileReportHistory);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("保存成功");

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			return commonJsonResult;
		}
	}
	
}
