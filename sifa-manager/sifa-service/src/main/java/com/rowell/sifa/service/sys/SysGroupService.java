  
    /**    
    * @Title: SysGroupService.java  
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

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.sys.SysGroupMapper;
import com.rowell.sifa.pojo.sys.SysGroup;
import com.rowell.sifa.service.base.CrudService;

/**  
    * @ClassName: SysGroupService  
    * @Description: 组织表service
    * @author xiaoguang  
    * @date 2017年1月19日  
    *    
    */
@Service
@Transactional(readOnly = true)
public class SysGroupService extends CrudService<SysGroupMapper, SysGroup> {
	
	/**
	 * 
	    * @Title: getSysGroupTreeJson  
	    * @Description: 获取组织树结构
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	public String getSysGroupTreeJson(){
		return getSysGroupTreeJson(0);
	}
	
	/**
	 * 
	    * @Title: getSysGroupTreeJson  
	    * @Description: 获取组织树结构
	    * @param @return    参数  
	    * @return String    返回类型  
	    * @throws
	 */
	public String getSysGroupTreeJson(Integer isAll){
		//存放转换后数据的集合  
		List<Map<String,Object>> comboTreeList  =new ArrayList<Map<String,Object>>(); 
		List<SysGroup> list=null;
		if(isAll!=null && isAll==1){
			list = dao.selectAll(new SysGroup());
			//调用方法实现角色树  
		    createComboTreeTree(list,comboTreeList,null);
		}else{
			list = dao.selectAllChildrenByPid(SysAccountUtils.getSysAccount().getGroupId());
			
			 //调用方法实现角色树  
		    createComboTreeTree(list,comboTreeList,SysAccountUtils.getSysAccount().getGroupId()); 
		}
		
		 
	      
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
	private void createComboTreeTree(List<SysGroup> list,List<Map<String,Object>> comboTreeList,String parentGroupId) {  
	    for (int i = 0; i < list.size(); i++) {  
	        Map<String, Object> map = null;  
	        SysGroup sysGroup = (SysGroup) list.get(i);  
	        if(parentGroupId!=null){
	        	 if (parentGroupId.equals(sysGroup.getId())) {  
	 	            map = new HashMap<String, Object>();  
	 	            //这里必须要将对象角色的id、name转换成ComboTree在页面的显示形式id、text  
	 	            //ComboTree,不是数据表格，没有在页面通过columns转换数据的属性  
	 	            map.put("id", list.get(i).getId());         //id  
	 	            map.put("text",list.get(i).getName());      //角色名  
	 	            map.put("children", createComboTreeChildren(list, sysGroup.getId()));  
	 	        }  
	        }else{
	        	 if (sysGroup.getParentId()==null || sysGroup.getParentId().equals("")) {  
	 	            map = new HashMap<String, Object>();  
	 	            //这里必须要将对象角色的id、name转换成ComboTree在页面的显示形式id、text  
	 	            //ComboTree,不是数据表格，没有在页面通过columns转换数据的属性  
	 	            map.put("id", list.get(i).getId());         //id  
	 	            map.put("text",list.get(i).getName());      //角色名  
	 	            map.put("children", createComboTreeChildren(list, sysGroup.getId()));  
	 	        }  
	        }
	       
	        if (map != null)  
	            comboTreeList.add(map);  
	    }  
	}  
	  
	  
	/** 
	 * 递归设置sysGroup树 
	 * @param list 
	 * @param fid 
	 * @return 
	 */  
	private List<Map<String, Object>> createComboTreeChildren(List<SysGroup> list, String fid) {  
	    List<Map<String, Object>> childList = new ArrayList<Map<String, Object>>();  
	    for (int j = 0; j < list.size(); j++) {  
	        Map<String, Object> map = null;  
	        SysGroup treeChild = (SysGroup) list.get(j);  
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
	
	public List<SysGroup> findSfsGroup(String groupId)
	{
		return dao.findSfsGroup(groupId);
	}
}
