package com.rowell.sifa.common.utils;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.commons.shiro.ShiroUser;
import com.rowell.sifa.mapper.sys.SysAccountMapper;
import com.rowell.sifa.mapper.sys.SysGroupMapper;
import com.rowell.sifa.mapper.sys.SysPermissonMapper;
import com.rowell.sifa.mapper.sys.SysRoleMapper;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.pojo.sys.SysPermisson;


/**
 * 用户工具类
 * @author marcle
 * @version 2015-07-8
 */
public class SysAccountUtils {

	private static SysAccountMapper sysAccountMapper = SpringContextHolder.getBean(SysAccountMapper.class);
	private static SysRoleMapper sysRoleMapper = SpringContextHolder.getBean(SysRoleMapper.class);
	private static SysGroupMapper sysGroupMapper = SpringContextHolder.getBean(SysGroupMapper.class);
	private static SysPermissonMapper sysPermissonMapper = SpringContextHolder.getBean(SysPermissonMapper.class);

	public static final String USER_CACHE = "sysAccountCache";
	public static final String USER_CACHE_ID_ = "id_";
	public static final String USER_CACHE_LOGIN_NAME_ = "ln";
	public static final String USER_CACHE_LIST_BY_OFFICE_ID_ = "oid_";

	public static final String CACHE_ROLE_LIST = "roleList";
	public static final String CACHE_PERMISSION_LIST = "sysPermissionList";
	public static final String CACHE_AREA_LIST = "areaList";
	public static final String CACHE_OFFICE_LIST = "officeList";
	public static final String CACHE_OFFICE_ALL_LIST = "officeAllList";
	
	/**
	 * 根据ID获取用户
	 * @param id
	 * @return 取不到返回null
	 */
	public static SysAccount getSysAccountById(String id){
		SysAccount sysAccount = (SysAccount)CacheUtils.get(USER_CACHE, USER_CACHE_ID_ + id);
		if (sysAccount ==  null){
			sysAccount = sysAccountMapper.selectByPrimaryKey(id);
			if (sysAccount == null){
				return null;
			}
			CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + sysAccount.getId(), sysAccount);
			CacheUtils.put(USER_CACHE, USER_CACHE_LOGIN_NAME_ + sysAccount.getAccount(), sysAccount);
		}
		return sysAccount;
	}
	
	
	
	
	/**
	 * 根据登录名获取用户
	 * @param loginName
	 * @return 取不到返回null
	 */
	public static SysAccount getByAccount(String account){
		SysAccount sysAccount = (SysAccount)CacheUtils.get(USER_CACHE, USER_CACHE_LOGIN_NAME_ + account);
		if (sysAccount == null){
			sysAccount = sysAccountMapper.selectByAccount(account);
			if (sysAccount == null){
				return null;
			}
			//sysAccount.setSysRoleList(sysSysRoleMapper.findList(new SysRole(sysAccount)));
			CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + sysAccount.getId(), sysAccount);
			CacheUtils.put(USER_CACHE, USER_CACHE_LOGIN_NAME_ + sysAccount.getAccount(), sysAccount);
		}
		return sysAccount;
	}
