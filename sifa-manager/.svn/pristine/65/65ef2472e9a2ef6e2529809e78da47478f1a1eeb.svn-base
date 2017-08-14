package com.rowell.sifa.web.policeCheck;

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
import com.rowell.sifa.pojo.culpritinfo.CulpritLaw;
import com.rowell.sifa.pojo.policeCheck.ExceptionInfo;
import com.rowell.sifa.service.culpritinfo.CulpritLawService;
import com.rowell.sifa.service.policeCheck.ExceptionInfoService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  法律文书Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/policeCheck/exceptionInfo")
public class ExceptionInfoController extends BaseController {

	@Autowired
	private ExceptionInfoService exceptionInfoService;

	@ModelAttribute("exceptionInfo")
	public ExceptionInfo get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return exceptionInfoService.findById(id);
		} else {
			return new ExceptionInfo();
		}
	}

	@RequestMapping(value = "traceList", method = RequestMethod.GET)
	public String forTraceList(ExceptionInfo exceptionInfo, Model model, HttpServletRequest request) {
		return "modules/policeCheck/exceptionInfo/traceList";
	}

	@RequestMapping(value = { "traceList", "" })
	@ResponseBody
	public EUDataGridResult traceList(ExceptionInfo exceptionInfo,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if(StringUtils.isBlank(exceptionInfo.getGroupId())){
			exceptionInfo.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		exceptionInfo.setExceptionType("1");
		List<ExceptionInfo> list = exceptionInfoService.findAll(exceptionInfo);

		PageInfo<ExceptionInfo> pageInfo = new PageInfo<ExceptionInfo>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	@RequestMapping(value = "actionList", method = RequestMethod.GET)
	public String forActionList(ExceptionInfo exceptionInfo, Model model, HttpServletRequest request) {
		return "modules/policeCheck/exceptionInfo/actionList";
	}

	@RequestMapping(value = { "actionList", "" })
	@ResponseBody
	public EUDataGridResult actionList(ExceptionInfo exceptionInfo,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if(StringUtils.isBlank(exceptionInfo.getGroupId())){
			exceptionInfo.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		exceptionInfo.setExceptionType("2");
		List<ExceptionInfo> list = exceptionInfoService.findAll(exceptionInfo);

		PageInfo<ExceptionInfo> pageInfo = new PageInfo<ExceptionInfo>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}


}
