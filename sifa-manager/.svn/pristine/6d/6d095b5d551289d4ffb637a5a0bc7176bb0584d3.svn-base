package com.rowell.sifa.web.culpritinfo;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.flowable.engine.runtime.ProcessInstance;
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
import com.rowell.common.pojo.EasyUITreeNode;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.culpritinfo.Culprit;
import com.rowell.sifa.pojo.culpritinfo.CulpritJudgment;
import com.rowell.sifa.pojo.culpritinfo.CulpritLaw;
import com.rowell.sifa.pojo.culpritinfo.CulpritSupervisor;
import com.rowell.sifa.pojo.dailymgr.AskLeave;
import com.rowell.sifa.pojo.inculprit.ExitEntryReport;
import com.rowell.sifa.pojo.sys.Area;
import com.rowell.sifa.pojo.sys.SysDic;
import com.rowell.sifa.pojo.sys.SysDicQuery;
import com.rowell.sifa.service.culpritinfo.CulpritJudgmentService;
import com.rowell.sifa.service.culpritinfo.CulpritLawService;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.culpritinfo.CulpritSupervisorService;
import com.rowell.sifa.service.inculprit.ExitEntryReportService;
import com.rowell.sifa.service.sys.AreaService;
import com.rowell.sifa.web.base.BaseController;
import com.rowell.sifa.web.sys.SysDicController;

