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
import com.rowell.sifa.pojo.sys.SysPermisson;
import com.rowell.sifa.service.sys.SysPermissonService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  权限资源Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/sysPermisson")
public class SysPermissonController extends BaseController {

	@Autowired
	private SysPermissonService sysPermissonService;

	@ModelAttribute("sysPermisson")
	public SysPermisson get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return sysPermissonService.findById(id);
		} else {
			return new SysPermisson();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 权限资源跳转页 
	    * @param @param sysPermisson
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysPermissont:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(SysPermisson sysPermisson, Model model, HttpServletRequest request) {
		return "modules/sys/sysPermissonList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找权限资源
	    * @param @param sysPermisson
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
	public EUDataGridResult list(SysPermisson sysPermisson,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(sysPermisson.getOrderStr())) {
			PageHelper.orderBy("update_date desc");
		} else {
			PageHelper.orderBy(sysPermisson.getOrderStr());
		}

		List<SysPermisson> list = sysPermissonService.findAll(sysPermisson);

		PageInfo<SysPermisson> pageInfo = new PageInfo<SysPermisson>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:sysPermisson:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("sysPermisson") SysPermisson sysPermisson, Model model) {

		return "modules/sys/sysPermissonForm";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑权限资源  
	    * @param @param sysPermisson
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysPermisson:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(SysPermisson sysPermisson, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, sysPermisson)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(sysPermisson.getId())) {
				sysPermissonService.saveOrUpdate(sysPermisson);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存权限资源"+sysPermisson.getName()+"成功");
			} else {
				sysPermissonService.updateByIdSelective(sysPermisson);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改权限资源"+sysPermisson.getName()+"成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(sysPermisson.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存权限资源"+sysPermisson.getName()+"失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改权限资源"+sysPermisson.getName()+"失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除权限资源  
	    * @param @param sysPermisson
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysPermisson:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(SysPermisson sysPermisson, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			sysPermissonService.deleteById(sysPermisson.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除权限资源成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除权限资源失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除权限资源  
	    * @param @param sysPermisson
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysPermisson:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(SysPermisson sysPermisson, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			sysPermissonService.batchDelete(sysPermisson.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除权限资源成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除权限资源失败！", true);
		}
		return commonJsonResult;
	}


}
