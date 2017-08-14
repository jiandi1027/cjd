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
import com.rowell.sifa.pojo.culpritinfo.CulpritDoc;
import com.rowell.sifa.service.culpritinfo.CulpritDocService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  文档Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/culpritinfo/culpritDoc")
public class CulpritDocController extends BaseController {

	@Autowired
	private CulpritDocService culpritDocService;

	@ModelAttribute("culpritDoc")
	public CulpritDoc get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return culpritDocService.findById(id);
		} else {
			return new CulpritDoc();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 文档跳转页 
	    * @param @param culpritDoc
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritDoct:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(CulpritDoc culpritDoc, Model model, HttpServletRequest request) {
		return "modules/sys/culpritDocList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找文档
	    * @param @param culpritDoc
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
	public EUDataGridResult list(CulpritDoc culpritDoc,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culpritDoc.getOrderStr())) {
			PageHelper.orderBy("update_date desc");
		} else {
			PageHelper.orderBy(culpritDoc.getOrderStr());
		}

		List<CulpritDoc> list = culpritDocService.findAll(culpritDoc);

		PageInfo<CulpritDoc> pageInfo = new PageInfo<CulpritDoc>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:culpritDoc:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("culpritDoc") CulpritDoc culpritDoc, Model model) {

		return "modules/sys/culpritDocForm";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑文档  
	    * @param @param culpritDoc
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritDoc:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(CulpritDoc culpritDoc, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, culpritDoc)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(culpritDoc.getId())) {
				culpritDocService.saveOrUpdate(culpritDoc);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存文档"+culpritDoc.getName()+"成功");
			} else {
				culpritDocService.updateByIdSelective(culpritDoc);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改文档"+culpritDoc.getName()+"成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(culpritDoc.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存文档"+culpritDoc.getName()+"失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改文档"+culpritDoc.getName()+"失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除文档  
	    * @param @param culpritDoc
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritDoc:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(CulpritDoc culpritDoc, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritDocService.deleteById(culpritDoc.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除文档成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除文档失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除文档  
	    * @param @param culpritDoc
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritDoc:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(CulpritDoc culpritDoc, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritDocService.batchDelete(culpritDoc.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除文档成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除文档失败！", true);
		}
		return commonJsonResult;
	}
	@RequestMapping(value = "docManager")
	public String docManager(@ModelAttribute("culpritDoc") CulpritDoc culpritDoc, Model model) {

		return "modules/dailymgr/documentManage/culpritDoc";
	}

}
