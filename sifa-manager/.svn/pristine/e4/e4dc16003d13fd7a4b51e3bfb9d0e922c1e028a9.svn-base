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
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.service.culpritinfo.CulpritJudgmentService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  判决信息Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/culpritJudgment")
public class CulpritJudgmentController extends BaseController {

	@Autowired
	private CulpritJudgmentService culpritJudgmentService;

	@ModelAttribute("culpritJudgment")
	public CulpritJudgment get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return culpritJudgmentService.findById(id);
		} else {
			return new CulpritJudgment();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 判决信息跳转页 
	    * @param @param culpritJudgment
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritJudgmentt:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(CulpritJudgment culpritJudgment, Model model, HttpServletRequest request) {
		return "modules/sys/culpritJudgmentList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找判决信息
	    * @param @param culpritJudgment
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
	public EUDataGridResult list(CulpritJudgment culpritJudgment,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culpritJudgment.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culpritJudgment.getOrderStr());
		}

		List<CulpritJudgment> list = culpritJudgmentService.findAll(culpritJudgment);

		PageInfo<CulpritJudgment> pageInfo = new PageInfo<CulpritJudgment>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:culpritJudgment:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("culpritJudgment") CulpritJudgment culpritJudgment, Model model) {

		return "modules/sys/culpritJudgmentForm";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑判决信息  
	    * @param @param culpritJudgment
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritJudgment:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(CulpritJudgment culpritJudgment, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, culpritJudgment)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(culpritJudgment.getId())) {
				culpritJudgmentService.saveOrUpdate(culpritJudgment);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存判决信息成功");
			} else {
				culpritJudgmentService.updateByIdSelective(culpritJudgment);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改判决信息成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(culpritJudgment.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存判决信息失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改判决信息失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除判决信息  
	    * @param @param culpritJudgment
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritJudgment:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(CulpritJudgment culpritJudgment, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritJudgmentService.deleteById(culpritJudgment.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除判决信息成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除判决信息失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除判决信息  
	    * @param @param culpritJudgment
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritJudgment:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(CulpritJudgment culpritJudgment, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritJudgmentService.batchDelete(culpritJudgment.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除判决信息成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除判决信息失败！", true);
		}
		return commonJsonResult;
	}


}
