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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.common.pojo.EUDataGridResult;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.dailymgr.WorkFreeCulprit;
import com.rowell.sifa.pojo.dailymgr.Workfree;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.culpritinfo.CulpritService;
import com.rowell.sifa.service.dailymgr.WorkfreeCulpritService;
import com.rowell.sifa.service.dailymgr.WorkfreeService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
    * @ClassName: verbalWarningController  
    * @Description: 口头警告Controller
    * @author DELL  
    * @date 2017年3月6日  
    *
 */
@Controller
@RequestMapping(value="/dailymgr/workfree")
public class WorkfreeController extends BaseController{
	@Autowired
	private WorkfreeService workfreeService;
	@Autowired
	private CulpritService culpritService;
	@Autowired
	private WorkfreeCulpritService workFreeCulpritService;
	
	@ModelAttribute("workfree")
	public Workfree get(@RequestParam(required = false) String id){
		if(StringUtils.isNotBlank(id)){
			return workfreeService.findById(id);
		}else{
			return new Workfree();
		}
	}
	//get请求跳转页
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(Workfree workfree, Model model, HttpServletRequest request) {
		return "modules/dailymgr/workfree/workfreeList";
	}
	//post请求获取数据
	@RequestMapping(value = { "list", "" }, method = RequestMethod.POST)
	@ResponseBody
	public EUDataGridResult list(Workfree workfree,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
		PageHelper.startPage(page, getPageSize());
		if(StringUtils.isBlank(workfree.getGroupId())){
			workfree.setGroupId(SysAccountUtils.getSysAccount().getGroupId());
		}
		if (StringUtils.isBlank(workfree.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(workfree.getOrderStr());
		}
		List<Workfree> list = workfreeService.findAll(workfree);
		
		PageInfo<Workfree> pageInfo = new PageInfo<Workfree>(list);
		model.addAttribute("pager", pageInfo);
		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
		//跳转到增加页面
		@RequestMapping(value = "form")
		public String form(String id, Model model, HttpServletRequest request) {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			Workfree workfree=workfreeService.findById(id,sysAccount);
			model.addAttribute("workfree",workfree);

			return "modules/dailymgr/workfree/workfreeForm";
		}
		
		@RequestMapping(value = "formPersonal")
		public String formPersonal(String id, Model model, HttpServletRequest request) {
			Workfree workfree=workfreeService.findStudy(id);
			model.addAttribute("workfree",workfree);

			return "modules/dailymgr/workfree/workfreeFormPersonal";
		}
		
		@RequestMapping(value = "get")
		public String get(String id, Model model, HttpServletRequest request) {
			SysAccount sysAccount = SysAccountUtils.getSysAccount();
			Workfree workfree=workfreeService.findById(id,sysAccount);
			model.addAttribute("workfree",workfree);
			return "modules/dailymgr/workfree/workfreeDetail";
		}
		
		@RequestMapping(value = "getPersonal")
		public String getPersonal(String id, Model model, HttpServletRequest request) {
			Workfree workfree=workfreeService.findStudy(id);
			model.addAttribute("workfree",workfree);
			return "modules/dailymgr/workfree/workfreeDetailPersonal";
		}
		
		@RequestMapping(value = "save")
		@ResponseBody
		public CommonJsonResult save(Workfree workfree,  Model model,HttpServletRequest request) {
			CommonJsonResult commonJsonResult = null;

			try {
				if (!beanValidator(model, workfree)) {
					commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
					commonJsonResult.setIsError(true);
					writeJson(commonJsonResult);
				}

				SysAccount sysAccount = SysAccountUtils.getSysAccount();
				if(workfree.getId()!=null){
					workfree.setGroupId(sysAccount.getGroupId());
				}
				workfreeService.save(workfree,sysAccount);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存成功");

				return commonJsonResult;
			} catch (Exception e) {
				logger.error(e.getMessage());
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				return commonJsonResult;
			}
		}
		
		//档案返回学习教育页面
			@RequestMapping(value = "workfreeDoclist")
			public String workfreeDoclist(WorkFreeCulprit workFreeCulprit, Model model, HttpServletRequest request) {
				model.addAttribute("workFree", workFreeCulprit);	
				model.addAttribute("culprit", culpritService.findById(workFreeCulprit.getCulpritId()));
				return "modules/dailymgr/documentManage/workfreeDoc";
			}
			
			
			//post请求获取数据
			@RequestMapping(value = { "list1", "" }, method = RequestMethod.POST)
			@ResponseBody
			public EUDataGridResult list1(WorkFreeCulprit workFreeCulprit,
					@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response, Model model){
				PageHelper.startPage(page, getPageSize());
				if (StringUtils.isBlank(workFreeCulprit.getOrderStr())) {
					PageHelper.orderBy("updated desc");
				} else {
					PageHelper.orderBy(workFreeCulprit.getOrderStr());
				}
				List<WorkFreeCulprit> list = workFreeCulpritService.findAll(workFreeCulprit);
				
				PageInfo<WorkFreeCulprit> pageInfo = new PageInfo<WorkFreeCulprit>(list);
				model.addAttribute("pager", pageInfo);
				// 创建一个返回值对象
				EUDataGridResult result = new EUDataGridResult();
				result.setRows(list);
				// 取记录总条数
				result.setTotal(pageInfo.getTotal());
				return result;
			}
		
	
}
