  
    /**    
    * @Title: ProcessDetailService.java  
    * @Package com.rowell.sifa.service.flow  
    * @Description: TODO(用一句话描述该文件做什么)  
    * @author xiaoguang  
    * @date 2017年3月22日  
    * @version V1.0    
    */  
    
package com.rowell.sifa.service.flow;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rowell.sifa.common.utils.SysAccountUtils;
import com.rowell.sifa.mapper.flow.BehaviorManageMapper;
import com.rowell.sifa.pojo.flow.BehaviorManage;
import com.rowell.sifa.service.base.CrudService;


@Service
@Transactional(readOnly = true)
public class BehaviorManageService extends CrudService<BehaviorManageMapper, BehaviorManage> {
	@Autowired
	private BehaviorManageMapper behaviorManageMapper;
	@Transactional(readOnly = false)
	public void save(String processId,String checkId,String culpritId,Integer isEnd,String dicBehManTypeKey){
		
		BehaviorManage behaviorManage=new BehaviorManage();
		behaviorManage.setCulpritId(culpritId);
		behaviorManage.setCheckId(checkId);
		behaviorManage.setDicBehManTypeKey(dicBehManTypeKey);
		List<BehaviorManage> behaviorManageList=behaviorManageMapper.selectAll(behaviorManage);
		if(behaviorManageList!=null&&!behaviorManageList.isEmpty()&&behaviorManageList.get(0)!=null){
			behaviorManage=(BehaviorManage)behaviorManageList.get(0);
			behaviorManage.setProcessId(processId);
			behaviorManage.setIsEnd(isEnd);
			this.updateById(behaviorManage);
		}else{
			behaviorManage.setProcessId(processId);
			behaviorManage.setIsEnd(isEnd);
			behaviorManage.setCurrentSysUser(SysAccountUtils.getSysAccount());
			this.insert(behaviorManage);
		}
	}
}
