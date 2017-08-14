package com.rowell.sifa.web.sys;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.sys.SysAccountService;
import com.rowell.sifa.web.base.BaseController;

/**
 * 
 * <p>Title: LoginController</p>
 * <p>Description: 登陆和退出</p>
 * <p>Company: www.itcast.com</p> 
 * @author	marcle
 * @date	2015-3-22下午4:43:26
 * @version 1.0
 */
@Controller
@RequestMapping("/sys/")
public class LoginController extends BaseController{
	
	@Autowired
	private SysAccountService sysAccountService;
	
	
	//用户登陆提交方法
	/**
	 * 
	 * <p>Title: login</p>
	 * <p>Description: </p>
	 * @param session
	 * @param randomcode 输入的验证码
	 * @param usercode 用户账号
	 * @param password 用户密码 
	 * @return
	 * @throws Exception
	 */
	/*@RequestMapping("/login")
	public String login(HttpSession session, String randomcode,String usercode,String password)throws Exception{
		
		//校验验证码，防止恶性攻击
		//从session获取正确验证码
		String validateCode = (String) session.getAttribute("validateCode");
		
		//输入的验证和session中的验证进行对比 
		if(!randomcode.equals(validateCode)){
			//抛出异常
			throw new CustomException("验证码输入错误");
		}
		
		//调用service校验用户账号和密码的正确性
		ActiveUser activeUser = sysService.authenticat(usercode, password);
		
		//如果service校验通过，将用户身份记录到session
		session.setAttribute("activeUser", activeUser);
		//重定向到商品查询页面
		return "redirect:/first.action";
	}*/
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String forLogin(HttpServletRequest request)throws Exception{
		return "modules/sys/login";
	}
	
	//登陆提交地址，和applicationContext-shiro.xml中配置的loginurl一致
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(SysAccount sysAccount,HttpServletRequest request)throws Exception{
		
		if(StringUtils.isBlank(sysAccount.getAccount())){
			return "modules/sys/login";
		}else if(StringUtils.isBlank(sysAccount.getPassword())){
			return "modules/sys/login";
		}else{
			SysAccount sysAccountEntity = sysAccountService.findByAccountAndPassword(sysAccount.getAccount(), sysAccount.getPassword());
			if(sysAccountEntity==null){
				return "modules/sys/login";
			}else{
				request.getSession().setAttribute(Constants.USER_SESSION, sysAccountEntity);
				
				return "redirect:/index";
			}
			
		}
	}
	
/*	//用户退出
	@RequestMapping("/logout")
	public String logout(HttpSession session)throws Exception{
		
		//session失效
		session.invalidate();
		//重定向到商品查询页面
		return "redirect:/first.action";
		
	}*/
	

}
