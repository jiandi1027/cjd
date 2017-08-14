package com.rowell.sifa.web.inculprit;

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
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.pojo.inculprit.ExitEntryReport;
import com.rowell.sifa.service.inculprit.ExitEntryReportService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  出入境报备Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/exitEntryReport")
public class ExitEntryReportController extends BaseController {

	@Autowired
	private ExitEntryReportService exitEntryReportService;

	@ModelAttribute("exitEntryReport")
	public ExitEntryReport get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return exitEntryReportService.findById(id);
		} else {
			return new ExitEntryReport();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 出入境报备跳转页 
	    * @param @param exitEntryReport
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:exitEntryReportt:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(ExitEntryReport exitEntryReport, Model model, HttpServletRequest request) {
		return "modules/sys/exitEntryReportList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找出入境报备
	    * @param @param exitEntryReport
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
	public EUDataGridResult list(ExitEntryReport exitEntryReport,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(exitEntryReport.getOrderStr())) {
			PageHelper.orderBy("update_date desc");
		} else {
			PageHelper.orderBy(exitEntryReport.getOrderStr());
		}

		List<ExitEntryReport> list = exitEntryReportService.findAll(exitEntryReport);

		PageInfo<ExitEntryReport> pageInfo = new PageInfo<ExitEntryReport>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:exitEntryReport:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("exitEntryReport") ExitEntryReport exitEntryReport, Model model) {

		return "modules/sys/exitEntryReportForm";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑出入境报备  
	    * @param @param exitEntryReport
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:exitEntryReport:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(ExitEntryReport exitEntryReport, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, exitEntryReport)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(exitEntryReport.getId())) {
				exitEntryReportService.saveOrUpdate(exitEntryReport);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存出入境报备成功");
			} else {
				exitEntryReportService.updateByIdSelective(exitEntryReport);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改出入境报备成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(exitEntryReport.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存出入境报备失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改出入境报备失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除出入境报备  
	    * @param @param exitEntryReport
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:exitEntryReport:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(ExitEntryReport exitEntryReport, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			exitEntryReportService.deleteById(exitEntryReport.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除出入境报备成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除出入境报备失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除出入境报备  
	    * @param @param exitEntryReport
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:exitEntryReport:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(ExitEntryReport exitEntryReport, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			exitEntryReportService.batchDelete(exitEntryReport.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除出入境报备成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除出入境报备失败！", true);
		}
		return commonJsonResult;
	}


}
