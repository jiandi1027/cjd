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
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysRole;
import com.rowell.sifa.service.sys.SysRoleService;
import com.rowell.sifa.web.base.BaseController;

/**
 *  角色Controller
 * 
 * @author marcle
 * @version 2015-07-8
 */
@Controller
@RequestMapping(value = "/sys/sysRole")
public class SysRoleController extends BaseController {

	@Autowired
	private SysRoleService sysRoleService;

	@ModelAttribute("sysRole")
	public SysRole get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return sysRoleService.findById(id);
		} else {
			return new SysRole();
		}
	}
	/***
	 * 
	    * @Title: forList  
	    * @Description: 角色跳转页 
	    * @param @param sysRole
	    * @param @param model
	    * @param @param request
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysRolet:view")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String forList(SysRole sysRole, Model model, HttpServletRequest request) {
		SysAccount sysAccount = SysAccountUtils.getSysAccount();
		model.addAttribute("sysAccount", sysAccount);
		return "modules/sys/sysRoleList";
	}
	/***
	    * @Title: list  
	    * @Description: 查找角色
	    * @param @param sysRole
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
	public EUDataGridResult list(SysRole sysRole,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		PageHelper.startPage(page, getPageSize());
		if (StringUtils.isBlank(sysRole.getOrderStr())) {
			PageHelper.orderBy("id asc");
		} else {
			PageHelper.orderBy(sysRole.getOrderStr());
		}

		List<SysRole> list = sysRoleService.findAll(sysRole);

		PageInfo<SysRole> pageInfo = new PageInfo<SysRole>(list);

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
	    * @Description: 查找角色用于下来选择
	    * @param @param sysRole
	    * @param @param page
	    * @param @param request
	    * @param @param response
	    * @param @param model
	    * @param @return    参数  
	    * @return EUDataGridResult    返回类型  
	    * @throws
	 */
	@RequestMapping(value = { "findAllForSelect"})
	@ResponseBody
	public List<SysRole> findAllForSelect(SysRole sysRole, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		if(!StringUtils.isBlank(request.getParameter("q"))){
			sysRole.setName(request.getParameter("q"));
		}
		List<SysRole> list = sysRoleService.findAll(sysRole);
		if(list!=null){
			list.add(0, new SysRole());
		}
		return list;
	}
	/***
	 * 
	    * @Title: save  
	    * @Description: 编辑角色  
	    * @param @param sysRole
	    * @param @param request
	    * @param @param model
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysRole:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public CommonJsonResult save(SysRole sysRole, HttpServletRequest request, Model model,
			RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;

		try {
			if (!beanValidator(model, sysRole)) {
				commonJsonResult = CommonJsonResult.build(505, "编辑数据失败");
				commonJsonResult.setIsError(true);
				writeJson(commonJsonResult);
			}

			if (StringUtils.isBlank(sysRole.getId())) {
				sysRoleService.saveOrUpdate(sysRole);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("保存角色"+sysRole.getName()+"成功");
			} else {
				sysRoleService.updateByIdSelective(sysRole);
				commonJsonResult = CommonJsonResult.ok();
				commonJsonResult.setMsg("修改角色"+sysRole.getName()+"成功");
			}

			return commonJsonResult;
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (StringUtils.isBlank(sysRole.getId())) {
				commonJsonResult = CommonJsonResult.build(505, "保存角色"+sysRole.getName()+"失败！");
				commonJsonResult.setIsError(true);
			} else {
				commonJsonResult = CommonJsonResult.build(505, "修改角色"+sysRole.getName()+"失败！");
				commonJsonResult.setIsError(true);
			}

			return commonJsonResult;
		}
	}
	/***
	 * 
	    * @Title: delete  
	    * @Description: 删除角色  
	    * @param @param sysRole
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysRole:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public CommonJsonResult delete(SysRole sysRole, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			sysRoleService.deleteById(sysRole.getId());
			commonJsonResult = CommonJsonResult.build(200, "删除角色成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除角色失败！", true);
		}
		return commonJsonResult;
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
	public SysRole findById(SysRole sysRole, Model model) {
		return sysRole;
	}
	/**
     * 授权页面页面根据角色查询资源
     *
     * @param id
     * @return
     */
    @RequestMapping("/findPermissionIdListByRoleId")
    @ResponseBody
    public Object findPermissionIdListByRoleId(String id) {
        List<String> resources = sysRoleService.selectPermissionIdListByRoleId(id);
        return renderSuccess(resources);
    }
	@RequestMapping(value = "grantPage")
	public String grantPage(@ModelAttribute("sysRole")SysRole sysRole, Model model) {
		
		return "modules/sys/roleGrant";
	} /**
     * 授权
    *
    * @param id
    * @param resourceIds
    * @return
    */
   @RequestMapping("/grant")
   @ResponseBody
   public Object grant(String id, String permissionIds) {
	   try {
		sysRoleService.updateRolePermission(id, permissionIds);
		return renderSuccess("授权成功！");
	} catch (Exception e) {
		return renderError("授权失败！");
	}
   }

	
	
	
	/***
	 * 
	    * @Title: delete  
	    * @Description: 批量删除角色  
	    * @param @param sysRole
	    * @param @param redirectAttributes
	    * @param @return    参数  
	    * @return CommonJsonResult    返回类型  
	    * @throws
	 */
	// @RequiresPermissions("sys:sysRole:edit")
	@RequestMapping(value = "batchDelete")
	@ResponseBody
	public CommonJsonResult batchDelete(SysRole sysRole, RedirectAttributes redirectAttributes) {
		CommonJsonResult commonJsonResult = null;
		try {
			sysRoleService.batchDelete(sysRole.getIds());
			commonJsonResult = CommonJsonResult.build(200, "删除角色成功！", false);
		} catch (Exception e) {
			logger.error(e.getMessage());
			commonJsonResult = CommonJsonResult.build(505, "删除角色失败！", true);
		}
		return commonJsonResult;
	}
	
	// @RequiresPermissions("sys:sysAccount:view")
		@RequestMapping(value = "form")
		public String form(@ModelAttribute("sysRole") SysRole sysRole, Model model) {

			return "modules/sys/sysRoleForm";
		}


}
