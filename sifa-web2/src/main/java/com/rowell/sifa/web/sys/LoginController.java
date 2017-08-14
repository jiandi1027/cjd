package com.rowell.sifa.web.sys;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rowell.common.pojo.CommonJsonResult;
import com.rowell.sifa.commons.shiro.captcha.DreamCaptcha;
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
	@Autowired
	private DreamCaptcha dreamCaptcha;
	
	
	 /**
     * GET 登录
     * @return {String}
     */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        logger.info("GET请求登录");
        if (SecurityUtils.getSubject().isAuthenticated()) {
            return "redirect:/index";
        }
        return "login";
    }

	/**
     * GET 登录
     * @return {String}
     */
	@RequestMapping(value = "/login2", method = RequestMethod.GET)
    public String login2() {
        logger.info("GET请求登录");
        if (SecurityUtils.getSubject().isAuthenticated()) {
            return "redirect:/index";
        }
        return "login2";
    }
	
	/**
     * GET 登录
     * @return {String}
     */
	@RequestMapping(value = "welcome", method = RequestMethod.GET)
    public String welcome() {
        logger.info("跳转welcome页面");
        return "welcome";
    }
	
	/**
     * GET 登录
     * @return {String}
     */
	@RequestMapping(value = "index.html", method = RequestMethod.GET)
    public String homeindex() {
        logger.info("跳转homeindex页面");
        return "modules/homeindex/homeindex.html";
    }
	
//    /**
//     * POST 登录 shiro 写法
//     *
//     * @param username 用户名
//     * @param password 密码
//     * @return {Object}
//     */
//    @RequestMapping(value = "/login", method = RequestMethod.POST)
//    @ResponseBody
//    public CommonJsonResult loginPost(HttpServletRequest request, HttpServletResponse response,
//            String username, String password, String captcha, 
//            @RequestParam(value = "rememberMe", defaultValue = "1") Integer rememberMe) {
//        logger.info("POST请求登录");
//        CommonJsonResult result = new CommonJsonResult();
//        // 改为全部抛出异常，避免ajax csrf token被刷新
//        if (StringUtils.isBlank(username)) {
//        	result.setIsError(true);
//        	result.setMsg("用户名不能为空");
//        	return result;
//            //throw new RuntimeException("用户名不能为空");
//        }
//        if (StringUtils.isBlank(password)) {
//        	result.setIsError(true);
//        	result.setMsg("密码不能为空");
//        	return result;
//            //throw new RuntimeException("密码不能为空");
//        }
////        if (StringUtils.isBlank(captcha)) {
////        	result.setIsError(true);
////        	result.setMsg("验证码不能为空");
////            //throw new RuntimeException("验证码不能为空");
////        }
////        if (!dreamCaptcha.validate(request, response, captcha)) {
////        	result.setIsError(true);
////        	result.setMsg("验证码错误");
////            //throw new RuntimeException("验证码错误");
////        }
//        Subject user = SecurityUtils.getSubject();
//        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
//        // 设置记住密码
//        token.setRememberMe(1 == rememberMe);
//        try {
//            user.login(token);
//            result.setSuccess(true);
//            return result;
//        } catch (UnknownAccountException e) {
//        	result.setIsError(true);
//        	result.setMsg("账号不存在！");
//        	return result;
//            //throw new RuntimeException("账号不存在！", e);
//        } catch (DisabledAccountException e) {
//        	result.setIsError(true);
//        	result.setMsg("账号未启用！");
//        	return result;
//            //throw new RuntimeException("账号未启用！", e);
//        } catch (IncorrectCredentialsException e) {
//        	result.setIsError(true);
//        	result.setMsg("密码错误！");
//        	return result;
//            //throw new RuntimeException("密码错误！", e);
//        } catch (Throwable e) {
//        	result.setIsError(true);
//        	result.setMsg(e.getMessage());
//        	return result;
//            //throw new RuntimeException(e.getMessage(), e);
//        }
//    }
	
	/**
     * POST 登录 shiro 写法 测试U盾登录用
     *
     * @param username 用户名
     * @param password 密码
     * @return {Object}
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public CommonJsonResult loginPost(HttpServletRequest request, HttpServletResponse response,
            String username, String password, String captcha, String uKey, 
            @RequestParam(value = "type", defaultValue = "0") String type,
            @RequestParam(value = "rememberMe", defaultValue = "1") Integer rememberMe) {
    	if (type.equals("1")) {
    		logger.info("U盾请求登录");
		}
        logger.info("POST请求登录");
        CommonJsonResult result = new CommonJsonResult();
        // 改为全部抛出异常，避免ajax csrf token被刷新
        if (StringUtils.isBlank(username)) {
        	result.setIsError(true);
        	result.setMsg("用户名不能为空");
        	return result;
            //throw new RuntimeException("用户名不能为空");
        }
        if (StringUtils.isBlank(password)) {
        	result.setIsError(true);
        	result.setMsg("密码不能为空");
        	return result;
            //throw new RuntimeException("密码不能为空");
        }
        if (type.equals("1")) {
        	if (StringUtils.isBlank(uKey)) {
            	result.setIsError(true);
            	result.setMsg("未检测到U盾或U盾插入接触异常");
            	return result;
            }
		}

        Subject user = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        // 设置记住密码
        token.setRememberMe(1 == rememberMe);
        try {
            user.login(token);
            if (type.equals("1")) {
				SysAccount account = new SysAccount();
				account.setAccountname(username);
				account.setPassword(password);
				account.setDogStr(uKey);
				List<SysAccount> list = sysAccountService.findAll(account);
				if (list.size() > 0) {
					result.setSuccess(true);
				}
				else {
		        	result.setIsError(true);
		        	result.setMsg("U盾与该用户不匹配！");
				}
			}
            else result.setSuccess(true);
            
            return result;
        } catch (UnknownAccountException e) {
        	result.setIsError(true);
        	result.setMsg("账号不存在！");
        	return result;
            //throw new RuntimeException("账号不存在！", e);
        } catch (DisabledAccountException e) {
        	result.setIsError(true);
        	result.setMsg("账号未启用！");
        	return result;
            //throw new RuntimeException("账号未启用！", e);
        } catch (IncorrectCredentialsException e) {
        	result.setIsError(true);
        	result.setMsg("密码错误！");
        	return result;
            //throw new RuntimeException("密码错误！", e);
        } catch (Throwable e) {
        	result.setIsError(true);
        	result.setMsg(e.getMessage());
        	return result;
            //throw new RuntimeException(e.getMessage(), e);
        }
    }

    /**
     * 未授权
     * @return {String}
     */
    @RequestMapping(value = "/unauth", method = RequestMethod.GET)
    public String unauth() {
        if (SecurityUtils.getSubject().isAuthenticated() == false) {
            return "redirect:/login";
        }
        return "unauth";
    }

    /**
     * 退出
     * @return {Result}
     */
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    @ResponseBody
    public Object logout() {
        logger.info("登出");
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return renderSuccess();
    }
	

}
