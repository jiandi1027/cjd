package com.rowell.sifa.web.sys;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.rowell.sifa.pojo.sys.IfaceRecord;
import com.rowell.sifa.service.sys.IfaceRecordService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  考勤记录Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/ifaceRecord")
public class IfaceRecordController extends BaseController {

	@Autowired
	private IfaceRecordService ifaceRecordService;

	@ModelAttribute("ifaceRecord")
	public IfaceRecord get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return ifaceRecordService.findById(id);
		} else {
			return new IfaceRecord();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 考勤记录跳转页 
	    * @param @param ifaceRecord
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysDict:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(IfaceRecord ifaceRecord, Model model, HttpServletRequest request) {
		return "modules/sys/ifaceRecordList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找考勤记录
	    * @param @param ifaceRecord
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
	public EUDataGridResult list(IfaceRecord ifaceRecord,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(ifaceRecord.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(ifaceRecord.getOrderStr());
		}

		List<IfaceRecord> list = ifaceRecordService.findAll(ifaceRecord);

		PageInfo<IfaceRecord> pageInfo = new PageInfo<IfaceRecord>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:ifaceRecord:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("ifaceRecord") IfaceRecord ifaceRecord, Model model) {

		return "modules/sys/ifaceRecordForm";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑考勤记录  
	    * @param @param ifaceRecord
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:ifaceRecord:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(IfaceRecord ifaceRecord, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, ifaceRecord)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(ifaceRecord.getId())) {
				ifaceRecordService.saveOrUpdate(ifaceRecord);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存考勤记录成功");
			} else {
				ifaceRecordService.updateByIdSelective(ifaceRecord);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改考勤记录成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(ifaceRecord.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存考勤记录失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改考勤记录失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除考勤记录  
	    * @param @param ifaceRecord
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:ifaceRecord:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(IfaceRecord ifaceRecord, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			ifaceRecordService.deleteById(ifaceRecord.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除考勤记录成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除考勤记录失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除考勤记录  
	    * @param @param ifaceRecord
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:ifaceRecord:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(IfaceRecord ifaceRecord, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			ifaceRecordService.batchDelete(ifaceRecord.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除考勤记录成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除考勤记录失败！", true);
		}
		return commonJsonResult;
	}


}
