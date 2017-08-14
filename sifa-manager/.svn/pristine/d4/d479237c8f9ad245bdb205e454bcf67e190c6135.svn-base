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
import com.rowell.sifa.pojo.sys.IfaceMachine;
import com.rowell.sifa.service.sys.IfaceMachineService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  考勤机设备Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/ifaceMachine")
public class IfaceMachineController extends BaseController {

	@Autowired
	private IfaceMachineService ifaceMachineService;

	@ModelAttribute("ifaceMachine")
	public IfaceMachine get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return ifaceMachineService.findById(id);
		} else {
			return new IfaceMachine();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 考勤机设备跳转页 
	    * @param @param ifaceMachine
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysDict:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(IfaceMachine ifaceMachine, Model model, HttpServletRequest request) {
		return "modules/sys/ifaceMachineList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找考勤机设备
	    * @param @param ifaceMachine
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
	public EUDataGridResult list(IfaceMachine ifaceMachine,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(ifaceMachine.getOrderStr())) {
			PageHelper.orderBy("update_date desc");
		} else {
			PageHelper.orderBy(ifaceMachine.getOrderStr());
		}

		List<IfaceMachine> list = ifaceMachineService.findAll(ifaceMachine);

		PageInfo<IfaceMachine> pageInfo = new PageInfo<IfaceMachine>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:ifaceMachine:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("ifaceMachine") IfaceMachine ifaceMachine, Model model) {

		return "modules/sys/ifaceMachineForm";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑考勤机设备  
	    * @param @param ifaceMachine
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:ifaceMachine:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(IfaceMachine ifaceMachine, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, ifaceMachine)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(ifaceMachine.getId())) {
				ifaceMachineService.saveOrUpdate(ifaceMachine);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存考勤机设备"+ifaceMachine.getMacName()+"成功");
			} else {
				ifaceMachineService.updateByIdSelective(ifaceMachine);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改考勤机设备"+ifaceMachine.getMacName()+"成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(ifaceMachine.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存考勤机设备"+ifaceMachine.getMacName()+"失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改考勤机设备"+ifaceMachine.getMacName()+"失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除考勤机设备  
	    * @param @param ifaceMachine
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:ifaceMachine:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(IfaceMachine ifaceMachine, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			ifaceMachineService.deleteById(ifaceMachine.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除考勤机设备成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除考勤机设备失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除考勤机设备  
	    * @param @param ifaceMachine
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:ifaceMachine:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(IfaceMachine ifaceMachine, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			ifaceMachineService.batchDelete(ifaceMachine.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除考勤机设备成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除考勤机设备失败！", true);
		}
		return commonJsonResult;
	}


}
