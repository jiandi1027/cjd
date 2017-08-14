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
import com.rowell.sifa.pojo.culpritinfo.CulpritFamily;
import com.rowell.sifa.service.culpritinfo.CulpritFamilyService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  家庭成员和社会关系Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/culpritinfo/culpritFamily")
public class CulpritFamilyController extends BaseController {

	@Autowired
	private CulpritFamilyService culpritFamilyService;

	@ModelAttribute("culpritFamily")
	public CulpritFamily get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return culpritFamilyService.findById(id);
		} else {
			return new CulpritFamily();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 家庭成员和社会关系跳转页 
	    * @param @param culpritFamily
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritFamilyt:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(CulpritFamily culpritFamily, Model model, HttpServletRequest request) {
		return "modules/sys/culpritFamilyList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找家庭成员和社会关系
	    * @param @param culpritFamily
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
	public EUDataGridResult list(CulpritFamily culpritFamily,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culpritFamily.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culpritFamily.getOrderStr());
		}

		List<CulpritFamily> list = culpritFamilyService.findAll(culpritFamily);

		PageInfo<CulpritFamily> pageInfo = new PageInfo<CulpritFamily>(list);

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
	public String form(@ModelAttribute("culpritFamily") CulpritFamily culpritFamily, Model model) {
		model.addAttribute("culpritFamily", culpritFamily);
		return "modules/dailymgr/documentManage/person/family";
	}
	
	
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("culpritFamily") CulpritFamily culpritFamily, Model model) {
		model.addAttribute("culpritFamily", culpritFamily);
		return "modules/dailymgr/documentManage/person/familyDetail";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑家庭成员和社会关系  
	    * @param @param culpritFamily
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritFamily:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(CulpritFamily culpritFamily, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, culpritFamily)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(culpritFamily.getId())) {
				culpritFamilyService.saveOrUpdate(culpritFamily);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存家庭成员和社会关系"+culpritFamily.getName()+"成功");
			} else {
				culpritFamilyService.updateByIdSelective(culpritFamily);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改家庭成员和社会关系"+culpritFamily.getName()+"成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(culpritFamily.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存家庭成员和社会关系"+culpritFamily.getName()+"失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改家庭成员和社会关系"+culpritFamily.getName()+"失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除家庭成员和社会关系  
	    * @param @param culpritFamily
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritFamily:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(CulpritFamily culpritFamily, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritFamilyService.deleteById(culpritFamily.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除家庭成员和社会关系成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除家庭成员和社会关系失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除家庭成员和社会关系  
	    * @param @param culpritFamily
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritFamily:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(CulpritFamily culpritFamily, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritFamilyService.batchDelete(culpritFamily.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除家庭成员和社会关系成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除家庭成员和社会关系失败！", true);
		}
		return commonJsonResult;
	}

	

}
