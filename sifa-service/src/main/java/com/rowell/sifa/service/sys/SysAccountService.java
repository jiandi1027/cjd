  
    /**    
    * @Title: SysAccountService.java  
    * @Package com.rowell.sifa.service.sys  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.sys;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.common.pojo.EasyUITreeNode;
import com.rowell.sifa.mapper.sys.SysAccountMapper;
import com.rowell.sifa.pojo.sys.SysAccount;
import com.rowell.sifa.service.base.CrudService;

/**  
    * @ClassName: SysAccountService  
    * @Description:  帐号表service 
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class SysAccountService extends CrudService<SysAccountMapper, SysAccount> {
	
	
	/***
	 * 
	    * @Title: selectByAccountAndPassword  
	    * @Description: 根据账号和密码查找用户
	    * @param @param account
	    * @param @param password
	    * @param @return    参数  
	    * @return SysAccount    返回类型  
	    * @throws
	 */
	public SysAccount findByAccountAndPassword(String account,String password){
		return dao.selectByAccountAndPassword(account, password);
	}
	
	/***
	 * 
	    * @Title: selectByAccount  
	    * @Description: 根据账号查找用户
	    * @param @param account
	    * @param @return    参数  
	    * @return SysAccount    返回类型  
	    * @throws
	 */
	public SysAccount selectByAccount(String account){
		return dao.selectByAccount(account);
	}

	  




	    


	public List<EasyUITreeNode> getSysGroupTreeJson() {
		List<SysAccount> list = dao.selectAll(new SysAccount());
		List<EasyUITreeNode> easyUITreeNodes = new  ArrayList<EasyUITreeNode>();
	
		if(list!=null && list.size()>0){
			for(SysAccount serverManager:list){
				EasyUITreeNode easyUITreeNode = new EasyUITreeNode();
				easyUITreeNode.setId(serverManager.getId());
				easyUITreeNode.setText(serverManager.getAccountname());
				//easyUITreeNode.setState("open");
				easyUITreeNodes.add(easyUITreeNode);
			}
		}
		return easyUITreeNodes;
	}


	  

}
