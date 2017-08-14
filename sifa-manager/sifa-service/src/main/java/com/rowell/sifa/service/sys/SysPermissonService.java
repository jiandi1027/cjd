  
    /**    
    * @Title: SysPermissonService.java  
    * @Package com.rowell.sifa.service.sys  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年1月19日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.sys;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.rowell.common.pojo.EasyUITreeNode;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.commons.shiro.ShiroDbRealm;
import com.rowell.sifa.mapper.sys.SysPermissonMapper;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.pojo.sys.SysPermisson;
import com.rowell.sifa.service.base.CrudService;

/**  
    * @ClassName: SysPermissonService  
    * @Description: 资源操作权限service 
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class SysPermissonService extends CrudService<SysPermissonMapper, SysPermisson> {

	@Autowired
	private ShiroDbRealm shiroDbRealm;
	  
	    @Override
	public int saveOrUpdate(SysPermisson record) {
	    	// 获取父节点实体
			SysPermisson parentPermisson = this.findById(record.getParentId());
			
			if(parentPermisson!=null){
				// 设置新的父节点串
				String parentIds = "";
				if (!StringUtils.isBlank(parentPermisson.getParentIds())) {
					parentIds = parentPermisson.getParentIds() + ",";
				}
				parentIds = parentIds + record.getParentId();
				record.setParentIds(parentIds);
			}

			// 获取修改前的parentIds，用于更新子节点的parentIds
			String oldParentIds = record.getParentIds();

			
			Integer result = 0;
			// 保存或更新实体
			if (StringUtils.isBlank(record.getId())) {
				
				result = this.insert(record);
			} else {
				result = this.updateById(record);
			}

			// 更新子节点 parentIds
			SysPermisson m = new SysPermisson();
			m.setParentIds("%," + record.getId() + ",%");
			List<SysPermisson> list = dao.findByParentIdsLike(m);
			for (SysPermisson e : list) {
				e.setParentIds(e.getParentIds().replace(oldParentIds, record.getParentIds()));
				dao.updateParentIds(e);
			}
			// 清除用户菜单缓存
			 SysAccountUtils.removeCache( SysAccountUtils.CACHE_PERMISSION_LIST);
			//// // 清除权限缓存
			 shiroDbRealm.removeUserCache(SysAccountUtils.getSysAccount().getAccount());
			// // 清除日志相关缓存
			//CacheUtils.remove(SysLogUtils.CACHE_MENU_NAME_PATH_MAP);
			return result;
	}
	   

		/**  
	    * @Title: selectTree  
	    * @Description: TODO(这里用一句话描述这个方法的作用)  
	    * @param @param sysPermisson
	    * @param @return    参数  
	    * @return Object    返回类型  
	    * @throws  
	    */  
	    
	public List<SysPermisson> selectTree(SysPermisson sysPermisson) {
		//这里到时候添加权限控制
		sysPermisson.setOrderStr(" per_sort asc");
		return dao.selectAll(sysPermisson);
	}
	
	
	/***
	 * 
	    * @Title: getCountByParentId  
	    * @Description: 获取子菜单数量 
	    * @param @param parentId
	    * @param @return    参数  
	    * @return Integer    返回类型  
	    * @throws
	 */
	public Integer getCountByParentId(String parentId){
		return dao.getCountByParentId(parentId);
	}
	
	
	
	/**
	 * 
	    * @Title: getSysGroupTreeJson  
	    * @Description: 获取组织树结构
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	public String getSysPermissonTreeJson(){
		//存放转换后数据的集合  
		List<Map<String,Object>> comboTreeList  =new ArrayList<Map<String,Object>>(); 
		List<SysPermisson> list=null;
		SysPermisson sysPermission = new SysPermisson();
		sysPermission.setOrderStr(" per_sort asc");
		list = dao.selectAll(sysPermission);
		//调用方法实现角色树  
	    createComboTreeTree(list,comboTreeList);
		
		 
	      
	    //将集合转换为json输出到页面  
	    Gson gson = new Gson();  
	    String json = gson.toJson(comboTreeList);  
	    return json;
	}
	
	
	
	  
	  
	/** 
	 * 将角色封装成树开始 
	 * @param list 
	 * @param fid 父id 
	 */  
	private void createComboTreeTree(List<SysPermisson> list,List<Map<String,Object>> comboTreeList) {  
	    for (int i = 0; i < list.size(); i++) {  
	        Map<String, Object> map = null;  
	        SysPermisson sysPermisson = (SysPermisson) list.get(i);  
	        if (sysPermisson.getParentId()==null || sysPermisson.getParentId().equals("")) {  
 	            map = new HashMap<String, Object>();  
 	            //这里必须要将对象角色的id、name转换成ComboTree在页面的显示形式id、text  
 	            //ComboTree,不是数据表格，没有在页面通过columns转换数据的属性  
 	            map.put("id", list.get(i).getId());         //id  
 	            map.put("text",list.get(i).getName());      //角色名  
 	            map.put("children", createComboTreeChildren(list, sysPermisson.getId()));  
 	        }  
	       
	        if (map != null)  
	            comboTreeList.add(map);  
	    }  
	}  
	  
	  
	/** 
	 * 递归设置sysPermisson树 
	 * @param list 
	 * @param fid 
	 * @return 
	 */  
	private List<Map<String, Object>> createComboTreeChildren(List<SysPermisson> list, String fid) {  
	    List<Map<String, Object>> childList = new ArrayList<Map<String, Object>>();  
	    for (int j = 0; j < list.size(); j++) {  
	        Map<String, Object> map = null;  
	        SysPermisson treeChild = (SysPermisson) list.get(j);  
	        if (!StringUtils.isBlank(treeChild.getParentId())&&treeChild.getParentId().equals(fid)) {  
	            map = new HashMap<String, Object>();  
	            //这里必须要将对象角色的id、name转换成ComboTree在页面的显示形式id、text  
	            //ComboTree,不是数据表格，没有在页面通过columns转换数据的属性  
	            map.put("id", list.get(j).getId());  
	            map.put("text", list.get(j).getName());  
	            map.put("children", createComboTreeChildren(list, treeChild.getId()));  
	        }  
	          
	        if (map != null)  
	            childList.add(map);  
	    }  
	    return childList;  
	}  
	
	  public List<EasyUITreeNode> selectAllTree() {
	        // 获取所有的资源 tree形式，展示
	        List<EasyUITreeNode> trees = new ArrayList<EasyUITreeNode>();
	        List<SysPermisson> sysPermissons = this.findAll(new SysPermisson());
	        if (sysPermissons == null) {
	            return trees;
	        }
	        for (SysPermisson sysPermisson : sysPermissons) {
	        	EasyUITreeNode tree = new EasyUITreeNode();
	            tree.setId(sysPermisson.getId());
	            tree.setPid(sysPermisson.getParentId());
	            tree.setText(sysPermisson.getName());
	            tree.setIconCls(sysPermisson.getIcon());
//	            tree.setAttributes(sysPermisson.getUrl());
//	            tree.setState("open");
	            trees.add(tree);
	        }
	        return trees;
	    }

}
