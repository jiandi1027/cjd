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
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysLog;
import com.rowell.sifa.service.sys.SysLogService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  角色Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/sysLog")
public class SysLogController extends BaseController {

	@Autowired
	private SysLogService sysLogService;

	@ModelAttribute("sysLog")
	public SysLog get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return sysLogService.findById(id);
		} else {
			return new SysLog();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 角色跳转页 
	    * @param @param sysLog
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysLogt:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(SysLog sysLog, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/sys/sysLogList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找角色
	    * @param @param sysLog
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
	public EUDataGridResult list(SysLog sysLog,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(sysLog.getOrderStr())) {
			PageHelper.orderBy("id asc");
		} else {
			PageHelper.orderBy(sysLog.getOrderStr());
		}

		List<SysLog> list = sysLogService.findAll(sysLog);

		PageInfo<SysLog> pageInfo = new PageInfo<SysLog>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	
	
	
	/***
	    * @Title: findById  
	    * @Description: 通过编号查询部门返回json数据  
	    * @param @param sysGroup
	    * @param @param model
	    * @param @return    参数  
	    * @return SysGroup    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "findById")
	@ResponseBody
	public SysLog findById(SysLog sysLog, Model model) {
		return sysLog;
	}
	
	
	
	
	
	// @RequiresPermissions("sys:sysAccount:view")
		@RequestMapping(value = "form")
		public String form(@ModelAttribute("sysLog") SysLog sysLog, Model model) {

			return "modules/sys/sysLogForm";
		}


}
