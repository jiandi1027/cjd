package com.rowell.sifa.web.dailymgr;

import java.util.Date;
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
import com.rowell.sifa.pojo.dailymgr.HelpDifficulty;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.HelpDifficultyService;
import com.rowell.sifa.web.base.BaseController;

/**  
    * @ClassName: AskLeaveController  
    * @Description: 帮困解难(这里用一句话描述这个类的作用)  
    * @author yxb
    * @date 2017年3月1日  
    *    
    */
@Controller
@RequestMapping(value = "/dailymgr/helpDifficulty")
public class HelpDifficultyController extends BaseController {
	@Autowired
	HelpDifficultyService helpDifficultyService;
	@Autowired
	private CulpritService culpritService;
 
	@ModelAttribute("helpDifficulty")
	public HelpDifficulty get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return helpDifficultyService.findById(id);
		} else {
			return new HelpDifficulty();
		}
	}

	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(HelpDifficulty helpDifficulty, Model model, HttpServletRequest request) {
		
		return "/modules/dailymgr/helpDifficulty/helpDifficultyList";
	}
	
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("helpDifficulty") HelpDifficulty helpDifficulty, Model model) {
		if(helpDifficulty.getId() != null && "".equals(helpDifficulty.getId())){
			model.addAttribute("helpDifficulty", helpDifficultyService.findById(helpDifficulty.getId()));	
			request.setAttribute("culprit", culpritService.findById(helpDifficulty.getCulpritId()));
		}
	
		return "/modules/dailymgr/helpDifficulty/helpDifficultyForm";
	}
	

	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(HelpDifficulty helpDifficulty,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		List<HelpDifficulty> list = helpDifficultyService.findAll(helpDifficulty);
		PageInfo<HelpDifficulty> pageInfo = new PageInfo<HelpDifficulty>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	

	
	// @RequiresPermissions("dailymgr:askLeave:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(HelpDifficulty helpDifficulty, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (StringUtils.isBlank(helpDifficulty.getId())) {
				helpDifficulty.setModifiedTime(new Date());
				helpDifficultyService.insert(helpDifficulty);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			} else {
				helpDifficultyService.updateById(helpDifficulty);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			commonJsonResult = CommonJsonResult.build(505, "操作失败！");
			commonJsonResult.setIsError(true);

			return commonJsonResult;
		}
	}

	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("helpDifficulty") HelpDifficulty helpDifficulty, Model model,HttpServletRequest request) {
		model.addAttribute("helpDifficulty", helpDifficultyService.findById(helpDifficulty.getId()));	
		request.setAttribute("culprit", culpritService.findById(helpDifficulty.getCulpritId()));
		return "/modules/dailymgr/helpDifficulty/helpDifficultyDetails";
	}

	

}
