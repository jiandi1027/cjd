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
import com.rowell.sifa.pojo.culpritinfo.CulpritResume;
import com.rowell.sifa.pojo.culpritinfo.CulpritUpdateInfo;
import com.rowell.sifa.pojo.dailymgr.Study;
import com.rowell.sifa.service.culpritinfo.CulpritResumeService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.culpritinfo.CulpritUpdateInfoService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  矫正信息修改记录Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/culpritinfo/culpritUpdateInfo")
public class CulpritUpdateInfoController extends BaseController {

	@Autowired
	private CulpritUpdateInfoService culpritUpdateInfoService;
	@Autowired
	private  CulpritService culpritService;
	@ModelAttribute("culpritUpdateInfo")
	public CulpritUpdateInfo get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return culpritUpdateInfoService.findById(id);
		} else {
			return new CulpritUpdateInfo();
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
	public String forList(CulpritUpdateInfo culpritUpdateInfo, Model model, HttpServletRequest request) {
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
	public EUDataGridResult list(CulpritUpdateInfo culpritUpdateInfo,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culpritUpdateInfo.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culpritUpdateInfo.getOrderStr());
		}

		List<CulpritUpdateInfo> list = culpritUpdateInfoService.findAll(culpritUpdateInfo);

		PageInfo<CulpritUpdateInfo> pageInfo = new PageInfo<CulpritUpdateInfo>(list);

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
	public String form(@ModelAttribute("culpritUpdateInfo") CulpritUpdateInfo culpritUpdateInfo, Model model) {

		return "modules/sys/culpritResumeForm";
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
	public CommonJsonResult save(CulpritUpdateInfo culpritUpdateInfo, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, culpritUpdateInfo)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(culpritUpdateInfo.getId())) {
				culpritUpdateInfoService.saveOrUpdate(culpritUpdateInfo);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			} else {
				culpritUpdateInfoService.updateByIdSelective(culpritUpdateInfo);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改个人简历成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(culpritUpdateInfo.getId())) {
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
	public CommonJsonResult delete(CulpritUpdateInfo culpritUpdateInfo, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritUpdateInfoService.deleteById(culpritUpdateInfo.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
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
	public CommonJsonResult batchDelete(CulpritUpdateInfo culpritUpdateInfo, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritUpdateInfoService.batchDelete(culpritUpdateInfo.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}

	//档案返回修改记录页面
	@RequestMapping(value = "updateInfoDoclist", method = RequestMethod.GET)
	public String updateInfoDoclist(CulpritUpdateInfo culpritUpdateInfo,String culpritId, Model model, HttpServletRequest request) {
		model.addAttribute("culpritUpdateInfo", culpritUpdateInfo);	
		model.addAttribute("culprit", culpritService.findById(culpritId));
		return "modules/dailymgr/documentManage/culpritUpdateInfo";
	}
}
