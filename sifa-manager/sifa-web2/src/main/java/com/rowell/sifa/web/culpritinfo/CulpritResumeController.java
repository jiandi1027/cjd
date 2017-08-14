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
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritResume;
import com.rowell.sifa.service.culpritinfo.CulpritResumeService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  个人简历Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/culpritinfo/culpritResume")
public class CulpritResumeController extends BaseController {

	@Autowired
	private CulpritResumeService culpritResumeService;
	@Autowired
	private CulpritService culpritService;
	
	@ModelAttribute("culpritResume")
	public CulpritResume get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return culpritResumeService.findById(id);
		} else {
			return new CulpritResume();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 个人简历跳转页 
	    * @param @param culpritResume
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritResumet:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(CulpritResume culpritResume, Model model, HttpServletRequest request) {
		return "modules/sys/culpritResumeList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找个人简历
	    * @param @param culpritResume
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
	public EUDataGridResult list(CulpritResume culpritResume,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culpritResume.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culpritResume.getOrderStr());
		}

		List<CulpritResume> list = culpritResumeService.findAll(culpritResume);

		PageInfo<CulpritResume> pageInfo = new PageInfo<CulpritResume>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:culpritResume:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("culpritResume") CulpritResume culpritResume, Model model) {
		model.addAttribute("culpritResume", culpritResume);
		return "modules/dailymgr/documentManage/person/resume";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑个人简历  
	    * @param @param culpritResume
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritResume:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(@ModelAttribute("culpritResume")CulpritResume culpritResume, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, culpritResume)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(culpritResume.getId())) {
				culpritResumeService.saveOrUpdate(culpritResume);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			} else {
				culpritResumeService.updateByIdSelective(culpritResume);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(culpritResume.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除个人简历  
	    * @param @param culpritResume
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritResume:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(CulpritResume culpritResume, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritResumeService.deleteById(culpritResume.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除个人简历成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除个人简历失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除个人简历  
	    * @param @param culpritResume
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritResume:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(CulpritResume culpritResume, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritResumeService.batchDelete(culpritResume.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除个人简历成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除个人简历失败！", true);
		}
		return commonJsonResult;
	}


}
