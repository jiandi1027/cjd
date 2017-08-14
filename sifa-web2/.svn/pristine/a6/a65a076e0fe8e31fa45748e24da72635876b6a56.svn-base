package com.rowell.sifa.web.sys;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.sys.MxCheck;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysDic;
import com.rowell.sifa.service.flow.ProcessDetailService;
import com.rowell.sifa.service.sys.MxCheckService;
import com.rowell.sifa.service.sys.SysDicService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  评定明细Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/mxCheck")
public class MxCheckController extends BaseController {
	@Autowired
	private MxCheckService mxCheckService;
	@Autowired
	private ProcessDetailService processDetailService;
	@Autowired
	private SysDicService sysDicService;

	@ModelAttribute("mxCheck")
	public MxCheck get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return mxCheckService.findById(id);
		} else {
			return new MxCheck();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 评定明细跳转页 
	    * @param @param mxCheck
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysDict:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(MxCheck mxCheck, Model model, HttpServletRequest request) {
		return "modules/sys/mxCheckList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找评定明细
	    * @param @param mxCheck
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
	public EUDataGridResult list(MxCheck mxCheck,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
//		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(mxCheck.getOrderStr())) {
			PageHelper.orderBy("dic_checktype_id asc");
		} else {
			PageHelper.orderBy(mxCheck.getOrderStr());
		}
		mxCheck.setDelFlag(0);
		mxCheck.setIsUse(1);
		List<MxCheck> list = mxCheckService.findAll(mxCheck);

		PageInfo<MxCheck> pageInfo = new PageInfo<MxCheck>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}

	// @RequiresPermissions("sys:mxCheck:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("mxCheck") MxCheck mxCheck, Model model) {

		return "modules/sys/mxCheckForm";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑评定明细  
	    * @param @param mxCheck
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:mxCheck:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(MxCheck mxCheck,String checktype, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, mxCheck)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			mxCheckService.saveMore(mxCheck, checktype);
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("保存成功");

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "保存失败！");
			commonJsonResult.setIsError(true);

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除评定明细  
	    * @param @param mxCheck
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:mxCheck:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(MxCheck mxCheck, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			mxCheckService.deleteById(mxCheck.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除评定明细成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除评定明细失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除评定明细  
	    * @param @param mxCheck
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:mxCheck:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(MxCheck mxCheck, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			mxCheckService.batchDelete(mxCheck.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除失败！", true);
		}
		return commonJsonResult;
	}

	@RequestMapping(value = "assess")
	public String assess(@ModelAttribute("mxCheck") MxCheck mxCheck, String tablename, Model model) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		
		if(!StringUtils.isBlank(mxCheck.getProcessInstanceId())){
			model.addAttribute("processDetails", processDetailService.findByProcessInsId(mxCheck.getProcessInstanceId()));
		}
		if (!StringUtils.isBlank(mxCheck.getInfoType())) {
			SysDic sysdic = new SysDic();
			if (mxCheck.getInfoType().equals("1") || mxCheck.getInfoType().equals("4")) {
				sysdic.setParentKey(Constants.ASSESS_MX_SRZL);
				model.addAttribute("columnname", "srzl");
				model.addAttribute("qtqkid", Constants.ASSESS_MX_SRZL_QTQK);
			}
			if (mxCheck.getInfoType().equals("2") || mxCheck.getInfoType().equals("3")|| mxCheck.getInfoType().equals("5") || mxCheck.getInfoType().equals("6")) {
				sysdic.setParentKey(Constants.ASSESS_MX_ZFZL);
				model.addAttribute("columnname", "zfzl");
				model.addAttribute("qtqkid", Constants.ASSESS_MX_ZFZL_QTQK);
			}
			sysdic.setOrderStr("id asc");
			List<SysDic> sysDicList = sysDicService.findAll(sysdic);
			
			mxCheck.setDelFlag(0);
			mxCheck.setIsUse(0);
			List<MxCheck> mxCheckList = mxCheckService.findAll(mxCheck);
			
			Map<String, MxCheck> map = new HashMap<String, MxCheck>();
			for (MxCheck record : mxCheckList) {
				map.put(record.getDicChecktypeId(), record);
			}
			
			model.addAttribute("sysDicList", sysDicList);
			model.addAttribute("mxCheckList", mxCheckList);
			model.addAttribute("map", map);
		}

		model.addAttribute("tablename", tablename);
		model.addAttribute("sysAccount", sysAccount);
		
		return "modules/sys/mxCheckAssess";
	}
}
