
/**    
* @Title: SysRoleService.java  
* @Package com.rowell.sifa.service.sys  
* @Description: TODO(用一句话描述该文件做什么)  
* @author xiaoguang  
* @date 2017年1月19日  
* @version V1.0    
*/

package com.rowell.sifa.service.sys;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.Constants;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.sys.SysAccountRoleMapper;
import com.rowell.sifa.mapper.sys.SysRoleMapper;
import com.rowell.sifa.mapper.sys.SysRolePermissionMapper;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.pojo.sys.SysRole;
import com.rowell.sifa.pojo.sys.SysRolePermission;
import com.rowell.sifa.service.base.CrudService;

/**
 * @ClassName: SysRoleService
 * @Description: 工作人员service
 * @author xiaoguang
 * @date 2017年1月19日
 * 
 */
@Service
@Transactional(readOnly = true)
public class SysRoleService extends CrudService<SysRoleMapper, SysRole> {
	@Autowired
	private SysAccountRoleMapper sysAccountRoleMapper;
	@Autowired
	private SysRolePermissionMapper sysRolePermissionMapper;

	/***
	 * 
	 * @Title: selectResourceMapByUserId @Description:
	 * 通过用户编号获取用户权限和角色信息 
	 * @param 
	 * @param userId 
	 * @param 
	 * @return 参数
	 *  @return
	 * Map<String,Set<String>> 返回类型 @throws
	 */
	public Map<String, Set<String>> selectResourceMapByUserId(String userId) {
		if(Constants.ADMIN_ID.equals(userId)){//判断是否管理员，管理员做特殊处理
			
		}
		Map<String, Set<String>> resourceMap = new HashMap<String, Set<String>>();
		//List<String> roleIdList = sysAccountRoleMapper.selectRoleIdListByAccountId(userId);
		Set<String> urlSet = new HashSet<String>();
		Set<String> roles = new HashSet<String>();
//		for (String roleId : roleIdList) {
//			List<Map<String, String>> resourceList = dao.selectPermissionListByRoleId(roleId);
//			if (resourceList != null) {
//				for (Map<String, String> map : resourceList) {
//					if (StringUtils.isNotBlank(map.get("url"))) {
//						urlSet.add(map.get("url"));
//					}
//				}
//			}
//			SysRole role = dao.selectByPrimaryKey(roleId);
//			if (role != null) {
//				roles.add(role.getEname());
//			}
//		}
		SysAccount sysAccount = SysAccountUtils.getSysAccountById(userId);
		if(!StringUtils.isBlank(sysAccount.getRoleId())){
			List<Map<String, String>> resourceList = dao.selectPermissionListByRoleId(sysAccount.getRoleId());
			if (resourceList != null) {
				for (Map<String, String> map : resourceList) {
					if (StringUtils.isNotBlank(map.get("URL"))) {
						urlSet.add(map.get("URL"));
					}
				}
			}
			SysRole role = dao.selectByPrimaryKey(sysAccount.getRoleId());
			if (role != null) {
				roles.add(role.getEname());
			}
			resourceMap.put("urls", urlSet);
			resourceMap.put("roles", roles);
		}
		
		return resourceMap;
	}

	  
	    /**  
	    * @Title: updateRolePermission  
	    * @Description: 更新角色权限信息
	    * @param @param id
	    * @param @param resourceIds    参数  
	    * @return void    返回类型  
	    * @throws  
	    */  
	    
	public void updateRolePermission(String roleId, String resourceIds) {
		  // 先删除后添加,有点爆力
		SysRolePermission sysRolePermission = null;
		
		sysRolePermissionMapper.deleteByRoleId(roleId);
        String[] resourceIdArray = resourceIds.split(",");
        for (String permissionId : resourceIdArray) {
        	sysRolePermission = new SysRolePermission();
        	sysRolePermission.setRoleId(roleId);
        	sysRolePermission.setPermissionId(permissionId);
        	sysRolePermission.setCurrentSysUser(SysAccountUtils.getSysAccount());
        	sysRolePermission.preInsert();
        	sysRolePermissionMapper.insert(sysRolePermission);
        }
		
	}


		  
		    /**  
		    * @Title: selectResourceIdListByRoleId  
		    * @Description: 根据角色获取资源
		    * @param @param id
		    * @param @return    参数  
		    * @return List<String>    返回类型  
		    * @throws  
		    */  
		    
		public List<String> selectPermissionIdListByRoleId(String roleId) {
			// TODO Auto-generated method stub
			return dao.selectPermissionIdListByRoleId(roleId);
		}

}
