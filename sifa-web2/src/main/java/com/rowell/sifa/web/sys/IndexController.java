package com.rowell.sifa.web.sys;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.pojo.sys.SysPermisson;
import com.rowell.sifa.pojo.sys.SysRolePermission;
import com.rowell.sifa.service.homepage.ExaminationAndApprovalService;
import com.rowell.sifa.service.homepage.WorkRemindService;
import com.rowell.sifa.service.sys.SysPermissonService;
import com.rowell.sifa.service.sys.SysRolePermissionService;
import com.rowell.sifa.web.base.BaseController;


@Controller
public class IndexController extends BaseController{
//	@Autowired
//	public SysPermissonService sysPermissonService; 
//	@Autowired
//	public SysRolePermissionService sysRolePermissonService; 
	@Autowired
	public WorkRemindService workRemindService;
	@Autowired
	public ExaminationAndApprovalService examinationAndApprovalService;
	//欢迎页面
	@RequestMapping("/index.html")
	public String homeindex(Model model)throws Exception{
        return "modules/homeindex/index";
		
	}
	
	//系统首页
	//@RequiresPermissions("sys.user.view")
	@RequestMapping("/index")
	public String index(Model model)throws Exception{
		
//		//从shiro的session中取activeUser
//		Subject subject = SecurityUtils.getSubject();
//		//取身份信息
//		ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
//		//通过model传到页面
//		model.addAttribute("activeUser", activeUser);
		
//		SysRolePermission sysRolePermission = new SysRolePermission();
//		sysRolePermission.setRoleId(SysAccountUtils.getSysAccount().getRoleId());
////		List<SysRolePermission> sysRolePermissonList = sysRolePermissonService.findAll(sysRolePermission);
//		
//		SysPermisson record = new SysPermisson();
//		record.setOrderStr("");
//		record.setRoleId(SysAccountUtils.getSysAccount().getRoleId());
//		List<SysPermisson> sysPermissonList = sysPermissonService.findAll(record);
//		model.addAttribute("list", sysPermissonList);
		int allAmountWorkRemind=workRemindService.findAllAmount();
		int allAmountExamAndApp=examinationAndApprovalService.findAllAmount();
		model.addAttribute("allAmountWorkRemind", allAmountWorkRemind);
		model.addAttribute("allAmountExamAndApp", allAmountExamAndApp);
		model.addAttribute("allAmountHomePage", allAmountWorkRemind+allAmountExamAndApp);
		return "/index";
	}
	
	//欢迎页面
	@RequestMapping("/north")
	public String north(Model model)throws Exception{
		
		return "/north";
		
	}
	//欢迎页面
	@RequestMapping("/south")
	public String sourth(Model model)throws Exception{
		
		return "/south";
		
	}
	//欢迎页面
	@RequestMapping("/center")
	public String center(Model model)throws Exception{
		
		return "/center";
		
	}
	//欢迎页面
	@RequestMapping("/west")
	public String west(Model model)throws Exception{
		
		return "/west";
		
	}
}	
