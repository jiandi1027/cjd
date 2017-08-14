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
import com.rowell.sifa.pojo.sys.SysPerson;
import com.rowell.sifa.service.sys.SysPersonService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  帐号Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/sysPerson")
public class SysPersonController extends BaseController {

	@Autowired
	private SysPersonService sysPersonService;

	@ModelAttribute("sysPerson")
	public SysPerson get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return sysPersonService.findById(id);
		} else {
			return new SysPerson();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 工作人员跳转页 
	    * @param @param sysPerson
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysDict:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(SysPerson sysPerson, Model model, HttpServletRequest request) {
		return "modules/sys/sysPersonList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找工作人员
	    * @param @param sysPerson
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
	public EUDataGridResult list(SysPerson sysPerson,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(sysPerson.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(sysPerson.getOrderStr());
		}

		List<SysPerson> list = sysPersonService.findAll(sysPerson);

		PageInfo<SysPerson> pageInfo = new PageInfo<SysPerson>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:sysPerson:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("sysPerson") SysPerson sysPerson, Model model) {

		return "modules/sys/sysPersonForm";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑工作人员  
	    * @param @param sysPerson
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysPerson:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(SysPerson sysPerson, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, sysPerson)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(sysPerson.getId())) {
				sysPersonService.saveOrUpdate(sysPerson);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存工作人员" + sysPerson.getName() + "成功");
			} else {
				sysPersonService.updateByIdSelective(sysPerson);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改工作人员" + sysPerson.getName() + "成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(sysPerson.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存工作人员" + sysPerson.getName() + "失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改工作人员" + sysPerson.getName() + "失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除工作人员  
	    * @param @param sysPerson
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysPerson:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(SysPerson sysPerson, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			sysPersonService.deleteById(sysPerson.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除工作人员成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除工作人员失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除工作人员  
	    * @param @param sysPerson
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysPerson:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(SysPerson sysPerson, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			sysPersonService.batchDelete(sysPerson.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除工作人员成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除工作人员失败！", true);
		}
		return commonJsonResult;
	}

	@RequestMapping(value = "findSfsPerson")
	@ResponseBody
	public List<SysPerson> findSfsPerson(String type, Model model) {
		return sysPersonService.findSfsPerson(type);
	}
}
