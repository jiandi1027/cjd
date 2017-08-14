package com.rowell.sifa.web.flow;

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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.pojo.flow.ProcessDetail;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  工作流详情Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/flow/processDetail")
public class ProcessDetailController extends BaseController {

	@Autowired
	private ProcessDetailService processDetailService;

	@ModelAttribute("processDetail")
	public ProcessDetail get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return processDetailService.findById(id);
		} else {
			return new ProcessDetail();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 工作人员跳转页 
	    * @param @param processDetail
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysDict:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(ProcessDetail processDetail, Model model, HttpServletRequest request) {
		return "modules/sys/processDetailList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找工作人员
	    * @param @param processDetail
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
	public EUDataGridResult list(ProcessDetail processDetail,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(processDetail.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(processDetail.getOrderStr());
		}

		List<ProcessDetail> list = processDetailService.findAll(processDetail);

		PageInfo<ProcessDetail> pageInfo = new PageInfo<ProcessDetail>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	/***
	    * @Title: list  
	    * @Description: 查找工作人员
	    * @param @param processDetail
	    * @param @param page
	    * @param @param request
	    * @param @param response
	    * @param @param model
	    * @param @return    参数  
	    * @return EUDataGridResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = { "instanceDetail"})
	@ResponseBody
	public EUDataGridResult instanceDetail(ProcessDetail processDetail,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if(StringUtils.isBlank(processDetail.getProcessId())){
			return new EUDataGridResult();
		}
		//暂时全部显示
		PageHelper.startPage(page, Integer.MAX_VALUE);
		if (StringUtils.isBlank(processDetail.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(processDetail.getOrderStr());
		}

		List<ProcessDetail> list = processDetailService.findAll(processDetail);

		PageInfo<ProcessDetail> pageInfo = new PageInfo<ProcessDetail>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	/***
	    * @Title: list  
	    * @Description: 查找角色用于下来选择
	    * @param @param sysRole
	    * @param @param page
	    * @param @param request
	    * @param @param response
	    * @param @param model
	    * @param @return    参数  
	    * @return EUDataGridResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = { "findAllForSelect"})
	@ResponseBody
	public List<ProcessDetail> findAllForSelect(ProcessDetail processDetail, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(1, 10);
		List<ProcessDetail> list = processDetailService.findAll(processDetail);
		if(list!=null){
			list.add(0, new ProcessDetail());
		}
		return list;
	}

	// @RequiresPermissions("sys:processDetail:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("processDetail") ProcessDetail processDetail, Model model) {

		return "modules/sys/processDetailForm";
	}
	
}
