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
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.sys.SysGroupService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  组织Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/sysGroup")
public class SysGroupController extends BaseController {

	@Autowired
	private SysGroupService sysGroupService;

	@ModelAttribute("sysGroup")
	public SysGroup get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return sysGroupService.findById(id);
		} else {
			return new SysGroup();
		}
	}
	
	 /**
     * 部门列表
     *
     * @return
     */
    @RequestMapping("/treeGrid")
    @ResponseBody
    public List<SysGroup> treeGrid(@ModelAttribute("sysGroup")SysGroup sysGroup) {
        return sysGroupService.findAll(sysGroup);
    }
	/***
	 * 
	    * @Title: forList  
	    * @Description: 组织跳转页 
	    * @param @param sysGroup
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysGroupt:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(SysGroup sysGroup, Model model, HttpServletRequest request) {
		return "modules/sys/sysGroupList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找组织
	    * @param @param sysGroup
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
	public EUDataGridResult list(SysGroup sysGroup,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, Integer.MAX_VALUE);
		if (StringUtils.isBlank(sysGroup.getOrderStr())) {
			PageHelper.orderBy("updated desc");
		} else {
			PageHelper.orderBy(sysGroup.getOrderStr());
		}

		List<SysGroup> list = sysGroupService.findAll(sysGroup);

		PageInfo<SysGroup> pageInfo = new PageInfo<SysGroup>(list);

		model.addAttribute("pager", pageInfo);

		// 创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		// 取记录总条数
		result.setTotal(pageInfo.getTotal());

		return result;
	}
	
	/***
	    * @Title: findById  
	    * @Description: 通过编号查询部门返回json数据  
	    * @param @param sysGroup
	    * @param @param model
	    * @param @return    参数  
	    * @return SysGroup    返回类型  
	    * @throws
	 */
	@RequestMapping(value = "findById")
	@ResponseBody
	public SysGroup findById(SysGroup sysGroup, Model model) {
		return sysGroup;
	}

	// @RequiresPermissions("sys:sysGroup:view")
	@RequestMapping(value = "form")
	public String form(@ModelAttribute("sysGroup") SysGroup sysGroup, Model model) {

		return "modules/sys/sysGroupForm";
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑组织  
	    * @param @param sysGroup
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysGroup:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(SysGroup sysGroup, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, sysGroup)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(sysGroup.getId())) {
				sysGroupService.saveOrUpdate(sysGroup);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存组织"+sysGroup.getName()+"成功");
			} else {
				sysGroupService.updateByIdSelective(sysGroup);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改组织"+sysGroup.getName()+"成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(sysGroup.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存组织"+sysGroup.getName()+"失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改组织"+sysGroup.getName()+"失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除组织  
	    * @param @param sysGroup
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysGroup:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(SysGroup sysGroup, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			sysGroupService.deleteById(sysGroup.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除组织成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除组织失败！", true);
		}
		return commonJsonResult;
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除组织  
	    * @param @param sysGroup
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysGroup:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(SysGroup sysGroup, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			sysGroupService.batchDelete(sysGroup.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除组织成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除组织失败！", true);
		}
		return commonJsonResult;
	}
	
	/** 
	 * 返回 treeGrid(树形表格)需要的json格式数据 
	 * 前端调用的就是这个方法 
	 */  
	@RequestMapping(value = "loadGroupTree")
	@ResponseBody
	public String loadGroupTree(HttpServletResponse response,HttpServletRequest request){  
	        //得到所有角色  
		Integer isAll=0;
		if(!StringUtils.isBlank(request.getParameter("isAll"))){
			isAll = Integer.parseInt(request.getParameter("isAll"));
		}
	    String json = sysGroupService.getSysGroupTreeJson(isAll);  
	      
//	    try {  
//	    	response.getWriter().print(json);  
//	    	response.getWriter().flush();  
//	    	response.getWriter().close();  
//	    }catch (IOException e) {  
//	        e.printStackTrace();  
//	    }     

	    return json;  
	}  


}
