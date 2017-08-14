package com.rowell.sifa.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.pojo.sys.SysAccount;
/**
 * 登陆拦截器
 * @author marcle
 *
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final String[] uncheckUris = {"login","logout"}; 

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		String uri = request.getServletPath();
		for(String uncheckUri:uncheckUris ){
			if(!uncheckUri.trim().equals("")&&uri.indexOf(uncheckUri)>-1){
				return true;
			}
		}
		SysAccount sysAccount = (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
		if(sysAccount==null){
			request.getRequestDispatcher("/WEB-INF/views/session_timeout.jsp").forward(request, response);
			return false;
		}else{
			return true;
		}
	}
	
}
