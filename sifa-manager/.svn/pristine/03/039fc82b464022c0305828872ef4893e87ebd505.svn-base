package com.rowell.sifa.web.sys;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rowell.sifa.web.base.BaseController;


@Controller
public class IndexController extends BaseController{
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