/**
 *  矫正对象Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/culpritinfo/culprit")
public class CulpritController extends BaseController {

	@Autowired
	private CulpritService culpritService;
	
	@Autowired
	private AreaService areaService;
	@Autowired
	private CulpritJudgmentService culpritJudgmentService;
	@Autowired
	private CulpritLawService culpritLawService;
	@Autowired
	private CulpritSupervisorService culpritSupervisorService;
	@Autowired
	private ExitEntryReportService exitEntryReportService;
	@Autowired
	private SysDicController sysDicController;
	@ModelAttribute("culprit")
	public Culprit get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return culpritService.findById(id);
		} else {
			return new Culprit();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 矫正对象跳转页 
	    * @param @param culprit
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culpritt:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Culprit culprit, Model model, HttpServletRequest request) {
		return "modules/culprit/culpritForm";
	}
	/***
	    * @Title: list  
	    * @Description: 查找矫正对象
	    * @param @param culprit
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
	public EUDataGridResult list(Culprit culprit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culprit.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culprit.getOrderStr());
		}
		if(!StringUtils.isBlank(request.getParameter("q"))){
			culprit.setName(request.getParameter("q"));
		}
		//Integer groupId = SysAccountUtils.getSysAccount().getGroupId();
		//culprit.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		List<Culprit> list = culpritService.findAll(culprit);
		for(Culprit c : list){
			if(SysAccountUtils.getSysAccount().getGroupId().equals(c.getGroupId())){
				c.setHasPermission(1);
			}
			if(c.getCulpritJudgment()!=null){
				if(c.getCulpritJudgment().getDicCrimeTypeKey()!=null){
					SysDic s=sysDicController.getDicKey(c.getCulpritJudgment().getDicCrimeTypeKey());
					c.getCulpritJudgment().setDicCrimeTypeKey(s.getValue());
				}
				if(c.getCulpritJudgment().getDicPenalTypeKey()!=null){
					SysDic s=sysDicController.getDicKey(c.getCulpritJudgment().getDicPenalTypeKey());
					c.getCulpritJudgment().setDicPenalTypeKey(s.getValue());
				}
			}
			if(c.getDicGldxjbKey()!=null){
				SysDic s=sysDicController.getDicKey(c.getDicGldxjbKey());
				c.setDicGldxjbKey(s.getValue());
			}
		}
		PageInfo<Culprit> pageInfo = new PageInfo<Culprit>(list);

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
	    * @Description: 查找矫正对象
	    * @param @param culprit
	    * @param @param page
	    * @param @param request
	    * @param @param response
	    * @param @param model
	    * @param @return    参数  
	    * @return EUDataGridResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = { "findAll", "" })
	@ResponseBody
	public List<Culprit> findAll(Culprit culprit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(culprit.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(culprit.getOrderStr());
		}

		List<Culprit> list = culpritService.findAll(culprit);

		

		return list;
	}

	// @RequiresPermissions("sys:culprit:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("culprit") Culprit culprit, Model model) {

		return "modules/culprit/culpritAddForm";
	}
	
	// @RequiresPermissions("sys:culprit:view")
	@RequestMapping(value = "findById")
	@ResponseBody
	public Culprit findById(@ModelAttribute("culprit") Culprit culprit, Model model) {
		return culprit;
	}
	/**
	 * 
	    * @Title: findNumByGroupId  
	    * @Description: 通过组织id查找该组织下犯人数量  
	    * @param @param culprit
	    * @param @param model
	    * @param @return    参数  
	    * @return int    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "findNumByGroupId",method = RequestMethod.GET)
	@ResponseBody
	public String findNumByGroupId(Culprit culprit, Model model) {
		List<Culprit> list = culpritService.findAll(culprit);
		return culpritService.getCulpritNo(list.size()+1, culprit.getGroupId()); 
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑矫正对象  
	    * @param @param culprit
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culprit:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(Culprit culprit,CulpritJudgment culpritJudgment,CulpritLaw culpritLaw, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			if (!beanValidator(model, culprit)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(culprit.getId())) {
				culpritService.saveOrUpdate(culprit);
				String id=culprit.getId();
				culpritJudgment.setCulpritId(id);
				culpritJudgment.setId(null);
				culpritJudgmentService.saveOrUpdate(culpritJudgment);

				culpritLaw.setCulpritId(id);
				culpritLaw.setId(null);
				culpritLawService.saveOrUpdate(culpritLaw);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存矫正对象"+culprit.getName()+"成功");
			} else {
				culpritService.updateByIdSelective(culprit);
				CulpritJudgment findJudg = new CulpritJudgment();
				findJudg.setCulpritId(culprit.getId());
				List<CulpritJudgment> judgList=culpritJudgmentService.findAll(findJudg);
				if(judgList.size()>0){
					culpritJudgment.setId(judgList.get(0).getId());
					culpritJudgmentService.updateByIdSelective(culpritJudgment);
				}else{
					String id=culprit.getId();
					culpritJudgment.setCulpritId(id);
					culpritJudgment.setId(null);
					culpritJudgmentService.saveOrUpdate(culpritJudgment);
				}
				CulpritLaw findLaw = new CulpritLaw();
				findLaw.setCulpritId(culprit.getId());
				List<CulpritLaw> lawList=culpritLawService.findAll(findLaw);
				if(lawList.size()>0){
					culpritLaw.setId(lawList.get(0).getId());
					culpritLawService.updateByIdSelective(culpritLaw);
				}else{
					String id=culprit.getId();
					culpritLaw.setCulpritId(id);
					culpritLaw.setId(null);
					culpritLawService.saveOrUpdate(culpritLaw);
				}
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改矫正对象"+culprit.getName()+"成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(culprit.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存矫正对象"+culprit.getName()+"失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改矫正对象"+culprit.getName()+"失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除矫正对象  
	    * @param @param culprit
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culprit:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(Culprit culprit, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritService.deleteById(culprit.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除矫正对象成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除矫正对象失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除矫正对象  
	    * @param @param culprit
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:culprit:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(Culprit culprit, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			culpritService.batchDelete(culprit.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除矫正对象成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除矫正对象失败！", true);
		}
		return commonJsonResult;
	}
	/**
	 * 
	    * @Title: findAreaByLevel  
	    * @Description: 根据地区等级或者地区上次id查询地区名字
	    * @param @param areaLevel
	    * @param @param areaParent
	    * @param @return    参数  
	    * @return List<Area>    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "findAreaByLevel")
	@ResponseBody
	public List<Area> findAreaByLevel(String areaLevel,String areaParent){
		Area area = new Area();
		area.setAreaLevel(areaLevel);
		area.setAreaParent(areaParent);
		List<Area> list = areaService.findAll(area);
		return list;
	}
	@RequestMapping(value = "detail")
	public String detail(@ModelAttribute("culprit") Culprit culprit, Model model) {
		model.addAttribute("culprit",culprit);//罪犯信息
//		CulpritJudgment culpritJudgment = new CulpritJudgment();
//		culpritJudgment.setCulpritId(culprit.getId());
//		model.addAttribute("culpritJudgment", culpritJudgmentService.findAll(culpritJudgment).get(0));
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		return "modules/culprit/culpritDetail";
	}
	@RequestMapping(value = "deal")
	public String deal(@ModelAttribute("culprit") Culprit culprit, Model model) {
		model.addAttribute("culprit",culprit);//罪犯信息
//		CulpritJudgment culpritJudgment = new CulpritJudgment();
//		culpritJudgment.setCulpritId(culprit.getId());
//		model.addAttribute("culpritJudgment", culpritJudgmentService.findAll(culpritJudgment).get(0));
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		return "modules/culprit/culpritApply";
	}
	@RequestMapping(value = "saveSupervisor")
	@ResponseBody
	public CommonJsonResult saveSupervisor(CulpritSupervisor culpritSupervisor){
		CommonJsonResult commonJsonResult = null;
		try {
			if (StringUtils.isBlank(culpritSupervisor.getId())) {
				culpritSupervisorService.saveOrUpdate(culpritSupervisor);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");
			} else {
				culpritSupervisorService.updateByIdSelective(culpritSupervisor);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(culpritSupervisor.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	//测试用
	@RequestMapping(value = "update")
	public String update(@ModelAttribute("culprit") Culprit culprit, Model model) {
		model.addAttribute("culprit",culprit);//罪犯信息
//		CulpritJudgment culpritJudgment = new CulpritJudgment();
//		culpritJudgment.setCulpritId(culprit.getId());
//		model.addAttribute("culpritJudgment", culpritJudgmentService.findAll(culpritJudgment).get(0));
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		return "modules/dailymgr/documentManage/documentManage";
	}
	//矫正对象基本信息
	@RequestMapping(value = "information")
	public String information(@ModelAttribute("culprit") Culprit culprit, Model model) {
		if(culprit.getCulpritJudgment()!=null){
			model.addAttribute("culpritJudgment",culprit.getCulpritJudgment());
		}
		ExitEntryReport exitEntryReport = new  ExitEntryReport();
		exitEntryReport.setCulpritId(culprit.getId());
		List<ExitEntryReport> reportList=exitEntryReportService.findAll(exitEntryReport);
		if(reportList.size()>0){
			model.addAttribute("exitEntryReport",reportList.get(0));
		}
		CulpritSupervisor culpritSupervisor=new CulpritSupervisor();
		culpritSupervisor.setCulpritId(culprit.getId());
		List<CulpritSupervisor> culpritSupervisorList =culpritSupervisorService.findAll(culpritSupervisor);
		if(culpritSupervisorList.size()>0){
			model.addAttribute("culpritSupervisor",culpritSupervisorList.get(0));
		}
		model.addAttribute("culprit",culprit);//罪犯信息
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		return "modules/dailymgr/documentManage/information";
	}
	@RequestMapping(value = "person")
	public String person(@ModelAttribute("culprit") Culprit culprit, Model model) {
		if(culprit.getCulpritJudgment()!=null){
			model.addAttribute("culpritJudgment",culprit.getCulpritJudgment());
		}
		model.addAttribute("culprit",culprit);//罪犯信息
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		return "modules/dailymgr/documentManage/person";
	}
	@RequestMapping(value = "culpritLaw")
	public String culpritLaw(@ModelAttribute("culprit") Culprit culprit, Model model) {
		if(culprit.getCulpritJudgment()!=null){
			model.addAttribute("culpritJudgment",culprit.getCulpritJudgment());
		}
		model.addAttribute("culprit",culprit);//罪犯信息
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		return "modules/dailymgr/documentManage/culpritLaw";
	}
	@RequestMapping(value = "culpritJudgment")
	public String culpritJudgment(@ModelAttribute("culprit") Culprit culprit, Model model) {
		if(culprit.getCulpritJudgment()!=null){
			model.addAttribute("culpritJudgment",culprit.getCulpritJudgment());
		}
		model.addAttribute("culprit",culprit);//罪犯信息
		CulpritLaw culpritLaw = new CulpritLaw();
		culpritLaw.setCulpritId(culprit.getId());
		List<CulpritLaw> list=culpritLawService.findAll(culpritLaw);
		if (list.size() > 0) {
			model.addAttribute("culpritLaw",list.get(0));
		}
		return "modules/dailymgr/documentManage/culpritJudgment";
	}
}