//	
//	/**
//	 * 清除当前用户缓存
//	 */
//	public static void clearCache(){
//		removeCache(CACHE_ROLE_LIST);
//		removeCache(CACHE_MENU_LIST);
//		removeCache(CACHE_AREA_LIST);
//		removeCache(CACHE_OFFICE_LIST);
//		removeCache(CACHE_OFFICE_ALL_LIST);
//		SysAccountUtils.clearCache(getSysAccount());
//	}
//	
	/**
	 * 清除指定用户缓存
	 * @param sysAccount
	 */
	public static void clearSysAccountCache(SysAccount sysAccount){
		CacheUtils.remove(USER_CACHE, USER_CACHE_ID_ + sysAccount.getId());
		CacheUtils.remove(USER_CACHE, USER_CACHE_LOGIN_NAME_ + sysAccount.getAccount());
		//CacheUtils.remove(USER_CACHE, USER_CACHE_LOGIN_NAME_ + sysAccount.getOldLoginName());
	}
	

	/***
	 * 
	    * @Title: findAllChildrenGroup  
	    * @Description: 获取当组织以及子组织
	    * @param @param currentGroupId 当前用户组织
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	public static String findAllChildrenGroup(String currentGroupId){
		StringBuffer sb = new StringBuffer();
		
		List<String> groupIds = sysGroupMapper.selectAllChildrenByPidWithIds(getSysAccount().getGroupId());
		if(groupIds!=null && groupIds.size()>0){
			sb.append("'");
			for(String groupId:groupIds){
				if("'".equals(sb.toString())){
					sb.append(groupId);
				}else{
					sb.append(",").append(groupId);
				}
			}
			sb.append("'");
		}
		return sb.toString();
	}
	
	/**
	 * 获取当前用户
	 * @return 取不到返回 new SysAccount()
	 */
	public static SysAccount getSysAccount(){
		ShiroUser activeUser = getPrincipal();
		if (activeUser!=null){
			SysAccount sysAccount = getSysAccountById(activeUser.getId());
			if (sysAccount != null){
				return sysAccount;
			}
			
			return new SysAccount();
		}else{//兼容前面的暂时这样写
			// 如果没有登录，则返回实例化空的SysAccount对象。
			if(RequestContextHolder.getRequestAttributes()!=null){
				HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
				return (SysAccount)request.getSession().getAttribute(Constants.USER_SESSION);
			}else{
				return null;
			}
			
		}
		//return new SysAccount();
		
	}

//	/**
//	 * 获取当前用户角色列表
//	 * @return
//	 */
//	public static List<SysRole> getSysRoleList(){
//		@SuppressWarnings("unchecked")
//		List<SysRole> roleList = (List<SysRole>)getCache(CACHE_ROLE_LIST);
//		if (roleList == null){
//			SysAccount sysAccount = getSysAccount();
//			if (sysAccount.isAdmin()){
//				roleList = sysSysRoleMapper.findAllList(new SysRole());
//			}else{
//				SysRole role = new SysRole();
//				//role.getSqlMap().put("dsf", BaseService.dataScopeFilter(sysAccount.getCurrentSysAccount(), "o", "u"));
//				roleList = sysSysRoleMapper.findList(role);
//			}
//			putCache(CACHE_ROLE_LIST, roleList);
//		}
//		return roleList;
//	}
	
	/**
	 * 获取当前用户授权菜单
	 * @return
	 */
	public static List<SysPermisson> getSysPermissonList(){
		
		SysAccount sysAccount = getSysAccount();
		@SuppressWarnings("unchecked")
		List<SysPermisson> menuList = (List<SysPermisson>)CacheUtils.get(CACHE_PERMISSION_LIST, USER_CACHE_ID_+sysAccount.getId());
		if (menuList == null){
			
			menuList = findUserMenuPermissonList();
			
			CacheUtils.put(CACHE_PERMISSION_LIST, USER_CACHE_ID_+sysAccount.getId(), menuList);
			
		}
		return menuList;
	}
	
	
	/***
	 * 获取用户菜单操作权限
	 */
	public static List<SysPermisson> findUserMenuPermissonList() {
	    // 原始的数据
	    List<SysPermisson> rootSysPermisson;

	    if (getSysAccount().isAdmin()){
			SysPermisson sysPermisson = new SysPermisson();
			sysPermisson.setType("0");
			rootSysPermisson = sysPermissonMapper.selectAll(sysPermisson);
		}else{
			rootSysPermisson = sysPermissonMapper.selectPermissionMenusByUserId(SysAccountUtils.getSysAccount().getId());
		
		}
	    // 最后的结果
	    List<SysPermisson> SysPermissonList = new ArrayList<SysPermisson>();
	    // 先找到所有的一级菜单
	    for (int i = 0; i < rootSysPermisson.size(); i++) {
	        // 一级菜单没有parentId
	        if ("06e2e164fe4b40d4ad098b1ac1ad0dfa".equals(rootSysPermisson.get(i).getParentId())) {
	            SysPermissonList.add(rootSysPermisson.get(i));
	        }
	    }
	    // 为一级菜单设置子菜单，getChild是递归调用的
	    for (SysPermisson SysPermisson : SysPermissonList) {
	        SysPermisson.setChildSysPermisson(getChild(SysPermisson.getId(), rootSysPermisson));
	    }

	    return SysPermissonList;
	}
	
	/**
	 * 递归查找子菜单
	 * 
	 * @param id
	 *            当前菜单id
	 * @param rootSysPermisson
	 *            要查找的列表
	 * @return
	 */
	private static List<SysPermisson> getChild(String id, List<SysPermisson> rootSysPermisson) {
	    // 子菜单
	    List<SysPermisson> childList = new ArrayList<>();
	    for (SysPermisson SysPermisson : rootSysPermisson) {
	        // 遍历所有节点，将父菜单id与传过来的id比较
	        if (StringUtils.isNotBlank(SysPermisson.getParentId())) {
	            if (SysPermisson.getParentId().equals(id)) {
	                childList.add(SysPermisson);
	            }
	        }
	    }
	    // 把子菜单的子菜单再循环一遍
	    for (SysPermisson SysPermisson : childList) {// 没有url子菜单还有子菜单
	        if (StringUtils.isBlank(SysPermisson.getUrl())) {
	            // 递归
	            SysPermisson.setChildSysPermisson(getChild(SysPermisson.getId(), rootSysPermisson));
	        }
	    } // 递归退出条件
	    if (childList.size() == 0) {
	        return null;
	    }
	    return childList;
	}

	
	
