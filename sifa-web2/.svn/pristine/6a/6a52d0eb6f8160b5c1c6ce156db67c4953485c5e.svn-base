
package com.rowell.sifa.web.monitoring;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
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
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.monitoring.Drift;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.monitoring.DriftService;
import com.rowell.sifa.web.base.BaseController;

/**
 * @ClassName: DriftController
 * @Description: TODO(定位漂移Controller)
 * @author pkx
 * @date 2017年3月20日
 */
@Controller
@RequestMapping(value = "/monitoring/drift")
public class DriftController extends BaseController{
	private static Logger logger = Logger.getLogger(DriftController.class); 
	@Autowired
	private DriftService driftService;
	@Autowired
	CulpritService culpritService;
	
	@ModelAttribute("drift")
	public Drift get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return driftService.findById(id);
		} else {
			return new Drift();
		}
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Drift drift, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("account", sysAccount);
		
		return "modules/monitoring/drift/driftList";
	}
	
	@RequestMapping(value = { "list", "" })
	@ResponseBody
	public EUDataGridResult list(Drift drift, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if (StringUtils.isBlank(drift.getGroupId())) {
			drift.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(drift.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(drift.getOrderStr());
		}

		List<Drift> list = driftService.findAll(drift);
		PageInfo<Drift> pageInfo = new PageInfo<Drift>(list);
		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	/***
	 * 
	    * @Title: save  
	    * @Description: 保存定位漂移  
	    * @param @param drift
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Drift drift, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, drift)) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(drift.getId())) {
				driftService.insert(drift);
				
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			} else {
				driftService.updateByIdSelective(drift);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(drift.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(@ModelAttribute("drift")Drift drift, Model model, HttpServletRequest request) {
		Drift record = driftService.findById(drift.getId());
		model.addAttribute("drift", record);
		
		return "modules/monitoring/drift/driftDetail";
	}

}
