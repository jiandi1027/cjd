package com.rowell.sifa.web.sys;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.pojo.sys.Volunteer;
import com.rowell.sifa.service.sys.VolunteerService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  矫正对象迁入Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/volunteer")
public class VolunteerController extends BaseController {

	@Autowired
	private VolunteerService volunteerService;

	
	@ModelAttribute("volunteer")
	public Volunteer get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return volunteerService.findById(id);
		} else {
			return new Volunteer();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 矫正对象迁入跳转页 
	    * @param @param moveIn
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:moveInt:view")
//	@RequestMapping(value = "forList", method = RequestMethod.GET)
//	public String forList(MoveIn moveIn, Model model, HttpServletRequest request) {
//		return "modules/culprit/moveInList";
//	}
	/***
	    * @Title: list  
	    * @Description: 查找矫正对象迁入
	    * @param @param moveIn
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
	public EUDataGridResult list(Volunteer volunteer,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(volunteer.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(volunteer.getOrderStr());
		}

		List<Volunteer> list = volunteerService.findAll(volunteer);
		PageInfo<Volunteer> pageInfo = new PageInfo<Volunteer>(list);

		model.addAttribute("pager", pageInfo);
		
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	// @RequiresPermissions("sys:culpritFamily:view")
		@RequestMapping(value = "form")
		public String form(@ModelAttribute("volunteer") Volunteer volunteer, Model model) {
			model.addAttribute("volunteer", volunteer);
			return "modules/dailymgr/documentManage/person/volunteer";
		}
		
		
		@RequestMapping(value = "detail")
		public String detail(@ModelAttribute("volunteer")Volunteer volunteer, Model model) {
			model.addAttribute("volunteer", volunteer);
			return "modules/dailymgr/documentManage/person/volunteerDetail";
		}
	
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑矫正对象迁入  
	    * @param @param moveIn
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:moveIn:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Volunteer volunteer, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, volunteer)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(volunteer.getId())) {
				volunteerService.saveOrUpdate(volunteer);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存矫正对象迁入成功");
			} else {
				volunteerService.updateByIdSelective(volunteer);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改矫正对象迁入成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(volunteer.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存矫正对象迁入失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改矫正对象迁入失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
		
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除矫正对象迁入  
	    * @param @param moveIn
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:moveIn:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(Volunteer volunteer, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			volunteerService.deleteById(volunteer.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除矫正对象迁入成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除矫正对象迁入失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除矫正对象迁入  
	    * @param @param moveIn
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:moveIn:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(Volunteer volunteer, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			volunteerService.batchDelete(volunteer.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除矫正对象迁入成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除矫正对象迁入失败！", true);
		}
		return commonJsonResult;
	}


}
