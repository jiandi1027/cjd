package com.rowell.sifa.web.culpritinfo;

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
import com.rowell.sifa.pojo.culpritinfo.CulpritComplicity;
import com.rowell.sifa.service.culpritinfo.CulpritComplicityService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  同案犯Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/culpritinfo/culpritComplicity")
public class CulpritComplicityController extends BaseController {

	@Autowired
	private CulpritComplicityService culpritComplicityService;

	@ModelAttribute("culpritComplicity")
	public CulpritComplicity get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return culpritComplicityService.findById(id);
		} else {
			return new CulpritComplicity();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 同案犯跳转页 
	    * @param @param culpritComplicity
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritComplicityt:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(CulpritComplicity culpritComplicity, Model model, HttpServletRequest request) {
		return "modules/sys/culpritComplicityList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找同案犯
	    * @param @param culpritComplicity
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
	public EUDataGridResult list(CulpritComplicity culpritComplicity,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culpritComplicity.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culpritComplicity.getOrderStr());
		}

		List<CulpritComplicity> list = culpritComplicityService.findAll(culpritComplicity);

		PageInfo<CulpritComplicity> pageInfo = new PageInfo<CulpritComplicity>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:culpritComplicity:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("culpritComplicity") CulpritComplicity culpritComplicity, Model model) {

		return "modules/sys/culpritComplicityForm";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑同案犯  
	    * @param @param culpritComplicity
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritComplicity:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(CulpritComplicity culpritComplicity, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, culpritComplicity)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(culpritComplicity.getId())) {
				culpritComplicityService.saveOrUpdate(culpritComplicity);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存同案犯"+culpritComplicity.getName()+"成功");
			} else {
				culpritComplicityService.updateByIdSelective(culpritComplicity);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改同案犯"+culpritComplicity.getName()+"成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(culpritComplicity.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存同案犯"+culpritComplicity.getName()+"失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改同案犯"+culpritComplicity.getName()+"失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除同案犯  
	    * @param @param culpritComplicity
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritComplicity:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(CulpritComplicity culpritComplicity, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritComplicityService.deleteById(culpritComplicity.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除同案犯成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除同案犯失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除同案犯  
	    * @param @param culpritComplicity
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritComplicity:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(CulpritComplicity culpritComplicity, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritComplicityService.batchDelete(culpritComplicity.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除同案犯成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除同案犯失败！", true);
		}
		return commonJsonResult;
	}

	@RequestMapping(value = "docList", method = RequestMethod.GET)
	public String docList(CulpritComplicity culpritComplicity, Model model, HttpServletRequest request) {
		model.addAttribute("culpritComplicity",culpritComplicity);
		return "modules/dailymgr/documentManage/culpritComplicity";
	}
}
