package com.rowell.sifa.web.dailymgr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.pojo.dailymgr.InspectionDeal;
import com.rowell.sifa.pojo.dailymgr.InspectionSub;
import com.rowell.sifa.service.dailymgr.InspectionDealService;
import com.rowell.sifa.service.dailymgr.InspectionSubService;
import com.rowell.sifa.web.base.BaseController;

@Controller
@RequestMapping(value = "/dailymgr/inspectionDeal")
public class InspectionDealController extends BaseController {
	@Autowired
	private InspectionDealService inspectionDealService;
	@Autowired
	private InspectionSubService inspectionSubService;
	
	
	@ModelAttribute("inspectionDeal")
	public InspectionDeal get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return inspectionDealService.findById(id);
		} else {
			return new InspectionDeal();
		}
	}
	
	
	/***
	    * @Title: list  
	    * @Description: 查找集中点验
	    * @param @param inspectionDeal
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
	public EUDataGridResult list(InspectionDeal inspectionDeal, //@RequestParam(value = "inspectionId", required = true, defaultValue = "") String inspectionId,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
//		if (StringUtils.isBlank(inspectionId)) {
//			inspectionDeal.setInspectionId(inspectionId);
//		}
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(inspectionDeal.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(inspectionDeal.getOrderStr());
		}

		List<InspectionDeal> list = inspectionDealService.findAll(inspectionDeal);
		PageInfo<InspectionDeal> pageInfo = new PageInfo<InspectionDeal>(list);

		model.addAttribute("pager", pageInfo);
		
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	@RequestMapping(value = "deal")
	@ResponseBody
	public CommonJsonResult deal(InspectionDeal inspectionDeal, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			InspectionSub inspectionSub = inspectionSubService.findById(inspectionDeal.getInspectionSubId());
			if (inspectionSub.getRealCount() != null) {
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("点验结束");

				return commonJsonResult;
			}
			//日常报到
			
			//

			List<InspectionDeal> list = inspectionDealService.findAll(inspectionDeal);
			inspectionDealService.updateDeal(list);
			
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("点验成功");

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "点验失败！");
			commonJsonResult.setIsError(true);

			return commonJsonResult;
		}
	}
	
}
