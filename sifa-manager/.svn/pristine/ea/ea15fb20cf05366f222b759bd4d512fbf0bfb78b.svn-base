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
import com.rowell.sifa.pojo.culpritinfo.CulpritLaw;
import com.rowell.sifa.service.culpritinfo.CulpritLawService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  法律文书Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/culpritLaw")
public class CulpritLawController extends BaseController {

	@Autowired
	private CulpritLawService culpritLawService;

	@ModelAttribute("culpritLaw")
	public CulpritLaw get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return culpritLawService.findById(id);
		} else {
			return new CulpritLaw();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 法律文书跳转页 
	    * @param @param culpritLaw
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritLawt:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(CulpritLaw culpritLaw, Model model, HttpServletRequest request) {
		return "modules/sys/culpritLawList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找法律文书
	    * @param @param culpritLaw
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
	public EUDataGridResult list(CulpritLaw culpritLaw,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culpritLaw.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culpritLaw.getOrderStr());
		}

		List<CulpritLaw> list = culpritLawService.findAll(culpritLaw);

		PageInfo<CulpritLaw> pageInfo = new PageInfo<CulpritLaw>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:culpritLaw:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("culpritLaw") CulpritLaw culpritLaw, Model model) {

		return "modules/sys/culpritLawForm";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑法律文书  
	    * @param @param culpritLaw
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritLaw:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(CulpritLaw culpritLaw, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, culpritLaw)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(culpritLaw.getId())) {
				culpritLawService.saveOrUpdate(culpritLaw);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存法律文书成功");
			} else {
				culpritLawService.updateByIdSelective(culpritLaw);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改法律文书成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(culpritLaw.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存法律文书失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改法律文书失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除法律文书  
	    * @param @param culpritLaw
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritLaw:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(CulpritLaw culpritLaw, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritLawService.deleteById(culpritLaw.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除法律文书成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除法律文书失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除法律文书  
	    * @param @param culpritLaw
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritLaw:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(CulpritLaw culpritLaw, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritLawService.batchDelete(culpritLaw.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除法律文书成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除法律文书失败！", true);
		}
		return commonJsonResult;
	}


}
