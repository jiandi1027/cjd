package com.rowell.sifa.web.dailymgr;

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
import com.rowell.sifa.pojo.dailymgr.Inspection;
import com.rowell.sifa.pojo.dailymgr.InspectionSub;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.dailymgr.InspectionService;
import com.rowell.sifa.service.dailymgr.InspectionSubService;
import com.rowell.sifa.service.sys.SysGroupService;
import com.rowell.sifa.web.base.BaseController;

@Controller
@RequestMapping(value = "/dailymgr/inspection")
public class InspectionController extends BaseController {
	@Autowired
	private InspectionService inspectionService;
	@Autowired
	private InspectionSubService inspectionSubService;
	@Autowired
	private SysGroupService sysGroupService;
	
	
	@ModelAttribute("inspection")
	public Inspection get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return inspectionService.findById(id);
		} else {
			return new Inspection();
		}
	}
	
	
	/***
	 * 
	    * @Title: forList  
	    * @Description: 集中点验跳转页 
	    * @param @param inspection
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Inspection inspection, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		SysGroup sysGroup = sysGroupService.findById(sysAccount.getGroupId());
		model.addAttribute("sysGroup", sysGroup);
		
		return "modules/dailymgr/inspection/inspectionList";
	}
	
	
	/***
	    * @Title: list  
	    * @Description: 查找集中点验
	    * @param @param inspection
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
	public EUDataGridResult list(Inspection inspection,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if (StringUtils.isBlank(inspection.getGroupidsStr())) {
			inspection.setGroupidsStr(SysAccountUtils.getSysAccount().getGroupId());
		}
		
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(inspection.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(inspection.getOrderStr());
		}

		List<Inspection> list = inspectionService.findAll(inspection);
		PageInfo<Inspection> pageInfo = new PageInfo<Inspection>(list);

		model.addAttribute("pager", pageInfo);
		
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		SysGroup sysGroup = sysGroupService.findById(sysAccount.getGroupId());
		model.addAttribute("sysGroup", sysGroup);
		
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	

	/***
	 * 
	    * @Title: forList  
	    * @Description: 集中点验跳转页 
	    * @param @param inspection
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Inspection inspection, Model model, HttpServletRequest request) {
		return "modules/dailymgr/inspection/inspectionAdd";
	}
	
	
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑集中点验
	    * @param @param inspection
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Inspection inspection, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, inspection)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			inspectionService.insert(inspection);
			
			commonJsonResult = CommonJsonResult.ok();
			commonJsonResult.setMsg("新增成功");

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "新增失败！");
			commonJsonResult.setIsError(true);

			return commonJsonResult;
		}
	}
	
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("inspection") Inspection inspection, Model model) {
		model.addAttribute("inspection", inspection);
		
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		SysGroup sysGroup = sysGroupService.findById(sysAccount.getGroupId());
		if (sysGroup.getLevelNo() == 2) {
			model.addAttribute("sysAccount", sysAccount);
			
			InspectionSub inspectionSub = new InspectionSub();
			inspectionSub.setGroupId(sysAccount.getGroupId());
			inspectionSub.setInspectionId(inspection.getId());
			
			List<InspectionSub> list = inspectionSubService.findAll(inspectionSub);
			if (list.size() > 0) {
				model.addAttribute("inspectionSub", list.get(0));
			}
			
			return "modules/dailymgr/inspection/inspectionSfsDetail";
		}
		else return "modules/dailymgr/inspection/inspectionDetail";
	}
	
	@RequestMapping(value = "deal")
	public String deal(@ModelAttribute("inspection") Inspection inspection, Model model) {
		model.addAttribute("inspection", inspection);
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		
		InspectionSub inspectionSub = new InspectionSub();
		inspectionSub.setGroupId(sysAccount.getGroupId());
		inspectionSub.setInspectionId(inspection.getId());
		
		List<InspectionSub> list = inspectionSubService.findAll(inspectionSub);
		if (list.size() > 0) {
			model.addAttribute("inspectionSub", list.get(0));
		}
		

		return "modules/dailymgr/inspection/inspectionDeal";
	}
	
}
