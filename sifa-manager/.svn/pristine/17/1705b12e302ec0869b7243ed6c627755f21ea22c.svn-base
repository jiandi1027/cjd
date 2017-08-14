package com.rowell.sifa.web.investigate;

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
import com.rowell.sifa.pojo.investigate.InvestigateFamily;
import com.rowell.sifa.service.investigate.InvestigateFamilyService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  家庭及社会关系Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/investigate/investigateFamily")
public class InvestigateFamilyController extends BaseController {

	@Autowired
	private InvestigateFamilyService investigateFamilyService;

	@ModelAttribute("investigateFamily")
	public InvestigateFamily get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return investigateFamilyService.findById(id);
		} else {
			return new InvestigateFamily();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 家庭及社会关系跳转页 
	    * @param @param investigateFamily
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:investigateFamilyt:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(InvestigateFamily investigateFamily, Model model, HttpServletRequest request) {
		return "modules/investigate/investigateFamilyList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找家庭及社会关系
	    * @param @param investigateFamily
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
	public EUDataGridResult list(InvestigateFamily investigateFamily,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(investigateFamily.getOrderStr())) {
			PageHelper.orderBy("UPDATED desc");
		} else {
			PageHelper.orderBy(investigateFamily.getOrderStr());
		}

		List<InvestigateFamily> list = investigateFamilyService.findAll(investigateFamily);

		PageInfo<InvestigateFamily> pageInfo = new PageInfo<InvestigateFamily>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:investigateFamily:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("investigateFamily") InvestigateFamily investigateFamily, Model model) {

		return "modules/investigate/investigateFamilyForm";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑家庭及社会关系  
	    * @param @param investigateFamily
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:investigateFamily:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(InvestigateFamily investigateFamily, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, investigateFamily)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(investigateFamily.getId())) {
				investigateFamilyService.saveOrUpdate(investigateFamily);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存家庭及社会关系成功");
			} else {
				investigateFamilyService.updateByIdSelective(investigateFamily);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改家庭及社会关系成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(investigateFamily.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存家庭及社会关系失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改家庭及社会关系失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除家庭及社会关系  
	    * @param @param investigateFamily
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:investigateFamily:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(InvestigateFamily investigateFamily, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			investigateFamilyService.deleteById(investigateFamily.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除家庭及社会关系成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除家庭及社会关系失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除家庭及社会关系  
	    * @param @param investigateFamily
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:investigateFamily:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(InvestigateFamily investigateFamily, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			investigateFamilyService.batchDelete(investigateFamily.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除家庭及社会关系成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除家庭及社会关系失败！", true);
		}
		return commonJsonResult;
	}


}
