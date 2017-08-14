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
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritLaw;
import com.rowell.sifa.pojo.culpritinfo.CulpritResume;
import com.rowell.sifa.pojo.sys.EscortedPolice;
import com.rowell.sifa.pojo.sys.Scheme;
import com.rowell.sifa.service.culpritinfo.CulpritResumeService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.sys.EscortedPoliceService;
import com.rowell.sifa.service.sys.SchemeService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: EscortedPoliceController  
    * @Description: 押送民警
    * @author DELL  
    * @date 2017年5月18日  
    *
 */
@Controller
@RequestMapping(value = "/sys/escorted")
public class EscortedPoliceController extends BaseController {

	@Autowired
	private EscortedPoliceService escortedPoliceService;
	@Autowired
	private CulpritService culpritService;
	@ModelAttribute("escortedPolice")
	public EscortedPolice get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return escortedPoliceService.findById(id);
		} else {
			return new EscortedPolice();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 
	    * @param @param culpritResume
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritResumet:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(EscortedPolice escortedPolice, Model model, HttpServletRequest request) {
		return "modules/culprit/escortedPolice";
	}
	/***
	    * @Title: list  
	    * @Description: 
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
	public EUDataGridResult list(EscortedPolice escortedPolice,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(escortedPolice.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(escortedPolice.getOrderStr());
		}

		List<EscortedPolice> list = escortedPoliceService.findAll(escortedPolice);

		PageInfo<EscortedPolice> pageInfo = new PageInfo<EscortedPolice>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	/*// @RequiresPermissions("sys:culpritResume:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("scheme") Scheme scheme, Model model) {

		return "modules/sys/culpritResumeForm";
	}*/
	/***
	 * 
	    * @Title: save  
	    * @Description: 
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
	public CommonJsonResult save(EscortedPolice escortedPolice, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, escortedPolice)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(escortedPolice.getId())) {
				escortedPoliceService.saveOrUpdate(escortedPolice);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			} else {
				escortedPoliceService.updateByIdSelective(escortedPolice);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(escortedPolice.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/**//***
	 * 
	    * @Title: delete  
	    * @Description: 
	    * @param @param culpritResume
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 *//*
	// @RequiresPermissions("sys:culpritResume:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(Scheme scheme, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			schemeService.deleteById(scheme.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
	*//***
	 * 
	    * @Title: delete  
	    * @Description: 
	    * @param @param culpritResume
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 *//*
	// @RequiresPermissions("sys:culpritResume:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(Scheme scheme, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			schemeService.batchDelete(scheme.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}
	@RequestMapping(value = "addScheme")
	public String addScheme(String culpritId, Model model) {
		if(culpritId!=null&&culpritId!=""){
			Culprit culprit=culpritService.findById(culpritId);
			model.addAttribute("culprit",culprit);//罪犯信息
		}
		return "modules/culprit/scheme";
	}

	
	//打印矫正方案
	@RequestMapping(value = "printSchemePlan")
	public String printSchemePlan(@ModelAttribute("scheme") Scheme scheme, Model model) {
		model.addAttribute("scheme",scheme);
		model.addAttribute("culprit",culpritService.findById(scheme.getCulpritId()));
		return "modules/culprit/print/printSchemePlan";
	}*/
}
