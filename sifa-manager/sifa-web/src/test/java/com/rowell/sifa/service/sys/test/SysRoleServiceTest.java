  
    /**    
    * @Title: SysRoleServiceTest.java  
    * @Package com.rowell.sifa.service.sys.test  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年2月14日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.sys.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.rowell.sifa.pojo.sys.SysRole;
import com.rowell.sifa.service.sys.SysRoleService;

/**  
    * @ClassName: SysRoleServiceTest  
    * @Description: TODO(这里用一句话描述这个类的作用)  
    * @author xiaoguang  
    * @date 2017年2月14日  
    *    
    */

public class SysRoleServiceTest extends BaseJunit4Test{
	@Autowired
	private SysRoleService sysRoleService;
	@Test
	public void findAllTest(){
		List<SysRole> sysRoles = sysRoleService.findAll(new SysRole());
		for(SysRole sysRole:sysRoles){
			System.out.println(sysRole.getId());
		}
		System.out.println(sysRoles.size());
	}
	@Test
	public void deleteTest(){
		List<String> ids = new ArrayList<String>();
		ids.add("ceef7f746aad44ea9abf3d75bbde5297");
		
		sysRoleService.batchDelete(ids);
	}

}