//	/**
//	 * 获取当前用户有权限访问的部门
//	 * @return
//	 */
//	public static List<Dept> getOfficeList(){
//		@SuppressWarnings("unchecked")
//		List<Dept> officeList = (List<Dept>)getCache(CACHE_OFFICE_LIST);
//		if (officeList == null){
//			SysAccount sysAccount = getSysAccount();
//			if (sysAccount.isAdmin()){
//				officeList = officeDao.findAllList(new Dept());
//			}else{
//				Dept office = new Dept();
//				//office.getSqlMap().put("dsf", BaseService.dataScopeFilter(sysAccount, "a", ""));
//				officeList = officeDao.findList(office);
//			}
//			putCache(CACHE_OFFICE_LIST, officeList);
//		}
//		return officeList;
//	}
//
//	/**
//	 * 获取当前用户有权限访问的部门
//	 * @return
//	 */
//	public static List<Dept> getOfficeAllList(){
//		@SuppressWarnings("unchecked")
//		List<Dept> officeList = (List<Dept>)getCache(CACHE_OFFICE_ALL_LIST);
//		if (officeList == null){
//			officeList = officeDao.findAllList(new Dept());
//		}
//		return officeList;
//	}
	
	/**
	 * 获取授权主要对象
	 */
	public static Subject getSubject(){
		return SecurityUtils.getSubject();
	}
	
	/**
	 * 获取当前登录者对象
	 */
	public static ShiroUser getPrincipal(){
		try{
			Subject subject = SecurityUtils.getSubject();
			ShiroUser activeUser = (ShiroUser)subject.getPrincipal();
			if (activeUser != null){
				return activeUser;
			}
//			subject.logout();
		}catch (UnavailableSecurityManagerException e) {
			
		}catch (InvalidSessionException e){
			
		}
		return null;
	}
	
	public static Session getSession(){
		try{
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession(false);
			if (session == null){
				session = subject.getSession();
			}
			if (session != null){
				return session;
			}
//			subject.logout();
		}catch (InvalidSessionException e){
			
		}
		return null;
	}
	
	// ============== SysAccount Cache ==============
	
	public static Object getCache(String key) {
		return getCache(key, null);
	}
	
	public static Object getCache(String key, Object defaultValue) {
//		Object obj = getCacheMap().get(key);
		Object obj = getSession().getAttribute(key);
		return obj==null?defaultValue:obj;
	}

	public static void putCache(String key, Object value) {
//		getCacheMap().put(key, value);
		getSession().setAttribute(key, value);
	}

	public static void removeCache(String key) {
//		getCacheMap().remove(key);
		getSession().removeAttribute(key);
	}
	
//	public static Map<String, Object> getCacheMap(){
//		Principal principal = getPrincipal();
//		if(principal!=null){
//			return principal.getCacheMap();
//		}
//		return new HashMap<String, Object>();
//	}
	
	
}
