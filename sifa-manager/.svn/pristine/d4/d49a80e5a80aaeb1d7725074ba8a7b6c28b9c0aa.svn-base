
package com.rowell.sifa.sys.utils;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.method.HandlerMethod;

import com.rowell.common.utils.Exceptions;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SpringContextHolder;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.sys.SysLogMapper;
import com.rowell.sifa.mapper.sys.SysPermissonMapper;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysLog;
import com.rowell.sifa.pojo.sys.SysPermisson;

/**
 * 日志工具类
 * @author marcle
 * @version 2015-07-8
 */
public class SysLogUtils {
	
	public static final String CACHE_PERMISSION_LIST = "sysPermissionList";
	
	private static SysLogMapper sysLogMapper = SpringContextHolder.getBean(SysLogMapper.class);
	private static SysPermissonMapper sysPermissionMapper = SpringContextHolder.getBean(SysPermissonMapper.class);
	
	/**
	 * 保存日志
	 */
	public static void saveSysLog(HttpServletRequest request, String title){
		saveSysLog(request, null, null, title);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static String getParams(HttpServletRequest request){
		Map<String,String[]> map=request.getParameterMap();  
		StringBuffer sb = new StringBuffer();
		int k=0;
		 //遍历  
		  for(Iterator iter=map.entrySet().iterator();iter.hasNext();){  
		        Map.Entry element=(Map.Entry)iter.next();  
		        //key值  
		        Object strKey = element.getKey();  
		        //value,数组形式  
		      String[] value=(String[])element.getValue();  
		  
		     StringBuffer values = new StringBuffer();
		     for(int i=0;i<value.length;i++){  
		    	 if(i==0){
		    		 values.append(value[i]); 
		    	 }else{
		    		 values.append(",").append(value[i]); 
		    	 }
		    	
		     }   
		     if(k==0){
		    	 sb.append(strKey.toString()+"="+values);
		     }else{
		    	 sb.append(";").append(strKey.toString()+"="+values);
		     }
		     k++;
		    
		  }
		  return sb.toString();
	}
	
	/**
	 * 保存日志
	 */
	public static void saveSysLog(HttpServletRequest request, Object handler, Exception ex, String title){
		SysAccount sysUser = SysAccountUtils.getSysAccount();
		//System.out.println(request.getRequestURI());
		if (sysUser != null && sysUser.getId() != null){
			SysLog sysLog = new SysLog();
			
			sysLog.setTitle(title);
			sysLog.setType(ex == null ? SysLog.TYPE_ACCESS : SysLog.TYPE_EXCEPTION);
			
			sysLog.setRemoteAddr(StringUtils.getRemoteAddr(request));
			sysLog.setUserAgent(request.getHeader("sysUser-agent"));
			sysLog.setRequestUri(request.getRequestURI());
			sysLog.setParams(getParams(request));
			sysLog.setMethod(request.getMethod());
			// 异步保存日志
			String contextPath = request.getContextPath();
			String rootUrl = request.getRequestURI().substring(contextPath.length()+1);
			new SaveSysLogThread(sysLog, handler, ex,rootUrl).start();
		}
	}
	
	
	public static void saveSysLog(SysLog sysLog){
		if(!SysAccount.isAdmin(SysAccountUtils.getSysAccount().getId())){
			new SaveSysLogThread(sysLog).start();
		}
		
	}

	/**
	 * 保存日志线程
	 */
	public static class SaveSysLogThread extends Thread{
		
		private SysLog sysLog;
		private Object handler;
		private Exception ex;
		private String rootUrl;
		
		public SaveSysLogThread(SysLog sysLog, Object handler, Exception ex,String rootUrl){
			super(SaveSysLogThread.class.getSimpleName());
			this.sysLog = sysLog;
			this.handler = handler;
			this.ex = ex;
			this.rootUrl = rootUrl;
		}
		public SaveSysLogThread(SysLog sysLog){
			super(SaveSysLogThread.class.getSimpleName());
			this.sysLog = sysLog;
		}
		
		@Override
		public void run() {
			// 获取日志标题
			if (StringUtils.isBlank(sysLog.getTitle())){
				String permission = "";
				if (handler instanceof HandlerMethod){
					Method m = ((HandlerMethod)handler).getMethod();
					RequiresPermissions rp = m.getAnnotation(RequiresPermissions.class);
					permission = (rp != null ? StringUtils.join(rp.value(), ",") : "");
				}
				sysLog.setTitle(getSysPermissionNamePath(sysLog.getRequestUri(), permission,rootUrl));
			}
			// 如果有异常，设置异常信息
			sysLog.setException(Exceptions.getStackTraceAsString(ex));
			// 如果无标题并无异常日志，则不保存信息
			if (StringUtils.isBlank(sysLog.getTitle()) && StringUtils.isBlank(sysLog.getException())){
				return;
			}
			// 保存日志信息
			sysLog.setCurrentSysUser(SysAccountUtils.getSysAccount());
			sysLog.preInsert();
			sysLogMapper.insert(sysLog);
		}
	}

	/**
	 * 获取菜单名称路径（如：系统设置-机构用户-用户管理-编辑）
	 */
	public static String getSysPermissionNamePath(String requestUri, String permission,String rootUrl){
		//String href = StringUtils.substringAfter(requestUri, Global.getAdminPath());
		String href = rootUrl;
		List<String> names = new ArrayList<String>();
		SysPermisson sysPermisson = sysPermissionMapper.findByUrl(href);
		if(sysPermisson!=null){
			names.add(sysPermisson.getName());
			getParentName(sysPermisson.getParentId(),names);
		}
		StringBuffer sb = new StringBuffer();
		if(names.size()>0){
		
			int num = names.size()-1;
			for(int i=num;i>=0;i--){
				if(i!=0){
					sb.append(names.get(i)).append("-");
				}else{
					sb.append(names.get(i));
				}
				
			}
			//return sb.toString();
			
		}
		return sb.toString();
		
		
	}

	
	 /***
     * 
        * @Title: getParentName  
        * @Description: 递归获取名称
        * @param @param id
        * @param @param names    参数  
        * @return void    返回类型  
        * @throws
     */
    public static void getParentName(String id,List<String> names){
    	SysPermisson sysPermisson = sysPermissionMapper.selectByPrimaryKey(id);
    	if(sysPermisson!=null){
    		names.add(sysPermisson.getName());
    		
    		getParentName(sysPermisson.getParentId(),names);
    	}
    	
    }

	
}
