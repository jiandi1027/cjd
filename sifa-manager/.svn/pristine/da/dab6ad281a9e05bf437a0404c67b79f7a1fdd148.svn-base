package com.rowell.sifa.web.sys;

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
import com.rowell.sifa.pojo.sys.Holiday;
import com.rowell.sifa.service.sys.HolidayService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  每年工作日节假日Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/holiday")
public class HolidayController extends BaseController {

	@Autowired
	private HolidayService holidayService;

	@ModelAttribute("holiday")
	public Holiday get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return holidayService.findById(id);
		} else {
			return new Holiday();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 每年工作日节假日跳转页 
	    * @param @param holiday
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysDict:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Holiday holiday, Model model, HttpServletRequest request) {
		return "modules/sys/holidayList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找每年工作日节假日
	    * @param @param holiday
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
	public EUDataGridResult list(Holiday holiday,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(holiday.getOrderStr())) {
			PageHelper.orderBy("update_date desc");
		} else {
			PageHelper.orderBy(holiday.getOrderStr());
		}

		List<Holiday> list = holidayService.findAll(holiday);

		PageInfo<Holiday> pageInfo = new PageInfo<Holiday>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:holiday:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("holiday") Holiday holiday, Model model) {

		return "modules/sys/holidayForm";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑每年工作日节假日  
	    * @param @param holiday
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:holiday:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Holiday holiday, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, holiday)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(holiday.getId())) {
				holidayService.saveOrUpdate(holiday);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存每年工作日节假日成功");
			} else {
				holidayService.updateByIdSelective(holiday);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改每年工作日节假日成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(holiday.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存每年工作日节假日失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改每年工作日节假日失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除每年工作日节假日  
	    * @param @param holiday
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:holiday:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(Holiday holiday, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			holidayService.deleteById(holiday.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除每年工作日节假日成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除每年工作日节假日失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除每年工作日节假日  
	    * @param @param holiday
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:holiday:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(Holiday holiday, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			holidayService.batchDelete(holiday.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除每年工作日节假日成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除每年工作日节假日失败！", true);
		}
		return commonJsonResult;
	}


}
