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
import com.rowell.sifa.pojo.culpritinfo.Monitor;
import com.rowell.sifa.pojo.sys.Scheme;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.culpritinfo.MonitorService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  矫正小组Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/culpritinfo/Monitor")
public class MonitorController extends BaseController {

	@Autowired
	private MonitorService monitorService;
	
	@Autowired
	private CulpritService culpritService;
	
	@ModelAttribute("monitor")
	public Monitor get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return monitorService.findById(id);
		} else {
			return new Monitor();
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
	public String forList(Scheme scheme, Model model, HttpServletRequest request) {
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
	public EUDataGridResult list(Monitor monitor,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(monitor.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(monitor.getOrderStr());
		}

		List<Monitor> list = monitorService.findAll(monitor);

		PageInfo<Monitor> pageInfo = new PageInfo<Monitor>(list);

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
	public String form(@ModelAttribute("monitor") Monitor monitor, Model model) {
		model.addAttribute("monitor", monitor);
		return "modules/dailymgr/documentManage/person/monitor";
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
	public CommonJsonResult save(Monitor monitor, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, monitor)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(monitor.getId())) {
				monitorService.saveOrUpdate(monitor);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			} else {
				monitorService.updateByIdSelective(monitor);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(monitor.getId())) {
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
	public CommonJsonResult delete(Monitor monitor, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			monitorService.deleteById(monitor.getId());
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
	public CommonJsonResult batchDelete(Monitor monitor, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			monitorService.batchDelete(monitor.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}

		@RequestMapping(value = "addMonitor")
		public String addScheme(String culpritId, Model model) {
		if(culpritId!=null && culpritId!=""){
			Culprit culprit=culpritService.findById(culpritId);
			model.addAttribute("culprit",culprit);//罪犯信息
		}
			return "modules/culprit/monitor";
		}
	
		@RequestMapping(value = "detail")
		public String detail(@ModelAttribute("monitor")Monitor monitor, Model model) {
			model.addAttribute("monitor", monitor);
			return "modules/dailymgr/documentManage/person/monitorDetail";
		}
	

}
